const hilog = @import("hilog_sys");

pub fn info(msg: []const u8) void {
    _ = hilog.OH_LOG_Print(hilog.LOG_APP, hilog.LOG_INFO, 0x00, "zig-ohos", @ptrCast(msg.ptr));
}
