const std = @import("std");
const ffi = @import("ohos_zig_binding_ffi");
const api = @import("ohos_zig_binding_api");
pub const raw = @import("udmf_sys");
pub const Error = ffi.Error;

pub const Data = struct {
    handle: ?*raw.OH_UdmfData,
    pub fn create() Error!Data {
        return .{ .handle = raw.OH_UdmfData_Create() orelse return error.UnexpectedNull };
    }
    /// Takes ownership of a caller-owned native data handle.
    pub fn fromOwned(handle: *raw.OH_UdmfData) Data {
        return .{ .handle = handle };
    }
    pub fn deinit(self: *Data) void {
        if (self.handle) |handle| raw.OH_UdmfData_Destroy(handle);
        self.handle = null;
    }
    pub fn addRecord(self: Data, record: Record) Error!void {
        try ffi.check(raw.OH_UdmfData_AddRecord(self.handle orelse return error.InvalidHandle, record.handle orelse return error.InvalidHandle));
    }
    pub fn hasType(self: Data, type_id: [:0]const u8) Error!bool {
        return raw.OH_UdmfData_HasType(self.handle orelse return error.InvalidHandle, type_id.ptr);
    }
    pub fn recordCount(self: Data) Error!usize {
        comptime api.require("udmf.Data.recordCount", 13);
        const count = raw.OH_UdmfData_GetRecordCount(self.handle orelse return error.InvalidHandle);
        if (count < 0) return error.NativeCallFailed;
        return @intCast(count);
    }
    pub fn load(key: [:0]const u8, intention: raw.Udmf_Intention) Error!Data {
        var value = try create();
        errdefer value.deinit();
        try ffi.check(raw.OH_Udmf_GetUnifiedData(key.ptr, intention, value.handle));
        return value;
    }
    pub fn save(self: Data, intention: raw.Udmf_Intention, key_buffer: []u8) Error![]const u8 {
        if (key_buffer.len < 512) return error.BufferTooSmall;
        @memset(key_buffer, 0);
        try ffi.check(raw.OH_Udmf_SetUnifiedData(intention, self.handle orelse return error.InvalidHandle, key_buffer.ptr, try ffi.count(c_uint, key_buffer.len)));
        const len = std.mem.indexOfScalar(u8, key_buffer, 0) orelse return error.BufferTooSmall;
        return key_buffer[0..len];
    }
};

pub const Record = struct {
    handle: ?*raw.OH_UdmfRecord,
    pub fn create() Error!Record {
        return .{ .handle = raw.OH_UdmfRecord_Create() orelse return error.UnexpectedNull };
    }
    pub fn deinit(self: *Record) void {
        if (self.handle) |handle| raw.OH_UdmfRecord_Destroy(handle);
        self.handle = null;
    }
    pub fn addPlainText(self: Record, text: PlainText) Error!void {
        try ffi.check(raw.OH_UdmfRecord_AddPlainText(self.handle orelse return error.InvalidHandle, text.handle orelse return error.InvalidHandle));
    }
    pub fn addHtml(self: Record, html: Html) Error!void {
        try ffi.check(raw.OH_UdmfRecord_AddHtml(self.handle orelse return error.InvalidHandle, html.handle orelse return error.InvalidHandle));
    }
    pub fn addHyperlink(self: Record, link: Hyperlink) Error!void {
        try ffi.check(raw.OH_UdmfRecord_AddHyperlink(self.handle orelse return error.InvalidHandle, link.handle orelse return error.InvalidHandle));
    }
    pub fn addGeneralEntry(self: Record, type_id: [:0]const u8, bytes: []const u8) Error!void {
        try ffi.check(raw.OH_UdmfRecord_AddGeneralEntry(self.handle orelse return error.InvalidHandle, type_id.ptr, @constCast(bytes.ptr), try ffi.count(c_uint, bytes.len)));
    }
    /// Borrows entry storage from the record until mutation/deinit.
    pub fn getGeneralEntry(self: Record, type_id: [:0]const u8) Error![]const u8 {
        var bytes: [*c]u8 = null;
        var count: c_uint = 0;
        try ffi.check(raw.OH_UdmfRecord_GetGeneralEntry(self.handle orelse return error.InvalidHandle, type_id.ptr, &bytes, &count));
        if (count == 0) return &.{};
        if (bytes == null) return error.UnexpectedNull;
        return bytes[0..count];
    }
};

