const std = @import("std");

fn getEnvVarOptional(build: *std.Build, name: []const u8) ?[]const u8 {
    return build.graph.environ_map.get(name);
}

fn nativeFromSdkRoot(build: *std.Build, sdk_root: []const u8) ![]const u8 {
    if (isValidNativeRoot(build, sdk_root)) return build.dupePath(sdk_root);
    return build.pathJoin(&.{ sdk_root, "native" });
}

fn isValidNativeRoot(build: *std.Build, native_root: []const u8) bool {
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
