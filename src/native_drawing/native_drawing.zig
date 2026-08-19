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
    handle: ?*raw.OH_Drawing_Bitmap,

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
        var info = raw.OH_Drawing_Image_Info{
            .width = @intCast(width),
            .height = @intCast(height),
            .colorType = color_format.intoRaw(),
            .alphaType = alpha_format.intoRaw(),
        };
        const handle = raw.OH_Drawing_BitmapCreateFromPixels(
            &info,
            @ptrCast(pixels.ptr),
            row_bytes,
        ) orelse return error.BitmapUnavailable;
        return .{ .handle = handle };
    }

    pub fn rawHandle(self: *const Bitmap) ?*raw.OH_Drawing_Bitmap {
        return self.handle;
    }

    pub fn deinit(self: *Bitmap) void {
        const handle = self.handle orelse return;
        self.handle = null;
        raw.OH_Drawing_BitmapDestroy(handle);
    }
};

pub const Canvas = struct {
    handle: ?*raw.OH_Drawing_Canvas,

    pub fn init(bitmap: *const Bitmap) NativeDrawingError!Canvas {
        const handle = raw.OH_Drawing_CanvasCreate() orelse return error.CanvasUnavailable;
        raw.OH_Drawing_CanvasBind(handle, bitmap.rawHandle());
        return .{ .handle = handle };
    }

    pub fn attachBrush(self: *const Canvas, brush: *const Brush) void {
        raw.OH_Drawing_CanvasAttachBrush(self.handle, brush.handle);
    }

    pub fn detachBrush(self: *const Canvas) void {
        raw.OH_Drawing_CanvasDetachBrush(self.handle);
    }

    pub fn drawTextBlob(self: *const Canvas, blob: *const TextBlob, x: f32, y: f32) void {
        raw.OH_Drawing_CanvasDrawTextBlob(self.handle, blob.handle, x, y);
    }

    pub fn deinit(self: *Canvas) void {
        const handle = self.handle orelse return;
        self.handle = null;
        raw.OH_Drawing_CanvasDestroy(handle);
    }
};

pub const Brush = struct {
    handle: ?*raw.OH_Drawing_Brush,

    pub fn init() NativeDrawingError!Brush {
        return .{ .handle = raw.OH_Drawing_BrushCreate() orelse return error.BrushUnavailable };
    }

    pub fn setColor(self: *const Brush, argb: u32) void {
        raw.OH_Drawing_BrushSetColor(self.handle, argb);
    }

    pub fn deinit(self: *Brush) void {
        const handle = self.handle orelse return;
        self.handle = null;
        raw.OH_Drawing_BrushDestroy(handle);
    }
};

pub const Typeface = struct {
    handle: ?*raw.OH_Drawing_Typeface,

    pub fn deinit(self: *Typeface) void {
        const handle = self.handle orelse return;
        self.handle = null;
        raw.OH_Drawing_TypefaceDestroy(handle);
    }
};

pub const FontManager = struct {
    handle: ?*raw.OH_Drawing_FontMgr,

    pub fn init() NativeDrawingError!FontManager {
        return .{
            .handle = raw.OH_OhosZig_FontMgrCreate() orelse
                return error.FontManagerUnavailable,
        };
    }

    pub fn matchFamilyStyle(
        self: *const FontManager,
        family: [:0]const u8,
        style: FontStyle,
    ) ?Typeface {
        const handle = raw.OH_OhosZig_FontMgrMatchFamilyStyle(
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
        const handle = raw.OH_OhosZig_FontMgrMatchFamilyStyleCharacter(
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
        raw.OH_OhosZig_FontMgrDestroy(handle);
    }
};

/// Native font. A configured typeface is borrowed and must outlive the font.
pub const Font = struct {
    handle: ?*raw.OH_Drawing_Font,

    pub fn init() NativeDrawingError!Font {
        return .{ .handle = raw.OH_Drawing_FontCreate() orelse return error.FontUnavailable };
    }

    pub fn setTypeface(self: *const Font, typeface: *const Typeface) void {
        raw.OH_Drawing_FontSetTypeface(self.handle, typeface.handle);
    }

    pub fn setTextSize(self: *const Font, size: f32) void {
        raw.OH_Drawing_FontSetTextSize(self.handle, size);
    }

    pub fn setScaleX(self: *const Font, scale: f32) void {
        raw.OH_Drawing_FontSetScaleX(self.handle, scale);
    }

    /// Apply a synthetic italic shear while retaining the selected face's
    /// metrics. A negative value leans glyphs to the right in Native Drawing.
    pub fn setTextSkewX(self: *const Font, skew: f32) void {
        raw.OH_Drawing_FontSetTextSkewX(self.handle, skew);
    }

    /// Thicken glyph strokes without changing the selected face or advance.
    pub fn setFakeBold(self: *const Font, enabled: bool) void {
        raw.OH_Drawing_FontSetFakeBoldText(self.handle, enabled);
    }

    pub fn setSubpixel(self: *const Font, enabled: bool) void {
        raw.OH_Drawing_FontSetSubpixel(self.handle, enabled);
    }

    pub fn setHinting(self: *const Font, hinting: FontHinting) void {
        raw.OH_Drawing_FontSetHinting(self.handle, hinting.intoRaw());
    }

    pub fn setEdging(self: *const Font, edging: FontEdging) void {
        raw.OH_Drawing_FontSetEdging(self.handle, edging.intoRaw());
    }

    pub fn metrics(self: *const Font) FontMetrics {
        var value: raw.OH_Drawing_Font_Metrics = std.mem.zeroes(raw.OH_Drawing_Font_Metrics);
        _ = raw.OH_Drawing_FontGetMetrics(self.handle, &value);
        return .fromRaw(value);
    }

    pub fn measureText(self: *const Font, text: []const u8, encoding: TextEncoding) ?f32 {
        if (text.len == 0) return null;
        var width: f32 = 0;
        const result = raw.OH_Drawing_FontMeasureText(
            self.handle,
            @ptrCast(text.ptr),
            text.len,
            encoding.intoRaw(),
            null,
            &width,
        );
        if (result != raw.OH_DRAWING_SUCCESS) return null;
        return width;
    }

    pub fn deinit(self: *Font) void {
        const handle = self.handle orelse return;
        self.handle = null;
        raw.OH_Drawing_FontDestroy(handle);
    }
};

pub const TextBlob = struct {
    handle: ?*raw.OH_Drawing_TextBlob,

    pub fn fromText(text: []const u8, font: *const Font, encoding: TextEncoding) ?TextBlob {
        if (text.len == 0) return null;
        const handle = raw.OH_Drawing_TextBlobCreateFromText(
            @ptrCast(text.ptr),
            text.len,
            font.handle,
            encoding.intoRaw(),
        ) orelse return null;
        return .{ .handle = handle };
    }

    pub fn deinit(self: *TextBlob) void {
        const handle = self.handle orelse return;
        self.handle = null;
        raw.OH_Drawing_TextBlobDestroy(handle);
    }
};

test "native drawing enum values match the C API" {
    try std.testing.expectEqual(@as(u32, 4), @intFromEnum(ColorFormat.rgba8888));
    try std.testing.expectEqual(@as(u32, 3), @intFromEnum(FontWeight.normal));
    try std.testing.expectEqual(@as(u32, 5), @intFromEnum(FontWidth.normal));
}

test {
    std.testing.refAllDecls(@This());
}
