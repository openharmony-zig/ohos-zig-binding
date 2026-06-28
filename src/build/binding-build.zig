const std = @import("std");

const registry = @import("modules.zig");

pub const default_api = registry.default_api;

pub const AddModulesOptions = struct {
    /// OpenHarmony API level used by Zig wrapper export guards.
    /// When null, `-Dapi=<level>` is used if present, then the module default.
    api: ?u32 = null,
};

const api_option_description = "OpenHarmony API level used by Zig wrapper export guards";

pub fn apiOption(b: *std.Build) ?u32 {
    return b.option(u32, "api", api_option_description);
}

pub fn addModules(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
    options: AddModulesOptions,
) !void {
    const command_line_api = if (options.api == null) apiOption(b) else null;
    try registry.addAll(b, target, optimize, .{
        .api = options.api orelse command_line_api,
    });
}
