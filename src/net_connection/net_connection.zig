//! Network handles are values. Callback storage must outlive its registration.
const ffi = @import("ohos_zig_binding_ffi");
pub const raw = @import("net_connection_sys");
pub const Error = ffi.Error;

pub fn hasDefaultNet() Error!bool {
    var result: i32 = 0;
    try ffi.check(raw.OH_NetConn_HasDefaultNet(&result));
    return result != 0;
}
pub fn isDefaultNetMetered() Error!bool {
    var result: i32 = 0;
    try ffi.check(raw.OH_NetConn_IsDefaultNetMetered(&result));
    return result != 0;
}
pub fn defaultHttpProxy() Error!raw.NetConn_HttpProxy {
    var result: raw.NetConn_HttpProxy = undefined;
    try ffi.check(raw.OH_NetConn_GetDefaultHttpProxy(&result));
    return result;
}
pub fn allNetworks() Error!raw.NetConn_NetHandleList {
    var result: raw.NetConn_NetHandleList = undefined;
    try ffi.check(raw.OH_NetConn_GetAllNets(&result));
    if (result.netHandleListSize < 0 or result.netHandleListSize > result.netHandles.len) return error.InvalidArgument;
    return result;
}
pub const Network = struct {
    handle: raw.NetConn_NetHandle,
    pub fn default() Error!Network {
        var result: raw.NetConn_NetHandle = undefined;
        try ffi.check(raw.OH_NetConn_GetDefaultNet(&result));
        return .{ .handle = result };
    }
    pub fn properties(self: Network) Error!raw.NetConn_ConnectionProperties {
        var handle = self.handle;
        var result: raw.NetConn_ConnectionProperties = undefined;
        try ffi.check(raw.OH_NetConn_GetConnectionProperties(&handle, &result));
        return result;
    }
    pub fn capabilities(self: Network) Error!raw.NetConn_NetCapabilities {
        var handle = self.handle;
        var result: raw.NetConn_NetCapabilities = undefined;
        try ffi.check(raw.OH_NetConn_GetNetCapabilities(&handle, &result));
        return result;
    }
    pub fn bindSocket(self: Network, fd: i32) Error!void {
        if (fd < 0) return error.InvalidArgument;
        var handle = self.handle;
        try ffi.check(raw.OH_NetConn_BindSocket(fd, &handle));
    }
    pub fn resolve(self: Network, host: [:0]const u8, service: ?[:0]const u8, hints: ?*const raw.addrinfo) Error!DnsResult {
        var result: [*c]raw.addrinfo = null;
        try ffi.check(raw.OH_NetConn_GetAddrInfo(@constCast(host.ptr), if (service) |s| @constCast(s.ptr) else null, @constCast(hints), &result, self.handle.netId));
        return .{ .head = result };
    }
};
/// Move-only owner. Entries and ai_next links are borrowed until deinit.
pub const DnsResult = struct {
    head: [*c]raw.addrinfo,
    pub fn deinit(self: *DnsResult) Error!void {
        if (self.head != null) {
            try ffi.check(raw.OH_NetConn_FreeDnsResult(self.head));
            self.head = null;
        }
    }
};
pub const Registration = struct {
    id: ?u32,
    /// Keep callbacks and any state they access alive until deinit succeeds.
    pub fn default(callbacks: *raw.NetConn_NetConnCallback) Error!Registration {
        var id: u32 = 0;
        try ffi.check(raw.OH_NetConn_RegisterDefaultNetConnCallback(callbacks, &id));
        return .{ .id = id };
    }
    pub fn matching(specifier: *raw.NetConn_NetSpecifier, callbacks: *raw.NetConn_NetConnCallback, timeout_ms: u32) Error!Registration {
        var id: u32 = 0;
        try ffi.check(raw.OH_NetConn_RegisterNetConnCallback(specifier, callbacks, timeout_ms, &id));
        return .{ .id = id };
    }
    pub fn deinit(self: *Registration) Error!void {
        if (self.id) |id| {
            try ffi.check(raw.OH_NetConn_UnregisterNetConnCallback(id));
            self.id = null;
        }
    }
};
