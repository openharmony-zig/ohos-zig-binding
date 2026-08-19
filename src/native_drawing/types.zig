const raw = @import("native_drawing_sys");

pub const ColorFormat = enum(u32) {
    unknown = 0,
    alpha8 = 1,
    rgb565 = 2,
    argb4444 = 3,
    rgba8888 = 4,
    bgra8888 = 5,

    pub fn intoRaw(self: ColorFormat) raw.OH_Drawing_ColorFormat {
        return @intFromEnum(self);
    }
};

pub const AlphaFormat = enum(u32) {
    unknown = 0,
    @"opaque" = 1,
    premultiplied = 2,
    unpremultiplied = 3,

    pub fn intoRaw(self: AlphaFormat) raw.OH_Drawing_AlphaFormat {
        return @intFromEnum(self);
    }
};

pub const TextEncoding = enum(u32) {
    utf8 = 0,
    utf16 = 1,
    utf32 = 2,
    glyph_id = 3,

    pub fn intoRaw(self: TextEncoding) raw.OH_Drawing_TextEncoding {
        return @intFromEnum(self);
    }
};

pub const FontHinting = enum(u32) {
    none = 0,
    slight = 1,
    normal = 2,
    full = 3,

    pub fn intoRaw(self: FontHinting) raw.OH_Drawing_FontHinting {
        return @intFromEnum(self);
    }
};

pub const FontEdging = enum(u32) {
    alias = 0,
    anti_alias = 1,
    subpixel_anti_alias = 2,

    pub fn intoRaw(self: FontEdging) raw.OH_Drawing_FontEdging {
        return @intFromEnum(self);
    }
};

pub const FontWeight = enum(i32) {
    thin = 0,
    extra_light = 1,
    light = 2,
    normal = 3,
    medium = 4,
    semi_bold = 5,
    bold = 6,
    extra_bold = 7,
    black = 8,
};

pub const FontWidth = enum(i32) {
    ultra_condensed = 1,
    extra_condensed = 2,
    condensed = 3,
    semi_condensed = 4,
    normal = 5,
    semi_expanded = 6,
    expanded = 7,
    extra_expanded = 8,
    ultra_expanded = 9,
};

pub const FontSlant = enum(i32) {
    normal = 0,
    italic = 1,
    oblique = 2,
};

pub const FontStyle = struct {
    weight: FontWeight = .normal,
    width: FontWidth = .normal,
    slant: FontSlant = .normal,
};

pub const FontMetrics = struct {
    top: f32,
    ascent: f32,
    descent: f32,
    bottom: f32,
    leading: f32,
    average_character_width: f32,
    maximum_character_width: f32,
    x_min: f32,
    x_max: f32,
    x_height: f32,
    cap_height: f32,
    underline_thickness: f32,
    underline_position: f32,
    strikeout_thickness: f32,
    strikeout_position: f32,

    pub fn fromRaw(value: raw.OH_Drawing_Font_Metrics) FontMetrics {
        return .{
            .top = value.top,
            .ascent = value.ascent,
            .descent = value.descent,
            .bottom = value.bottom,
            .leading = value.leading,
            .average_character_width = value.avgCharWidth,
            .maximum_character_width = value.maxCharWidth,
            .x_min = value.xMin,
            .x_max = value.xMax,
            .x_height = value.xHeight,
            .cap_height = value.capHeight,
            .underline_thickness = value.underlineThickness,
            .underline_position = value.underlinePosition,
            .strikeout_thickness = value.strikeoutThickness,
            .strikeout_position = value.strikeoutPosition,
        };
    }
};
