pub const native = @import("native.zig");
pub const owned = @import("owned.zig");
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
    pub fn addRecord(self: Data, value: Record) Error!void {
        try ffi.check(raw.OH_UdmfData_AddRecord(self.handle orelse return error.InvalidHandle, value.handle orelse return error.InvalidHandle));
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
    /// Borrows records owned by this data. Never destroy these handles; they are
    /// invalidated by subsequent record queries, mutation, or Data.deinit.
    pub fn records(self: Data) Error!Records {
        var count: c_uint = 0;
        const values = raw.OH_UdmfData_GetRecords(self.handle orelse return error.InvalidHandle, &count);
        if (count != 0 and values == null) return error.UnexpectedNull;
        return .{ .values = if (count == 0) &.{} else values[0..count] };
    }
    pub fn record(self: Data, index: usize) Error!RecordView {
        comptime api.require("udmf.Data.record", 13);
        if (index >= try self.recordCount()) return error.InvalidArgument;
        return .{ .handle = raw.OH_UdmfData_GetRecord(self.handle, try ffi.count(c_uint, index)) orelse return error.UnexpectedNull };
    }
    pub fn isLocal(self: Data) Error!bool {
        comptime api.require("udmf.Data.isLocal", 13);
        return raw.OH_UdmfData_IsLocal(self.handle orelse return error.InvalidHandle);
    }
    pub fn primaryPlainText(self: Data) Error!PlainText {
        comptime api.require("udmf.Data.primaryPlainText", 13);
        const handle = self.handle orelse return error.InvalidHandle;
        var value = try PlainText.create();
        errdefer value.deinit();
        try ffi.check(raw.OH_UdmfData_GetPrimaryPlainText(handle, value.handle));
        return value;
    }
    pub fn primaryHtml(self: Data) Error!Html {
        comptime api.require("udmf.Data.primaryHtml", 13);
        const handle = self.handle orelse return error.InvalidHandle;
        var value = try Html.create();
        errdefer value.deinit();
        try ffi.check(raw.OH_UdmfData_GetPrimaryHtml(handle, value.handle));
        return value;
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
    pub fn addPixelMap(self: Record, pixels: PixelMap) Error!void {
        comptime api.require("udmf.Record.addPixelMap", 13);
        try ffi.check(raw.OH_UdmfRecord_AddPixelMap(self.handle orelse return error.InvalidHandle, pixels.handle orelse return error.InvalidHandle));
    }
    pub fn view(self: Record) Error!RecordView {
        return .{ .handle = self.handle orelse return error.InvalidHandle };
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

/// A view into Data's record array. Neither this array nor its elements are owned.
pub const Records = struct {
    values: []const ?*raw.OH_UdmfRecord,
    pub fn count(self: Records) usize {
        return self.values.len;
    }
    pub fn get(self: Records, index: usize) Error!RecordView {
        if (index >= self.values.len) return error.InvalidArgument;
        return .{ .handle = self.values[index] orelse return error.UnexpectedNull };
    }
};

/// Borrowed record. The parent Data/Record must remain alive and unmodified.
/// Typed getters create independently owned UDS containers.
pub const RecordView = struct {
    handle: *raw.OH_UdmfRecord,
    pub fn plainText(self: RecordView) Error!PlainText {
        var result = try PlainText.create();
        errdefer result.deinit();
        try ffi.check(raw.OH_UdmfRecord_GetPlainText(self.handle, result.handle));
        return result;
    }
    pub fn html(self: RecordView) Error!Html {
        var result = try Html.create();
        errdefer result.deinit();
        try ffi.check(raw.OH_UdmfRecord_GetHtml(self.handle, result.handle));
        return result;
    }
    pub fn hyperlink(self: RecordView) Error!Hyperlink {
        var result = try Hyperlink.create();
        errdefer result.deinit();
        try ffi.check(raw.OH_UdmfRecord_GetHyperlink(self.handle, result.handle));
        return result;
    }
    pub fn pixelMap(self: RecordView) Error!PixelMap {
        comptime api.require("udmf.RecordView.pixelMap", 13);
        var result = try PixelMap.create();
        errdefer result.deinit();
        try ffi.check(raw.OH_UdmfRecord_GetPixelMap(self.handle, result.handle));
        return result;
    }
    pub fn generalEntry(self: RecordView, type_id: [:0]const u8) Error![]const u8 {
        return (Record{ .handle = self.handle }).getGeneralEntry(type_id);
    }
};

pub const PixelMap = struct {
    comptime {
        api.require("udmf.PixelMap", 13);
    }
    handle: ?*raw.OH_UdsPixelMap,
    pub fn create() Error!PixelMap {
        return .{ .handle = raw.OH_UdsPixelMap_Create() orelse return error.UnexpectedNull };
    }
    pub fn deinit(self: *PixelMap) void {
        if (self.handle) |handle| raw.OH_UdsPixelMap_Destroy(handle);
        self.handle = null;
    }
    pub fn set(self: PixelMap, pixels: @import("image_native").Pixelmap) Error!void {
        try ffi.check(raw.OH_UdsPixelMap_SetPixelMap(self.handle orelse return error.InvalidHandle, @ptrCast(pixels.handle orelse return error.InvalidHandle)));
    }
    /// Fills an already allocated native pixelmap. Ownership stays with output.
    pub fn copyTo(self: PixelMap, output: @import("image_native").Pixelmap) Error!void {
        raw.OH_UdsPixelMap_GetPixelMap(self.handle orelse return error.InvalidHandle, @ptrCast(output.handle orelse return error.InvalidHandle));
    }
    pub fn typeId(self: PixelMap) Error![]const u8 {
        const value = raw.OH_UdsPixelMap_GetType(self.handle orelse return error.InvalidHandle);
        if (value == null) return error.UnexpectedNull;
        return std.mem.span(value);
    }
};

pub const TypeDescriptor = struct {
    handle: ?*raw.OH_Utd,
    pub fn create(type_id: [:0]const u8) Error!TypeDescriptor {
        return .{ .handle = raw.OH_Utd_Create(type_id.ptr) orelse return error.UnexpectedNull };
    }
    pub fn deinit(self: *TypeDescriptor) void {
        if (self.handle) |handle| raw.OH_Utd_Destroy(handle);
        self.handle = null;
    }
    /// The returned string borrows this descriptor.
    pub fn typeId(self: TypeDescriptor) Error![]const u8 {
        const value = raw.OH_Utd_GetTypeId(self.handle orelse return error.InvalidHandle);
        if (value == null) return error.UnexpectedNull;
        return std.mem.span(value);
    }
    pub fn equals(self: TypeDescriptor, other: TypeDescriptor) Error!bool {
        return raw.OH_Utd_Equals(self.handle orelse return error.InvalidHandle, other.handle orelse return error.InvalidHandle);
    }
    pub fn belongsTo(source: [:0]const u8, destination: [:0]const u8) bool {
        return raw.OH_Utd_BelongsTo(source.ptr, destination.ptr);
    }
    pub fn isLower(source: [:0]const u8, destination: [:0]const u8) bool {
        return raw.OH_Utd_IsLower(source.ptr, destination.ptr);
    }
    pub fn isHigher(source: [:0]const u8, destination: [:0]const u8) bool {
        return raw.OH_Utd_IsHigher(source.ptr, destination.ptr);
    }
};
