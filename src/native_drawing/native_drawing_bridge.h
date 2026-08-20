#ifndef OHOS_ZIG_BINDING_NATIVE_DRAWING_BRIDGE_H
#define OHOS_ZIG_BINDING_NATIVE_DRAWING_BRIDGE_H

#include <stddef.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct OH_OhosZig_DrawingBitmap OH_OhosZig_DrawingBitmap;
typedef struct OH_OhosZig_DrawingBrush OH_OhosZig_DrawingBrush;
typedef struct OH_OhosZig_DrawingCanvas OH_OhosZig_DrawingCanvas;
typedef struct OH_OhosZig_DrawingFont OH_OhosZig_DrawingFont;
typedef struct OH_OhosZig_DrawingFontMgr OH_OhosZig_DrawingFontMgr;
typedef struct OH_OhosZig_DrawingTextBlob OH_OhosZig_DrawingTextBlob;
typedef struct OH_OhosZig_DrawingTypeface OH_OhosZig_DrawingTypeface;

typedef struct OH_OhosZig_DrawingFontMetrics {
    float top;
    float ascent;
    float descent;
    float bottom;
    float leading;
    float average_character_width;
    float maximum_character_width;
    float x_min;
    float x_max;
    float x_height;
    float cap_height;
    float underline_thickness;
    float underline_position;
    float strikeout_thickness;
    float strikeout_position;
} OH_OhosZig_DrawingFontMetrics;

OH_OhosZig_DrawingBitmap* OH_OhosZig_DrawingBitmapCreateFromPixels(
    void* pixels,
    uint32_t width,
    uint32_t height,
    uint32_t row_bytes,
    int32_t color_format,
    int32_t alpha_format);
void OH_OhosZig_DrawingBitmapDestroy(OH_OhosZig_DrawingBitmap* bitmap);

OH_OhosZig_DrawingCanvas* OH_OhosZig_DrawingCanvasCreate(void);
void OH_OhosZig_DrawingCanvasBind(OH_OhosZig_DrawingCanvas* canvas, OH_OhosZig_DrawingBitmap* bitmap);
void OH_OhosZig_DrawingCanvasAttachBrush(OH_OhosZig_DrawingCanvas* canvas, OH_OhosZig_DrawingBrush* brush);
void OH_OhosZig_DrawingCanvasDetachBrush(OH_OhosZig_DrawingCanvas* canvas);
void OH_OhosZig_DrawingCanvasDrawTextBlob(
    OH_OhosZig_DrawingCanvas* canvas,
    OH_OhosZig_DrawingTextBlob* text_blob,
    float x,
    float y);
void OH_OhosZig_DrawingCanvasDestroy(OH_OhosZig_DrawingCanvas* canvas);

OH_OhosZig_DrawingBrush* OH_OhosZig_DrawingBrushCreate(void);
void OH_OhosZig_DrawingBrushSetColor(OH_OhosZig_DrawingBrush* brush, uint32_t color);
void OH_OhosZig_DrawingBrushDestroy(OH_OhosZig_DrawingBrush* brush);

void OH_OhosZig_DrawingTypefaceDestroy(OH_OhosZig_DrawingTypeface* typeface);

OH_OhosZig_DrawingFontMgr* OH_OhosZig_DrawingFontMgrCreate(void);
void OH_OhosZig_DrawingFontMgrDestroy(OH_OhosZig_DrawingFontMgr* font_mgr);
OH_OhosZig_DrawingTypeface* OH_OhosZig_DrawingFontMgrMatchFamilyStyle(
    OH_OhosZig_DrawingFontMgr* font_mgr,
    const char* family_name,
    int32_t weight,
    int32_t width,
    int32_t slant);
OH_OhosZig_DrawingTypeface* OH_OhosZig_DrawingFontMgrMatchFamilyStyleCharacter(
    OH_OhosZig_DrawingFontMgr* font_mgr,
    const char* family_name,
    int32_t weight,
    int32_t width,
    int32_t slant,
    int32_t character);

OH_OhosZig_DrawingFont* OH_OhosZig_DrawingFontCreate(void);
void OH_OhosZig_DrawingFontSetTypeface(OH_OhosZig_DrawingFont* font, OH_OhosZig_DrawingTypeface* typeface);
void OH_OhosZig_DrawingFontSetTextSize(OH_OhosZig_DrawingFont* font, float size);
void OH_OhosZig_DrawingFontSetScaleX(OH_OhosZig_DrawingFont* font, float scale);
void OH_OhosZig_DrawingFontSetTextSkewX(OH_OhosZig_DrawingFont* font, float skew);
void OH_OhosZig_DrawingFontSetFakeBoldText(OH_OhosZig_DrawingFont* font, int32_t enabled);
void OH_OhosZig_DrawingFontSetSubpixel(OH_OhosZig_DrawingFont* font, int32_t enabled);
void OH_OhosZig_DrawingFontSetHinting(OH_OhosZig_DrawingFont* font, int32_t hinting);
void OH_OhosZig_DrawingFontSetEdging(OH_OhosZig_DrawingFont* font, int32_t edging);
void OH_OhosZig_DrawingFontGetMetrics(
    OH_OhosZig_DrawingFont* font,
    OH_OhosZig_DrawingFontMetrics* metrics);
int32_t OH_OhosZig_DrawingFontMeasureText(
    const OH_OhosZig_DrawingFont* font,
    const void* text,
    size_t byte_length,
    int32_t encoding,
    float* text_width);
void OH_OhosZig_DrawingFontDestroy(OH_OhosZig_DrawingFont* font);

OH_OhosZig_DrawingTextBlob* OH_OhosZig_DrawingTextBlobCreateFromText(
    const void* text,
    size_t byte_length,
    const OH_OhosZig_DrawingFont* font,
    int32_t encoding);
void OH_OhosZig_DrawingTextBlobDestroy(OH_OhosZig_DrawingTextBlob* text_blob);

#ifdef __cplusplus
}
#endif

#endif
