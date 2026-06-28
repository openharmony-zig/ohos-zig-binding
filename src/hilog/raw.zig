const hilog = @import("hilog_sys");
const types = @import("types.zig");

pub fn rawType(log_type: types.LogType) hilog.LogType {
    return @as(hilog.LogType, @intCast(@intFromEnum(log_type)));
}

pub fn rawLevel(level: types.Level) hilog.LogLevel {
    return @as(hilog.LogLevel, @intCast(@intFromEnum(level)));
}
