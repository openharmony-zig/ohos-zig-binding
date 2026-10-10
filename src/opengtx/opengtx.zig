//! HMS OpenGTX (enable -Dopengtx=true). Move-only context; serialize all calls
//! and keep callback state/configuration strings alive until deinit completes.
const ffi = @import("ohos_zig_binding_ffi");
pub const raw = @import("opengtx_sys");
pub const Error = ffi.Error;
pub const Config = struct {
    package_name: [:0]const u8,
    app_version: [:0]const u8,
    engine_version: [:0]const u8 = "",
    mode: raw.OpenGTX_LTPO_Mode = raw.ADAPTIVE_MODE,
    target_fps: i32 = 60,
    engine: raw.OpenGTX_EngineType = raw.OTHERS_ENGINE,
    game_type: raw.OpenGTX_GameType = raw.OTHERS_TYPE,
    max_quality: raw.OpenGTX_PictureQualityMaxLevel = raw.FHD,
    max_resolution: raw.OpenGTX_ResolutionValue,
    main_thread: i32 = 0,
    render_thread: i32 = 0,
    key_threads: [5]i32 = @splat(0),
    vulkan: bool = false,
    pub fn native(self: Config) Error!raw.OpenGTX_ConfigDescription {
        if (self.package_name.len == 0 or self.target_fps <= 0 or self.max_resolution.width <= 0 or self.max_resolution.height <= 0) return error.InvalidArgument;
        return .{
            .mode = self.mode,
            .targetFPS = self.target_fps,
            .packageName = @constCast(self.package_name.ptr),
            .appVersion = @constCast(self.app_version.ptr),
            .engineType = self.engine,
            .engineVersion = @constCast(self.engine_version.ptr),
            .gameType = self.game_type,
            .pictureQualityMaxLevel = self.max_quality,
            .resolutionMaxValue = self.max_resolution,
            .gameMainThreadId = self.main_thread,
            .gameRenderThreadId = self.render_thread,
            .gameKeyThreadIds = self.key_threads,
            .vulkanSupport = self.vulkan,
        };
    }
};
pub const Context = struct {
    handle: ?*raw.OpenGTX_Context,
    active: bool = false,
    pub fn create(callback: raw.OpenGTX_DeviceInfoCallback) Error!Context {
        return .{ .handle = raw.HMS_OpenGTX_CreateContext(callback) orelse return error.UnexpectedNull };
    }
    pub fn configure(self: Context, config: Config) Error!void {
        const value = try config.native();
        try ffi.check(raw.HMS_OpenGTX_SetConfiguration(self.handle orelse return error.InvalidHandle, &value));
    }
    pub fn activate(self: *Context) Error!void {
        if (self.active) return;
        try ffi.check(raw.HMS_OpenGTX_Activate(self.handle orelse return error.InvalidHandle));
        self.active = true;
    }
    pub fn deactivate(self: *Context) Error!void {
        if (!self.active) return;
        try ffi.check(raw.HMS_OpenGTX_Deactivate(self.handle orelse return error.InvalidHandle));
        self.active = false;
    }
    pub fn frame(self: Context, value: raw.OpenGTX_FrameRenderInfo) Error!void {
        try ffi.check(raw.HMS_OpenGTX_DispatchFrameRenderInfo(self.handle orelse return error.InvalidHandle, &value));
    }
    pub fn scene(self: Context, id: raw.OpenGTX_SceneID, description: [:0]const u8, fps: struct { min: i32, max: i32, recommended: i32 }, resolution: raw.OpenGTX_ResolutionValue) Error!void {
        if (fps.min <= 0 or fps.min > fps.recommended or fps.recommended > fps.max or resolution.width <= 0 or resolution.height <= 0) return error.InvalidArgument;
        const value = raw.OpenGTX_GameSceneInfo{ .sceneID = id, .description = @constCast(description.ptr), .recommendFPS = fps.recommended, .minFPS = fps.min, .maxFPS = fps.max, .resolutionCurValue = resolution };
        try ffi.check(raw.HMS_OpenGTX_DispatchGameSceneInfo(self.handle orelse return error.InvalidHandle, &value));
    }
    pub fn network(self: Context, server_ip: [:0]const u8, latency: raw.OpenGTX_NetworkLatency) Error!void {
        if (latency.total < 0 or latency.up < 0 or latency.down < 0) return error.InvalidArgument;
        const value = raw.OpenGTX_NetworkInfo{ .networkLatency = latency, .networkServerIP = @constCast(server_ip.ptr) };
        try ffi.check(raw.HMS_OpenGTX_DispatchNetworkInfo(self.handle orelse return error.InvalidHandle, &value));
    }
    /// Stop application callbacks/users before teardown; on native failure the
    /// remaining handle is retained so that the caller can retry.
    pub fn deinit(self: *Context) Error!void {
        try self.deactivate();
        if (self.handle != null) {
            try ffi.check(raw.HMS_OpenGTX_DestroyContext(&self.handle));
            self.handle = null;
        }
    }
};
