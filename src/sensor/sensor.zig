const std = @import("std");
const ffi = @import("ohos_zig_binding_ffi");
pub const raw = @import("sensor_sys");
pub const Error = ffi.Error;
pub const Type = raw.Sensor_Type;

pub const InfoList = struct {
    items: [*c]?*raw.Sensor_Info,
    len: u32,
    capacity: u32,

    pub fn query() Error!InfoList {
        var count: u32 = 0;
        try ffi.check(raw.OH_Sensor_GetInfos(null, &count));
        if (count == 0) return .{ .items = null, .len = 0, .capacity = 0 };
        const items = raw.OH_Sensor_CreateInfos(count);
        if (items == null) return error.UnexpectedNull;
        const capacity = count;
        errdefer _ = raw.OH_Sensor_DestroyInfos(items, capacity);
        try ffi.check(raw.OH_Sensor_GetInfos(items, &count));
        if (count > capacity) return error.BufferTooSmall;
        return .{ .items = items, .len = count, .capacity = capacity };
    }
    pub fn get(self: InfoList, index: usize) Error!Info {
        if (index >= self.len) return error.InvalidArgument;
        return .{ .handle = self.items[index] orelse return error.UnexpectedNull };
    }
    pub fn deinit(self: *InfoList) Error!void {
        if (self.items == null) return;
        try ffi.check(raw.OH_Sensor_DestroyInfos(self.items, self.capacity));
        self.* = .{ .items = null, .len = 0, .capacity = 0 };
    }
};

/// Borrowed from InfoList; never outlives the list.
pub const Info = struct {
    handle: *raw.Sensor_Info,
    pub fn name(self: Info, output: []u8) Error![]const u8 {
        return self.readString(output, raw.OH_SensorInfo_GetName);
    }
    pub fn vendor(self: Info, output: []u8) Error![]const u8 {
        return self.readString(output, raw.OH_SensorInfo_GetVendorName);
    }
    fn readString(self: Info, output: []u8, comptime getter: anytype) Error![]const u8 {
        if (output.len == 0) return error.BufferTooSmall;
        var len = try ffi.count(u32, output.len);
        @memset(output, 0);
        try ffi.check(getter(self.handle, output.ptr, &len));
        if (len > output.len) return error.BufferTooSmall;
        return output[0 .. std.mem.indexOfScalar(u8, output[0..len], 0) orelse len];
    }
    pub fn getType(self: Info) Error!Type {
        var value: Type = 0;
        try ffi.check(raw.OH_SensorInfo_GetType(self.handle, &value));
        return value;
    }
    pub fn resolution(self: Info) Error!f32 {
        var value: f32 = 0;
        try ffi.check(raw.OH_SensorInfo_GetResolution(self.handle, &value));
        return value;
    }
    pub fn minSamplingInterval(self: Info) Error!i64 {
        var value: i64 = 0;
        try ffi.check(raw.OH_SensorInfo_GetMinSamplingInterval(self.handle, &value));
        return value;
    }
    pub fn maxSamplingInterval(self: Info) Error!i64 {
        var value: i64 = 0;
        try ffi.check(raw.OH_SensorInfo_GetMaxSamplingInterval(self.handle, &value));
        return value;
    }
};

/// Event storage is borrowed only for the duration of a native callback.
pub const Event = struct {
    sensor_type: Type,
    timestamp: i64,
    accuracy: raw.Sensor_Accuracy,
    data: []const f32,
    pub fn fromRaw(handle: *raw.Sensor_Event) Error!Event {
        var value: Event = undefined;
        try ffi.check(raw.OH_SensorEvent_GetType(handle, &value.sensor_type));
        try ffi.check(raw.OH_SensorEvent_GetTimestamp(handle, &value.timestamp));
        try ffi.check(raw.OH_SensorEvent_GetAccuracy(handle, &value.accuracy));
        var data: [*c]f32 = null;
        var len: u32 = 0;
        try ffi.check(raw.OH_SensorEvent_GetData(handle, &data, &len));
        if (len != 0 and data == null) return error.UnexpectedNull;
        value.data = if (len == 0) &.{} else data[0..len];
        return value;
    }
};

/// Native callback has no context argument. Keep callback state alive through
/// unsubscribe, and serialize start/stop/deinit. Do not copy this owner.
pub const Subscription = struct {
    id: ?*raw.Sensor_SubscriptionId,
    attribute: ?*raw.Sensor_SubscriptionAttribute,
    subscriber: ?*raw.Sensor_Subscriber,
    active: bool = false,

    pub fn create(sensor_type: Type, interval_ns: i64, callback: raw.Sensor_EventCallback) Error!Subscription {
        if (interval_ns <= 0 or callback == null) return error.InvalidArgument;
        const id = raw.OH_Sensor_CreateSubscriptionId() orelse return error.UnexpectedNull;
        errdefer _ = raw.OH_Sensor_DestroySubscriptionId(id);
        const attribute = raw.OH_Sensor_CreateSubscriptionAttribute() orelse return error.UnexpectedNull;
        errdefer _ = raw.OH_Sensor_DestroySubscriptionAttribute(attribute);
        const subscriber = raw.OH_Sensor_CreateSubscriber() orelse return error.UnexpectedNull;
        errdefer _ = raw.OH_Sensor_DestroySubscriber(subscriber);
        try ffi.check(raw.OH_SensorSubscriptionId_SetType(id, sensor_type));
        try ffi.check(raw.OH_SensorSubscriptionAttribute_SetSamplingInterval(attribute, interval_ns));
        try ffi.check(raw.OH_SensorSubscriber_SetCallback(subscriber, callback));
        return .{ .id = id, .attribute = attribute, .subscriber = subscriber };
    }
    pub fn start(self: *Subscription) Error!void {
        if (self.active) return;
        try ffi.check(raw.OH_Sensor_Subscribe(self.id orelse return error.InvalidHandle, self.attribute orelse return error.InvalidHandle, self.subscriber orelse return error.InvalidHandle));
        self.active = true;
    }
    pub fn stop(self: *Subscription) Error!void {
        if (!self.active) return;
        try ffi.check(raw.OH_Sensor_Unsubscribe(self.id, self.subscriber));
        self.active = false;
    }
    pub fn deinit(self: *Subscription) Error!void {
        try self.stop();
        if (self.subscriber) |value| {
            try ffi.check(raw.OH_Sensor_DestroySubscriber(value));
            self.subscriber = null;
        }
        if (self.attribute) |value| {
            try ffi.check(raw.OH_Sensor_DestroySubscriptionAttribute(value));
            self.attribute = null;
        }
        if (self.id) |value| {
            try ffi.check(raw.OH_Sensor_DestroySubscriptionId(value));
            self.id = null;
        }
    }
};
