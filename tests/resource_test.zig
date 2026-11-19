const std = @import("std");
const ffi = @import("ffi");
const Version = struct {
    pub fn require(comptime _: []const u8, comptime _: u32) void {}
};
const Handle = struct { value: u32 = 42 };
var handle: Handle = .{};
var create_status: i32 = 0;
var release_status: i32 = 0;
var releases: usize = 0;
var return_null = false;
fn reset() void {
    create_status = 0;
    release_status = 0;
    releases = 0;
    return_null = false;
}
fn createPointer(value: u32) callconv(.c) ?*Handle {
    handle.value = value;
    return if (return_null) null else &handle;
}
fn createOutput(value: u32, output: *?*Handle) callconv(.c) i32 {
    handle.value = value;
    if (create_status == 0 and !return_null) output.* = &handle;
    return create_status;
}
fn release(value: ?*Handle) callconv(.c) i32 {
    std.debug.assert(value == &handle);
    releases += 1;
    return release_status;
}
fn releaseVoid(value: ?*Handle) callconv(.c) void {
    std.debug.assert(value == &handle);
    releases += 1;
}
const PointerOwner = ffi.Resource(createPointer, releaseVoid, Version, "pointer", 12);
const OutputOwner = ffi.Resource(createOutput, release, Version, "output", 13);

test "pointer owners check null and release only once" {
    reset();
    return_null = true;
    try std.testing.expectError(error.UnexpectedNull, PointerOwner.create(.{7}));
    try std.testing.expectEqual(@as(usize, 0), releases);
    return_null = false;
    var owner = try PointerOwner.create(.{7});
    try std.testing.expectEqual(@as(u32, 7), (try owner.ptr()).value);
    try owner.deinit();
    try owner.deinit();
    try std.testing.expectEqual(@as(usize, 1), releases);
    try std.testing.expectError(error.InvalidHandle, owner.ptr());
}

test "out-parameter constructors propagate errors and reject successful null results" {
    reset();
    create_status = -1;
    try std.testing.expectError(error.NativeCallFailed, OutputOwner.create(.{9}));
    create_status = 0;
    return_null = true;
    try std.testing.expectError(error.UnexpectedNull, OutputOwner.create(.{9}));
    try std.testing.expectEqual(@as(usize, 0), releases);
}

test "failed destruction retains ownership for a retry" {
    reset();
    var owner = try OutputOwner.create(.{99});
    release_status = -1;
    try std.testing.expectError(error.NativeCallFailed, owner.deinit());
    try std.testing.expectEqual(@as(u32, 99), (try owner.ptr()).value);
    release_status = 0;
    try owner.deinit();
    try owner.deinit();
    try std.testing.expectEqual(@as(usize, 2), releases);
    try std.testing.expectError(error.InvalidHandle, owner.ptr());
}
