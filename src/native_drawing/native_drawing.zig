const std = @import("std");

pub const raw = @import("native_drawing_sys");
pub const types = @import("types.zig");

pub const AlphaFormat = types.AlphaFormat;
pub const ColorFormat = types.ColorFormat;
pub const FontEdging = types.FontEdging;
pub const FontHinting = types.FontHinting;
pub const FontMetrics = types.FontMetrics;
pub const FontSlant = types.FontSlant;
pub const FontStyle = types.FontStyle;
pub const FontWeight = types.FontWeight;
pub const FontWidth = types.FontWidth;
pub const TextEncoding = types.TextEncoding;

pub const NativeDrawingError = error{
    InvalidDimensions,
    BufferTooSmall,
    BitmapUnavailable,
    CanvasUnavailable,
    BrushUnavailable,
    FontManagerUnavailable,
    FontUnavailable,
};

/// A Native Drawing bitmap backed by caller-owned pixels.
///
/// The pixel slice must remain alive and at a stable address until `deinit`.
pub const Bitmap = struct {
    handle: ?*raw.OH_OhosZig_DrawingBitmap,

    pub fn wrapPixels(
        pixels: []u8,
        width: u32,
        height: u32,
        row_bytes: u32,
        color_format: ColorFormat,
        alpha_format: AlphaFormat,
    ) NativeDrawingError!Bitmap {
        if (width == 0 or height == 0 or row_bytes == 0) return error.InvalidDimensions;
        const required = std.math.mul(usize, row_bytes, height) catch
            return error.InvalidDimensions;
        if (pixels.len < required) return error.BufferTooSmall;
        const handle = raw.OH_OhosZig_DrawingBitmapCreateFromPixels(
            @ptrCast(pixels.ptr),
            width,
            height,
            row_bytes,
            @intFromEnum(color_format),
            @intFromEnum(alpha_format),
        ) orelse return error.BitmapUnavailable;
        return .{ .handle = handle };
    }

    pub fn rawHandle(self: *const Bitmap) ?*raw.OH_OhosZig_DrawingBitmap {
        return self.handle;
    }

    pub fn deinit(self: *Bitmap) void {
        const handle = self.handle orelse return;
        self.handle = null;
        raw.OH_OhosZig_DrawingBitmapDestroy(handle);
    }
};

pub const Canvas = struct {
    handle: ?*raw.OH_OhosZig_DrawingCanvas,

    pub fn init(bitmap: *const Bitmap) NativeDrawingError!Canvas {
        const handle = raw.OH_OhosZig_DrawingCanvasCreate() orelse return error.CanvasUnavailable;
        raw.OH_OhosZig_DrawingCanvasBind(handle, bitmap.rawHandle());
        return .{ .handle = handle };
    }

    pub fn attachBrush(self: *const Canvas, brush: *const Brush) void {
        raw.OH_OhosZig_DrawingCanvasAttachBrush(self.handle, brush.handle);
    }

    pub fn detachBrush(self: *const Canvas) void {
        raw.OH_OhosZig_DrawingCanvasDetachBrush(self.handle);
    }

    pub fn drawTextBlob(self: *const Canvas, blob: *const TextBlob, x: f32, y: f32) void {
        raw.OH_OhosZig_DrawingCanvasDrawTextBlob(self.handle, blob.handle, x, y);
    }

    pub fn deinit(self: *Canvas) void {
        const handle = self.handle orelse return;
        self.handle = null;
        raw.OH_OhosZig_DrawingCanvasDestroy(handle);
    }
};

pub const Brush = struct {
    handle: ?*raw.OH_OhosZig_DrawingBrush,

    pub fn init() NativeDrawingError!Brush {
        return .{ .handle = raw.OH_OhosZig_DrawingBrushCreate() orelse return error.BrushUnavailable };
    }

    pub fn setColor(self: *const Brush, argb: u32) void {
        raw.OH_OhosZig_DrawingBrushSetColor(self.handle, argb);
    }

    pub fn deinit(self: *Brush) void {
        const handle = self.handle orelse return;
        self.handle = null;
        raw.OH_OhosZig_DrawingBrushDestroy(handle);
    }
};

pub const Typeface = struct {
    handle: ?*raw.OH_OhosZig_DrawingTypeface,

    pub fn deinit(self: *Typeface) void {
        const handle = self.handle orelse return;
        self.handle = null;
        raw.OH_OhosZig_DrawingTypefaceDestroy(handle);
    }
};

