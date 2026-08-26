const std = @import("std");

pub const raw = @import("native_window_sys");
pub const types = @import("types.zig");

pub const Region = types.Region;
pub const Operation = types.Operation;
pub const NativeBufferFormat = types.NativeBufferFormat;
pub const NativeBufferConfig = raw.OH_NativeBuffer_Config;

pub const NativeWindowError = error{
    InvalidWindow,
    InvalidBuffer,
    InvalidGeometry,
    UnsupportedFormat,
    ReferenceFailed,
    NativeCallFailed,
    FenceWaitFailed,
    FenceTimeout,
    BufferMapFailed,
    AlreadyReleased,
};

/// A referenced `OHNativeWindow`.
///
/// This handle is intentionally not implicitly copy-safe. Call `clone` when a
/// second owner is needed, and call `deinit` exactly once for each owner.
pub const NativeWindow = struct {
    handle: ?*raw.OHNativeWindow,

    /// Creates an owner from a borrowed native-window pointer by incrementing
    /// its native reference count.
    pub fn cloneFromPtr(window: ?*anyopaque) NativeWindowError!NativeWindow {
        const window_ptr = window orelse return error.InvalidWindow;
        if (raw.OH_NativeWindow_NativeObjectReference(window_ptr) != 0) {
            return error.ReferenceFailed;
        }
        return .{ .handle = @ptrCast(window_ptr) };
    }

    pub fn clone(self: *const NativeWindow) NativeWindowError!NativeWindow {
        return cloneFromPtr(@ptrCast(try self.requireHandle()));
    }

    pub fn rawHandle(self: *const NativeWindow) ?*raw.OHNativeWindow {
        return self.handle;
    }

    pub fn deinit(self: *NativeWindow) void {
        const window = self.handle orelse return;
        self.handle = null;
        _ = raw.OH_NativeWindow_NativeObjectUnreference(@ptrCast(window));
    }

    pub fn setBufferGeometry(
        self: *const NativeWindow,
        width: i32,
        height: i32,
    ) NativeWindowError!void {
        const window = try self.requireHandle();
        const result = raw.OH_NativeWindow_NativeWindowHandleOpt(
            window,
            Operation.set_buffer_geometry.intoI32(),
            width,
            height,
        );
        if (result != 0) return error.NativeCallFailed;
    }

    /// Returns the surface ID used to associate frame scheduling with this
    /// native window.
    pub fn surfaceId(self: *const NativeWindow) NativeWindowError!u64 {
        const window = try self.requireHandle();
        var surface_id: u64 = 0;
        if (raw.OH_NativeWindow_GetSurfaceId(window, &surface_id) != 0 or surface_id == 0) {
            return error.NativeCallFailed;
        }
        return surface_id;
    }

    /// Dequeues, fence-waits, maps, and validates one writable window buffer.
    ///
    /// The returned buffer borrows `self`; keep this `NativeWindow` alive and
    /// at a stable address until the buffer is flushed or aborted.
    pub fn requestBuffer(
        self: *NativeWindow,
        region: ?Region,
    ) NativeWindowError!NativeWindowBuffer {
        const window = try self.requireHandle();
        var window_buffer: ?*raw.OHNativeWindowBuffer = null;
        var release_fence_fd: c_int = -1;
        const request_result = raw.OH_NativeWindow_NativeWindowRequestBuffer(
            window,
            &window_buffer,
            &release_fence_fd,
        );
        if (request_result != 0) {
            closeFence(release_fence_fd);
            return error.NativeCallFailed;
        }

        const dequeued = window_buffer orelse {
            closeFence(release_fence_fd);
            return error.InvalidBuffer;
        };
        errdefer _ = raw.OH_NativeWindow_NativeWindowAbortBuffer(window, dequeued);

        try waitForReleaseFence(release_fence_fd);

        var native_buffer: ?*raw.OH_NativeBuffer = null;
        if (raw.OH_NativeBuffer_FromNativeWindowBuffer(dequeued, &native_buffer) != 0) {
            return error.NativeCallFailed;
        }
        const mapped_buffer = native_buffer orelse return error.InvalidBuffer;

        if (raw.OH_NativeBuffer_Reference(mapped_buffer) != 0) {
            return error.ReferenceFailed;
        }
        var owns_native_reference = true;
        errdefer if (owns_native_reference) {
            _ = raw.OH_NativeBuffer_Unreference(mapped_buffer);
        };

        var config: NativeBufferConfig = undefined;
        raw.OH_NativeBuffer_GetConfig(mapped_buffer, &config);

        const format = NativeBufferFormat.fromRaw(config.format);
        const bytes_per_pixel = format.bytesPerPixel();
        if (bytes_per_pixel == 0) return error.UnsupportedFormat;

        const width = positiveUsize(config.width) orelse return error.InvalidGeometry;
        const height = positiveUsize(config.height) orelse return error.InvalidGeometry;
        const stride_bytes = positiveUsize(config.stride) orelse return error.InvalidGeometry;
        const visible_bytes = std.math.mul(usize, width, bytes_per_pixel) catch
            return error.InvalidGeometry;
        if (stride_bytes % bytes_per_pixel != 0 or stride_bytes < visible_bytes) {
            return error.InvalidGeometry;
        }
        const byte_len = std.math.mul(usize, stride_bytes, height) catch
            return error.InvalidGeometry;

        var address: ?*anyopaque = null;
        if (raw.OH_NativeBuffer_Map(mapped_buffer, &address) != 0) {
            return error.BufferMapFailed;
        }
        const mapped_address = address orelse {
            _ = raw.OH_NativeBuffer_Unmap(mapped_buffer);
            return error.BufferMapFailed;
        };

        owns_native_reference = false;
        return .{
            .window = self,
            .window_buffer = dequeued,
            .native_buffer = mapped_buffer,
            .address = @ptrCast(mapped_address),
            .byte_len = byte_len,
            .buffer_width = width,
            .buffer_height = height,
            .stride_pixels = stride_bytes / bytes_per_pixel,
            .stride_bytes = stride_bytes,
            .buffer_format = format,
            .region = region,
            .active = true,
        };
    }

    fn requireHandle(self: *const NativeWindow) NativeWindowError!*raw.OHNativeWindow {
        return self.handle orelse error.InvalidWindow;
    }
};

