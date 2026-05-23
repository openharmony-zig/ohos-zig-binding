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

## Steps

### 1. Create module source

`src/foo/ffi.h`:

```c
#include <path/to/ndk_header.h>
```

`src/foo/foo.zig`:

```zig
const foo_sys = @import("foo_sys");

pub fn doSomething(value: i32) bool {
    return foo_sys.OH_Foo_DoSomething(value);
}
```

### 2. Register build config

Add an entry to `src/build/modules.zig`:

```zig
.{
    .name = "foo",
    .root_source_file = "src/foo/foo.zig",
    .header = "src/foo/ffi.h",
    .sys_import = "foo_sys",
    .system_library = "foo_ndk.z",
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

## Checklist

- [ ] `src/<module>/ffi.h` and `src/<module>/<module>.zig`
- [ ] Register binding metadata in `src/build/modules.zig`
- [ ] `zig build` passes with NDK configured
