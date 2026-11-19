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

/// Owns a native handle created by a pointer-returning constructor or a
/// status-returning constructor with its handle out-parameter last. Instances
/// must not be copied. Stop callbacks and detach dependent objects before deinit.
/// Constructor failure follows the SDK contract: no handle is transferred.
pub fn Resource(comptime create_fn: anytype, comptime release_fn: anytype, comptime version: type, comptime name: []const u8, comptime introduced: u32) type {
    const create_info = @typeInfo(@TypeOf(create_fn)).@"fn";
    const release_info = @typeInfo(@TypeOf(release_fn)).@"fn";
    const NativeHandle = release_info.param_types[0].?;
    const Handle = switch (@typeInfo(NativeHandle)) {
        .optional => |optional| optional.child,
        .pointer => NativeHandle,
        else => @compileError("resource destructor must accept a native pointer"),
    };
    const returns_pointer = switch (@typeInfo(create_info.return_type.?)) {
        .pointer, .optional => true,
        else => false,
    };
    const arg_count = create_info.param_types.len - @as(usize, if (returns_pointer) 0 else 1);
    const Args = blk: {
        var types: [arg_count]type = undefined;
        for (0..arg_count) |i| types[i] = create_info.param_types[i].?;
        break :blk @Tuple(&types);
    };
    return struct {
        const Self = @This();
        handle: ?Handle,
        pub fn create(args: Args) Error!Self {
            comptime version.require(name, introduced);
            if (comptime returns_pointer) {
                const value = @call(.auto, create_fn, args);
                if (value == null) return error.UnexpectedNull;
                return .{ .handle = value };
            } else {
                var value: NativeHandle = null;
                var native_args: std.meta.ArgsTuple(@TypeOf(create_fn)) = undefined;
                inline for (0..arg_count) |i| native_args[i] = args[i];
                native_args[arg_count] = &value;
                try check(@call(.auto, create_fn, native_args));
                if (value == null) return error.UnexpectedNull;
                return .{ .handle = value };
            }
        }
        pub fn ptr(self: Self) Error!Handle {
            return self.handle orelse error.InvalidHandle;
        }
        /// On a native release error the handle remains owned and can be retried.
        pub fn deinit(self: *Self) Error!void {
            comptime version.require(name, introduced);
            const handle = self.handle orelse return;
            if (comptime release_info.return_type.? == void) {
                release_fn(handle);
            } else {
                try check(release_fn(handle));
            }
            self.handle = null;
        }
    };
}
