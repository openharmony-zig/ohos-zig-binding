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
    const opengtx = binding_build.opengtxOption(b) orelse false;
    const xcomponent_napi = binding_build.xcomponentNapiOption(b) orelse false;
    try binding_build.addModules(b, target, optimize, .{
        .api = api,
        .opengtx = opengtx,
        .xcomponent_napi = xcomponent_napi,
    });

    // Force real method bodies and native symbols through compilation/linking.
    // This library is never installed or executed: calls may need UI/device state.
    const usage = b.createModule(.{
        .root_source_file = b.path("tests/compile_usage.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });
    var modules = b.modules.iterator();
    while (modules.next()) |module| usage.addImport(module.key_ptr.*, module.value_ptr.*);
    const options = b.addOptions();
    options.addOption(u32, "compile_check_api", api);
    options.addOption(bool, "compile_check_opengtx", opengtx);
    usage.addOptions("check_options", options);
    const compile_check = b.addLibrary(.{
        .name = "bindings-compile-check",
        .linkage = .dynamic,
        .root_module = usage,
        .use_llvm = true,
    });
    compile_check.link_z_defs = true;
    _ = compile_check.getEmittedBin();
    b.step("check", "Compile and link representative native API usage").dependOn(&compile_check.step);
    b.getInstallStep().dependOn(&compile_check.step);
}
