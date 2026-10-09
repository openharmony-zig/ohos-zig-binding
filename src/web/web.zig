//! ArkWeb UI-thread helpers. Native callback arguments are borrowed unless the
//! application explicitly takes ownership. Keep async buffers/state alive.
const std = @import("std");
const ffi = @import("ohos_zig_binding_ffi");
pub const raw = @import("web_sys");
pub const Error = ffi.Error;
fn takeString(allocator: std.mem.Allocator, value: [*c]u8) Error![]u8 {
    if (value == null) return error.UnexpectedNull;
    defer raw.OH_ArkWeb_ReleaseString(value);
    return allocator.dupe(u8, std.mem.span(value));
}
pub const Request = struct {
    handle: *const raw.ArkWeb_ResourceRequest,
    pub fn fromRaw(handle: *const raw.ArkWeb_ResourceRequest) Request {
        return .{ .handle = handle };
    }
    pub fn url(self: Request, allocator: std.mem.Allocator) Error![]u8 {
        var value: [*c]u8 = null;
        raw.OH_ArkWebResourceRequest_GetUrl(self.handle, &value);
        return takeString(allocator, value);
    }
    pub fn method(self: Request, allocator: std.mem.Allocator) Error![]u8 {
        var value: [*c]u8 = null;
        raw.OH_ArkWebResourceRequest_GetMethod(self.handle, &value);
        return takeString(allocator, value);
    }
    pub fn isMainFrame(self: Request) bool {
        return raw.OH_ArkWebResourceRequest_IsMainFrame(self.handle);
    }
};
pub const Response = struct {
    handle: ?*raw.ArkWeb_Response,
    pub fn create() Error!Response {
        var handle: ?*raw.ArkWeb_Response = null;
        raw.OH_ArkWeb_CreateResponse(&handle);
        return .{ .handle = handle orelse return error.UnexpectedNull };
    }
    pub fn ptr(self: Response) Error!*raw.ArkWeb_Response {
        return self.handle orelse error.InvalidHandle;
    }
    pub fn deinit(self: *Response) void {
        if (self.handle) |handle| raw.OH_ArkWeb_DestroyResponse(handle);
        self.handle = null;
    }
    pub fn setStatus(self: Response, status: i32) Error!void {
        if (status < 100 or status > 599) return error.InvalidArgument;
        try ffi.check(raw.OH_ArkWebResponse_SetStatus(try self.ptr(), status));
    }
    pub fn setMimeType(self: Response, mime: [:0]const u8) Error!void {
        try ffi.check(raw.OH_ArkWebResponse_SetMimeType(try self.ptr(), mime.ptr));
    }
    pub fn setCharset(self: Response, charset: [:0]const u8) Error!void {
        try ffi.check(raw.OH_ArkWebResponse_SetCharset(try self.ptr(), charset.ptr));
    }
    pub fn setHeader(self: Response, name: [:0]const u8, value: [:0]const u8, overwrite: bool) Error!void {
        try ffi.check(raw.OH_ArkWebResponse_SetHeaderByName(try self.ptr(), name.ptr, value.ptr, overwrite));
    }
};
/// Borrowed resource handler. The callback owner must destroy the native request
/// and handler with the raw APIs after completion/stop, per the SDK contract.
pub const ResourceHandler = struct {
    handle: *const raw.ArkWeb_ResourceHandler,
    pub fn fromRaw(handle: *const raw.ArkWeb_ResourceHandler) ResourceHandler {
        return .{ .handle = handle };
    }
    pub fn respond(self: ResourceHandler, response: Response) Error!void {
        try ffi.check(raw.OH_ArkWebResourceHandler_DidReceiveResponse(self.handle, try response.ptr()));
    }
    pub fn write(self: ResourceHandler, data: []const u8) Error!void {
        try ffi.check(raw.OH_ArkWebResourceHandler_DidReceiveData(self.handle, data.ptr, try ffi.count(i64, data.len)));
    }
    pub fn finish(self: ResourceHandler) Error!void {
        try ffi.check(raw.OH_ArkWebResourceHandler_DidFinish(self.handle));
    }
    pub fn fail(self: ResourceHandler, code: raw.ArkWeb_NetError) Error!void {
        try ffi.check(raw.OH_ArkWebResourceHandler_DidFailWithError(self.handle, code));
    }
};
pub const SchemeHandler = struct {
    handle: ?*raw.ArkWeb_SchemeHandler,
    pub fn create() Error!SchemeHandler {
        var handle: ?*raw.ArkWeb_SchemeHandler = null;
        raw.OH_ArkWeb_CreateSchemeHandler(&handle);
        return .{ .handle = handle orelse return error.UnexpectedNull };
    }
    pub fn ptr(self: SchemeHandler) Error!*raw.ArkWeb_SchemeHandler {
        return self.handle orelse error.InvalidHandle;
    }
    /// Clear registrations and finish all outstanding callbacks before deinit.
    pub fn deinit(self: *SchemeHandler) void {
        if (self.handle) |handle| raw.OH_ArkWeb_DestroySchemeHandler(handle);
        self.handle = null;
    }
    pub fn setCallbacks(self: SchemeHandler, start: raw.ArkWeb_OnRequestStart, stop: raw.ArkWeb_OnRequestStop) Error!void {
        try ffi.check(raw.OH_ArkWebSchemeHandler_SetOnRequestStart(try self.ptr(), start));
        try ffi.check(raw.OH_ArkWebSchemeHandler_SetOnRequestStop(try self.ptr(), stop));
    }
    pub fn setUserData(self: SchemeHandler, data: ?*anyopaque) Error!void {
        try ffi.check(raw.OH_ArkWebSchemeHandler_SetUserData(try self.ptr(), data));
    }
    /// Keep this handler alive until clearHandlers is called for every web tag.
    pub fn install(self: SchemeHandler, scheme: [:0]const u8, web_tag: [:0]const u8) Error!void {
        if (!raw.OH_ArkWeb_SetSchemeHandler(scheme.ptr, web_tag.ptr, try self.ptr())) return error.NativeCallFailed;
    }
};
/// Explicitly clears ALL scheme registrations on the given Web component.
pub fn clearHandlers(web_tag: [:0]const u8) Error!void {
    try ffi.check(raw.OH_ArkWeb_ClearSchemeHandlers(web_tag.ptr));
}
pub const Controller = struct {
    table: *const raw.ArkWeb_ControllerAPI,
    web_tag: [:0]const u8,
    pub fn load(web_tag: [:0]const u8) Error!Controller {
        const ptr = raw.OH_ArkWeb_GetNativeAPI(raw.ARKWEB_NATIVE_CONTROLLER) orelse return error.UnexpectedNull;
        const table: *const raw.ArkWeb_ControllerAPI = @ptrCast(@alignCast(ptr));
        // Check the runtime table extent before accessing members of newer SDKs.
        if (table.size < @offsetOf(raw.ArkWeb_ControllerAPI, "refresh") + @sizeOf(@TypeOf(table.refresh))) return error.InvalidHandle;
        return .{ .table = table, .web_tag = web_tag };
    }
    pub fn refresh(self: Controller) Error!void {
        (self.table.refresh orelse return error.InvalidHandle)(self.web_tag.ptr);
    }
    /// The script, callback and user data must survive asynchronous completion.
    pub fn runJavaScript(self: Controller, script: *const raw.ArkWeb_JavaScriptObject) Error!void {
        (self.table.runJavaScript orelse return error.InvalidHandle)(self.web_tag.ptr, script);
    }
};
