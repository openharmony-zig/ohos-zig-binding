# Module coverage and ownership

The additions follow the published Rust wrappers and header/library configuration
in [ohos-native-bindings](https://github.com/ohos-rs/ohos-native-bindings) at
`b4c41ec850fe4d04cfc75a70fd4af5f8f3d59273`. All 25 previously missing
OpenHarmony wrapper modules and the HMS OpenGTX module now have Zig adapters.
Together with the original eight modules, the registry exports 33 OpenHarmony
modules and one optional HMS module. The Rust-only `enum_derive` helper has no
native Zig counterpart.

The adapters cover the workflows below. They do not reproduce every Rust builder,
ArkUI component DSL, or convenience method. Each new module exports `raw`, and
its `<module>_sys` build module exposes translated SDK declarations for additional
operations. Raw APIs bypass wrapper version guards and ownership checks.

| Module | Wrapped workflows | Lifetime / minimum API |
| --- | --- | --- |
| `init` | System capability queries | API 12 baseline |
| `bundle` | Application information and identifiers, main element, device type | Owned strings; main element 13, device type 14 |
| `qos` | Thread QoS, Gewu request sessions | Gewu 20; callback state outlives requests |
| `vibrator` | Timed/custom vibration, cancellation | Caller retains custom file descriptor |
| `fileuri` | Paths, URIs, parent URI and file names | Allocator-owned results; file name 13 |
| `fileshare` | Persist/revoke/activate/deactivate policies, permission checks | Owned results preserve partial error status |
| `display` | Default display metrics, cutouts, change/fold listeners | Destroy cutouts and unregister listeners |
| `native_display_soloist` | Frame rate range, start/stop callbacks | Serialize control; stop before callback state is freed |
| `native_buffer` | Allocation, retained references, CPU mapping | Clone explicitly; synchronize GPU access; unmap before release |
| `asset` | Attribute construction, add/update/remove/query and challenges | Release result sets and pre-query challenges |
| `huks` | Parameter sets, key generation/import/export/delete, streaming operations | Alias borrowed; sessions finish/abort explicitly |
| `udmf` | Data, records, text, HTML, hyperlinks, persistence | Owned objects; getters borrow data; record count 13 |
| `pasteboard` | Get/set data, type/source queries and clear | API 13; returned data is the public `udmf.Data` type |
| `resource_manager` | Raw directories/files, media/base64 resources | Manager outlives files; copied media uses caller allocator |
| `sensor` | Discovery, metadata, event data and subscriptions | Events borrowed; callbacks survive successful unsubscribe |
| `net_connection` | Network queries, socket binding, DNS, change registrations | DNS owns results; callback storage outlives registration |
| `net_stack` | Certificate validation, host certificates, WebSocket, HTTP | HTTP 20; explicit request/response/header teardown |
| `camera` | Device lists, capabilities, inputs, preview/photo outputs, sessions | Manager outlives lists; attached inputs/outputs outlive session |
| `image` | N-API pixelmap transforms, image components and source decoding | N-API objects/environment outlive native views |
| `image_native` | Decode options/sources, pixelmaps, packing, receivers and frames | Encoded data/fds outlive source; receiver outlives acquired images |
| `jsvm` | Initialization, VMs, scopes, evaluation, values and strong references | Thread confined; scopes close in reverse order |
| `arkui` | Nodes, properties, events, content attachment and dialogs | UI thread; detach/unregister before disposal |
| `arkui_input` | Pointer/history snapshots, input metadata, interception, key lists | Event borrowed during callback; key lists 14 |
| `accessibility` | Element properties/actions, events, provider registration/dispatch | API 13; provider borrowed; async event lives until completion |
| `web` | Controller scripts, scheme handlers, request views and responses | UI thread; explicitly clear registrations before disposal |
| `opengtx` | Configuration, activation and frame/scene/network reporting | HMS API 12; optional build feature |

Use OpenHarmony 7.0 / API 26 SDK headers even when targeting the API 12 wrapper
baseline. Calls introduced later are guarded by `comptime api.require`; select
them with compile-time conditions when building for multiple API levels.
System capabilities, application permissions, thread requirements and device
support still apply at runtime.

The legacy image adapter uses API 10+ MDK headers. The deprecated API 8
`image_pixel_map_napi.h` contains unguarded C++ namespaces and is intentionally
excluded from its C translation. WebSocket and legacy pixelmap headers receive
forward typedefs to make their SDK declarations valid C. No SDK files are patched.

## Ownership conventions

Owners must not be copied after acquisition. Pass them by value only as borrowed
arguments to methods, and arrange one `deinit` call for the actual owner. A Zig
struct does not enforce affine ownership or parent/child lifetimes. `fromOwned`
transfers responsibility; `fromRaw`/`borrowed` views do not acquire references.
`NativeBuffer.clone` is an explicit reference-counted exception.

Methods accepting an allocator return caller-owned copies unless documented
otherwise. Slices from native result objects, event data, image components and
resource names borrow their parent. Do not retain them after teardown.

For callbacks, use the SDK C calling convention and keep callbacks and state alive
until unregister/stop completes. Async response/event data must survive completion.
The compile fixtures intentionally only verify types and linkage; they are not
runnable lifecycle examples and must never be loaded or called on a device.

`web.clearHandlers` clears all schemes for one Web component. Coordinate this at
the component owner. Borrowed Web request/resource-handler views do not destroy
callback objects; the application must release those with the SDK raw functions
when the request contract permits it. Accessibility API 13 provider registration
has no matching unregister function; callback storage must survive the component
or a deliberate replacement.

## HMS OpenGTX example

Configure both SDK roots, enable `.opengtx = true` on the package dependency and
import `dependency.module("opengtx")` into the application module. All strings in
this example have static lifetime:

```zig
const gtx = @import("opengtx");

pub fn renderSession() !void {
    var context = try gtx.Context.create(onTemperature);
    defer context.deinit() catch {}; // Production code should report teardown errors.
    try context.configure(.{
        .package_name = "org.example.game",
        .app_version = "1.0.0",
        .max_resolution = .{ .width = 1920, .height = 1080 },
        .target_fps = 60,
    });
    try context.activate();
    try context.scene(gtx.raw.PLAYING, "level-1", .{
        .min = 30, .max = 60, .recommended = 60,
    }, .{ .width = 1920, .height = 1080 });
    // Report frame/network information while the game runs.
    try context.deactivate();
}

fn onTemperature(level: gtx.raw.OpenGTX_TempLevel) callconv(.c) void {
    _ = level;
    // Forward to application state without destroying the context here.
}
```

## Verification

The root build compiles every enabled module and links representative method
calls from `tests/compile_usage.zig`. The fixture shared library uses `-z defs`,
so missing native symbols fail the build. It is neither installed nor executed.
`zig build check` runs this representative compile/link check directly.

CI uses Zig 0.17.0 and OpenHarmony 7.0 headers for all three targets
(`aarch64-linux-ohos`, `arm-linux-ohoseabi`, `x86_64-linux-ohos`), API 12/26,
and `debug`/`safe`, including XComponent N-API and the basic addon example.
HMS is optional and requires separately supplied SDK files; the local validation
also checks OpenGTX against HMS libraries for each architecture.

Host tests check bounded integer conversions and native error handling, plus
OpenGTX stop-before-destroy ordering, idempotent teardown and retry behavior on
native stop/destroy failures. These failure-injection tests do not need an HMS SDK.
Build verification does not replace app/device tests for permissions, graphics,
callbacks, JavaScript execution or HMS service availability.

Local verification on 2026-10-09 used the OpenHarmony-patched Zig `0.17.0`,
OpenHarmony native SDK `26.0.0.105` and the HMS native SDK supplied with
DevEco Studio. All 18 final matrix jobs passed: for each architecture, API 12
`debug`/`safe`, API 26 with HMS `debug`/`safe`, API 26 with HMS and XComponent
N-API in `fast`, and the basic addon in API 12 `safe`. Five host tests passed;
API guard acceptance/rejection and the missing-HMS diagnostic were also checked.
