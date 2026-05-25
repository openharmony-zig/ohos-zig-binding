const std = @import("std");
const ndk = @import("ndk.zig");

pub const default_api: u32 = 12;

const Binding = struct {
    name: []const u8,
    root_source_file: []const u8,
    header: []const u8,
    sys_import: []const u8,
    system_library: []const u8,
    default_api: ?u32 = null,
};

pub const AddAllOptions = struct {
    api: ?u32 = null,
};

pub const items = [_]Binding{
    .{
        .name = "hilog",
        .root_source_file = "src/hilog/log.zig",
        .header = "src/hilog/ffi.h",
        .sys_import = "hilog_sys",
        .system_library = "hilog_ndk.z",
        .default_api = 12,
    },
    .{
        .name = "ability_access_control",
        .root_source_file = "src/ability_access_control/ability_access_control.zig",
        .header = "src/ability_access_control/ffi.h",
        .sys_import = "ability_access_control_sys",
        .system_library = "ability_access_control",
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
    for (items) |binding| {
        try addModule(b, target, optimize, api_support, binding);
    }
}

fn addModule(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
    api_support: *std.Build.Module,
    binding: Binding,
) !void {
    const sys = try translateHeader(b, target, optimize, binding.sys_import, binding.header);
    const imports = [_]std.Build.Module.Import{
        .{ .name = binding.sys_import, .module = sys },
        .{ .name = "ohos_zig_binding_api", .module = api_support },
    };

    const public = b.addModule(binding.name, .{
        .root_source_file = b.path(binding.root_source_file),
        .target = target,
        .optimize = optimize,
        .imports = &imports,
    });
    try ndk.configureModuleLink(b, public, target.result, binding.system_library);
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
