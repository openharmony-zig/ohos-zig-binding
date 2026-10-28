#!/usr/bin/env python3
"""Audit Rust native calls and generate version-checked Zig entry points.

Only run against a reviewed reference checkout and the selected SDK. Generated
entry points preserve the C ABI (including ownership/error conventions); they
are complementary to the hand-written Zig owners, not automatic safe wrappers.
"""
import argparse
import json
import pathlib
import re
import subprocess

ROOT = pathlib.Path(__file__).resolve().parents[1]
ZIG = 'zig'
MODULE_NAMES = {'drawing': 'native_drawing', 'ime': 'input_method', 'vsync': 'native_vsync'}
ALIASES = {
    'OH_ResourceManager_GetMedia': 'OH_ResourceManager_GetMediaData',
    'OH_ResourceManager_GetMediaByName': 'OH_ResourceManager_GetMediaDataByName',
    'OH_ResourceManager_GetMediaBase64': 'OH_ResourceManager_GetMediaBase64Data',
    'OH_ResourceManager_GetMediaBase64ByName': 'OH_ResourceManager_GetMediaBase64DataByName',
    'OH_ResourceManager_GetDrawableDescriptor': 'OH_ResourceManager_GetDrawableDescriptorData',
    'OH_ResourceManager_GetDrawableDescriptorByName': 'OH_ResourceManager_GetDrawableDescriptorDataByName',
}
IDENT = r'\b(?:OH_[A-Za-z0-9_]+|OHOS_[A-Za-z0-9_]+|HMS_[A-Za-z0-9_]+)\b'


def strip_comments(text):
    # Preserve strings: dynamic native dispatch and interface lookup use names
    # in string literals. Comment markers inside strings are not comments.
    output, i = [], 0
    while i < len(text):
        if text.startswith('//', i):
            end = text.find('\n', i)
            if end == -1:
                break
            i = end
        elif text.startswith('/*', i):
            depth, end = 1, i + 2
            while depth and end < len(text):
                if text.startswith('/*', end):
                    depth += 1
                    end += 2
                elif text.startswith('*/', end):
                    depth -= 1
                    end += 2
                else:
                    end += 1
            output.append(' ')
            i = end
        else:
            raw_string = re.match(r'r(#+)?"', text[i:]) if text[i] == 'r' else None
            if raw_string:
                terminator = '"' + (raw_string[1] or '')
                end = text.find(terminator, i + raw_string.end())
                end = len(text) if end == -1 else end + len(terminator)
            elif text[i] == '"':
                end = i + 1
                while end < len(text):
                    if text[end] == '\\':
                        end += 2
                    elif text[end] == '"':
                        end += 1
                        break
                    else:
                        end += 1
            else:
                end = i + 1
            output.append(text[i:end])
            i = end
    return ''.join(output)


def parameters(declaration, name):
    start = declaration.index('(', declaration.index(name)) + 1
    depth, end = 1, start
    while depth:
        depth += (declaration[end] == '(') - (declaration[end] == ')')
        end += 1
    args = declaration[start:end - 1].strip()
    if args in ('', 'void'):
        return []
    result, depth, start = [], 0, 0
    for i, ch in enumerate(args):
        depth += (ch == '(') - (ch == ')')
        if ch == ',' and not depth:
            result.append(args[start:i].strip())
            start = i + 1
    result.append(args[start:].strip())
    return result


def headers(sdk):
    found = {}
    for path in sorted(sdk.rglob('*.h')):
        text = path.read_text(errors='replace')
        # SDK public declarations follow a Doxygen block. Do not parse mentions
        # in examples/comments as function declarations.
        for comment in re.finditer(r'/\*\*(.*?)\*/', text, re.S):
            doc = comment[1]
            match = re.match(r'\s*([^;{}]*?(' + IDENT + r')\s*\([^;{}]*?);', text[comment.end():comment.end() + 4096], re.S)
            if match is None:
                continue
            decl, name = match.groups()
            if 'typedef' in decl or '=' in decl.split(name)[0]:
                continue
            version = re.search(r'introduced\s*=\s*(\d+)', decl)
            if version is None:
                version = re.search(r'@since\s+(\d+)', doc)
            if version is None:
                continue
            value = {'header': str(path.relative_to(sdk)), 'api': int(version[1]),
                     'parameters': parameters(decl, name), 'return_type': decl[:decl.index(name)].strip()}
            # Prefer the lowest public introduction level for repeated decls.
            if name not in found or value['api'] < found[name]['api']:
                found[name] = value
    return found


