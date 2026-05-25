const std = @import("std");
const napi = @import("napi");
const hilog = @import("hilog");
const ability_access_control = @import("ability_access_control");

pub fn run_binding_demo() bool {
    hilog.info("ohos-zig-binding demo started");
    hilog.debugf("demo build id: {d}", .{1});

    const granted = ability_access_control.checkSelfPermission("ohos.permission.INTERNET");
    if (granted) {
        hilog.info("INTERNET permission is granted");
    } else {
        hilog.warn("INTERNET permission is not granted");
    }

    return granted;
}

pub fn hilog_demo(message: []u8) void {
    hilog.setGlobalOptions(.{ .domain = 0x0000, .tag = "ohos-zig-demo" });
    hilog.infof("global hilog message: {s}", .{message});

    const logger = hilog.Hilog.init(.{ .domain = 0x0000, .tag = "ohos-zig-local" });
    logger.err("local hilog error message");

    _ = hilog.isLoggable(.info);
}

pub fn forward_stdio_to_hilog() bool {
    const handle = hilog.forwardStdioToHilog() catch return false;
    handle.detach();

    std.debug.print("std.debug.print is redirected to hilog\n", .{});
    std.debug.print("formatted zig print: {s} {d}\n", .{ "value", 42 });

    return true;
}

pub fn configure_hilog() void {
    hilog.clearCallback();
    hilog.setMinLogLevel(.debug);
    hilog.setLogLevel(.debug, .prefer_open_log);
}

pub fn check_self_permission(permission: []u8) bool {
    const allocator = napi.globalAllocator();
    const permission_z = allocator.dupeZ(u8, permission) catch return false;
    defer allocator.free(permission_z);

    return ability_access_control.checkSelfPermission(permission_z);
}

comptime {
    napi.NODE_API_MODULE("ohos_binding_basic_demo", @This());
}
