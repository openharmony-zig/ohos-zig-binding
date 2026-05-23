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
    .@"ohos_zig_binding" = .{
        .path = "../ohos-zig-binding",
    },
},
```

In `build.zig`:

```zig
const std = @import("std");
const napi_build = @import("zig-napi").napi_build;

pub fn build(b: *std.Build) !void {
    const optimize = b.standardOptimizeOption(.{});

    const result = try napi_build.nativeAddonBuild(b, .{
        .name = "hello",
        .root_module_options = .{
            .root_source_file = b.path("src/hello.zig"),
        },
    });

    if (result.arm64) |arm64| {
        const ohos_binding = b.dependency("ohos_zig_binding", .{
            .target = arm64.root_module.resolved_target.?,
            .optimize = optimize,
        });
        arm64.root_module.addImport("hilog", ohos_binding.module("hilog"));
        arm64.root_module.addImport("ability_access_control", ohos_binding.module("ability_access_control"));
    }
    // repeat for arm / x64 as needed
}
```

In application code:

```zig
const hilog = @import("hilog");
const ability_access_control = @import("ability_access_control");

pub fn main() void {
    hilog.info("hello from zig");
    _ = ability_access_control.checkSelfPermission("ohos.permission.INTERNET");
}
```

## Environment

Configure the OpenHarmony NDK via environment variables (see [docs/editor-setup.md](docs/editor-setup.md)):

- `OHOS_NDK_HOME` — native SDK directory, for example `/path/to/ohos-sdk/native`
- `OHOS_SDK_HOME` — SDK root, used by `zig build` as a fallback

VSCode/Zed C header indexing uses `OHOS_NDK_HOME`; set it to the native SDK directory before opening the editor.

## Demo

`examples/basic` is a small standalone package that imports `hilog` and `ability_access_control` from this package and builds an OpenHarmony shared library:

```sh
cd examples/basic
zig build -Dtarget=aarch64-linux-ohos -Doptimize=ReleaseSafe
```

The output is installed under `examples/basic/zig-out/lib/`.


## LICENSE

[MIT](./LICENSE)