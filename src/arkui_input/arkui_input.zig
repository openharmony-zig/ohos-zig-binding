//! Views borrow the event for the duration of the native callback only.
const ffi = @import("ohos_zig_binding_ffi");
const api = @import("ohos_zig_binding_api");
pub const raw = @import("arkui_input_sys");
pub const Error = ffi.Error;
pub const Pointer = struct { id: i32, x: f32, y: f32, window_x: f32, window_y: f32, display_x: f32, display_y: f32, pressure: f32, tilt_x: f32, tilt_y: f32 };
pub const Event = struct {
    handle: *const raw.ArkUI_UIInputEvent,
    pub fn fromRaw(handle: *const raw.ArkUI_UIInputEvent) Event {
        return .{ .handle = handle };
    }
    pub fn eventType(self: Event) i32 {
        return raw.OH_ArkUI_UIInputEvent_GetType(self.handle);
    }
    pub fn action(self: Event) i32 {
        return raw.OH_ArkUI_UIInputEvent_GetAction(self.handle);
    }
    pub fn sourceType(self: Event) i32 {
        return raw.OH_ArkUI_UIInputEvent_GetSourceType(self.handle);
    }
    pub fn toolType(self: Event) i32 {
        return raw.OH_ArkUI_UIInputEvent_GetToolType(self.handle);
    }
    pub fn time(self: Event) i64 {
        return raw.OH_ArkUI_UIInputEvent_GetEventTime(self.handle);
    }
    pub fn pointerCount(self: Event) u32 {
        return raw.OH_ArkUI_PointerEvent_GetPointerCount(self.handle);
    }
    pub fn pointer(self: Event, index: u32) Error!Pointer {
        if (index >= self.pointerCount()) return error.InvalidArgument;
        return .{
            .id = raw.OH_ArkUI_PointerEvent_GetPointerId(self.handle, index),
            .x = raw.OH_ArkUI_PointerEvent_GetXByIndex(self.handle, index),
            .y = raw.OH_ArkUI_PointerEvent_GetYByIndex(self.handle, index),
            .window_x = raw.OH_ArkUI_PointerEvent_GetWindowXByIndex(self.handle, index),
            .window_y = raw.OH_ArkUI_PointerEvent_GetWindowYByIndex(self.handle, index),
            .display_x = raw.OH_ArkUI_PointerEvent_GetDisplayXByIndex(self.handle, index),
            .display_y = raw.OH_ArkUI_PointerEvent_GetDisplayYByIndex(self.handle, index),
            .pressure = raw.OH_ArkUI_PointerEvent_GetPressure(self.handle, index),
            .tilt_x = raw.OH_ArkUI_PointerEvent_GetTiltX(self.handle, index),
            .tilt_y = raw.OH_ArkUI_PointerEvent_GetTiltY(self.handle, index),
        };
    }
    pub fn historySize(self: Event) u32 {
        return raw.OH_ArkUI_PointerEvent_GetHistorySize(self.handle);
    }
    pub fn historyPosition(self: Event, history: u32, index: u32) Error!struct { x: f32, y: f32, time: i64 } {
        if (history >= self.historySize() or index >= raw.OH_ArkUI_PointerEvent_GetHistoryPointerCount(self.handle, history)) return error.InvalidArgument;
        return .{ .x = raw.OH_ArkUI_PointerEvent_GetHistoryX(self.handle, index, history), .y = raw.OH_ArkUI_PointerEvent_GetHistoryY(self.handle, index, history), .time = raw.OH_ArkUI_PointerEvent_GetHistoryEventTime(self.handle, history) };
    }
    pub fn stopPropagation(self: Event, stop: bool) Error!void {
        try ffi.check(raw.OH_ArkUI_PointerEvent_SetStopPropagation(self.handle, stop));
    }
    pub fn intercept(self: Event, mode: raw.HitTestMode) Error!void {
        try ffi.check(raw.OH_ArkUI_PointerEvent_SetInterceptHitTestMode(self.handle, mode));
    }
    pub fn pressedKeys(self: Event, buffer: []i32) Error![]i32 {
        comptime api.require("arkui_input.Event.pressedKeys", 14);
        var count = try ffi.count(i32, buffer.len);
        try ffi.check(raw.OH_ArkUI_UIInputEvent_GetPressedKeys(self.handle, buffer.ptr, &count));
        const len = try ffi.count(usize, count);
        if (len > buffer.len) return error.BufferTooSmall;
        return buffer[0..len];
    }
};
