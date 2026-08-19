#include "font_mgr_bridge.h"

#include <native_drawing/drawing_font_mgr.h>

namespace {

OH_Drawing_FontStyleStruct makeFontStyle(int32_t weight, int32_t width, int32_t slant)
{
    return {
        static_cast<OH_Drawing_FontWeight>(weight),
        static_cast<OH_Drawing_FontWidth>(width),
        static_cast<OH_Drawing_FontStyle>(slant),
    };
}

} // namespace

OH_Drawing_FontMgr* OH_OhosZig_FontMgrCreate(void)
{
    return OH_Drawing_FontMgrCreate();
}

void OH_OhosZig_FontMgrDestroy(OH_Drawing_FontMgr* font_mgr)
{
    OH_Drawing_FontMgrDestroy(font_mgr);
}

OH_Drawing_Typeface* OH_OhosZig_FontMgrMatchFamilyStyle(
    OH_Drawing_FontMgr* font_mgr,
    const char* family_name,
    int32_t weight,
    int32_t width,
    int32_t slant)
{
    return OH_Drawing_FontMgrMatchFamilyStyle(font_mgr, family_name, makeFontStyle(weight, width, slant));
}

OH_Drawing_Typeface* OH_OhosZig_FontMgrMatchFamilyStyleCharacter(
    OH_Drawing_FontMgr* font_mgr,
    const char* family_name,
    int32_t weight,
    int32_t width,
    int32_t slant,
    int32_t character)
{
    return OH_Drawing_FontMgrMatchFamilyStyleCharacter(
        font_mgr,
        family_name,
        makeFontStyle(weight, width, slant),
        nullptr,
        0,
        character);
}
