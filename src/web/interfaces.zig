//! Generated typed dispatch for native interface tables.
//! Returned handles and callback storage follow SDK ownership rules.
const raw = @import("web_sys");
const api = @import("ohos_zig_binding_api");
const Error = @import("ohos_zig_binding_ffi").Error;

fn Method(comptime Table: type, comptime name: []const u8) type {
    return @typeInfo(@typeInfo(@FieldType(Table, name)).optional.child).pointer.child;
}
fn Param(comptime Table: type, comptime name: []const u8, comptime index: usize) type {
    return @typeInfo(Method(Table, name)).@"fn".param_types[index].?;
}
fn Return(comptime Table: type, comptime name: []const u8) type {
    return @typeInfo(Method(Table, name)).@"fn".return_type.?;
}

pub const ArkWeb_ControllerAPI = struct {
    const Self = @This();
    const Table = raw.ArkWeb_ControllerAPI;
    table: *const Table,
    pub fn load() Error!Self {
        const value = raw.OH_ArkWeb_GetNativeAPI(raw.ARKWEB_NATIVE_CONTROLLER) orelse return error.UnexpectedNull;
        return .{ .table = @ptrCast(@alignCast(value)) };
    }
    pub fn runJavaScript(self: Self, arg0: Param(Table, "runJavaScript", 0), arg1: Param(Table, "runJavaScript", 1)) Error!Return(Table, "runJavaScript") {
        if (self.table.size < @offsetOf(Table, "runJavaScript") + @sizeOf(@FieldType(Table, "runJavaScript"))) return error.InvalidHandle;
        const function = self.table.runJavaScript orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn registerJavaScriptProxy(self: Self, arg0: Param(Table, "registerJavaScriptProxy", 0), arg1: Param(Table, "registerJavaScriptProxy", 1)) Error!Return(Table, "registerJavaScriptProxy") {
        if (self.table.size < @offsetOf(Table, "registerJavaScriptProxy") + @sizeOf(@FieldType(Table, "registerJavaScriptProxy"))) return error.InvalidHandle;
        const function = self.table.registerJavaScriptProxy orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn deleteJavaScriptRegister(self: Self, arg0: Param(Table, "deleteJavaScriptRegister", 0), arg1: Param(Table, "deleteJavaScriptRegister", 1)) Error!Return(Table, "deleteJavaScriptRegister") {
        if (self.table.size < @offsetOf(Table, "deleteJavaScriptRegister") + @sizeOf(@FieldType(Table, "deleteJavaScriptRegister"))) return error.InvalidHandle;
        const function = self.table.deleteJavaScriptRegister orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn refresh(self: Self, arg0: Param(Table, "refresh", 0)) Error!Return(Table, "refresh") {
        if (self.table.size < @offsetOf(Table, "refresh") + @sizeOf(@FieldType(Table, "refresh"))) return error.InvalidHandle;
        const function = self.table.refresh orelse return error.InvalidHandle;
        return function(arg0);
    }
    pub fn registerAsyncJavaScriptProxy(self: Self, arg0: Param(Table, "registerAsyncJavaScriptProxy", 0), arg1: Param(Table, "registerAsyncJavaScriptProxy", 1)) Error!Return(Table, "registerAsyncJavaScriptProxy") {
        if (self.table.size < @offsetOf(Table, "registerAsyncJavaScriptProxy") + @sizeOf(@FieldType(Table, "registerAsyncJavaScriptProxy"))) return error.InvalidHandle;
        const function = self.table.registerAsyncJavaScriptProxy orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn createWebMessagePorts(self: Self, arg0: Param(Table, "createWebMessagePorts", 0), arg1: Param(Table, "createWebMessagePorts", 1)) Error!Return(Table, "createWebMessagePorts") {
        if (self.table.size < @offsetOf(Table, "createWebMessagePorts") + @sizeOf(@FieldType(Table, "createWebMessagePorts"))) return error.InvalidHandle;
        const function = self.table.createWebMessagePorts orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn destroyWebMessagePorts(self: Self, arg0: Param(Table, "destroyWebMessagePorts", 0), arg1: Param(Table, "destroyWebMessagePorts", 1)) Error!Return(Table, "destroyWebMessagePorts") {
        if (self.table.size < @offsetOf(Table, "destroyWebMessagePorts") + @sizeOf(@FieldType(Table, "destroyWebMessagePorts"))) return error.InvalidHandle;
        const function = self.table.destroyWebMessagePorts orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn postWebMessage(self: Self, arg0: Param(Table, "postWebMessage", 0), arg1: Param(Table, "postWebMessage", 1), arg2: Param(Table, "postWebMessage", 2), arg3: Param(Table, "postWebMessage", 3), arg4: Param(Table, "postWebMessage", 4)) Error!Return(Table, "postWebMessage") {
        if (self.table.size < @offsetOf(Table, "postWebMessage") + @sizeOf(@FieldType(Table, "postWebMessage"))) return error.InvalidHandle;
        const function = self.table.postWebMessage orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2, arg3, arg4);
    }
    pub fn getLastJavascriptProxyCallingFrameUrl(self: Self) Error!Return(Table, "getLastJavascriptProxyCallingFrameUrl") {
        comptime api.require("web.interfaces.ArkWeb_ControllerAPI.getLastJavascriptProxyCallingFrameUrl", 14);
        if (self.table.size < @offsetOf(Table, "getLastJavascriptProxyCallingFrameUrl") + @sizeOf(@FieldType(Table, "getLastJavascriptProxyCallingFrameUrl"))) return error.InvalidHandle;
        const function = self.table.getLastJavascriptProxyCallingFrameUrl orelse return error.InvalidHandle;
        return function();
    }
    pub fn registerJavaScriptProxyEx(self: Self, arg0: Param(Table, "registerJavaScriptProxyEx", 0), arg1: Param(Table, "registerJavaScriptProxyEx", 1), arg2: Param(Table, "registerJavaScriptProxyEx", 2)) Error!Return(Table, "registerJavaScriptProxyEx") {
        comptime api.require("web.interfaces.ArkWeb_ControllerAPI.registerJavaScriptProxyEx", 18);
        if (self.table.size < @offsetOf(Table, "registerJavaScriptProxyEx") + @sizeOf(@FieldType(Table, "registerJavaScriptProxyEx"))) return error.InvalidHandle;
        const function = self.table.registerJavaScriptProxyEx orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2);
    }
    pub fn registerAsyncJavaScriptProxyEx(self: Self, arg0: Param(Table, "registerAsyncJavaScriptProxyEx", 0), arg1: Param(Table, "registerAsyncJavaScriptProxyEx", 1), arg2: Param(Table, "registerAsyncJavaScriptProxyEx", 2)) Error!Return(Table, "registerAsyncJavaScriptProxyEx") {
        comptime api.require("web.interfaces.ArkWeb_ControllerAPI.registerAsyncJavaScriptProxyEx", 18);
        if (self.table.size < @offsetOf(Table, "registerAsyncJavaScriptProxyEx") + @sizeOf(@FieldType(Table, "registerAsyncJavaScriptProxyEx"))) return error.InvalidHandle;
        const function = self.table.registerAsyncJavaScriptProxyEx orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2);
    }
};

pub const ArkWeb_ComponentAPI = struct {
    const Self = @This();
    const Table = raw.ArkWeb_ComponentAPI;
    table: *const Table,
    pub fn load() Error!Self {
        const value = raw.OH_ArkWeb_GetNativeAPI(raw.ARKWEB_NATIVE_COMPONENT) orelse return error.UnexpectedNull;
        return .{ .table = @ptrCast(@alignCast(value)) };
    }
    pub fn onControllerAttached(self: Self, arg0: Param(Table, "onControllerAttached", 0), arg1: Param(Table, "onControllerAttached", 1), arg2: Param(Table, "onControllerAttached", 2)) Error!Return(Table, "onControllerAttached") {
        if (self.table.size < @offsetOf(Table, "onControllerAttached") + @sizeOf(@FieldType(Table, "onControllerAttached"))) return error.InvalidHandle;
        const function = self.table.onControllerAttached orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2);
    }
    pub fn onPageBegin(self: Self, arg0: Param(Table, "onPageBegin", 0), arg1: Param(Table, "onPageBegin", 1), arg2: Param(Table, "onPageBegin", 2)) Error!Return(Table, "onPageBegin") {
        if (self.table.size < @offsetOf(Table, "onPageBegin") + @sizeOf(@FieldType(Table, "onPageBegin"))) return error.InvalidHandle;
        const function = self.table.onPageBegin orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2);
    }
    pub fn onPageEnd(self: Self, arg0: Param(Table, "onPageEnd", 0), arg1: Param(Table, "onPageEnd", 1), arg2: Param(Table, "onPageEnd", 2)) Error!Return(Table, "onPageEnd") {
        if (self.table.size < @offsetOf(Table, "onPageEnd") + @sizeOf(@FieldType(Table, "onPageEnd"))) return error.InvalidHandle;
        const function = self.table.onPageEnd orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2);
    }
    pub fn onDestroy(self: Self, arg0: Param(Table, "onDestroy", 0), arg1: Param(Table, "onDestroy", 1), arg2: Param(Table, "onDestroy", 2)) Error!Return(Table, "onDestroy") {
        if (self.table.size < @offsetOf(Table, "onDestroy") + @sizeOf(@FieldType(Table, "onDestroy"))) return error.InvalidHandle;
        const function = self.table.onDestroy orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2);
    }
};