pub const PlainText = struct {
    handle: ?*raw.OH_UdsPlainText,
    pub fn create() Error!PlainText {
        return .{ .handle = raw.OH_UdsPlainText_Create() orelse return error.UnexpectedNull };
    }
    pub fn deinit(self: *PlainText) void {
        if (self.handle) |handle| raw.OH_UdsPlainText_Destroy(handle);
        self.handle = null;
    }
    pub fn setContent(self: PlainText, value: [:0]const u8) Error!void {
        try ffi.check(raw.OH_UdsPlainText_SetContent(self.handle orelse return error.InvalidHandle, value.ptr));
    }
    /// Borrows the native string until mutation/deinit.
    pub fn getContent(self: PlainText) Error![]const u8 {
        const value = raw.OH_UdsPlainText_GetContent(self.handle orelse return error.InvalidHandle);
        if (value == null) return error.UnexpectedNull;
        return std.mem.span(value);
    }
    pub fn setAbstract(self: PlainText, value: [:0]const u8) Error!void {
        try ffi.check(raw.OH_UdsPlainText_SetAbstract(self.handle orelse return error.InvalidHandle, value.ptr));
    }
    /// Borrows the native string until mutation/deinit.
    pub fn getAbstract(self: PlainText) Error![]const u8 {
        const value = raw.OH_UdsPlainText_GetAbstract(self.handle orelse return error.InvalidHandle);
        if (value == null) return error.UnexpectedNull;
        return std.mem.span(value);
    }
};

pub const Html = struct {
    handle: ?*raw.OH_UdsHtml,
    pub fn create() Error!Html {
        return .{ .handle = raw.OH_UdsHtml_Create() orelse return error.UnexpectedNull };
    }
    pub fn deinit(self: *Html) void {
        if (self.handle) |handle| raw.OH_UdsHtml_Destroy(handle);
        self.handle = null;
    }
    pub fn setContent(self: Html, value: [:0]const u8) Error!void {
        try ffi.check(raw.OH_UdsHtml_SetContent(self.handle orelse return error.InvalidHandle, value.ptr));
    }
    /// Borrows the native string until mutation/deinit.
    pub fn getContent(self: Html) Error![]const u8 {
        const value = raw.OH_UdsHtml_GetContent(self.handle orelse return error.InvalidHandle);
        if (value == null) return error.UnexpectedNull;
        return std.mem.span(value);
    }
    pub fn setPlainContent(self: Html, value: [:0]const u8) Error!void {
        try ffi.check(raw.OH_UdsHtml_SetPlainContent(self.handle orelse return error.InvalidHandle, value.ptr));
    }
    /// Borrows the native string until mutation/deinit.
    pub fn getPlainContent(self: Html) Error![]const u8 {
        const value = raw.OH_UdsHtml_GetPlainContent(self.handle orelse return error.InvalidHandle);
        if (value == null) return error.UnexpectedNull;
        return std.mem.span(value);
    }
};

pub const Hyperlink = struct {
    handle: ?*raw.OH_UdsHyperlink,
    pub fn create() Error!Hyperlink {
        return .{ .handle = raw.OH_UdsHyperlink_Create() orelse return error.UnexpectedNull };
    }
    pub fn deinit(self: *Hyperlink) void {
        if (self.handle) |handle| raw.OH_UdsHyperlink_Destroy(handle);
        self.handle = null;
    }
    pub fn setUrl(self: Hyperlink, value: [:0]const u8) Error!void {
        try ffi.check(raw.OH_UdsHyperlink_SetUrl(self.handle orelse return error.InvalidHandle, value.ptr));
    }
    /// Borrows the native string until mutation/deinit.
    pub fn getUrl(self: Hyperlink) Error![]const u8 {
        const value = raw.OH_UdsHyperlink_GetUrl(self.handle orelse return error.InvalidHandle);
        if (value == null) return error.UnexpectedNull;
        return std.mem.span(value);
    }
    pub fn setDescription(self: Hyperlink, value: [:0]const u8) Error!void {
        try ffi.check(raw.OH_UdsHyperlink_SetDescription(self.handle orelse return error.InvalidHandle, value.ptr));
    }
    /// Borrows the native string until mutation/deinit.
    pub fn getDescription(self: Hyperlink) Error![]const u8 {
        const value = raw.OH_UdsHyperlink_GetDescription(self.handle orelse return error.InvalidHandle);
        if (value == null) return error.UnexpectedNull;
        return std.mem.span(value);
    }
};
