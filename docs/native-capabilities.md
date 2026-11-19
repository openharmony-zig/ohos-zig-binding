# Native capability coverage

The reference is `ohos-native-bindings` at
`b4c41ec850fe4d04cfc75a70fd4af5f8f3d59273`. The audit spans all 34 binding
modules, including optional HMS OpenGTX. It resolves 1,986 module/function
references against OpenHarmony SDK `26.0.0.105` and the HMS SDK. There are no
unresolved native calls in that reference.

The extension adds 1,540 SDK-typed functions, 60 resource owner types and 95
methods across seven ArkUI/ArkWeb API tables. This is coverage of native
capabilities used by the Rust implementation. Rust-specific component DSLs,
builder syntax, automatic `Drop`, collection adapters and callback closures
are not source-compatible Zig APIs. Native calls and table methods preserve
C return codes and pointer/callback lifetime requirements.

## Entry points

Each affected module exports `native` for additional SDK functions. Names,
parameter types and return types match the SDK, with compile-time API guards.
For example, `camera.native.OH_CaptureSession_SetFocusMode` exposes the focus
operation without requiring the caller to bypass version checks through `raw`.
The existing hand-written methods remain the preferred entry points for
operations they already wrap. `raw` still provides unguarded SDK declarations.

Modules with additional constructor/destructor pairs also export `owned`.
Constructors receive a tuple of native input parameters and hide the final
handle output parameter when present. They reject null results and translate
native error statuses. `ptr()` borrows the handle; `deinit()` releases it once,
and leaves the handle available for retry if the release reports an error.
Do not copy owners. Detach objects, finish pending work and stop callbacks
before destruction, as required by their SDK contracts.

```zig
const drawing = @import("native_drawing");

pub fn makePath() !void {
    var path = try drawing.owned.Path.create(.{});
    defer path.deinit() catch {}; // Report teardown errors in production.
    drawing.native.OH_Drawing_PathMoveTo(try path.ptr(), 0, 0);
    drawing.native.OH_Drawing_PathLineTo(try path.ptr(), 100, 100);
    drawing.native.OH_Drawing_PathClose(try path.ptr());
}
```

The new drawing functions use the SDK's `OH_Drawing_*` pointer types. Existing
bridge-based drawing owners continue to use `OH_OhosZig_*` pointer types; use
objects from one API family consistently rather than copying owners across them.

`arkui.interfaces` provides `ArkUI_NativeNodeAPI_1`,
`ArkUI_NativeDialogAPI_1`, `ArkUI_NativeAnimateAPI_1`,
`ArkUI_NativeGestureAPI_1` and `ArkUI_NativeGestureAPI_2`.
`web.interfaces` provides `ArkWeb_ControllerAPI` and `ArkWeb_ComponentAPI`.
Call `load()` to obtain a table view, then call methods with the SDK arguments.
Missing table/function pointers return errors; Web dispatch also checks the
runtime table size **before** reading a member. A successful Zig call returns
the native result, whose error code or nullable handle still needs checking.

```zig
const arkui = @import("arkui");

pub fn createGesture() !void {
    const gestures = try arkui.interfaces.ArkUI_NativeGestureAPI_1.load();
    const tap = (try gestures.createTapGesture(1, 1)) orelse
        return error.UnexpectedNull;
    defer gestures.dispose(tap) catch {};
    // Set callbacks and attach to a node; detach before this scope ends.
}
```

## Additional workflow adapters

