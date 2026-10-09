//! Call on the UI thread. Node/dialog owners are move-only; detach nodes and
//! unregister callbacks before disposing them. Children are independently owned.
const ffi = @import("ohos_zig_binding_ffi");
pub const raw = @import("arkui_sys");
pub const Error = ffi.Error;
pub const NodeApi = struct {
    table: *const raw.ArkUI_NativeNodeAPI_1,
    pub fn load() Error!NodeApi {
        const ptr = raw.OH_ArkUI_QueryModuleInterfaceByName(raw.ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1") orelse return error.UnexpectedNull;
        return .{ .table = @ptrCast(@alignCast(ptr)) };
    }
    pub fn create(self: NodeApi, kind: raw.ArkUI_NodeType) Error!Node {
        const create_node = self.table.createNode orelse return error.InvalidHandle;
        return .{ .api = self, .handle = create_node(kind) orelse return error.UnexpectedNull };
    }
};
pub const Node = struct {
    api: NodeApi,
    handle: raw.ArkUI_NodeHandle,
    pub fn ptr(self: Node) Error!raw.ArkUI_NodeHandle {
        return self.handle orelse error.InvalidHandle;
    }
    pub fn deinit(self: *Node) Error!void {
        if (self.handle) |handle| {
            (self.api.table.disposeNode orelse return error.InvalidHandle)(handle);
            self.handle = null;
        }
    }
    pub fn addChild(self: Node, child: Node) Error!void {
        try ffi.check((self.api.table.addChild orelse return error.InvalidHandle)(try self.ptr(), try child.ptr()));
    }
    pub fn removeChild(self: Node, child: Node) Error!void {
        try ffi.check((self.api.table.removeChild orelse return error.InvalidHandle)(try self.ptr(), try child.ptr()));
    }
    /// The SDK defines ownership of object-valued attributes; keep referenced
    /// native objects alive until the attribute is reset or the node is disposed.
    pub fn setAttribute(self: Node, kind: raw.ArkUI_NodeAttributeType, item: *const raw.ArkUI_AttributeItem) Error!void {
        try ffi.check((self.api.table.setAttribute orelse return error.InvalidHandle)(try self.ptr(), kind, item));
    }
    pub fn setNumber(self: Node, kind: raw.ArkUI_NodeAttributeType, value: f32) Error!void {
        const number = raw.ArkUI_NumberValue{ .f32 = value };
        try self.setAttribute(kind, &.{ .value = &number, .size = 1, .string = null, .object = null });
    }
    pub fn setString(self: Node, kind: raw.ArkUI_NodeAttributeType, value: [:0]const u8) Error!void {
        try self.setAttribute(kind, &.{ .value = null, .size = 0, .string = value.ptr, .object = null });
    }
    pub fn resetAttribute(self: Node, kind: raw.ArkUI_NodeAttributeType) Error!void {
        try ffi.check((self.api.table.resetAttribute orelse return error.InvalidHandle)(try self.ptr(), kind));
    }
    pub fn registerEvent(self: Node, kind: raw.ArkUI_NodeEventType, id: i32, user_data: ?*anyopaque) Error!void {
        try ffi.check((self.api.table.registerNodeEvent orelse return error.InvalidHandle)(try self.ptr(), kind, id, user_data));
    }
    pub fn unregisterEvent(self: Node, kind: raw.ArkUI_NodeEventType) Error!void {
        (self.api.table.unregisterNodeEvent orelse return error.InvalidHandle)(try self.ptr(), kind);
    }
    pub fn addEventReceiver(self: Node, callback: *const fn (?*raw.ArkUI_NodeEvent) callconv(.c) void) Error!void {
        try ffi.check((self.api.table.addNodeEventReceiver orelse return error.InvalidHandle)(try self.ptr(), callback));
    }
    pub fn removeEventReceiver(self: Node, callback: *const fn (?*raw.ArkUI_NodeEvent) callconv(.c) void) Error!void {
        try ffi.check((self.api.table.removeNodeEventReceiver orelse return error.InvalidHandle)(try self.ptr(), callback));
    }
};
/// Borrowed ArkTS NodeContent. Its ArkTS object must remain alive while attached.
pub const Content = struct {
    handle: raw.ArkUI_NodeContentHandle,
    pub fn fromRaw(handle: raw.ArkUI_NodeContentHandle) Error!Content {
        return .{ .handle = handle orelse return error.InvalidHandle };
    }
    pub fn add(self: Content, node: Node) Error!void {
        try ffi.check(raw.OH_ArkUI_NodeContent_AddNode(self.handle, try node.ptr()));
    }
    pub fn remove(self: Content, node: Node) Error!void {
        try ffi.check(raw.OH_ArkUI_NodeContent_RemoveNode(self.handle, try node.ptr()));
    }
};
pub const Dialog = struct {
    table: *const raw.ArkUI_NativeDialogAPI_1,
    handle: raw.ArkUI_NativeDialogHandle,
    pub fn create() Error!Dialog {
        const ptr = raw.OH_ArkUI_QueryModuleInterfaceByName(raw.ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1") orelse return error.UnexpectedNull;
        const table: *const raw.ArkUI_NativeDialogAPI_1 = @ptrCast(@alignCast(ptr));
        return .{ .table = table, .handle = (table.create orelse return error.InvalidHandle)() orelse return error.UnexpectedNull };
    }
    pub fn setContent(self: Dialog, node: Node) Error!void {
        try ffi.check((self.table.setContent orelse return error.InvalidHandle)(self.handle orelse return error.InvalidHandle, try node.ptr()));
    }
    pub fn show(self: Dialog, subwindow: bool) Error!void {
        try ffi.check((self.table.show orelse return error.InvalidHandle)(self.handle orelse return error.InvalidHandle, subwindow));
    }
    pub fn close(self: Dialog) Error!void {
        try ffi.check((self.table.close orelse return error.InvalidHandle)(self.handle orelse return error.InvalidHandle));
    }
    /// Close the dialog first and keep its content alive until disposal.
    pub fn deinit(self: *Dialog) Error!void {
        if (self.handle) |handle| {
            (self.table.dispose orelse return error.InvalidHandle)(handle);
            self.handle = null;
        }
    }
};
