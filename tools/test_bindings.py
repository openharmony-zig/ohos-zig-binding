#!/usr/bin/env python3
"""Run native wrapper failure-path tests on the host; no OHOS SDK required."""
import argparse
import pathlib
import subprocess

ROOT = pathlib.Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--zig', default='zig')
    args = parser.parse_args()
    suites = [
        ['test', 'src/support/ffi.zig', '-lc'],
        ['test', '--dep', 'opengtx', '--dep', 'opengtx_sys', '-Mroot=tests/opengtx_test.zig',
         '--dep', 'opengtx_sys', '--dep', 'ohos_zig_binding_ffi', '-Mopengtx=src/opengtx/opengtx.zig',
         '-Mopengtx_sys=tests/mocks/opengtx.zig', '-Mohos_zig_binding_ffi=src/support/ffi.zig', '-lc'],
        ['test', '--dep', 'ffi', '-Mroot=tests/resource_test.zig', '-Mffi=src/support/ffi.zig', '-lc'],
        ['test', '--dep', 'udmf', '-Mroot=tests/udmf_test.zig', '--dep', 'udmf_sys',
         '--dep', 'ohos_zig_binding_api', '--dep', 'ohos_zig_binding_ffi', '-Mudmf=src/udmf/udmf.zig',
         '-Mudmf_sys=tests/mocks/udmf.zig', '-Mohos_zig_binding_api=tests/mocks/api.zig',
         '-Mohos_zig_binding_ffi=src/support/ffi.zig', '-lc'],
        ['test', '--dep', 'interfaces', '--dep', 'web_sys', '-Mroot=tests/interfaces_test.zig',
         '--dep', 'web_sys', '--dep', 'ohos_zig_binding_api', '--dep', 'ohos_zig_binding_ffi',
         '-Minterfaces=src/web/interfaces.zig', '-Mweb_sys=tests/mocks/web_interfaces.zig',
         '-Mohos_zig_binding_api=tests/mocks/api.zig', '-Mohos_zig_binding_ffi=src/support/ffi.zig', '-lc'],
    ]
    for command in suites:
        subprocess.run([args.zig, *command], cwd=ROOT, check=True)
    for api in (12, 15):
        command = [args.zig, 'build-obj', '-fno-emit-bin', '--dep', 'native', '-Mroot=tests/api_guard.zig',
                   '--dep', 'arkui_input_sys', '--dep', 'ohos_zig_binding_api', '-Mnative=src/arkui_input/native.zig',
                   '-Markui_input_sys=tests/mocks/api_guard_input.zig', '--dep', 'ohos_zig_binding_options',
                   '-Mohos_zig_binding_api=src/support/api.zig', f'-Mohos_zig_binding_options=tests/api_{api}.zig']
        result = subprocess.run(command, cwd=ROOT, capture_output=True, text=True)
        if api == 12:
            if result.returncode == 0 or 'requires OpenHarmony API 15' not in result.stderr:
                raise SystemExit('API 12 guard rejection failed:\n' + result.stderr)
        elif result.returncode != 0:
            raise SystemExit('API 15 guard acceptance failed:\n' + result.stderr)
    print('API guard acceptance/rejection passed.')


if __name__ == '__main__':
    main()
