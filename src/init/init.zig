pub const raw = @import("init_sys");

pub fn canIUse(capability: [:0]const u8) bool {
    return raw.canIUse(capability.ptr);
}
