const ffi = @import("ohos_zig_binding_ffi");
pub const raw = @import("native_display_soloist_sys");
pub const Error = ffi.Error;
pub const ExpectedRateRange = raw.DisplaySoloist_ExpectedRateRange;
pub const FrameCallback = *const fn (i64, i64, ?*anyopaque) callconv(.c) void;

/// Move-only owner. Serialize control operations; do not stop/destroy from the
/// frame callback. Callback data must remain alive until stop returns.
pub const DisplaySoloist = struct {
    handle: ?*raw.OH_DisplaySoloist,
    running: bool = false,

    pub fn create(exclusive_thread: bool) Error!DisplaySoloist {
        return .{ .handle = raw.OH_DisplaySoloist_Create(exclusive_thread) orelse return error.UnexpectedNull };
    }

    pub fn setExpectedFrameRateRange(self: *DisplaySoloist, range: ExpectedRateRange) Error!void {
        if (range.min > range.expected or range.expected > range.max or range.max == 0) return error.InvalidArgument;
        var value = range;
        try ffi.check(raw.OH_DisplaySoloist_SetExpectedFrameRateRange(self.handle orelse return error.InvalidHandle, &value));
    }

    pub fn start(self: *DisplaySoloist, callback: FrameCallback, context: ?*anyopaque) Error!void {
        try self.stop();
        try ffi.check(raw.OH_DisplaySoloist_Start(self.handle orelse return error.InvalidHandle, callback, context));
        self.running = true;
    }

    pub fn stop(self: *DisplaySoloist) Error!void {
        if (!self.running) return;
        try ffi.check(raw.OH_DisplaySoloist_Stop(self.handle orelse return error.InvalidHandle));
        self.running = false;
    }

    /// On failure the owner remains valid so teardown can be retried.
    pub fn deinit(self: *DisplaySoloist) Error!void {
        const handle = self.handle orelse return;
        try self.stop();
        try ffi.check(raw.OH_DisplaySoloist_Destroy(handle));
        self.handle = null;
    }
};
