const std = @import("std");
const ffi = @import("ohos_zig_binding_ffi");
pub const raw = @import("asset_sys");
pub const Error = ffi.Error;
pub const Attribute = raw.Asset_Attr;

/// Blob attributes borrow bytes for the duration of the native operation.
pub fn bytesAttribute(tag: u32, bytes: []const u8) Error!Attribute {
    return .{ .tag = tag, .value = .{ .blob = .{ .size = try ffi.count(u32, bytes.len), .data = @constCast(bytes.ptr) } } };
}
pub fn boolAttribute(tag: u32, value: bool) Attribute {
    return .{ .tag = tag, .value = .{ .boolean = value } };
}
pub fn uintAttribute(tag: u32, value: u32) Attribute {
    return .{ .tag = tag, .value = .{ .u32 = value } };
}

pub fn add(attributes: []const Attribute) Error!void {
    try ffi.check(raw.OH_Asset_Add(attributes.ptr, try ffi.count(u32, attributes.len)));
}
pub fn remove(attributes: []const Attribute) Error!void {
    try ffi.check(raw.OH_Asset_Remove(attributes.ptr, try ffi.count(u32, attributes.len)));
}
pub fn update(query_attributes: []const Attribute, attributes: []const Attribute) Error!void {
    try ffi.check(raw.OH_Asset_Update(query_attributes.ptr, try ffi.count(u32, query_attributes.len), attributes.ptr, try ffi.count(u32, attributes.len)));
}

pub const ResultSet = struct {
    value: raw.Asset_ResultSet,
    pub fn results(self: ResultSet) []const raw.Asset_Result {
        return if (self.value.count == 0) &.{} else self.value.results[0..self.value.count];
    }
    pub fn deinit(self: *ResultSet) void {
        raw.OH_Asset_FreeResultSet(&self.value);
        self.value = std.mem.zeroes(raw.Asset_ResultSet);
    }
};

pub fn query(attributes: []const Attribute) Error!ResultSet {
    var result: ResultSet = .{ .value = std.mem.zeroes(raw.Asset_ResultSet) };
    errdefer result.deinit();
    try ffi.check(raw.OH_Asset_Query(attributes.ptr, try ffi.count(u32, attributes.len), &result.value));
    if (result.value.count != 0 and result.value.results == null) return error.UnexpectedNull;
    return result;
}

pub const Challenge = struct {
    value: raw.Asset_Blob,
    pub fn bytes(self: Challenge) []const u8 {
        return if (self.value.size == 0) &.{} else self.value.data[0..self.value.size];
    }
    pub fn deinit(self: *Challenge) void {
        raw.OH_Asset_FreeBlob(&self.value);
        self.value = std.mem.zeroes(raw.Asset_Blob);
    }
};

pub fn preQuery(attributes: []const Attribute) Error!Challenge {
    var value: Challenge = .{ .value = std.mem.zeroes(raw.Asset_Blob) };
    errdefer value.deinit();
    try ffi.check(raw.OH_Asset_PreQuery(attributes.ptr, try ffi.count(u32, attributes.len), &value.value));
    if (value.value.size != 0 and value.value.data == null) return error.UnexpectedNull;
    return value;
}
pub fn postQuery(attributes: []const Attribute) Error!void {
    try ffi.check(raw.OH_Asset_PostQuery(attributes.ptr, try ffi.count(u32, attributes.len)));
}
