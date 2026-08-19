#include "native_drawing_bridge.h"

#include <native_drawing/drawing_bitmap.h>
#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_font.h>
#include <native_drawing/drawing_font_mgr.h>
#include <native_drawing/drawing_text_blob.h>
#include <native_drawing/drawing_typeface.h>

namespace {

template<typename To, typename From>
To* pointerCast(From* value)
{
    return reinterpret_cast<To*>(value);
}

OH_Drawing_FontStyleStruct makeFontStyle(int32_t weight, int32_t width, int32_t slant)
{
    return {
        static_cast<OH_Drawing_FontWeight>(weight),
        static_cast<OH_Drawing_FontWidth>(width),
        static_cast<OH_Drawing_FontStyle>(slant),
    };
}

} // namespace

OH_OhosZig_DrawingBitmap* OH_OhosZig_DrawingBitmapCreateFromPixels(
    void* pixels,
    uint32_t width,
    uint32_t height,
    uint32_t row_bytes,
    int32_t color_format,
    int32_t alpha_format)
{
    OH_Drawing_Image_Info image_info {};
    image_info.width = static_cast<int32_t>(width);
    image_info.height = static_cast<int32_t>(height);
    image_info.colorType = static_cast<OH_Drawing_ColorFormat>(color_format);
    image_info.alphaType = static_cast<OH_Drawing_AlphaFormat>(alpha_format);
    return pointerCast<OH_OhosZig_DrawingBitmap>(OH_Drawing_BitmapCreateFromPixels(&image_info, pixels, row_bytes));
}

void OH_OhosZig_DrawingBitmapDestroy(OH_OhosZig_DrawingBitmap* bitmap)
{
    OH_Drawing_BitmapDestroy(pointerCast<OH_Drawing_Bitmap>(bitmap));
}

OH_OhosZig_DrawingCanvas* OH_OhosZig_DrawingCanvasCreate(void)
{
    return pointerCast<OH_OhosZig_DrawingCanvas>(OH_Drawing_CanvasCreate());
}

void OH_OhosZig_DrawingCanvasBind(OH_OhosZig_DrawingCanvas* canvas, OH_OhosZig_DrawingBitmap* bitmap)
{
    OH_Drawing_CanvasBind(pointerCast<OH_Drawing_Canvas>(canvas), pointerCast<OH_Drawing_Bitmap>(bitmap));
}

void OH_OhosZig_DrawingCanvasAttachBrush(OH_OhosZig_DrawingCanvas* canvas, OH_OhosZig_DrawingBrush* brush)
{
    OH_Drawing_CanvasAttachBrush(pointerCast<OH_Drawing_Canvas>(canvas), pointerCast<OH_Drawing_Brush>(brush));
}

void OH_OhosZig_DrawingCanvasDetachBrush(OH_OhosZig_DrawingCanvas* canvas)
{
    OH_Drawing_CanvasDetachBrush(pointerCast<OH_Drawing_Canvas>(canvas));
}

void OH_OhosZig_DrawingCanvasDrawTextBlob(
    OH_OhosZig_DrawingCanvas* canvas,
    OH_OhosZig_DrawingTextBlob* text_blob,
    float x,
    float y)
{
    OH_Drawing_CanvasDrawTextBlob(
        pointerCast<OH_Drawing_Canvas>(canvas),
        pointerCast<OH_Drawing_TextBlob>(text_blob),
        x,
        y);
}

void OH_OhosZig_DrawingCanvasDestroy(OH_OhosZig_DrawingCanvas* canvas)
{
    OH_Drawing_CanvasDestroy(pointerCast<OH_Drawing_Canvas>(canvas));
}

OH_OhosZig_DrawingBrush* OH_OhosZig_DrawingBrushCreate(void)
{
    return pointerCast<OH_OhosZig_DrawingBrush>(OH_Drawing_BrushCreate());
}

void OH_OhosZig_DrawingBrushSetColor(OH_OhosZig_DrawingBrush* brush, uint32_t color)
{
    OH_Drawing_BrushSetColor(pointerCast<OH_Drawing_Brush>(brush), color);
}

void OH_OhosZig_DrawingBrushDestroy(OH_OhosZig_DrawingBrush* brush)
{
    OH_Drawing_BrushDestroy(pointerCast<OH_Drawing_Brush>(brush));
}

void OH_OhosZig_DrawingTypefaceDestroy(OH_OhosZig_DrawingTypeface* typeface)
{
    OH_Drawing_TypefaceDestroy(pointerCast<OH_Drawing_Typeface>(typeface));
}

OH_OhosZig_DrawingFontMgr* OH_OhosZig_DrawingFontMgrCreate(void)
{
    return pointerCast<OH_OhosZig_DrawingFontMgr>(OH_Drawing_FontMgrCreate());
}

void OH_OhosZig_DrawingFontMgrDestroy(OH_OhosZig_DrawingFontMgr* font_mgr)
{
    OH_Drawing_FontMgrDestroy(pointerCast<OH_Drawing_FontMgr>(font_mgr));
}

OH_OhosZig_DrawingTypeface* OH_OhosZig_DrawingFontMgrMatchFamilyStyle(
    OH_OhosZig_DrawingFontMgr* font_mgr,
    const char* family_name,
    int32_t weight,
    int32_t width,
    int32_t slant)
{
    return pointerCast<OH_OhosZig_DrawingTypeface>(OH_Drawing_FontMgrMatchFamilyStyle(
        pointerCast<OH_Drawing_FontMgr>(font_mgr), family_name, makeFontStyle(weight, width, slant)));
}

