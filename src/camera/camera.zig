//! Move-only native owners; release children before their parents. Raw APIs remain available.
const ffi = @import("ohos_zig_binding_ffi");
pub const raw = @import("camera_sys");
pub const Error = ffi.Error;
// Keep the manager alive through device lists and capabilities; keep inputs/outputs alive while attached to sessions.
pub const Manager = struct {
    handle: ?*raw.Camera_Manager,
    pub fn ptr(self: Manager) Error!*raw.Camera_Manager {
        return self.handle orelse error.InvalidHandle;
    }
    pub fn deinit(self: *Manager) Error!void {
        if (self.handle) |handle| {
            try ffi.check(raw.OH_Camera_DeleteCameraManager(handle));
            self.handle = null;
        }
    }
    pub fn create() Error!Manager {
        var handle: ?*raw.Camera_Manager = null;
        try ffi.check(raw.OH_Camera_GetCameraManager(&handle));
        return .{ .handle = handle orelse return error.UnexpectedNull };
    }

    pub fn cameras(self: Manager) Error!Devices {
        var items: [*c]raw.Camera_Device = null;
        var count: u32 = 0;
        const manager = try self.ptr();
        try ffi.check(raw.OH_CameraManager_GetSupportedCameras(manager, &items, &count));
        if (count != 0 and items == null) return error.UnexpectedNull;
        return .{ .manager = manager, .items = items, .count = count };
    }
    pub fn capability(self: Manager, device: *const raw.Camera_Device) Error!Capability {
        const manager = try self.ptr();
        var value: ?*raw.Camera_OutputCapability = null;
        try ffi.check(raw.OH_CameraManager_GetSupportedCameraOutputCapability(manager, device, @ptrCast(&value)));
        return .{ .manager = manager, .handle = value orelse return error.UnexpectedNull };
    }
};
pub const Devices = struct {
    manager: *raw.Camera_Manager,
    items: [*c]raw.Camera_Device,
    count: u32,
    pub fn values(self: Devices) []const raw.Camera_Device {
        return if (self.count == 0) &.{} else self.items[0..self.count];
    }
    pub fn deinit(self: *Devices) Error!void {
        if (self.items != null) {
            try ffi.check(raw.OH_CameraManager_DeleteSupportedCameras(self.manager, self.items, self.count));
            self.items = null;
            self.count = 0;
        }
    }
};
pub const Capability = struct {
    manager: *raw.Camera_Manager,
    handle: ?*raw.Camera_OutputCapability,
    /// Profiles in this structure are borrowed until deinit.
    pub fn value(self: Capability) Error!*const raw.Camera_OutputCapability {
        return self.handle orelse error.InvalidHandle;
    }
    pub fn deinit(self: *Capability) Error!void {
        if (self.handle) |handle| {
            try ffi.check(raw.OH_CameraManager_DeleteSupportedCameraOutputCapability(self.manager, handle));
            self.handle = null;
        }
    }
};
pub const Input = struct {
    handle: ?*raw.Camera_Input,
    pub fn ptr(self: Input) Error!*raw.Camera_Input {
        return self.handle orelse error.InvalidHandle;
    }
    pub fn deinit(self: *Input) Error!void {
        if (self.handle) |handle| {
            try ffi.check(raw.OH_CameraInput_Release(handle));
            self.handle = null;
        }
    }
    pub fn create(manager: Manager, device: *const raw.Camera_Device) Error!Input {
        var handle: ?*raw.Camera_Input = null;
        try ffi.check(raw.OH_CameraManager_CreateCameraInput(try manager.ptr(), device, &handle));
        return .{ .handle = handle orelse return error.UnexpectedNull };
    }
    pub fn open(self: Input) Error!void {
        try ffi.check(raw.OH_CameraInput_Open(try self.ptr()));
    }
    pub fn close(self: Input) Error!void {
        try ffi.check(raw.OH_CameraInput_Close(try self.ptr()));
    }
};
pub const Preview = struct {
    handle: ?*raw.Camera_PreviewOutput,
    pub fn ptr(self: Preview) Error!*raw.Camera_PreviewOutput {
        return self.handle orelse error.InvalidHandle;
    }
    pub fn deinit(self: *Preview) Error!void {
        if (self.handle) |handle| {
            try ffi.check(raw.OH_PreviewOutput_Release(handle));
            self.handle = null;
        }
    }
    pub fn create(manager: Manager, profile: *const raw.Camera_Profile, surface: [:0]const u8) Error!Preview {
        var handle: ?*raw.Camera_PreviewOutput = null;
        try ffi.check(raw.OH_CameraManager_CreatePreviewOutput(try manager.ptr(), profile, surface.ptr, &handle));
        return .{ .handle = handle orelse return error.UnexpectedNull };
    }
    pub fn start(self: Preview) Error!void {
        try ffi.check(raw.OH_PreviewOutput_Start(try self.ptr()));
    }
    pub fn stop(self: Preview) Error!void {
        try ffi.check(raw.OH_PreviewOutput_Stop(try self.ptr()));
    }
};
pub const Photo = struct {
    handle: ?*raw.Camera_PhotoOutput,
    pub fn ptr(self: Photo) Error!*raw.Camera_PhotoOutput {
        return self.handle orelse error.InvalidHandle;
    }
    pub fn deinit(self: *Photo) Error!void {
        if (self.handle) |handle| {
            try ffi.check(raw.OH_PhotoOutput_Release(handle));
            self.handle = null;
        }
    }
    pub fn create(manager: Manager, profile: *const raw.Camera_Profile, surface: [:0]const u8) Error!Photo {
        var handle: ?*raw.Camera_PhotoOutput = null;
        try ffi.check(raw.OH_CameraManager_CreatePhotoOutput(try manager.ptr(), profile, surface.ptr, &handle));
        return .{ .handle = handle orelse return error.UnexpectedNull };
    }
    pub fn capture(self: Photo) Error!void {
        try ffi.check(raw.OH_PhotoOutput_Capture(try self.ptr()));
    }
    pub fn captureWithSettings(self: Photo, settings: raw.Camera_PhotoCaptureSetting) Error!void {
        try ffi.check(raw.OH_PhotoOutput_Capture_WithCaptureSetting(try self.ptr(), settings));
    }
};
pub const Session = struct {
    handle: ?*raw.Camera_CaptureSession,
    pub fn ptr(self: Session) Error!*raw.Camera_CaptureSession {
        return self.handle orelse error.InvalidHandle;
    }
    pub fn deinit(self: *Session) Error!void {
        if (self.handle) |handle| {
            try ffi.check(raw.OH_CaptureSession_Release(handle));
            self.handle = null;
        }
    }
    pub fn create(manager: Manager) Error!Session {
        var handle: ?*raw.Camera_CaptureSession = null;
        try ffi.check(raw.OH_CameraManager_CreateCaptureSession(try manager.ptr(), &handle));
        return .{ .handle = handle orelse return error.UnexpectedNull };
    }
    pub fn beginConfig(self: Session) Error!void {
        try ffi.check(raw.OH_CaptureSession_BeginConfig(try self.ptr()));
    }
    pub fn commitConfig(self: Session) Error!void {
        try ffi.check(raw.OH_CaptureSession_CommitConfig(try self.ptr()));
    }
    pub fn start(self: Session) Error!void {
        try ffi.check(raw.OH_CaptureSession_Start(try self.ptr()));
    }
    pub fn stop(self: Session) Error!void {
        try ffi.check(raw.OH_CaptureSession_Stop(try self.ptr()));
    }
    pub fn addInput(self: Session, value: Input) Error!void {
        try ffi.check(raw.OH_CaptureSession_AddInput(try self.ptr(), try value.ptr()));
    }
    pub fn removeInput(self: Session, value: Input) Error!void {
        try ffi.check(raw.OH_CaptureSession_RemoveInput(try self.ptr(), try value.ptr()));
    }
    pub fn addPreview(self: Session, value: Preview) Error!void {
        try ffi.check(raw.OH_CaptureSession_AddPreviewOutput(try self.ptr(), try value.ptr()));
    }
    pub fn removePreview(self: Session, value: Preview) Error!void {
        try ffi.check(raw.OH_CaptureSession_RemovePreviewOutput(try self.ptr(), try value.ptr()));
    }
    pub fn addPhoto(self: Session, value: Photo) Error!void {
        try ffi.check(raw.OH_CaptureSession_AddPhotoOutput(try self.ptr(), try value.ptr()));
    }
    pub fn removePhoto(self: Session, value: Photo) Error!void {
        try ffi.check(raw.OH_CaptureSession_RemovePhotoOutput(try self.ptr(), try value.ptr()));
    }
    pub fn setMode(self: Session, mode: raw.Camera_SceneMode) Error!void {
        try ffi.check(raw.OH_CaptureSession_SetSessionMode(try self.ptr(), mode));
    }
};