- `udmf.Data.records()` / `record()` return borrowed record views with checked
  indexing. `RecordView` provides owned plain-text, HTML, hyperlink and PixelMap
  result containers. It intentionally has no `deinit`: the parent data owns its
  records, as confirmed by the [OpenHarmony implementation](https://github.com/openharmony/distributeddatamgr_udmf/blob/master/framework/ndkimpl/data/udmf.cpp).
- `Data.primaryPlainText()`, `primaryHtml()` and `isLocal()` complete the API 13
  clipboard read path. `PixelMap` shares the public `image_native.Pixelmap` type,
  and `TypeDescriptor` covers UTD creation, equality and type relationships.
- `resource_manager.ResourceManager` adds media Base64 by name and owned drawable
  descriptors by ID/name. `RawFile.descriptor()` returns an owner containing the
  descriptor, offset and length; release it before closing the raw file/manager.
- The registry links `image_common`, `picture` and `image_packer` for the native
  image extensions, and `ace_ndk.z` for drawable disposal. These dependencies
  propagate to applications importing the corresponding module.

## Module audit

“Existing” means a reference is implemented by a hand-written adapter or its
C++ bridge. “Extension” means a generated, API-checked native entry point.
Counts describe native references, not the number of Rust public methods.
Modules with zero extension entries already had their native calls covered.
Stable kernel/libc calls in `ashmem` and system-capability lookup in `init` are
outside the `OH_`/`OHOS_`/`HMS_` symbol audit; their existing adapters are retained.

| Module | Native references | Existing | Extension | New owners |
| --- | ---: | ---: | ---: | ---: |
| `ability_access_control` | 1 | 1 | 0 | 0 |
| `accessibility` | 57 | 24 | 33 | 0 |
| `arkui` | 746 | 3 | 743 | 33 |
| `arkui_input` | 91 | 24 | 67 | 0 |
| `ashmem` | 0 | 0 | 0 | 0 |
| `asset` | 5 | 5 | 0 | 0 |
| `bundle` | 5 | 5 | 0 | 0 |
| `camera` | 98 | 23 | 75 | 0 |
| `display` | 16 | 16 | 0 | 0 |
| `native_drawing` | 236 | 28 | 208 | 12 |
| `fileshare` | 6 | 6 | 0 | 0 |
| `fileuri` | 5 | 5 | 0 | 0 |
| `hilog` | 2 | 2 | 0 | 0 |
| `huks` | 13 | 13 | 0 | 0 |
| `image` | 59 | 13 | 46 | 0 |
| `image_native` | 229 | 36 | 193 | 9 |
| `input_method` | 44 | 24 | 20 | 3 |
| `init` | 0 | 0 | 0 | 0 |
| `jsvm` | 113 | 24 | 89 | 0 |
| `native_buffer` | 7 | 7 | 0 | 0 |
| `native_display_soloist` | 5 | 5 | 0 | 0 |
| `native_window` | 7 | 7 | 0 | 0 |
| `net_connection` | 22 | 13 | 9 | 0 |
| `net_stack` | 22 | 15 | 7 | 0 |
| `opengtx` | 8 | 8 | 0 | 0 |
| `pasteboard` | 7 | 7 | 0 | 0 |
| `qos` | 7 | 7 | 0 | 0 |
| `resource_manager` | 29 | 21 | 8 | 0 |
| `sensor` | 25 | 24 | 1 | 0 |
| `udmf` | 42 | 35 | 7 | 3 |
| `vibrator` | 3 | 3 | 0 | 0 |
| `native_vsync` | 6 | 5 | 1 | 0 |
| `web` | 51 | 19 | 32 | 0 |
| `xcomponent` | 19 | 18 | 1 | 0 |

The exact symbol, header, introduction level, alias mapping, owner pairs and
interface methods are recorded in [tools/native-coverage.json](../tools/native-coverage.json).
The six resource-manager C++ overload names use their C-compatible `*Data*`
variants. The ArkUI translation renames two header-defined XComponent constants
to prevent duplicate C exports when both modules are imported.

## Regeneration and verification

Generated files are committed; applications do not need Python or the Rust
checkout. Regenerate only against a reviewed reference and SDK, then inspect
the manifest and build all affected targets:

```sh
python3 tools/generate_native.py \
  --reference ../ohos-native-bindings \
  --sdk "$OHOS_NDK_HOME" \
  --hms-sdk "$HMS_NDK_HOME"
```

Pass native SDK directories (containing `sysroot/`), and use `--zig /path/to/zig`
if the patched Zig 0.17.0 is not on PATH. `--check` performs a fresh source/SDK
audit without writing files. Unresolved direct native calls fail the audit.
Without either SDK or the reference checkout, verify committed outputs with:

```sh
python3 tools/generate_native.py --verify
python3 -m unittest discover -s tools -p test_generate_native.py
python3 tools/test_bindings.py
zig build -Dtarget=aarch64-linux-ohos -Dapi=12 -Doptimize=safe
zig build -Dtarget=aarch64-linux-ohos -Dapi=26 -Doptimize=safe
```

`tests/native_compile_usage.zig` exports every generated function at its
permitted API level, invokes every generated owner constructor/destructor and
compiles every interface-table method. The existing check library links with
`-z defs`, so missing symbols fail verification. The library is disposable and
**must never be executed**. Host tests inject constructor, destructor, borrowed
record and undersized interface-table failures; API guard tests verify rejection
at API 12 and acceptance at API 15.

Local verification on 2026-10-27: all six full builds passed across aarch64,
arm and x86_64 at API 12/26 in `safe`, with XComponent N-API enabled and HMS
OpenGTX enabled for API 26. Thirteen Zig host tests, six Python generator tests,
and API guard acceptance/rejection checks passed. The basic addon also built
for all three architectures at API 12 in `safe`. This verifies types, symbols
and selected failure paths; device behavior still needs application-level tests.