def interfaces(sdk, references):
    wanted = set(re.findall(r'\b(?:ArkUI_Native\w+API_[0-9]+|ArkWeb_\w+API)\b', references))
    found = {}
    for path in sorted(sdk.rglob('*.h')):
        text = path.read_text(errors='replace')
        if not any(name in text for name in wanted):
            continue
        for match in re.finditer(r'typedef struct[^;{}]*\{(.*?)\}\s*(\w+)\s*;', text, re.S):
            body, name = match.groups()
            if name not in wanted:
                continue
            preceding = text[:match.start()].rsplit('/**', 1)[-1]
            since = re.search(r'@since\s+(\d+)', preceding)
            if since is None:
                raise ValueError(f'Missing introduction level for {name}')
            level = int(since[1])
            methods = []
            for comment in re.finditer(r'/\*\*(.*?)\*/', body, re.S):
                doc = comment[1]
                field = re.match(r'\s*[^;{}]*?\(\*(\w+)\)\s*\(([^;]*?)\);', body[comment.end():], re.S)
                if field is None:
                    continue
                method, args = field.groups()
                introduced = re.search(r'@since\s+(\d+)', doc)
                methods.append({'name': method, 'api': max(level, int(introduced[1]) if introduced else level),
                                'arity': len(parameters(f'{method}({args})', method))})
            module = 'arkui' if name.startswith('ArkUI_') else 'web'
            found.setdefault(module, {})[name] = {'api': level, 'methods': methods, 'header': str(path.relative_to(sdk))}
    if wanted - {name for tables in found.values() for name in tables}:
        raise ValueError('Unresolved native interface tables')
    return found


def render_interfaces(module, tables):
    lines = ['//! Generated typed dispatch for native interface tables.',
             '//! Returned handles and callback storage follow SDK ownership rules.',
             f'const raw = @import("{module}_sys");',
             'const api = @import("ohos_zig_binding_api");',
             'const Error = @import("ohos_zig_binding_ffi").Error;', '',
             'fn Method(comptime Table: type, comptime name: []const u8) type {',
             '    return @typeInfo(@typeInfo(@FieldType(Table, name)).optional.child).pointer.child;', '}',
             'fn Param(comptime Table: type, comptime name: []const u8, comptime index: usize) type {',
             '    return @typeInfo(Method(Table, name)).@"fn".param_types[index].?;', '}',
             'fn Return(comptime Table: type, comptime name: []const u8) type {',
             '    return @typeInfo(Method(Table, name)).@"fn".return_type.?;', '}', '']
    for name, info in tables.items():
        lines += [f'pub const {name} = struct {{', '    const Self = @This();', f'    const Table = raw.{name};',
                  '    table: *const Table,', '    pub fn load() Error!Self {']
        if info['api'] > 12:
            lines.append(f'        comptime api.require("{module}.interfaces.{name}", {info["api"]});')
        if module == 'arkui':
            kind = name.removeprefix('ArkUI_Native').split('API')[0].upper()
            lines.append(f'        const value = raw.OH_ArkUI_QueryModuleInterfaceByName(raw.ARKUI_NATIVE_{kind}, "{name}") orelse return error.UnexpectedNull;')
        else:
            kind = name.removeprefix('ArkWeb_').removesuffix('API').upper()
            lines.append(f'        const value = raw.OH_ArkWeb_GetNativeAPI(raw.ARKWEB_NATIVE_{kind}) orelse return error.UnexpectedNull;')
        lines += ['        return .{ .table = @ptrCast(@alignCast(value)) };', '    }']
        for method in info['methods']:
            field = method['name']
            params = ''.join(f', arg{i}: Param(Table, "{field}", {i})' for i in range(method['arity']))
            values = ', '.join(f'arg{i}' for i in range(method['arity']))
            lines += [f'    pub fn {field}(self: Self{params}) Error!Return(Table, "{field}") {{']
            if method['api'] > 12:
                lines.append(f'        comptime api.require("{module}.interfaces.{name}.{field}", {method["api"]});')
            if module == 'web':
                lines.append(f'        if (self.table.size < @offsetOf(Table, "{field}") + @sizeOf(@FieldType(Table, "{field}"))) return error.InvalidHandle;')
            lines += [f'        const function = self.table.{field} orelse return error.InvalidHandle;',
                      f'        return function({values});', '    }']
        lines += ['};', '']
    return '\n'.join(lines)


