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

const asset = @import("asset");
const huks = @import("huks");
const udmf = @import("udmf");
const sensor = @import("sensor");
const resources = @import("resource_manager");

export fn checkAssets() void {
    const attributes = [_]asset.Attribute{
        asset.bytesAttribute(asset.raw.ASSET_TAG_ALIAS, "alias") catch return,
        asset.boolAttribute(asset.raw.ASSET_TAG_REQUIRE_PASSWORD_SET, false),
        asset.uintAttribute(asset.raw.ASSET_TAG_ACCESSIBILITY, 0),
    };
    asset.add(&attributes) catch {};
    asset.update(&attributes, &attributes) catch {};
    var results = asset.query(&attributes) catch return;
    _ = results.results();
    results.deinit();
    var challenge = asset.preQuery(&attributes) catch return;
    _ = challenge.bytes();
    challenge.deinit();
    asset.postQuery(&attributes) catch {};
    asset.remove(&attributes) catch {};
}

export fn checkHuks() void {
    var params = huks.ParamSet.create(&.{}) catch return;
    defer params.deinit();
    const key = huks.Key.init("compile-check") catch return;
    key.generate(params) catch {};
    key.importKey(params, "key") catch {};
    _ = key.exists(params) catch return;
    var output: [4096]u8 = undefined;
    _ = key.exportPublicKey(params, &output) catch return;
    var session = huks.Session.create(key, params) catch return;
    defer session.deinit() catch {};
    _ = session.token();
    _ = session.update(params, "input", &output) catch return;
    _ = session.finish(params, "input", &output) catch return;
    session.abort(params) catch {};
    key.delete(params) catch {};
}

export fn checkUdmf() void {
    var data = udmf.Data.create() catch return;
    defer data.deinit();
    var record = udmf.Record.create() catch return;
    defer record.deinit();
    var text = udmf.PlainText.create() catch return;
    defer text.deinit();
    text.setContent("text") catch {};
    text.setAbstract("summary") catch {};
    _ = text.getContent() catch return;
    _ = text.getAbstract() catch return;
    record.addPlainText(text) catch {};
    var html = udmf.Html.create() catch return;
    defer html.deinit();
    html.setContent("<p>text</p>") catch {};
    html.setPlainContent("text") catch {};
    _ = html.getContent() catch return;
    _ = html.getPlainContent() catch return;
    record.addHtml(html) catch {};
    var link = udmf.Hyperlink.create() catch return;
    defer link.deinit();
    link.setUrl("https://example.com") catch {};
    link.setDescription("example") catch {};
    _ = link.getUrl() catch return;
    _ = link.getDescription() catch return;
    record.addHyperlink(link) catch {};
    record.addGeneralEntry("general.text", "value") catch {};
    _ = record.getGeneralEntry("general.text") catch return;
    data.addRecord(record) catch {};
    _ = data.hasType("general.plain-text") catch return;
    var key_buffer: [512]u8 = undefined;
    _ = data.save(0, &key_buffer) catch return;
    var loaded = udmf.Data.load("key", 0) catch return;
    loaded.deinit();
    if (comptime level >= 13) {
        _ = data.recordCount() catch return;
        var board = @import("pasteboard").Pasteboard.create() catch return;
        defer board.deinit();
        _ = board.hasData() catch return;
        _ = board.hasType("general.plain-text") catch return;
        _ = board.isRemoteData() catch return;
        board.setData(data) catch {};
        var read = board.getData() catch return;
        read.deinit();
        _ = board.getDataSource(&key_buffer) catch return;
        board.clear() catch {};
    }
}

export fn checkSensor(event: *sensor.raw.Sensor_Event) void {
    _ = sensor.Event.fromRaw(event) catch return;
    var infos = sensor.InfoList.query() catch return;
    defer infos.deinit() catch {};
    const info = infos.get(0) catch return;
    var name: [128]u8 = undefined;
    _ = info.name(&name) catch return;
    _ = info.vendor(&name) catch return;
    _ = info.getType() catch return;
    _ = info.resolution() catch return;
    _ = info.minSamplingInterval() catch return;
    _ = info.maxSamplingInterval() catch return;
    var subscription = sensor.Subscription.create(1, 100000000, onSensor) catch return;
    defer subscription.deinit() catch {};
    subscription.start() catch {};
    subscription.stop() catch {};
}
fn onSensor(_: ?*sensor.raw.Sensor_Event) callconv(.c) void {}

export fn checkResources(env: resources.raw.napi_env, value: resources.raw.napi_value) void {
    var manager = resources.ResourceManager.create(env, value) catch return;
    defer manager.deinit();
    _ = manager.isRawDir(".") catch return;
    var directory = manager.openDir(".") catch return;
    defer directory.deinit();
    _ = directory.count() catch return;
    _ = directory.name(0) catch return;
    var file = manager.openFile("test") catch return;
    defer file.deinit();
    var output: [128]u8 = undefined;
    _ = file.read(&output) catch return;
    file.seek(0, .start) catch {};
    _ = file.size() catch return;
    _ = file.offset() catch return;
    _ = file.remaining() catch return;
    const media = manager.media(allocator, 1, 0) catch return;
    allocator.free(media);
    const named = manager.mediaByName(allocator, "test", 0) catch return;
    allocator.free(named);
    const base64 = manager.mediaBase64(allocator, 1, 0) catch return;
    allocator.free(base64);
}

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
