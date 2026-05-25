# ohos binding for zig

OpenHarmony native bindings for Zig, exported as build-system modules (Zig 0.16+).

C bindings are created at build time via `addTranslateC`; the generated sys modules and required system libraries are wired through the Zig module graph.

See [docs/adding-modules.md](docs/adding-modules.md) for how to add a new binding module.

See [docs/editor-setup.md](docs/editor-setup.md) to configure the OpenHarmony SDK for IDE support.

## Modules

| Module | Description |
|--------|-------------|
| `hilog` | HiLog logging binding |
| `ability_access_control` | Ability access control (permission check) binding |

## Usage

Add as a dependency in `build.zig.zon`:

```zig
.dependencies = .{
    .@"zig-napi" = .{
        .url = "https://github.com/openharmony-zig/zig-napi/archive/refs/tags/0.1.0.tar.gz",
        .hash = "zig_napi-0.1.0-H6Owa7sDBgBLhd-ooFFJIqt3CAGATY4sIYHopmSYkRDP",
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

    const zig_napi = b.dependency("zig-napi", .{});
    const napi = zig_napi.module("napi");

    const result = try napi_build.nativeAddonBuild(b, .{
        .name = "hello",
        .root_module_options = .{
            .root_source_file = b.path("src/hello.zig"),
        },
    });

    if (result.arm64) |arm64| {
        arm64.root_module.addImport("napi", napi);
        const ohos_binding = b.dependency("ohos_zig_binding", .{
            .target = arm64.root_module.resolved_target.?,
            .optimize = optimize,
            .api = api,
        });
        arm64.root_module.addImport("hilog", ohos_binding.module("hilog"));
        arm64.root_module.addImport("ability_access_control", ohos_binding.module("ability_access_control"));
    }
    // repeat for arm / x64 as needed
}
```

In application code:

```zig
const std = @import("std");
const napi = @import("napi");
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

- `OHOS_NDK_HOME` — native SDK directory, for example `/path/to/ohos-sdk/native`
- `OHOS_SDK_HOME` — SDK root, used by `zig build` as a fallback

VSCode/Zed C header indexing uses `OHOS_NDK_HOME`; set it to the native SDK directory before opening the editor.

## Demo

`examples/basic` is a small standalone N-API addon that imports `hilog` and `ability_access_control` from this package and exposes them through `zig-napi`:

```sh
cd examples/basic
zig build -Dtarget=aarch64-linux-ohos -Doptimize=ReleaseSafe -Dapi=12
```

The native addon is installed under `examples/basic/zig-out/`, and the generated TypeScript declarations are written to `examples/basic/index.d.ts`.


## LICENSE

[MIT](./LICENSE)
