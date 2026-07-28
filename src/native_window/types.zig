const api = @import("ohos_zig_binding_api");

/// Dirty rectangle passed when a dequeued buffer is flushed.
pub const Region = extern struct {
    x: i32 = 0,
    y: i32 = 0,
    w: u32,
    h: u32,
};

/// Operation codes accepted by `OH_NativeWindow_NativeWindowHandleOpt`.
///
/// The safe wrapper currently uses only `set_buffer_geometry`; the remaining
/// values are exposed to match the reference binding's operation range.
pub const Operation = enum(i32) {
    set_buffer_geometry = 0,
    get_buffer_geometry = 1,
    get_format = 2,
    set_format = 3,
    get_usage = 4,
    set_usage = 5,
    set_stride = 6,
    get_stride = 7,
    set_swap_interval = 8,
    get_swap_interval = 9,
    set_timeout = 10,
    get_timeout = 11,
    set_color_gamut = 12,
    get_color_gamut = 13,
    set_transform = 14,
    get_transform = 15,
    set_ui_timestamp = 16,
    get_bufferqueue_size = 17,
    set_source_type = 18,
    get_source_type = 19,
    set_app_framework_type = 20,
    get_app_framework_type = 21,
    set_hdr_white_point_brightness = 22,
    set_sdr_white_point_brightness = 23,
    set_desired_present_timestamp = 24,

    pub fn intoI32(comptime self: Operation) i32 {
        if (self == .set_desired_present_timestamp) {
            api.require("native_window.Operation.set_desired_present_timestamp", 13);
        }
        return @intFromEnum(self);
    }
};

/// Pixel formats understood by the reference native-window binding.
pub const NativeBufferFormat = enum(i32) {
    clut8 = 0,
    clut1 = 1,
    clut4 = 2,
    rgb_565 = 3,
    rgba_5658 = 4,
    rgbx_4444 = 5,
    rgba_4444 = 6,
    rgb_444 = 7,
    rgbx_5551 = 8,
    rgba_5551 = 9,
    rgb_555 = 10,
    rgbx_8888 = 11,
    rgba_8888 = 12,
    rgb_888 = 13,
    bgr_565 = 14,
    bgrx_4444 = 15,
    bgra_4444 = 16,
    bgrx_5551 = 17,
    bgra_5551 = 18,
    bgrx_8888 = 19,
    bgra_8888 = 20,
    yuv_422_i = 21,
    ycbcr_422_sp = 22,
    ycrcb_422_sp = 23,
    ycbcr_420_sp = 24,
    ycrcb_420_sp = 25,
    ycbcr_422_p = 26,
    ycrcb_422_p = 27,
    ycbcr_420_p = 28,
    ycrcb_420_p = 29,
    yuyv_422_pkg = 30,
    uyvy_422_pkg = 31,
    yvyu_422_pkg = 32,
    vyuy_422_pkg = 33,
    rgba_1010102 = 34,
    ycbcr_p010 = 35,
    ycrcb_p010 = 36,
    raw10 = 37,
    vendor_mask = 2_147_418_112,
    invalid = 2_147_483_647,
    _,

    pub fn fromRaw(raw_value: i32) NativeBufferFormat {
        return @enumFromInt(raw_value);
    }

    pub fn raw(self: NativeBufferFormat) i32 {
        return @intFromEnum(self);
    }

    /// Returns the byte width used by the reference binding's packed access.
    ///
    /// Multi-planar YUV buffers require format-aware plane access in general;
    /// this helper intentionally preserves the reference binding's limited
    /// packed-buffer model.
    pub fn bytesPerPixel(self: NativeBufferFormat) usize {
        return switch (self) {
            .clut8, .clut1, .clut4 => 1,
            .rgb_565,
            .rgbx_4444,
            .rgba_4444,
            .rgb_444,
            .rgbx_5551,
            .rgba_5551,
            .rgb_555,
            .bgr_565,
            .bgrx_4444,
            .bgra_4444,
            .bgrx_5551,
            .bgra_5551,
            .yuv_422_i,
            .ycbcr_422_sp,
            .ycrcb_422_sp,
            .ycbcr_420_sp,
            .ycrcb_420_sp,
            .ycbcr_422_p,
            .ycrcb_422_p,
            .ycbcr_420_p,
            .ycrcb_420_p,
            .yuyv_422_pkg,
            .uyvy_422_pkg,
            .yvyu_422_pkg,
            .vyuy_422_pkg,
            .raw10,
            => 2,
            .rgba_5658, .rgb_888, .ycbcr_p010, .ycrcb_p010 => 3,
            .rgbx_8888, .rgba_8888, .bgrx_8888, .bgra_8888, .rgba_1010102 => 4,
            else => 0,
        };
    }
};

test "native buffer format byte widths" {
    const std = @import("std");
    try std.testing.expectEqual(@as(usize, 4), NativeBufferFormat.rgba_8888.bytesPerPixel());
    try std.testing.expectEqual(@as(usize, 3), NativeBufferFormat.rgb_888.bytesPerPixel());
    try std.testing.expectEqual(@as(usize, 0), NativeBufferFormat.invalid.bytesPerPixel());
}

test "native window operation values match the NDK" {
    const std = @import("std");
    try std.testing.expectEqual(@as(i32, 0), Operation.set_buffer_geometry.intoI32());
    try std.testing.expectEqual(@as(i32, 23), Operation.set_sdr_white_point_brightness.intoI32());
}
