const std = @import("std");

pub const Error = error{
    NativeCallFailed,
    InvalidArgument,
    InvalidHandle,
    UnexpectedNull,
    BufferTooSmall,
    OutOfMemory,
};

pub fn check(code: anytype) Error!void {
    if (code != 0) return error.NativeCallFailed;
}

pub fn count(comptime T: type, len: anytype) Error!T {
    return std.math.cast(T, len) orelse error.InvalidArgument;
}

/// Copy an SDK malloc-allocated string into the caller's allocator and release
/// the original allocation on both success and allocation failure.
pub fn takeString(allocator: std.mem.Allocator, value: [*c]u8) Error![]u8 {
    if (value == null) return error.UnexpectedNull;
    defer std.c.free(value);
    return allocator.dupe(u8, std.mem.span(value));
}

test "lengths never truncate at the C boundary" {
    try std.testing.expectEqual(@as(u8, 255), try count(u8, 255));
    try std.testing.expectError(error.InvalidArgument, count(u8, 256));
}

test "native errors and null strings are reported" {
    try check(@as(c_int, 0));
    try std.testing.expectError(error.NativeCallFailed, check(@as(c_int, -1)));
    try std.testing.expectError(error.UnexpectedNull, takeString(std.testing.allocator, null));
}