/// A mapped dequeued buffer.
///
/// Call `flush` to observe submission errors, or use `defer buffer.deinit()`
/// for reference-style automatic flushing. Call `abort` when pixels should not
/// be submitted.
pub const NativeWindowBuffer = struct {
    window: *NativeWindow,
    window_buffer: *raw.OHNativeWindowBuffer,
    native_buffer: *raw.OH_NativeBuffer,
    address: [*]u8,
    byte_len: usize,
    buffer_width: usize,
    buffer_height: usize,
    stride_pixels: usize,
    stride_bytes: usize,
    buffer_format: NativeBufferFormat,
    region: ?Region,
    active: bool,

    pub fn width(self: *const NativeWindowBuffer) usize {
        return self.buffer_width;
    }

    pub fn height(self: *const NativeWindowBuffer) usize {
        return self.buffer_height;
    }

    /// Number of pixels occupied by one in-memory row, including padding.
    pub fn stride(self: *const NativeWindowBuffer) usize {
        return self.stride_pixels;
    }

    pub fn format(self: *const NativeWindowBuffer) NativeBufferFormat {
        return self.buffer_format;
    }

    pub fn bits(self: *NativeWindowBuffer) *anyopaque {
        return @ptrCast(self.address);
    }

    pub fn bytes(self: *NativeWindowBuffer) []u8 {
        return self.address[0..self.byte_len];
    }

    pub fn lines(self: *NativeWindowBuffer) LineIterator {
        return .{ .buffer = self };
    }

    pub fn flush(self: *NativeWindowBuffer) NativeWindowError!void {
        if (!self.active) return error.AlreadyReleased;
        self.active = false;

        const unmap_result = raw.OH_NativeBuffer_Unmap(self.native_buffer);
        _ = raw.OH_NativeBuffer_Unreference(self.native_buffer);

        const window = self.window.rawHandle() orelse return error.InvalidWindow;
        var native_region: raw.Region = .{};
        var rect: Region = undefined;
        if (self.region) |region| {
            rect = region;
            native_region = .{ .rects = @ptrCast(&rect), .rectNumber = 1 };
        }

        const flush_result = raw.OH_NativeWindow_NativeWindowFlushBuffer(
            window,
            self.window_buffer,
            -1,
            native_region,
        );
        if (unmap_result != 0 or flush_result != 0) return error.NativeCallFailed;
    }

    pub fn abort(self: *NativeWindowBuffer) NativeWindowError!void {
        if (!self.active) return error.AlreadyReleased;
        self.active = false;

        const unmap_result = raw.OH_NativeBuffer_Unmap(self.native_buffer);
        _ = raw.OH_NativeBuffer_Unreference(self.native_buffer);
        const window = self.window.rawHandle() orelse return error.InvalidWindow;
        const abort_result = raw.OH_NativeWindow_NativeWindowAbortBuffer(
            window,
            self.window_buffer,
        );
        if (unmap_result != 0 or abort_result != 0) return error.NativeCallFailed;
    }

    /// Flushes an active buffer and ignores the native submission status.
    pub fn deinit(self: *NativeWindowBuffer) void {
        if (!self.active) return;
        self.flush() catch {};
    }

    pub const LineIterator = struct {
        buffer: *NativeWindowBuffer,
        row: usize = 0,

        pub fn next(self: *LineIterator) ?[]u8 {
            if (self.row >= self.buffer.buffer_height) return null;
            const start = self.row * self.buffer.stride_bytes;
            const visible_len =
                self.buffer.buffer_width * self.buffer.buffer_format.bytesPerPixel();
            self.row += 1;
            return self.buffer.address[start .. start + visible_len];
        }
    };
};

fn waitForReleaseFence(fd: c_int) NativeWindowError!void {
    if (fd < 0) return;
    defer _ = std.os.linux.close(fd);

    var descriptors = [1]std.os.linux.pollfd{.{
        .fd = fd,
        .events = std.os.linux.POLL.IN,
        .revents = 0,
    }};
    while (true) {
        const result = std.os.linux.poll(&descriptors, descriptors.len, 3000);
        switch (std.posix.errno(result)) {
            .SUCCESS => {
                if (result == 0) return error.FenceTimeout;
                return;
            },
            .INTR => continue,
            else => return error.FenceWaitFailed,
        }
    }
}

fn closeFence(fd: c_int) void {
    if (fd >= 0) _ = std.os.linux.close(fd);
}

fn positiveUsize(value: i32) ?usize {
    if (value <= 0) return null;
    return @intCast(value);
}

test {
    std.testing.refAllDecls(@This());
}
