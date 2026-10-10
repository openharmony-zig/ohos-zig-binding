const ffi = @import("ohos_zig_binding_ffi");
pub const raw = @import("display_sys");
pub const Error = ffi.Error;

pub fn getDefaultDisplayId() Error!u64 {
    var value: u64 = 0;
    try ffi.check(raw.OH_NativeDisplayManager_GetDefaultDisplayId(&value));
    return value;
}

pub fn getDefaultDisplayWidth() Error!i32 {
    var value: i32 = 0;
    try ffi.check(raw.OH_NativeDisplayManager_GetDefaultDisplayWidth(&value));
    return value;
}

pub fn getDefaultDisplayHeight() Error!i32 {
    var value: i32 = 0;
    try ffi.check(raw.OH_NativeDisplayManager_GetDefaultDisplayHeight(&value));
    return value;
}

pub fn getDefaultDisplayRotation() Error!raw.NativeDisplayManager_Rotation {
    var value: raw.NativeDisplayManager_Rotation = 0;
    try ffi.check(raw.OH_NativeDisplayManager_GetDefaultDisplayRotation(&value));
    return value;
}

pub fn getDefaultDisplayOrientation() Error!raw.NativeDisplayManager_Orientation {
    var value: raw.NativeDisplayManager_Orientation = 0;
    try ffi.check(raw.OH_NativeDisplayManager_GetDefaultDisplayOrientation(&value));
    return value;
}

pub fn getDefaultDisplayVirtualPixelRatio() Error!f32 {
    var value: f32 = 0;
    try ffi.check(raw.OH_NativeDisplayManager_GetDefaultDisplayVirtualPixelRatio(&value));
    return value;
}

pub fn getDefaultDisplayRefreshRate() Error!u32 {
    var value: u32 = 0;
    try ffi.check(raw.OH_NativeDisplayManager_GetDefaultDisplayRefreshRate(&value));
    return value;
}

pub fn getDefaultDisplayDensityDpi() Error!i32 {
    var value: i32 = 0;
    try ffi.check(raw.OH_NativeDisplayManager_GetDefaultDisplayDensityDpi(&value));
    return value;
}

pub fn getDefaultDisplayDensityPixels() Error!f32 {
    var value: f32 = 0;
    try ffi.check(raw.OH_NativeDisplayManager_GetDefaultDisplayDensityPixels(&value));
    return value;
}

pub fn getDefaultDisplayScaledDensity() Error!f32 {
    var value: f32 = 0;
    try ffi.check(raw.OH_NativeDisplayManager_GetDefaultDisplayScaledDensity(&value));
    return value;
}

pub fn getDefaultDisplayDensityXdpi() Error!f32 {
    var value: f32 = 0;
    try ffi.check(raw.OH_NativeDisplayManager_GetDefaultDisplayDensityXdpi(&value));
    return value;
}

pub fn getDefaultDisplayDensityYdpi() Error!f32 {
    var value: f32 = 0;
    try ffi.check(raw.OH_NativeDisplayManager_GetDefaultDisplayDensityYdpi(&value));
    return value;
}

pub fn isFoldable() bool {
    return raw.OH_NativeDisplayManager_IsFoldable();
}
pub fn getFoldDisplayMode() Error!raw.NativeDisplayManager_FoldDisplayMode {
    var value: raw.NativeDisplayManager_FoldDisplayMode = 0;
    try ffi.check(raw.OH_NativeDisplayManager_GetFoldDisplayMode(&value));
    return value;
}

pub const CutoutInfo = struct {
    handle: ?*raw.NativeDisplayManager_CutoutInfo,
    pub fn create() Error!CutoutInfo {
        var handle: ?*raw.NativeDisplayManager_CutoutInfo = null;
        try ffi.check(raw.OH_NativeDisplayManager_CreateDefaultDisplayCutoutInfo(&handle));
        return .{ .handle = handle orelse return error.UnexpectedNull };
    }
    /// Borrowed until deinit.
    pub fn value(self: CutoutInfo) Error!*const raw.NativeDisplayManager_CutoutInfo {
        return self.handle orelse error.InvalidHandle;
    }
    pub fn deinit(self: *CutoutInfo) Error!void {
        const handle = self.handle orelse return;
        try ffi.check(raw.OH_NativeDisplayManager_DestroyDefaultDisplayCutoutInfo(handle));
        self.handle = null;
    }
};

/// Listener owner. Callback code must outlive registration; deinit unregisters.
pub const DisplayListener = struct {
    index: ?u32,
    pub fn register(callback: *const fn (u64) callconv(.c) void) Error!DisplayListener {
        var index: u32 = 0;
        try ffi.check(raw.OH_NativeDisplayManager_RegisterDisplayChangeListener(callback, &index));
        return .{ .index = index };
    }
    pub fn deinit(self: *DisplayListener) Error!void {
        if (self.index) |index| {
            try ffi.check(raw.OH_NativeDisplayManager_UnregisterDisplayChangeListener(index));
            self.index = null;
        }
    }
};

pub const FoldModeListener = struct {
    index: ?u32,
    pub fn register(callback: *const fn (raw.NativeDisplayManager_FoldDisplayMode) callconv(.c) void) Error!FoldModeListener {
        var index: u32 = 0;
        try ffi.check(raw.OH_NativeDisplayManager_RegisterFoldDisplayModeChangeListener(callback, &index));
        return .{ .index = index };
    }
    pub fn deinit(self: *FoldModeListener) Error!void {
        if (self.index) |index| {
            try ffi.check(raw.OH_NativeDisplayManager_UnregisterFoldDisplayModeChangeListener(index));
            self.index = null;
        }
    }
};
