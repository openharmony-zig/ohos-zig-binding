const aac = @import("ability_access_control_sys");

/// Check whether this application has been granted the given permission.
pub fn checkSelfPermission(permission: [:0]const u8) bool {
    return aac.OH_AT_CheckSelfPermission(permission.ptr);
}
