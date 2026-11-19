//! Generated compile/link coverage. NEVER execute this library.
const options = @import("check_options");
comptime {
    @setEvalBranchQuota(100000);
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetAccessibilityDescription, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetAccessibilityDescription" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetAccessibilityFocused, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetAccessibilityFocused" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetAccessibilityGroup, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetAccessibilityGroup" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetAccessibilityLevel, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetAccessibilityLevel" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetAccessibilityOffset, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetAccessibilityOffset" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetAccessibilityOpacity, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetAccessibilityOpacity" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetBackgroundColor, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetBackgroundColor" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetBackgroundImage, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetBackgroundImage" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetBlur, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetBlur" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetCheckable, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetCheckable" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetChecked, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetChecked" });
    }
    if (options.compile_check_api >= 24) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetComponentIdentifier, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetComponentIdentifier" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetCurrentItemIndex, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetCurrentItemIndex" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetEditable, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetEditable" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetEndItemIndex, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetEndItemIndex" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetGridInfo, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetGridInfo" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetGridItemInfo, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetGridItemInfo" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetHintText, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetHintText" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetHitTestBehavior, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetHitTestBehavior" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetIsHint, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetIsHint" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetIsPassword, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetIsPassword" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetItemCount, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetItemCount" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetLongClickable, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetLongClickable" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetRangeInfo, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetRangeInfo" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetScrollable, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetScrollable" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetSelectedTextEnd, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetSelectedTextEnd" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetSelectedTextStart, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetSelectedTextStart" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetStartItemIndex, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetStartItemIndex" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityElementInfoSetZIndex, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityElementInfoSetZIndex" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("accessibility").native.OH_ArkUI_AccessibilityProviderRegisterCallbackWithInstance, .{ .name = "check_accessibility_OH_ArkUI_AccessibilityProviderRegisterCallbackWithInstance" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_AddAndGetAccessibilityElementInfo, .{ .name = "check_accessibility_OH_ArkUI_AddAndGetAccessibilityElementInfo" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("accessibility").native.OH_ArkUI_FindAccessibilityActionArgumentByKey, .{ .name = "check_accessibility_OH_ArkUI_FindAccessibilityActionArgumentByKey" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("accessibility").native.OH_ArkUI_NativeModule_GetNativeAccessibilityProvider, .{ .name = "check_accessibility_OH_ArkUI_NativeModule_GetNativeAccessibilityProvider" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityState_Create, .{ .name = "check_arkui_OH_ArkUI_AccessibilityState_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityState_Dispose, .{ .name = "check_arkui_OH_ArkUI_AccessibilityState_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityState_GetCheckedState, .{ .name = "check_arkui_OH_ArkUI_AccessibilityState_GetCheckedState" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityState_IsDisabled, .{ .name = "check_arkui_OH_ArkUI_AccessibilityState_IsDisabled" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityState_IsSelected, .{ .name = "check_arkui_OH_ArkUI_AccessibilityState_IsSelected" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityState_SetCheckedState, .{ .name = "check_arkui_OH_ArkUI_AccessibilityState_SetCheckedState" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityState_SetDisabled, .{ .name = "check_arkui_OH_ArkUI_AccessibilityState_SetDisabled" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityState_SetSelected, .{ .name = "check_arkui_OH_ArkUI_AccessibilityState_SetSelected" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityValue_Create, .{ .name = "check_arkui_OH_ArkUI_AccessibilityValue_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityValue_Dispose, .{ .name = "check_arkui_OH_ArkUI_AccessibilityValue_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityValue_GetCurrent, .{ .name = "check_arkui_OH_ArkUI_AccessibilityValue_GetCurrent" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityValue_GetMax, .{ .name = "check_arkui_OH_ArkUI_AccessibilityValue_GetMax" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityValue_GetMin, .{ .name = "check_arkui_OH_ArkUI_AccessibilityValue_GetMin" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityValue_GetRangeCurrent, .{ .name = "check_arkui_OH_ArkUI_AccessibilityValue_GetRangeCurrent" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityValue_GetRangeMax, .{ .name = "check_arkui_OH_ArkUI_AccessibilityValue_GetRangeMax" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityValue_GetRangeMin, .{ .name = "check_arkui_OH_ArkUI_AccessibilityValue_GetRangeMin" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityValue_GetText, .{ .name = "check_arkui_OH_ArkUI_AccessibilityValue_GetText" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityValue_SetCurrent, .{ .name = "check_arkui_OH_ArkUI_AccessibilityValue_SetCurrent" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityValue_SetMax, .{ .name = "check_arkui_OH_ArkUI_AccessibilityValue_SetMax" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityValue_SetMin, .{ .name = "check_arkui_OH_ArkUI_AccessibilityValue_SetMin" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityValue_SetRangeCurrent, .{ .name = "check_arkui_OH_ArkUI_AccessibilityValue_SetRangeCurrent" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityValue_SetRangeMax, .{ .name = "check_arkui_OH_ArkUI_AccessibilityValue_SetRangeMax" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityValue_SetRangeMin, .{ .name = "check_arkui_OH_ArkUI_AccessibilityValue_SetRangeMin" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AccessibilityValue_SetText, .{ .name = "check_arkui_OH_ArkUI_AccessibilityValue_SetText" });
    }
    if (options.compile_check_api >= 14) {
        @export(&@import("arkui").native.OH_ArkUI_ActiveChildrenInfo_Destroy, .{ .name = "check_arkui_OH_ArkUI_ActiveChildrenInfo_Destroy" });
    }
    if (options.compile_check_api >= 14) {
        @export(&@import("arkui").native.OH_ArkUI_ActiveChildrenInfo_GetCount, .{ .name = "check_arkui_OH_ArkUI_ActiveChildrenInfo_GetCount" });
    }
    if (options.compile_check_api >= 14) {
        @export(&@import("arkui").native.OH_ArkUI_ActiveChildrenInfo_GetNodeByIndex, .{ .name = "check_arkui_OH_ArkUI_ActiveChildrenInfo_GetNodeByIndex" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_AddSupportedUIStates, .{ .name = "check_arkui_OH_ArkUI_AddSupportedUIStates" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_Create, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_Dispose, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_GetBiasHorizontal, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_GetBiasHorizontal" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_GetBiasVertical, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_GetBiasVertical" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_GetBottomAlignment, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_GetBottomAlignment" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_GetBottomId, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_GetBottomId" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_GetCenterAlignmentHorizontal, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_GetCenterAlignmentHorizontal" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_GetCenterAlignmentVertical, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_GetCenterAlignmentVertical" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_GetCenterIdHorizontal, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_GetCenterIdHorizontal" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_GetCenterIdVertical, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_GetCenterIdVertical" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_GetEndAlignment, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_GetEndAlignment" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_GetEndId, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_GetEndId" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_GetStartAlignment, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_GetStartAlignment" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_GetStartId, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_GetStartId" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_GetTopAlignment, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_GetTopAlignment" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_GetTopId, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_GetTopId" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_SetBiasHorizontal, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_SetBiasHorizontal" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_SetBiasVertical, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_SetBiasVertical" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_SetBottom, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_SetBottom" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_SetCenterHorizontal, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_SetCenterHorizontal" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_SetCenterVertical, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_SetCenterVertical" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_SetEnd, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_SetEnd" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_SetStart, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_SetStart" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AlignmentRuleOption_SetTop, .{ .name = "check_arkui_OH_ArkUI_AlignmentRuleOption_SetTop" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AllowNodeAllDropDataTypes, .{ .name = "check_arkui_OH_ArkUI_AllowNodeAllDropDataTypes" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimateOption_Create, .{ .name = "check_arkui_OH_ArkUI_AnimateOption_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimateOption_Dispose, .{ .name = "check_arkui_OH_ArkUI_AnimateOption_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimateOption_GetCurve, .{ .name = "check_arkui_OH_ArkUI_AnimateOption_GetCurve" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimateOption_GetDelay, .{ .name = "check_arkui_OH_ArkUI_AnimateOption_GetDelay" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimateOption_GetDuration, .{ .name = "check_arkui_OH_ArkUI_AnimateOption_GetDuration" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimateOption_GetExpectedFrameRateRange, .{ .name = "check_arkui_OH_ArkUI_AnimateOption_GetExpectedFrameRateRange" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimateOption_GetICurve, .{ .name = "check_arkui_OH_ArkUI_AnimateOption_GetICurve" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimateOption_GetIterations, .{ .name = "check_arkui_OH_ArkUI_AnimateOption_GetIterations" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimateOption_GetPlayMode, .{ .name = "check_arkui_OH_ArkUI_AnimateOption_GetPlayMode" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimateOption_GetTempo, .{ .name = "check_arkui_OH_ArkUI_AnimateOption_GetTempo" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimateOption_SetCurve, .{ .name = "check_arkui_OH_ArkUI_AnimateOption_SetCurve" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimateOption_SetDelay, .{ .name = "check_arkui_OH_ArkUI_AnimateOption_SetDelay" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimateOption_SetDuration, .{ .name = "check_arkui_OH_ArkUI_AnimateOption_SetDuration" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimateOption_SetExpectedFrameRateRange, .{ .name = "check_arkui_OH_ArkUI_AnimateOption_SetExpectedFrameRateRange" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimateOption_SetICurve, .{ .name = "check_arkui_OH_ArkUI_AnimateOption_SetICurve" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimateOption_SetIterations, .{ .name = "check_arkui_OH_ArkUI_AnimateOption_SetIterations" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimateOption_SetPlayMode, .{ .name = "check_arkui_OH_ArkUI_AnimateOption_SetPlayMode" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimateOption_SetTempo, .{ .name = "check_arkui_OH_ArkUI_AnimateOption_SetTempo" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorEvent_GetUserData, .{ .name = "check_arkui_OH_ArkUI_AnimatorEvent_GetUserData" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOnFrameEvent_GetUserData, .{ .name = "check_arkui_OH_ArkUI_AnimatorOnFrameEvent_GetUserData" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOnFrameEvent_GetValue, .{ .name = "check_arkui_OH_ArkUI_AnimatorOnFrameEvent_GetValue" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_Create, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_Dispose, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_GetBegin, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_GetBegin" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_GetCurve, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_GetCurve" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_GetDelay, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_GetDelay" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_GetDirection, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_GetDirection" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_GetDuration, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_GetDuration" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_GetEnd, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_GetEnd" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_GetExpectedFrameRateRange, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_GetExpectedFrameRateRange" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_GetFill, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_GetFill" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_GetIterations, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_GetIterations" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_GetKeyframeCurve, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_GetKeyframeCurve" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_GetKeyframeTime, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_GetKeyframeTime" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_GetKeyframeValue, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_GetKeyframeValue" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_RegisterOnCancelCallback, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_RegisterOnCancelCallback" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_RegisterOnFinishCallback, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_RegisterOnFinishCallback" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_RegisterOnFrameCallback, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_RegisterOnFrameCallback" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_RegisterOnRepeatCallback, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_RegisterOnRepeatCallback" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_SetBegin, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_SetBegin" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_SetCurve, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_SetCurve" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_SetDelay, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_SetDelay" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_SetDirection, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_SetDirection" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_SetDuration, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_SetDuration" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_SetEnd, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_SetEnd" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_SetExpectedFrameRateRange, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_SetExpectedFrameRateRange" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_SetFill, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_SetFill" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_SetIterations, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_SetIterations" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_SetKeyframe, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_SetKeyframe" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_AnimatorOption_SetKeyframeCurve, .{ .name = "check_arkui_OH_ArkUI_AnimatorOption_SetKeyframeCurve" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_Animator_Cancel, .{ .name = "check_arkui_OH_ArkUI_Animator_Cancel" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_Animator_Finish, .{ .name = "check_arkui_OH_ArkUI_Animator_Finish" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_Animator_Pause, .{ .name = "check_arkui_OH_ArkUI_Animator_Pause" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_Animator_Play, .{ .name = "check_arkui_OH_ArkUI_Animator_Play" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_Animator_ResetAnimatorOption, .{ .name = "check_arkui_OH_ArkUI_Animator_ResetAnimatorOption" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_Animator_Reverse, .{ .name = "check_arkui_OH_ArkUI_Animator_Reverse" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_BarrierOption_Create, .{ .name = "check_arkui_OH_ArkUI_BarrierOption_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_BarrierOption_Dispose, .{ .name = "check_arkui_OH_ArkUI_BarrierOption_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_BarrierOption_GetDirection, .{ .name = "check_arkui_OH_ArkUI_BarrierOption_GetDirection" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_BarrierOption_GetId, .{ .name = "check_arkui_OH_ArkUI_BarrierOption_GetId" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_BarrierOption_GetReferencedId, .{ .name = "check_arkui_OH_ArkUI_BarrierOption_GetReferencedId" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_BarrierOption_GetReferencedIdSize, .{ .name = "check_arkui_OH_ArkUI_BarrierOption_GetReferencedIdSize" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_BarrierOption_SetDirection, .{ .name = "check_arkui_OH_ArkUI_BarrierOption_SetDirection" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_BarrierOption_SetId, .{ .name = "check_arkui_OH_ArkUI_BarrierOption_SetId" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_BarrierOption_SetReferencedId, .{ .name = "check_arkui_OH_ArkUI_BarrierOption_SetReferencedId" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_CancelDataLoading, .{ .name = "check_arkui_OH_ArkUI_CancelDataLoading" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_ContentTransitionEffect_Create, .{ .name = "check_arkui_OH_ArkUI_ContentTransitionEffect_Create" });
    }
    if (options.compile_check_api >= 14) {
        @export(&@import("arkui").native.OH_ArkUI_ConvertToHtml, .{ .name = "check_arkui_OH_ArkUI_ConvertToHtml" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CreateAsymmetricTransitionEffect, .{ .name = "check_arkui_OH_ArkUI_CreateAsymmetricTransitionEffect" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CreateDragActionWithContext, .{ .name = "check_arkui_OH_ArkUI_CreateDragActionWithContext" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CreateDragActionWithNode, .{ .name = "check_arkui_OH_ArkUI_CreateDragActionWithNode" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CreateDragPreviewOption, .{ .name = "check_arkui_OH_ArkUI_CreateDragPreviewOption" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CreateMovementTransitionEffect, .{ .name = "check_arkui_OH_ArkUI_CreateMovementTransitionEffect" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CreateOpacityTransitionEffect, .{ .name = "check_arkui_OH_ArkUI_CreateOpacityTransitionEffect" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CreateRotationTransitionEffect, .{ .name = "check_arkui_OH_ArkUI_CreateRotationTransitionEffect" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CreateScaleTransitionEffect, .{ .name = "check_arkui_OH_ArkUI_CreateScaleTransitionEffect" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_CreateSnapshotOptions, .{ .name = "check_arkui_OH_ArkUI_CreateSnapshotOptions" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CreateTranslationTransitionEffect, .{ .name = "check_arkui_OH_ArkUI_CreateTranslationTransitionEffect" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_CrossLanguageOption_Create, .{ .name = "check_arkui_OH_ArkUI_CrossLanguageOption_Create" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_CrossLanguageOption_Destroy, .{ .name = "check_arkui_OH_ArkUI_CrossLanguageOption_Destroy" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_CrossLanguageOption_GetAttributeSettingStatus, .{ .name = "check_arkui_OH_ArkUI_CrossLanguageOption_GetAttributeSettingStatus" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_CrossLanguageOption_SetAttributeSettingStatus, .{ .name = "check_arkui_OH_ArkUI_CrossLanguageOption_SetAttributeSettingStatus" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_Curve_CreateCubicBezierCurve, .{ .name = "check_arkui_OH_ArkUI_Curve_CreateCubicBezierCurve" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_Curve_CreateCurveByType, .{ .name = "check_arkui_OH_ArkUI_Curve_CreateCurveByType" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_Curve_CreateCustomCurve, .{ .name = "check_arkui_OH_ArkUI_Curve_CreateCustomCurve" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_Curve_CreateInterpolatingSpring, .{ .name = "check_arkui_OH_ArkUI_Curve_CreateInterpolatingSpring" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_Curve_CreateResponsiveSpringMotion, .{ .name = "check_arkui_OH_ArkUI_Curve_CreateResponsiveSpringMotion" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_Curve_CreateSpringCurve, .{ .name = "check_arkui_OH_ArkUI_Curve_CreateSpringCurve" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_Curve_CreateSpringMotion, .{ .name = "check_arkui_OH_ArkUI_Curve_CreateSpringMotion" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_Curve_CreateStepsCurve, .{ .name = "check_arkui_OH_ArkUI_Curve_CreateStepsCurve" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_Curve_DisposeCurve, .{ .name = "check_arkui_OH_ArkUI_Curve_DisposeCurve" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_CloseDialog, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_CloseDialog" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_CreateOptions, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_CreateOptions" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_DisposeOptions, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_DisposeOptions" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_GetState, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_GetState" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_OpenDialog, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_OpenDialog" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_RegisterOnDidAppearCallback, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_RegisterOnDidAppearCallback" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_RegisterOnDidDisappearCallback, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_RegisterOnDidDisappearCallback" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_RegisterOnWillAppearCallback, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_RegisterOnWillAppearCallback" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_RegisterOnWillDisappearCallback, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_RegisterOnWillDisappearCallback" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_RegisterOnWillDismissCallback, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_RegisterOnWillDismissCallback" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetAlignment, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetAlignment" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetAutoCancel, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetAutoCancel" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetBackgroundBlurStyle, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetBackgroundBlurStyle" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetBackgroundBlurStyleOptions, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetBackgroundBlurStyleOptions" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetBackgroundColor, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetBackgroundColor" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetBackgroundEffect, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetBackgroundEffect" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetBorderColor, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetBorderColor" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetBorderStyle, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetBorderStyle" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetBorderWidth, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetBorderWidth" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetCornerRadius, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetCornerRadius" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetCustomShadow, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetCustomShadow" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetHeight, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetHeight" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetHoverModeArea, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetHoverModeArea" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetHoverModeEnabled, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetHoverModeEnabled" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetImmersiveMode, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetImmersiveMode" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetKeyboardAvoidMode, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetKeyboardAvoidMode" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetLevelMode, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetLevelMode" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetLevelUniqueId, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetLevelUniqueId" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetMask, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetMask" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetModalMode, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetModalMode" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetShadow, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetShadow" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetSubwindowMode, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetSubwindowMode" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_SetWidth, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_SetWidth" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_CustomDialog_UpdateDialog, .{ .name = "check_arkui_OH_ArkUI_CustomDialog_UpdateDialog" });
    }
    if (options.compile_check_api >= 14) {
        @export(&@import("arkui").native.OH_ArkUI_CustomProperty_Destroy, .{ .name = "check_arkui_OH_ArkUI_CustomProperty_Destroy" });
    }
    if (options.compile_check_api >= 14) {
        @export(&@import("arkui").native.OH_ArkUI_CustomProperty_GetStringValue, .{ .name = "check_arkui_OH_ArkUI_CustomProperty_GetStringValue" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CustomSpanDrawInfo_Create, .{ .name = "check_arkui_OH_ArkUI_CustomSpanDrawInfo_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CustomSpanDrawInfo_Dispose, .{ .name = "check_arkui_OH_ArkUI_CustomSpanDrawInfo_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CustomSpanDrawInfo_GetBaseline, .{ .name = "check_arkui_OH_ArkUI_CustomSpanDrawInfo_GetBaseline" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CustomSpanDrawInfo_GetLineBottom, .{ .name = "check_arkui_OH_ArkUI_CustomSpanDrawInfo_GetLineBottom" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CustomSpanDrawInfo_GetLineTop, .{ .name = "check_arkui_OH_ArkUI_CustomSpanDrawInfo_GetLineTop" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CustomSpanDrawInfo_GetXOffset, .{ .name = "check_arkui_OH_ArkUI_CustomSpanDrawInfo_GetXOffset" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CustomSpanMeasureInfo_Create, .{ .name = "check_arkui_OH_ArkUI_CustomSpanMeasureInfo_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CustomSpanMeasureInfo_Dispose, .{ .name = "check_arkui_OH_ArkUI_CustomSpanMeasureInfo_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CustomSpanMeasureInfo_GetFontSize, .{ .name = "check_arkui_OH_ArkUI_CustomSpanMeasureInfo_GetFontSize" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CustomSpanMetrics_Create, .{ .name = "check_arkui_OH_ArkUI_CustomSpanMetrics_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CustomSpanMetrics_Dispose, .{ .name = "check_arkui_OH_ArkUI_CustomSpanMetrics_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CustomSpanMetrics_SetHeight, .{ .name = "check_arkui_OH_ArkUI_CustomSpanMetrics_SetHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_CustomSpanMetrics_SetWidth, .{ .name = "check_arkui_OH_ArkUI_CustomSpanMetrics_SetWidth" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_DestroySnapshotOptions, .{ .name = "check_arkui_OH_ArkUI_DestroySnapshotOptions" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DialogDismissEvent_GetDismissReason, .{ .name = "check_arkui_OH_ArkUI_DialogDismissEvent_GetDismissReason" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DialogDismissEvent_GetUserData, .{ .name = "check_arkui_OH_ArkUI_DialogDismissEvent_GetUserData" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DialogDismissEvent_SetShouldBlockDismiss, .{ .name = "check_arkui_OH_ArkUI_DialogDismissEvent_SetShouldBlockDismiss" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_DisableDropDataPrefetchOnNode, .{ .name = "check_arkui_OH_ArkUI_DisableDropDataPrefetchOnNode" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DisallowNodeAnyDropDataTypes, .{ .name = "check_arkui_OH_ArkUI_DisallowNodeAnyDropDataTypes" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragAction_Dispose, .{ .name = "check_arkui_OH_ArkUI_DragAction_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragAction_RegisterStatusListener, .{ .name = "check_arkui_OH_ArkUI_DragAction_RegisterStatusListener" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragAction_SetData, .{ .name = "check_arkui_OH_ArkUI_DragAction_SetData" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_DragAction_SetDataLoadParams, .{ .name = "check_arkui_OH_ArkUI_DragAction_SetDataLoadParams" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragAction_SetDragPreviewOption, .{ .name = "check_arkui_OH_ArkUI_DragAction_SetDragPreviewOption" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragAction_SetPixelMaps, .{ .name = "check_arkui_OH_ArkUI_DragAction_SetPixelMaps" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragAction_SetPointerId, .{ .name = "check_arkui_OH_ArkUI_DragAction_SetPointerId" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragAction_SetTouchPointX, .{ .name = "check_arkui_OH_ArkUI_DragAction_SetTouchPointX" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragAction_SetTouchPointY, .{ .name = "check_arkui_OH_ArkUI_DragAction_SetTouchPointY" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragAction_UnregisterStatusListener, .{ .name = "check_arkui_OH_ArkUI_DragAction_UnregisterStatusListener" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragAndDropInfo_GetDragEvent, .{ .name = "check_arkui_OH_ArkUI_DragAndDropInfo_GetDragEvent" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragAndDropInfo_GetDragStatus, .{ .name = "check_arkui_OH_ArkUI_DragAndDropInfo_GetDragStatus" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_DisableDefaultDropAnimation, .{ .name = "check_arkui_OH_ArkUI_DragEvent_DisableDefaultDropAnimation" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_GetDataTypeCount, .{ .name = "check_arkui_OH_ArkUI_DragEvent_GetDataTypeCount" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_GetDataTypes, .{ .name = "check_arkui_OH_ArkUI_DragEvent_GetDataTypes" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_GetDisplayId, .{ .name = "check_arkui_OH_ArkUI_DragEvent_GetDisplayId" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_GetDragResult, .{ .name = "check_arkui_OH_ArkUI_DragEvent_GetDragResult" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_GetDragSource, .{ .name = "check_arkui_OH_ArkUI_DragEvent_GetDragSource" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_GetDropOperation, .{ .name = "check_arkui_OH_ArkUI_DragEvent_GetDropOperation" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_GetModifierKeyStates, .{ .name = "check_arkui_OH_ArkUI_DragEvent_GetModifierKeyStates" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_GetPreviewRectHeight, .{ .name = "check_arkui_OH_ArkUI_DragEvent_GetPreviewRectHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_GetPreviewRectWidth, .{ .name = "check_arkui_OH_ArkUI_DragEvent_GetPreviewRectWidth" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_GetPreviewTouchPointX, .{ .name = "check_arkui_OH_ArkUI_DragEvent_GetPreviewTouchPointX" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_GetPreviewTouchPointY, .{ .name = "check_arkui_OH_ArkUI_DragEvent_GetPreviewTouchPointY" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_GetTouchPointXToDisplay, .{ .name = "check_arkui_OH_ArkUI_DragEvent_GetTouchPointXToDisplay" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_GetTouchPointXToGlobalDisplay, .{ .name = "check_arkui_OH_ArkUI_DragEvent_GetTouchPointXToGlobalDisplay" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_GetTouchPointXToWindow, .{ .name = "check_arkui_OH_ArkUI_DragEvent_GetTouchPointXToWindow" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_GetTouchPointYToDisplay, .{ .name = "check_arkui_OH_ArkUI_DragEvent_GetTouchPointYToDisplay" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_GetTouchPointYToGlobalDisplay, .{ .name = "check_arkui_OH_ArkUI_DragEvent_GetTouchPointYToGlobalDisplay" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_GetTouchPointYToWindow, .{ .name = "check_arkui_OH_ArkUI_DragEvent_GetTouchPointYToWindow" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_GetUdmfData, .{ .name = "check_arkui_OH_ArkUI_DragEvent_GetUdmfData" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_GetVelocity, .{ .name = "check_arkui_OH_ArkUI_DragEvent_GetVelocity" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_GetVelocityX, .{ .name = "check_arkui_OH_ArkUI_DragEvent_GetVelocityX" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_GetVelocityY, .{ .name = "check_arkui_OH_ArkUI_DragEvent_GetVelocityY" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_IsRemote, .{ .name = "check_arkui_OH_ArkUI_DragEvent_IsRemote" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_RequestDragEndPending, .{ .name = "check_arkui_OH_ArkUI_DragEvent_RequestDragEndPending" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_SetData, .{ .name = "check_arkui_OH_ArkUI_DragEvent_SetData" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_SetDataLoadParams, .{ .name = "check_arkui_OH_ArkUI_DragEvent_SetDataLoadParams" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_SetDragResult, .{ .name = "check_arkui_OH_ArkUI_DragEvent_SetDragResult" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_SetSuggestedDropOperation, .{ .name = "check_arkui_OH_ArkUI_DragEvent_SetSuggestedDropOperation" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_DragEvent_StartDataLoading, .{ .name = "check_arkui_OH_ArkUI_DragEvent_StartDataLoading" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragPreviewOption_Dispose, .{ .name = "check_arkui_OH_ArkUI_DragPreviewOption_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragPreviewOption_SetBadgeNumber, .{ .name = "check_arkui_OH_ArkUI_DragPreviewOption_SetBadgeNumber" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragPreviewOption_SetDefaultAnimationBeforeLiftingEnabled, .{ .name = "check_arkui_OH_ArkUI_DragPreviewOption_SetDefaultAnimationBeforeLiftingEnabled" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragPreviewOption_SetDefaultRadiusEnabled, .{ .name = "check_arkui_OH_ArkUI_DragPreviewOption_SetDefaultRadiusEnabled" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragPreviewOption_SetDefaultShadowEnabled, .{ .name = "check_arkui_OH_ArkUI_DragPreviewOption_SetDefaultShadowEnabled" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragPreviewOption_SetNumberBadgeEnabled, .{ .name = "check_arkui_OH_ArkUI_DragPreviewOption_SetNumberBadgeEnabled" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DragPreviewOption_SetScaleMode, .{ .name = "check_arkui_OH_ArkUI_DragPreviewOption_SetScaleMode" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DrawContext_GetCanvas, .{ .name = "check_arkui_OH_ArkUI_DrawContext_GetCanvas" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DrawContext_GetSize, .{ .name = "check_arkui_OH_ArkUI_DrawContext_GetSize" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_DrawableDescriptor_CreateAnimationController, .{ .name = "check_arkui_OH_ArkUI_DrawableDescriptor_CreateAnimationController" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DrawableDescriptor_CreateFromAnimatedPixelMap, .{ .name = "check_arkui_OH_ArkUI_DrawableDescriptor_CreateFromAnimatedPixelMap" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DrawableDescriptor_CreateFromPixelMap, .{ .name = "check_arkui_OH_ArkUI_DrawableDescriptor_CreateFromPixelMap" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DrawableDescriptor_Dispose, .{ .name = "check_arkui_OH_ArkUI_DrawableDescriptor_Dispose" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_DrawableDescriptor_DisposeAnimationController, .{ .name = "check_arkui_OH_ArkUI_DrawableDescriptor_DisposeAnimationController" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DrawableDescriptor_GetAnimatedPixelMapArray, .{ .name = "check_arkui_OH_ArkUI_DrawableDescriptor_GetAnimatedPixelMapArray" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DrawableDescriptor_GetAnimatedPixelMapArraySize, .{ .name = "check_arkui_OH_ArkUI_DrawableDescriptor_GetAnimatedPixelMapArraySize" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_DrawableDescriptor_GetAnimationAutoPlay, .{ .name = "check_arkui_OH_ArkUI_DrawableDescriptor_GetAnimationAutoPlay" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DrawableDescriptor_GetAnimationDuration, .{ .name = "check_arkui_OH_ArkUI_DrawableDescriptor_GetAnimationDuration" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_DrawableDescriptor_GetAnimationFrameDurations, .{ .name = "check_arkui_OH_ArkUI_DrawableDescriptor_GetAnimationFrameDurations" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DrawableDescriptor_GetAnimationIteration, .{ .name = "check_arkui_OH_ArkUI_DrawableDescriptor_GetAnimationIteration" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_DrawableDescriptor_GetAnimationStatus, .{ .name = "check_arkui_OH_ArkUI_DrawableDescriptor_GetAnimationStatus" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DrawableDescriptor_GetStaticPixelMap, .{ .name = "check_arkui_OH_ArkUI_DrawableDescriptor_GetStaticPixelMap" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_DrawableDescriptor_PauseAnimation, .{ .name = "check_arkui_OH_ArkUI_DrawableDescriptor_PauseAnimation" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_DrawableDescriptor_ResumeAnimation, .{ .name = "check_arkui_OH_ArkUI_DrawableDescriptor_ResumeAnimation" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_DrawableDescriptor_SetAnimationAutoPlay, .{ .name = "check_arkui_OH_ArkUI_DrawableDescriptor_SetAnimationAutoPlay" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DrawableDescriptor_SetAnimationDuration, .{ .name = "check_arkui_OH_ArkUI_DrawableDescriptor_SetAnimationDuration" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_DrawableDescriptor_SetAnimationFrameDurations, .{ .name = "check_arkui_OH_ArkUI_DrawableDescriptor_SetAnimationFrameDurations" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_DrawableDescriptor_SetAnimationIteration, .{ .name = "check_arkui_OH_ArkUI_DrawableDescriptor_SetAnimationIteration" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_DrawableDescriptor_StartAnimation, .{ .name = "check_arkui_OH_ArkUI_DrawableDescriptor_StartAnimation" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_DrawableDescriptor_StopAnimation, .{ .name = "check_arkui_OH_ArkUI_DrawableDescriptor_StopAnimation" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_EmbeddedComponentOption_Create, .{ .name = "check_arkui_OH_ArkUI_EmbeddedComponentOption_Create" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_EmbeddedComponentOption_Dispose, .{ .name = "check_arkui_OH_ArkUI_EmbeddedComponentOption_Dispose" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_EmbeddedComponentOption_SetOnError, .{ .name = "check_arkui_OH_ArkUI_EmbeddedComponentOption_SetOnError" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_EmbeddedComponentOption_SetOnTerminated, .{ .name = "check_arkui_OH_ArkUI_EmbeddedComponentOption_SetOnTerminated" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_EnableDropDisallowedBadge, .{ .name = "check_arkui_OH_ArkUI_EnableDropDisallowedBadge" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GestureEventTargetInfo_IsScrollBegin, .{ .name = "check_arkui_OH_ArkUI_GestureEventTargetInfo_IsScrollBegin" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GestureEventTargetInfo_IsScrollEnd, .{ .name = "check_arkui_OH_ArkUI_GestureEventTargetInfo_IsScrollEnd" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GestureEvent_GetActionType, .{ .name = "check_arkui_OH_ArkUI_GestureEvent_GetActionType" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GestureEvent_GetNode, .{ .name = "check_arkui_OH_ArkUI_GestureEvent_GetNode" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GestureEvent_GetRawInputEvent, .{ .name = "check_arkui_OH_ArkUI_GestureEvent_GetRawInputEvent" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GestureInterruptInfo_GetGestureEvent, .{ .name = "check_arkui_OH_ArkUI_GestureInterruptInfo_GetGestureEvent" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GestureInterruptInfo_GetRecognizer, .{ .name = "check_arkui_OH_ArkUI_GestureInterruptInfo_GetRecognizer" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GestureInterruptInfo_GetSystemFlag, .{ .name = "check_arkui_OH_ArkUI_GestureInterruptInfo_GetSystemFlag" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GestureInterruptInfo_GetSystemRecognizerType, .{ .name = "check_arkui_OH_ArkUI_GestureInterruptInfo_GetSystemRecognizerType" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_GestureInterruptInfo_GetTouchRecognizers, .{ .name = "check_arkui_OH_ArkUI_GestureInterruptInfo_GetTouchRecognizers" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("arkui").native.OH_ArkUI_GestureInterrupter_GetUserData, .{ .name = "check_arkui_OH_ArkUI_GestureInterrupter_GetUserData" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetContextByNode, .{ .name = "check_arkui_OH_ArkUI_GetContextByNode" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetContextFromNapiValue, .{ .name = "check_arkui_OH_ArkUI_GetContextFromNapiValue" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetGestureBindNodeId, .{ .name = "check_arkui_OH_ArkUI_GetGestureBindNodeId" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetGestureEventTargetInfo, .{ .name = "check_arkui_OH_ArkUI_GetGestureEventTargetInfo" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("arkui").native.OH_ArkUI_GetGestureParam_DirectMask, .{ .name = "check_arkui_OH_ArkUI_GetGestureParam_DirectMask" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("arkui").native.OH_ArkUI_GetGestureParam_FingerCount, .{ .name = "check_arkui_OH_ArkUI_GetGestureParam_FingerCount" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("arkui").native.OH_ArkUI_GetGestureParam_angle, .{ .name = "check_arkui_OH_ArkUI_GetGestureParam_angle" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("arkui").native.OH_ArkUI_GetGestureParam_distance, .{ .name = "check_arkui_OH_ArkUI_GetGestureParam_distance" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("arkui").native.OH_ArkUI_GetGestureParam_distanceThreshold, .{ .name = "check_arkui_OH_ArkUI_GetGestureParam_distanceThreshold" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("arkui").native.OH_ArkUI_GetGestureParam_duration, .{ .name = "check_arkui_OH_ArkUI_GetGestureParam_duration" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("arkui").native.OH_ArkUI_GetGestureParam_limitFingerCount, .{ .name = "check_arkui_OH_ArkUI_GetGestureParam_limitFingerCount" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("arkui").native.OH_ArkUI_GetGestureParam_repeat, .{ .name = "check_arkui_OH_ArkUI_GetGestureParam_repeat" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("arkui").native.OH_ArkUI_GetGestureParam_speed, .{ .name = "check_arkui_OH_ArkUI_GetGestureParam_speed" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetGestureRecognizerEnabled, .{ .name = "check_arkui_OH_ArkUI_GetGestureRecognizerEnabled" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetGestureRecognizerState, .{ .name = "check_arkui_OH_ArkUI_GetGestureRecognizerState" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetGestureTag, .{ .name = "check_arkui_OH_ArkUI_GetGestureTag" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetNavDestinationId, .{ .name = "check_arkui_OH_ArkUI_GetNavDestinationId" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetNavDestinationIndex, .{ .name = "check_arkui_OH_ArkUI_GetNavDestinationIndex" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetNavDestinationName, .{ .name = "check_arkui_OH_ArkUI_GetNavDestinationName" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetNavDestinationNameByIndex, .{ .name = "check_arkui_OH_ArkUI_GetNavDestinationNameByIndex" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetNavDestinationParam, .{ .name = "check_arkui_OH_ArkUI_GetNavDestinationParam" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetNavDestinationState, .{ .name = "check_arkui_OH_ArkUI_GetNavDestinationState" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetNavStackLength, .{ .name = "check_arkui_OH_ArkUI_GetNavStackLength" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetNavigationId, .{ .name = "check_arkui_OH_ArkUI_GetNavigationId" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetNodeContentFromNapiValue, .{ .name = "check_arkui_OH_ArkUI_GetNodeContentFromNapiValue" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetNodeHandleFromNapiValue, .{ .name = "check_arkui_OH_ArkUI_GetNodeHandleFromNapiValue" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_GetNodeSnapshot, .{ .name = "check_arkui_OH_ArkUI_GetNodeSnapshot" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetPanGestureDirectionMask, .{ .name = "check_arkui_OH_ArkUI_GetPanGestureDirectionMask" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetResponseRecognizersFromInterruptInfo, .{ .name = "check_arkui_OH_ArkUI_GetResponseRecognizersFromInterruptInfo" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetRouterPageId, .{ .name = "check_arkui_OH_ArkUI_GetRouterPageId" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetRouterPageIndex, .{ .name = "check_arkui_OH_ArkUI_GetRouterPageIndex" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetRouterPageName, .{ .name = "check_arkui_OH_ArkUI_GetRouterPageName" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetRouterPagePath, .{ .name = "check_arkui_OH_ArkUI_GetRouterPagePath" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GetRouterPageState, .{ .name = "check_arkui_OH_ArkUI_GetRouterPageState" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_GridLayoutOptions_Create, .{ .name = "check_arkui_OH_ArkUI_GridLayoutOptions_Create" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_GridLayoutOptions_Dispose, .{ .name = "check_arkui_OH_ArkUI_GridLayoutOptions_Dispose" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_GridLayoutOptions_GetIrregularIndexes, .{ .name = "check_arkui_OH_ArkUI_GridLayoutOptions_GetIrregularIndexes" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_GridLayoutOptions_RegisterGetIrregularSizeByIndexCallback, .{ .name = "check_arkui_OH_ArkUI_GridLayoutOptions_RegisterGetIrregularSizeByIndexCallback" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_GridLayoutOptions_RegisterGetRectByIndexCallback, .{ .name = "check_arkui_OH_ArkUI_GridLayoutOptions_RegisterGetRectByIndexCallback" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_GridLayoutOptions_SetIrregularIndexes, .{ .name = "check_arkui_OH_ArkUI_GridLayoutOptions_SetIrregularIndexes" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GuidelineOption_Create, .{ .name = "check_arkui_OH_ArkUI_GuidelineOption_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GuidelineOption_Dispose, .{ .name = "check_arkui_OH_ArkUI_GuidelineOption_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GuidelineOption_GetDirection, .{ .name = "check_arkui_OH_ArkUI_GuidelineOption_GetDirection" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GuidelineOption_GetId, .{ .name = "check_arkui_OH_ArkUI_GuidelineOption_GetId" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GuidelineOption_GetPositionEnd, .{ .name = "check_arkui_OH_ArkUI_GuidelineOption_GetPositionEnd" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GuidelineOption_GetPositionStart, .{ .name = "check_arkui_OH_ArkUI_GuidelineOption_GetPositionStart" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GuidelineOption_SetDirection, .{ .name = "check_arkui_OH_ArkUI_GuidelineOption_SetDirection" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GuidelineOption_SetId, .{ .name = "check_arkui_OH_ArkUI_GuidelineOption_SetId" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GuidelineOption_SetPositionEnd, .{ .name = "check_arkui_OH_ArkUI_GuidelineOption_SetPositionEnd" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_GuidelineOption_SetPositionStart, .{ .name = "check_arkui_OH_ArkUI_GuidelineOption_SetPositionStart" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_HostWindowInfo_Destroy, .{ .name = "check_arkui_OH_ArkUI_HostWindowInfo_Destroy" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_HostWindowInfo_GetName, .{ .name = "check_arkui_OH_ArkUI_HostWindowInfo_GetName" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ImageAnimatorFrameInfo_CreateFromDrawableDescriptor, .{ .name = "check_arkui_OH_ArkUI_ImageAnimatorFrameInfo_CreateFromDrawableDescriptor" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ImageAnimatorFrameInfo_CreateFromString, .{ .name = "check_arkui_OH_ArkUI_ImageAnimatorFrameInfo_CreateFromString" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ImageAnimatorFrameInfo_Dispose, .{ .name = "check_arkui_OH_ArkUI_ImageAnimatorFrameInfo_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ImageAnimatorFrameInfo_GetDuration, .{ .name = "check_arkui_OH_ArkUI_ImageAnimatorFrameInfo_GetDuration" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ImageAnimatorFrameInfo_GetHeight, .{ .name = "check_arkui_OH_ArkUI_ImageAnimatorFrameInfo_GetHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ImageAnimatorFrameInfo_GetLeft, .{ .name = "check_arkui_OH_ArkUI_ImageAnimatorFrameInfo_GetLeft" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ImageAnimatorFrameInfo_GetTop, .{ .name = "check_arkui_OH_ArkUI_ImageAnimatorFrameInfo_GetTop" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ImageAnimatorFrameInfo_GetWidth, .{ .name = "check_arkui_OH_ArkUI_ImageAnimatorFrameInfo_GetWidth" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ImageAnimatorFrameInfo_SetDuration, .{ .name = "check_arkui_OH_ArkUI_ImageAnimatorFrameInfo_SetDuration" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ImageAnimatorFrameInfo_SetHeight, .{ .name = "check_arkui_OH_ArkUI_ImageAnimatorFrameInfo_SetHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ImageAnimatorFrameInfo_SetLeft, .{ .name = "check_arkui_OH_ArkUI_ImageAnimatorFrameInfo_SetLeft" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ImageAnimatorFrameInfo_SetTop, .{ .name = "check_arkui_OH_ArkUI_ImageAnimatorFrameInfo_SetTop" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ImageAnimatorFrameInfo_SetWidth, .{ .name = "check_arkui_OH_ArkUI_ImageAnimatorFrameInfo_SetWidth" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_IsBuiltInGesture, .{ .name = "check_arkui_OH_ArkUI_IsBuiltInGesture" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_IsGestureRecognizerValid, .{ .name = "check_arkui_OH_ArkUI_IsGestureRecognizerValid" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_KeyframeAnimateOption_Create, .{ .name = "check_arkui_OH_ArkUI_KeyframeAnimateOption_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_KeyframeAnimateOption_Dispose, .{ .name = "check_arkui_OH_ArkUI_KeyframeAnimateOption_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_KeyframeAnimateOption_GetCurve, .{ .name = "check_arkui_OH_ArkUI_KeyframeAnimateOption_GetCurve" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_KeyframeAnimateOption_GetDelay, .{ .name = "check_arkui_OH_ArkUI_KeyframeAnimateOption_GetDelay" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_KeyframeAnimateOption_GetDuration, .{ .name = "check_arkui_OH_ArkUI_KeyframeAnimateOption_GetDuration" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_KeyframeAnimateOption_GetExpectedFrameRate, .{ .name = "check_arkui_OH_ArkUI_KeyframeAnimateOption_GetExpectedFrameRate" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_KeyframeAnimateOption_GetIterations, .{ .name = "check_arkui_OH_ArkUI_KeyframeAnimateOption_GetIterations" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_KeyframeAnimateOption_RegisterOnEventCallback, .{ .name = "check_arkui_OH_ArkUI_KeyframeAnimateOption_RegisterOnEventCallback" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_KeyframeAnimateOption_RegisterOnFinishCallback, .{ .name = "check_arkui_OH_ArkUI_KeyframeAnimateOption_RegisterOnFinishCallback" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_KeyframeAnimateOption_SetCurve, .{ .name = "check_arkui_OH_ArkUI_KeyframeAnimateOption_SetCurve" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_KeyframeAnimateOption_SetDelay, .{ .name = "check_arkui_OH_ArkUI_KeyframeAnimateOption_SetDelay" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_KeyframeAnimateOption_SetDuration, .{ .name = "check_arkui_OH_ArkUI_KeyframeAnimateOption_SetDuration" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_KeyframeAnimateOption_SetExpectedFrameRate, .{ .name = "check_arkui_OH_ArkUI_KeyframeAnimateOption_SetExpectedFrameRate" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_KeyframeAnimateOption_SetIterations, .{ .name = "check_arkui_OH_ArkUI_KeyframeAnimateOption_SetIterations" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_LayoutConstraint_Copy, .{ .name = "check_arkui_OH_ArkUI_LayoutConstraint_Copy" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_LayoutConstraint_Create, .{ .name = "check_arkui_OH_ArkUI_LayoutConstraint_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_LayoutConstraint_Dispose, .{ .name = "check_arkui_OH_ArkUI_LayoutConstraint_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_LayoutConstraint_GetMaxHeight, .{ .name = "check_arkui_OH_ArkUI_LayoutConstraint_GetMaxHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_LayoutConstraint_GetMaxWidth, .{ .name = "check_arkui_OH_ArkUI_LayoutConstraint_GetMaxWidth" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_LayoutConstraint_GetMinHeight, .{ .name = "check_arkui_OH_ArkUI_LayoutConstraint_GetMinHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_LayoutConstraint_GetMinWidth, .{ .name = "check_arkui_OH_ArkUI_LayoutConstraint_GetMinWidth" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_LayoutConstraint_GetPercentReferenceHeight, .{ .name = "check_arkui_OH_ArkUI_LayoutConstraint_GetPercentReferenceHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_LayoutConstraint_GetPercentReferenceWidth, .{ .name = "check_arkui_OH_ArkUI_LayoutConstraint_GetPercentReferenceWidth" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_LayoutConstraint_SetMaxHeight, .{ .name = "check_arkui_OH_ArkUI_LayoutConstraint_SetMaxHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_LayoutConstraint_SetMaxWidth, .{ .name = "check_arkui_OH_ArkUI_LayoutConstraint_SetMaxWidth" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_LayoutConstraint_SetMinHeight, .{ .name = "check_arkui_OH_ArkUI_LayoutConstraint_SetMinHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_LayoutConstraint_SetMinWidth, .{ .name = "check_arkui_OH_ArkUI_LayoutConstraint_SetMinWidth" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_LayoutConstraint_SetPercentReferenceHeight, .{ .name = "check_arkui_OH_ArkUI_LayoutConstraint_SetPercentReferenceHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_LayoutConstraint_SetPercentReferenceWidth, .{ .name = "check_arkui_OH_ArkUI_LayoutConstraint_SetPercentReferenceWidth" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListChildrenMainSizeOption_Create, .{ .name = "check_arkui_OH_ArkUI_ListChildrenMainSizeOption_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListChildrenMainSizeOption_Dispose, .{ .name = "check_arkui_OH_ArkUI_ListChildrenMainSizeOption_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListChildrenMainSizeOption_GetDefaultMainSize, .{ .name = "check_arkui_OH_ArkUI_ListChildrenMainSizeOption_GetDefaultMainSize" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListChildrenMainSizeOption_GetMainSize, .{ .name = "check_arkui_OH_ArkUI_ListChildrenMainSizeOption_GetMainSize" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListChildrenMainSizeOption_Resize, .{ .name = "check_arkui_OH_ArkUI_ListChildrenMainSizeOption_Resize" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListChildrenMainSizeOption_SetDefaultMainSize, .{ .name = "check_arkui_OH_ArkUI_ListChildrenMainSizeOption_SetDefaultMainSize" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListChildrenMainSizeOption_Splice, .{ .name = "check_arkui_OH_ArkUI_ListChildrenMainSizeOption_Splice" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListChildrenMainSizeOption_UpdateSize, .{ .name = "check_arkui_OH_ArkUI_ListChildrenMainSizeOption_UpdateSize" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListItemSwipeActionItem_Create, .{ .name = "check_arkui_OH_ArkUI_ListItemSwipeActionItem_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListItemSwipeActionItem_Dispose, .{ .name = "check_arkui_OH_ArkUI_ListItemSwipeActionItem_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListItemSwipeActionItem_GetActionAreaDistance, .{ .name = "check_arkui_OH_ArkUI_ListItemSwipeActionItem_GetActionAreaDistance" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListItemSwipeActionItem_SetActionAreaDistance, .{ .name = "check_arkui_OH_ArkUI_ListItemSwipeActionItem_SetActionAreaDistance" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListItemSwipeActionItem_SetContent, .{ .name = "check_arkui_OH_ArkUI_ListItemSwipeActionItem_SetContent" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListItemSwipeActionItem_SetOnActionWithUserData, .{ .name = "check_arkui_OH_ArkUI_ListItemSwipeActionItem_SetOnActionWithUserData" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListItemSwipeActionItem_SetOnEnterActionAreaWithUserData, .{ .name = "check_arkui_OH_ArkUI_ListItemSwipeActionItem_SetOnEnterActionAreaWithUserData" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListItemSwipeActionItem_SetOnExitActionAreaWithUserData, .{ .name = "check_arkui_OH_ArkUI_ListItemSwipeActionItem_SetOnExitActionAreaWithUserData" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListItemSwipeActionItem_SetOnStateChangeWithUserData, .{ .name = "check_arkui_OH_ArkUI_ListItemSwipeActionItem_SetOnStateChangeWithUserData" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListItemSwipeActionOption_Create, .{ .name = "check_arkui_OH_ArkUI_ListItemSwipeActionOption_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListItemSwipeActionOption_Dispose, .{ .name = "check_arkui_OH_ArkUI_ListItemSwipeActionOption_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListItemSwipeActionOption_GetEdgeEffect, .{ .name = "check_arkui_OH_ArkUI_ListItemSwipeActionOption_GetEdgeEffect" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListItemSwipeActionOption_SetEdgeEffect, .{ .name = "check_arkui_OH_ArkUI_ListItemSwipeActionOption_SetEdgeEffect" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListItemSwipeActionOption_SetEnd, .{ .name = "check_arkui_OH_ArkUI_ListItemSwipeActionOption_SetEnd" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListItemSwipeActionOption_SetOnOffsetChangeWithUserData, .{ .name = "check_arkui_OH_ArkUI_ListItemSwipeActionOption_SetOnOffsetChangeWithUserData" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ListItemSwipeActionOption_SetStart, .{ .name = "check_arkui_OH_ArkUI_ListItemSwipeActionOption_SetStart" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_ListItemSwipeAction_Collapse, .{ .name = "check_arkui_OH_ArkUI_ListItemSwipeAction_Collapse" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_ListItemSwipeAction_Expand, .{ .name = "check_arkui_OH_ArkUI_ListItemSwipeAction_Expand" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_List_CloseAllSwipeActions, .{ .name = "check_arkui_OH_ArkUI_List_CloseAllSwipeActions" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_LongPressGesture_GetAllowableMovement, .{ .name = "check_arkui_OH_ArkUI_LongPressGesture_GetAllowableMovement" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_LongPressGesture_SetAllowableMovement, .{ .name = "check_arkui_OH_ArkUI_LongPressGesture_SetAllowableMovement" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_LongPress_GetRepeatCount, .{ .name = "check_arkui_OH_ArkUI_LongPress_GetRepeatCount" });
    }
    if (options.compile_check_api >= 14) {
        @export(&@import("arkui").native.OH_ArkUI_MarshallStyledStringDescriptor, .{ .name = "check_arkui_OH_ArkUI_MarshallStyledStringDescriptor" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_NativeModule_AdoptChild, .{ .name = "check_arkui_OH_ArkUI_NativeModule_AdoptChild" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_NativeModule_InvalidateAttributes, .{ .name = "check_arkui_OH_ArkUI_NativeModule_InvalidateAttributes" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_NativeModule_RegisterCommonEvent, .{ .name = "check_arkui_OH_ArkUI_NativeModule_RegisterCommonEvent" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_NativeModule_RegisterCommonVisibleAreaApproximateChangeEvent, .{ .name = "check_arkui_OH_ArkUI_NativeModule_RegisterCommonVisibleAreaApproximateChangeEvent" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_NativeModule_RemoveAdoptedChild, .{ .name = "check_arkui_OH_ArkUI_NativeModule_RemoveAdoptedChild" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_NativeModule_UnregisterCommonEvent, .{ .name = "check_arkui_OH_ArkUI_NativeModule_UnregisterCommonEvent" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_NativeModule_UnregisterCommonVisibleAreaApproximateChangeEvent, .{ .name = "check_arkui_OH_ArkUI_NativeModule_UnregisterCommonVisibleAreaApproximateChangeEvent" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeAdapterEvent_GetHostNode, .{ .name = "check_arkui_OH_ArkUI_NodeAdapterEvent_GetHostNode" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeAdapterEvent_GetItemIndex, .{ .name = "check_arkui_OH_ArkUI_NodeAdapterEvent_GetItemIndex" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeAdapterEvent_GetRemovedNode, .{ .name = "check_arkui_OH_ArkUI_NodeAdapterEvent_GetRemovedNode" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeAdapterEvent_GetType, .{ .name = "check_arkui_OH_ArkUI_NodeAdapterEvent_GetType" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeAdapterEvent_GetUserData, .{ .name = "check_arkui_OH_ArkUI_NodeAdapterEvent_GetUserData" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeAdapterEvent_SetItem, .{ .name = "check_arkui_OH_ArkUI_NodeAdapterEvent_SetItem" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeAdapterEvent_SetNodeId, .{ .name = "check_arkui_OH_ArkUI_NodeAdapterEvent_SetNodeId" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeAdapter_Create, .{ .name = "check_arkui_OH_ArkUI_NodeAdapter_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeAdapter_Dispose, .{ .name = "check_arkui_OH_ArkUI_NodeAdapter_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeAdapter_GetAllItems, .{ .name = "check_arkui_OH_ArkUI_NodeAdapter_GetAllItems" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeAdapter_GetTotalNodeCount, .{ .name = "check_arkui_OH_ArkUI_NodeAdapter_GetTotalNodeCount" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeAdapter_InsertItem, .{ .name = "check_arkui_OH_ArkUI_NodeAdapter_InsertItem" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeAdapter_MoveItem, .{ .name = "check_arkui_OH_ArkUI_NodeAdapter_MoveItem" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeAdapter_RegisterEventReceiver, .{ .name = "check_arkui_OH_ArkUI_NodeAdapter_RegisterEventReceiver" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeAdapter_ReloadAllItems, .{ .name = "check_arkui_OH_ArkUI_NodeAdapter_ReloadAllItems" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeAdapter_ReloadItem, .{ .name = "check_arkui_OH_ArkUI_NodeAdapter_ReloadItem" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeAdapter_RemoveItem, .{ .name = "check_arkui_OH_ArkUI_NodeAdapter_RemoveItem" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeAdapter_SetTotalNodeCount, .{ .name = "check_arkui_OH_ArkUI_NodeAdapter_SetTotalNodeCount" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeAdapter_UnregisterEventReceiver, .{ .name = "check_arkui_OH_ArkUI_NodeAdapter_UnregisterEventReceiver" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeContentEvent_GetEventType, .{ .name = "check_arkui_OH_ArkUI_NodeContentEvent_GetEventType" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeContentEvent_GetNodeContentHandle, .{ .name = "check_arkui_OH_ArkUI_NodeContentEvent_GetNodeContentHandle" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeContent_GetUserData, .{ .name = "check_arkui_OH_ArkUI_NodeContent_GetUserData" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeContent_InsertNode, .{ .name = "check_arkui_OH_ArkUI_NodeContent_InsertNode" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeContent_RegisterCallback, .{ .name = "check_arkui_OH_ArkUI_NodeContent_RegisterCallback" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeContent_SetUserData, .{ .name = "check_arkui_OH_ArkUI_NodeContent_SetUserData" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeCustomEvent_GetCustomSpanDrawInfo, .{ .name = "check_arkui_OH_ArkUI_NodeCustomEvent_GetCustomSpanDrawInfo" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeCustomEvent_GetCustomSpanMeasureInfo, .{ .name = "check_arkui_OH_ArkUI_NodeCustomEvent_GetCustomSpanMeasureInfo" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeCustomEvent_GetDrawContextInDraw, .{ .name = "check_arkui_OH_ArkUI_NodeCustomEvent_GetDrawContextInDraw" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeCustomEvent_GetEventTargetId, .{ .name = "check_arkui_OH_ArkUI_NodeCustomEvent_GetEventTargetId" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeCustomEvent_GetEventType, .{ .name = "check_arkui_OH_ArkUI_NodeCustomEvent_GetEventType" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeCustomEvent_GetLayoutConstraintInMeasure, .{ .name = "check_arkui_OH_ArkUI_NodeCustomEvent_GetLayoutConstraintInMeasure" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeCustomEvent_GetNodeHandle, .{ .name = "check_arkui_OH_ArkUI_NodeCustomEvent_GetNodeHandle" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeCustomEvent_GetPositionInLayout, .{ .name = "check_arkui_OH_ArkUI_NodeCustomEvent_GetPositionInLayout" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeCustomEvent_GetUserData, .{ .name = "check_arkui_OH_ArkUI_NodeCustomEvent_GetUserData" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeCustomEvent_SetCustomSpanMetrics, .{ .name = "check_arkui_OH_ArkUI_NodeCustomEvent_SetCustomSpanMetrics" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeEvent_GetDragEvent, .{ .name = "check_arkui_OH_ArkUI_NodeEvent_GetDragEvent" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeEvent_GetEventType, .{ .name = "check_arkui_OH_ArkUI_NodeEvent_GetEventType" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeEvent_GetInputEvent, .{ .name = "check_arkui_OH_ArkUI_NodeEvent_GetInputEvent" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeEvent_GetNodeComponentEvent, .{ .name = "check_arkui_OH_ArkUI_NodeEvent_GetNodeComponentEvent" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeEvent_GetNodeHandle, .{ .name = "check_arkui_OH_ArkUI_NodeEvent_GetNodeHandle" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeEvent_GetNumberValue, .{ .name = "check_arkui_OH_ArkUI_NodeEvent_GetNumberValue" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeEvent_GetPreDragStatus, .{ .name = "check_arkui_OH_ArkUI_NodeEvent_GetPreDragStatus" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeEvent_GetStringAsyncEvent, .{ .name = "check_arkui_OH_ArkUI_NodeEvent_GetStringAsyncEvent" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeEvent_GetStringValue, .{ .name = "check_arkui_OH_ArkUI_NodeEvent_GetStringValue" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeEvent_GetTargetId, .{ .name = "check_arkui_OH_ArkUI_NodeEvent_GetTargetId" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_NodeEvent_GetTextChangeEvent, .{ .name = "check_arkui_OH_ArkUI_NodeEvent_GetTextChangeEvent" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_NodeEvent_GetTouchTestInfo, .{ .name = "check_arkui_OH_ArkUI_NodeEvent_GetTouchTestInfo" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeEvent_GetUserData, .{ .name = "check_arkui_OH_ArkUI_NodeEvent_GetUserData" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeEvent_SetReturnNumberValue, .{ .name = "check_arkui_OH_ArkUI_NodeEvent_SetReturnNumberValue" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_AddCustomProperty, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_AddCustomProperty" });
    }
    if (options.compile_check_api >= 14) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_GetActiveChildrenInfo, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_GetActiveChildrenInfo" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_GetAttachedNodeHandleById, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_GetAttachedNodeHandleById" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_GetChildWithExpandMode, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_GetChildWithExpandMode" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_GetCrossLanguageOption, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_GetCrossLanguageOption" });
    }
    if (options.compile_check_api >= 14) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_GetCurrentPageRootNode, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_GetCurrentPageRootNode" });
    }
    if (options.compile_check_api >= 14) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_GetCustomProperty, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_GetCustomProperty" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_GetFirstChildIndexWithoutExpand, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_GetFirstChildIndexWithoutExpand" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_GetLastChildIndexWithoutExpand, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_GetLastChildIndexWithoutExpand" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_GetLayoutPosition, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_GetLayoutPosition" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_GetLayoutPositionInGlobalDisplay, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_GetLayoutPositionInGlobalDisplay" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_GetLayoutPositionInScreen, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_GetLayoutPositionInScreen" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_GetLayoutPositionInWindow, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_GetLayoutPositionInWindow" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_GetLayoutSize, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_GetLayoutSize" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_GetNodeHandleByUniqueId, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_GetNodeHandleByUniqueId" });
    }
    if (options.compile_check_api >= 14) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_GetNodeType, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_GetNodeType" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_GetNodeUniqueId, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_GetNodeUniqueId" });
    }
    if (options.compile_check_api >= 14) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_GetParentInPageTree, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_GetParentInPageTree" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_GetPositionToParent, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_GetPositionToParent" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_GetPositionWithTranslateInScreen, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_GetPositionWithTranslateInScreen" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_GetPositionWithTranslateInWindow, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_GetPositionWithTranslateInWindow" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_GetWindowInfo, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_GetWindowInfo" });
    }
    if (options.compile_check_api >= 14) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_IsCreatedByNDK, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_IsCreatedByNDK" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_MoveTo, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_MoveTo" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_RemoveCustomProperty, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_RemoveCustomProperty" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_NodeUtils_SetCrossLanguageOption, .{ .name = "check_arkui_OH_ArkUI_NodeUtils_SetCrossLanguageOption" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_NotifyDragEndPendingDone, .{ .name = "check_arkui_OH_ArkUI_NotifyDragEndPendingDone" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_NotifyDragResult, .{ .name = "check_arkui_OH_ArkUI_NotifyDragResult" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_PanGesture_GetDistanceByToolType, .{ .name = "check_arkui_OH_ArkUI_PanGesture_GetDistanceByToolType" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_PanGesture_GetOffsetX, .{ .name = "check_arkui_OH_ArkUI_PanGesture_GetOffsetX" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_PanGesture_GetOffsetY, .{ .name = "check_arkui_OH_ArkUI_PanGesture_GetOffsetY" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_PanGesture_GetVelocity, .{ .name = "check_arkui_OH_ArkUI_PanGesture_GetVelocity" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_PanGesture_GetVelocityX, .{ .name = "check_arkui_OH_ArkUI_PanGesture_GetVelocityX" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_PanGesture_GetVelocityY, .{ .name = "check_arkui_OH_ArkUI_PanGesture_GetVelocityY" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_PanGesture_SetDistanceMap, .{ .name = "check_arkui_OH_ArkUI_PanGesture_SetDistanceMap" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ParallelInnerGestureEvent_GetConflictRecognizers, .{ .name = "check_arkui_OH_ArkUI_ParallelInnerGestureEvent_GetConflictRecognizers" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ParallelInnerGestureEvent_GetCurrentRecognizer, .{ .name = "check_arkui_OH_ArkUI_ParallelInnerGestureEvent_GetCurrentRecognizer" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_ParallelInnerGestureEvent_GetUserData, .{ .name = "check_arkui_OH_ArkUI_ParallelInnerGestureEvent_GetUserData" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_PinchGesture_GetCenterX, .{ .name = "check_arkui_OH_ArkUI_PinchGesture_GetCenterX" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_PinchGesture_GetCenterY, .{ .name = "check_arkui_OH_ArkUI_PinchGesture_GetCenterY" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_PinchGesture_GetScale, .{ .name = "check_arkui_OH_ArkUI_PinchGesture_GetScale" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_PixelRoundPolicy_Create, .{ .name = "check_arkui_OH_ArkUI_PixelRoundPolicy_Create" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_PixelRoundPolicy_Dispose, .{ .name = "check_arkui_OH_ArkUI_PixelRoundPolicy_Dispose" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_PixelRoundPolicy_GetBottom, .{ .name = "check_arkui_OH_ArkUI_PixelRoundPolicy_GetBottom" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_PixelRoundPolicy_GetEnd, .{ .name = "check_arkui_OH_ArkUI_PixelRoundPolicy_GetEnd" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_PixelRoundPolicy_GetStart, .{ .name = "check_arkui_OH_ArkUI_PixelRoundPolicy_GetStart" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_PixelRoundPolicy_GetTop, .{ .name = "check_arkui_OH_ArkUI_PixelRoundPolicy_GetTop" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_PixelRoundPolicy_SetBottom, .{ .name = "check_arkui_OH_ArkUI_PixelRoundPolicy_SetBottom" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_PixelRoundPolicy_SetEnd, .{ .name = "check_arkui_OH_ArkUI_PixelRoundPolicy_SetEnd" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_PixelRoundPolicy_SetStart, .{ .name = "check_arkui_OH_ArkUI_PixelRoundPolicy_SetStart" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_PixelRoundPolicy_SetTop, .{ .name = "check_arkui_OH_ArkUI_PixelRoundPolicy_SetTop" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_PositionEdges_Copy, .{ .name = "check_arkui_OH_ArkUI_PositionEdges_Copy" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_PositionEdges_Create, .{ .name = "check_arkui_OH_ArkUI_PositionEdges_Create" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_PositionEdges_Dispose, .{ .name = "check_arkui_OH_ArkUI_PositionEdges_Dispose" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_PositionEdges_GetBottom, .{ .name = "check_arkui_OH_ArkUI_PositionEdges_GetBottom" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_PositionEdges_GetLeft, .{ .name = "check_arkui_OH_ArkUI_PositionEdges_GetLeft" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_PositionEdges_GetRight, .{ .name = "check_arkui_OH_ArkUI_PositionEdges_GetRight" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_PositionEdges_GetTop, .{ .name = "check_arkui_OH_ArkUI_PositionEdges_GetTop" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_PositionEdges_SetBottom, .{ .name = "check_arkui_OH_ArkUI_PositionEdges_SetBottom" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_PositionEdges_SetLeft, .{ .name = "check_arkui_OH_ArkUI_PositionEdges_SetLeft" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_PositionEdges_SetRight, .{ .name = "check_arkui_OH_ArkUI_PositionEdges_SetRight" });
    }
    if (options.compile_check_api >= 21) {
        @export(&@import("arkui").native.OH_ArkUI_PositionEdges_SetTop, .{ .name = "check_arkui_OH_ArkUI_PositionEdges_SetTop" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_PostAsyncUITask, .{ .name = "check_arkui_OH_ArkUI_PostAsyncUITask" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("arkui").native.OH_ArkUI_PostFrameCallback, .{ .name = "check_arkui_OH_ArkUI_PostFrameCallback" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_PostIdleCallback, .{ .name = "check_arkui_OH_ArkUI_PostIdleCallback" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_PostUITask, .{ .name = "check_arkui_OH_ArkUI_PostUITask" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_PostUITaskAndWait, .{ .name = "check_arkui_OH_ArkUI_PostUITaskAndWait" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_PreventGestureRecognizerBegin, .{ .name = "check_arkui_OH_ArkUI_PreventGestureRecognizerBegin" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_ProgressLinearStyleOption_Create, .{ .name = "check_arkui_OH_ArkUI_ProgressLinearStyleOption_Create" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_ProgressLinearStyleOption_Destroy, .{ .name = "check_arkui_OH_ArkUI_ProgressLinearStyleOption_Destroy" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_ProgressLinearStyleOption_GetScanEffectEnabled, .{ .name = "check_arkui_OH_ArkUI_ProgressLinearStyleOption_GetScanEffectEnabled" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_ProgressLinearStyleOption_GetSmoothEffectEnabled, .{ .name = "check_arkui_OH_ArkUI_ProgressLinearStyleOption_GetSmoothEffectEnabled" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_ProgressLinearStyleOption_GetStrokeRadius, .{ .name = "check_arkui_OH_ArkUI_ProgressLinearStyleOption_GetStrokeRadius" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_ProgressLinearStyleOption_GetStrokeWidth, .{ .name = "check_arkui_OH_ArkUI_ProgressLinearStyleOption_GetStrokeWidth" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_ProgressLinearStyleOption_SetScanEffectEnabled, .{ .name = "check_arkui_OH_ArkUI_ProgressLinearStyleOption_SetScanEffectEnabled" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_ProgressLinearStyleOption_SetSmoothEffectEnabled, .{ .name = "check_arkui_OH_ArkUI_ProgressLinearStyleOption_SetSmoothEffectEnabled" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_ProgressLinearStyleOption_SetStrokeRadius, .{ .name = "check_arkui_OH_ArkUI_ProgressLinearStyleOption_SetStrokeRadius" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_ProgressLinearStyleOption_SetStrokeWidth, .{ .name = "check_arkui_OH_ArkUI_ProgressLinearStyleOption_SetStrokeWidth" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_RegisterDrawCallbackOnNodeHandle, .{ .name = "check_arkui_OH_ArkUI_RegisterDrawCallbackOnNodeHandle" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_RegisterLayoutCallbackOnNodeHandle, .{ .name = "check_arkui_OH_ArkUI_RegisterLayoutCallbackOnNodeHandle" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_RegisterSystemColorModeChangeEvent, .{ .name = "check_arkui_OH_ArkUI_RegisterSystemColorModeChangeEvent" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_RegisterSystemFontStyleChangeEvent, .{ .name = "check_arkui_OH_ArkUI_RegisterSystemFontStyleChangeEvent" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_RemoveSupportedUIStates, .{ .name = "check_arkui_OH_ArkUI_RemoveSupportedUIStates" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_RotationGesture_GetAngle, .{ .name = "check_arkui_OH_ArkUI_RotationGesture_GetAngle" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_RunTaskInScope, .{ .name = "check_arkui_OH_ArkUI_RunTaskInScope" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SetArkUIGestureRecognizerDisposeNotify, .{ .name = "check_arkui_OH_ArkUI_SetArkUIGestureRecognizerDisposeNotify" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SetDragEventStrictReportWithContext, .{ .name = "check_arkui_OH_ArkUI_SetDragEventStrictReportWithContext" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SetDragEventStrictReportWithNode, .{ .name = "check_arkui_OH_ArkUI_SetDragEventStrictReportWithNode" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_SetForceDarkConfig, .{ .name = "check_arkui_OH_ArkUI_SetForceDarkConfig" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SetGestureRecognizerEnabled, .{ .name = "check_arkui_OH_ArkUI_SetGestureRecognizerEnabled" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_SetGestureRecognizerLimitFingerCount, .{ .name = "check_arkui_OH_ArkUI_SetGestureRecognizerLimitFingerCount" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SetNodeAllowedDropDataTypes, .{ .name = "check_arkui_OH_ArkUI_SetNodeAllowedDropDataTypes" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SetNodeDragPreview, .{ .name = "check_arkui_OH_ArkUI_SetNodeDragPreview" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SetNodeDragPreviewOption, .{ .name = "check_arkui_OH_ArkUI_SetNodeDragPreviewOption" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SetNodeDraggable, .{ .name = "check_arkui_OH_ArkUI_SetNodeDraggable" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui").native.OH_ArkUI_SetTouchTestDoneCallback, .{ .name = "check_arkui_OH_ArkUI_SetTouchTestDoneCallback" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_ShowCounterConfig_Create, .{ .name = "check_arkui_OH_ArkUI_ShowCounterConfig_Create" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_ShowCounterConfig_Dispose, .{ .name = "check_arkui_OH_ArkUI_ShowCounterConfig_Dispose" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_ShowCounterConfig_GetCounterTextColor, .{ .name = "check_arkui_OH_ArkUI_ShowCounterConfig_GetCounterTextColor" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_ShowCounterConfig_GetCounterTextOverflowColor, .{ .name = "check_arkui_OH_ArkUI_ShowCounterConfig_GetCounterTextOverflowColor" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_ShowCounterConfig_SetCounterTextColor, .{ .name = "check_arkui_OH_ArkUI_ShowCounterConfig_SetCounterTextColor" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_ShowCounterConfig_SetCounterTextOverflowColor, .{ .name = "check_arkui_OH_ArkUI_ShowCounterConfig_SetCounterTextOverflowColor" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_SnapshotOptions_SetScale, .{ .name = "check_arkui_OH_ArkUI_SnapshotOptions_SetScale" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_StartDrag, .{ .name = "check_arkui_OH_ArkUI_StartDrag" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_StyledString_AddPlaceholder, .{ .name = "check_arkui_OH_ArkUI_StyledString_AddPlaceholder" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_StyledString_AddText, .{ .name = "check_arkui_OH_ArkUI_StyledString_AddText" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_StyledString_Create, .{ .name = "check_arkui_OH_ArkUI_StyledString_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_StyledString_CreateTypography, .{ .name = "check_arkui_OH_ArkUI_StyledString_CreateTypography" });
    }
    if (options.compile_check_api >= 14) {
        @export(&@import("arkui").native.OH_ArkUI_StyledString_Descriptor_Create, .{ .name = "check_arkui_OH_ArkUI_StyledString_Descriptor_Create" });
    }
    if (options.compile_check_api >= 14) {
        @export(&@import("arkui").native.OH_ArkUI_StyledString_Descriptor_Destroy, .{ .name = "check_arkui_OH_ArkUI_StyledString_Descriptor_Destroy" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_StyledString_Destroy, .{ .name = "check_arkui_OH_ArkUI_StyledString_Destroy" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_StyledString_PopTextStyle, .{ .name = "check_arkui_OH_ArkUI_StyledString_PopTextStyle" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_StyledString_PushTextStyle, .{ .name = "check_arkui_OH_ArkUI_StyledString_PushTextStyle" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwipeGesture_GetAngle, .{ .name = "check_arkui_OH_ArkUI_SwipeGesture_GetAngle" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwipeGesture_GetVelocity, .{ .name = "check_arkui_OH_ArkUI_SwipeGesture_GetVelocity" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperArrowStyle_Create, .{ .name = "check_arkui_OH_ArkUI_SwiperArrowStyle_Create" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperArrowStyle_Destroy, .{ .name = "check_arkui_OH_ArkUI_SwiperArrowStyle_Destroy" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperArrowStyle_GetArrowColor, .{ .name = "check_arkui_OH_ArkUI_SwiperArrowStyle_GetArrowColor" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperArrowStyle_GetArrowSize, .{ .name = "check_arkui_OH_ArkUI_SwiperArrowStyle_GetArrowSize" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperArrowStyle_GetBackgroundColor, .{ .name = "check_arkui_OH_ArkUI_SwiperArrowStyle_GetBackgroundColor" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperArrowStyle_GetBackgroundSize, .{ .name = "check_arkui_OH_ArkUI_SwiperArrowStyle_GetBackgroundSize" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperArrowStyle_GetShowBackground, .{ .name = "check_arkui_OH_ArkUI_SwiperArrowStyle_GetShowBackground" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperArrowStyle_GetShowSidebarMiddle, .{ .name = "check_arkui_OH_ArkUI_SwiperArrowStyle_GetShowSidebarMiddle" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperArrowStyle_SetArrowColor, .{ .name = "check_arkui_OH_ArkUI_SwiperArrowStyle_SetArrowColor" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperArrowStyle_SetArrowSize, .{ .name = "check_arkui_OH_ArkUI_SwiperArrowStyle_SetArrowSize" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperArrowStyle_SetBackgroundColor, .{ .name = "check_arkui_OH_ArkUI_SwiperArrowStyle_SetBackgroundColor" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperArrowStyle_SetBackgroundSize, .{ .name = "check_arkui_OH_ArkUI_SwiperArrowStyle_SetBackgroundSize" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperArrowStyle_SetShowBackground, .{ .name = "check_arkui_OH_ArkUI_SwiperArrowStyle_SetShowBackground" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperArrowStyle_SetShowSidebarMiddle, .{ .name = "check_arkui_OH_ArkUI_SwiperArrowStyle_SetShowSidebarMiddle" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_Create, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_Create" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_Destroy, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_Destroy" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_GetBottomPosition, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_GetBottomPosition" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_GetEndPosition, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_GetEndPosition" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_GetFontColor, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_GetFontColor" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_GetFontSize, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_GetFontSize" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_GetFontWeight, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_GetFontWeight" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_GetIgnoreSizeOfBottom, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_GetIgnoreSizeOfBottom" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_GetSelectedFontColor, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_GetSelectedFontColor" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_GetSelectedFontSize, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_GetSelectedFontSize" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_GetSelectedFontWeight, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_GetSelectedFontWeight" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_GetStartPosition, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_GetStartPosition" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_GetTopPosition, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_GetTopPosition" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_SetBottomPosition, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_SetBottomPosition" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_SetEndPosition, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_SetEndPosition" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_SetFontColor, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_SetFontColor" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_SetFontSize, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_SetFontSize" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_SetFontWeight, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_SetFontWeight" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_SetIgnoreSizeOfBottom, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_SetIgnoreSizeOfBottom" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_SetSelectedFontColor, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_SetSelectedFontColor" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_SetSelectedFontSize, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_SetSelectedFontSize" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_SetSelectedFontWeight, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_SetSelectedFontWeight" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_SetStartPosition, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_SetStartPosition" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperDigitIndicator_SetTopPosition, .{ .name = "check_arkui_OH_ArkUI_SwiperDigitIndicator_SetTopPosition" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_Create, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_Dispose, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_GetBottomPosition, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_GetBottomPosition" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_GetColor, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_GetColor" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_GetEndPosition, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_GetEndPosition" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_GetIgnoreSizeOfBottom, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_GetIgnoreSizeOfBottom" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_GetItemHeight, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_GetItemHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_GetItemWidth, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_GetItemWidth" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_GetMask, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_GetMask" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_GetMaxDisplayCount, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_GetMaxDisplayCount" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_GetSelectedColor, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_GetSelectedColor" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_GetSelectedItemHeight, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_GetSelectedItemHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_GetSelectedItemWidth, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_GetSelectedItemWidth" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_GetSpace, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_GetSpace" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_GetStartPosition, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_GetStartPosition" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_GetTopPosition, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_GetTopPosition" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_SetBottomPosition, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_SetBottomPosition" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_SetColor, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_SetColor" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_SetEndPosition, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_SetEndPosition" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_SetIgnoreSizeOfBottom, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_SetIgnoreSizeOfBottom" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_SetItemHeight, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_SetItemHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_SetItemWidth, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_SetItemWidth" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_SetMask, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_SetMask" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_SetMaxDisplayCount, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_SetMaxDisplayCount" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_SetSelectedColor, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_SetSelectedColor" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_SetSelectedItemHeight, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_SetSelectedItemHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_SetSelectedItemWidth, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_SetSelectedItemWidth" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_SetSpace, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_SetSpace" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_SetStartPosition, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_SetStartPosition" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SwiperIndicator_SetTopPosition, .{ .name = "check_arkui_OH_ArkUI_SwiperIndicator_SetTopPosition" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_Swiper_FinishAnimation, .{ .name = "check_arkui_OH_ArkUI_Swiper_FinishAnimation" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SystemFontStyleEvent_GetFontSizeScale, .{ .name = "check_arkui_OH_ArkUI_SystemFontStyleEvent_GetFontSizeScale" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_SystemFontStyleEvent_GetFontWeightScale, .{ .name = "check_arkui_OH_ArkUI_SystemFontStyleEvent_GetFontWeightScale" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_TextCascadePickerRangeContentArray_Create, .{ .name = "check_arkui_OH_ArkUI_TextCascadePickerRangeContentArray_Create" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_TextCascadePickerRangeContentArray_Destroy, .{ .name = "check_arkui_OH_ArkUI_TextCascadePickerRangeContentArray_Destroy" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_TextCascadePickerRangeContentArray_SetChildAtIndex, .{ .name = "check_arkui_OH_ArkUI_TextCascadePickerRangeContentArray_SetChildAtIndex" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_TextCascadePickerRangeContentArray_SetTextAtIndex, .{ .name = "check_arkui_OH_ArkUI_TextCascadePickerRangeContentArray_SetTextAtIndex" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextEditMenuOptions_Create, .{ .name = "check_arkui_OH_ArkUI_TextEditMenuOptions_Create" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextEditMenuOptions_Dispose, .{ .name = "check_arkui_OH_ArkUI_TextEditMenuOptions_Dispose" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextEditMenuOptions_RegisterOnCreateMenuCallback, .{ .name = "check_arkui_OH_ArkUI_TextEditMenuOptions_RegisterOnCreateMenuCallback" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextEditMenuOptions_RegisterOnMenuItemClickCallback, .{ .name = "check_arkui_OH_ArkUI_TextEditMenuOptions_RegisterOnMenuItemClickCallback" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextEditMenuOptions_RegisterOnPrepareMenuCallback, .{ .name = "check_arkui_OH_ArkUI_TextEditMenuOptions_RegisterOnPrepareMenuCallback" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextLayoutManager_Dispose, .{ .name = "check_arkui_OH_ArkUI_TextLayoutManager_Dispose" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextLayoutManager_GetGlyphPositionAtCoordinate, .{ .name = "check_arkui_OH_ArkUI_TextLayoutManager_GetGlyphPositionAtCoordinate" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextLayoutManager_GetLineCount, .{ .name = "check_arkui_OH_ArkUI_TextLayoutManager_GetLineCount" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextLayoutManager_GetLineMetrics, .{ .name = "check_arkui_OH_ArkUI_TextLayoutManager_GetLineMetrics" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextLayoutManager_GetRectsForRange, .{ .name = "check_arkui_OH_ArkUI_TextLayoutManager_GetRectsForRange" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextMenuItemArray_Clear, .{ .name = "check_arkui_OH_ArkUI_TextMenuItemArray_Clear" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextMenuItemArray_Erase, .{ .name = "check_arkui_OH_ArkUI_TextMenuItemArray_Erase" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextMenuItemArray_GetItem, .{ .name = "check_arkui_OH_ArkUI_TextMenuItemArray_GetItem" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextMenuItemArray_GetSize, .{ .name = "check_arkui_OH_ArkUI_TextMenuItemArray_GetSize" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextMenuItemArray_Insert, .{ .name = "check_arkui_OH_ArkUI_TextMenuItemArray_Insert" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextMenuItem_Create, .{ .name = "check_arkui_OH_ArkUI_TextMenuItem_Create" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextMenuItem_Dispose, .{ .name = "check_arkui_OH_ArkUI_TextMenuItem_Dispose" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextMenuItem_GetContent, .{ .name = "check_arkui_OH_ArkUI_TextMenuItem_GetContent" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextMenuItem_GetIcon, .{ .name = "check_arkui_OH_ArkUI_TextMenuItem_GetIcon" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextMenuItem_GetId, .{ .name = "check_arkui_OH_ArkUI_TextMenuItem_GetId" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextMenuItem_GetLabelInfo, .{ .name = "check_arkui_OH_ArkUI_TextMenuItem_GetLabelInfo" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextMenuItem_SetContent, .{ .name = "check_arkui_OH_ArkUI_TextMenuItem_SetContent" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextMenuItem_SetIcon, .{ .name = "check_arkui_OH_ArkUI_TextMenuItem_SetIcon" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextMenuItem_SetId, .{ .name = "check_arkui_OH_ArkUI_TextMenuItem_SetId" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextMenuItem_SetLabelInfo, .{ .name = "check_arkui_OH_ArkUI_TextMenuItem_SetLabelInfo" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_TextPickerRangeContentArray_Create, .{ .name = "check_arkui_OH_ArkUI_TextPickerRangeContentArray_Create" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_TextPickerRangeContentArray_Destroy, .{ .name = "check_arkui_OH_ArkUI_TextPickerRangeContentArray_Destroy" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_TextPickerRangeContentArray_SetIconAtIndex, .{ .name = "check_arkui_OH_ArkUI_TextPickerRangeContentArray_SetIconAtIndex" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("arkui").native.OH_ArkUI_TextPickerRangeContentArray_SetTextAtIndex, .{ .name = "check_arkui_OH_ArkUI_TextPickerRangeContentArray_SetTextAtIndex" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextSelectionMenuOptions_Create, .{ .name = "check_arkui_OH_ArkUI_TextSelectionMenuOptions_Create" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextSelectionMenuOptions_Dispose, .{ .name = "check_arkui_OH_ArkUI_TextSelectionMenuOptions_Dispose" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextSelectionMenuOptions_GetContentNode, .{ .name = "check_arkui_OH_ArkUI_TextSelectionMenuOptions_GetContentNode" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextSelectionMenuOptions_GetResponseType, .{ .name = "check_arkui_OH_ArkUI_TextSelectionMenuOptions_GetResponseType" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextSelectionMenuOptions_GetSpanType, .{ .name = "check_arkui_OH_ArkUI_TextSelectionMenuOptions_GetSpanType" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextSelectionMenuOptions_RegisterOnMenuHideCallback, .{ .name = "check_arkui_OH_ArkUI_TextSelectionMenuOptions_RegisterOnMenuHideCallback" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextSelectionMenuOptions_RegisterOnMenuShowCallback, .{ .name = "check_arkui_OH_ArkUI_TextSelectionMenuOptions_RegisterOnMenuShowCallback" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextSelectionMenuOptions_SetContentNode, .{ .name = "check_arkui_OH_ArkUI_TextSelectionMenuOptions_SetContentNode" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextSelectionMenuOptions_SetResponseType, .{ .name = "check_arkui_OH_ArkUI_TextSelectionMenuOptions_SetResponseType" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TextSelectionMenuOptions_SetSpanType, .{ .name = "check_arkui_OH_ArkUI_TextSelectionMenuOptions_SetSpanType" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_TouchRecognizer_CancelTouch, .{ .name = "check_arkui_OH_ArkUI_TouchRecognizer_CancelTouch" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_TouchRecognizer_GetNodeHandle, .{ .name = "check_arkui_OH_ArkUI_TouchRecognizer_GetNodeHandle" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TouchTestInfoItem_GetChildId, .{ .name = "check_arkui_OH_ArkUI_TouchTestInfoItem_GetChildId" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TouchTestInfoItem_GetChildRect, .{ .name = "check_arkui_OH_ArkUI_TouchTestInfoItem_GetChildRect" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TouchTestInfoItem_GetWindowX, .{ .name = "check_arkui_OH_ArkUI_TouchTestInfoItem_GetWindowX" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TouchTestInfoItem_GetWindowY, .{ .name = "check_arkui_OH_ArkUI_TouchTestInfoItem_GetWindowY" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TouchTestInfoItem_GetX, .{ .name = "check_arkui_OH_ArkUI_TouchTestInfoItem_GetX" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TouchTestInfoItem_GetXRelativeToParent, .{ .name = "check_arkui_OH_ArkUI_TouchTestInfoItem_GetXRelativeToParent" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TouchTestInfoItem_GetY, .{ .name = "check_arkui_OH_ArkUI_TouchTestInfoItem_GetY" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TouchTestInfoItem_GetYRelativeToParent, .{ .name = "check_arkui_OH_ArkUI_TouchTestInfoItem_GetYRelativeToParent" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TouchTestInfo_GetTouchTestInfoList, .{ .name = "check_arkui_OH_ArkUI_TouchTestInfo_GetTouchTestInfoList" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TouchTestInfo_SetTouchResultId, .{ .name = "check_arkui_OH_ArkUI_TouchTestInfo_SetTouchResultId" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_TouchTestInfo_SetTouchResultStrategy, .{ .name = "check_arkui_OH_ArkUI_TouchTestInfo_SetTouchResultStrategy" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_TransitionEffect_Combine, .{ .name = "check_arkui_OH_ArkUI_TransitionEffect_Combine" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_TransitionEffect_Dispose, .{ .name = "check_arkui_OH_ArkUI_TransitionEffect_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_TransitionEffect_SetAnimation, .{ .name = "check_arkui_OH_ArkUI_TransitionEffect_SetAnimation" });
    }
    if (options.compile_check_api >= 14) {
        @export(&@import("arkui").native.OH_ArkUI_UnmarshallStyledStringDescriptor, .{ .name = "check_arkui_OH_ArkUI_UnmarshallStyledStringDescriptor" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_UnregisterDrawCallbackOnNodeHandle, .{ .name = "check_arkui_OH_ArkUI_UnregisterDrawCallbackOnNodeHandle" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui").native.OH_ArkUI_UnregisterLayoutCallbackOnNodeHandle, .{ .name = "check_arkui_OH_ArkUI_UnregisterLayoutCallbackOnNodeHandle" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_UnregisterSystemColorModeChangeEvent, .{ .name = "check_arkui_OH_ArkUI_UnregisterSystemColorModeChangeEvent" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_UnregisterSystemFontStyleChangeEvent, .{ .name = "check_arkui_OH_ArkUI_UnregisterSystemFontStyleChangeEvent" });
    }
    if (options.compile_check_api >= 17) {
        @export(&@import("arkui").native.OH_ArkUI_VisibleAreaEventOptions_Create, .{ .name = "check_arkui_OH_ArkUI_VisibleAreaEventOptions_Create" });
    }
    if (options.compile_check_api >= 17) {
        @export(&@import("arkui").native.OH_ArkUI_VisibleAreaEventOptions_Dispose, .{ .name = "check_arkui_OH_ArkUI_VisibleAreaEventOptions_Dispose" });
    }
    if (options.compile_check_api >= 17) {
        @export(&@import("arkui").native.OH_ArkUI_VisibleAreaEventOptions_GetExpectedUpdateInterval, .{ .name = "check_arkui_OH_ArkUI_VisibleAreaEventOptions_GetExpectedUpdateInterval" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_VisibleAreaEventOptions_GetMeasureFromViewport, .{ .name = "check_arkui_OH_ArkUI_VisibleAreaEventOptions_GetMeasureFromViewport" });
    }
    if (options.compile_check_api >= 17) {
        @export(&@import("arkui").native.OH_ArkUI_VisibleAreaEventOptions_GetRatios, .{ .name = "check_arkui_OH_ArkUI_VisibleAreaEventOptions_GetRatios" });
    }
    if (options.compile_check_api >= 17) {
        @export(&@import("arkui").native.OH_ArkUI_VisibleAreaEventOptions_SetExpectedUpdateInterval, .{ .name = "check_arkui_OH_ArkUI_VisibleAreaEventOptions_SetExpectedUpdateInterval" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui").native.OH_ArkUI_VisibleAreaEventOptions_SetMeasureFromViewport, .{ .name = "check_arkui_OH_ArkUI_VisibleAreaEventOptions_SetMeasureFromViewport" });
    }
    if (options.compile_check_api >= 17) {
        @export(&@import("arkui").native.OH_ArkUI_VisibleAreaEventOptions_SetRatios, .{ .name = "check_arkui_OH_ArkUI_VisibleAreaEventOptions_SetRatios" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_WaterFlowSectionOption_Create, .{ .name = "check_arkui_OH_ArkUI_WaterFlowSectionOption_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_WaterFlowSectionOption_Dispose, .{ .name = "check_arkui_OH_ArkUI_WaterFlowSectionOption_Dispose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_WaterFlowSectionOption_GetColumnGap, .{ .name = "check_arkui_OH_ArkUI_WaterFlowSectionOption_GetColumnGap" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_WaterFlowSectionOption_GetCrossCount, .{ .name = "check_arkui_OH_ArkUI_WaterFlowSectionOption_GetCrossCount" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_WaterFlowSectionOption_GetItemCount, .{ .name = "check_arkui_OH_ArkUI_WaterFlowSectionOption_GetItemCount" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_WaterFlowSectionOption_GetMargin, .{ .name = "check_arkui_OH_ArkUI_WaterFlowSectionOption_GetMargin" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_WaterFlowSectionOption_GetRowGap, .{ .name = "check_arkui_OH_ArkUI_WaterFlowSectionOption_GetRowGap" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_WaterFlowSectionOption_GetSize, .{ .name = "check_arkui_OH_ArkUI_WaterFlowSectionOption_GetSize" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_WaterFlowSectionOption_RegisterGetItemMainSizeCallbackByIndexWithUserData, .{ .name = "check_arkui_OH_ArkUI_WaterFlowSectionOption_RegisterGetItemMainSizeCallbackByIndexWithUserData" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_WaterFlowSectionOption_SetColumnGap, .{ .name = "check_arkui_OH_ArkUI_WaterFlowSectionOption_SetColumnGap" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_WaterFlowSectionOption_SetCrossCount, .{ .name = "check_arkui_OH_ArkUI_WaterFlowSectionOption_SetCrossCount" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_WaterFlowSectionOption_SetItemCount, .{ .name = "check_arkui_OH_ArkUI_WaterFlowSectionOption_SetItemCount" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_WaterFlowSectionOption_SetMargin, .{ .name = "check_arkui_OH_ArkUI_WaterFlowSectionOption_SetMargin" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_WaterFlowSectionOption_SetRowGap, .{ .name = "check_arkui_OH_ArkUI_WaterFlowSectionOption_SetRowGap" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_ArkUI_WaterFlowSectionOption_SetSize, .{ .name = "check_arkui_OH_ArkUI_WaterFlowSectionOption_SetSize" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui").native.OH_NativeXComponent_GetNativeXComponent, .{ .name = "check_arkui_OH_NativeXComponent_GetNativeXComponent" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui_input").native.OH_ArkUI_AxisEvent_GetAxisAction, .{ .name = "check_arkui_input_OH_ArkUI_AxisEvent_GetAxisAction" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_AxisEvent_GetHorizontalAxisValue, .{ .name = "check_arkui_input_OH_ArkUI_AxisEvent_GetHorizontalAxisValue" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_AxisEvent_GetPinchAxisScaleValue, .{ .name = "check_arkui_input_OH_ArkUI_AxisEvent_GetPinchAxisScaleValue" });
    }
    if (options.compile_check_api >= 17) {
        @export(&@import("arkui_input").native.OH_ArkUI_AxisEvent_GetScrollStep, .{ .name = "check_arkui_input_OH_ArkUI_AxisEvent_GetScrollStep" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_AxisEvent_GetVerticalAxisValue, .{ .name = "check_arkui_input_OH_ArkUI_AxisEvent_GetVerticalAxisValue" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui_input").native.OH_ArkUI_AxisEvent_HasAxis, .{ .name = "check_arkui_input_OH_ArkUI_AxisEvent_HasAxis" });
    }
    if (options.compile_check_api >= 17) {
        @export(&@import("arkui_input").native.OH_ArkUI_AxisEvent_SetPropagation, .{ .name = "check_arkui_input_OH_ArkUI_AxisEvent_SetPropagation" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui_input").native.OH_ArkUI_CoastingAxisEvent_GetDeltaX, .{ .name = "check_arkui_input_OH_ArkUI_CoastingAxisEvent_GetDeltaX" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui_input").native.OH_ArkUI_CoastingAxisEvent_GetDeltaY, .{ .name = "check_arkui_input_OH_ArkUI_CoastingAxisEvent_GetDeltaY" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui_input").native.OH_ArkUI_CoastingAxisEvent_GetEventTime, .{ .name = "check_arkui_input_OH_ArkUI_CoastingAxisEvent_GetEventTime" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui_input").native.OH_ArkUI_CoastingAxisEvent_GetPhase, .{ .name = "check_arkui_input_OH_ArkUI_CoastingAxisEvent_GetPhase" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui_input").native.OH_ArkUI_CoastingAxisEvent_SetPropagation, .{ .name = "check_arkui_input_OH_ArkUI_CoastingAxisEvent_SetPropagation" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui_input").native.OH_ArkUI_FocusAxisEvent_GetAxisValue, .{ .name = "check_arkui_input_OH_ArkUI_FocusAxisEvent_GetAxisValue" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui_input").native.OH_ArkUI_FocusAxisEvent_SetStopPropagation, .{ .name = "check_arkui_input_OH_ArkUI_FocusAxisEvent_SetStopPropagation" });
    }
    if (options.compile_check_api >= 17) {
        @export(&@import("arkui_input").native.OH_ArkUI_HoverEvent_IsHovered, .{ .name = "check_arkui_input_OH_ArkUI_HoverEvent_IsHovered" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_MouseEvent_GetMouseAction, .{ .name = "check_arkui_input_OH_ArkUI_MouseEvent_GetMouseAction" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_MouseEvent_GetMouseButton, .{ .name = "check_arkui_input_OH_ArkUI_MouseEvent_GetMouseButton" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui_input").native.OH_ArkUI_MouseEvent_GetPressedButtons, .{ .name = "check_arkui_input_OH_ArkUI_MouseEvent_GetPressedButtons" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui_input").native.OH_ArkUI_MouseEvent_GetRawDeltaX, .{ .name = "check_arkui_input_OH_ArkUI_MouseEvent_GetRawDeltaX" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui_input").native.OH_ArkUI_MouseEvent_GetRawDeltaY, .{ .name = "check_arkui_input_OH_ArkUI_MouseEvent_GetRawDeltaY" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_CreateClonedEvent, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_CreateClonedEvent" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_DestroyClonedEvent, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_DestroyClonedEvent" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetChangedPointerId, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetChangedPointerId" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetDisplayX, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetDisplayX" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetDisplayY, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetDisplayY" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetGlobalDisplayX, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetGlobalDisplayX" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetGlobalDisplayXByIndex, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetGlobalDisplayXByIndex" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetGlobalDisplayY, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetGlobalDisplayY" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetGlobalDisplayYByIndex, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetGlobalDisplayYByIndex" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetHistoryDisplayX, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetHistoryDisplayX" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetHistoryDisplayY, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetHistoryDisplayY" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetHistoryGlobalDisplayX, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetHistoryGlobalDisplayX" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetHistoryGlobalDisplayY, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetHistoryGlobalDisplayY" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetHistoryPointerId, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetHistoryPointerId" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetHistoryPressure, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetHistoryPressure" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetHistoryTiltX, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetHistoryTiltX" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetHistoryTiltY, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetHistoryTiltY" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetHistoryTouchAreaHeight, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetHistoryTouchAreaHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetHistoryTouchAreaWidth, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetHistoryTouchAreaWidth" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetHistoryWindowX, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetHistoryWindowX" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetHistoryWindowY, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetHistoryWindowY" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetInteractionHand, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetInteractionHand" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetInteractionHandByIndex, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetInteractionHandByIndex" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetPressedTimeByIndex, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetPressedTimeByIndex" });
    }
    if (options.compile_check_api >= 17) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetRollAngle, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetRollAngle" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetTouchAreaHeight, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetTouchAreaHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetTouchAreaWidth, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetTouchAreaWidth" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetWindowX, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetWindowX" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetWindowY, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetWindowY" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetX, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetX" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_GetY, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_GetY" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_PostClonedEvent, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_PostClonedEvent" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_SetClonedEventActionType, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_SetClonedEventActionType" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_SetClonedEventChangedFingerId, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_SetClonedEventChangedFingerId" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_SetClonedEventFingerIdByIndex, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_SetClonedEventFingerIdByIndex" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_SetClonedEventLocalPosition, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_SetClonedEventLocalPosition" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui_input").native.OH_ArkUI_PointerEvent_SetClonedEventLocalPositionByIndex, .{ .name = "check_arkui_input_OH_ArkUI_PointerEvent_SetClonedEventLocalPositionByIndex" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("arkui_input").native.OH_ArkUI_UIInputEvent_GetCoastingAxisEvent, .{ .name = "check_arkui_input_OH_ArkUI_UIInputEvent_GetCoastingAxisEvent" });
    }
    if (options.compile_check_api >= 14) {
        @export(&@import("arkui_input").native.OH_ArkUI_UIInputEvent_GetDeviceId, .{ .name = "check_arkui_input_OH_ArkUI_UIInputEvent_GetDeviceId" });
    }
    if (options.compile_check_api >= 17) {
        @export(&@import("arkui_input").native.OH_ArkUI_UIInputEvent_GetEventTargetGlobalPositionX, .{ .name = "check_arkui_input_OH_ArkUI_UIInputEvent_GetEventTargetGlobalPositionX" });
    }
    if (options.compile_check_api >= 17) {
        @export(&@import("arkui_input").native.OH_ArkUI_UIInputEvent_GetEventTargetGlobalPositionY, .{ .name = "check_arkui_input_OH_ArkUI_UIInputEvent_GetEventTargetGlobalPositionY" });
    }
    if (options.compile_check_api >= 17) {
        @export(&@import("arkui_input").native.OH_ArkUI_UIInputEvent_GetEventTargetHeight, .{ .name = "check_arkui_input_OH_ArkUI_UIInputEvent_GetEventTargetHeight" });
    }
    if (options.compile_check_api >= 17) {
        @export(&@import("arkui_input").native.OH_ArkUI_UIInputEvent_GetEventTargetPositionX, .{ .name = "check_arkui_input_OH_ArkUI_UIInputEvent_GetEventTargetPositionX" });
    }
    if (options.compile_check_api >= 17) {
        @export(&@import("arkui_input").native.OH_ArkUI_UIInputEvent_GetEventTargetPositionY, .{ .name = "check_arkui_input_OH_ArkUI_UIInputEvent_GetEventTargetPositionY" });
    }
    if (options.compile_check_api >= 17) {
        @export(&@import("arkui_input").native.OH_ArkUI_UIInputEvent_GetEventTargetWidth, .{ .name = "check_arkui_input_OH_ArkUI_UIInputEvent_GetEventTargetWidth" });
    }
    if (options.compile_check_api >= 17) {
        @export(&@import("arkui_input").native.OH_ArkUI_UIInputEvent_GetModifierKeyStates, .{ .name = "check_arkui_input_OH_ArkUI_UIInputEvent_GetModifierKeyStates" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("arkui_input").native.OH_ArkUI_UIInputEvent_GetTargetDisplayId, .{ .name = "check_arkui_input_OH_ArkUI_UIInputEvent_GetTargetDisplayId" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CameraInput_RegisterCallback, .{ .name = "check_camera_OH_CameraInput_RegisterCallback" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CameraInput_UnregisterCallback, .{ .name = "check_camera_OH_CameraInput_UnregisterCallback" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_CameraManager_CreatePhotoOutputWithoutSurface, .{ .name = "check_camera_OH_CameraManager_CreatePhotoOutputWithoutSurface" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode, .{ .name = "check_camera_OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_CameraManager_IsTorchSupported, .{ .name = "check_camera_OH_CameraManager_IsTorchSupported" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_CameraManager_SetTorchMode, .{ .name = "check_camera_OH_CameraManager_SetTorchMode" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_CaptureSession_DeleteColorSpaces, .{ .name = "check_camera_OH_CaptureSession_DeleteColorSpaces" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("camera").native.OH_CaptureSession_EnableAutoDeviceSwitch, .{ .name = "check_camera_OH_CaptureSession_EnableAutoDeviceSwitch" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("camera").native.OH_CaptureSession_EnableMacro, .{ .name = "check_camera_OH_CaptureSession_EnableMacro" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_CaptureSession_GetActiveColorSpace, .{ .name = "check_camera_OH_CaptureSession_GetActiveColorSpace" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_GetExposureBias, .{ .name = "check_camera_OH_CaptureSession_GetExposureBias" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_GetExposureBiasRange, .{ .name = "check_camera_OH_CaptureSession_GetExposureBiasRange" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_GetExposureMode, .{ .name = "check_camera_OH_CaptureSession_GetExposureMode" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_CaptureSession_GetExposureValue, .{ .name = "check_camera_OH_CaptureSession_GetExposureValue" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_GetFlashMode, .{ .name = "check_camera_OH_CaptureSession_GetFlashMode" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_CaptureSession_GetFocalLength, .{ .name = "check_camera_OH_CaptureSession_GetFocalLength" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_GetFocusMode, .{ .name = "check_camera_OH_CaptureSession_GetFocusMode" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_GetFocusPoint, .{ .name = "check_camera_OH_CaptureSession_GetFocusPoint" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_GetMeteringPoint, .{ .name = "check_camera_OH_CaptureSession_GetMeteringPoint" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_CaptureSession_GetSupportedColorSpaces, .{ .name = "check_camera_OH_CaptureSession_GetSupportedColorSpaces" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_GetVideoStabilizationMode, .{ .name = "check_camera_OH_CaptureSession_GetVideoStabilizationMode" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("camera").native.OH_CaptureSession_GetWhiteBalance, .{ .name = "check_camera_OH_CaptureSession_GetWhiteBalance" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("camera").native.OH_CaptureSession_GetWhiteBalanceMode, .{ .name = "check_camera_OH_CaptureSession_GetWhiteBalanceMode" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("camera").native.OH_CaptureSession_GetWhiteBalanceRange, .{ .name = "check_camera_OH_CaptureSession_GetWhiteBalanceRange" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_GetZoomRatio, .{ .name = "check_camera_OH_CaptureSession_GetZoomRatio" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_GetZoomRatioRange, .{ .name = "check_camera_OH_CaptureSession_GetZoomRatioRange" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_HasFlash, .{ .name = "check_camera_OH_CaptureSession_HasFlash" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("camera").native.OH_CaptureSession_IsAutoDeviceSwitchSupported, .{ .name = "check_camera_OH_CaptureSession_IsAutoDeviceSwitchSupported" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_IsExposureModeSupported, .{ .name = "check_camera_OH_CaptureSession_IsExposureModeSupported" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_IsFlashModeSupported, .{ .name = "check_camera_OH_CaptureSession_IsFlashModeSupported" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_IsFocusModeSupported, .{ .name = "check_camera_OH_CaptureSession_IsFocusModeSupported" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("camera").native.OH_CaptureSession_IsMacroSupported, .{ .name = "check_camera_OH_CaptureSession_IsMacroSupported" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_IsVideoStabilizationModeSupported, .{ .name = "check_camera_OH_CaptureSession_IsVideoStabilizationModeSupported" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("camera").native.OH_CaptureSession_IsWhiteBalanceModeSupported, .{ .name = "check_camera_OH_CaptureSession_IsWhiteBalanceModeSupported" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_RegisterCallback, .{ .name = "check_camera_OH_CaptureSession_RegisterCallback" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_CaptureSession_SetActiveColorSpace, .{ .name = "check_camera_OH_CaptureSession_SetActiveColorSpace" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_SetExposureBias, .{ .name = "check_camera_OH_CaptureSession_SetExposureBias" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_SetExposureMode, .{ .name = "check_camera_OH_CaptureSession_SetExposureMode" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_SetFlashMode, .{ .name = "check_camera_OH_CaptureSession_SetFlashMode" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_SetFocusMode, .{ .name = "check_camera_OH_CaptureSession_SetFocusMode" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_SetFocusPoint, .{ .name = "check_camera_OH_CaptureSession_SetFocusPoint" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_SetMeteringPoint, .{ .name = "check_camera_OH_CaptureSession_SetMeteringPoint" });
    }
    if (options.compile_check_api >= 14) {
        @export(&@import("camera").native.OH_CaptureSession_SetQualityPrioritization, .{ .name = "check_camera_OH_CaptureSession_SetQualityPrioritization" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_CaptureSession_SetSmoothZoom, .{ .name = "check_camera_OH_CaptureSession_SetSmoothZoom" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_SetVideoStabilizationMode, .{ .name = "check_camera_OH_CaptureSession_SetVideoStabilizationMode" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("camera").native.OH_CaptureSession_SetWhiteBalance, .{ .name = "check_camera_OH_CaptureSession_SetWhiteBalance" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("camera").native.OH_CaptureSession_SetWhiteBalanceMode, .{ .name = "check_camera_OH_CaptureSession_SetWhiteBalanceMode" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_SetZoomRatio, .{ .name = "check_camera_OH_CaptureSession_SetZoomRatio" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_CaptureSession_UnregisterCallback, .{ .name = "check_camera_OH_CaptureSession_UnregisterCallback" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_ImageNative_GetBufferSize, .{ .name = "check_camera_OH_ImageNative_GetBufferSize" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_ImageNative_GetByteBuffer, .{ .name = "check_camera_OH_ImageNative_GetByteBuffer" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_ImageNative_GetComponentTypes, .{ .name = "check_camera_OH_ImageNative_GetComponentTypes" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_ImageNative_GetRowStride, .{ .name = "check_camera_OH_ImageNative_GetRowStride" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_ImageNative_GetTimestamp, .{ .name = "check_camera_OH_ImageNative_GetTimestamp" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_ImageReceiverNative_Create, .{ .name = "check_camera_OH_ImageReceiverNative_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_ImageReceiverNative_GetReceivingSurfaceId, .{ .name = "check_camera_OH_ImageReceiverNative_GetReceivingSurfaceId" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("camera").native.OH_ImageReceiverNative_OnImageArrive, .{ .name = "check_camera_OH_ImageReceiverNative_OnImageArrive" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_ImageReceiverNative_ReadLatestImage, .{ .name = "check_camera_OH_ImageReceiverNative_ReadLatestImage" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_ImageReceiverOptions_Create, .{ .name = "check_camera_OH_ImageReceiverOptions_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_ImageReceiverOptions_SetCapacity, .{ .name = "check_camera_OH_ImageReceiverOptions_SetCapacity" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_ImageReceiverOptions_SetSize, .{ .name = "check_camera_OH_ImageReceiverOptions_SetSize" });
    }
    if (options.compile_check_api >= 9) {
        @export(&@import("camera").native.OH_NativeBuffer_Map, .{ .name = "check_camera_OH_NativeBuffer_Map" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_NativeWindow_GetSurfaceId, .{ .name = "check_camera_OH_NativeWindow_GetSurfaceId" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_PhotoNative_GetMainImage, .{ .name = "check_camera_OH_PhotoNative_GetMainImage" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_PhotoNative_Release, .{ .name = "check_camera_OH_PhotoNative_Release" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_PhotoOutput_IsMirrorSupported, .{ .name = "check_camera_OH_PhotoOutput_IsMirrorSupported" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_PhotoOutput_RegisterCallback, .{ .name = "check_camera_OH_PhotoOutput_RegisterCallback" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_PhotoOutput_RegisterPhotoAvailableCallback, .{ .name = "check_camera_OH_PhotoOutput_RegisterPhotoAvailableCallback" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("camera").native.OH_PhotoOutput_UnregisterCallback, .{ .name = "check_camera_OH_PhotoOutput_UnregisterCallback" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_PhotoOutput_UnregisterPhotoAvailableCallback, .{ .name = "check_camera_OH_PhotoOutput_UnregisterPhotoAvailableCallback" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_PreviewOutput_DeleteFrameRates, .{ .name = "check_camera_OH_PreviewOutput_DeleteFrameRates" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_PreviewOutput_GetActiveFrameRate, .{ .name = "check_camera_OH_PreviewOutput_GetActiveFrameRate" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_PreviewOutput_GetSupportedFrameRates, .{ .name = "check_camera_OH_PreviewOutput_GetSupportedFrameRates" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_PreviewOutput_SetFrameRate, .{ .name = "check_camera_OH_PreviewOutput_SetFrameRate" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("camera").native.OH_PreviewOutput_SetPreviewRotation, .{ .name = "check_camera_OH_PreviewOutput_SetPreviewRotation" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_BitmapBuild, .{ .name = "check_native_drawing_OH_Drawing_BitmapBuild" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_BitmapCreate, .{ .name = "check_native_drawing_OH_Drawing_BitmapCreate" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_BitmapGetHeight, .{ .name = "check_native_drawing_OH_Drawing_BitmapGetHeight" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_BitmapGetPixels, .{ .name = "check_native_drawing_OH_Drawing_BitmapGetPixels" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_BitmapGetWidth, .{ .name = "check_native_drawing_OH_Drawing_BitmapGetWidth" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_BitmapReadPixels, .{ .name = "check_native_drawing_OH_Drawing_BitmapReadPixels" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_BrushCopy, .{ .name = "check_native_drawing_OH_Drawing_BrushCopy" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_BrushGetAlpha, .{ .name = "check_native_drawing_OH_Drawing_BrushGetAlpha" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_BrushGetColor, .{ .name = "check_native_drawing_OH_Drawing_BrushGetColor" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_BrushIsAntiAlias, .{ .name = "check_native_drawing_OH_Drawing_BrushIsAntiAlias" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_BrushReset, .{ .name = "check_native_drawing_OH_Drawing_BrushReset" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_BrushSetAlpha, .{ .name = "check_native_drawing_OH_Drawing_BrushSetAlpha" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_BrushSetAntiAlias, .{ .name = "check_native_drawing_OH_Drawing_BrushSetAntiAlias" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_BrushSetBlendMode, .{ .name = "check_native_drawing_OH_Drawing_BrushSetBlendMode" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_BrushSetFilter, .{ .name = "check_native_drawing_OH_Drawing_BrushSetFilter" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_BrushSetShaderEffect, .{ .name = "check_native_drawing_OH_Drawing_BrushSetShaderEffect" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_BrushSetShadowLayer, .{ .name = "check_native_drawing_OH_Drawing_BrushSetShadowLayer" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasAttachPen, .{ .name = "check_native_drawing_OH_Drawing_CanvasAttachPen" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasClear, .{ .name = "check_native_drawing_OH_Drawing_CanvasClear" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasClipPath, .{ .name = "check_native_drawing_OH_Drawing_CanvasClipPath" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasClipRect, .{ .name = "check_native_drawing_OH_Drawing_CanvasClipRect" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasConcatMatrix, .{ .name = "check_native_drawing_OH_Drawing_CanvasConcatMatrix" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasDetachPen, .{ .name = "check_native_drawing_OH_Drawing_CanvasDetachPen" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasDrawBitmap, .{ .name = "check_native_drawing_OH_Drawing_CanvasDrawBitmap" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasDrawBitmapRect, .{ .name = "check_native_drawing_OH_Drawing_CanvasDrawBitmapRect" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasDrawCircle, .{ .name = "check_native_drawing_OH_Drawing_CanvasDrawCircle" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasDrawColor, .{ .name = "check_native_drawing_OH_Drawing_CanvasDrawColor" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasDrawImageRectWithSrc, .{ .name = "check_native_drawing_OH_Drawing_CanvasDrawImageRectWithSrc" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasDrawLine, .{ .name = "check_native_drawing_OH_Drawing_CanvasDrawLine" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasDrawOval, .{ .name = "check_native_drawing_OH_Drawing_CanvasDrawOval" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasDrawPath, .{ .name = "check_native_drawing_OH_Drawing_CanvasDrawPath" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasDrawRect, .{ .name = "check_native_drawing_OH_Drawing_CanvasDrawRect" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasDrawRoundRect, .{ .name = "check_native_drawing_OH_Drawing_CanvasDrawRoundRect" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasDrawSingleCharacter, .{ .name = "check_native_drawing_OH_Drawing_CanvasDrawSingleCharacter" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasDrawSingleCharacterWithFeatures, .{ .name = "check_native_drawing_OH_Drawing_CanvasDrawSingleCharacterWithFeatures" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasGetHeight, .{ .name = "check_native_drawing_OH_Drawing_CanvasGetHeight" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasGetSaveCount, .{ .name = "check_native_drawing_OH_Drawing_CanvasGetSaveCount" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasGetTotalMatrix, .{ .name = "check_native_drawing_OH_Drawing_CanvasGetTotalMatrix" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasGetWidth, .{ .name = "check_native_drawing_OH_Drawing_CanvasGetWidth" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasReadPixels, .{ .name = "check_native_drawing_OH_Drawing_CanvasReadPixels" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasResetMatrix, .{ .name = "check_native_drawing_OH_Drawing_CanvasResetMatrix" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasRestore, .{ .name = "check_native_drawing_OH_Drawing_CanvasRestore" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasRotate, .{ .name = "check_native_drawing_OH_Drawing_CanvasRotate" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasSave, .{ .name = "check_native_drawing_OH_Drawing_CanvasSave" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasScale, .{ .name = "check_native_drawing_OH_Drawing_CanvasScale" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasSetMatrix, .{ .name = "check_native_drawing_OH_Drawing_CanvasSetMatrix" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasSkew, .{ .name = "check_native_drawing_OH_Drawing_CanvasSkew" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_CanvasTranslate, .{ .name = "check_native_drawing_OH_Drawing_CanvasTranslate" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_ClearFontCaches, .{ .name = "check_native_drawing_OH_Drawing_ClearFontCaches" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_ColorFilterCreateMatrix, .{ .name = "check_native_drawing_OH_Drawing_ColorFilterCreateMatrix" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_ColorFilterDestroy, .{ .name = "check_native_drawing_OH_Drawing_ColorFilterDestroy" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_ColorSetArgb, .{ .name = "check_native_drawing_OH_Drawing_ColorSetArgb" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_CreateDashPathEffect, .{ .name = "check_native_drawing_OH_Drawing_CreateDashPathEffect" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_CreateFontCollection, .{ .name = "check_native_drawing_OH_Drawing_CreateFontCollection" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_CreateSharedFontCollection, .{ .name = "check_native_drawing_OH_Drawing_CreateSharedFontCollection" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_CreateTextStyle, .{ .name = "check_native_drawing_OH_Drawing_CreateTextStyle" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_CreateTypography, .{ .name = "check_native_drawing_OH_Drawing_CreateTypography" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_CreateTypographyHandler, .{ .name = "check_native_drawing_OH_Drawing_CreateTypographyHandler" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_CreateTypographyStyle, .{ .name = "check_native_drawing_OH_Drawing_CreateTypographyStyle" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_DestroyFontCollection, .{ .name = "check_native_drawing_OH_Drawing_DestroyFontCollection" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_DestroyTextStyle, .{ .name = "check_native_drawing_OH_Drawing_DestroyTextStyle" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_DestroyTypography, .{ .name = "check_native_drawing_OH_Drawing_DestroyTypography" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_DestroyTypographyHandler, .{ .name = "check_native_drawing_OH_Drawing_DestroyTypographyHandler" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_DestroyTypographyStyle, .{ .name = "check_native_drawing_OH_Drawing_DestroyTypographyStyle" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_DisableFontCollectionFallback, .{ .name = "check_native_drawing_OH_Drawing_DisableFontCollectionFallback" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_DisableFontCollectionSystemFont, .{ .name = "check_native_drawing_OH_Drawing_DisableFontCollectionSystemFont" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_ErrorCodeGet, .{ .name = "check_native_drawing_OH_Drawing_ErrorCodeGet" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("native_drawing").native.OH_Drawing_ErrorCodeReset, .{ .name = "check_native_drawing_OH_Drawing_ErrorCodeReset" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_FilterCreate, .{ .name = "check_native_drawing_OH_Drawing_FilterCreate" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_FilterDestroy, .{ .name = "check_native_drawing_OH_Drawing_FilterDestroy" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_FilterSetColorFilter, .{ .name = "check_native_drawing_OH_Drawing_FilterSetColorFilter" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_FilterSetMaskFilter, .{ .name = "check_native_drawing_OH_Drawing_FilterSetMaskFilter" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_FontCountText, .{ .name = "check_native_drawing_OH_Drawing_FontCountText" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("native_drawing").native.OH_Drawing_FontFeaturesAddFeature, .{ .name = "check_native_drawing_OH_Drawing_FontFeaturesAddFeature" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("native_drawing").native.OH_Drawing_FontFeaturesCreate, .{ .name = "check_native_drawing_OH_Drawing_FontFeaturesCreate" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("native_drawing").native.OH_Drawing_FontFeaturesDestroy, .{ .name = "check_native_drawing_OH_Drawing_FontFeaturesDestroy" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_FontGetTextSize, .{ .name = "check_native_drawing_OH_Drawing_FontGetTextSize" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_FontMeasureSingleCharacter, .{ .name = "check_native_drawing_OH_Drawing_FontMeasureSingleCharacter" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("native_drawing").native.OH_Drawing_FontMeasureSingleCharacterWithFeatures, .{ .name = "check_native_drawing_OH_Drawing_FontMeasureSingleCharacterWithFeatures" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_FontSetBaselineSnap, .{ .name = "check_native_drawing_OH_Drawing_FontSetBaselineSnap" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_FontSetLinearText, .{ .name = "check_native_drawing_OH_Drawing_FontSetLinearText" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_GetAffinityFromPositionAndAffinity, .{ .name = "check_native_drawing_OH_Drawing_GetAffinityFromPositionAndAffinity" });
    }
    if (options.compile_check_api >= 14) {
        @export(&@import("native_drawing").native.OH_Drawing_GetFontCollectionGlobalInstance, .{ .name = "check_native_drawing_OH_Drawing_GetFontCollectionGlobalInstance" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_GetPositionFromPositionAndAffinity, .{ .name = "check_native_drawing_OH_Drawing_GetPositionFromPositionAndAffinity" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_ImageBuildFromBitmap, .{ .name = "check_native_drawing_OH_Drawing_ImageBuildFromBitmap" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_ImageCreate, .{ .name = "check_native_drawing_OH_Drawing_ImageCreate" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_ImageDestroy, .{ .name = "check_native_drawing_OH_Drawing_ImageDestroy" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_ImageGetHeight, .{ .name = "check_native_drawing_OH_Drawing_ImageGetHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_ImageGetWidth, .{ .name = "check_native_drawing_OH_Drawing_ImageGetWidth" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_MaskFilterCreateBlur, .{ .name = "check_native_drawing_OH_Drawing_MaskFilterCreateBlur" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_MaskFilterDestroy, .{ .name = "check_native_drawing_OH_Drawing_MaskFilterDestroy" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_MatrixConcat, .{ .name = "check_native_drawing_OH_Drawing_MatrixConcat" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_MatrixCreate, .{ .name = "check_native_drawing_OH_Drawing_MatrixCreate" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_MatrixDestroy, .{ .name = "check_native_drawing_OH_Drawing_MatrixDestroy" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_MatrixGetAll, .{ .name = "check_native_drawing_OH_Drawing_MatrixGetAll" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_MatrixInvert, .{ .name = "check_native_drawing_OH_Drawing_MatrixInvert" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_MatrixMapPoints, .{ .name = "check_native_drawing_OH_Drawing_MatrixMapPoints" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_MatrixSetMatrix, .{ .name = "check_native_drawing_OH_Drawing_MatrixSetMatrix" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_MemoryStreamCreate, .{ .name = "check_native_drawing_OH_Drawing_MemoryStreamCreate" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PathAddArc, .{ .name = "check_native_drawing_OH_Drawing_PathAddArc" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PathAddCircle, .{ .name = "check_native_drawing_OH_Drawing_PathAddCircle" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PathAddOval, .{ .name = "check_native_drawing_OH_Drawing_PathAddOval" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PathAddPath, .{ .name = "check_native_drawing_OH_Drawing_PathAddPath" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PathAddRect, .{ .name = "check_native_drawing_OH_Drawing_PathAddRect" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PathAddRoundRect, .{ .name = "check_native_drawing_OH_Drawing_PathAddRoundRect" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PathArcTo, .{ .name = "check_native_drawing_OH_Drawing_PathArcTo" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PathBuildFromSvgString, .{ .name = "check_native_drawing_OH_Drawing_PathBuildFromSvgString" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PathClose, .{ .name = "check_native_drawing_OH_Drawing_PathClose" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PathContains, .{ .name = "check_native_drawing_OH_Drawing_PathContains" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PathCopy, .{ .name = "check_native_drawing_OH_Drawing_PathCopy" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PathCreate, .{ .name = "check_native_drawing_OH_Drawing_PathCreate" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PathCubicTo, .{ .name = "check_native_drawing_OH_Drawing_PathCubicTo" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PathDestroy, .{ .name = "check_native_drawing_OH_Drawing_PathDestroy" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PathEffectDestroy, .{ .name = "check_native_drawing_OH_Drawing_PathEffectDestroy" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PathGetLength, .{ .name = "check_native_drawing_OH_Drawing_PathGetLength" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PathLineTo, .{ .name = "check_native_drawing_OH_Drawing_PathLineTo" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PathMoveTo, .{ .name = "check_native_drawing_OH_Drawing_PathMoveTo" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PathQuadTo, .{ .name = "check_native_drawing_OH_Drawing_PathQuadTo" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PathReset, .{ .name = "check_native_drawing_OH_Drawing_PathReset" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PathSetFillType, .{ .name = "check_native_drawing_OH_Drawing_PathSetFillType" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PathTransform, .{ .name = "check_native_drawing_OH_Drawing_PathTransform" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PenCopy, .{ .name = "check_native_drawing_OH_Drawing_PenCopy" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PenCreate, .{ .name = "check_native_drawing_OH_Drawing_PenCreate" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PenDestroy, .{ .name = "check_native_drawing_OH_Drawing_PenDestroy" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_PenGetAlpha, .{ .name = "check_native_drawing_OH_Drawing_PenGetAlpha" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PenGetCap, .{ .name = "check_native_drawing_OH_Drawing_PenGetCap" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PenGetColor, .{ .name = "check_native_drawing_OH_Drawing_PenGetColor" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PenGetFillPath, .{ .name = "check_native_drawing_OH_Drawing_PenGetFillPath" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PenGetJoin, .{ .name = "check_native_drawing_OH_Drawing_PenGetJoin" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PenGetMiterLimit, .{ .name = "check_native_drawing_OH_Drawing_PenGetMiterLimit" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PenGetWidth, .{ .name = "check_native_drawing_OH_Drawing_PenGetWidth" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PenIsAntiAlias, .{ .name = "check_native_drawing_OH_Drawing_PenIsAntiAlias" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PenReset, .{ .name = "check_native_drawing_OH_Drawing_PenReset" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_PenSetAlpha, .{ .name = "check_native_drawing_OH_Drawing_PenSetAlpha" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PenSetAntiAlias, .{ .name = "check_native_drawing_OH_Drawing_PenSetAntiAlias" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PenSetBlendMode, .{ .name = "check_native_drawing_OH_Drawing_PenSetBlendMode" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PenSetCap, .{ .name = "check_native_drawing_OH_Drawing_PenSetCap" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PenSetColor, .{ .name = "check_native_drawing_OH_Drawing_PenSetColor" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_PenSetFilter, .{ .name = "check_native_drawing_OH_Drawing_PenSetFilter" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PenSetJoin, .{ .name = "check_native_drawing_OH_Drawing_PenSetJoin" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PenSetMiterLimit, .{ .name = "check_native_drawing_OH_Drawing_PenSetMiterLimit" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PenSetPathEffect, .{ .name = "check_native_drawing_OH_Drawing_PenSetPathEffect" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_PenSetShaderEffect, .{ .name = "check_native_drawing_OH_Drawing_PenSetShaderEffect" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PenSetShadowLayer, .{ .name = "check_native_drawing_OH_Drawing_PenSetShadowLayer" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_PenSetWidth, .{ .name = "check_native_drawing_OH_Drawing_PenSetWidth" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_PointCreate, .{ .name = "check_native_drawing_OH_Drawing_PointCreate" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_PointDestroy, .{ .name = "check_native_drawing_OH_Drawing_PointDestroy" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PointGetX, .{ .name = "check_native_drawing_OH_Drawing_PointGetX" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PointGetY, .{ .name = "check_native_drawing_OH_Drawing_PointGetY" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_PointSet, .{ .name = "check_native_drawing_OH_Drawing_PointSet" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_RectCreate, .{ .name = "check_native_drawing_OH_Drawing_RectCreate" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_RectDestroy, .{ .name = "check_native_drawing_OH_Drawing_RectDestroy" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_RectGetBottom, .{ .name = "check_native_drawing_OH_Drawing_RectGetBottom" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_RectGetHeight, .{ .name = "check_native_drawing_OH_Drawing_RectGetHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_RectGetLeft, .{ .name = "check_native_drawing_OH_Drawing_RectGetLeft" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_RectGetRight, .{ .name = "check_native_drawing_OH_Drawing_RectGetRight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_RectGetTop, .{ .name = "check_native_drawing_OH_Drawing_RectGetTop" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_RectGetWidth, .{ .name = "check_native_drawing_OH_Drawing_RectGetWidth" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_RectSetBottom, .{ .name = "check_native_drawing_OH_Drawing_RectSetBottom" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_RectSetLeft, .{ .name = "check_native_drawing_OH_Drawing_RectSetLeft" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_RectSetRight, .{ .name = "check_native_drawing_OH_Drawing_RectSetRight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_RectSetTop, .{ .name = "check_native_drawing_OH_Drawing_RectSetTop" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_RegisterFont, .{ .name = "check_native_drawing_OH_Drawing_RegisterFont" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_RegisterFontBuffer, .{ .name = "check_native_drawing_OH_Drawing_RegisterFontBuffer" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_RoundRectCreate, .{ .name = "check_native_drawing_OH_Drawing_RoundRectCreate" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_RoundRectDestroy, .{ .name = "check_native_drawing_OH_Drawing_RoundRectDestroy" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_RoundRectGetCorner, .{ .name = "check_native_drawing_OH_Drawing_RoundRectGetCorner" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_RoundRectSetCorner, .{ .name = "check_native_drawing_OH_Drawing_RoundRectSetCorner" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_SamplingOptionsCreate, .{ .name = "check_native_drawing_OH_Drawing_SamplingOptionsCreate" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_SamplingOptionsDestroy, .{ .name = "check_native_drawing_OH_Drawing_SamplingOptionsDestroy" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_SetTextStyleColor, .{ .name = "check_native_drawing_OH_Drawing_SetTextStyleColor" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_SetTextStyleFontFamilies, .{ .name = "check_native_drawing_OH_Drawing_SetTextStyleFontFamilies" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_SetTextStyleFontSize, .{ .name = "check_native_drawing_OH_Drawing_SetTextStyleFontSize" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_SetTextStyleFontStyleStruct, .{ .name = "check_native_drawing_OH_Drawing_SetTextStyleFontStyleStruct" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_SetTextStyleForegroundBrush, .{ .name = "check_native_drawing_OH_Drawing_SetTextStyleForegroundBrush" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_SetTextStyleForegroundPen, .{ .name = "check_native_drawing_OH_Drawing_SetTextStyleForegroundPen" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_SetTextStyleLetterSpacing, .{ .name = "check_native_drawing_OH_Drawing_SetTextStyleLetterSpacing" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_SetTextStyleLocale, .{ .name = "check_native_drawing_OH_Drawing_SetTextStyleLocale" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_SetTextStyleWordSpacing, .{ .name = "check_native_drawing_OH_Drawing_SetTextStyleWordSpacing" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_SetTypographyTextAlign, .{ .name = "check_native_drawing_OH_Drawing_SetTypographyTextAlign" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_SetTypographyTextDirection, .{ .name = "check_native_drawing_OH_Drawing_SetTypographyTextDirection" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_SetTypographyTextMaxLines, .{ .name = "check_native_drawing_OH_Drawing_SetTypographyTextMaxLines" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_ShaderEffectCreateImageShader, .{ .name = "check_native_drawing_OH_Drawing_ShaderEffectCreateImageShader" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_ShaderEffectCreateLinearGradient, .{ .name = "check_native_drawing_OH_Drawing_ShaderEffectCreateLinearGradient" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix, .{ .name = "check_native_drawing_OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_ShaderEffectCreateRadialGradient, .{ .name = "check_native_drawing_OH_Drawing_ShaderEffectCreateRadialGradient" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix, .{ .name = "check_native_drawing_OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_ShaderEffectCreateSweepGradient, .{ .name = "check_native_drawing_OH_Drawing_ShaderEffectCreateSweepGradient" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("native_drawing").native.OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix, .{ .name = "check_native_drawing_OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_ShaderEffectCreateTwoPointConicalGradient, .{ .name = "check_native_drawing_OH_Drawing_ShaderEffectCreateTwoPointConicalGradient" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("native_drawing").native.OH_Drawing_ShaderEffectDestroy, .{ .name = "check_native_drawing_OH_Drawing_ShaderEffectDestroy" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_ShadowLayerCreate, .{ .name = "check_native_drawing_OH_Drawing_ShadowLayerCreate" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_ShadowLayerDestroy, .{ .name = "check_native_drawing_OH_Drawing_ShadowLayerDestroy" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_TextStyleAddFontFeature, .{ .name = "check_native_drawing_OH_Drawing_TextStyleAddFontFeature" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_TextStyleAddFontVariation, .{ .name = "check_native_drawing_OH_Drawing_TextStyleAddFontVariation" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_TypefaceCreateFromFile, .{ .name = "check_native_drawing_OH_Drawing_TypefaceCreateFromFile" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_TypefaceCreateFromStream, .{ .name = "check_native_drawing_OH_Drawing_TypefaceCreateFromStream" });
    }
    if (options.compile_check_api >= 9) {
        @export(&@import("native_drawing").native.OH_Drawing_TypographyGetHeight, .{ .name = "check_native_drawing_OH_Drawing_TypographyGetHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_drawing").native.OH_Drawing_TypographyGetLineMetricsAt, .{ .name = "check_native_drawing_OH_Drawing_TypographyGetLineMetricsAt" });
    }
    if (options.compile_check_api >= 9) {
        @export(&@import("native_drawing").native.OH_Drawing_TypographyGetLongestLine, .{ .name = "check_native_drawing_OH_Drawing_TypographyGetLongestLine" });
    }
    if (options.compile_check_api >= 9) {
        @export(&@import("native_drawing").native.OH_Drawing_TypographyGetMaxWidth, .{ .name = "check_native_drawing_OH_Drawing_TypographyGetMaxWidth" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("native_drawing").native.OH_Drawing_TypographyHandlerAddEncodedText, .{ .name = "check_native_drawing_OH_Drawing_TypographyHandlerAddEncodedText" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_TypographyHandlerAddText, .{ .name = "check_native_drawing_OH_Drawing_TypographyHandlerAddText" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_TypographyHandlerPopTextStyle, .{ .name = "check_native_drawing_OH_Drawing_TypographyHandlerPopTextStyle" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_TypographyHandlerPushTextStyle, .{ .name = "check_native_drawing_OH_Drawing_TypographyHandlerPushTextStyle" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_TypographyLayout, .{ .name = "check_native_drawing_OH_Drawing_TypographyLayout" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("native_drawing").native.OH_Drawing_TypographyPaint, .{ .name = "check_native_drawing_OH_Drawing_TypographyPaint" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("native_drawing").native.OH_Drawing_UnregisterFont, .{ .name = "check_native_drawing_OH_Drawing_UnregisterFont" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("image").native.OH_ImagePacker_Create, .{ .name = "check_image_OH_ImagePacker_Create" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("image").native.OH_ImagePacker_InitNative, .{ .name = "check_image_OH_ImagePacker_InitNative" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("image").native.OH_ImagePacker_PackToData, .{ .name = "check_image_OH_ImagePacker_PackToData" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("image").native.OH_ImagePacker_PackToFile, .{ .name = "check_image_OH_ImagePacker_PackToFile" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("image").native.OH_ImagePacker_Release, .{ .name = "check_image_OH_ImagePacker_Release" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_ImageSource_Create, .{ .name = "check_image_OH_ImageSource_Create" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("image").native.OH_ImageSource_CreateFromData, .{ .name = "check_image_OH_ImageSource_CreateFromData" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("image").native.OH_ImageSource_CreateFromFd, .{ .name = "check_image_OH_ImageSource_CreateFromFd" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("image").native.OH_ImageSource_CreateFromRawFile, .{ .name = "check_image_OH_ImageSource_CreateFromRawFile" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("image").native.OH_ImageSource_CreateFromUri, .{ .name = "check_image_OH_ImageSource_CreateFromUri" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_ImageSource_CreateIncremental, .{ .name = "check_image_OH_ImageSource_CreateIncremental" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("image").native.OH_ImageSource_CreateIncrementalFromData, .{ .name = "check_image_OH_ImageSource_CreateIncrementalFromData" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_ImageSource_CreatePixelMapList, .{ .name = "check_image_OH_ImageSource_CreatePixelMapList" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_ImageSource_GetDelayTime, .{ .name = "check_image_OH_ImageSource_GetDelayTime" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_ImageSource_GetImageInfo, .{ .name = "check_image_OH_ImageSource_GetImageInfo" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_ImageSource_GetImageProperty, .{ .name = "check_image_OH_ImageSource_GetImageProperty" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_ImageSource_GetSupportedFormats, .{ .name = "check_image_OH_ImageSource_GetSupportedFormats" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_ImageSource_ModifyImageProperty, .{ .name = "check_image_OH_ImageSource_ModifyImageProperty" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_ImageSource_UpdateData, .{ .name = "check_image_OH_ImageSource_UpdateData" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_Image_ClipRect, .{ .name = "check_image_OH_Image_ClipRect" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_Image_Format, .{ .name = "check_image_OH_Image_Format" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_Image_Receiver_CreateImageReceiver, .{ .name = "check_image_OH_Image_Receiver_CreateImageReceiver" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_Image_Receiver_GetCapacity, .{ .name = "check_image_OH_Image_Receiver_GetCapacity" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_Image_Receiver_GetFormat, .{ .name = "check_image_OH_Image_Receiver_GetFormat" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_Image_Receiver_GetReceivingSurfaceId, .{ .name = "check_image_OH_Image_Receiver_GetReceivingSurfaceId" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_Image_Receiver_GetSize, .{ .name = "check_image_OH_Image_Receiver_GetSize" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_Image_Receiver_InitImageReceiverNative, .{ .name = "check_image_OH_Image_Receiver_InitImageReceiverNative" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_Image_Receiver_On, .{ .name = "check_image_OH_Image_Receiver_On" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_Image_Receiver_ReadLatestImage, .{ .name = "check_image_OH_Image_Receiver_ReadLatestImage" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_Image_Receiver_ReadNextImage, .{ .name = "check_image_OH_Image_Receiver_ReadNextImage" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_Image_Receiver_Release, .{ .name = "check_image_OH_Image_Receiver_Release" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_PixelMap_AccessPixels, .{ .name = "check_image_OH_PixelMap_AccessPixels" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_PixelMap_CreateAlphaPixelMap, .{ .name = "check_image_OH_PixelMap_CreateAlphaPixelMap" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_PixelMap_CreatePixelMap, .{ .name = "check_image_OH_PixelMap_CreatePixelMap" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image").native.OH_PixelMap_CreatePixelMapWithStride, .{ .name = "check_image_OH_PixelMap_CreatePixelMapWithStride" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_PixelMap_Crop, .{ .name = "check_image_OH_PixelMap_Crop" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_PixelMap_Flip, .{ .name = "check_image_OH_PixelMap_Flip" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_PixelMap_GetBytesNumberPerRow, .{ .name = "check_image_OH_PixelMap_GetBytesNumberPerRow" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_PixelMap_GetDensity, .{ .name = "check_image_OH_PixelMap_GetDensity" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_PixelMap_GetIsEditable, .{ .name = "check_image_OH_PixelMap_GetIsEditable" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_PixelMap_IsSupportAlpha, .{ .name = "check_image_OH_PixelMap_IsSupportAlpha" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image").native.OH_PixelMap_ScaleWithAntiAliasing, .{ .name = "check_image_OH_PixelMap_ScaleWithAntiAliasing" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_PixelMap_SetAlphaAble, .{ .name = "check_image_OH_PixelMap_SetAlphaAble" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_PixelMap_SetDensity, .{ .name = "check_image_OH_PixelMap_SetDensity" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_PixelMap_Translate, .{ .name = "check_image_OH_PixelMap_Translate" });
    }
    if (options.compile_check_api >= 10) {
        @export(&@import("image").native.OH_PixelMap_UnAccessPixels, .{ .name = "check_image_OH_PixelMap_UnAccessPixels" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_AuxiliaryPictureInfo_Create, .{ .name = "check_image_native_OH_AuxiliaryPictureInfo_Create" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_AuxiliaryPictureInfo_GetPixelFormat, .{ .name = "check_image_native_OH_AuxiliaryPictureInfo_GetPixelFormat" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_AuxiliaryPictureInfo_GetRowStride, .{ .name = "check_image_native_OH_AuxiliaryPictureInfo_GetRowStride" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_AuxiliaryPictureInfo_GetSize, .{ .name = "check_image_native_OH_AuxiliaryPictureInfo_GetSize" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_AuxiliaryPictureInfo_GetType, .{ .name = "check_image_native_OH_AuxiliaryPictureInfo_GetType" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_AuxiliaryPictureInfo_Release, .{ .name = "check_image_native_OH_AuxiliaryPictureInfo_Release" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_AuxiliaryPictureInfo_SetPixelFormat, .{ .name = "check_image_native_OH_AuxiliaryPictureInfo_SetPixelFormat" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_AuxiliaryPictureInfo_SetRowStride, .{ .name = "check_image_native_OH_AuxiliaryPictureInfo_SetRowStride" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_AuxiliaryPictureInfo_SetSize, .{ .name = "check_image_native_OH_AuxiliaryPictureInfo_SetSize" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_AuxiliaryPictureInfo_SetType, .{ .name = "check_image_native_OH_AuxiliaryPictureInfo_SetType" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_AuxiliaryPictureNative_Create, .{ .name = "check_image_native_OH_AuxiliaryPictureNative_Create" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_AuxiliaryPictureNative_GetInfo, .{ .name = "check_image_native_OH_AuxiliaryPictureNative_GetInfo" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_AuxiliaryPictureNative_GetMetadata, .{ .name = "check_image_native_OH_AuxiliaryPictureNative_GetMetadata" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_AuxiliaryPictureNative_GetType, .{ .name = "check_image_native_OH_AuxiliaryPictureNative_GetType" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_AuxiliaryPictureNative_ReadPixels, .{ .name = "check_image_native_OH_AuxiliaryPictureNative_ReadPixels" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_AuxiliaryPictureNative_Release, .{ .name = "check_image_native_OH_AuxiliaryPictureNative_Release" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_AuxiliaryPictureNative_SetInfo, .{ .name = "check_image_native_OH_AuxiliaryPictureNative_SetInfo" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_AuxiliaryPictureNative_SetMetadata, .{ .name = "check_image_native_OH_AuxiliaryPictureNative_SetMetadata" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_AuxiliaryPictureNative_WritePixels, .{ .name = "check_image_native_OH_AuxiliaryPictureNative_WritePixels" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_ComposeOptions_Create, .{ .name = "check_image_native_OH_ComposeOptions_Create" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_ComposeOptions_GetDesiredPixelFormat, .{ .name = "check_image_native_OH_ComposeOptions_GetDesiredPixelFormat" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_ComposeOptions_Release, .{ .name = "check_image_native_OH_ComposeOptions_Release" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_ComposeOptions_SetDesiredPixelFormat, .{ .name = "check_image_native_OH_ComposeOptions_SetDesiredPixelFormat" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_DecodingOptionsForPicture_Create, .{ .name = "check_image_native_OH_DecodingOptionsForPicture_Create" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_DecodingOptionsForPicture_GetDesiredAuxiliaryPictures, .{ .name = "check_image_native_OH_DecodingOptionsForPicture_GetDesiredAuxiliaryPictures" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_DecodingOptionsForPicture_Release, .{ .name = "check_image_native_OH_DecodingOptionsForPicture_Release" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_DecodingOptionsForPicture_SetDesiredAuxiliaryPictures, .{ .name = "check_image_native_OH_DecodingOptionsForPicture_SetDesiredAuxiliaryPictures" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("image_native").native.OH_DecodingOptions_GetCropAndScaleStrategy, .{ .name = "check_image_native_OH_DecodingOptions_GetCropAndScaleStrategy" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("image_native").native.OH_DecodingOptions_GetCropRegion, .{ .name = "check_image_native_OH_DecodingOptions_GetCropRegion" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("image_native").native.OH_DecodingOptions_GetDesiredColorSpace, .{ .name = "check_image_native_OH_DecodingOptions_GetDesiredColorSpace" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_DecodingOptions_GetDesiredDynamicRange, .{ .name = "check_image_native_OH_DecodingOptions_GetDesiredDynamicRange" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_DecodingOptions_GetDesiredRegion, .{ .name = "check_image_native_OH_DecodingOptions_GetDesiredRegion" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_DecodingOptions_GetDesiredSize, .{ .name = "check_image_native_OH_DecodingOptions_GetDesiredSize" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_DecodingOptions_GetIndex, .{ .name = "check_image_native_OH_DecodingOptions_GetIndex" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_DecodingOptions_GetPixelFormat, .{ .name = "check_image_native_OH_DecodingOptions_GetPixelFormat" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_DecodingOptions_GetRotate, .{ .name = "check_image_native_OH_DecodingOptions_GetRotate" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("image_native").native.OH_DecodingOptions_SetCropAndScaleStrategy, .{ .name = "check_image_native_OH_DecodingOptions_SetCropAndScaleStrategy" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("image_native").native.OH_DecodingOptions_SetCropRegion, .{ .name = "check_image_native_OH_DecodingOptions_SetCropRegion" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("image_native").native.OH_DecodingOptions_SetDesiredColorSpace, .{ .name = "check_image_native_OH_DecodingOptions_SetDesiredColorSpace" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_DecodingOptions_SetDesiredDynamicRange, .{ .name = "check_image_native_OH_DecodingOptions_SetDesiredDynamicRange" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_DecodingOptions_SetDesiredRegion, .{ .name = "check_image_native_OH_DecodingOptions_SetDesiredRegion" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_DecodingOptions_SetRotate, .{ .name = "check_image_native_OH_DecodingOptions_SetRotate" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_ImageNative_GetBufferData, .{ .name = "check_image_native_OH_ImageNative_GetBufferData" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageNative_GetBufferSize, .{ .name = "check_image_native_OH_ImageNative_GetBufferSize" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageNative_GetByteBuffer, .{ .name = "check_image_native_OH_ImageNative_GetByteBuffer" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_ImageNative_GetColorSpace, .{ .name = "check_image_native_OH_ImageNative_GetColorSpace" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageNative_GetComponentTypes, .{ .name = "check_image_native_OH_ImageNative_GetComponentTypes" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_ImageNative_GetFormat, .{ .name = "check_image_native_OH_ImageNative_GetFormat" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageNative_GetPixelStride, .{ .name = "check_image_native_OH_ImageNative_GetPixelStride" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageNative_GetRowStride, .{ .name = "check_image_native_OH_ImageNative_GetRowStride" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("image_native").native.OH_ImagePackerNative_GetSupportedFormats, .{ .name = "check_image_native_OH_ImagePackerNative_GetSupportedFormats" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImagePackerNative_PackToDataFromImageSource, .{ .name = "check_image_native_OH_ImagePackerNative_PackToDataFromImageSource" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_ImagePackerNative_PackToDataFromPicture, .{ .name = "check_image_native_OH_ImagePackerNative_PackToDataFromPicture" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("image_native").native.OH_ImagePackerNative_PackToDataFromPixelmapSequence, .{ .name = "check_image_native_OH_ImagePackerNative_PackToDataFromPixelmapSequence" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImagePackerNative_PackToFileFromImageSource, .{ .name = "check_image_native_OH_ImagePackerNative_PackToFileFromImageSource" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_ImagePackerNative_PackToFileFromPicture, .{ .name = "check_image_native_OH_ImagePackerNative_PackToFileFromPicture" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("image_native").native.OH_ImagePackerNative_PackToFileFromPixelmapSequence, .{ .name = "check_image_native_OH_ImagePackerNative_PackToFileFromPixelmapSequence" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageReceiverNative_GetCapacity, .{ .name = "check_image_native_OH_ImageReceiverNative_GetCapacity" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageReceiverNative_GetSize, .{ .name = "check_image_native_OH_ImageReceiverNative_GetSize" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageReceiverNative_Off, .{ .name = "check_image_native_OH_ImageReceiverNative_Off" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("image_native").native.OH_ImageReceiverNative_OffImageArrive, .{ .name = "check_image_native_OH_ImageReceiverNative_OffImageArrive" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageReceiverNative_On, .{ .name = "check_image_native_OH_ImageReceiverNative_On" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("image_native").native.OH_ImageReceiverNative_OnImageArrive, .{ .name = "check_image_native_OH_ImageReceiverNative_OnImageArrive" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageReceiverNative_ReadNextImage, .{ .name = "check_image_native_OH_ImageReceiverNative_ReadNextImage" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageReceiverOptions_GetCapacity, .{ .name = "check_image_native_OH_ImageReceiverOptions_GetCapacity" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageReceiverOptions_GetSize, .{ .name = "check_image_native_OH_ImageReceiverOptions_GetSize" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageSourceInfo_Create, .{ .name = "check_image_native_OH_ImageSourceInfo_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageSourceInfo_GetDynamicRange, .{ .name = "check_image_native_OH_ImageSourceInfo_GetDynamicRange" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageSourceInfo_GetHeight, .{ .name = "check_image_native_OH_ImageSourceInfo_GetHeight" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("image_native").native.OH_ImageSourceInfo_GetMimeType, .{ .name = "check_image_native_OH_ImageSourceInfo_GetMimeType" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageSourceInfo_GetWidth, .{ .name = "check_image_native_OH_ImageSourceInfo_GetWidth" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageSourceInfo_Release, .{ .name = "check_image_native_OH_ImageSourceInfo_Release" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("image_native").native.OH_ImageSourceNative_CreateFromDataWithUserBuffer, .{ .name = "check_image_native_OH_ImageSourceNative_CreateFromDataWithUserBuffer" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageSourceNative_CreateFromRawFile, .{ .name = "check_image_native_OH_ImageSourceNative_CreateFromRawFile" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageSourceNative_CreateFromUri, .{ .name = "check_image_native_OH_ImageSourceNative_CreateFromUri" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_ImageSourceNative_CreatePicture, .{ .name = "check_image_native_OH_ImageSourceNative_CreatePicture" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("image_native").native.OH_ImageSourceNative_CreatePictureAtIndex, .{ .name = "check_image_native_OH_ImageSourceNative_CreatePictureAtIndex" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageSourceNative_CreatePixelmapList, .{ .name = "check_image_native_OH_ImageSourceNative_CreatePixelmapList" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("image_native").native.OH_ImageSourceNative_CreatePixelmapUsingAllocator, .{ .name = "check_image_native_OH_ImageSourceNative_CreatePixelmapUsingAllocator" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageSourceNative_GetDelayTimeList, .{ .name = "check_image_native_OH_ImageSourceNative_GetDelayTimeList" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageSourceNative_GetImageInfo, .{ .name = "check_image_native_OH_ImageSourceNative_GetImageInfo" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageSourceNative_GetImageProperty, .{ .name = "check_image_native_OH_ImageSourceNative_GetImageProperty" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_ImageSourceNative_GetImagePropertyArraySize, .{ .name = "check_image_native_OH_ImageSourceNative_GetImagePropertyArraySize" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_ImageSourceNative_GetImagePropertyBlob, .{ .name = "check_image_native_OH_ImageSourceNative_GetImagePropertyBlob" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_ImageSourceNative_GetImagePropertyDouble, .{ .name = "check_image_native_OH_ImageSourceNative_GetImagePropertyDouble" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_ImageSourceNative_GetImagePropertyDoubleArray, .{ .name = "check_image_native_OH_ImageSourceNative_GetImagePropertyDoubleArray" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_ImageSourceNative_GetImagePropertyIntArray, .{ .name = "check_image_native_OH_ImageSourceNative_GetImagePropertyIntArray" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_ImageSourceNative_GetImagePropertyLong, .{ .name = "check_image_native_OH_ImageSourceNative_GetImagePropertyLong" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_ImageSourceNative_GetImagePropertyShort, .{ .name = "check_image_native_OH_ImageSourceNative_GetImagePropertyShort" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_ImageSourceNative_GetImagePropertyString, .{ .name = "check_image_native_OH_ImageSourceNative_GetImagePropertyString" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("image_native").native.OH_ImageSourceNative_GetImagePropertyWithNull, .{ .name = "check_image_native_OH_ImageSourceNative_GetImagePropertyWithNull" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("image_native").native.OH_ImageSourceNative_GetSupportedFormats, .{ .name = "check_image_native_OH_ImageSourceNative_GetSupportedFormats" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_ImageSourceNative_ModifyImageProperty, .{ .name = "check_image_native_OH_ImageSourceNative_ModifyImageProperty" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_ImageSourceNative_ModifyImagePropertyBlob, .{ .name = "check_image_native_OH_ImageSourceNative_ModifyImagePropertyBlob" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_ImageSourceNative_ModifyImagePropertyDouble, .{ .name = "check_image_native_OH_ImageSourceNative_ModifyImagePropertyDouble" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_ImageSourceNative_ModifyImagePropertyDoubleArray, .{ .name = "check_image_native_OH_ImageSourceNative_ModifyImagePropertyDoubleArray" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_ImageSourceNative_ModifyImagePropertyIntArray, .{ .name = "check_image_native_OH_ImageSourceNative_ModifyImagePropertyIntArray" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_ImageSourceNative_ModifyImagePropertyLong, .{ .name = "check_image_native_OH_ImageSourceNative_ModifyImagePropertyLong" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_ImageSourceNative_ModifyImagePropertyShort, .{ .name = "check_image_native_OH_ImageSourceNative_ModifyImagePropertyShort" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("image_native").native.OH_PackingOptionsForSequence_Create, .{ .name = "check_image_native_OH_PackingOptionsForSequence_Create" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("image_native").native.OH_PackingOptionsForSequence_GetDelayTimeList, .{ .name = "check_image_native_OH_PackingOptionsForSequence_GetDelayTimeList" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("image_native").native.OH_PackingOptionsForSequence_GetDisposalTypes, .{ .name = "check_image_native_OH_PackingOptionsForSequence_GetDisposalTypes" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("image_native").native.OH_PackingOptionsForSequence_GetFrameCount, .{ .name = "check_image_native_OH_PackingOptionsForSequence_GetFrameCount" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("image_native").native.OH_PackingOptionsForSequence_GetLoopCount, .{ .name = "check_image_native_OH_PackingOptionsForSequence_GetLoopCount" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("image_native").native.OH_PackingOptionsForSequence_Release, .{ .name = "check_image_native_OH_PackingOptionsForSequence_Release" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("image_native").native.OH_PackingOptionsForSequence_SetDelayTimeList, .{ .name = "check_image_native_OH_PackingOptionsForSequence_SetDelayTimeList" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("image_native").native.OH_PackingOptionsForSequence_SetDisposalTypes, .{ .name = "check_image_native_OH_PackingOptionsForSequence_SetDisposalTypes" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("image_native").native.OH_PackingOptionsForSequence_SetFrameCount, .{ .name = "check_image_native_OH_PackingOptionsForSequence_SetFrameCount" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("image_native").native.OH_PackingOptionsForSequence_SetLoopCount, .{ .name = "check_image_native_OH_PackingOptionsForSequence_SetLoopCount" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PackingOptions_GetDesiredDynamicRange, .{ .name = "check_image_native_OH_PackingOptions_GetDesiredDynamicRange" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PackingOptions_GetMimeType, .{ .name = "check_image_native_OH_PackingOptions_GetMimeType" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("image_native").native.OH_PackingOptions_GetMimeTypeWithNull, .{ .name = "check_image_native_OH_PackingOptions_GetMimeTypeWithNull" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PackingOptions_GetNeedsPackProperties, .{ .name = "check_image_native_OH_PackingOptions_GetNeedsPackProperties" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PackingOptions_GetQuality, .{ .name = "check_image_native_OH_PackingOptions_GetQuality" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PackingOptions_SetDesiredDynamicRange, .{ .name = "check_image_native_OH_PackingOptions_SetDesiredDynamicRange" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PackingOptions_SetNeedsPackProperties, .{ .name = "check_image_native_OH_PackingOptions_SetNeedsPackProperties" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_PictureMetadata_Clone, .{ .name = "check_image_native_OH_PictureMetadata_Clone" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_PictureMetadata_Create, .{ .name = "check_image_native_OH_PictureMetadata_Create" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_PictureMetadata_GetProperty, .{ .name = "check_image_native_OH_PictureMetadata_GetProperty" });
    }
    if (options.compile_check_api >= 19) {
        @export(&@import("image_native").native.OH_PictureMetadata_GetPropertyWithNull, .{ .name = "check_image_native_OH_PictureMetadata_GetPropertyWithNull" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_PictureMetadata_Release, .{ .name = "check_image_native_OH_PictureMetadata_Release" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_PictureMetadata_SetProperty, .{ .name = "check_image_native_OH_PictureMetadata_SetProperty" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_PictureNative_CreatePicture, .{ .name = "check_image_native_OH_PictureNative_CreatePicture" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_PictureNative_GetAuxiliaryPicture, .{ .name = "check_image_native_OH_PictureNative_GetAuxiliaryPicture" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_PictureNative_GetGainmapPixelmap, .{ .name = "check_image_native_OH_PictureNative_GetGainmapPixelmap" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_PictureNative_GetHdrComposedPixelmap, .{ .name = "check_image_native_OH_PictureNative_GetHdrComposedPixelmap" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_PictureNative_GetHdrComposedPixelmapWithOptions, .{ .name = "check_image_native_OH_PictureNative_GetHdrComposedPixelmapWithOptions" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_PictureNative_GetMainPixelmap, .{ .name = "check_image_native_OH_PictureNative_GetMainPixelmap" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_PictureNative_GetMetadata, .{ .name = "check_image_native_OH_PictureNative_GetMetadata" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_PictureNative_Release, .{ .name = "check_image_native_OH_PictureNative_Release" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_PictureNative_SetAuxiliaryPicture, .{ .name = "check_image_native_OH_PictureNative_SetAuxiliaryPicture" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_PictureNative_SetMetadata, .{ .name = "check_image_native_OH_PictureNative_SetMetadata" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapImageInfo_Create, .{ .name = "check_image_native_OH_PixelmapImageInfo_Create" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("image_native").native.OH_PixelmapImageInfo_GetAlphaMode, .{ .name = "check_image_native_OH_PixelmapImageInfo_GetAlphaMode" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapImageInfo_GetAlphaType, .{ .name = "check_image_native_OH_PixelmapImageInfo_GetAlphaType" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapImageInfo_GetDynamicRange, .{ .name = "check_image_native_OH_PixelmapImageInfo_GetDynamicRange" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapImageInfo_GetHeight, .{ .name = "check_image_native_OH_PixelmapImageInfo_GetHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapImageInfo_GetPixelFormat, .{ .name = "check_image_native_OH_PixelmapImageInfo_GetPixelFormat" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapImageInfo_GetRowStride, .{ .name = "check_image_native_OH_PixelmapImageInfo_GetRowStride" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapImageInfo_GetWidth, .{ .name = "check_image_native_OH_PixelmapImageInfo_GetWidth" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapImageInfo_Release, .{ .name = "check_image_native_OH_PixelmapImageInfo_Release" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapInitializationOptions_Create, .{ .name = "check_image_native_OH_PixelmapInitializationOptions_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapInitializationOptions_GetAlphaType, .{ .name = "check_image_native_OH_PixelmapInitializationOptions_GetAlphaType" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("image_native").native.OH_PixelmapInitializationOptions_GetEditable, .{ .name = "check_image_native_OH_PixelmapInitializationOptions_GetEditable" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapInitializationOptions_GetHeight, .{ .name = "check_image_native_OH_PixelmapInitializationOptions_GetHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapInitializationOptions_GetPixelFormat, .{ .name = "check_image_native_OH_PixelmapInitializationOptions_GetPixelFormat" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapInitializationOptions_GetRowStride, .{ .name = "check_image_native_OH_PixelmapInitializationOptions_GetRowStride" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapInitializationOptions_GetSrcPixelFormat, .{ .name = "check_image_native_OH_PixelmapInitializationOptions_GetSrcPixelFormat" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapInitializationOptions_GetWidth, .{ .name = "check_image_native_OH_PixelmapInitializationOptions_GetWidth" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapInitializationOptions_Release, .{ .name = "check_image_native_OH_PixelmapInitializationOptions_Release" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapInitializationOptions_SetAlphaType, .{ .name = "check_image_native_OH_PixelmapInitializationOptions_SetAlphaType" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("image_native").native.OH_PixelmapInitializationOptions_SetEditable, .{ .name = "check_image_native_OH_PixelmapInitializationOptions_SetEditable" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapInitializationOptions_SetHeight, .{ .name = "check_image_native_OH_PixelmapInitializationOptions_SetHeight" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapInitializationOptions_SetPixelFormat, .{ .name = "check_image_native_OH_PixelmapInitializationOptions_SetPixelFormat" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapInitializationOptions_SetRowStride, .{ .name = "check_image_native_OH_PixelmapInitializationOptions_SetRowStride" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapInitializationOptions_SetSrcPixelFormat, .{ .name = "check_image_native_OH_PixelmapInitializationOptions_SetSrcPixelFormat" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapInitializationOptions_SetWidth, .{ .name = "check_image_native_OH_PixelmapInitializationOptions_SetWidth" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("image_native").native.OH_PixelmapNative_AccessPixels, .{ .name = "check_image_native_OH_PixelmapNative_AccessPixels" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("image_native").native.OH_PixelmapNative_Clone, .{ .name = "check_image_native_OH_PixelmapNative_Clone" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapNative_ConvertAlphaFormat, .{ .name = "check_image_native_OH_PixelmapNative_ConvertAlphaFormat" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapNative_ConvertPixelmapNativeFromNapi, .{ .name = "check_image_native_OH_PixelmapNative_ConvertPixelmapNativeFromNapi" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapNative_ConvertPixelmapNativeToNapi, .{ .name = "check_image_native_OH_PixelmapNative_ConvertPixelmapNativeToNapi" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("image_native").native.OH_PixelmapNative_CreateAlphaPixelmap, .{ .name = "check_image_native_OH_PixelmapNative_CreateAlphaPixelmap" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("image_native").native.OH_PixelmapNative_CreateCroppedAndScaledPixelMap, .{ .name = "check_image_native_OH_PixelmapNative_CreateCroppedAndScaledPixelMap" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapNative_CreateEmptyPixelmap, .{ .name = "check_image_native_OH_PixelmapNative_CreateEmptyPixelmap" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("image_native").native.OH_PixelmapNative_CreateEmptyPixelmapUsingAllocator, .{ .name = "check_image_native_OH_PixelmapNative_CreateEmptyPixelmapUsingAllocator" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapNative_CreatePixelmap, .{ .name = "check_image_native_OH_PixelmapNative_CreatePixelmap" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("image_native").native.OH_PixelmapNative_CreatePixelmapFromNativeBuffer, .{ .name = "check_image_native_OH_PixelmapNative_CreatePixelmapFromNativeBuffer" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("image_native").native.OH_PixelmapNative_CreatePixelmapFromSurface, .{ .name = "check_image_native_OH_PixelmapNative_CreatePixelmapFromSurface" });
    }
    if (options.compile_check_api >= 23) {
        @export(&@import("image_native").native.OH_PixelmapNative_CreatePixelmapFromSurfaceWithTransformation, .{ .name = "check_image_native_OH_PixelmapNative_CreatePixelmapFromSurfaceWithTransformation" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("image_native").native.OH_PixelmapNative_CreatePixelmapUsingAllocator, .{ .name = "check_image_native_OH_PixelmapNative_CreatePixelmapUsingAllocator" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("image_native").native.OH_PixelmapNative_CreateScaledPixelMap, .{ .name = "check_image_native_OH_PixelmapNative_CreateScaledPixelMap" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("image_native").native.OH_PixelmapNative_CreateScaledPixelMapWithAntiAliasing, .{ .name = "check_image_native_OH_PixelmapNative_CreateScaledPixelMapWithAntiAliasing" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("image_native").native.OH_PixelmapNative_Destroy, .{ .name = "check_image_native_OH_PixelmapNative_Destroy" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("image_native").native.OH_PixelmapNative_GetAllocationByteCount, .{ .name = "check_image_native_OH_PixelmapNative_GetAllocationByteCount" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_PixelmapNative_GetArgbPixels, .{ .name = "check_image_native_OH_PixelmapNative_GetArgbPixels" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("image_native").native.OH_PixelmapNative_GetByteCount, .{ .name = "check_image_native_OH_PixelmapNative_GetByteCount" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_PixelmapNative_GetColorSpaceNative, .{ .name = "check_image_native_OH_PixelmapNative_GetColorSpaceNative" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapNative_GetImageInfo, .{ .name = "check_image_native_OH_PixelmapNative_GetImageInfo" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapNative_GetMetadata, .{ .name = "check_image_native_OH_PixelmapNative_GetMetadata" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapNative_GetNativeBuffer, .{ .name = "check_image_native_OH_PixelmapNative_GetNativeBuffer" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("image_native").native.OH_PixelmapNative_GetUniqueId, .{ .name = "check_image_native_OH_PixelmapNative_GetUniqueId" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("image_native").native.OH_PixelmapNative_IsReleased, .{ .name = "check_image_native_OH_PixelmapNative_IsReleased" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapNative_Opacity, .{ .name = "check_image_native_OH_PixelmapNative_Opacity" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("image_native").native.OH_PixelmapNative_ReadPixelsFromArea, .{ .name = "check_image_native_OH_PixelmapNative_ReadPixelsFromArea" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapNative_ScaleWithAntiAliasing, .{ .name = "check_image_native_OH_PixelmapNative_ScaleWithAntiAliasing" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_PixelmapNative_SetColorSpaceNative, .{ .name = "check_image_native_OH_PixelmapNative_SetColorSpaceNative" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("image_native").native.OH_PixelmapNative_SetMemoryName, .{ .name = "check_image_native_OH_PixelmapNative_SetMemoryName" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapNative_SetMetadata, .{ .name = "check_image_native_OH_PixelmapNative_SetMetadata" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapNative_ToSdr, .{ .name = "check_image_native_OH_PixelmapNative_ToSdr" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("image_native").native.OH_PixelmapNative_Translate, .{ .name = "check_image_native_OH_PixelmapNative_Translate" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("image_native").native.OH_PixelmapNative_UnaccessPixels, .{ .name = "check_image_native_OH_PixelmapNative_UnaccessPixels" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("image_native").native.OH_PixelmapNative_WritePixelsToArea, .{ .name = "check_image_native_OH_PixelmapNative_WritePixelsToArea" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("input_method").native.OH_AttachOptions_IsShowKeyboard, .{ .name = "check_input_method_OH_AttachOptions_IsShowKeyboard" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("input_method").native.OH_CursorInfo_Create, .{ .name = "check_input_method_OH_CursorInfo_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("input_method").native.OH_CursorInfo_Destroy, .{ .name = "check_input_method_OH_CursorInfo_Destroy" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("input_method").native.OH_CursorInfo_GetRect, .{ .name = "check_input_method_OH_CursorInfo_GetRect" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("input_method").native.OH_CursorInfo_SetRect, .{ .name = "check_input_method_OH_CursorInfo_SetRect" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("input_method").native.OH_InputMethodProxy_HideKeyboard, .{ .name = "check_input_method_OH_InputMethodProxy_HideKeyboard" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("input_method").native.OH_PrivateCommand_Create, .{ .name = "check_input_method_OH_PrivateCommand_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("input_method").native.OH_PrivateCommand_Destroy, .{ .name = "check_input_method_OH_PrivateCommand_Destroy" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("input_method").native.OH_TextConfig_Create, .{ .name = "check_input_method_OH_TextConfig_Create" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("input_method").native.OH_TextConfig_Destroy, .{ .name = "check_input_method_OH_TextConfig_Destroy" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("input_method").native.OH_TextConfig_GetCursorInfo, .{ .name = "check_input_method_OH_TextConfig_GetCursorInfo" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("input_method").native.OH_TextConfig_GetEnterKeyType, .{ .name = "check_input_method_OH_TextConfig_GetEnterKeyType" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("input_method").native.OH_TextConfig_GetInputType, .{ .name = "check_input_method_OH_TextConfig_GetInputType" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("input_method").native.OH_TextConfig_GetSelection, .{ .name = "check_input_method_OH_TextConfig_GetSelection" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("input_method").native.OH_TextConfig_GetWindowId, .{ .name = "check_input_method_OH_TextConfig_GetWindowId" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("input_method").native.OH_TextConfig_IsPreviewTextSupported, .{ .name = "check_input_method_OH_TextConfig_IsPreviewTextSupported" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("input_method").native.OH_TextConfig_SetPreviewTextSupport, .{ .name = "check_input_method_OH_TextConfig_SetPreviewTextSupport" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("input_method").native.OH_TextConfig_SetSelection, .{ .name = "check_input_method_OH_TextConfig_SetSelection" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("input_method").native.OH_TextConfig_SetWindowId, .{ .name = "check_input_method_OH_TextConfig_SetWindowId" });
    }
    if (options.compile_check_api >= 22) {
        @export(&@import("input_method").native.OH_TextEditorProxy_SetCallbackInMainThread, .{ .name = "check_input_method_OH_TextEditorProxy_SetCallbackInMainThread" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("jsvm").native.OH_JSVM_AcquireLock, .{ .name = "check_jsvm_OH_JSVM_AcquireLock" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_AddFinalizer, .{ .name = "check_jsvm_OH_JSVM_AddFinalizer" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_AdjustExternalMemory, .{ .name = "check_jsvm_OH_JSVM_AdjustExternalMemory" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_CallFunction, .{ .name = "check_jsvm_OH_JSVM_CallFunction" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_CheckObjectTypeTag, .{ .name = "check_jsvm_OH_JSVM_CheckObjectTypeTag" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_CreateArrayWithLength, .{ .name = "check_jsvm_OH_JSVM_CreateArrayWithLength" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_CreateArraybuffer, .{ .name = "check_jsvm_OH_JSVM_CreateArraybuffer" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_CreateBigintInt64, .{ .name = "check_jsvm_OH_JSVM_CreateBigintInt64" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_CreateBigintUint64, .{ .name = "check_jsvm_OH_JSVM_CreateBigintUint64" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_CreateBigintWords, .{ .name = "check_jsvm_OH_JSVM_CreateBigintWords" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_CreateDataview, .{ .name = "check_jsvm_OH_JSVM_CreateDataview" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_CreateDate, .{ .name = "check_jsvm_OH_JSVM_CreateDate" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_CreateExternal, .{ .name = "check_jsvm_OH_JSVM_CreateExternal" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_CreateFunction, .{ .name = "check_jsvm_OH_JSVM_CreateFunction" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_CreateInt32, .{ .name = "check_jsvm_OH_JSVM_CreateInt32" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_CreateInt64, .{ .name = "check_jsvm_OH_JSVM_CreateInt64" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_CreateObject, .{ .name = "check_jsvm_OH_JSVM_CreateObject" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_CreatePromise, .{ .name = "check_jsvm_OH_JSVM_CreatePromise" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_CreateSymbol, .{ .name = "check_jsvm_OH_JSVM_CreateSymbol" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_CreateTypedarray, .{ .name = "check_jsvm_OH_JSVM_CreateTypedarray" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_CreateUint32, .{ .name = "check_jsvm_OH_JSVM_CreateUint32" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_DefineProperties, .{ .name = "check_jsvm_OH_JSVM_DefineProperties" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_DeleteElement, .{ .name = "check_jsvm_OH_JSVM_DeleteElement" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_DeleteProperty, .{ .name = "check_jsvm_OH_JSVM_DeleteProperty" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_DetachArraybuffer, .{ .name = "check_jsvm_OH_JSVM_DetachArraybuffer" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("jsvm").native.OH_JSVM_Equals, .{ .name = "check_jsvm_OH_JSVM_Equals" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetArrayLength, .{ .name = "check_jsvm_OH_JSVM_GetArrayLength" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetArraybufferInfo, .{ .name = "check_jsvm_OH_JSVM_GetArraybufferInfo" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetBoolean, .{ .name = "check_jsvm_OH_JSVM_GetBoolean" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetCbInfo, .{ .name = "check_jsvm_OH_JSVM_GetCbInfo" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetDataviewInfo, .{ .name = "check_jsvm_OH_JSVM_GetDataviewInfo" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetDateValue, .{ .name = "check_jsvm_OH_JSVM_GetDateValue" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetElement, .{ .name = "check_jsvm_OH_JSVM_GetElement" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetGlobal, .{ .name = "check_jsvm_OH_JSVM_GetGlobal" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetNamedProperty, .{ .name = "check_jsvm_OH_JSVM_GetNamedProperty" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetNewTarget, .{ .name = "check_jsvm_OH_JSVM_GetNewTarget" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetNull, .{ .name = "check_jsvm_OH_JSVM_GetNull" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetProperty, .{ .name = "check_jsvm_OH_JSVM_GetProperty" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetPropertyNames, .{ .name = "check_jsvm_OH_JSVM_GetPropertyNames" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetPrototype, .{ .name = "check_jsvm_OH_JSVM_GetPrototype" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetTypedarrayInfo, .{ .name = "check_jsvm_OH_JSVM_GetTypedarrayInfo" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetUndefined, .{ .name = "check_jsvm_OH_JSVM_GetUndefined" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetValueBigintInt64, .{ .name = "check_jsvm_OH_JSVM_GetValueBigintInt64" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetValueBigintUint64, .{ .name = "check_jsvm_OH_JSVM_GetValueBigintUint64" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetValueBigintWords, .{ .name = "check_jsvm_OH_JSVM_GetValueBigintWords" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetValueBool, .{ .name = "check_jsvm_OH_JSVM_GetValueBool" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetValueExternal, .{ .name = "check_jsvm_OH_JSVM_GetValueExternal" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetValueInt32, .{ .name = "check_jsvm_OH_JSVM_GetValueInt32" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetValueInt64, .{ .name = "check_jsvm_OH_JSVM_GetValueInt64" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetValueUint32, .{ .name = "check_jsvm_OH_JSVM_GetValueUint32" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_GetVersion, .{ .name = "check_jsvm_OH_JSVM_GetVersion" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_HasElement, .{ .name = "check_jsvm_OH_JSVM_HasElement" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_HasNamedProperty, .{ .name = "check_jsvm_OH_JSVM_HasNamedProperty" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_HasOwnProperty, .{ .name = "check_jsvm_OH_JSVM_HasOwnProperty" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_HasProperty, .{ .name = "check_jsvm_OH_JSVM_HasProperty" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_Instanceof, .{ .name = "check_jsvm_OH_JSVM_Instanceof" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_IsArray, .{ .name = "check_jsvm_OH_JSVM_IsArray" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_IsArraybuffer, .{ .name = "check_jsvm_OH_JSVM_IsArraybuffer" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("jsvm").native.OH_JSVM_IsCallable, .{ .name = "check_jsvm_OH_JSVM_IsCallable" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_IsDataview, .{ .name = "check_jsvm_OH_JSVM_IsDataview" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_IsDate, .{ .name = "check_jsvm_OH_JSVM_IsDate" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_IsDetachedArraybuffer, .{ .name = "check_jsvm_OH_JSVM_IsDetachedArraybuffer" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_IsExceptionPending, .{ .name = "check_jsvm_OH_JSVM_IsExceptionPending" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("jsvm").native.OH_JSVM_IsLocked, .{ .name = "check_jsvm_OH_JSVM_IsLocked" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_IsPromise, .{ .name = "check_jsvm_OH_JSVM_IsPromise" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_IsTypedarray, .{ .name = "check_jsvm_OH_JSVM_IsTypedarray" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_JsonParse, .{ .name = "check_jsvm_OH_JSVM_JsonParse" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_JsonStringify, .{ .name = "check_jsvm_OH_JSVM_JsonStringify" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_NewInstance, .{ .name = "check_jsvm_OH_JSVM_NewInstance" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_ObjectFreeze, .{ .name = "check_jsvm_OH_JSVM_ObjectFreeze" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_ObjectSeal, .{ .name = "check_jsvm_OH_JSVM_ObjectSeal" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_ReferenceRef, .{ .name = "check_jsvm_OH_JSVM_ReferenceRef" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_ReferenceUnref, .{ .name = "check_jsvm_OH_JSVM_ReferenceUnref" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_RejectDeferred, .{ .name = "check_jsvm_OH_JSVM_RejectDeferred" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("jsvm").native.OH_JSVM_ReleaseLock, .{ .name = "check_jsvm_OH_JSVM_ReleaseLock" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_RemoveWrap, .{ .name = "check_jsvm_OH_JSVM_RemoveWrap" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_ResolveDeferred, .{ .name = "check_jsvm_OH_JSVM_ResolveDeferred" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_SetElement, .{ .name = "check_jsvm_OH_JSVM_SetElement" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_SetNamedProperty, .{ .name = "check_jsvm_OH_JSVM_SetNamedProperty" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_SetProperty, .{ .name = "check_jsvm_OH_JSVM_SetProperty" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_StrictEquals, .{ .name = "check_jsvm_OH_JSVM_StrictEquals" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_Throw, .{ .name = "check_jsvm_OH_JSVM_Throw" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_ThrowError, .{ .name = "check_jsvm_OH_JSVM_ThrowError" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_ThrowRangeError, .{ .name = "check_jsvm_OH_JSVM_ThrowRangeError" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_ThrowTypeError, .{ .name = "check_jsvm_OH_JSVM_ThrowTypeError" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_TypeTagObject, .{ .name = "check_jsvm_OH_JSVM_TypeTagObject" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_Typeof, .{ .name = "check_jsvm_OH_JSVM_Typeof" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_Unwrap, .{ .name = "check_jsvm_OH_JSVM_Unwrap" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("jsvm").native.OH_JSVM_Wrap, .{ .name = "check_jsvm_OH_JSVM_Wrap" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("net_connection").native.OH_NetConn_GetPacUrl, .{ .name = "check_net_connection_OH_NetConn_GetPacUrl" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("net_connection").native.OH_NetConn_QueryProbeResult, .{ .name = "check_net_connection_OH_NetConn_QueryProbeResult" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("net_connection").native.OH_NetConn_QueryTraceRoute, .{ .name = "check_net_connection_OH_NetConn_QueryTraceRoute" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("net_connection").native.OH_NetConn_RegisterAppHttpProxyCallback, .{ .name = "check_net_connection_OH_NetConn_RegisterAppHttpProxyCallback" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("net_connection").native.OH_NetConn_RegisterDnsResolver, .{ .name = "check_net_connection_OH_NetConn_RegisterDnsResolver" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("net_connection").native.OH_NetConn_SetAppHttpProxy, .{ .name = "check_net_connection_OH_NetConn_SetAppHttpProxy" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("net_connection").native.OH_NetConn_SetPacUrl, .{ .name = "check_net_connection_OH_NetConn_SetPacUrl" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("net_connection").native.OH_NetConn_UnregisterAppHttpProxyCallback, .{ .name = "check_net_connection_OH_NetConn_UnregisterAppHttpProxyCallback" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("net_connection").native.OH_NetConn_UnregisterDnsResolver, .{ .name = "check_net_connection_OH_NetConn_UnregisterDnsResolver" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("net_stack").native.OH_Http_DestroyHeaderEntries, .{ .name = "check_net_stack_OH_Http_DestroyHeaderEntries" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("net_stack").native.OH_Http_GetHeaderEntries, .{ .name = "check_net_stack_OH_Http_GetHeaderEntries" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("net_stack").native.OH_Http_GetHeaderValue, .{ .name = "check_net_stack_OH_Http_GetHeaderValue" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("net_stack").native.OH_NetStack_GetPinSetForHostName, .{ .name = "check_net_stack_OH_NetStack_GetPinSetForHostName" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("net_stack").native.OH_Netstack_IsCleartextCfgByComponent, .{ .name = "check_net_stack_OH_Netstack_IsCleartextCfgByComponent" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("net_stack").native.OH_Netstack_IsCleartextPermitted, .{ .name = "check_net_stack_OH_Netstack_IsCleartextPermitted" });
    }
    if (options.compile_check_api >= 18) {
        @export(&@import("net_stack").native.OH_Netstack_IsCleartextPermittedByHostName, .{ .name = "check_net_stack_OH_Netstack_IsCleartextPermittedByHostName" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("resource_manager").native.OH_ResourceManager_CloseRawFile, .{ .name = "check_resource_manager_OH_ResourceManager_CloseRawFile" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("resource_manager").native.OH_ResourceManager_GetRawFileDescriptorData, .{ .name = "check_resource_manager_OH_ResourceManager_GetRawFileDescriptorData" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("resource_manager").native.OH_ResourceManager_GetRawFileOffset, .{ .name = "check_resource_manager_OH_ResourceManager_GetRawFileOffset" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("resource_manager").native.OH_ResourceManager_GetRawFileRemainingLength, .{ .name = "check_resource_manager_OH_ResourceManager_GetRawFileRemainingLength" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("resource_manager").native.OH_ResourceManager_GetRawFileSize, .{ .name = "check_resource_manager_OH_ResourceManager_GetRawFileSize" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("resource_manager").native.OH_ResourceManager_OpenRawFile, .{ .name = "check_resource_manager_OH_ResourceManager_OpenRawFile" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("resource_manager").native.OH_ResourceManager_ReadRawFile, .{ .name = "check_resource_manager_OH_ResourceManager_ReadRawFile" });
    }
    if (options.compile_check_api >= 8) {
        @export(&@import("resource_manager").native.OH_ResourceManager_SeekRawFile, .{ .name = "check_resource_manager_OH_ResourceManager_SeekRawFile" });
    }
    if (options.compile_check_api >= 11) {
        @export(&@import("sensor").native.OH_SensorSubscriptionAttribute_GetSamplingInterval, .{ .name = "check_sensor_OH_SensorSubscriptionAttribute_GetSamplingInterval" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("udmf").native.OH_UdmfDataLoadInfo_Create, .{ .name = "check_udmf_OH_UdmfDataLoadInfo_Create" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("udmf").native.OH_UdmfDataLoadInfo_Destroy, .{ .name = "check_udmf_OH_UdmfDataLoadInfo_Destroy" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("udmf").native.OH_UdmfDataLoadParams_Create, .{ .name = "check_udmf_OH_UdmfDataLoadParams_Create" });
    }
    if (options.compile_check_api >= 20) {
        @export(&@import("udmf").native.OH_UdmfDataLoadParams_Destroy, .{ .name = "check_udmf_OH_UdmfDataLoadParams_Destroy" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("udmf").native.OH_UdmfGetDataParams_Create, .{ .name = "check_udmf_OH_UdmfGetDataParams_Create" });
    }
    if (options.compile_check_api >= 15) {
        @export(&@import("udmf").native.OH_UdmfGetDataParams_Destroy, .{ .name = "check_udmf_OH_UdmfGetDataParams_Destroy" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("udmf").native.OH_UdsPlainText_GetType, .{ .name = "check_udmf_OH_UdsPlainText_GetType" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("native_vsync").native.OH_NativeVSync_RequestFrameWithMultiCallback, .{ .name = "check_native_vsync_OH_NativeVSync_RequestFrameWithMultiCallback" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebHttpBodyStream_GetSize, .{ .name = "check_web_OH_ArkWebHttpBodyStream_GetSize" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebHttpBodyStream_GetUserData, .{ .name = "check_web_OH_ArkWebHttpBodyStream_GetUserData" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebHttpBodyStream_Init, .{ .name = "check_web_OH_ArkWebHttpBodyStream_Init" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebHttpBodyStream_IsChunked, .{ .name = "check_web_OH_ArkWebHttpBodyStream_IsChunked" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebHttpBodyStream_IsEof, .{ .name = "check_web_OH_ArkWebHttpBodyStream_IsEof" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebHttpBodyStream_IsInMemory, .{ .name = "check_web_OH_ArkWebHttpBodyStream_IsInMemory" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebHttpBodyStream_Read, .{ .name = "check_web_OH_ArkWebHttpBodyStream_Read" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebHttpBodyStream_SetReadCallback, .{ .name = "check_web_OH_ArkWebHttpBodyStream_SetReadCallback" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebHttpBodyStream_SetUserData, .{ .name = "check_web_OH_ArkWebHttpBodyStream_SetUserData" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebRequestHeaderList_Destroy, .{ .name = "check_web_OH_ArkWebRequestHeaderList_Destroy" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebRequestHeaderList_GetHeader, .{ .name = "check_web_OH_ArkWebRequestHeaderList_GetHeader" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebRequestHeaderList_GetSize, .{ .name = "check_web_OH_ArkWebRequestHeaderList_GetSize" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebResourceRequest_GetFrameUrl, .{ .name = "check_web_OH_ArkWebResourceRequest_GetFrameUrl" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebResourceRequest_GetHttpBodyStream, .{ .name = "check_web_OH_ArkWebResourceRequest_GetHttpBodyStream" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebResourceRequest_GetReferrer, .{ .name = "check_web_OH_ArkWebResourceRequest_GetReferrer" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebResourceRequest_GetRequestHeaders, .{ .name = "check_web_OH_ArkWebResourceRequest_GetRequestHeaders" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebResourceRequest_GetResourceType, .{ .name = "check_web_OH_ArkWebResourceRequest_GetResourceType" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebResourceRequest_HasGesture, .{ .name = "check_web_OH_ArkWebResourceRequest_HasGesture" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebResourceRequest_IsRedirect, .{ .name = "check_web_OH_ArkWebResourceRequest_IsRedirect" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebResponse_GetCharset, .{ .name = "check_web_OH_ArkWebResponse_GetCharset" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebResponse_GetError, .{ .name = "check_web_OH_ArkWebResponse_GetError" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebResponse_GetHeaderByName, .{ .name = "check_web_OH_ArkWebResponse_GetHeaderByName" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebResponse_GetMimeType, .{ .name = "check_web_OH_ArkWebResponse_GetMimeType" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebResponse_GetStatus, .{ .name = "check_web_OH_ArkWebResponse_GetStatus" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebResponse_GetStatusText, .{ .name = "check_web_OH_ArkWebResponse_GetStatusText" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebResponse_GetUrl, .{ .name = "check_web_OH_ArkWebResponse_GetUrl" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebResponse_SetError, .{ .name = "check_web_OH_ArkWebResponse_SetError" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebResponse_SetStatusText, .{ .name = "check_web_OH_ArkWebResponse_SetStatusText" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebResponse_SetUrl, .{ .name = "check_web_OH_ArkWebResponse_SetUrl" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWebSchemeHandler_GetUserData, .{ .name = "check_web_OH_ArkWebSchemeHandler_GetUserData" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWeb_RegisterCustomSchemes, .{ .name = "check_web_OH_ArkWeb_RegisterCustomSchemes" });
    }
    if (options.compile_check_api >= 12) {
        @export(&@import("web").native.OH_ArkWeb_ReleaseByteArray, .{ .name = "check_web_OH_ArkWeb_ReleaseByteArray" });
    }
    if (options.compile_check_api >= 13) {
        @export(&@import("xcomponent").native.OH_NativeXComponent_GetNativeAccessibilityProvider, .{ .name = "check_xcomponent_OH_NativeXComponent_GetNativeAccessibilityProvider" });
    }
}

fn owned_arkui_AccessibilityState() callconv(.c) void {
    var value = @import("arkui").owned.AccessibilityState.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_arkui_AccessibilityState, .{ .name = "check_owned_arkui_AccessibilityState" });
}

fn owned_arkui_AccessibilityValue() callconv(.c) void {
    var value = @import("arkui").owned.AccessibilityValue.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_arkui_AccessibilityValue, .{ .name = "check_owned_arkui_AccessibilityValue" });
}

fn owned_arkui_AlignmentRuleOption() callconv(.c) void {
    var value = @import("arkui").owned.AlignmentRuleOption.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_arkui_AlignmentRuleOption, .{ .name = "check_owned_arkui_AlignmentRuleOption" });
}

fn owned_arkui_AnimateOption() callconv(.c) void {
    var value = @import("arkui").owned.AnimateOption.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_arkui_AnimateOption, .{ .name = "check_owned_arkui_AnimateOption" });
}

fn owned_arkui_AnimatorOption(arg0: @typeInfo(@TypeOf(@import("arkui").raw.OH_ArkUI_AnimatorOption_Create)).@"fn".param_types[0].?) callconv(.c) void {
    var value = @import("arkui").owned.AnimatorOption.create(.{arg0}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_arkui_AnimatorOption, .{ .name = "check_owned_arkui_AnimatorOption" });
}

fn owned_arkui_BarrierOption(arg0: @typeInfo(@TypeOf(@import("arkui").raw.OH_ArkUI_BarrierOption_Create)).@"fn".param_types[0].?) callconv(.c) void {
    var value = @import("arkui").owned.BarrierOption.create(.{arg0}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_arkui_BarrierOption, .{ .name = "check_owned_arkui_BarrierOption" });
}

fn owned_arkui_CrossLanguageOption() callconv(.c) void {
    var value = @import("arkui").owned.CrossLanguageOption.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 15) @export(&owned_arkui_CrossLanguageOption, .{ .name = "check_owned_arkui_CrossLanguageOption" });
}

fn owned_arkui_CustomSpanDrawInfo() callconv(.c) void {
    var value = @import("arkui").owned.CustomSpanDrawInfo.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_arkui_CustomSpanDrawInfo, .{ .name = "check_owned_arkui_CustomSpanDrawInfo" });
}

fn owned_arkui_CustomSpanMeasureInfo() callconv(.c) void {
    var value = @import("arkui").owned.CustomSpanMeasureInfo.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_arkui_CustomSpanMeasureInfo, .{ .name = "check_owned_arkui_CustomSpanMeasureInfo" });
}

fn owned_arkui_CustomSpanMetrics() callconv(.c) void {
    var value = @import("arkui").owned.CustomSpanMetrics.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_arkui_CustomSpanMetrics, .{ .name = "check_owned_arkui_CustomSpanMetrics" });
}

fn owned_arkui_EmbeddedComponentOption() callconv(.c) void {
    var value = @import("arkui").owned.EmbeddedComponentOption.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 20) @export(&owned_arkui_EmbeddedComponentOption, .{ .name = "check_owned_arkui_EmbeddedComponentOption" });
}

fn owned_arkui_GridLayoutOptions() callconv(.c) void {
    var value = @import("arkui").owned.GridLayoutOptions.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 22) @export(&owned_arkui_GridLayoutOptions, .{ .name = "check_owned_arkui_GridLayoutOptions" });
}

fn owned_arkui_GuidelineOption(arg0: @typeInfo(@TypeOf(@import("arkui").raw.OH_ArkUI_GuidelineOption_Create)).@"fn".param_types[0].?) callconv(.c) void {
    var value = @import("arkui").owned.GuidelineOption.create(.{arg0}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_arkui_GuidelineOption, .{ .name = "check_owned_arkui_GuidelineOption" });
}

fn owned_arkui_KeyframeAnimateOption(arg0: @typeInfo(@TypeOf(@import("arkui").raw.OH_ArkUI_KeyframeAnimateOption_Create)).@"fn".param_types[0].?) callconv(.c) void {
    var value = @import("arkui").owned.KeyframeAnimateOption.create(.{arg0}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_arkui_KeyframeAnimateOption, .{ .name = "check_owned_arkui_KeyframeAnimateOption" });
}

fn owned_arkui_ListChildrenMainSizeOption() callconv(.c) void {
    var value = @import("arkui").owned.ListChildrenMainSizeOption.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_arkui_ListChildrenMainSizeOption, .{ .name = "check_owned_arkui_ListChildrenMainSizeOption" });
}

fn owned_arkui_ListItemSwipeActionItem() callconv(.c) void {
    var value = @import("arkui").owned.ListItemSwipeActionItem.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_arkui_ListItemSwipeActionItem, .{ .name = "check_owned_arkui_ListItemSwipeActionItem" });
}

fn owned_arkui_ListItemSwipeActionOption() callconv(.c) void {
    var value = @import("arkui").owned.ListItemSwipeActionOption.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_arkui_ListItemSwipeActionOption, .{ .name = "check_owned_arkui_ListItemSwipeActionOption" });
}

fn owned_arkui_PixelRoundPolicy() callconv(.c) void {
    var value = @import("arkui").owned.PixelRoundPolicy.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 21) @export(&owned_arkui_PixelRoundPolicy, .{ .name = "check_owned_arkui_PixelRoundPolicy" });
}

fn owned_arkui_PositionEdges() callconv(.c) void {
    var value = @import("arkui").owned.PositionEdges.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 21) @export(&owned_arkui_PositionEdges, .{ .name = "check_owned_arkui_PositionEdges" });
}

fn owned_arkui_ProgressLinearStyleOption() callconv(.c) void {
    var value = @import("arkui").owned.ProgressLinearStyleOption.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 15) @export(&owned_arkui_ProgressLinearStyleOption, .{ .name = "check_owned_arkui_ProgressLinearStyleOption" });
}

fn owned_arkui_ShowCounterConfig() callconv(.c) void {
    var value = @import("arkui").owned.ShowCounterConfig.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 22) @export(&owned_arkui_ShowCounterConfig, .{ .name = "check_owned_arkui_ShowCounterConfig" });
}

fn owned_arkui_StyledString(arg0: @typeInfo(@TypeOf(@import("arkui").raw.OH_ArkUI_StyledString_Create)).@"fn".param_types[0].?, arg1: @typeInfo(@TypeOf(@import("arkui").raw.OH_ArkUI_StyledString_Create)).@"fn".param_types[1].?) callconv(.c) void {
    var value = @import("arkui").owned.StyledString.create(.{ arg0, arg1 }) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_arkui_StyledString, .{ .name = "check_owned_arkui_StyledString" });
}

fn owned_arkui_StyledString_Descriptor() callconv(.c) void {
    var value = @import("arkui").owned.StyledString_Descriptor.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 14) @export(&owned_arkui_StyledString_Descriptor, .{ .name = "check_owned_arkui_StyledString_Descriptor" });
}

fn owned_arkui_SwiperArrowStyle() callconv(.c) void {
    var value = @import("arkui").owned.SwiperArrowStyle.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 19) @export(&owned_arkui_SwiperArrowStyle, .{ .name = "check_owned_arkui_SwiperArrowStyle" });
}

fn owned_arkui_SwiperDigitIndicator() callconv(.c) void {
    var value = @import("arkui").owned.SwiperDigitIndicator.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 19) @export(&owned_arkui_SwiperDigitIndicator, .{ .name = "check_owned_arkui_SwiperDigitIndicator" });
}

fn owned_arkui_SwiperIndicator(arg0: @typeInfo(@TypeOf(@import("arkui").raw.OH_ArkUI_SwiperIndicator_Create)).@"fn".param_types[0].?) callconv(.c) void {
    var value = @import("arkui").owned.SwiperIndicator.create(.{arg0}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_arkui_SwiperIndicator, .{ .name = "check_owned_arkui_SwiperIndicator" });
}

fn owned_arkui_TextCascadePickerRangeContentArray(arg0: @typeInfo(@TypeOf(@import("arkui").raw.OH_ArkUI_TextCascadePickerRangeContentArray_Create)).@"fn".param_types[0].?) callconv(.c) void {
    var value = @import("arkui").owned.TextCascadePickerRangeContentArray.create(.{arg0}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 19) @export(&owned_arkui_TextCascadePickerRangeContentArray, .{ .name = "check_owned_arkui_TextCascadePickerRangeContentArray" });
}

fn owned_arkui_TextEditMenuOptions() callconv(.c) void {
    var value = @import("arkui").owned.TextEditMenuOptions.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 22) @export(&owned_arkui_TextEditMenuOptions, .{ .name = "check_owned_arkui_TextEditMenuOptions" });
}

fn owned_arkui_TextMenuItem() callconv(.c) void {
    var value = @import("arkui").owned.TextMenuItem.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 22) @export(&owned_arkui_TextMenuItem, .{ .name = "check_owned_arkui_TextMenuItem" });
}

fn owned_arkui_TextPickerRangeContentArray(arg0: @typeInfo(@TypeOf(@import("arkui").raw.OH_ArkUI_TextPickerRangeContentArray_Create)).@"fn".param_types[0].?) callconv(.c) void {
    var value = @import("arkui").owned.TextPickerRangeContentArray.create(.{arg0}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 19) @export(&owned_arkui_TextPickerRangeContentArray, .{ .name = "check_owned_arkui_TextPickerRangeContentArray" });
}

fn owned_arkui_TextSelectionMenuOptions() callconv(.c) void {
    var value = @import("arkui").owned.TextSelectionMenuOptions.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 22) @export(&owned_arkui_TextSelectionMenuOptions, .{ .name = "check_owned_arkui_TextSelectionMenuOptions" });
}

fn owned_arkui_VisibleAreaEventOptions() callconv(.c) void {
    var value = @import("arkui").owned.VisibleAreaEventOptions.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 17) @export(&owned_arkui_VisibleAreaEventOptions, .{ .name = "check_owned_arkui_VisibleAreaEventOptions" });
}

fn owned_arkui_WaterFlowSectionOption() callconv(.c) void {
    var value = @import("arkui").owned.WaterFlowSectionOption.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_arkui_WaterFlowSectionOption, .{ .name = "check_owned_arkui_WaterFlowSectionOption" });
}

fn owned_native_drawing_Bitmap() callconv(.c) void {
    var value = @import("native_drawing").owned.Bitmap.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 8) @export(&owned_native_drawing_Bitmap, .{ .name = "check_owned_native_drawing_Bitmap" });
}

fn owned_native_drawing_Filter() callconv(.c) void {
    var value = @import("native_drawing").owned.Filter.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 11) @export(&owned_native_drawing_Filter, .{ .name = "check_owned_native_drawing_Filter" });
}

fn owned_native_drawing_FontFeatures() callconv(.c) void {
    var value = @import("native_drawing").owned.FontFeatures.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 20) @export(&owned_native_drawing_FontFeatures, .{ .name = "check_owned_native_drawing_FontFeatures" });
}

fn owned_native_drawing_Image() callconv(.c) void {
    var value = @import("native_drawing").owned.Image.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_native_drawing_Image, .{ .name = "check_owned_native_drawing_Image" });
}

fn owned_native_drawing_Matrix() callconv(.c) void {
    var value = @import("native_drawing").owned.Matrix.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 11) @export(&owned_native_drawing_Matrix, .{ .name = "check_owned_native_drawing_Matrix" });
}

fn owned_native_drawing_Path() callconv(.c) void {
    var value = @import("native_drawing").owned.Path.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 8) @export(&owned_native_drawing_Path, .{ .name = "check_owned_native_drawing_Path" });
}

fn owned_native_drawing_Pen() callconv(.c) void {
    var value = @import("native_drawing").owned.Pen.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 8) @export(&owned_native_drawing_Pen, .{ .name = "check_owned_native_drawing_Pen" });
}

fn owned_native_drawing_Point(arg0: @typeInfo(@TypeOf(@import("native_drawing").raw.OH_Drawing_PointCreate)).@"fn".param_types[0].?, arg1: @typeInfo(@TypeOf(@import("native_drawing").raw.OH_Drawing_PointCreate)).@"fn".param_types[1].?) callconv(.c) void {
    var value = @import("native_drawing").owned.Point.create(.{ arg0, arg1 }) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 11) @export(&owned_native_drawing_Point, .{ .name = "check_owned_native_drawing_Point" });
}

fn owned_native_drawing_Rect(arg0: @typeInfo(@TypeOf(@import("native_drawing").raw.OH_Drawing_RectCreate)).@"fn".param_types[0].?, arg1: @typeInfo(@TypeOf(@import("native_drawing").raw.OH_Drawing_RectCreate)).@"fn".param_types[1].?, arg2: @typeInfo(@TypeOf(@import("native_drawing").raw.OH_Drawing_RectCreate)).@"fn".param_types[2].?, arg3: @typeInfo(@TypeOf(@import("native_drawing").raw.OH_Drawing_RectCreate)).@"fn".param_types[3].?) callconv(.c) void {
    var value = @import("native_drawing").owned.Rect.create(.{ arg0, arg1, arg2, arg3 }) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 11) @export(&owned_native_drawing_Rect, .{ .name = "check_owned_native_drawing_Rect" });
}

fn owned_native_drawing_RoundRect(arg0: @typeInfo(@TypeOf(@import("native_drawing").raw.OH_Drawing_RoundRectCreate)).@"fn".param_types[0].?, arg1: @typeInfo(@TypeOf(@import("native_drawing").raw.OH_Drawing_RoundRectCreate)).@"fn".param_types[1].?, arg2: @typeInfo(@TypeOf(@import("native_drawing").raw.OH_Drawing_RoundRectCreate)).@"fn".param_types[2].?) callconv(.c) void {
    var value = @import("native_drawing").owned.RoundRect.create(.{ arg0, arg1, arg2 }) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 11) @export(&owned_native_drawing_RoundRect, .{ .name = "check_owned_native_drawing_RoundRect" });
}

fn owned_native_drawing_SamplingOptions(arg0: @typeInfo(@TypeOf(@import("native_drawing").raw.OH_Drawing_SamplingOptionsCreate)).@"fn".param_types[0].?, arg1: @typeInfo(@TypeOf(@import("native_drawing").raw.OH_Drawing_SamplingOptionsCreate)).@"fn".param_types[1].?) callconv(.c) void {
    var value = @import("native_drawing").owned.SamplingOptions.create(.{ arg0, arg1 }) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_native_drawing_SamplingOptions, .{ .name = "check_owned_native_drawing_SamplingOptions" });
}

fn owned_native_drawing_ShadowLayer(arg0: @typeInfo(@TypeOf(@import("native_drawing").raw.OH_Drawing_ShadowLayerCreate)).@"fn".param_types[0].?, arg1: @typeInfo(@TypeOf(@import("native_drawing").raw.OH_Drawing_ShadowLayerCreate)).@"fn".param_types[1].?, arg2: @typeInfo(@TypeOf(@import("native_drawing").raw.OH_Drawing_ShadowLayerCreate)).@"fn".param_types[2].?, arg3: @typeInfo(@TypeOf(@import("native_drawing").raw.OH_Drawing_ShadowLayerCreate)).@"fn".param_types[3].?) callconv(.c) void {
    var value = @import("native_drawing").owned.ShadowLayer.create(.{ arg0, arg1, arg2, arg3 }) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_native_drawing_ShadowLayer, .{ .name = "check_owned_native_drawing_ShadowLayer" });
}

fn owned_image_native_AuxiliaryPictureInfo() callconv(.c) void {
    var value = @import("image_native").owned.AuxiliaryPictureInfo.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 13) @export(&owned_image_native_AuxiliaryPictureInfo, .{ .name = "check_owned_image_native_AuxiliaryPictureInfo" });
}

fn owned_image_native_AuxiliaryPictureNative(arg0: @typeInfo(@TypeOf(@import("image_native").raw.OH_AuxiliaryPictureNative_Create)).@"fn".param_types[0].?, arg1: @typeInfo(@TypeOf(@import("image_native").raw.OH_AuxiliaryPictureNative_Create)).@"fn".param_types[1].?, arg2: @typeInfo(@TypeOf(@import("image_native").raw.OH_AuxiliaryPictureNative_Create)).@"fn".param_types[2].?, arg3: @typeInfo(@TypeOf(@import("image_native").raw.OH_AuxiliaryPictureNative_Create)).@"fn".param_types[3].?) callconv(.c) void {
    var value = @import("image_native").owned.AuxiliaryPictureNative.create(.{ arg0, arg1, arg2, arg3 }) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 13) @export(&owned_image_native_AuxiliaryPictureNative, .{ .name = "check_owned_image_native_AuxiliaryPictureNative" });
}

fn owned_image_native_ComposeOptions() callconv(.c) void {
    var value = @import("image_native").owned.ComposeOptions.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 23) @export(&owned_image_native_ComposeOptions, .{ .name = "check_owned_image_native_ComposeOptions" });
}

fn owned_image_native_DecodingOptionsForPicture() callconv(.c) void {
    var value = @import("image_native").owned.DecodingOptionsForPicture.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 13) @export(&owned_image_native_DecodingOptionsForPicture, .{ .name = "check_owned_image_native_DecodingOptionsForPicture" });
}

fn owned_image_native_ImageSourceInfo() callconv(.c) void {
    var value = @import("image_native").owned.ImageSourceInfo.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_image_native_ImageSourceInfo, .{ .name = "check_owned_image_native_ImageSourceInfo" });
}

fn owned_image_native_PackingOptionsForSequence() callconv(.c) void {
    var value = @import("image_native").owned.PackingOptionsForSequence.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 18) @export(&owned_image_native_PackingOptionsForSequence, .{ .name = "check_owned_image_native_PackingOptionsForSequence" });
}

fn owned_image_native_PictureMetadata(arg0: @typeInfo(@TypeOf(@import("image_native").raw.OH_PictureMetadata_Create)).@"fn".param_types[0].?) callconv(.c) void {
    var value = @import("image_native").owned.PictureMetadata.create(.{arg0}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 13) @export(&owned_image_native_PictureMetadata, .{ .name = "check_owned_image_native_PictureMetadata" });
}

fn owned_image_native_PixelmapImageInfo() callconv(.c) void {
    var value = @import("image_native").owned.PixelmapImageInfo.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_image_native_PixelmapImageInfo, .{ .name = "check_owned_image_native_PixelmapImageInfo" });
}

fn owned_image_native_PixelmapInitializationOptions() callconv(.c) void {
    var value = @import("image_native").owned.PixelmapInitializationOptions.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_image_native_PixelmapInitializationOptions, .{ .name = "check_owned_image_native_PixelmapInitializationOptions" });
}

fn owned_input_method_CursorInfo(arg0: @typeInfo(@TypeOf(@import("input_method").raw.OH_CursorInfo_Create)).@"fn".param_types[0].?, arg1: @typeInfo(@TypeOf(@import("input_method").raw.OH_CursorInfo_Create)).@"fn".param_types[1].?, arg2: @typeInfo(@TypeOf(@import("input_method").raw.OH_CursorInfo_Create)).@"fn".param_types[2].?, arg3: @typeInfo(@TypeOf(@import("input_method").raw.OH_CursorInfo_Create)).@"fn".param_types[3].?) callconv(.c) void {
    var value = @import("input_method").owned.CursorInfo.create(.{ arg0, arg1, arg2, arg3 }) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_input_method_CursorInfo, .{ .name = "check_owned_input_method_CursorInfo" });
}

fn owned_input_method_PrivateCommand(arg0: @typeInfo(@TypeOf(@import("input_method").raw.OH_PrivateCommand_Create)).@"fn".param_types[0].?, arg1: @typeInfo(@TypeOf(@import("input_method").raw.OH_PrivateCommand_Create)).@"fn".param_types[1].?) callconv(.c) void {
    var value = @import("input_method").owned.PrivateCommand.create(.{ arg0, arg1 }) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_input_method_PrivateCommand, .{ .name = "check_owned_input_method_PrivateCommand" });
}

fn owned_input_method_TextConfig() callconv(.c) void {
    var value = @import("input_method").owned.TextConfig.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 12) @export(&owned_input_method_TextConfig, .{ .name = "check_owned_input_method_TextConfig" });
}

fn owned_udmf_UdmfDataLoadInfo() callconv(.c) void {
    var value = @import("udmf").owned.UdmfDataLoadInfo.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 20) @export(&owned_udmf_UdmfDataLoadInfo, .{ .name = "check_owned_udmf_UdmfDataLoadInfo" });
}

fn owned_udmf_UdmfDataLoadParams() callconv(.c) void {
    var value = @import("udmf").owned.UdmfDataLoadParams.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 20) @export(&owned_udmf_UdmfDataLoadParams, .{ .name = "check_owned_udmf_UdmfDataLoadParams" });
}

fn owned_udmf_UdmfGetDataParams() callconv(.c) void {
    var value = @import("udmf").owned.UdmfGetDataParams.create(.{}) catch return;
    _ = value.ptr() catch return;
    value.deinit() catch {};
}
comptime {
    if (options.compile_check_api >= 15) @export(&owned_udmf_UdmfGetDataParams, .{ .name = "check_owned_udmf_UdmfGetDataParams" });
}

fn load_ArkUI_NativeAnimateAPI_1() callconv(.c) void {
    _ = @import("arkui").interfaces.ArkUI_NativeAnimateAPI_1.load() catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&load_ArkUI_NativeAnimateAPI_1, .{ .name = "check_load_ArkUI_NativeAnimateAPI_1" });
}

fn table_ArkUI_NativeAnimateAPI_1_animateTo(table: *const @import("arkui").raw.ArkUI_NativeAnimateAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeAnimateAPI_1, "animateTo")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeAnimateAPI_1, "animateTo")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeAnimateAPI_1, "animateTo")).optional.child).pointer.child).@"fn".param_types[2].?, arg3: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeAnimateAPI_1, "animateTo")).optional.child).pointer.child).@"fn".param_types[3].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeAnimateAPI_1{ .table = table };
    _ = value.animateTo(arg0, arg1, arg2, arg3) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeAnimateAPI_1_animateTo, .{ .name = "check_table_ArkUI_NativeAnimateAPI_1_animateTo" });
}

fn table_ArkUI_NativeAnimateAPI_1_keyframeAnimateTo(table: *const @import("arkui").raw.ArkUI_NativeAnimateAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeAnimateAPI_1, "keyframeAnimateTo")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeAnimateAPI_1, "keyframeAnimateTo")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeAnimateAPI_1{ .table = table };
    _ = value.keyframeAnimateTo(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeAnimateAPI_1_keyframeAnimateTo, .{ .name = "check_table_ArkUI_NativeAnimateAPI_1_keyframeAnimateTo" });
}

fn table_ArkUI_NativeAnimateAPI_1_createAnimator(table: *const @import("arkui").raw.ArkUI_NativeAnimateAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeAnimateAPI_1, "createAnimator")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeAnimateAPI_1, "createAnimator")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeAnimateAPI_1{ .table = table };
    _ = value.createAnimator(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeAnimateAPI_1_createAnimator, .{ .name = "check_table_ArkUI_NativeAnimateAPI_1_createAnimator" });
}

fn table_ArkUI_NativeAnimateAPI_1_disposeAnimator(table: *const @import("arkui").raw.ArkUI_NativeAnimateAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeAnimateAPI_1, "disposeAnimator")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeAnimateAPI_1{ .table = table };
    _ = value.disposeAnimator(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeAnimateAPI_1_disposeAnimator, .{ .name = "check_table_ArkUI_NativeAnimateAPI_1_disposeAnimator" });
}

fn load_ArkUI_NativeDialogAPI_1() callconv(.c) void {
    _ = @import("arkui").interfaces.ArkUI_NativeDialogAPI_1.load() catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&load_ArkUI_NativeDialogAPI_1, .{ .name = "check_load_ArkUI_NativeDialogAPI_1" });
}

fn table_ArkUI_NativeDialogAPI_1_create(table: *const @import("arkui").raw.ArkUI_NativeDialogAPI_1) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeDialogAPI_1{ .table = table };
    _ = value.create() catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeDialogAPI_1_create, .{ .name = "check_table_ArkUI_NativeDialogAPI_1_create" });
}

fn table_ArkUI_NativeDialogAPI_1_dispose(table: *const @import("arkui").raw.ArkUI_NativeDialogAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "dispose")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeDialogAPI_1{ .table = table };
    _ = value.dispose(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeDialogAPI_1_dispose, .{ .name = "check_table_ArkUI_NativeDialogAPI_1_dispose" });
}

fn table_ArkUI_NativeDialogAPI_1_setContent(table: *const @import("arkui").raw.ArkUI_NativeDialogAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setContent")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setContent")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeDialogAPI_1{ .table = table };
    _ = value.setContent(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeDialogAPI_1_setContent, .{ .name = "check_table_ArkUI_NativeDialogAPI_1_setContent" });
}

fn table_ArkUI_NativeDialogAPI_1_removeContent(table: *const @import("arkui").raw.ArkUI_NativeDialogAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "removeContent")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeDialogAPI_1{ .table = table };
    _ = value.removeContent(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeDialogAPI_1_removeContent, .{ .name = "check_table_ArkUI_NativeDialogAPI_1_removeContent" });
}

fn table_ArkUI_NativeDialogAPI_1_setContentAlignment(table: *const @import("arkui").raw.ArkUI_NativeDialogAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setContentAlignment")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setContentAlignment")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setContentAlignment")).optional.child).pointer.child).@"fn".param_types[2].?, arg3: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setContentAlignment")).optional.child).pointer.child).@"fn".param_types[3].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeDialogAPI_1{ .table = table };
    _ = value.setContentAlignment(arg0, arg1, arg2, arg3) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeDialogAPI_1_setContentAlignment, .{ .name = "check_table_ArkUI_NativeDialogAPI_1_setContentAlignment" });
}

fn table_ArkUI_NativeDialogAPI_1_resetContentAlignment(table: *const @import("arkui").raw.ArkUI_NativeDialogAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "resetContentAlignment")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeDialogAPI_1{ .table = table };
    _ = value.resetContentAlignment(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeDialogAPI_1_resetContentAlignment, .{ .name = "check_table_ArkUI_NativeDialogAPI_1_resetContentAlignment" });
}

fn table_ArkUI_NativeDialogAPI_1_setModalMode(table: *const @import("arkui").raw.ArkUI_NativeDialogAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setModalMode")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setModalMode")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeDialogAPI_1{ .table = table };
    _ = value.setModalMode(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeDialogAPI_1_setModalMode, .{ .name = "check_table_ArkUI_NativeDialogAPI_1_setModalMode" });
}

fn table_ArkUI_NativeDialogAPI_1_setAutoCancel(table: *const @import("arkui").raw.ArkUI_NativeDialogAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setAutoCancel")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setAutoCancel")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeDialogAPI_1{ .table = table };
    _ = value.setAutoCancel(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeDialogAPI_1_setAutoCancel, .{ .name = "check_table_ArkUI_NativeDialogAPI_1_setAutoCancel" });
}

fn table_ArkUI_NativeDialogAPI_1_setMask(table: *const @import("arkui").raw.ArkUI_NativeDialogAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setMask")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setMask")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setMask")).optional.child).pointer.child).@"fn".param_types[2].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeDialogAPI_1{ .table = table };
    _ = value.setMask(arg0, arg1, arg2) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeDialogAPI_1_setMask, .{ .name = "check_table_ArkUI_NativeDialogAPI_1_setMask" });
}

fn table_ArkUI_NativeDialogAPI_1_setBackgroundColor(table: *const @import("arkui").raw.ArkUI_NativeDialogAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setBackgroundColor")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setBackgroundColor")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeDialogAPI_1{ .table = table };
    _ = value.setBackgroundColor(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeDialogAPI_1_setBackgroundColor, .{ .name = "check_table_ArkUI_NativeDialogAPI_1_setBackgroundColor" });
}

fn table_ArkUI_NativeDialogAPI_1_setCornerRadius(table: *const @import("arkui").raw.ArkUI_NativeDialogAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setCornerRadius")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setCornerRadius")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setCornerRadius")).optional.child).pointer.child).@"fn".param_types[2].?, arg3: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setCornerRadius")).optional.child).pointer.child).@"fn".param_types[3].?, arg4: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setCornerRadius")).optional.child).pointer.child).@"fn".param_types[4].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeDialogAPI_1{ .table = table };
    _ = value.setCornerRadius(arg0, arg1, arg2, arg3, arg4) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeDialogAPI_1_setCornerRadius, .{ .name = "check_table_ArkUI_NativeDialogAPI_1_setCornerRadius" });
}

fn table_ArkUI_NativeDialogAPI_1_setGridColumnCount(table: *const @import("arkui").raw.ArkUI_NativeDialogAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setGridColumnCount")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "setGridColumnCount")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeDialogAPI_1{ .table = table };
    _ = value.setGridColumnCount(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeDialogAPI_1_setGridColumnCount, .{ .name = "check_table_ArkUI_NativeDialogAPI_1_setGridColumnCount" });
}

fn table_ArkUI_NativeDialogAPI_1_enableCustomStyle(table: *const @import("arkui").raw.ArkUI_NativeDialogAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "enableCustomStyle")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "enableCustomStyle")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeDialogAPI_1{ .table = table };
    _ = value.enableCustomStyle(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeDialogAPI_1_enableCustomStyle, .{ .name = "check_table_ArkUI_NativeDialogAPI_1_enableCustomStyle" });
}

fn table_ArkUI_NativeDialogAPI_1_enableCustomAnimation(table: *const @import("arkui").raw.ArkUI_NativeDialogAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "enableCustomAnimation")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "enableCustomAnimation")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeDialogAPI_1{ .table = table };
    _ = value.enableCustomAnimation(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeDialogAPI_1_enableCustomAnimation, .{ .name = "check_table_ArkUI_NativeDialogAPI_1_enableCustomAnimation" });
}

fn table_ArkUI_NativeDialogAPI_1_registerOnWillDismiss(table: *const @import("arkui").raw.ArkUI_NativeDialogAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "registerOnWillDismiss")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "registerOnWillDismiss")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeDialogAPI_1{ .table = table };
    _ = value.registerOnWillDismiss(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeDialogAPI_1_registerOnWillDismiss, .{ .name = "check_table_ArkUI_NativeDialogAPI_1_registerOnWillDismiss" });
}

fn table_ArkUI_NativeDialogAPI_1_show(table: *const @import("arkui").raw.ArkUI_NativeDialogAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "show")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "show")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeDialogAPI_1{ .table = table };
    _ = value.show(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeDialogAPI_1_show, .{ .name = "check_table_ArkUI_NativeDialogAPI_1_show" });
}

fn table_ArkUI_NativeDialogAPI_1_close(table: *const @import("arkui").raw.ArkUI_NativeDialogAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "close")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeDialogAPI_1{ .table = table };
    _ = value.close(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeDialogAPI_1_close, .{ .name = "check_table_ArkUI_NativeDialogAPI_1_close" });
}

fn table_ArkUI_NativeDialogAPI_1_registerOnWillDismissWithUserData(table: *const @import("arkui").raw.ArkUI_NativeDialogAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "registerOnWillDismissWithUserData")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "registerOnWillDismissWithUserData")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeDialogAPI_1, "registerOnWillDismissWithUserData")).optional.child).pointer.child).@"fn".param_types[2].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeDialogAPI_1{ .table = table };
    _ = value.registerOnWillDismissWithUserData(arg0, arg1, arg2) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeDialogAPI_1_registerOnWillDismissWithUserData, .{ .name = "check_table_ArkUI_NativeDialogAPI_1_registerOnWillDismissWithUserData" });
}

fn load_ArkUI_NativeGestureAPI_1() callconv(.c) void {
    _ = @import("arkui").interfaces.ArkUI_NativeGestureAPI_1.load() catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&load_ArkUI_NativeGestureAPI_1, .{ .name = "check_load_ArkUI_NativeGestureAPI_1" });
}

fn table_ArkUI_NativeGestureAPI_1_createTapGesture(table: *const @import("arkui").raw.ArkUI_NativeGestureAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "createTapGesture")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "createTapGesture")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeGestureAPI_1{ .table = table };
    _ = value.createTapGesture(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeGestureAPI_1_createTapGesture, .{ .name = "check_table_ArkUI_NativeGestureAPI_1_createTapGesture" });
}

fn table_ArkUI_NativeGestureAPI_1_createLongPressGesture(table: *const @import("arkui").raw.ArkUI_NativeGestureAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "createLongPressGesture")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "createLongPressGesture")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "createLongPressGesture")).optional.child).pointer.child).@"fn".param_types[2].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeGestureAPI_1{ .table = table };
    _ = value.createLongPressGesture(arg0, arg1, arg2) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeGestureAPI_1_createLongPressGesture, .{ .name = "check_table_ArkUI_NativeGestureAPI_1_createLongPressGesture" });
}

fn table_ArkUI_NativeGestureAPI_1_createPanGesture(table: *const @import("arkui").raw.ArkUI_NativeGestureAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "createPanGesture")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "createPanGesture")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "createPanGesture")).optional.child).pointer.child).@"fn".param_types[2].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeGestureAPI_1{ .table = table };
    _ = value.createPanGesture(arg0, arg1, arg2) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeGestureAPI_1_createPanGesture, .{ .name = "check_table_ArkUI_NativeGestureAPI_1_createPanGesture" });
}

fn table_ArkUI_NativeGestureAPI_1_createPinchGesture(table: *const @import("arkui").raw.ArkUI_NativeGestureAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "createPinchGesture")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "createPinchGesture")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeGestureAPI_1{ .table = table };
    _ = value.createPinchGesture(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeGestureAPI_1_createPinchGesture, .{ .name = "check_table_ArkUI_NativeGestureAPI_1_createPinchGesture" });
}

fn table_ArkUI_NativeGestureAPI_1_createRotationGesture(table: *const @import("arkui").raw.ArkUI_NativeGestureAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "createRotationGesture")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "createRotationGesture")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeGestureAPI_1{ .table = table };
    _ = value.createRotationGesture(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeGestureAPI_1_createRotationGesture, .{ .name = "check_table_ArkUI_NativeGestureAPI_1_createRotationGesture" });
}

fn table_ArkUI_NativeGestureAPI_1_createSwipeGesture(table: *const @import("arkui").raw.ArkUI_NativeGestureAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "createSwipeGesture")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "createSwipeGesture")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "createSwipeGesture")).optional.child).pointer.child).@"fn".param_types[2].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeGestureAPI_1{ .table = table };
    _ = value.createSwipeGesture(arg0, arg1, arg2) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeGestureAPI_1_createSwipeGesture, .{ .name = "check_table_ArkUI_NativeGestureAPI_1_createSwipeGesture" });
}

fn table_ArkUI_NativeGestureAPI_1_createGroupGesture(table: *const @import("arkui").raw.ArkUI_NativeGestureAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "createGroupGesture")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeGestureAPI_1{ .table = table };
    _ = value.createGroupGesture(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeGestureAPI_1_createGroupGesture, .{ .name = "check_table_ArkUI_NativeGestureAPI_1_createGroupGesture" });
}

fn table_ArkUI_NativeGestureAPI_1_dispose(table: *const @import("arkui").raw.ArkUI_NativeGestureAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "dispose")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeGestureAPI_1{ .table = table };
    _ = value.dispose(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeGestureAPI_1_dispose, .{ .name = "check_table_ArkUI_NativeGestureAPI_1_dispose" });
}

fn table_ArkUI_NativeGestureAPI_1_addChildGesture(table: *const @import("arkui").raw.ArkUI_NativeGestureAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "addChildGesture")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "addChildGesture")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeGestureAPI_1{ .table = table };
    _ = value.addChildGesture(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeGestureAPI_1_addChildGesture, .{ .name = "check_table_ArkUI_NativeGestureAPI_1_addChildGesture" });
}

fn table_ArkUI_NativeGestureAPI_1_removeChildGesture(table: *const @import("arkui").raw.ArkUI_NativeGestureAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "removeChildGesture")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "removeChildGesture")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeGestureAPI_1{ .table = table };
    _ = value.removeChildGesture(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeGestureAPI_1_removeChildGesture, .{ .name = "check_table_ArkUI_NativeGestureAPI_1_removeChildGesture" });
}

fn table_ArkUI_NativeGestureAPI_1_setGestureEventTarget(table: *const @import("arkui").raw.ArkUI_NativeGestureAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "setGestureEventTarget")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "setGestureEventTarget")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "setGestureEventTarget")).optional.child).pointer.child).@"fn".param_types[2].?, arg3: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "setGestureEventTarget")).optional.child).pointer.child).@"fn".param_types[3].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeGestureAPI_1{ .table = table };
    _ = value.setGestureEventTarget(arg0, arg1, arg2, arg3) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeGestureAPI_1_setGestureEventTarget, .{ .name = "check_table_ArkUI_NativeGestureAPI_1_setGestureEventTarget" });
}

fn table_ArkUI_NativeGestureAPI_1_addGestureToNode(table: *const @import("arkui").raw.ArkUI_NativeGestureAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "addGestureToNode")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "addGestureToNode")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "addGestureToNode")).optional.child).pointer.child).@"fn".param_types[2].?, arg3: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "addGestureToNode")).optional.child).pointer.child).@"fn".param_types[3].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeGestureAPI_1{ .table = table };
    _ = value.addGestureToNode(arg0, arg1, arg2, arg3) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeGestureAPI_1_addGestureToNode, .{ .name = "check_table_ArkUI_NativeGestureAPI_1_addGestureToNode" });
}

fn table_ArkUI_NativeGestureAPI_1_removeGestureFromNode(table: *const @import("arkui").raw.ArkUI_NativeGestureAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "removeGestureFromNode")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "removeGestureFromNode")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeGestureAPI_1{ .table = table };
    _ = value.removeGestureFromNode(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeGestureAPI_1_removeGestureFromNode, .{ .name = "check_table_ArkUI_NativeGestureAPI_1_removeGestureFromNode" });
}

fn table_ArkUI_NativeGestureAPI_1_setGestureInterrupterToNode(table: *const @import("arkui").raw.ArkUI_NativeGestureAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "setGestureInterrupterToNode")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "setGestureInterrupterToNode")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeGestureAPI_1{ .table = table };
    _ = value.setGestureInterrupterToNode(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeGestureAPI_1_setGestureInterrupterToNode, .{ .name = "check_table_ArkUI_NativeGestureAPI_1_setGestureInterrupterToNode" });
}

fn table_ArkUI_NativeGestureAPI_1_getGestureType(table: *const @import("arkui").raw.ArkUI_NativeGestureAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "getGestureType")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeGestureAPI_1{ .table = table };
    _ = value.getGestureType(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeGestureAPI_1_getGestureType, .{ .name = "check_table_ArkUI_NativeGestureAPI_1_getGestureType" });
}

fn table_ArkUI_NativeGestureAPI_1_setInnerGestureParallelTo(table: *const @import("arkui").raw.ArkUI_NativeGestureAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "setInnerGestureParallelTo")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "setInnerGestureParallelTo")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "setInnerGestureParallelTo")).optional.child).pointer.child).@"fn".param_types[2].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeGestureAPI_1{ .table = table };
    _ = value.setInnerGestureParallelTo(arg0, arg1, arg2) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeGestureAPI_1_setInnerGestureParallelTo, .{ .name = "check_table_ArkUI_NativeGestureAPI_1_setInnerGestureParallelTo" });
}

fn table_ArkUI_NativeGestureAPI_1_createTapGestureWithDistanceThreshold(table: *const @import("arkui").raw.ArkUI_NativeGestureAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "createTapGestureWithDistanceThreshold")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "createTapGestureWithDistanceThreshold")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_1, "createTapGestureWithDistanceThreshold")).optional.child).pointer.child).@"fn".param_types[2].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeGestureAPI_1{ .table = table };
    _ = value.createTapGestureWithDistanceThreshold(arg0, arg1, arg2) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeGestureAPI_1_createTapGestureWithDistanceThreshold, .{ .name = "check_table_ArkUI_NativeGestureAPI_1_createTapGestureWithDistanceThreshold" });
}

fn load_ArkUI_NativeGestureAPI_2() callconv(.c) void {
    _ = @import("arkui").interfaces.ArkUI_NativeGestureAPI_2.load() catch return;
}
comptime {
    if (options.compile_check_api >= 18) @export(&load_ArkUI_NativeGestureAPI_2, .{ .name = "check_load_ArkUI_NativeGestureAPI_2" });
}

fn table_ArkUI_NativeGestureAPI_2_setGestureInterrupterToNode(table: *const @import("arkui").raw.ArkUI_NativeGestureAPI_2, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_2, "setGestureInterrupterToNode")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_2, "setGestureInterrupterToNode")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeGestureAPI_2, "setGestureInterrupterToNode")).optional.child).pointer.child).@"fn".param_types[2].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeGestureAPI_2{ .table = table };
    _ = value.setGestureInterrupterToNode(arg0, arg1, arg2) catch return;
}
comptime {
    if (options.compile_check_api >= 18) @export(&table_ArkUI_NativeGestureAPI_2_setGestureInterrupterToNode, .{ .name = "check_table_ArkUI_NativeGestureAPI_2_setGestureInterrupterToNode" });
}

fn load_ArkUI_NativeNodeAPI_1() callconv(.c) void {
    _ = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1.load() catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&load_ArkUI_NativeNodeAPI_1, .{ .name = "check_load_ArkUI_NativeNodeAPI_1" });
}

fn table_ArkUI_NativeNodeAPI_1_createNode(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "createNode")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.createNode(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_createNode, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_createNode" });
}

fn table_ArkUI_NativeNodeAPI_1_disposeNode(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "disposeNode")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.disposeNode(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_disposeNode, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_disposeNode" });
}

fn table_ArkUI_NativeNodeAPI_1_addChild(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "addChild")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "addChild")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.addChild(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_addChild, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_addChild" });
}

fn table_ArkUI_NativeNodeAPI_1_removeChild(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "removeChild")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "removeChild")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.removeChild(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_removeChild, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_removeChild" });
}

fn table_ArkUI_NativeNodeAPI_1_insertChildAfter(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "insertChildAfter")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "insertChildAfter")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "insertChildAfter")).optional.child).pointer.child).@"fn".param_types[2].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.insertChildAfter(arg0, arg1, arg2) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_insertChildAfter, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_insertChildAfter" });
}

fn table_ArkUI_NativeNodeAPI_1_insertChildBefore(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "insertChildBefore")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "insertChildBefore")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "insertChildBefore")).optional.child).pointer.child).@"fn".param_types[2].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.insertChildBefore(arg0, arg1, arg2) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_insertChildBefore, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_insertChildBefore" });
}

fn table_ArkUI_NativeNodeAPI_1_insertChildAt(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "insertChildAt")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "insertChildAt")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "insertChildAt")).optional.child).pointer.child).@"fn".param_types[2].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.insertChildAt(arg0, arg1, arg2) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_insertChildAt, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_insertChildAt" });
}

fn table_ArkUI_NativeNodeAPI_1_setAttribute(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "setAttribute")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "setAttribute")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "setAttribute")).optional.child).pointer.child).@"fn".param_types[2].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.setAttribute(arg0, arg1, arg2) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_setAttribute, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_setAttribute" });
}

fn table_ArkUI_NativeNodeAPI_1_getAttribute(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "getAttribute")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "getAttribute")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.getAttribute(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_getAttribute, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_getAttribute" });
}

fn table_ArkUI_NativeNodeAPI_1_resetAttribute(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "resetAttribute")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "resetAttribute")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.resetAttribute(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_resetAttribute, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_resetAttribute" });
}

fn table_ArkUI_NativeNodeAPI_1_registerNodeEvent(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "registerNodeEvent")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "registerNodeEvent")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "registerNodeEvent")).optional.child).pointer.child).@"fn".param_types[2].?, arg3: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "registerNodeEvent")).optional.child).pointer.child).@"fn".param_types[3].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.registerNodeEvent(arg0, arg1, arg2, arg3) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_registerNodeEvent, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_registerNodeEvent" });
}

fn table_ArkUI_NativeNodeAPI_1_unregisterNodeEvent(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "unregisterNodeEvent")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "unregisterNodeEvent")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.unregisterNodeEvent(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_unregisterNodeEvent, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_unregisterNodeEvent" });
}

fn table_ArkUI_NativeNodeAPI_1_registerNodeEventReceiver(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "registerNodeEventReceiver")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.registerNodeEventReceiver(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_registerNodeEventReceiver, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_registerNodeEventReceiver" });
}

fn table_ArkUI_NativeNodeAPI_1_unregisterNodeEventReceiver(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.unregisterNodeEventReceiver() catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_unregisterNodeEventReceiver, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_unregisterNodeEventReceiver" });
}

fn table_ArkUI_NativeNodeAPI_1_markDirty(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "markDirty")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "markDirty")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.markDirty(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_markDirty, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_markDirty" });
}

fn table_ArkUI_NativeNodeAPI_1_getTotalChildCount(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "getTotalChildCount")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.getTotalChildCount(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_getTotalChildCount, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_getTotalChildCount" });
}

fn table_ArkUI_NativeNodeAPI_1_getChildAt(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "getChildAt")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "getChildAt")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.getChildAt(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_getChildAt, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_getChildAt" });
}

fn table_ArkUI_NativeNodeAPI_1_getFirstChild(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "getFirstChild")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.getFirstChild(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_getFirstChild, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_getFirstChild" });
}

fn table_ArkUI_NativeNodeAPI_1_getLastChild(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "getLastChild")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.getLastChild(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_getLastChild, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_getLastChild" });
}

fn table_ArkUI_NativeNodeAPI_1_getPreviousSibling(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "getPreviousSibling")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.getPreviousSibling(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_getPreviousSibling, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_getPreviousSibling" });
}

fn table_ArkUI_NativeNodeAPI_1_getNextSibling(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "getNextSibling")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.getNextSibling(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_getNextSibling, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_getNextSibling" });
}

fn table_ArkUI_NativeNodeAPI_1_registerNodeCustomEvent(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "registerNodeCustomEvent")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "registerNodeCustomEvent")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "registerNodeCustomEvent")).optional.child).pointer.child).@"fn".param_types[2].?, arg3: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "registerNodeCustomEvent")).optional.child).pointer.child).@"fn".param_types[3].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.registerNodeCustomEvent(arg0, arg1, arg2, arg3) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_registerNodeCustomEvent, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_registerNodeCustomEvent" });
}

fn table_ArkUI_NativeNodeAPI_1_unregisterNodeCustomEvent(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "unregisterNodeCustomEvent")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "unregisterNodeCustomEvent")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.unregisterNodeCustomEvent(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_unregisterNodeCustomEvent, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_unregisterNodeCustomEvent" });
}

fn table_ArkUI_NativeNodeAPI_1_registerNodeCustomEventReceiver(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "registerNodeCustomEventReceiver")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.registerNodeCustomEventReceiver(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_registerNodeCustomEventReceiver, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_registerNodeCustomEventReceiver" });
}

fn table_ArkUI_NativeNodeAPI_1_unregisterNodeCustomEventReceiver(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.unregisterNodeCustomEventReceiver() catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_unregisterNodeCustomEventReceiver, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_unregisterNodeCustomEventReceiver" });
}

fn table_ArkUI_NativeNodeAPI_1_setMeasuredSize(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "setMeasuredSize")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "setMeasuredSize")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "setMeasuredSize")).optional.child).pointer.child).@"fn".param_types[2].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.setMeasuredSize(arg0, arg1, arg2) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_setMeasuredSize, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_setMeasuredSize" });
}

fn table_ArkUI_NativeNodeAPI_1_setLayoutPosition(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "setLayoutPosition")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "setLayoutPosition")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "setLayoutPosition")).optional.child).pointer.child).@"fn".param_types[2].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.setLayoutPosition(arg0, arg1, arg2) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_setLayoutPosition, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_setLayoutPosition" });
}

fn table_ArkUI_NativeNodeAPI_1_getMeasuredSize(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "getMeasuredSize")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.getMeasuredSize(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_getMeasuredSize, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_getMeasuredSize" });
}

fn table_ArkUI_NativeNodeAPI_1_getLayoutPosition(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "getLayoutPosition")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.getLayoutPosition(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_getLayoutPosition, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_getLayoutPosition" });
}

fn table_ArkUI_NativeNodeAPI_1_measureNode(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "measureNode")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "measureNode")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.measureNode(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_measureNode, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_measureNode" });
}

fn table_ArkUI_NativeNodeAPI_1_layoutNode(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "layoutNode")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "layoutNode")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "layoutNode")).optional.child).pointer.child).@"fn".param_types[2].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.layoutNode(arg0, arg1, arg2) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_layoutNode, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_layoutNode" });
}

fn table_ArkUI_NativeNodeAPI_1_addNodeEventReceiver(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "addNodeEventReceiver")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "addNodeEventReceiver")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.addNodeEventReceiver(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_addNodeEventReceiver, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_addNodeEventReceiver" });
}

fn table_ArkUI_NativeNodeAPI_1_removeNodeEventReceiver(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "removeNodeEventReceiver")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "removeNodeEventReceiver")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.removeNodeEventReceiver(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_removeNodeEventReceiver, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_removeNodeEventReceiver" });
}

fn table_ArkUI_NativeNodeAPI_1_addNodeCustomEventReceiver(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "addNodeCustomEventReceiver")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "addNodeCustomEventReceiver")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.addNodeCustomEventReceiver(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_addNodeCustomEventReceiver, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_addNodeCustomEventReceiver" });
}

fn table_ArkUI_NativeNodeAPI_1_removeNodeCustomEventReceiver(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "removeNodeCustomEventReceiver")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "removeNodeCustomEventReceiver")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.removeNodeCustomEventReceiver(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_removeNodeCustomEventReceiver, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_removeNodeCustomEventReceiver" });
}

fn table_ArkUI_NativeNodeAPI_1_setUserData(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "setUserData")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "setUserData")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.setUserData(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_setUserData, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_setUserData" });
}

fn table_ArkUI_NativeNodeAPI_1_getUserData(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "getUserData")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.getUserData(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_getUserData, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_getUserData" });
}

fn table_ArkUI_NativeNodeAPI_1_setLengthMetricUnit(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "setLengthMetricUnit")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "setLengthMetricUnit")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.setLengthMetricUnit(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_setLengthMetricUnit, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_setLengthMetricUnit" });
}

fn table_ArkUI_NativeNodeAPI_1_getParent(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "getParent")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.getParent(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_getParent, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_getParent" });
}

fn table_ArkUI_NativeNodeAPI_1_removeAllChildren(table: *const @import("arkui").raw.ArkUI_NativeNodeAPI_1, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("arkui").raw.ArkUI_NativeNodeAPI_1, "removeAllChildren")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("arkui").interfaces.ArkUI_NativeNodeAPI_1{ .table = table };
    _ = value.removeAllChildren(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkUI_NativeNodeAPI_1_removeAllChildren, .{ .name = "check_table_ArkUI_NativeNodeAPI_1_removeAllChildren" });
}

fn load_ArkWeb_ControllerAPI() callconv(.c) void {
    _ = @import("web").interfaces.ArkWeb_ControllerAPI.load() catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&load_ArkWeb_ControllerAPI, .{ .name = "check_load_ArkWeb_ControllerAPI" });
}

fn table_ArkWeb_ControllerAPI_runJavaScript(table: *const @import("web").raw.ArkWeb_ControllerAPI, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "runJavaScript")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "runJavaScript")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("web").interfaces.ArkWeb_ControllerAPI{ .table = table };
    _ = value.runJavaScript(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkWeb_ControllerAPI_runJavaScript, .{ .name = "check_table_ArkWeb_ControllerAPI_runJavaScript" });
}

fn table_ArkWeb_ControllerAPI_registerJavaScriptProxy(table: *const @import("web").raw.ArkWeb_ControllerAPI, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "registerJavaScriptProxy")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "registerJavaScriptProxy")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("web").interfaces.ArkWeb_ControllerAPI{ .table = table };
    _ = value.registerJavaScriptProxy(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkWeb_ControllerAPI_registerJavaScriptProxy, .{ .name = "check_table_ArkWeb_ControllerAPI_registerJavaScriptProxy" });
}

fn table_ArkWeb_ControllerAPI_deleteJavaScriptRegister(table: *const @import("web").raw.ArkWeb_ControllerAPI, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "deleteJavaScriptRegister")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "deleteJavaScriptRegister")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("web").interfaces.ArkWeb_ControllerAPI{ .table = table };
    _ = value.deleteJavaScriptRegister(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkWeb_ControllerAPI_deleteJavaScriptRegister, .{ .name = "check_table_ArkWeb_ControllerAPI_deleteJavaScriptRegister" });
}

fn table_ArkWeb_ControllerAPI_refresh(table: *const @import("web").raw.ArkWeb_ControllerAPI, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "refresh")).optional.child).pointer.child).@"fn".param_types[0].?) callconv(.c) void {
    const value = @import("web").interfaces.ArkWeb_ControllerAPI{ .table = table };
    _ = value.refresh(arg0) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkWeb_ControllerAPI_refresh, .{ .name = "check_table_ArkWeb_ControllerAPI_refresh" });
}

fn table_ArkWeb_ControllerAPI_registerAsyncJavaScriptProxy(table: *const @import("web").raw.ArkWeb_ControllerAPI, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "registerAsyncJavaScriptProxy")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "registerAsyncJavaScriptProxy")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("web").interfaces.ArkWeb_ControllerAPI{ .table = table };
    _ = value.registerAsyncJavaScriptProxy(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkWeb_ControllerAPI_registerAsyncJavaScriptProxy, .{ .name = "check_table_ArkWeb_ControllerAPI_registerAsyncJavaScriptProxy" });
}

fn table_ArkWeb_ControllerAPI_createWebMessagePorts(table: *const @import("web").raw.ArkWeb_ControllerAPI, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "createWebMessagePorts")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "createWebMessagePorts")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("web").interfaces.ArkWeb_ControllerAPI{ .table = table };
    _ = value.createWebMessagePorts(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkWeb_ControllerAPI_createWebMessagePorts, .{ .name = "check_table_ArkWeb_ControllerAPI_createWebMessagePorts" });
}

fn table_ArkWeb_ControllerAPI_destroyWebMessagePorts(table: *const @import("web").raw.ArkWeb_ControllerAPI, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "destroyWebMessagePorts")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "destroyWebMessagePorts")).optional.child).pointer.child).@"fn".param_types[1].?) callconv(.c) void {
    const value = @import("web").interfaces.ArkWeb_ControllerAPI{ .table = table };
    _ = value.destroyWebMessagePorts(arg0, arg1) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkWeb_ControllerAPI_destroyWebMessagePorts, .{ .name = "check_table_ArkWeb_ControllerAPI_destroyWebMessagePorts" });
}

fn table_ArkWeb_ControllerAPI_postWebMessage(table: *const @import("web").raw.ArkWeb_ControllerAPI, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "postWebMessage")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "postWebMessage")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "postWebMessage")).optional.child).pointer.child).@"fn".param_types[2].?, arg3: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "postWebMessage")).optional.child).pointer.child).@"fn".param_types[3].?, arg4: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "postWebMessage")).optional.child).pointer.child).@"fn".param_types[4].?) callconv(.c) void {
    const value = @import("web").interfaces.ArkWeb_ControllerAPI{ .table = table };
    _ = value.postWebMessage(arg0, arg1, arg2, arg3, arg4) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkWeb_ControllerAPI_postWebMessage, .{ .name = "check_table_ArkWeb_ControllerAPI_postWebMessage" });
}

fn table_ArkWeb_ControllerAPI_getLastJavascriptProxyCallingFrameUrl(table: *const @import("web").raw.ArkWeb_ControllerAPI) callconv(.c) void {
    const value = @import("web").interfaces.ArkWeb_ControllerAPI{ .table = table };
    _ = value.getLastJavascriptProxyCallingFrameUrl() catch return;
}
comptime {
    if (options.compile_check_api >= 14) @export(&table_ArkWeb_ControllerAPI_getLastJavascriptProxyCallingFrameUrl, .{ .name = "check_table_ArkWeb_ControllerAPI_getLastJavascriptProxyCallingFrameUrl" });
}

fn table_ArkWeb_ControllerAPI_registerJavaScriptProxyEx(table: *const @import("web").raw.ArkWeb_ControllerAPI, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "registerJavaScriptProxyEx")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "registerJavaScriptProxyEx")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "registerJavaScriptProxyEx")).optional.child).pointer.child).@"fn".param_types[2].?) callconv(.c) void {
    const value = @import("web").interfaces.ArkWeb_ControllerAPI{ .table = table };
    _ = value.registerJavaScriptProxyEx(arg0, arg1, arg2) catch return;
}
comptime {
    if (options.compile_check_api >= 18) @export(&table_ArkWeb_ControllerAPI_registerJavaScriptProxyEx, .{ .name = "check_table_ArkWeb_ControllerAPI_registerJavaScriptProxyEx" });
}

fn table_ArkWeb_ControllerAPI_registerAsyncJavaScriptProxyEx(table: *const @import("web").raw.ArkWeb_ControllerAPI, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "registerAsyncJavaScriptProxyEx")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "registerAsyncJavaScriptProxyEx")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ControllerAPI, "registerAsyncJavaScriptProxyEx")).optional.child).pointer.child).@"fn".param_types[2].?) callconv(.c) void {
    const value = @import("web").interfaces.ArkWeb_ControllerAPI{ .table = table };
    _ = value.registerAsyncJavaScriptProxyEx(arg0, arg1, arg2) catch return;
}
comptime {
    if (options.compile_check_api >= 18) @export(&table_ArkWeb_ControllerAPI_registerAsyncJavaScriptProxyEx, .{ .name = "check_table_ArkWeb_ControllerAPI_registerAsyncJavaScriptProxyEx" });
}

fn load_ArkWeb_ComponentAPI() callconv(.c) void {
    _ = @import("web").interfaces.ArkWeb_ComponentAPI.load() catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&load_ArkWeb_ComponentAPI, .{ .name = "check_load_ArkWeb_ComponentAPI" });
}

fn table_ArkWeb_ComponentAPI_onControllerAttached(table: *const @import("web").raw.ArkWeb_ComponentAPI, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ComponentAPI, "onControllerAttached")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ComponentAPI, "onControllerAttached")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ComponentAPI, "onControllerAttached")).optional.child).pointer.child).@"fn".param_types[2].?) callconv(.c) void {
    const value = @import("web").interfaces.ArkWeb_ComponentAPI{ .table = table };
    _ = value.onControllerAttached(arg0, arg1, arg2) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkWeb_ComponentAPI_onControllerAttached, .{ .name = "check_table_ArkWeb_ComponentAPI_onControllerAttached" });
}

fn table_ArkWeb_ComponentAPI_onPageBegin(table: *const @import("web").raw.ArkWeb_ComponentAPI, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ComponentAPI, "onPageBegin")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ComponentAPI, "onPageBegin")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ComponentAPI, "onPageBegin")).optional.child).pointer.child).@"fn".param_types[2].?) callconv(.c) void {
    const value = @import("web").interfaces.ArkWeb_ComponentAPI{ .table = table };
    _ = value.onPageBegin(arg0, arg1, arg2) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkWeb_ComponentAPI_onPageBegin, .{ .name = "check_table_ArkWeb_ComponentAPI_onPageBegin" });
}

fn table_ArkWeb_ComponentAPI_onPageEnd(table: *const @import("web").raw.ArkWeb_ComponentAPI, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ComponentAPI, "onPageEnd")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ComponentAPI, "onPageEnd")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ComponentAPI, "onPageEnd")).optional.child).pointer.child).@"fn".param_types[2].?) callconv(.c) void {
    const value = @import("web").interfaces.ArkWeb_ComponentAPI{ .table = table };
    _ = value.onPageEnd(arg0, arg1, arg2) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkWeb_ComponentAPI_onPageEnd, .{ .name = "check_table_ArkWeb_ComponentAPI_onPageEnd" });
}

fn table_ArkWeb_ComponentAPI_onDestroy(table: *const @import("web").raw.ArkWeb_ComponentAPI, arg0: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ComponentAPI, "onDestroy")).optional.child).pointer.child).@"fn".param_types[0].?, arg1: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ComponentAPI, "onDestroy")).optional.child).pointer.child).@"fn".param_types[1].?, arg2: @typeInfo(@typeInfo(@typeInfo(@FieldType(@import("web").raw.ArkWeb_ComponentAPI, "onDestroy")).optional.child).pointer.child).@"fn".param_types[2].?) callconv(.c) void {
    const value = @import("web").interfaces.ArkWeb_ComponentAPI{ .table = table };
    _ = value.onDestroy(arg0, arg1, arg2) catch return;
}
comptime {
    if (options.compile_check_api >= 12) @export(&table_ArkWeb_ComponentAPI_onDestroy, .{ .name = "check_table_ArkWeb_ComponentAPI_onDestroy" });
}
