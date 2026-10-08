const ffi = @import("ohos_zig_binding_ffi");
const api = @import("ohos_zig_binding_api");
pub const raw = @import("qos_sys");
pub const Error = ffi.Error;

pub const Level = enum(c_uint) {
    background = raw.QOS_BACKGROUND,
    utility = raw.QOS_UTILITY,
    default = raw.QOS_DEFAULT,
    user_initiated = raw.QOS_USER_INITIATED,
    deadline_request = raw.QOS_DEADLINE_REQUEST,
    user_interactive = raw.QOS_USER_INTERACTIVE,
    _,
};

pub fn setThreadQos(level: Level) Error!void {
    try ffi.check(raw.OH_QoS_SetThreadQoS(@backingInt(level)));
}

pub fn resetThreadQos() Error!void {
    try ffi.check(raw.OH_QoS_ResetThreadQoS());
}

pub fn getThreadQos() Error!Level {
    var level: raw.QoS_Level = 0;
    try ffi.check(raw.OH_QoS_GetThreadQoS(&level));
    return @fromBackingInt(level);
}

pub const GewuSession = struct {
    comptime {
        api.require("qos.GewuSession", 20);
    }
    handle: raw.OH_QoS_GewuSession,

    pub fn create(attributes: [:0]const u8) Error!GewuSession {
        const result = raw.OH_QoS_GewuCreateSession(attributes.ptr);
        try ffi.check(result.@"error");
        return .{ .handle = result.session };
    }

    pub fn deinit(self: *GewuSession) Error!void {
        try ffi.check(raw.OH_QoS_GewuDestroySession(self.handle));
        self.* = undefined;
    }

    /// The callback/context must remain alive until the request completes or is aborted.
    pub fn submit(self: GewuSession, request: [:0]const u8, callback: raw.OH_QoS_GewuOnResponse, context: ?*anyopaque) Error!raw.OH_QoS_GewuRequest {
        if (callback == null) return error.InvalidArgument;
        const result = raw.OH_QoS_GewuSubmitRequest(self.handle, request.ptr, callback, context);
        try ffi.check(result.@"error");
        return result.request;
    }

    pub fn abort(self: GewuSession, request: raw.OH_QoS_GewuRequest) Error!void {
        try ffi.check(raw.OH_QoS_GewuAbortRequest(self.handle, request));
    }
};
