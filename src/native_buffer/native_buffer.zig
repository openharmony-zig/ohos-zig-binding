const std = @import("std");
const ffi = @import("ohos_zig_binding_ffi");
pub const raw = @import("native_buffer_sys");
pub const Error = ffi.Error;
pub const Config = raw.OH_NativeBuffer_Config;

/// Owns one native reference. Copy with clone; release with deinit.
pub const NativeBuffer = struct {
    handle: ?*raw.OH_NativeBuffer,
    mapped: bool = false,

    pub fn create(config: Config) Error!NativeBuffer {
        if (config.width <= 0 or config.height <= 0) return error.InvalidArgument;
        return .{ .handle = raw.OH_NativeBuffer_Alloc(&config) orelse return error.UnexpectedNull };
    }

    pub fn retain(handle: *raw.OH_NativeBuffer) Error!NativeBuffer {
        try ffi.check(raw.OH_NativeBuffer_Reference(handle));
        return .{ .handle = handle };
    }

    pub fn clone(self: NativeBuffer) Error!NativeBuffer {
        return retain(self.handle orelse return error.InvalidHandle);
    }

    /// Conversion borrows the window's reference; explicitly acquire our own.
    pub fn fromWindowBuffer(window: *raw.OHNativeWindowBuffer) Error!NativeBuffer {
        var value: ?*raw.OH_NativeBuffer = null;
        try ffi.check(raw.OH_NativeBuffer_FromNativeWindowBuffer(window, &value));
        return retain(value orelse return error.UnexpectedNull);
    }

    pub fn getConfig(self: NativeBuffer) Error!Config {
        var config: Config = std.mem.zeroes(Config);
        raw.OH_NativeBuffer_GetConfig(self.handle orelse return error.InvalidHandle, &config);
        return config;
    }

    /// The byte slice is borrowed until unmap/deinit. Caller synchronizes GPU
    /// access. Only the first stride * height bytes are exposed (no extra planes).
    pub fn map(self: *NativeBuffer) Error![]u8 {
        if (self.mapped) return error.InvalidArgument;
        const config = try self.getConfig();
        if (config.stride <= 0 or config.height <= 0) return error.InvalidArgument;
        const len = std.math.mul(usize, @intCast(config.stride), @intCast(config.height)) catch return error.InvalidArgument;
        var address: ?*anyopaque = null;
        try ffi.check(raw.OH_NativeBuffer_Map(self.handle.?, &address));
        errdefer _ = raw.OH_NativeBuffer_Unmap(self.handle.?);
        const bytes: [*]u8 = @ptrCast(address orelse return error.UnexpectedNull);
        self.mapped = true;
        return bytes[0..len];
    }

    pub fn unmap(self: *NativeBuffer) Error!void {
        if (!self.mapped) return;
        try ffi.check(raw.OH_NativeBuffer_Unmap(self.handle orelse return error.InvalidHandle));
        self.mapped = false;
    }

    pub fn deinit(self: *NativeBuffer) Error!void {
        const handle = self.handle orelse return;
        try self.unmap();
        try ffi.check(raw.OH_NativeBuffer_Unreference(handle));
        self.handle = null;
    }
};
