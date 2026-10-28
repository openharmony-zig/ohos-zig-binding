pub const ARKWEB_NATIVE_CONTROLLER = 0;
pub const ArkWeb_ControllerAPI = extern struct {
    size: usize,
    refresh: ?*const fn ([*c]const u8) callconv(.c) void,
};
pub var load_result: ?*anyopaque = null;
pub fn OH_ArkWeb_GetNativeAPI(_: u32) ?*anyopaque {
    return load_result;
}
