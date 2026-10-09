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

const connection = @import("net_connection");
const stack = @import("net_stack");
export fn checkNetwork() void {
    _ = connection.hasDefaultNet() catch return;
    _ = connection.isDefaultNetMetered() catch return;
    _ = connection.defaultHttpProxy() catch return;
    _ = connection.allNetworks() catch return;
    const network = connection.Network.default() catch return;
    _ = network.properties() catch return;
    _ = network.capabilities() catch return;
    network.bindSocket(0) catch {};
    var dns = network.resolve("example.com", "443", null) catch return;
    dns.deinit() catch {};
    var callbacks = std.mem.zeroes(connection.raw.NetConn_NetConnCallback);
    var registration = connection.Registration.default(&callbacks) catch return;
    registration.deinit() catch {};
    var specifier = std.mem.zeroes(connection.raw.NetConn_NetSpecifier);
    registration = connection.Registration.matching(&specifier, &callbacks, 1000) catch return;
    registration.deinit() catch {};
    var certificates = stack.Certificates.forHost("example.com") catch return;
    certificates.deinit();
    var cert = std.mem.zeroes(stack.raw.NetStack_CertBlob);
    stack.verifyCertificate(&cert, null) catch {};
    var socket = stack.WebSocket.create(null, null, null, null) catch return;
    defer socket.deinit() catch {};
    socket.addHeader("User-Agent", "zig") catch {};
    socket.connect("wss://example.com") catch {};
    socket.send("hello") catch {};
    socket.close(1000, "done") catch {};
    if (comptime level >= 20) {
        var headers = stack.HttpHeaders.create() catch return;
        defer headers.deinit();
        headers.set("Accept", "text/plain") catch {};
        var request = stack.HttpRequest.create("https://example.com") catch return;
        defer request.deinit();
        _ = request.options() catch return;
        request.send(onHttpResponse, std.mem.zeroes(stack.raw.Http_EventsHandler)) catch {};
    }
}
fn onHttpResponse(value: [*c]stack.raw.Http_Response, _: u32) callconv(.c) void {
    if (comptime level >= 20) {
        if (value == null) return;
        var response = stack.HttpResponse.fromOwned(value);
        defer response.deinit() catch {};
        _ = response.body() catch return;
    }
}

const camera = @import("camera");
const images = @import("image_native");
const legacy_image = @import("image");
export fn checkCamera() void {
    var manager = camera.Manager.create() catch return;
    defer manager.deinit() catch {};
    var devices = manager.cameras() catch return;
    defer devices.deinit() catch {};
    if (devices.values().len == 0) return;
    var capability = manager.capability(&devices.values()[0]) catch return;
    defer capability.deinit() catch {};
    const caps = capability.value() catch return;
    if (caps.previewProfilesSize == 0) return;
    var input = camera.Input.create(manager, &devices.values()[0]) catch return;
    defer input.deinit() catch {};
    input.open() catch {};
    defer input.close() catch {};
    var preview = camera.Preview.create(manager, caps.previewProfiles[0], "1") catch return;
    defer preview.deinit() catch {};
    var photo = camera.Photo.create(manager, caps.previewProfiles[0], "1") catch return;
    defer photo.deinit() catch {};
    var session = camera.Session.create(manager) catch return;
    defer session.deinit() catch {};
    session.setMode(0) catch {};
    session.beginConfig() catch {};
    session.addInput(input) catch {};
    session.addPreview(preview) catch {};
    session.addPhoto(photo) catch {};
    session.commitConfig() catch {};
    session.start() catch {};
    preview.start() catch {};
    photo.capture() catch {};
    photo.captureWithSettings(std.mem.zeroes(camera.raw.Camera_PhotoCaptureSetting)) catch {};
    preview.stop() catch {};
    session.stop() catch {};
    session.beginConfig() catch {};
    session.removePhoto(photo) catch {};
    session.removePreview(preview) catch {};
    session.removeInput(input) catch {};
    session.commitConfig() catch {};
}
export fn checkImages() void {
    var options = images.DecodeOptions.create() catch return;
    defer options.deinit() catch {};
    options.setSize(.{ .width = 16, .height = 16 }) catch {};
    options.setIndex(0) catch {};
    options.setPixelFormat(3) catch {};
    var source = images.Source.fromData("encoded") catch return;
    defer source.deinit() catch {};
    var file_source = images.Source.fromFd(0) catch return;
    file_source.deinit() catch {};
    _ = source.frameCount() catch return;
    var pixels = source.decode(options) catch return;
    defer pixels.deinit() catch {};
    var bytes: [4096]u8 = undefined;
    _ = pixels.read(&bytes) catch return;
    pixels.write(&bytes) catch {};
    pixels.scale(2, 2) catch {};
    pixels.rotate(90) catch {};
    pixels.flip(false, true) catch {};
    pixels.crop(std.mem.zeroes(images.raw.Image_Region)) catch {};
    var packing = images.PackingOptions.create() catch return;
    defer packing.deinit() catch {};
    packing.setMimeType("image/png") catch {};
    packing.setQuality(90) catch {};
    var packer = images.Packer.create() catch return;
    defer packer.deinit() catch {};
    _ = packer.pack(packing, pixels, &bytes) catch return;
    packer.packToFile(packing, pixels, 0) catch {};
    var receiver = images.Receiver.create(.{ .width = 16, .height = 16 }, 2) catch return;
    defer receiver.deinit() catch {};
    _ = receiver.surfaceId() catch return;
    var frame = receiver.readLatest() catch return;
    defer frame.deinit() catch {};
    _ = frame.size() catch return;
    _ = frame.timestamp() catch return;
}
export fn checkLegacyImages(env: legacy_image.raw.napi_env, value: legacy_image.raw.napi_value) void {
    const pixels = legacy_image.Pixelmap.fromNapi(env, value) catch return;
    _ = pixels.info() catch return;
    pixels.scale(1, 1) catch {};
    pixels.rotate(90) catch {};
    pixels.setOpacity(0.5) catch {};
    var frame = legacy_image.Image.fromNapi(env, value) catch return;
    defer frame.deinit() catch {};
    _ = frame.size() catch return;
    _ = frame.component(0) catch return;
    var source = legacy_image.Source.fromNapi(env, value) catch return;
    defer source.deinit() catch {};
    _ = source.frameCount() catch return;
    _ = source.decode(std.mem.zeroes(legacy_image.raw.OhosImageDecodingOps)) catch return;
}

