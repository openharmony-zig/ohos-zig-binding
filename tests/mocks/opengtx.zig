//! Failure-injection backend: no HMS SDK or device is required for these tests.
pub const OpenGTX_Context = opaque {};
pub const OpenGTX_DeviceInfoCallback = ?*const fn (c_uint) callconv(.c) void;
pub var calls: [8]u8 = undefined;
pub var count: usize = 0;
pub var fail_deactivate = false;
pub var fail_destroy = false;
var storage: u8 = 0;
pub fn reset() void {
    count = 0;
    fail_deactivate = false;
    fail_destroy = false;
}
fn record(call: u8) void {
    calls[count] = call;
    count += 1;
}
pub fn HMS_OpenGTX_CreateContext(_: OpenGTX_DeviceInfoCallback) ?*OpenGTX_Context {
    record('C');
    return @ptrCast(&storage);
}
pub fn HMS_OpenGTX_Activate(_: ?*OpenGTX_Context) c_uint {
    record('A');
    return 0;
}
pub fn HMS_OpenGTX_Deactivate(_: ?*OpenGTX_Context) c_uint {
    record('S');
    return if (fail_deactivate) 401 else 0;
}
pub fn HMS_OpenGTX_DestroyContext(handle: *?*OpenGTX_Context) c_uint {
    record('D');
    if (fail_destroy) return 401;
    handle.* = null;
    return 0;
}
