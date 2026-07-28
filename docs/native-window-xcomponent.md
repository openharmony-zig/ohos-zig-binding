# Native Window and XComponent

These modules follow the safe-wrapper range of the sibling
`ohos-native-bindings` project rather than exposing every function present in
the latest NDK headers. The generated C modules remain available as each
module's public `raw` declaration when an application deliberately needs a
lower-level API.

## Native Window

`native_window.NativeWindow` covers:

- acquiring and releasing a native-window reference;
- setting buffer geometry;
- requesting a buffer and waiting up to three seconds for its release fence;
- converting the window buffer to `OH_NativeBuffer`, mapping it for CPU writes,
  and validating its geometry;
- flushing the full buffer or one dirty rectangle, and aborting a dequeued
  buffer.

The wrapper has the same packed-buffer limitation as the reference binding.
`NativeBufferFormat.bytesPerPixel` is suitable for its direct pixel-writing
flow, but it is not a complete image-plane model for every YUV format. Use the
raw native-buffer plane APIs when format-aware multi-planar access is required.

`NativeWindowBuffer` borrows a stable `*NativeWindow`. Keep the window alive
until the buffer is flushed or aborted. Prefer an explicit `try buffer.flush()`
when the native submission status matters. `defer buffer.deinit()` provides
reference-style automatic flushing but cannot report an error.

Zig structs are copyable, so ownership is a caller-side invariant: do not
bit-copy `NativeWindow` or an active `NativeWindowBuffer`. Create another
window owner with `clone`, and finish each dequeued buffer exactly once.

```zig
const native_window = @import("native_window");

var window = try native_window.NativeWindow.cloneFromPtr(window_ptr);
defer window.deinit();

try window.setBufferGeometry(640, 480);
var buffer = try window.requestBuffer(null);
errdefer buffer.abort() catch {};

for (buffer.bytes()) |*byte| byte.* = 0;
try buffer.flush();
```

`Operation.set_desired_present_timestamp` is an API 13 operation. Calling
`intoI32` for that value requires a binding built with API 13 or newer.

## XComponent

`xcomponent.XComponent` is a non-owning wrapper. It covers:

- optional initialization from zig-napi `Env` and `Object`;
- ID, surface size, surface offset, current callback window, and expected frame
  rate;
- surface lifecycle, touch, mouse, hover, key, frame, and axis UI-input events;
- the typed event records and complete key-code range exposed by the reference
  binding;
- direct native registration functions for applications that own their
  callback dispatcher.

Managed `Callbacks` intentionally preserve the reference binding's default
single-mode behavior: one component can be registered per thread. Callbacks
must be delivered on the thread where registration occurred. Registering a
different component on that thread returns
`error.MultiComponentCallbacksUnsupported`. Multi-instance applications must
use `registerNativeCallback`, `registerNativeMouseEventCallback`, and the other
raw registration methods with their own stable registry. The NDK retains the
native callback-struct pointers, so those structs must remain at stable
addresses for the full callback lifetime.

Only axis events are registered through the managed UI-input callback, matching
the reference binding. A callback cannot return a Zig error across the C ABI;
native event-decoding failures are delivered through `Callbacks.on_error`.

`MouseAction.cancel` is named only when the binding API is 18 or newer. The
underlying non-exhaustive enum can still represent an unknown raw action on
lower API builds.

### Optional zig-napi integration

The N-API adapter is disabled by default. Enable it through the dependency
function call in the application's `build.zig`:

```zig
const ohos_binding = b.dependency("ohos_zig_binding", .{
    .target = target,
    .optimize = optimize,
    .api = api,
    .xcomponent_napi = true,
});

root_module.addImport("xcomponent", ohos_binding.module("xcomponent"));
```

This feature imports zig-napi lazily, links `ace_napi.z`, and makes
`XComponent.init` accept zig-napi's exact `Env` and `Object` types. Omitting
the option, or passing `.xcomponent_napi = false`, keeps the core raw-handle
and callback APIs available without N-API.
