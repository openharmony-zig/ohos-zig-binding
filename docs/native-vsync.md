# Native VSync

`native_vsync.NativeVSync` owns one native VSync connection and supports both
process-level scheduling and API 14+ scheduling associated with a native-window
surface ID. One-shot requests allocate a small callback record so a late native
callback can safely observe that its owner was already destroyed and return.
Only one request may be in flight per connection; a second request returns
`error.RequestInFlight` instead of allowing the NDK to replace callback data.

The callback context is borrowed. Keep it alive until the callback has run or
`NativeVSync.deinit` has returned, and do not re-enter or deinitialize the same
VSync connection from its callback.

```zig
const std = @import("std");
const native_vsync = @import("native_vsync");

var vsync = try native_vsync.NativeVSync.createForAssociatedWindow(
    std.heap.c_allocator,
    surface_id,
    "renderer",
);
defer vsync.deinit();

try vsync.setExpectedFrameRateRange(.{
    .min = 30,
    .max = 120,
    .expected = 120,
});
try vsync.requestFrame(onFrame, renderer_context);
```

`createForAssociatedWindow` requires API 14. `setExpectedFrameRateRange`
requires API 20. The base connection, one-shot frame request, and period query
are available at the package's API 12 baseline.