def render_native(name, entries):
    lines = ["//! Generated by tools/generate_native.py. Do not edit by hand.",
             "//! SDK-typed entry points with compile-time API checks. C ownership,",
             "//! pointer validity, callback lifetimes and error codes remain caller responsibilities.",
             f'const raw = @import("{name}_sys");',
             'const api = @import("ohos_zig_binding_api");', '',
             'fn Param(comptime function: anytype, comptime index: usize) type {',
             '    return @typeInfo(@TypeOf(function)).@"fn".param_types[index].?;', '}',
             'fn Return(comptime function: anytype) type {',
             '    return @typeInfo(@TypeOf(function)).@"fn".return_type.?;', '}', '']
    for entry in entries:
        symbol = entry['symbol']
        if entry['variadic']:
            raise ValueError(f'Cannot generate variadic forwarding: {symbol}')
        params = ', '.join(f'arg{i}: Param(raw.{symbol}, {i})' for i in range(entry['arity']))
        values = ', '.join(f'arg{i}' for i in range(entry['arity']))
        lines += [f"/// API {entry['api']}; <{entry['header']}>.",
                  f'pub fn {symbol}({params}) callconv(.c) Return(raw.{symbol}) {{']
        if entry['api'] > 12:
            lines.append(f'    comptime api.require("{name}.native.{symbol}", {entry["api"]});')
        lines += [f'    return raw.{symbol}({values});', '}', '']
    return '\n'.join(lines)


def write(path, content, check):
    if path.suffix == '.zig':
        content = subprocess.check_output([ZIG, 'fmt', '--stdin'], input=content, text=True)
    if check:
        if not path.exists() or path.read_text() != content:
            raise SystemExit(f'{path.relative_to(ROOT)} is stale; regenerate and review')
    else:
        path.write_text(content)


