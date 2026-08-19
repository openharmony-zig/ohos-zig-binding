const raw = @import("native_drawing_sys");

pub const ColorFormat = enum(i32) {
    unknown = 0,
    alpha8 = 1,
    rgb565 = 2,
    argb4444 = 3,
    rgba8888 = 4,
    bgra8888 = 5,
};

pub const AlphaFormat = enum(i32) {
    unknown = 0,
    @"opaque" = 1,
    premultiplied = 2,
    unpremultiplied = 3,
};

pub const TextEncoding = enum(i32) {
    utf8 = 0,
    utf16 = 1,
    utf32 = 2,
    glyph_id = 3,
};

pub const FontHinting = enum(i32) {
    none = 0,
    slight = 1,
    normal = 2,
    full = 3,
};

pub const FontEdging = enum(i32) {
    alias = 0,
    anti_alias = 1,
    subpixel_anti_alias = 2,
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

    pub fn fromBridge(value: raw.OH_OhosZig_DrawingFontMetrics) FontMetrics {
        return .{
            .top = value.top,
            .ascent = value.ascent,
            .descent = value.descent,
            .bottom = value.bottom,
            .leading = value.leading,
            .average_character_width = value.average_character_width,
            .maximum_character_width = value.maximum_character_width,
            .x_min = value.x_min,
            .x_max = value.x_max,
            .x_height = value.x_height,
            .cap_height = value.cap_height,
            .underline_thickness = value.underline_thickness,
            .underline_position = value.underline_position,
            .strikeout_thickness = value.strikeout_thickness,
            .strikeout_position = value.strikeout_position,
        };
    }
};
