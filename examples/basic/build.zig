const std = @import("std");
const napi_build = @import("zig-napi").napi_build;
const ohos_binding_build = @import("ohos_zig_binding").binding_build;

const default_ohos_target: std.Target.Query = .{
    .cpu_arch = .aarch64,
    .os_tag = .linux,
    .abi = .ohos,
};

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{ .default_target = default_ohos_target });
    const optimize = b.standardOptimizeOption(.{});
    const api = ohos_binding_build.apiOption(b) orelse ohos_binding_build.default_api;

    const zig_napi = b.dependency("zig-napi", .{});
    const napi = zig_napi.module("napi");

    const result = try napi_build.nativeAddonBuild(b, .{
        .name = "ohos_binding_basic_demo",
        .root_module_options = .{
            .root_source_file = b.path("src/demo.zig"),
            .target = target,
            .optimize = optimize,
        },
    });

    if (result.arm64) |arm64| {
        addImports(b, optimize, api, arm64.root_module, napi);
    }
    if (result.arm) |arm| {
        addImports(b, optimize, api, arm.root_module, napi);
    }
    if (result.x64) |x64| {
        addImports(b, optimize, api, x64.root_module, napi);
    }

    const dts = try napi_build.generateTypeDefinition(b, .{
        .root_source_file = b.path("src/demo.zig"),
        .output = b.path("index.d.ts"),
        .napi_module = napi,
    });
    b.getInstallStep().dependOn(&dts.step);
}

fn addImports(
    b: *std.Build,
    optimize: std.builtin.OptimizeMode,
    api: u32,
    root_module: *std.Build.Module,
    napi: *std.Build.Module,
) void {
    const ohos_binding = b.dependency("ohos_zig_binding", .{
        .target = root_module.resolved_target.?,
        .optimize = optimize,
        .api = api,
    });

    root_module.addImport("napi", napi);
    root_module.addImport("hilog", ohos_binding.module("hilog"));
    root_module.addImport("ability_access_control", ohos_binding.module("ability_access_control"));
}