def render_artifacts(manifest, check):
    modules, owners, tables = manifest['modules'], manifest['owners'], manifest['interfaces']
    fixture = ['//! Generated compile/link coverage. NEVER execute this library.',
               'const options = @import("check_options");',
               'comptime {', '    @setEvalBranchQuota(100000);']
    for name, entries in modules.items():
        missing = {entry['symbol']: entry for entry in entries if not entry['wrapped']}
        print(f'{name}: {len(missing)} extensions for {len(entries)} referenced native functions')
        if not missing:
            continue
        generated = list(missing.values())
        directory = ROOT / 'src' / name
        write(directory / 'native.zig', render_native(name, generated), check)
        needed = sorted({entry['header'] for entry in generated})
        include = '// Generated by tools/generate_native.py.\n#pragma once\n\n'
        for header in needed:
            if header == 'ace/xcomponent/native_interface_xcomponent.h' and name != 'xcomponent':
                # This SDK header defines two external C constants. Give each
                # translated module its own names to prevent duplicate exports.
                for constant in ('OH_XCOMPONENT_ID_LEN_MAX', 'OH_MAX_TOUCH_POINTS_NUMBER'):
                    include += f'#define {constant} OHOS_ZIG_{name.upper()}_{constant}\n'
                include += f'#include <{header}>\n'
                for constant in ('OH_XCOMPONENT_ID_LEN_MAX', 'OH_MAX_TOUCH_POINTS_NUMBER'):
                    include += f'#undef {constant}\n'
            else:
                include += f'#include <{header}>\n'
        write(directory / 'native.h', include, check)
        for entry in generated:
            symbol = entry['symbol']
            condition = f'options.compile_check_api >= {entry["api"]}'
            if name == 'opengtx':
                condition += ' and options.compile_check_opengtx'
            fixture += [f'    if ({condition}) {{',
                        f'        @export(&@import("{name}").native.{symbol}, .{{ .name = "check_{name}_{symbol}" }});', '    }']
    fixture += ['}', '']
    for name, pairs in owners.items():
        lines = ['//! Generated resource owners. Do not copy acquired owners.',
                 '//! Stop callbacks and detach dependent objects before deinit.',
                 'const ffi = @import("ohos_zig_binding_ffi");',
                 'const api = @import("ohos_zig_binding_api");',
                 f'const raw = @import("{name}_sys");', '']
        for owner, info in pairs.items():
            lines.append(f'pub const {owner} = ffi.Resource(raw.{info["create"]}, raw.{info["release"]}, api, "{name}.owned.{owner}", {info["api"]});')
            params = ', '.join(f'arg{i}: @typeInfo(@TypeOf(@import("{name}").raw.{info["create"]})).@"fn".param_types[{i}].?' for i in range(info['arity']))
            values = ', '.join(f'arg{i}' for i in range(info['arity']))
            fixture += [f'fn owned_{name}_{owner}({params}) callconv(.c) void {{',
                        f'    var value = @import("{name}").owned.{owner}.create(.{{{values}}}) catch return;',
                        '    _ = value.ptr() catch return;',
                        '    value.deinit() catch {};', '}',
                        f'comptime {{ if (options.compile_check_api >= {info["api"]}) @export(&owned_{name}_{owner}, .{{ .name = "check_owned_{name}_{owner}" }}); }}', '']
        write(ROOT / 'src' / name / 'owned.zig', '\n'.join(lines) + '\n', check)

    for module, table_set in tables.items():
        write(ROOT / 'src' / module / 'interfaces.zig', render_interfaces(module, table_set), check)
        for name, info in table_set.items():
            fixture += [f'fn load_{name}() callconv(.c) void {{',
                        f'    _ = @import("{module}").interfaces.{name}.load() catch return;', '}',
                        f'comptime {{ if (options.compile_check_api >= {info["api"]}) @export(&load_{name}, .{{ .name = "check_load_{name}" }}); }}', '']
            for method in info['methods']:
                field = method['name']
                fn_type = f'@typeInfo(@typeInfo(@FieldType(@import("{module}").raw.{name}, "{field}")).optional.child).pointer.child'
                params = ''.join(f', arg{i}: @typeInfo({fn_type}).@"fn".param_types[{i}].?' for i in range(method['arity']))
                values = ', '.join(f'arg{i}' for i in range(method['arity']))
                fixture += [f'fn table_{name}_{field}(table: *const @import("{module}").raw.{name}{params}) callconv(.c) void {{',
                            f'    const value = @import("{module}").interfaces.{name}{{ .table = table }};',
                            f'    _ = value.{field}({values}) catch return;', '}',
                            f'comptime {{ if (options.compile_check_api >= {method["api"]}) @export(&table_{name}_{field}, .{{ .name = "check_table_{name}_{field}" }}); }}', '']
    write(ROOT / 'tests/native_compile_usage.zig', '\n'.join(fixture), check)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--zig', default='zig', help='OpenHarmony-patched Zig 0.17 executable')
    parser.add_argument('--reference', type=pathlib.Path)
    parser.add_argument('--sdk', type=pathlib.Path, help='native SDK directory')
    parser.add_argument('--check', action='store_true')
    parser.add_argument('--verify', action='store_true', help='Verify generated files from the committed manifest, without the reference checkout or SDK')
    parser.add_argument('--hms-sdk', type=pathlib.Path)
    args = parser.parse_args()
    global ZIG
    ZIG = args.zig
    if args.verify:
        manifest = json.loads((ROOT / 'tools/native-coverage.json').read_text())
        if manifest['unresolved_calls']:
            raise SystemExit('Manifest contains unresolved calls')
        render_artifacts(manifest, True)
        return
    if args.reference is None or args.sdk is None:
        parser.error('--reference and --sdk are required unless --verify is used')
    metadata = headers(args.sdk / 'sysroot/usr/include')
    if args.hms_sdk:
        metadata.update(headers(args.hms_sdk / 'sysroot/usr/include'))
    modules, unknown = {}, set()
    all_references = []
    for crate in sorted((args.reference / 'crates').iterdir()):
        if not crate.is_dir() or crate.name == 'enum_derive':
            continue
        name = MODULE_NAMES.get(crate.name, crate.name)
        directory = ROOT / 'src' / name
        if not directory.is_dir():
            raise SystemExit(f'Reference module {crate.name} has no Zig module {name}')
        rust = '\n'.join(strip_comments(p.read_text()) for p in sorted((crate / 'src').rglob('*.rs')))
        all_references.append(rust)
        references = set(re.findall(IDENT, rust)) & metadata.keys()
        called = set(re.findall('(' + IDENT + r')\s*\(', rust))
        unknown.update(called - metadata.keys())
        implementation = '\n'.join(p.read_text() for p in directory.iterdir()
                                   if p.suffix in ('.zig', '.cpp') and p.name not in ('native.zig', 'owned.zig', 'interfaces.zig'))
        existing = set(re.findall(IDENT, implementation))
        entries = []
        for original in sorted(references):
            symbol = ALIASES.get(original, original)
            info = metadata[symbol]
            entries.append({'reference': original, 'symbol': symbol,
                            'api': info['api'], 'header': info['header'],
                            'arity': len(info['parameters']),
                            'returns_pointer': '*' in info['return_type'],
                            'output_last': bool(info['parameters']) and '**' in info['parameters'][-1].replace(' ', ''),
                            'variadic': '...' in info['parameters'],
                            'wrapped': original in existing or symbol in existing})
        modules[name] = entries
    if unknown:
        raise SystemExit('Unresolved native calls: ' + ', '.join(sorted(unknown)))
    owners = {}
    for name, entries in modules.items():
        by_symbol = {entry['symbol']: entry for entry in entries}
        pairs = {}
        for symbol, entry in by_symbol.items():
            for suffix, destructor in [('_Create', '_Destroy'), ('_Create', '_Release'), ('_Create', '_Dispose'), ('Create', 'Destroy')]:
                if suffix == 'Create' and symbol.endswith('_Create'):
                    continue
                if not symbol.endswith(suffix):
                    continue
                release = symbol.removesuffix(suffix) + destructor
                if release not in by_symbol or by_symbol[release]['arity'] != 1:
                    continue
                if by_symbol[release]['returns_pointer']:
                    continue
                if entry['wrapped'] and by_symbol[release]['wrapped']:
                    continue
                if not entry['returns_pointer'] and not entry['output_last']:
                    continue
                owner_name = symbol.removeprefix('OH_').removeprefix('ArkUI_').removeprefix('Drawing_').removesuffix(suffix)
                pairs[owner_name] = {'create': symbol, 'release': release,
                                     'api': max(entry['api'], by_symbol[release]['api']),
                                     'arity': entry['arity'] - (0 if entry['returns_pointer'] else 1)}
        if pairs:
            owners[name] = dict(sorted(pairs.items()))
    tables = interfaces(args.sdk / 'sysroot/usr/include', '\n'.join(all_references))
    revision = subprocess.check_output(['git', '-C', str(args.reference), 'rev-parse', 'HEAD'], text=True).strip()
    manifest = {'reference_revision': revision, 'sdk_version': json.loads((args.sdk / 'oh-uni-package.json').read_text())['version'],
                'modules': modules, 'interfaces': tables, 'owners': owners, 'unresolved_calls': sorted(unknown)}
    path = ROOT / 'tools/native-coverage.json'
    content = json.dumps(manifest, indent=2) + '\n'
    if args.check:
        if path.read_text() != content:
            raise SystemExit('native-coverage.json is stale; regenerate and review the changes')
    else:
        path.write_text(content)
    render_artifacts(manifest, args.check)
    print('All referenced native calls resolved.')


if __name__ == '__main__':
    main()
