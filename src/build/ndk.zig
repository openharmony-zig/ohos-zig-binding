const std = @import("std");

fn getEnvVarOptional(build: *std.Build, name: []const u8) ?[]const u8 {
    // SDK overrides, including previously unset ones, must invalidate Zig 0.17's
    // cached build configuration.
    build.graph.poisonCache();
    return build.graph.environ_map.get(name);
}

fn nativeFromSdkRoot(build: *std.Build, sdk_root: []const u8) ![]const u8 {
    if (isValidNativeRoot(build, sdk_root)) return build.dupePath(sdk_root);
    return build.pathJoin(&.{ sdk_root, "native" });
}

fn isValidNativeRoot(build: *std.Build, native_root: []const u8) bool {
    build.graph.poisonCache();
    const include = std.fs.path.join(build.allocator, &.{ native_root, "sysroot", "usr", "include" }) catch return false;
    defer build.allocator.free(include);
    std.Io.Dir.cwd().access(build.graph.io, include, .{}) catch return false;
    return true;
}

fn resolveNdkPath(build: *std.Build) ![]const u8 {
    if (getEnvVarOptional(build, "OHOS_NDK_HOME")) |sdk_root| {
        const native = try nativeFromSdkRoot(build, sdk_root);
        if (isValidNativeRoot(build, native)) return native;
    }

    if (getEnvVarOptional(build, "OHOS_SDK_HOME")) |sdk_root| {
        const native = try nativeFromSdkRoot(build, sdk_root);
        if (isValidNativeRoot(build, native)) return native;
    }

    return "";
}

fn platformDir(target: std.Target) []const u8 {
    return switch (target.cpu.arch) {
        .aarch64 => "aarch64-linux-ohos",
        .arm => "arm-linux-ohos",
        .x86_64 => "x86_64-linux-ohos",
        else => "aarch64-linux-ohos",
    };
}

fn requireNdkPath(build: *std.Build) ![]const u8 {
    const native = try resolveNdkPath(build);
    if (native.len == 0) {
        std.log.err(
            \\OpenHarmony NDK is not configured.
            \\Set OHOS_NDK_HOME to the native SDK directory, or set OHOS_SDK_HOME to the SDK root.
        , .{});
        return error.OhosNdkNotConfigured;
    }
    return native;
}

fn ndkIncludePaths(build: *std.Build, target: std.Target) !struct {
    basic: []const u8,
    platform: []const u8,
} {
    const root_path = try requireNdkPath(build);
    const basic = try std.fs.path.join(build.allocator, &.{ root_path, "sysroot", "usr", "include" });
    const platform = try std.fs.path.join(build.allocator, &.{ basic, platformDir(target) });

    return .{ .basic = basic, .platform = platform };
}

fn ndkLibraryPaths(build: *std.Build, target: std.Target) !struct {
    basic: []const u8,
    platform: []const u8,
} {
    const root_path = try requireNdkPath(build);
    const basic = try std.fs.path.join(build.allocator, &.{ root_path, "sysroot", "usr", "lib" });
    const platform = try std.fs.path.join(build.allocator, &.{ basic, platformDir(target) });

    return .{ .basic = basic, .platform = platform };
}

fn addLibraryPaths(
    build: *std.Build,
    module: *std.Build.Module,
    target: std.Target,
) !void {
    const paths = try ndkLibraryPaths(build, target);
    module.addLibraryPath(.{ .cwd_relative = paths.basic });
    module.addLibraryPath(.{ .cwd_relative = paths.platform });
}

/// Attach NDK library search paths and a system library to a module.
pub fn configureModuleLink(
    build: *std.Build,
    module: *std.Build.Module,
    target: std.Target,
    library_name: []const u8,
) !void {
    try addLibraryPaths(build, module, target);
    module.linkSystemLibrary(library_name, .{ .use_pkg_config = .no });
}

/// Configure a translate-c step for OpenHarmony C headers.
pub fn configureTranslateC(
    build: *std.Build,
    translate_c: *std.Build.Step.TranslateC,
    target: std.Target,
) !void {
    const paths = try ndkIncludePaths(build, target);
    translate_c.addSystemIncludePath(.{ .cwd_relative = paths.basic });
    translate_c.addSystemIncludePath(.{ .cwd_relative = paths.platform });
}

/// Configure a module that contains a C++ bridge for an OpenHarmony header
/// which cannot be consumed by translate-c.
pub fn configureCppBridge(
    build: *std.Build,
    module: *std.Build.Module,
    target: std.Target,
) !void {
    const paths = try ndkIncludePaths(build, target);
    module.addSystemIncludePath(.{ .cwd_relative = paths.basic });
    module.addSystemIncludePath(.{ .cwd_relative = paths.platform });
    module.linkSystemLibrary("c++", .{ .use_pkg_config = .no });
}

fn requireHmsNdkPath(build: *std.Build) ![]const u8 {
    for ([_][]const u8{ "HMS_NDK_HOME", "HMS_SDK_HOME" }) |name| {
        if (getEnvVarOptional(build, name)) |root| {
            const native = try nativeFromSdkRoot(build, root);
            const header = build.pathJoin(&.{ native, "sysroot", "usr", "include", "graphics_game_sdk", "opengtx_base.h" });
            std.Io.Dir.cwd().access(build.graph.io, header, .{}) catch continue;
            return native;
        }
    }
    std.log.err("OpenGTX requires HMS_NDK_HOME (native SDK) or HMS_SDK_HOME (HMS SDK root).", .{});
    return error.HmsNdkNotConfigured;
}

pub fn configureHmsTranslateC(build: *std.Build, translate: *std.Build.Step.TranslateC) !void {
    const root = try requireHmsNdkPath(build);
    translate.addSystemIncludePath(.{ .cwd_relative = build.pathJoin(&.{ root, "sysroot", "usr", "include" }) });
}

pub fn configureHmsModuleLink(build: *std.Build, module: *std.Build.Module, target: std.Target, library: []const u8) !void {
    const root = try requireHmsNdkPath(build);
    module.addLibraryPath(.{ .cwd_relative = build.pathJoin(&.{ root, "sysroot", "usr", "lib", platformDir(target) }) });
    module.linkSystemLibrary(library, .{ .use_pkg_config = .no });
}
