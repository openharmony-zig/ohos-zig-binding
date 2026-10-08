//! Move-only native owners; release children before their parents. Raw APIs remain available.
const ffi = @import("ohos_zig_binding_ffi");
pub const raw = @import("image_native_sys");
pub const Error = ffi.Error;
pub const DecodeOptions = struct {
    handle: ?*raw.OH_DecodingOptions,
    pub fn ptr(self: DecodeOptions) Error!*raw.OH_DecodingOptions {
        return self.handle orelse error.InvalidHandle;
    }
    pub fn deinit(self: *DecodeOptions) Error!void {
        if (self.handle) |handle| {
            try ffi.check(raw.OH_DecodingOptions_Release(handle));
            self.handle = null;
        }
    }
    pub fn create() Error!DecodeOptions {
        var handle: ?*raw.OH_DecodingOptions = null;
        try ffi.check(raw.OH_DecodingOptions_Create(&handle));
        return .{ .handle = handle orelse return error.UnexpectedNull };
    }
    pub fn setSize(self: DecodeOptions, size: raw.Image_Size) Error!void {
        try ffi.check(raw.OH_DecodingOptions_SetDesiredSize(try self.ptr(), @constCast(&size)));
    }
    pub fn setPixelFormat(self: DecodeOptions, format: i32) Error!void {
        try ffi.check(raw.OH_DecodingOptions_SetPixelFormat(try self.ptr(), format));
    }
    pub fn setIndex(self: DecodeOptions, index: u32) Error!void {
        try ffi.check(raw.OH_DecodingOptions_SetIndex(try self.ptr(), index));
    }
};
pub const Source = struct {
    handle: ?*raw.OH_ImageSourceNative,
    pub fn ptr(self: Source) Error!*raw.OH_ImageSourceNative {
        return self.handle orelse error.InvalidHandle;
    }
    pub fn deinit(self: *Source) Error!void {
        if (self.handle) |handle| {
            try ffi.check(raw.OH_ImageSourceNative_Release(handle));
            self.handle = null;
        }
    }
    /// The encoded bytes must remain alive until this source is released.
    pub fn fromData(data: []const u8) Error!Source {
        if (data.len == 0) return error.InvalidArgument;
        var handle: ?*raw.OH_ImageSourceNative = null;
        try ffi.check(raw.OH_ImageSourceNative_CreateFromData(@constCast(data.ptr), data.len, &handle));
        return .{ .handle = handle orelse return error.UnexpectedNull };
    }
    /// Keep the descriptor open while the source is used.
    pub fn fromFd(fd: i32) Error!Source {
        if (fd < 0) return error.InvalidArgument;
        var handle: ?*raw.OH_ImageSourceNative = null;
        try ffi.check(raw.OH_ImageSourceNative_CreateFromFd(fd, &handle));
        return .{ .handle = handle orelse return error.UnexpectedNull };
    }
    pub fn decode(self: Source, options: DecodeOptions) Error!Pixelmap {
        var handle: ?*raw.OH_PixelmapNative = null;
        try ffi.check(raw.OH_ImageSourceNative_CreatePixelmap(try self.ptr(), try options.ptr(), &handle));
        return .{ .handle = handle orelse return error.UnexpectedNull };
    }
    pub fn frameCount(self: Source) Error!u32 {
        var value: u32 = 0;
        try ffi.check(raw.OH_ImageSourceNative_GetFrameCount(try self.ptr(), &value));
        return value;
    }
};
pub const Pixelmap = struct {
    handle: ?*raw.OH_PixelmapNative,
    pub fn ptr(self: Pixelmap) Error!*raw.OH_PixelmapNative {
        return self.handle orelse error.InvalidHandle;
    }
    pub fn deinit(self: *Pixelmap) Error!void {
        if (self.handle) |handle| {
            try ffi.check(raw.OH_PixelmapNative_Release(handle));
            self.handle = null;
        }
    }
    /// Takes ownership of one native pixelmap reference.
    pub fn fromOwned(handle: *raw.OH_PixelmapNative) Pixelmap {
        return .{ .handle = handle };
    }
    pub fn read(self: Pixelmap, destination: []u8) Error![]u8 {
        var size = destination.len;
        try ffi.check(raw.OH_PixelmapNative_ReadPixels(try self.ptr(), destination.ptr, &size));
        if (size > destination.len) return error.BufferTooSmall;
        return destination[0..size];
    }
    pub fn write(self: Pixelmap, source: []const u8) Error!void {
        try ffi.check(raw.OH_PixelmapNative_WritePixels(try self.ptr(), @constCast(source.ptr), source.len));
    }
    pub fn scale(self: Pixelmap, x: f32, y: f32) Error!void {
        try ffi.check(raw.OH_PixelmapNative_Scale(try self.ptr(), x, y));
    }
    pub fn rotate(self: Pixelmap, degrees: f32) Error!void {
        try ffi.check(raw.OH_PixelmapNative_Rotate(try self.ptr(), degrees));
    }
    pub fn flip(self: Pixelmap, horizontal: bool, vertical: bool) Error!void {
        try ffi.check(raw.OH_PixelmapNative_Flip(try self.ptr(), horizontal, vertical));
    }
    pub fn crop(self: Pixelmap, region: raw.Image_Region) Error!void {
        try ffi.check(raw.OH_PixelmapNative_Crop(try self.ptr(), @constCast(&region)));
    }
};
pub const PackingOptions = struct {
    handle: ?*raw.OH_PackingOptions,
    pub fn ptr(self: PackingOptions) Error!*raw.OH_PackingOptions {
        return self.handle orelse error.InvalidHandle;
    }
    pub fn deinit(self: *PackingOptions) Error!void {
        if (self.handle) |handle| {
            try ffi.check(raw.OH_PackingOptions_Release(handle));
            self.handle = null;
        }
    }
    pub fn create() Error!PackingOptions {
        var handle: ?*raw.OH_PackingOptions = null;
        try ffi.check(raw.OH_PackingOptions_Create(&handle));
        return .{ .handle = handle orelse return error.UnexpectedNull };
    }

    /// Keep the MIME bytes alive through the packing operation.
    pub fn setMimeType(self: PackingOptions, mime: []const u8) Error!void {
        var value = raw.Image_MimeType{ .data = @constCast(mime.ptr), .size = mime.len };
        try ffi.check(raw.OH_PackingOptions_SetMimeType(try self.ptr(), &value));
    }
    pub fn setQuality(self: PackingOptions, quality: u32) Error!void {
        if (quality > 100) return error.InvalidArgument;
        try ffi.check(raw.OH_PackingOptions_SetQuality(try self.ptr(), quality));
    }
};
pub const Packer = struct {
    handle: ?*raw.OH_ImagePackerNative,
    pub fn ptr(self: Packer) Error!*raw.OH_ImagePackerNative {
        return self.handle orelse error.InvalidHandle;
    }
    pub fn deinit(self: *Packer) Error!void {
        if (self.handle) |handle| {
            try ffi.check(raw.OH_ImagePackerNative_Release(handle));
            self.handle = null;
        }
    }
    pub fn create() Error!Packer {
        var handle: ?*raw.OH_ImagePackerNative = null;
        try ffi.check(raw.OH_ImagePackerNative_Create(&handle));
        return .{ .handle = handle orelse return error.UnexpectedNull };
    }

    pub fn pack(self: Packer, options: PackingOptions, pixels: Pixelmap, destination: []u8) Error![]u8 {
        var size = destination.len;
        try ffi.check(raw.OH_ImagePackerNative_PackToDataFromPixelmap(try self.ptr(), try options.ptr(), try pixels.ptr(), destination.ptr, &size));
        if (size > destination.len) return error.BufferTooSmall;
        return destination[0..size];
    }
    pub fn packToFile(self: Packer, options: PackingOptions, pixels: Pixelmap, fd: i32) Error!void {
        if (fd < 0) return error.InvalidArgument;
        try ffi.check(raw.OH_ImagePackerNative_PackToFileFromPixelmap(try self.ptr(), try options.ptr(), try pixels.ptr(), fd));
    }
};
pub const Receiver = struct {
    handle: ?*raw.OH_ImageReceiverNative,
    pub fn ptr(self: Receiver) Error!*raw.OH_ImageReceiverNative {
        return self.handle orelse error.InvalidHandle;
    }
    pub fn deinit(self: *Receiver) Error!void {
        if (self.handle) |handle| {
            try ffi.check(raw.OH_ImageReceiverNative_Release(handle));
            self.handle = null;
        }
    }
    pub fn create(size: raw.Image_Size, capacity: i32) Error!Receiver {
        if (size.width == 0 or size.height == 0 or capacity <= 0) return error.InvalidArgument;
        var options: ?*raw.OH_ImageReceiverOptions = null;
        try ffi.check(raw.OH_ImageReceiverOptions_Create(&options));
        defer _ = raw.OH_ImageReceiverOptions_Release(options);
        try ffi.check(raw.OH_ImageReceiverOptions_SetSize(options, size));
        try ffi.check(raw.OH_ImageReceiverOptions_SetCapacity(options, capacity));
        var handle: ?*raw.OH_ImageReceiverNative = null;
        try ffi.check(raw.OH_ImageReceiverNative_Create(options, &handle));
        return .{ .handle = handle orelse return error.UnexpectedNull };
    }
    pub fn surfaceId(self: Receiver) Error!u64 {
        var id: u64 = 0;
        try ffi.check(raw.OH_ImageReceiverNative_GetReceivingSurfaceId(try self.ptr(), &id));
        return id;
    }
    /// Release every acquired image before releasing the receiver.
    pub fn readLatest(self: Receiver) Error!Image {
        var handle: ?*raw.OH_ImageNative = null;
        try ffi.check(raw.OH_ImageReceiverNative_ReadLatestImage(try self.ptr(), &handle));
        return .{ .handle = handle orelse return error.UnexpectedNull };
    }
};
pub const Image = struct {
    handle: ?*raw.OH_ImageNative,
    pub fn ptr(self: Image) Error!*raw.OH_ImageNative {
        return self.handle orelse error.InvalidHandle;
    }
    pub fn deinit(self: *Image) Error!void {
        if (self.handle) |handle| {
            try ffi.check(raw.OH_ImageNative_Release(handle));
            self.handle = null;
        }
    }
    pub fn fromOwned(handle: *raw.OH_ImageNative) Image {
        return .{ .handle = handle };
    }
    pub fn size(self: Image) Error!raw.Image_Size {
        var value: raw.Image_Size = undefined;
        try ffi.check(raw.OH_ImageNative_GetImageSize(try self.ptr(), &value));
        return value;
    }
    pub fn timestamp(self: Image) Error!i64 {
        var value: i64 = 0;
        try ffi.check(raw.OH_ImageNative_GetTimestamp(try self.ptr(), &value));
        return value;
    }
};
