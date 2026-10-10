const std = @import("std");
const ffi = @import("ohos_zig_binding_ffi");
const api = @import("ohos_zig_binding_api");
const udmf = @import("udmf");
pub const raw = @import("pasteboard_sys");
pub const Error = ffi.Error;

pub const Pasteboard = struct {
    comptime {
        api.require("pasteboard.Pasteboard", 13);
    }
    handle: ?*raw.OH_Pasteboard,
    pub fn create() Error!Pasteboard {
        return .{ .handle = raw.OH_Pasteboard_Create() orelse return error.UnexpectedNull };
    }
    pub fn deinit(self: *Pasteboard) void {
        if (self.handle) |handle| raw.OH_Pasteboard_Destroy(handle);
        self.handle = null;
    }
    pub fn hasData(self: Pasteboard) Error!bool {
        return raw.OH_Pasteboard_HasData(self.handle orelse return error.InvalidHandle);
    }
    pub fn hasType(self: Pasteboard, type_id: [:0]const u8) Error!bool {
        return raw.OH_Pasteboard_HasType(self.handle orelse return error.InvalidHandle, type_id.ptr);
    }
    pub fn isRemoteData(self: Pasteboard) Error!bool {
        return raw.OH_Pasteboard_IsRemoteData(self.handle orelse return error.InvalidHandle);
    }
    pub fn getData(self: Pasteboard) Error!udmf.Data {
        var status: c_int = 0;
        const data = raw.OH_Pasteboard_GetData(self.handle orelse return error.InvalidHandle, &status);
        if (status != 0) {
            if (data != null) udmf.raw.OH_UdmfData_Destroy(@ptrCast(data));
            return error.NativeCallFailed;
        }
        return udmf.Data.fromOwned(@ptrCast(data orelse return error.UnexpectedNull));
    }
    pub fn setData(self: Pasteboard, data: udmf.Data) Error!void {
        try ffi.check(raw.OH_Pasteboard_SetData(self.handle orelse return error.InvalidHandle, @ptrCast(data.handle orelse return error.InvalidHandle)));
    }
    pub fn clear(self: Pasteboard) Error!void {
        try ffi.check(raw.OH_Pasteboard_ClearData(self.handle orelse return error.InvalidHandle));
    }
    pub fn getDataSource(self: Pasteboard, buffer: []u8) Error![]const u8 {
        if (buffer.len == 0) return error.BufferTooSmall;
        @memset(buffer, 0);
        try ffi.check(raw.OH_Pasteboard_GetDataSource(self.handle orelse return error.InvalidHandle, buffer.ptr, try ffi.count(c_uint, buffer.len)));
        return buffer[0 .. std.mem.indexOfScalar(u8, buffer, 0) orelse return error.BufferTooSmall];
    }
};
