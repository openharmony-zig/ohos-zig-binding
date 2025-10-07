const std = @import("std");

const napi_build = @import("zig-napi").napi_build;

/// Re-export binding-build.zig
pub const bindingBuild = @import("src/build/binding-build.zig");

pub fn build(b: *std.Build) !void {
    const ndkPath = try napi_build.resolveNdkPath(b);
    const basicCHeaderDir = try std.fs.path.join(b.allocator, &[_][]const u8{ ndkPath, "sysroot", "usr", "include" });
    // TODO: We need a way to avoid bits/types.h
    const platformHeaderDir = try std.fs.path.join(b.allocator, &[_][]const u8{ basicCHeaderDir, "aarch64-linux-ohos" });

    // hilog module
    const hilog = b.addModule("hilog", .{
        .root_source_file = b.path("src/hilog/log.zig"),
    });
    hilog.addIncludePath(.{ .cwd_relative = basicCHeaderDir });
    hilog.addIncludePath(.{ .cwd_relative = platformHeaderDir });
}
