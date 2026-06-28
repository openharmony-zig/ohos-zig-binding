const std = @import("std");

pub const binding_build = @import("src/build/binding-build.zig");

const default_ohos_target: std.Target.Query = .{
    .cpu_arch = .aarch64,
    .os_tag = .linux,
    .abi = .ohos,
};

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{ .default_target = default_ohos_target });
    const optimize = b.standardOptimizeOption(.{});
    const api = binding_build.apiOption(b) orelse binding_build.default_api;
    try binding_build.addModules(b, target, optimize, .{ .api = api });
}
