# ohos binding for zig

OpenHarmony native bindings for Zig, exported as build-system modules (Zig 0.17.0).

Use the OpenHarmony-patched [Zig 0.17.0 toolchain](https://github.com/openharmony-zig/zig-patch/releases/tag/0.17.0),
as in zig-napi. Put it on `PATH` and verify that `zig version` prints `0.17.0`.
The stock Zig distribution does not provide the required OpenHarmony target support.

C bindings are created at build time via `addTranslateC`; the generated sys modules and required system libraries are wired through the Zig module graph.

See [docs/adding-modules.md](docs/adding-modules.md) for how to add a new binding module.

See [docs/editor-setup.md](docs/editor-setup.md) to configure the OpenHarmony SDK for IDE support.

## Modules

| Module | Description |
|--------|-------------|
| `init` | System capability queries |
| `bundle` | Owned application info, app identifiers, and main element names |
| `qos` | Thread QoS and API 20 Gewu sessions |
| `vibrator` | Timed/custom vibration and cancellation |
| `fileuri` | Checked path/URI conversion with allocator-owned results |
| `fileshare` | Persistent file permission policies and owned per-policy errors |
| `display` | Display metrics, cutouts, and listener ownership |
| `native_display_soloist` | Frame scheduling with explicit callback teardown |
| `native_buffer` | Reference-counted buffers and checked CPU mappings |
| `ashmem` | Owned ashmem descriptors, safe create/attach/map/unmap, and checked byte access |
| `hilog` | HiLog logging binding |
| `ability_access_control` | Ability access control (permission check) binding |
| `native_window` | Referenced native-window handle and safe request/map/flush buffer flow |
| `native_vsync` | Owned VSync connections, surface association, and safe one-shot callbacks |
| `native_drawing` | Native Drawing canvas, bitmap, font, and text helpers |
| `input_method` | Native input-method editor session wrapper |
| `xcomponent` | Native XComponent initialization, geometry, event data, and callbacks |

The `native_window` and `xcomponent` wrappers follow the public range and
single-instance callback limitations of `ohos-native-bindings`. See
[native-window and XComponent](docs/native-window-xcomponent.md) for the exact
scope and lifecycle rules.

## Usage

Add as a dependency in `build.zig.zon`:

```zig
.dependencies = .{
    .@"zig-napi" = .{
        .url = "https://github.com/openharmony-zig/zig-napi/archive/1667e3e2ee770d2dd7e565a610b870907bf12a7e.tar.gz",
        .hash = "zig_napi-0.1.0-H6OwaxJhEABrP0eCKzd6HNpryI2K84tMksWYz4s9L3YU",
    },
    .@"ohos_zig_binding" = .{
        .path = "../ohos-zig-binding",
    },
},
```

In `build.zig`:

```zig
const std = @import("std");
const napi_build = @import("zig-napi").napi_build;
const ohos_binding_build = @import("ohos_zig_binding").binding_build;

pub fn build(b: *std.Build) !void {
    const optimize = b.standardOptimizeOption(.{});
    const api = ohos_binding_build.apiOption(b) orelse ohos_binding_build.default_api;

    const result = try napi_build.nativeAddonBuild(b, .{
        .name = "hello",
        .root_module_options = .{
            .root_source_file = b.path("src/hello.zig"),
            .optimize = optimize,
        },
    });

    if (result.arm64) |arm64| {
        const napi = b.dependency("zig-napi", .{
            .target = arm64.root_module.resolved_target.?,
            .optimize = optimize,
        }).module("napi");
        arm64.root_module.addImport("napi", napi);
        const ohos_binding = b.dependency("ohos_zig_binding", .{
            .target = arm64.root_module.resolved_target.?,
            .optimize = optimize,
            .api = api,
            // Optional: use zig-napi Env/Object in xcomponent.XComponent.init.
            .xcomponent_napi = true,
        });
        arm64.root_module.addImport("hilog", ohos_binding.module("hilog"));
        arm64.root_module.addImport("ashmem", ohos_binding.module("ashmem"));
        arm64.root_module.addImport("ability_access_control", ohos_binding.module("ability_access_control"));
        arm64.root_module.addImport("native_window", ohos_binding.module("native_window"));
        arm64.root_module.addImport("native_vsync", ohos_binding.module("native_vsync"));
        arm64.root_module.addImport("xcomponent", ohos_binding.module("xcomponent"));
    }
    // repeat for arm / x64 as needed
}
```

`xcomponent_napi` is a build-function feature switch. It defaults to `false`,
so applications that only use `XComponent.fromRaw` do not import zig-napi into
XComponent or link `ace_napi.z`. Set it to `true` in the `b.dependency` call above when the
application already uses zig-napi.

Use the same zig-napi dependency revision, target, and optimization mode in the
application and bindings. Zig 0.17 translates N-API headers for each target;
sharing that module also keeps `xcomponent.Env` and `xcomponent.Object` identical
to the application's types. See `examples/basic/build.zig` for the complete setup.

With the feature enabled, initialize the non-owning wrapper directly from
zig-napi's environment and exports definitions:

```zig
const napi = @import("napi");
const xcomponent = @import("xcomponent");

pub fn initXComponent(env: napi.Env, exports: napi.Object) !void {
    const component = try xcomponent.XComponent.init(env, exports);
    try component.registerCallbacks(.{
        .on_surface_created = onSurfaceCreated,
    });
}

fn onSurfaceCreated(
    context: ?*anyopaque,
    component: xcomponent.XComponentRaw,
    window: xcomponent.WindowRaw,
) void {
    _ = context;
    _ = component;

    // Acquire an owning window reference if the handle must escape this callback.
    _ = window;
}
```

In application code:

```zig
const std = @import("std");
const napi = @import("napi");
const ashmem = @import("ashmem");
const hilog = @import("hilog");
const ability_access_control = @import("ability_access_control");

pub fn init_demo() bool {
    hilog.info("hello from zig");
    hilog.warnf("formatted value: {d}", .{42});

    const logger = hilog.Hilog.init(.{ .domain = 0x0000, .tag = "my-tag" });
    logger.err("message with custom tag");

    if (hilog.forwardStdioToHilog()) |handle| {
        handle.detach();
        std.debug.print("std.debug.print is redirected to hilog\n", .{});
    } else |_| {}

    return ability_access_control.checkSelfPermission("ohos.permission.INTERNET");
}

pub fn createSharedRegion() !ashmem.Ashmem {
    var region = try ashmem.Ashmem.create("demo-state", 4096);
    errdefer region.deinit();
    try region.mapReadWrite();
    try region.write(0, "ready");
    return region;
}

comptime {
    napi.NODE_API_MODULE("hello", @This());
}
```

## Environment

Configure the OpenHarmony NDK via environment variables (see [docs/editor-setup.md](docs/editor-setup.md)).
Pass `-Dapi=<level>` to control the OpenHarmony API level used by Zig wrapper guards. You can also set `.api = 12` directly in `build.zig`; the module registry default is `12`.

To lock the binding API level in `build.zig`, pass a literal instead of the command-line value:

```zig
const ohos_binding = b.dependency("ohos_zig_binding", .{
    .target = root_module.resolved_target.?,
    .optimize = optimize,
    .api = 12,
});
```

API 12 is the wrapper baseline. Wrapper APIs introduced in 12 or lower do not need guards. Wrapper functions that require a newer OpenHarmony API start with a compile-time guard in the Zig adapter. For example, if the binding is built with `-Dapi=12`, calling `hilog.setMinLogLevel` fails at compile time because that API was introduced in 15. The public wrapper does not expose separate `supports_*` checks; select the API level in the build and keep higher-API calls in code that is only compiled for that level.

`ashmem` uses the stable `/dev/ashmem` ABI available at the API 12 baseline. `Ashmem.attach(fd)` duplicates descriptors received through ArkTS `Want` parameters, and the wrapper never supplies cross-process synchronization; build an immutable-frame or double-buffered protocol above it.

- `OHOS_NDK_HOME` — native SDK directory, for example `/path/to/ohos-sdk/native`
- `OHOS_SDK_HOME` — SDK root, used by `zig build` as a fallback

VSCode/Zed C header indexing uses `OHOS_NDK_HOME`; set it to the native SDK directory before opening the editor.

## Demo

`examples/basic` is a small standalone N-API addon that imports `hilog` and `ability_access_control` from this package and exposes them through `zig-napi`:

```sh
cd examples/basic
zig build -Dtarget=aarch64-linux-ohos -Doptimize=safe -Dapi=12
```

The native addon is installed under `examples/basic/zig-out/`, and the generated TypeScript declarations are written to `examples/basic/index.d.ts`.

Zig 0.17 optimization modes are `debug`, `safe`, `fast`, and `small`.
The supported targets are `aarch64-linux-ohos`, `arm-linux-ohoseabi`, and
`x86_64-linux-ohos`. To compile all bindings, including the optional N-API
integration, run from the repository root:

```sh
zig build -Dtarget=aarch64-linux-ohos -Doptimize=safe -Dapi=12 -Dxcomponent_napi=true --summary all
```

The root build and the example's XComponent check compile cross-target test
artifacts; they do not execute on the build host. Run the addon on an OpenHarmony
device or emulator to exercise platform APIs.


## LICENSE

[MIT](./LICENSE)
