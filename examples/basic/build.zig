const std = @import("std");

const default_ohos_target: std.Target.Query = .{
    .cpu_arch = .aarch64,
    .os_tag = .linux,
    .abi = .ohos,
};

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{ .default_target = default_ohos_target });
    const optimize = b.standardOptimizeOption(.{});

    const ohos_binding = b.dependency("ohos_zig_binding", .{
        .target = target,
        .optimize = optimize,
    });

    const demo = b.addLibrary(.{
        .name = "ohos_binding_basic_demo",
        .linkage = .dynamic,
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/demo.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "hilog", .module = ohos_binding.module("hilog") },
                .{ .name = "ability_access_control", .module = ohos_binding.module("ability_access_control") },
            },
        }),
    });

    b.installArtifact(demo);
}
