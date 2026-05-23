const std = @import("std");
const ndk = @import("ndk.zig");

const Binding = struct {
    name: []const u8,
    root_source_file: []const u8,
    header: []const u8,
    sys_import: []const u8,
    system_library: []const u8,
};

pub const items = [_]Binding{
    .{
        .name = "hilog",
        .root_source_file = "src/hilog/log.zig",
        .header = "src/hilog/ffi.h",
        .sys_import = "hilog_sys",
        .system_library = "hilog_ndk.z",
    },
    .{
        .name = "ability_access_control",
        .root_source_file = "src/ability_access_control/ability_access_control.zig",
        .header = "src/ability_access_control/ffi.h",
        .sys_import = "ability_access_control_sys",
        .system_library = "ability_access_control",
    },
};

pub fn addAll(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
) !void {
    for (items) |binding| {
        try addModule(b, target, optimize, binding);
    }
}

fn addModule(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
    binding: Binding,
) !void {
    const sys = try translateHeader(b, target, optimize, binding.sys_import, binding.header);
    const imports = [_]std.Build.Module.Import{
        .{ .name = binding.sys_import, .module = sys },
    };

    const public = b.addModule(binding.name, .{
        .root_source_file = b.path(binding.root_source_file),
        .target = target,
        .optimize = optimize,
        .imports = &imports,
    });
    try ndk.configureModuleLink(b, public, target.result, binding.system_library);
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