pub const FontManager = struct {
    handle: ?*raw.OH_OhosZig_DrawingFontMgr,

    pub fn init() NativeDrawingError!FontManager {
        return .{
            .handle = raw.OH_OhosZig_DrawingFontMgrCreate() orelse
                return error.FontManagerUnavailable,
        };
    }

    pub fn matchFamilyStyle(
        self: *const FontManager,
        family: [:0]const u8,
        style: FontStyle,
    ) ?Typeface {
        const handle = raw.OH_OhosZig_DrawingFontMgrMatchFamilyStyle(
            self.handle,
            family.ptr,
            @intFromEnum(style.weight),
            @intFromEnum(style.width),
            @intFromEnum(style.slant),
        ) orelse return null;
        return .{ .handle = handle };
    }

    pub fn matchFamilyStyleCharacter(
        self: *const FontManager,
        family: [:0]const u8,
        style: FontStyle,
        character: u21,
    ) ?Typeface {
        const handle = raw.OH_OhosZig_DrawingFontMgrMatchFamilyStyleCharacter(
            self.handle,
            family.ptr,
            @intFromEnum(style.weight),
            @intFromEnum(style.width),
            @intFromEnum(style.slant),
            @intCast(character),
        ) orelse return null;
        return .{ .handle = handle };
    }

    pub fn deinit(self: *FontManager) void {
        const handle = self.handle orelse return;
        self.handle = null;
        raw.OH_OhosZig_DrawingFontMgrDestroy(handle);
    }
};

/// Native font. A configured typeface is borrowed and must outlive the font.
pub const Font = struct {
    handle: ?*raw.OH_OhosZig_DrawingFont,

    pub fn init() NativeDrawingError!Font {
        return .{ .handle = raw.OH_OhosZig_DrawingFontCreate() orelse return error.FontUnavailable };
    }

    pub fn setTypeface(self: *const Font, typeface: *const Typeface) void {
        raw.OH_OhosZig_DrawingFontSetTypeface(self.handle, typeface.handle);
    }

    pub fn setTextSize(self: *const Font, size: f32) void {
        raw.OH_OhosZig_DrawingFontSetTextSize(self.handle, size);
    }

    pub fn setScaleX(self: *const Font, scale: f32) void {
        raw.OH_OhosZig_DrawingFontSetScaleX(self.handle, scale);
    }

    /// Apply a synthetic italic shear while retaining the selected face's
    /// metrics. A negative value leans glyphs to the right in Native Drawing.
    pub fn setTextSkewX(self: *const Font, skew: f32) void {
        raw.OH_OhosZig_DrawingFontSetTextSkewX(self.handle, skew);
    }

    /// Thicken glyph strokes without changing the selected face or advance.
    pub fn setFakeBold(self: *const Font, enabled: bool) void {
        raw.OH_OhosZig_DrawingFontSetFakeBoldText(self.handle, @intFromBool(enabled));
    }

    pub fn setSubpixel(self: *const Font, enabled: bool) void {
        raw.OH_OhosZig_DrawingFontSetSubpixel(self.handle, @intFromBool(enabled));
    }

    pub fn setHinting(self: *const Font, hinting: FontHinting) void {
        raw.OH_OhosZig_DrawingFontSetHinting(self.handle, @intFromEnum(hinting));
    }

    pub fn setEdging(self: *const Font, edging: FontEdging) void {
        raw.OH_OhosZig_DrawingFontSetEdging(self.handle, @intFromEnum(edging));
    }

    pub fn metrics(self: *const Font) FontMetrics {
        var value: raw.OH_OhosZig_DrawingFontMetrics = std.mem.zeroes(raw.OH_OhosZig_DrawingFontMetrics);
        raw.OH_OhosZig_DrawingFontGetMetrics(self.handle, &value);
        return .fromBridge(value);
    }

    pub fn measureText(self: *const Font, text: []const u8, encoding: TextEncoding) ?f32 {
        if (text.len == 0) return null;
        var width: f32 = 0;
        const result = raw.OH_OhosZig_DrawingFontMeasureText(
            self.handle,
            @ptrCast(text.ptr),
            text.len,
            @intFromEnum(encoding),
            &width,
        );
        if (result == 0) return null;
        return width;
    }

    pub fn deinit(self: *Font) void {
        const handle = self.handle orelse return;
        self.handle = null;
        raw.OH_OhosZig_DrawingFontDestroy(handle);
    }
};

pub const TextBlob = struct {
    handle: ?*raw.OH_OhosZig_DrawingTextBlob,

    pub fn fromText(text: []const u8, font: *const Font, encoding: TextEncoding) ?TextBlob {
        if (text.len == 0) return null;
        const handle = raw.OH_OhosZig_DrawingTextBlobCreateFromText(
            @ptrCast(text.ptr),
            text.len,
            font.handle,
            @intFromEnum(encoding),
        ) orelse return null;
        return .{ .handle = handle };
    }

    pub fn deinit(self: *TextBlob) void {
        const handle = self.handle orelse return;
        self.handle = null;
        raw.OH_OhosZig_DrawingTextBlobDestroy(handle);
    }
};

test "native drawing enum values match the C API" {
    try std.testing.expectEqual(@as(i32, 4), @intFromEnum(ColorFormat.rgba8888));
    try std.testing.expectEqual(@as(i32, 3), @intFromEnum(FontWeight.normal));
    try std.testing.expectEqual(@as(i32, 5), @intFromEnum(FontWidth.normal));
}

test {
    std.testing.refAllDecls(@This());
}
