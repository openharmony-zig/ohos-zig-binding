//! Compile/link fixtures only. Never execute: many native APIs need app/UI state.
const std = @import("std");
const level = @import("check_options").compile_check_api;
const allocator = std.heap.page_allocator;
const bundle = @import("bundle");
const fileuri = @import("fileuri");
const fileshare = @import("fileshare");
const qos = @import("qos");
const vibrator = @import("vibrator");
const display = @import("display");
const buffer = @import("native_buffer");
const soloist = @import("native_display_soloist");

export fn checkSystem() void {
    _ = @import("init").canIUse("SystemCapability.BundleManager.BundleFramework.Core");
    var info = bundle.getApplicationInfo() catch return;
    defer info.deinit();
    _ = info.bundleName();
    _ = info.fingerprint();
    const id = bundle.getAppId(allocator) catch return;
    defer allocator.free(id);
    const identifier = bundle.getAppIdentifier(allocator) catch return;
    defer allocator.free(identifier);
    if (comptime level >= 13) {
        var name = bundle.getMainElementName() catch return;
        name.deinit();
    }
    if (comptime level >= 14) {
        const device = bundle.getCompatibleDeviceType(allocator) catch return;
        allocator.free(device);
    }
    qos.setThreadQos(.utility) catch {};
    _ = qos.getThreadQos() catch return;
    qos.resetThreadQos() catch {};
    vibrator.start(1, .{ .vibratorId = 0, .usage = 0 }) catch {};
    vibrator.startCustom(.{ .fd = 0, .offset = 0, .length = 1 }, .{ .vibratorId = 0, .usage = 0 }) catch {};
    vibrator.cancel() catch {};
    if (comptime level >= 20) {
        var session = qos.GewuSession.create("{}") catch return;
        defer session.deinit() catch {};
        const request = session.submit("{}", onGewu, null) catch return;
        session.abort(request) catch {};
    }
}

fn onGewu(_: ?*anyopaque, _: [*c]const u8) callconv(.c) void {}

export fn checkFileUris() void {
    const uri = fileuri.getUriFromPath(allocator, "/data/test") catch return;
    defer allocator.free(uri);
    const path = fileuri.getPathFromUri(allocator, "file://test/data/test") catch return;
    defer allocator.free(path);
    const directory = fileuri.getFullDirectoryUri(allocator, "file://test/data/test") catch return;
    defer allocator.free(directory);
    _ = fileuri.isValidUri("file://test/data/test");
    if (comptime level >= 13) {
        const name = fileuri.getFileName(allocator, "file://test/data/test") catch return;
        allocator.free(name);
    }
    const policies = [_]fileshare.Policy{.{ .uri = "file://test/data/test", .operation_mode = 1 }};
    inline for (.{ .persist, .revoke, .activate, .deactivate }) |operation| {
        var result = fileshare.apply(allocator, operation, &policies) catch return;
        _ = result.errors();
        result.deinit();
    }
    const results = fileshare.checkPersistentPermission(allocator, &policies) catch return;
    allocator.free(results);
}

export fn checkDisplay() void {
    _ = display.getDefaultDisplayId() catch return;
    _ = display.getDefaultDisplayWidth() catch return;
    _ = display.getDefaultDisplayHeight() catch return;
    _ = display.getDefaultDisplayRotation() catch return;
    _ = display.getDefaultDisplayOrientation() catch return;
    _ = display.getDefaultDisplayVirtualPixelRatio() catch return;
    _ = display.getDefaultDisplayRefreshRate() catch return;
    _ = display.getDefaultDisplayDensityDpi() catch return;
    _ = display.getDefaultDisplayDensityPixels() catch return;
    _ = display.getDefaultDisplayScaledDensity() catch return;
    _ = display.getDefaultDisplayDensityXdpi() catch return;
    _ = display.getDefaultDisplayDensityYdpi() catch return;
    _ = display.isFoldable();
    _ = display.getFoldDisplayMode() catch return;
    var cutout = display.CutoutInfo.create() catch return;
    _ = cutout.value() catch return;
    cutout.deinit() catch {};
    var listener = display.DisplayListener.register(onDisplay) catch return;
    listener.deinit() catch {};
    var fold = display.FoldModeListener.register(onFold) catch return;
    fold.deinit() catch {};
    var frames = soloist.DisplaySoloist.create(false) catch return;
    defer frames.deinit() catch {};
    frames.setExpectedFrameRateRange(.{ .min = 30, .max = 60, .expected = 60 }) catch {};
    frames.start(onFrame, null) catch {};
    frames.stop() catch {};
}
fn onDisplay(_: u64) callconv(.c) void {}
fn onFold(_: display.raw.NativeDisplayManager_FoldDisplayMode) callconv(.c) void {}
fn onFrame(_: i64, _: i64, _: ?*anyopaque) callconv(.c) void {}

export fn checkBuffer(window: *buffer.raw.OHNativeWindowBuffer) void {
    var value = buffer.NativeBuffer.create(.{ .width = 16, .height = 16, .format = 12, .usage = 0, .stride = 0 }) catch return;
    defer value.deinit() catch {};
    _ = value.getConfig() catch return;
    _ = value.map() catch return;
    value.unmap() catch {};
    var retained = value.clone() catch return;
    retained.deinit() catch {};
    var borrowed = buffer.NativeBuffer.fromWindowBuffer(window) catch return;
    borrowed.deinit() catch {};
}
