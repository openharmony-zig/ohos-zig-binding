//! Move-only native owners; release children before their parents. Raw APIs remain available.
const ffi = @import("ohos_zig_binding_ffi");
pub const raw = @import("image_sys");
pub const Error = ffi.Error;
// N-API values and their environment must outlive every borrowed native view.
pub const Pixelmap = struct {
    handle: *raw.NativePixelMap,
    pub fn fromNapi(env: raw.napi_env, value: raw.napi_value) Error!Pixelmap {
        return .{ .handle = raw.OH_PixelMap_InitNativePixelMap(env, value) orelse return error.UnexpectedNull };
    }
    pub fn info(self: Pixelmap) Error!raw.OhosPixelMapInfos {
        var value: raw.OhosPixelMapInfos = undefined;
        try ffi.check(raw.OH_PixelMap_GetImageInfo(self.handle, &value));
        return value;
    }
    pub fn scale(self: Pixelmap, x: f32, y: f32) Error!void {
        try ffi.check(raw.OH_PixelMap_Scale(self.handle, x, y));
    }
    pub fn rotate(self: Pixelmap, angle: f32) Error!void {
        try ffi.check(raw.OH_PixelMap_Rotate(self.handle, angle));
    }
    pub fn setOpacity(self: Pixelmap, opacity: f32) Error!void {
        if (!(opacity >= 0 and opacity <= 1)) return error.InvalidArgument;
        try ffi.check(raw.OH_PixelMap_SetOpacity(self.handle, opacity));
    }
};
pub const Image = struct {
    handle: ?*raw.ImageNative,
    pub fn ptr(self: Image) Error!*raw.ImageNative {
        return self.handle orelse error.InvalidHandle;
    }
    pub fn deinit(self: *Image) Error!void {
        if (self.handle) |handle| {
            try ffi.check(raw.OH_Image_Release(handle));
            self.handle = null;
        }
    }
    pub fn fromNapi(env: raw.napi_env, value: raw.napi_value) Error!Image {
        return .{ .handle = raw.OH_Image_InitImageNative(env, value) orelse return error.UnexpectedNull };
    }
    pub fn size(self: Image) Error!raw.OhosImageSize {
        var value: raw.OhosImageSize = undefined;
        try ffi.check(raw.OH_Image_Size(try self.ptr(), &value));
        return value;
    }
    /// Component data is borrowed until the image is released.
    pub fn component(self: Image, kind: i32) Error!raw.OhosImageComponent {
        var value: raw.OhosImageComponent = undefined;
        try ffi.check(raw.OH_Image_GetComponent(try self.ptr(), kind, &value));
        return value;
    }
};
pub const Source = struct {
    handle: ?*raw.ImageSourceNative,
    pub fn ptr(self: Source) Error!*raw.ImageSourceNative {
        return self.handle orelse error.InvalidHandle;
    }
    pub fn deinit(self: *Source) Error!void {
        if (self.handle) |handle| {
            try ffi.check(raw.OH_ImageSource_Release(handle));
            self.handle = null;
        }
    }
    pub fn fromNapi(env: raw.napi_env, value: raw.napi_value) Error!Source {
        return .{ .handle = raw.OH_ImageSource_InitNative(env, value) orelse return error.UnexpectedNull };
    }
    pub fn decode(self: Source, options: raw.OhosImageDecodingOps) Error!raw.napi_value {
        var value: raw.napi_value = null;
        var ops = options;
        try ffi.check(raw.OH_ImageSource_CreatePixelMap(try self.ptr(), &ops, &value));
        return value orelse error.UnexpectedNull;
    }
    pub fn frameCount(self: Source) Error!u32 {
        var value: u32 = 0;
        try ffi.check(raw.OH_ImageSource_GetFrameCount(try self.ptr(), &value));
        return value;
    }
};
