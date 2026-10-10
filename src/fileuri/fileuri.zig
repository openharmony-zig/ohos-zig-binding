const std = @import("std");
const ffi = @import("ohos_zig_binding_ffi");
const api = @import("ohos_zig_binding_api");
pub const raw = @import("fileuri_sys");
pub const Error = ffi.Error;

fn convert(allocator: std.mem.Allocator, input: [:0]const u8, comptime function: anytype) Error![]u8 {
    var output: [*c]u8 = null;
    const status = function(input.ptr, try ffi.count(c_uint, input.len), &output);
    errdefer std.c.free(output);
    try ffi.check(status);
    // takeString owns output even when allocating the copy fails.
    const owned = output;
    output = null;
    return ffi.takeString(allocator, owned);
}

/// All returned strings are allocated with allocator; the caller frees them.
pub fn getUriFromPath(allocator: std.mem.Allocator, path: [:0]const u8) Error![]u8 {
    return convert(allocator, path, raw.OH_FileUri_GetUriFromPath);
}

pub fn getPathFromUri(allocator: std.mem.Allocator, uri: [:0]const u8) Error![]u8 {
    return convert(allocator, uri, raw.OH_FileUri_GetPathFromUri);
}

pub fn getFullDirectoryUri(allocator: std.mem.Allocator, uri: [:0]const u8) Error![]u8 {
    return convert(allocator, uri, raw.OH_FileUri_GetFullDirectoryUri);
}

pub fn getFileName(allocator: std.mem.Allocator, uri: [:0]const u8) Error![]u8 {
    comptime api.require("fileuri.getFileName", 13);
    return convert(allocator, uri, raw.OH_FileUri_GetFileName);
}

pub fn isValidUri(uri: [:0]const u8) bool {
    const len = ffi.count(c_uint, uri.len) catch return false;
    return raw.OH_FileUri_IsValidUri(uri.ptr, len);
}
