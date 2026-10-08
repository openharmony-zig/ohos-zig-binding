const ffi = @import("ohos_zig_binding_ffi");
pub const raw = @import("vibrator_sys");
pub const Error = ffi.Error;
pub const Attribute = raw.Vibrator_Attribute;
pub const FileDescription = raw.Vibrator_FileDescription;

pub fn start(duration_ms: i32, attribute: Attribute) Error!void {
    if (duration_ms <= 0) return error.InvalidArgument;
    try ffi.check(raw.OH_Vibrator_PlayVibration(duration_ms, attribute));
}

/// The caller owns the file descriptor and keeps it open for the native call.
pub fn startCustom(file: FileDescription, attribute: Attribute) Error!void {
    if (file.fd < 0 or file.offset < 0 or file.length <= 0) return error.InvalidArgument;
    try ffi.check(raw.OH_Vibrator_PlayVibrationCustom(file, attribute));
}

pub fn cancel() Error!void {
    try ffi.check(raw.OH_Vibrator_Cancel());
}
