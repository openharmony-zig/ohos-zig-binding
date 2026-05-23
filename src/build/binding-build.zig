const std = @import("std");

const registry = @import("modules.zig");

pub fn addModules(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
) !void {
    try registry.addAll(b, target, optimize);
}
