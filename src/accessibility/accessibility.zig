//! API 13 accessibility helpers. Owned information objects are move-only;
//! callback-populated element views and provider handles are borrowed.
const ffi = @import("ohos_zig_binding_ffi");
const api = @import("ohos_zig_binding_api");
pub const raw = @import("accessibility_sys");
pub const Error = ffi.Error;
pub const Element = struct {
    comptime {
        api.require("accessibility.Element", 13);
    }
    handle: ?*raw.ArkUI_AccessibilityElementInfo,
    owned: bool,
    pub fn create() Error!Element {
        return .{ .handle = raw.OH_ArkUI_CreateAccessibilityElementInfo() orelse return error.UnexpectedNull, .owned = true };
    }
    pub fn borrowed(handle: *raw.ArkUI_AccessibilityElementInfo) Element {
        return .{ .handle = handle, .owned = false };
    }
    pub fn ptr(self: Element) Error!*raw.ArkUI_AccessibilityElementInfo {
        return self.handle orelse error.InvalidHandle;
    }
    pub fn deinit(self: *Element) void {
        if (self.owned) {
            if (self.handle) |handle| raw.OH_ArkUI_DestoryAccessibilityElementInfo(handle);
        }
        self.handle = null;
    }
    pub fn setElementId(self: Element, value: i32) Error!void {
        try ffi.check(raw.OH_ArkUI_AccessibilityElementInfoSetElementId(try self.ptr(), value));
    }
    pub fn setParentId(self: Element, value: i32) Error!void {
        try ffi.check(raw.OH_ArkUI_AccessibilityElementInfoSetParentId(try self.ptr(), value));
    }
    pub fn setContents(self: Element, value: [:0]const u8) Error!void {
        try ffi.check(raw.OH_ArkUI_AccessibilityElementInfoSetContents(try self.ptr(), value.ptr));
    }
    pub fn setComponentType(self: Element, value: [:0]const u8) Error!void {
        try ffi.check(raw.OH_ArkUI_AccessibilityElementInfoSetComponentType(try self.ptr(), value.ptr));
    }
    pub fn setAccessibilityText(self: Element, value: [:0]const u8) Error!void {
        try ffi.check(raw.OH_ArkUI_AccessibilityElementInfoSetAccessibilityText(try self.ptr(), value.ptr));
    }
    pub fn setEnabled(self: Element, value: bool) Error!void {
        try ffi.check(raw.OH_ArkUI_AccessibilityElementInfoSetEnabled(try self.ptr(), value));
    }
    pub fn setFocusable(self: Element, value: bool) Error!void {
        try ffi.check(raw.OH_ArkUI_AccessibilityElementInfoSetFocusable(try self.ptr(), value));
    }
    pub fn setFocused(self: Element, value: bool) Error!void {
        try ffi.check(raw.OH_ArkUI_AccessibilityElementInfoSetFocused(try self.ptr(), value));
    }
    pub fn setVisible(self: Element, value: bool) Error!void {
        try ffi.check(raw.OH_ArkUI_AccessibilityElementInfoSetVisible(try self.ptr(), value));
    }
    pub fn setClickable(self: Element, value: bool) Error!void {
        try ffi.check(raw.OH_ArkUI_AccessibilityElementInfoSetClickable(try self.ptr(), value));
    }
    pub fn setSelected(self: Element, value: bool) Error!void {
        try ffi.check(raw.OH_ArkUI_AccessibilityElementInfoSetSelected(try self.ptr(), value));
    }
    pub fn setChildren(self: Element, children: []const i64) Error!void {
        try ffi.check(raw.OH_ArkUI_AccessibilityElementInfoSetChildNodeIds(try self.ptr(), try ffi.count(i32, children.len), @constCast(children.ptr)));
    }
    pub fn setActions(self: Element, actions: []const raw.ArkUI_AccessibleAction) Error!void {
        try ffi.check(raw.OH_ArkUI_AccessibilityElementInfoSetOperationActions(try self.ptr(), try ffi.count(i32, actions.len), @constCast(actions.ptr)));
    }
    pub fn setRect(self: Element, rect: raw.ArkUI_AccessibleRect) Error!void {
        var value = rect;
        try ffi.check(raw.OH_ArkUI_AccessibilityElementInfoSetScreenRect(try self.ptr(), &value));
    }
};
pub const Event = struct {
    comptime {
        api.require("accessibility.Event", 13);
    }
    handle: ?*raw.ArkUI_AccessibilityEventInfo,
    pub fn create() Error!Event {
        return .{ .handle = raw.OH_ArkUI_CreateAccessibilityEventInfo() orelse return error.UnexpectedNull };
    }
    pub fn ptr(self: Event) Error!*raw.ArkUI_AccessibilityEventInfo {
        return self.handle orelse error.InvalidHandle;
    }
    pub fn deinit(self: *Event) void {
        if (self.handle) |handle| raw.OH_ArkUI_DestoryAccessibilityEventInfo(handle);
        self.handle = null;
    }
    pub fn setType(self: Event, kind: raw.ArkUI_AccessibilityEventType) Error!void {
        try ffi.check(raw.OH_ArkUI_AccessibilityEventSetEventType(try self.ptr(), kind));
    }
    pub fn setText(self: Event, text: [:0]const u8) Error!void {
        try ffi.check(raw.OH_ArkUI_AccessibilityEventSetTextAnnouncedForAccessibility(try self.ptr(), text.ptr));
    }
    pub fn setFocusId(self: Event, id: i32) Error!void {
        try ffi.check(raw.OH_ArkUI_AccessibilityEventSetRequestFocusId(try self.ptr(), id));
    }
    pub fn setElement(self: Event, element: Element) Error!void {
        try ffi.check(raw.OH_ArkUI_AccessibilityEventSetElementInfo(try self.ptr(), try element.ptr()));
    }
};
pub const Provider = struct {
    comptime {
        api.require("accessibility.Provider", 13);
    }
    handle: *raw.ArkUI_AccessibilityProvider,
    pub fn fromRaw(handle: *raw.ArkUI_AccessibilityProvider) Provider {
        return .{ .handle = handle };
    }
    /// The provider belongs to the XComponent. Keep callbacks/state alive until
    /// that component is destroyed or callbacks are replaced by the application.
    pub fn register(self: Provider, callbacks: *raw.ArkUI_AccessibilityProviderCallbacks) Error!void {
        try ffi.check(raw.OH_ArkUI_AccessibilityProviderRegisterCallback(self.handle, callbacks));
    }
    /// Keep the event, element and provider alive until completion is called.
    pub fn send(self: Provider, event: Event, completion: *const fn (i32) callconv(.c) void) Error!void {
        raw.OH_ArkUI_SendAccessibilityAsyncEvent(self.handle, try event.ptr(), completion);
    }
};
