# Adding a New Module

## Prerequisites

- Zig **0.16.0** or later
- OpenHarmony NDK configured (see [editor-setup.md](editor-setup.md))

## Project Layout

```
src/
├── build/
│   ├── modules.zig          # binding registry
│   ├── ndk.zig              # OpenHarmony NDK paths/link settings
│   └── binding-build.zig    # package build entry
└── <module_name>/
    ├── ffi.h                 # C header entry point
    └── <module>.zig          # Zig wrapper (@import("<module>_sys"))
```

Sys bindings are **not** committed. `src/build/modules.zig` creates `<module>_sys` via `addTranslateC` at build time and attaches the required OpenHarmony system library to the wrapper module.

Use `ffi.h` for the local C entry point instead of mirroring the NDK header name. For example, do not create `src/hilog/log.h` that includes `<hilog/log.h>`, because C/C++ indexers may resolve the include back to the local file and report a self-include.

The build system exposes the selected OpenHarmony API level to Zig wrappers through `ohos_zig_binding_api`. The effective API level is resolved from `addModules(..., .{ .api = level })`, then `-Dapi=<level>`, then the binding registry item's `default_api`, then the package default `12`. Keep `ffi.h` as a simple system-header entry point; API compatibility is enforced in the Zig wrapper layer.

## Steps

### 1. Create module source

`src/foo/ffi.h`:

```c
#pragma once

#include <path/to/ndk_header.h>
```

`src/foo/foo.zig`:

```zig
const foo_sys = @import("foo_sys");
pub fn doSomething(value: i32) bool {
    return foo_sys.OH_Foo_DoSomething(value);
}
```

API 12 is the wrapper baseline. APIs introduced in 12 or lower do not need a guard.

For APIs introduced after 12, keep the public declaration as a normal Zig function and put the guard at the top:

```zig
const foo_sys = @import("foo_sys");
const api = @import("ohos_zig_binding_api");

pub fn doSomethingNew(value: i32) bool {
    comptime api.require("foo.doSomethingNew", 13);
    return foo_sys.OH_Foo_DoSomethingNew(value);
}
```

With this pattern, API 12 builds can still import the wrapper module and editors can show the real function signature. Calling a higher-API wrapper fails at compile time with a message that includes the required API level and the API level selected for the build. Do not add public `supports_*` declarations for normal wrappers; the selected build API controls which calls are valid.

For a type introduced by a newer API, put the guard inside the `struct` body:

```zig
pub const DoSomethingOptions = struct {
    comptime {
        api.require("foo.DoSomethingOptions", 13);
    }

    timeout_ms: u32 = 0,
    retry: bool = false,
};
```

The module can still be imported on lower API builds, and ZLS can still show fields and methods. Instantiating or otherwise using the struct on a lower API build fails at compile time. If only one method on an otherwise old struct requires a newer API, put the same `comptime api.require(...)` at the top of that method body instead of guarding the whole type.

### 2. Register build config

Add an entry to `src/build/modules.zig`:

```zig
.{
    .name = "foo",
    .root_source_file = "src/foo/foo.zig",
    .header = "src/foo/ffi.h",
    .sys_import = "foo_sys",
    .system_library = "foo_ndk.z",
    .default_api = 12,
},
```

### 3. Update `README.md`

## Config Interface

| Field | Responsibility |
|-------|----------------|
| `name` | Exported module name |
| `root_source_file` | Public Zig wrapper module |
| `header` | C header used by `addTranslateC` |
| `sys_import` | Import name used by the wrapper module |
| `system_library` | OpenHarmony system library linked transitively through the module graph |
| `default_api` | Default API level used by wrapper guards when the caller does not pass `.api` or `-Dapi` |

## Checklist

- [ ] `src/<module>/ffi.h` and `src/<module>/<module>.zig`
- [ ] Local C header is not named the same as the NDK header it includes
- [ ] `ffi.h` includes the system header without local API gating
- [ ] Wrapper APIs introduced in 12 or lower do not use `api.require`
- [ ] Wrapper APIs introduced after 12 call `comptime api.require("module.method", api_level)` at the top
- [ ] Binding registry entry sets `default_api` when the module should not rely only on `-Dapi`
- [ ] Register binding metadata in `src/build/modules.zig`
- [ ] `zig build` passes with NDK configured
