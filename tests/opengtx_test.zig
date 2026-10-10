const std = @import("std");
const gtx = @import("opengtx");
const native = @import("opengtx_sys");

test "active context is stopped before destruction and repeated teardown is harmless" {
    native.reset();
    var context = try gtx.Context.create(null);
    try context.activate();
    try context.activate();
    try context.deinit();
    try context.deinit();
    try std.testing.expectEqualStrings("CASD", native.calls[0..native.count]);
    try std.testing.expect(context.handle == null);
    try std.testing.expectError(error.InvalidHandle, context.activate());
}

test "failed stop retains the active context and does not destroy it" {
    native.reset();
    var context = try gtx.Context.create(null);
    try context.activate();
    native.fail_deactivate = true;
    try std.testing.expectError(error.NativeCallFailed, context.deinit());
    try std.testing.expect(context.active and context.handle != null);
    try std.testing.expectEqualStrings("CAS", native.calls[0..native.count]);
    native.fail_deactivate = false;
    try context.deinit();
    try std.testing.expectEqualStrings("CASSD", native.calls[0..native.count]);
}

test "failed destroy is retryable without a second stop" {
    native.reset();
    var context = try gtx.Context.create(null);
    try context.activate();
    native.fail_destroy = true;
    try std.testing.expectError(error.NativeCallFailed, context.deinit());
    try std.testing.expect(!context.active and context.handle != null);
    native.fail_destroy = false;
    try context.deinit();
    try std.testing.expectEqualStrings("CASDD", native.calls[0..native.count]);
}
