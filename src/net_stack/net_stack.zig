//! Move-only network owners. Serialize operations and teardown; callbacks and
//! buffers supplied to asynchronous operations must survive their completion.
const ffi = @import("ohos_zig_binding_ffi");
const api = @import("ohos_zig_binding_api");
pub const raw = @import("net_stack_sys");
pub const Error = ffi.Error;

pub fn verifyCertificate(cert: *const raw.NetStack_CertBlob, ca: ?*const raw.NetStack_CertBlob) Error!void {
    try ffi.check(raw.OH_NetStack_CertVerification(cert, ca));
}
pub const Certificates = struct {
    value: raw.NetStack_Certificates,
    pub fn forHost(host: [:0]const u8) Error!Certificates {
        var result: Certificates = .{ .value = @import("std").mem.zeroes(raw.NetStack_Certificates) };
        errdefer result.deinit();
        try ffi.check(raw.OH_NetStack_GetCertificatesForHostName(host.ptr, &result.value));
        return result;
    }
    pub fn deinit(self: *Certificates) void {
        raw.OH_Netstack_DestroyCertificatesContent(&self.value);
        self.value = @import("std").mem.zeroes(raw.NetStack_Certificates);
    }
};
pub const WebSocket = struct {
    handle: ?*raw.WebSocket,
    pub fn create(on_open: raw.WebSocket_OnOpenCallback, on_message: raw.WebSocket_OnMessageCallback, on_error: raw.WebSocket_OnErrorCallback, on_close: raw.WebSocket_OnCloseCallback) Error!WebSocket {
        return .{ .handle = raw.OH_WebSocketClient_Constructor(on_open, on_message, on_error, on_close) orelse return error.UnexpectedNull };
    }
    pub fn addHeader(self: WebSocket, name: [:0]const u8, value: [:0]const u8) Error!void {
        try ffi.check(raw.OH_WebSocketClient_AddHeader(self.handle orelse return error.InvalidHandle, .{ .fieldName = name.ptr, .fieldValue = value.ptr, .next = null }));
    }
    pub fn connect(self: WebSocket, url: [:0]const u8) Error!void {
        try ffi.check(raw.OH_WebSocketClient_Connect(self.handle orelse return error.InvalidHandle, url.ptr, .{ .headers = null }));
    }
    pub fn send(self: WebSocket, data: []const u8) Error!void {
        try ffi.check(raw.OH_WebSocketClient_Send(self.handle orelse return error.InvalidHandle, @constCast(data.ptr), data.len));
    }
    pub fn close(self: WebSocket, code: u32, reason: [:0]const u8) Error!void {
        try ffi.check(raw.OH_WebSocketClient_Close(self.handle orelse return error.InvalidHandle, .{ .code = code, .reason = reason.ptr }));
    }
    /// Call outside callbacks after application users of the client have stopped.
    pub fn deinit(self: *WebSocket) Error!void {
        if (self.handle) |handle| {
            try ffi.check(raw.OH_WebSocketClient_Destroy(handle));
            self.handle = null;
        }
    }
};
pub const HttpHeaders = struct {
    comptime {
        api.require("net_stack.HttpHeaders", 20);
    }
    handle: ?*raw.Http_Headers,
    pub fn create() Error!HttpHeaders {
        return .{ .handle = raw.OH_Http_CreateHeaders() orelse return error.UnexpectedNull };
    }
    pub fn set(self: HttpHeaders, name: [:0]const u8, value: [:0]const u8) Error!void {
        try ffi.check(raw.OH_Http_SetHeaderValue(self.handle orelse return error.InvalidHandle, name.ptr, value.ptr));
    }
    pub fn deinit(self: *HttpHeaders) void {
        if (self.handle != null) raw.OH_Http_DestroyHeaders(&self.handle);
        self.handle = null;
    }
};
pub const HttpRequest = struct {
    comptime {
        api.require("net_stack.HttpRequest", 20);
    }
    handle: ?*raw.Http_Request,
    pub fn create(url: [:0]const u8) Error!HttpRequest {
        return .{ .handle = raw.OH_Http_CreateRequest(url.ptr) orelse return error.UnexpectedNull };
    }
    /// Borrowed options. Referenced headers, strings and certificates must remain
    /// alive until the request finishes. Do not modify options while running.
    pub fn options(self: HttpRequest) Error!*raw.Http_RequestOptions {
        const handle = self.handle orelse return error.InvalidHandle;
        return if (handle.options == null) error.UnexpectedNull else handle.options;
    }
    /// The response callback owns the response and must release it with HttpResponse.
    pub fn send(self: HttpRequest, callback: raw.Http_ResponseCallback, events: raw.Http_EventsHandler) Error!void {
        if (callback == null) return error.InvalidArgument;
        try ffi.check(raw.OH_Http_Request(self.handle orelse return error.InvalidHandle, callback, events));
    }
    pub fn deinit(self: *HttpRequest) void {
        if (self.handle != null) raw.OH_Http_Destroy(@ptrCast(&self.handle));
        self.handle = null;
    }
};
pub const HttpResponse = struct {
    comptime {
        api.require("net_stack.HttpResponse", 20);
    }
    handle: ?*raw.Http_Response,
    pub fn fromOwned(handle: *raw.Http_Response) HttpResponse {
        return .{ .handle = handle };
    }
    /// Borrowed until deinit; response bodies may contain embedded zero bytes.
    pub fn body(self: HttpResponse) Error![]const u8 {
        const handle = self.handle orelse return error.InvalidHandle;
        if (handle.body.length == 0) return &.{};
        if (handle.body.buffer == null) return error.UnexpectedNull;
        return handle.body.buffer[0..handle.body.length];
    }
    pub fn deinit(self: *HttpResponse) Error!void {
        if (self.handle) |handle| {
            const destroy = handle.destroyResponse orelse return error.InvalidHandle;
            destroy(@ptrCast(&self.handle));
            self.handle = null;
        }
    }
};
