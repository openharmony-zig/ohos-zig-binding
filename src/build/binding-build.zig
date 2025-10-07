const std = @import("std");

/// This function is used to build the binding for the module.
pub fn build(compiler: *std.Build.Step.Compile, module: []const u8) !void {
    if (std.mem.eql(u8, module, "hilog")) {
        compiler.root_module.linkSystemLibrary("hilog_ndk.z", .{});
    }
}
