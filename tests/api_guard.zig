const native = @import("native");
export fn axisAction() i32 {
    return native.OH_ArkUI_AxisEvent_GetAxisAction(null);
}
