#ifndef OHOS_ZIG_BINDING_FONT_MGR_BRIDGE_H
#define OHOS_ZIG_BINDING_FONT_MGR_BRIDGE_H

#include <native_drawing/drawing_types.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

OH_Drawing_FontMgr* OH_OhosZig_FontMgrCreate(void);
void OH_OhosZig_FontMgrDestroy(OH_Drawing_FontMgr* font_mgr);

OH_Drawing_Typeface* OH_OhosZig_FontMgrMatchFamilyStyle(
    OH_Drawing_FontMgr* font_mgr,
    const char* family_name,
    int32_t weight,
    int32_t width,
    int32_t slant);

OH_Drawing_Typeface* OH_OhosZig_FontMgrMatchFamilyStyleCharacter(
    OH_Drawing_FontMgr* font_mgr,
    const char* family_name,
    int32_t weight,
    int32_t width,
    int32_t slant,
    int32_t character);

#ifdef __cplusplus
}
#endif

#endif
