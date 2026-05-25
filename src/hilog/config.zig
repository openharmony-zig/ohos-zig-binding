const api = @import("ohos_zig_binding_api");
const hilog = @import("hilog_sys");
const raw = @import("raw.zig");
const types = @import("types.zig");

pub fn setCallback(callback: types.LogCallback) void {
    hilog.OH_LOG_SetCallback(callback);
}

pub fn clearCallback() void {
    hilog.OH_LOG_SetCallback(null);
}

pub fn setMinLogLevel(level: types.Level) void {
    comptime api.require("hilog.setMinLogLevel", 15);
    hilog.OH_LOG_SetMinLogLevel(raw.rawLevel(level));
}

pub fn setLogLevel(level: types.Level, strategy: types.PreferStrategy) void {
    comptime api.require("hilog.setLogLevel", 21);
    hilog.OH_LOG_SetLogLevel(
        raw.rawLevel(level),
        @as(hilog.PreferStrategy, @intCast(@intFromEnum(strategy))),
    );
}
