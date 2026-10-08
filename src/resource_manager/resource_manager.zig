const std = @import("std");
const ffi = @import("ohos_zig_binding_ffi");
pub const raw = @import("resource_manager_sys");
pub const Error = ffi.Error;

pub const ResourceManager = struct {
    handle: ?*raw.NativeResourceManager,
    pub fn create(env: raw.napi_env, resource_manager: raw.napi_value) Error!ResourceManager {
        return .{ .handle = raw.OH_ResourceManager_InitNativeResourceManager(env, resource_manager) orelse return error.UnexpectedNull };
    }
    /// Takes ownership. Open files/directories must be closed before deinit.
    pub fn fromOwned(handle: *raw.NativeResourceManager) ResourceManager {
        return .{ .handle = handle };
    }
    pub fn deinit(self: *ResourceManager) void {
        if (self.handle) |handle| raw.OH_ResourceManager_ReleaseNativeResourceManager(handle);
        self.handle = null;
    }
    pub fn isRawDir(self: ResourceManager, path: [:0]const u8) Error!bool {
        return raw.OH_ResourceManager_IsRawDir(self.handle orelse return error.InvalidHandle, path.ptr);
    }
    pub fn openDir(self: ResourceManager, path: [:0]const u8) Error!RawDir {
        return .{ .handle = raw.OH_ResourceManager_OpenRawDir(self.handle orelse return error.InvalidHandle, path.ptr) orelse return error.UnexpectedNull };
    }
    pub fn openFile(self: ResourceManager, path: [:0]const u8) Error!RawFile {
        return .{ .handle = raw.OH_ResourceManager_OpenRawFile64(self.handle orelse return error.InvalidHandle, path.ptr) orelse return error.UnexpectedNull };
    }
    pub fn media(self: ResourceManager, allocator: std.mem.Allocator, id: u32, density: u32) Error![]u8 {
        var value: [*c]u8 = null;
        var len: u64 = 0;
        const status = raw.OH_ResourceManager_GetMediaData(self.handle orelse return error.InvalidHandle, id, &value, &len, density);
        defer std.c.free(value);
        try ffi.check(status);
        if (len == 0) return allocator.alloc(u8, 0);
        if (value == null) return error.UnexpectedNull;
        return allocator.dupe(u8, value[0..try ffi.count(usize, len)]);
    }
    pub fn mediaByName(self: ResourceManager, allocator: std.mem.Allocator, name: [:0]const u8, density: u32) Error![]u8 {
        var value: [*c]u8 = null;
        var len: u64 = 0;
        const status = raw.OH_ResourceManager_GetMediaDataByName(self.handle orelse return error.InvalidHandle, name.ptr, &value, &len, density);
        defer std.c.free(value);
        try ffi.check(status);
        if (len == 0) return allocator.alloc(u8, 0);
        if (value == null) return error.UnexpectedNull;
        return allocator.dupe(u8, value[0..try ffi.count(usize, len)]);
    }
    pub fn mediaBase64(self: ResourceManager, allocator: std.mem.Allocator, id: u32, density: u32) Error![]u8 {
        var value: [*c]u8 = null;
        var len: u64 = 0;
        const status = raw.OH_ResourceManager_GetMediaBase64Data(self.handle orelse return error.InvalidHandle, id, &value, &len, density);
        defer std.c.free(value);
        try ffi.check(status);
        if (len == 0) return allocator.alloc(u8, 0);
        if (value == null) return error.UnexpectedNull;
        return allocator.dupe(u8, value[0..try ffi.count(usize, len)]);
    }
};

/// Owns a directory cursor, borrowing the parent ResourceManager lifetime.
pub const RawDir = struct {
    handle: ?*raw.RawDir,
    pub fn count(self: RawDir) Error!usize {
        const len = raw.OH_ResourceManager_GetRawFileCount(self.handle orelse return error.InvalidHandle);
        if (len < 0) return error.NativeCallFailed;
        return @intCast(len);
    }
    pub fn name(self: RawDir, index: usize) Error![]const u8 {
        if (index >= try self.count()) return error.InvalidArgument;
        const value = raw.OH_ResourceManager_GetRawFileName(self.handle, @intCast(index));
        if (value == null) return error.UnexpectedNull;
        return std.mem.span(value);
    }
    pub fn deinit(self: *RawDir) void {
        if (self.handle) |handle| raw.OH_ResourceManager_CloseRawDir(handle);
        self.handle = null;
    }
};

pub const SeekOrigin = enum(c_int) { start = 0, current = 1, end = 2 };

/// Uses the 64-bit API on every architecture. Parent manager must outlive it.
pub const RawFile = struct {
    handle: ?*raw.RawFile64,
    pub fn read(self: RawFile, output: []u8) Error![]u8 {
        const count = raw.OH_ResourceManager_ReadRawFile64(self.handle orelse return error.InvalidHandle, output.ptr, try ffi.count(i64, output.len));
        if (count < 0) return error.NativeCallFailed;
        if (count > output.len) return error.BufferTooSmall;
        return output[0..@intCast(count)];
    }
    pub fn seek(self: RawFile, position: i64, origin: SeekOrigin) Error!void {
        try ffi.check(raw.OH_ResourceManager_SeekRawFile64(self.handle orelse return error.InvalidHandle, position, @backingInt(origin)));
    }
    pub fn size(self: RawFile) Error!u64 {
        const result = raw.OH_ResourceManager_GetRawFileSize64(self.handle orelse return error.InvalidHandle);
        if (result < 0) return error.NativeCallFailed;
        return @intCast(result);
    }
    pub fn offset(self: RawFile) Error!u64 {
        const result = raw.OH_ResourceManager_GetRawFileOffset64(self.handle orelse return error.InvalidHandle);
        if (result < 0) return error.NativeCallFailed;
        return @intCast(result);
    }
    pub fn remaining(self: RawFile) Error!u64 {
        const result = raw.OH_ResourceManager_GetRawFileRemainingLength64(self.handle orelse return error.InvalidHandle);
        if (result < 0) return error.NativeCallFailed;
        return @intCast(result);
    }
    pub fn deinit(self: *RawFile) void {
        if (self.handle) |handle| raw.OH_ResourceManager_CloseRawFile64(handle);
        self.handle = null;
    }
};