const jsvm = @import("jsvm");
export fn checkJsvm() void {
    jsvm.initialize(&std.mem.zeroes(jsvm.raw.JSVM_InitOptions)) catch return;
    var vm = jsvm.Vm.create(std.mem.zeroes(jsvm.raw.JSVM_CreateVMOptions)) catch return;
    defer vm.deinit() catch {};
    var vm_scope = vm.openScope() catch return;
    defer vm_scope.deinit() catch {};
    var env = vm.createEnv(&.{}) catch return;
    defer env.deinit() catch {};
    var env_scope = env.openScope() catch return;
    defer env_scope.deinit() catch {};
    var handles = env.openHandleScope() catch return;
    defer handles.deinit() catch {};
    const value = env.eval("1 + 2") catch return;
    _ = value.toNumber() catch return;
    const text = value.toString(allocator) catch return;
    allocator.free(text);
    _ = env.number(1) catch return;
    _ = env.string("text") catch return;
    var reference = value.retain() catch return;
    _ = reference.value() catch return;
    reference.deinit() catch {};
    _ = env.takeException() catch return;
    _ = vm.pumpMessageLoop() catch return;
    vm.performMicrotaskCheckpoint() catch {};
}

const arkui = @import("arkui");
const input_events = @import("arkui_input");
const accessibility = @import("accessibility");
const web = @import("web");
export fn checkArkui(content_handle: arkui.raw.ArkUI_NodeContentHandle) void {
    const api = arkui.NodeApi.load() catch return;
    var parent = api.create(arkui.raw.ARKUI_NODE_COLUMN) catch return;
    defer parent.deinit() catch {};
    var child = api.create(arkui.raw.ARKUI_NODE_TEXT) catch return;
    defer child.deinit() catch {};
    parent.addChild(child) catch {};
    child.setNumber(arkui.raw.NODE_WIDTH, 100) catch {};
    child.setString(arkui.raw.NODE_TEXT_CONTENT, "hello") catch {};
    child.resetAttribute(arkui.raw.NODE_WIDTH) catch {};
    child.registerEvent(arkui.raw.NODE_ON_CLICK, 1, null) catch {};
    child.addEventReceiver(onNodeEvent) catch {};
    child.removeEventReceiver(onNodeEvent) catch {};
    child.unregisterEvent(arkui.raw.NODE_ON_CLICK) catch {};
    parent.removeChild(child) catch {};
    const content = arkui.Content.fromRaw(content_handle) catch return;
    content.add(parent) catch {};
    content.remove(parent) catch {};
    var dialog = arkui.Dialog.create() catch return;
    defer dialog.deinit() catch {};
    dialog.setContent(parent) catch {};
    dialog.show(false) catch {};
    dialog.close() catch {};
}
fn onNodeEvent(_: ?*arkui.raw.ArkUI_NodeEvent) callconv(.c) void {}
export fn checkInputEvent(handle: *const input_events.raw.ArkUI_UIInputEvent) void {
    const event = input_events.Event.fromRaw(handle);
    _ = event.eventType();
    _ = event.action();
    _ = event.sourceType();
    _ = event.toolType();
    _ = event.time();
    _ = event.pointerCount();
    _ = event.pointer(0) catch return;
    _ = event.historySize();
    _ = event.historyPosition(0, 0) catch return;
    event.stopPropagation(true) catch {};
    event.intercept(0) catch {};
    if (comptime level >= 14) {
        var keys: [16]i32 = undefined;
        _ = event.pressedKeys(&keys) catch return;
    }
}
export fn checkAccessibility(handle: *accessibility.raw.ArkUI_AccessibilityProvider) void {
    if (comptime level >= 13) {
        var element = accessibility.Element.create() catch return;
        defer element.deinit();
        element.setElementId(1) catch {};
        element.setParentId(0) catch {};
        element.setContents("content") catch {};
        element.setComponentType("Text") catch {};
        element.setAccessibilityText("label") catch {};
        element.setEnabled(true) catch {};
        element.setFocusable(true) catch {};
        element.setFocused(false) catch {};
        element.setVisible(true) catch {};
        element.setClickable(true) catch {};
        element.setSelected(false) catch {};
        element.setChildren(&.{ 2, 3 }) catch {};
        element.setActions(&.{}) catch {};
        element.setRect(std.mem.zeroes(accessibility.raw.ArkUI_AccessibleRect)) catch {};
        var event = accessibility.Event.create() catch return;
        defer event.deinit();
        event.setType(0) catch {};
        event.setText("announcement") catch {};
        event.setFocusId(1) catch {};
        event.setElement(element) catch {};
        const provider = accessibility.Provider.fromRaw(handle);
        var callbacks = std.mem.zeroes(accessibility.raw.ArkUI_AccessibilityProviderCallbacks);
        provider.register(&callbacks) catch {};
        provider.send(event, onAccessibilitySent) catch {};
    }
}
fn onAccessibilitySent(_: i32) callconv(.c) void {}
export fn checkWeb(request_handle: *web.raw.ArkWeb_ResourceRequest, handler_handle: *web.raw.ArkWeb_ResourceHandler) void {
    const request = web.Request.fromRaw(request_handle);
    const url = request.url(allocator) catch return;
    allocator.free(url);
    const method = request.method(allocator) catch return;
    allocator.free(method);
    _ = request.isMainFrame();
    var response = web.Response.create() catch return;
    defer response.deinit();
    response.setStatus(200) catch {};
    response.setMimeType("text/plain") catch {};
    response.setCharset("UTF-8") catch {};
    response.setHeader("Cache-Control", "no-cache", true) catch {};
    const handler = web.ResourceHandler.fromRaw(handler_handle);
    handler.respond(response) catch {};
    handler.write("hello") catch {};
    handler.finish() catch {};
    handler.fail(-1) catch {};
    var scheme = web.SchemeHandler.create() catch return;
    defer scheme.deinit();
    scheme.setCallbacks(null, null) catch {};
    scheme.setUserData(null) catch {};
    scheme.install("custom", "web") catch {};
    web.clearHandlers("web") catch {};
    const controller = web.Controller.load("web") catch return;
    controller.refresh() catch {};
    controller.runJavaScript(&std.mem.zeroes(web.raw.ArkWeb_JavaScriptObject)) catch {};
}

export fn checkOpenGtx() void {
    if (comptime @import("check_options").compile_check_opengtx) {
        const gtx = @import("opengtx");
        var context = gtx.Context.create(null) catch return;
        defer context.deinit() catch {};
        context.configure(.{ .package_name = "org.example.compilecheck", .app_version = "1.0", .max_resolution = .{ .width = 1920, .height = 1080 } }) catch {};
        context.activate() catch {};
        context.frame(std.mem.zeroes(gtx.raw.OpenGTX_FrameRenderInfo)) catch {};
        context.scene(gtx.raw.PLAYING, "playing", .{ .min = 30, .max = 60, .recommended = 60 }, .{ .width = 1920, .height = 1080 }) catch {};
        context.network("127.0.0.1", .{ .total = 10, .up = 5, .down = 5 }) catch {};
        context.deactivate() catch {};
    }
}
