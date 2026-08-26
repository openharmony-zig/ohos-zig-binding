const std = @import("std");
const api = @import("ohos_zig_binding_api");

pub const raw = @import("native_vsync_sys");

pub const NativeVSyncError = error{
    AlreadyReleased,
    CreateFailed,
    InvalidName,
    InvalidRateRange,
    InvalidSurfaceId,
    NativeCallFailed,
    RequestInFlight,
};

pub const ExpectedRateRange = extern struct {
    min: i32,
    max: i32,
    expected: i32,

    fn isValid(self: ExpectedRateRange) bool {
        return self.min > 0 and self.max >= self.min and
            self.expected >= self.min and self.expected <= self.max;
    }
};

/// Called once for the requested frame. The callback must not deinitialize or
/// otherwise re-enter the `NativeVSync` that owns the request.
pub const FrameCallback = *const fn (timestamp: i64, context: ?*anyopaque) void;

const Core = struct {
    allocator: std.mem.Allocator,
    refs: std.atomic.Value(usize) = .init(1),
    mutex: std.Io.Mutex = .init,
    handle: ?*raw.OH_NativeVSync,
    request_in_flight: bool = false,

    fn retain(self: *Core) void {
        _ = self.refs.fetchAdd(1, .monotonic);
    }

    fn release(self: *Core) void {
        const previous = self.refs.fetchSub(1, .acq_rel);
        std.debug.assert(previous != 0);
        if (previous == 1) self.allocator.destroy(self);
    }

    fn lock(self: *Core) void {
        self.mutex.lockUncancelable(std.Options.debug_io);
    }

    fn unlock(self: *Core) void {
        self.mutex.unlock(std.Options.debug_io);
    }
};

const FrameRequest = struct {
    core: *Core,
    callback: FrameCallback,
    context: ?*anyopaque,
};

/// An owning `OH_NativeVSync` connection.
///
/// This value is not implicitly copy-safe. Move it between owners and call
/// `deinit` exactly once. In-flight requests keep their liveness state alive;
/// a callback delivered after `deinit` becomes a no-op.
pub const NativeVSync = struct {
    core: ?*Core,

    pub fn create(
        allocator: std.mem.Allocator,
        name: []const u8,
    ) (std.mem.Allocator.Error || NativeVSyncError)!NativeVSync {
        const length = try nameLength(name);
        return initFromRaw(
            allocator,
            raw.OH_NativeVSync_Create(@ptrCast(name.ptr), length),
        );
    }

    pub fn createForAssociatedWindow(
        allocator: std.mem.Allocator,
        surface_id: u64,
        name: []const u8,
    ) (std.mem.Allocator.Error || NativeVSyncError)!NativeVSync {
        comptime api.require("native_vsync.NativeVSync.createForAssociatedWindow", 14);
        if (surface_id == 0) return error.InvalidSurfaceId;
        const length = try nameLength(name);
        return initFromRaw(
            allocator,
            raw.OH_NativeVSync_Create_ForAssociatedWindow(
                surface_id,
                @ptrCast(name.ptr),
                length,
            ),
        );
    }

    /// Requests one callback on the next VSync signal.
    ///
    /// The callback context is borrowed and must remain valid until either the
    /// callback runs or this connection has been deinitialized.
    pub fn requestFrame(
        self: *const NativeVSync,
        callback: FrameCallback,
        context: ?*anyopaque,
    ) (std.mem.Allocator.Error || NativeVSyncError)!void {
        const core = self.core orelse return error.AlreadyReleased;
        const request = try core.allocator.create(FrameRequest);
        request.* = .{
            .core = core,
            .callback = callback,
            .context = context,
        };
        core.retain();
        errdefer {
            core.release();
            core.allocator.destroy(request);
        }

        core.lock();
        defer core.unlock();
        const handle = core.handle orelse return error.AlreadyReleased;
        if (core.request_in_flight) return error.RequestInFlight;
        core.request_in_flight = true;
        if (raw.OH_NativeVSync_RequestFrame(
            handle,
            onNativeFrame,
            @ptrCast(request),
        ) != 0) {
            core.request_in_flight = false;
            return error.NativeCallFailed;
        }
    }

    pub fn period(self: *const NativeVSync) NativeVSyncError!i64 {
        const core = self.core orelse return error.AlreadyReleased;
        core.lock();
        defer core.unlock();
        const handle = core.handle orelse return error.AlreadyReleased;
        var result: i64 = 0;
        if (raw.OH_NativeVSync_GetPeriod(handle, &result) != 0) {
            return error.NativeCallFailed;
        }
        return result;
    }

    pub fn setExpectedFrameRateRange(
        self: *const NativeVSync,
        range: ExpectedRateRange,
    ) NativeVSyncError!void {
        comptime api.require("native_vsync.NativeVSync.setExpectedFrameRateRange", 20);
        if (!range.isValid()) return error.InvalidRateRange;
        const core = self.core orelse return error.AlreadyReleased;
        core.lock();
        defer core.unlock();
        const handle = core.handle orelse return error.AlreadyReleased;
        var native_range = raw.OH_NativeVSync_ExpectedRateRange{
            .min = range.min,
            .max = range.max,
            .expected = range.expected,
        };
        if (raw.OH_NativeVSync_SetExpectedFrameRateRange(handle, &native_range) != 0) {
            return error.NativeCallFailed;
        }
    }

    pub fn deinit(self: *NativeVSync) void {
        const core = self.core orelse return;
        self.core = null;
        core.lock();
        const handle = core.handle;
        core.handle = null;
        core.unlock();
        if (handle) |value| raw.OH_NativeVSync_Destroy(value);
        core.release();
    }
};

fn initFromRaw(
    allocator: std.mem.Allocator,
    handle: ?*raw.OH_NativeVSync,
) (std.mem.Allocator.Error || NativeVSyncError)!NativeVSync {
    const resolved = handle orelse return error.CreateFailed;
    const core = allocator.create(Core) catch |err| {
        raw.OH_NativeVSync_Destroy(resolved);
        return err;
    };
    core.* = .{
        .allocator = allocator,
        .handle = resolved,
    };
    return .{ .core = core };
}

fn nameLength(name: []const u8) NativeVSyncError!u32 {
    if (name.len == 0 or std.mem.indexOfScalar(u8, name, 0) != null) {
        return error.InvalidName;
    }
    return std.math.cast(u32, name.len) orelse error.InvalidName;
}

fn onNativeFrame(timestamp: i64, context_ptr: ?*anyopaque) callconv(.c) void {
    const request: *FrameRequest = @ptrCast(@alignCast(context_ptr orelse return));
    const core = request.core;
    defer {
        core.allocator.destroy(request);
        core.release();
    }

    core.lock();
    defer core.unlock();
    core.request_in_flight = false;
    if (core.handle == null) return;
    request.callback(timestamp, request.context);
}

test "native vsync rejects invalid names" {
    try std.testing.expectError(error.InvalidName, nameLength(""));
    try std.testing.expectError(error.InvalidName, nameLength("bad\x00name"));
}

test "expected frame rate range validates ordering" {
    try std.testing.expect((ExpectedRateRange{ .min = 30, .max = 120, .expected = 60 }).isValid());
    try std.testing.expect(!(ExpectedRateRange{ .min = 0, .max = 120, .expected = 60 }).isValid());
    try std.testing.expect(!(ExpectedRateRange{ .min = 60, .max = 30, .expected = 60 }).isValid());
    try std.testing.expect(!(ExpectedRateRange{ .min = 30, .max = 120, .expected = 144 }).isValid());
}
