const hilog = @import("hilog_sys");
const api = @import("ohos_zig_binding_api");

pub const default_domain: u32 = 0x0000;
pub const default_tag = "zig-ohos";
pub const redirect_tag = "ZigStdoutStderr";

pub const LogType = enum(u32) {
    app = 0,
};

pub const Level = enum(u32) {
    debug = 3,
    info = 4,
    warn = 5,
    err = 6,
    fatal = 7,
};

pub const Options = struct {
    domain: u32 = default_domain,
    tag: []const u8 = default_tag,
    log_type: LogType = .app,
};

pub const LogCallback = ?*const fn (
    log_type: hilog.LogType,
    level: hilog.LogLevel,
    domain: c_uint,
    tag: [*c]const u8,
    msg: [*c]const u8,
) callconv(.c) void;

pub const PreferStrategy = enum(u32) {
    comptime {
        api.require("hilog.PreferStrategy", 21);
    }

    unset_log_level = 0,
    prefer_close_log = 1,
    prefer_open_log = 2,
};