OH_OhosZig_DrawingTypeface* OH_OhosZig_DrawingFontMgrMatchFamilyStyleCharacter(
    OH_OhosZig_DrawingFontMgr* font_mgr,
    const char* family_name,
    int32_t weight,
    int32_t width,
    int32_t slant,
    int32_t character)
{
    return pointerCast<OH_OhosZig_DrawingTypeface>(OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        pointerCast<OH_Drawing_FontMgr>(font_mgr),
        family_name,
        makeFontStyle(weight, width, slant),
        nullptr,
        0,
        character));
}

OH_OhosZig_DrawingFont* OH_OhosZig_DrawingFontCreate(void)
{
    return pointerCast<OH_OhosZig_DrawingFont>(OH_Drawing_FontCreate());
}

void OH_OhosZig_DrawingFontSetTypeface(OH_OhosZig_DrawingFont* font, OH_OhosZig_DrawingTypeface* typeface)
{
    OH_Drawing_FontSetTypeface(pointerCast<OH_Drawing_Font>(font), pointerCast<OH_Drawing_Typeface>(typeface));
}

void OH_OhosZig_DrawingFontSetTextSize(OH_OhosZig_DrawingFont* font, float size)
{
    OH_Drawing_FontSetTextSize(pointerCast<OH_Drawing_Font>(font), size);
}

void OH_OhosZig_DrawingFontSetScaleX(OH_OhosZig_DrawingFont* font, float scale)
{
    OH_Drawing_FontSetScaleX(pointerCast<OH_Drawing_Font>(font), scale);
}

void OH_OhosZig_DrawingFontSetTextSkewX(OH_OhosZig_DrawingFont* font, float skew)
{
    OH_Drawing_FontSetTextSkewX(pointerCast<OH_Drawing_Font>(font), skew);
}

void OH_OhosZig_DrawingFontSetFakeBoldText(OH_OhosZig_DrawingFont* font, int32_t enabled)
{
    OH_Drawing_FontSetFakeBoldText(pointerCast<OH_Drawing_Font>(font), enabled != 0);
}

void OH_OhosZig_DrawingFontSetSubpixel(OH_OhosZig_DrawingFont* font, int32_t enabled)
{
    OH_Drawing_FontSetSubpixel(pointerCast<OH_Drawing_Font>(font), enabled != 0);
}

void OH_OhosZig_DrawingFontSetHinting(OH_OhosZig_DrawingFont* font, int32_t hinting)
{
    OH_Drawing_FontSetHinting(
        pointerCast<OH_Drawing_Font>(font), static_cast<OH_Drawing_FontHinting>(hinting));
}

void OH_OhosZig_DrawingFontSetEdging(OH_OhosZig_DrawingFont* font, int32_t edging)
{
    OH_Drawing_FontSetEdging(pointerCast<OH_Drawing_Font>(font), static_cast<OH_Drawing_FontEdging>(edging));
}

void OH_OhosZig_DrawingFontGetMetrics(
    OH_OhosZig_DrawingFont* font,
    OH_OhosZig_DrawingFontMetrics* metrics)
{
    if (metrics == nullptr) {
        return;
    }
    OH_Drawing_Font_Metrics native_metrics {};
    OH_Drawing_FontGetMetrics(pointerCast<OH_Drawing_Font>(font), &native_metrics);
    metrics->top = native_metrics.top;
    metrics->ascent = native_metrics.ascent;
    metrics->descent = native_metrics.descent;
    metrics->bottom = native_metrics.bottom;
    metrics->leading = native_metrics.leading;
    metrics->average_character_width = native_metrics.avgCharWidth;
    metrics->maximum_character_width = native_metrics.maxCharWidth;
    metrics->x_min = native_metrics.xMin;
    metrics->x_max = native_metrics.xMax;
    metrics->x_height = native_metrics.xHeight;
    metrics->cap_height = native_metrics.capHeight;
    metrics->underline_thickness = native_metrics.underlineThickness;
    metrics->underline_position = native_metrics.underlinePosition;
    metrics->strikeout_thickness = native_metrics.strikeoutThickness;
    metrics->strikeout_position = native_metrics.strikeoutPosition;
}

int32_t OH_OhosZig_DrawingFontMeasureText(
    const OH_OhosZig_DrawingFont* font,
    const void* text,
    size_t byte_length,
    int32_t encoding,
    float* text_width)
{
    return OH_Drawing_FontMeasureText(
               pointerCast<const OH_Drawing_Font>(font),
               text,
               byte_length,
               static_cast<OH_Drawing_TextEncoding>(encoding),
               nullptr,
               text_width)
        == OH_DRAWING_SUCCESS;
}

void OH_OhosZig_DrawingFontDestroy(OH_OhosZig_DrawingFont* font)
{
    OH_Drawing_FontDestroy(pointerCast<OH_Drawing_Font>(font));
}

OH_OhosZig_DrawingTextBlob* OH_OhosZig_DrawingTextBlobCreateFromText(
    const void* text,
    size_t byte_length,
    const OH_OhosZig_DrawingFont* font,
    int32_t encoding)
{
    return pointerCast<OH_OhosZig_DrawingTextBlob>(OH_Drawing_TextBlobCreateFromText(
        text,
        byte_length,
        pointerCast<const OH_Drawing_Font>(font),
        static_cast<OH_Drawing_TextEncoding>(encoding)));
}

void OH_OhosZig_DrawingTextBlobDestroy(OH_OhosZig_DrawingTextBlob* text_blob)
{
    OH_Drawing_TextBlobDestroy(pointerCast<OH_Drawing_TextBlob>(text_blob));
}
