const std = @import("std");
const ndk = @import("ndk.zig");

pub const default_api: u32 = 12;

const Binding = struct {
    name: []const u8,
    root_source_file: []const u8,
    header: []const u8,
    sys_import: []const u8,
    system_libraries: []const []const u8,
    cpp_bridge_sources: []const []const u8 = &.{},
    supports_napi: bool = false,
    default_api: ?u32 = null,
};

pub const AddAllOptions = struct {
    api: ?u32 = null,
    xcomponent_napi: bool = false,
};

pub const items = [_]Binding{
    .{
        .name = "ashmem",
        .root_source_file = "src/ashmem/ashmem.zig",
        .header = "src/ashmem/ffi.h",
        .sys_import = "ashmem_sys",
        .system_libraries = &.{},
        .default_api = 12,
    },
    .{
        .name = "hilog",
        .root_source_file = "src/hilog/log.zig",
        .header = "src/hilog/ffi.h",
        .sys_import = "hilog_sys",
        .system_libraries = &.{"hilog_ndk.z"},
        .default_api = 12,
    },
    .{
        .name = "ability_access_control",
        .root_source_file = "src/ability_access_control/ability_access_control.zig",
        .header = "src/ability_access_control/ffi.h",
        .sys_import = "ability_access_control_sys",
        .system_libraries = &.{"ability_access_control"},
        .default_api = 12,
    },
    .{
        .name = "native_window",
        .root_source_file = "src/native_window/native_window.zig",
        .header = "src/native_window/ffi.h",
        .sys_import = "native_window_sys",
        .system_libraries = &.{ "native_window", "native_buffer" },
        .default_api = 12,
    },
    .{
        .name = "native_drawing",
        .root_source_file = "src/native_drawing/native_drawing.zig",
        .header = "src/native_drawing/ffi.h",
        .sys_import = "native_drawing_sys",
        .system_libraries = &.{"native_drawing"},
        .cpp_bridge_sources = &.{"src/native_drawing/native_drawing_bridge.cpp"},
        .default_api = 12,
    },
    .{
        .name = "input_method",
        .root_source_file = "src/input_method/input_method.zig",
        .header = "src/input_method/ffi.h",
        .sys_import = "input_method_sys",
        .system_libraries = &.{"ohinputmethod"},
        .default_api = 12,
    },
    .{
        .name = "xcomponent",
        .root_source_file = "src/xcomponent/xcomponent.zig",
        .header = "src/xcomponent/ffi.h",
        .sys_import = "xcomponent_sys",
        .system_libraries = &.{"ace_ndk.z"},
        .supports_napi = true,
        .default_api = 12,
    },
};

pub fn addAll(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
    options: AddAllOptions,
) !void {
    const api = effectiveApi(options);
    const api_support = addApiSupportModule(b, target, optimize, api);
    const feature_support = addFeatureSupportModule(
        b,
        target,
        optimize,
        options.xcomponent_napi,
    );
    const napi_module = if (options.xcomponent_napi)
        b.dependency("zig-napi", .{}).module("napi")
    else
        null;

    for (items) |binding| {
        try addModule(
            b,
            target,
            optimize,
            api_support,
            feature_support,
            napi_module,
            options.xcomponent_napi,
            binding,
        );
    }
}

fn addModule(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
    api_support: *std.Build.Module,
    feature_support: *std.Build.Module,
    napi_module: ?*std.Build.Module,
    xcomponent_napi: bool,
    binding: Binding,
) !void {
    const sys = try translateHeader(b, target, optimize, binding.sys_import, binding.header);
    const imports = [_]std.Build.Module.Import{
        .{ .name = binding.sys_import, .module = sys },
        .{ .name = "ohos_zig_binding_api", .module = api_support },
        .{ .name = "ohos_zig_binding_features", .module = feature_support },
    };

    const public = b.addModule(binding.name, .{
        .root_source_file = b.path(binding.root_source_file),
        .target = target,
        .optimize = optimize,
        .imports = &imports,
    });
    for (binding.system_libraries) |library| {
        try ndk.configureModuleLink(b, public, target.result, library);
    }
    if (binding.cpp_bridge_sources.len != 0) {
        public.addCSourceFiles(.{
            .files = binding.cpp_bridge_sources,
            .flags = &.{"-std=c++17"},
            .language = .cpp,
        });
        try ndk.configureCppBridge(b, public, target.result);
    }
    if (binding.supports_napi and xcomponent_napi) {
        public.addImport("xcomponent_napi", napi_module.?);
        try ndk.configureModuleLink(b, public, target.result, "ace_napi.z");
    }

    const check = b.addTest(.{
        .name = b.fmt("{s}-check", .{binding.name}),
        .root_module = public,
    });
    b.getInstallStep().dependOn(&check.step);
}

fn addFeatureSupportModule(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
    xcomponent_napi: bool,
) *std.Build.Module {
    const feature_options = b.addOptions();
    feature_options.addOption(bool, "xcomponent_napi", xcomponent_napi);

    return b.createModule(.{
        .root_source_file = feature_options.getOutput(),
        .target = target,
        .optimize = optimize,
    });
}

fn addApiSupportModule(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
    api: u32,
) *std.Build.Module {
    const api_options = b.addOptions();
    api_options.addOption(u32, "api", api);

    const api_support = b.createModule(.{
        .root_source_file = b.path("src/support/api.zig"),
        .target = target,
        .optimize = optimize,
    });
    api_support.addOptions("ohos_zig_binding_options", api_options);
    return api_support;
}

fn effectiveApi(options: AddAllOptions) u32 {
    return options.api orelse registryDefaultApi();
}

fn registryDefaultApi() u32 {
    inline for (items) |binding| {
        return binding.default_api orelse default_api;
    }
    return default_api;
}

fn translateHeader(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
    name: []const u8,
    header: []const u8,
) !*std.Build.Module {
    const translate = b.addTranslateC(.{
        .root_source_file = b.path(header),
        .target = target,
        .optimize = optimize,
    });
    try ndk.configureTranslateC(b, translate, target.result);
    return translate.addModule(name);
}
