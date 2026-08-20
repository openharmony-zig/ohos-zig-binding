const std = @import("std");
const features = @import("ohos_zig_binding_features");

pub const raw = @import("xcomponent_sys");
pub const types = @import("types.zig");
const napi = if (features.xcomponent_napi)
    @import("xcomponent_napi")
else
    struct {};

pub const ResultCode = types.ResultCode;
pub const Action = types.Action;
pub const EventSource = types.EventSource;
pub const KeyCode = types.KeyCode;
pub const MouseAction = types.MouseAction;
pub const MouseButton = types.MouseButton;
pub const TouchEvent = types.TouchEvent;
pub const TouchPointTool = types.TouchPointTool;
pub const XComponentSize = types.XComponentSize;
pub const XComponentOffset = types.XComponentOffset;
pub const TouchPointData = types.TouchPointData;
pub const TouchEventData = types.TouchEventData;
pub const MouseEventData = types.MouseEventData;
pub const KeyEventData = types.KeyEventData;
pub const max_touch_points = types.max_touch_points;
pub const max_id_len = types.max_id_len;

pub const XComponentError = error{
    InvalidComponent,
    InvalidWindow,
    BufferTooSmall,
    InvalidNativeResponse,
    NativeCallFailed,
    NapiCallFailed,
    MultiComponentCallbacksUnsupported,
};

pub const Env = if (features.xcomponent_napi) napi.Env else void;
pub const Object = if (features.xcomponent_napi) napi.Object else void;
pub const UIInputEventRaw = *raw.ArkUI_UIInputEvent;

/// Raw native-window handle supplied by an XComponent callback.
pub const WindowRaw = struct {
    handle: *anyopaque,

    pub fn init(window: ?*anyopaque) XComponentError!WindowRaw {
        return .{ .handle = window orelse return error.InvalidWindow };
    }

    pub fn rawHandle(self: WindowRaw) *anyopaque {
        return self.handle;
    }
};

pub const RawWindow = WindowRaw;

/// Raw `OH_NativeXComponent` handle with the read-only geometry helpers from
/// the reference binding.
pub const XComponentRaw = struct {
    handle: *raw.OH_NativeXComponent,

    pub fn init(component: ?*raw.OH_NativeXComponent) XComponentError!XComponentRaw {
        return .{ .handle = component orelse return error.InvalidComponent };
    }

    pub fn rawHandle(self: XComponentRaw) *raw.OH_NativeXComponent {
        return self.handle;
    }

    pub fn size(self: XComponentRaw, window: WindowRaw) XComponentError!XComponentSize {
        var width: u64 = 0;
        var height: u64 = 0;
        try check(raw.OH_NativeXComponent_GetXComponentSize(
            self.handle,
            window.handle,
            &width,
            &height,
        ));
        return .{ .width = width, .height = height };
    }

    pub fn offset(self: XComponentRaw, window: WindowRaw) XComponentError!XComponentOffset {
        var x: f64 = 0;
        var y: f64 = 0;
        try check(raw.OH_NativeXComponent_GetXComponentOffset(
            self.handle,
            window.handle,
            &x,
            &y,
        ));
        return .{ .x = x, .y = y };
    }
};

pub const SurfaceCallback = *const fn (
    context: ?*anyopaque,
    component: XComponentRaw,
    window: WindowRaw,
) void;

pub const TouchCallback = *const fn (
    context: ?*anyopaque,
    component: XComponentRaw,
    window: WindowRaw,
    event: TouchEventData,
) void;

pub const FrameCallback = *const fn (
    context: ?*anyopaque,
    component: XComponentRaw,
    timestamp: u64,
    target_timestamp: u64,
) void;

pub const KeyCallback = *const fn (
    context: ?*anyopaque,
    component: XComponentRaw,
    window: WindowRaw,
    event: KeyEventData,
) void;

pub const MouseCallback = *const fn (
    context: ?*anyopaque,
    component: XComponentRaw,
    window: WindowRaw,
    event: MouseEventData,
) void;

pub const HoverCallback = *const fn (
    context: ?*anyopaque,
    component: XComponentRaw,
    is_hover: bool,
) void;

pub const UIInputCallback = *const fn (
    context: ?*anyopaque,
    component: XComponentRaw,
    event: UIInputEventRaw,
    event_type: raw.ArkUI_UIInputEvent_Type,
) void;

pub const ErrorCallback = *const fn (
    context: ?*anyopaque,
    component: XComponentRaw,
    result: ResultCode,
) void;

/// Managed callbacks for one XComponent on the current thread.
///
/// Like the reference binding's default mode, only one component can own a
/// managed callback set per thread. Use `registerNativeCallback` and the other
/// raw registration methods when the application needs a custom multi-instance
/// dispatcher.
pub const Callbacks = struct {
    context: ?*anyopaque = null,
    on_surface_created: ?SurfaceCallback = null,
    on_surface_changed: ?SurfaceCallback = null,
    on_surface_destroyed: ?SurfaceCallback = null,
    on_touch_event: ?TouchCallback = null,
    on_frame: ?FrameCallback = null,
    on_key_event: ?KeyCallback = null,
    on_mouse_event: ?MouseCallback = null,
    on_hover_event: ?HoverCallback = null,
    on_ui_input_event: ?UIInputCallback = null,
    on_error: ?ErrorCallback = null,
};

const ManagedRegistration = struct {
    component: XComponentRaw,
    callbacks: Callbacks,
    window: ?WindowRaw = null,
};

threadlocal var managed_registration: ?ManagedRegistration = null;

var native_callbacks: raw.OH_NativeXComponent_Callback = .{
    .OnSurfaceCreated = onSurfaceCreated,
    .OnSurfaceChanged = onSurfaceChanged,
    .OnSurfaceDestroyed = onSurfaceDestroyed,
    .DispatchTouchEvent = dispatchTouchEvent,
};

var native_mouse_callbacks: raw.OH_NativeXComponent_MouseEvent_Callback = .{
    .DispatchMouseEvent = dispatchMouseEvent,
    .DispatchHoverEvent = dispatchHoverEvent,
};

/// Non-owning safe wrapper over `OH_NativeXComponent`.
pub const NativeXComponent = struct {
    component: XComponentRaw,

    pub fn fromRaw(component: ?*raw.OH_NativeXComponent) XComponentError!NativeXComponent {
        return .{ .component = try .init(component) };
    }

    /// Resolves `__NATIVE_XCOMPONENT_OBJ__` from zig-napi exports.
    ///
    /// Requires the `xcomponent_napi` build feature. The generic parameters
    /// deliberately defer zig-napi type checking until this function is used,
    /// so the core module remains importable while the feature is disabled.
    pub fn init(env: anytype, exports: anytype) XComponentError!NativeXComponent {
        if (features.xcomponent_napi) {
            comptime {
                if (@TypeOf(env) != napi.Env or @TypeOf(exports) != napi.Object) {
                    @compileError(
                        "xcomponent.XComponent.init expects zig-napi Env and Object values",
                    );
                }
            }

            return initRaw(@ptrCast(env.raw), @ptrCast(exports.raw));
        } else {
            @compileError(
                "xcomponent N-API integration is disabled; pass " ++
                    ".xcomponent_napi = true to the ohos_zig_binding dependency",
            );
        }
    }

    /// Resolves the native XComponent from opaque N-API handles.
    ///
    /// This keeps N-API's low-level ABI inside the binding while allowing a
    /// consumer to use a separately composed zig-napi module instance.
    pub fn initRaw(env: ?*anyopaque, exports: ?*anyopaque) XComponentError!NativeXComponent {
        if (!features.xcomponent_napi) {
            return error.NapiCallFailed;
        }
        const sys = napi.napi_sys.napi_sys;
        const native_xcomponent_object_name: [*:0]const u8 =
            "__NATIVE_XCOMPONENT_OBJ__";

        var exported_component: sys.napi_value = undefined;
        if (sys.napi_get_named_property(
            @ptrCast(env),
            @ptrCast(exports),
            native_xcomponent_object_name,
            &exported_component,
        ) != sys.napi_ok) {
            return error.NapiCallFailed;
        }

        var instance: ?*anyopaque = null;
        if (sys.napi_unwrap(@ptrCast(env), exported_component, &instance) != sys.napi_ok) {
            return error.NapiCallFailed;
        }
        return fromRaw(@ptrCast(instance orelse return error.InvalidComponent));
    }

    pub fn rawHandle(self: NativeXComponent) *raw.OH_NativeXComponent {
        return self.component.handle;
    }

    /// Writes the component ID into caller-owned storage.
    ///
    /// A `[max_id_len + 1]u8` buffer accepts every valid XComponent ID.
    pub fn id(self: NativeXComponent, buffer: []u8) XComponentError![]const u8 {
        if (buffer.len == 0) return error.BufferTooSmall;

        var id_len: u64 = buffer.len;
        try check(raw.OH_NativeXComponent_GetXComponentId(
            self.rawHandle(),
            buffer.ptr,
            &id_len,
        ));
        const len: usize = std.math.cast(usize, id_len) orelse
            return error.InvalidNativeResponse;
        if (len > buffer.len) return error.InvalidNativeResponse;
        return std.mem.trimEnd(u8, buffer[0..len], "\x00");
    }

    pub fn idAlloc(
        self: NativeXComponent,
        allocator: std.mem.Allocator,
    ) (std.mem.Allocator.Error || XComponentError)![]u8 {
        const storage = try allocator.alloc(u8, max_id_len + 1);
        errdefer allocator.free(storage);
        const resolved = try self.id(storage);
        return try allocator.realloc(storage, resolved.len);
    }

    pub fn size(
        self: NativeXComponent,
        window: WindowRaw,
    ) XComponentError!XComponentSize {
        return self.component.size(window);
    }

    pub fn offset(
        self: NativeXComponent,
        window: WindowRaw,
    ) XComponentError!XComponentOffset {
        return self.component.offset(window);
    }

    pub fn nativeWindow(self: NativeXComponent) ?RawWindow {
        const registration = managedRegistration(self.rawHandle()) orelse return null;
        return registration.window;
    }

    pub fn setFrameRate(
        self: NativeXComponent,
        min: i32,
        max: i32,
        expected: i32,
    ) XComponentError!void {
        var range: raw.OH_NativeXComponent_ExpectedRateRange = .{
            .min = min,
            .max = max,
            .expected = expected,
        };
        try check(raw.OH_NativeXComponent_SetExpectedFrameRateRange(
            self.rawHandle(),
            &range,
        ));
    }

    /// Registers all configured managed callbacks.
    pub fn registerCallback(
        self: NativeXComponent,
        callbacks: Callbacks,
    ) XComponentError!void {
        if (managed_registration) |registration| {
            if (registration.component.handle != self.rawHandle()) {
                return error.MultiComponentCallbacksUnsupported;
            }
        }
        managed_registration = .{
            .component = self.component,
            .callbacks = callbacks,
        };
        errdefer managed_registration = null;

        try self.registerNativeCallback(&native_callbacks);

        if (callbacks.on_mouse_event != null or callbacks.on_hover_event != null) {
            try self.registerNativeMouseEventCallback(&native_mouse_callbacks);
        }
        if (callbacks.on_key_event != null) {
            try self.registerNativeKeyEventCallback(onKeyEvent);
        }
        if (callbacks.on_frame != null) {
            try self.registerNativeOnFrameCallback(onFrame);
        }
        if (callbacks.on_ui_input_event != null) {
            try self.registerNativeUIInputEventCallback(
                onUIInputEvent,
                @intCast(raw.ARKUI_UIINPUTEVENT_TYPE_AXIS),
            );
        }
    }

    pub fn registerCallbacks(
        self: NativeXComponent,
        callbacks: Callbacks,
    ) XComponentError!void {
        return self.registerCallback(callbacks);
    }

    /// Clears the managed callback set. Native lifecycle callbacks remain
    /// installed as no-ops because the NDK has no matching unregister API.
    pub fn clearCallbacks(self: NativeXComponent) XComponentError!void {
        if (managedRegistration(self.rawHandle())) |registration| {
            if (registration.callbacks.on_frame != null) {
                try self.unregisterOnFrameCallback();
            }
            managed_registration = null;
        }
    }

    pub fn registerNativeCallback(
        self: NativeXComponent,
        callbacks: *raw.OH_NativeXComponent_Callback,
    ) XComponentError!void {
        // The NDK retains this pointer. The caller must keep the callback
        // storage alive until the component no longer delivers events.
        try check(raw.OH_NativeXComponent_RegisterCallback(
            self.rawHandle(),
            callbacks,
        ));
    }

    pub fn registerNativeMouseEventCallback(
        self: NativeXComponent,
        callbacks: *raw.OH_NativeXComponent_MouseEvent_Callback,
    ) XComponentError!void {
        // The NDK retains this pointer. The caller must keep the callback
        // storage alive until the component no longer delivers events.
        try check(raw.OH_NativeXComponent_RegisterMouseEventCallback(
            self.rawHandle(),
            callbacks,
        ));
    }

    pub fn registerNativeKeyEventCallback(
        self: NativeXComponent,
        callback: ?*const fn (
            component: ?*raw.OH_NativeXComponent,
            window: ?*anyopaque,
        ) callconv(.c) void,
    ) XComponentError!void {
        try check(raw.OH_NativeXComponent_RegisterKeyEventCallback(
            self.rawHandle(),
            callback,
        ));
    }

    pub fn registerNativeOnFrameCallback(
        self: NativeXComponent,
        callback: ?*const fn (
            component: ?*raw.OH_NativeXComponent,
            timestamp: u64,
            target_timestamp: u64,
        ) callconv(.c) void,
    ) XComponentError!void {
        try check(raw.OH_NativeXComponent_RegisterOnFrameCallback(
            self.rawHandle(),
            callback,
        ));
    }

    pub fn unregisterOnFrameCallback(self: NativeXComponent) XComponentError!void {
        try check(raw.OH_NativeXComponent_UnregisterOnFrameCallback(
            self.rawHandle(),
        ));
    }

    pub fn registerNativeUIInputEventCallback(
        self: NativeXComponent,
        callback: ?*const fn (
            component: ?*raw.OH_NativeXComponent,
            event: ?*raw.ArkUI_UIInputEvent,
            event_type: raw.ArkUI_UIInputEvent_Type,
        ) callconv(.c) void,
        event_type: raw.ArkUI_UIInputEvent_Type,
    ) XComponentError!void {
        try check(raw.OH_NativeXComponent_RegisterUIInputEventCallback(
            self.rawHandle(),
            callback,
            event_type,
        ));
    }
};

pub const XComponent = NativeXComponent;

pub fn resolveId(
    component: ?*raw.OH_NativeXComponent,
    buffer: []u8,
) XComponentError![]const u8 {
    return (try NativeXComponent.fromRaw(component)).id(buffer);
}

fn check(result: i32) XComponentError!void {
    if (result != raw.OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return error.NativeCallFailed;
    }
}

fn managedRegistration(
    component: *raw.OH_NativeXComponent,
) ?*ManagedRegistration {
    if (managed_registration) |*registration| {
        if (registration.component.handle == component) return registration;
    }
    return null;
}

fn callbackInputs(
    component: ?*raw.OH_NativeXComponent,
    window: ?*anyopaque,
) ?struct {
    registration: *ManagedRegistration,
    component: XComponentRaw,
    window: WindowRaw,
} {
    const component_raw = XComponentRaw.init(component) catch return null;
    const registration = managedRegistration(component_raw.handle) orelse return null;
    const window_raw = WindowRaw.init(window) catch {
        notifyError(
            registration,
            component_raw,
            raw.OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER,
        );
        return null;
    };
    return .{
        .registration = registration,
        .component = component_raw,
        .window = window_raw,
    };
}

fn notifyError(
    registration: *const ManagedRegistration,
    component: XComponentRaw,
    result: i32,
) void {
    if (registration.callbacks.on_error) |callback| {
        callback(
            registration.callbacks.context,
            component,
            .fromRaw(result),
        );
    }
}

fn onSurfaceCreated(
    component: ?*raw.OH_NativeXComponent,
    window: ?*anyopaque,
) callconv(.c) void {
    const inputs = callbackInputs(component, window) orelse return;
    inputs.registration.window = inputs.window;
    if (inputs.registration.callbacks.on_surface_created) |callback| {
        callback(
            inputs.registration.callbacks.context,
            inputs.component,
            inputs.window,
        );
    }
}

fn onSurfaceChanged(
    component: ?*raw.OH_NativeXComponent,
    window: ?*anyopaque,
) callconv(.c) void {
    const inputs = callbackInputs(component, window) orelse return;
    inputs.registration.window = inputs.window;
    if (inputs.registration.callbacks.on_surface_changed) |callback| {
        callback(
            inputs.registration.callbacks.context,
            inputs.component,
            inputs.window,
        );
    }
}

fn onSurfaceDestroyed(
    component: ?*raw.OH_NativeXComponent,
    window: ?*anyopaque,
) callconv(.c) void {
    const inputs = callbackInputs(component, window) orelse return;
    inputs.registration.window = null;
    if (inputs.registration.callbacks.on_surface_destroyed) |callback| {
        callback(
            inputs.registration.callbacks.context,
            inputs.component,
            inputs.window,
        );
    }
}

fn dispatchTouchEvent(
    component: ?*raw.OH_NativeXComponent,
    window: ?*anyopaque,
) callconv(.c) void {
    const inputs = callbackInputs(component, window) orelse return;
    const callback = inputs.registration.callbacks.on_touch_event orelse return;

    var native_event: raw.OH_NativeXComponent_TouchEvent = undefined;
    const result = raw.OH_NativeXComponent_GetTouchEvent(
        inputs.component.handle,
        inputs.window.handle,
        &native_event,
    );
    if (result != raw.OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        notifyError(inputs.registration, inputs.component, result);
        return;
    }

    var event = TouchEventData.fromRaw(native_event);
    for (0..event.num_points) |index| {
        var tool: raw.OH_NativeXComponent_TouchPointToolType = 0;
        const tool_result = raw.OH_NativeXComponent_GetTouchPointToolType(
            inputs.component.handle,
            @intCast(index),
            &tool,
        );
        if (tool_result == raw.OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
            event.touch_points[index].event_tool_type = @enumFromInt(tool);
        } else {
            notifyError(inputs.registration, inputs.component, tool_result);
        }
    }
    callback(
        inputs.registration.callbacks.context,
        inputs.component,
        inputs.window,
        event,
    );
}

fn dispatchMouseEvent(
    component: ?*raw.OH_NativeXComponent,
    window: ?*anyopaque,
) callconv(.c) void {
    const inputs = callbackInputs(component, window) orelse return;
    const callback = inputs.registration.callbacks.on_mouse_event orelse return;

    var native_event: raw.OH_NativeXComponent_MouseEvent = undefined;
    const result = raw.OH_NativeXComponent_GetMouseEvent(
        inputs.component.handle,
        inputs.window.handle,
        &native_event,
    );
    if (result != raw.OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        notifyError(inputs.registration, inputs.component, result);
        return;
    }
    callback(
        inputs.registration.callbacks.context,
        inputs.component,
        inputs.window,
        .fromRaw(native_event),
    );
}

fn dispatchHoverEvent(
    component: ?*raw.OH_NativeXComponent,
    is_hover: bool,
) callconv(.c) void {
    const component_raw = XComponentRaw.init(component) catch return;
    const registration = managedRegistration(component_raw.handle) orelse return;
    if (registration.callbacks.on_hover_event) |callback| {
        callback(registration.callbacks.context, component_raw, is_hover);
    }
}

fn onFrame(
    component: ?*raw.OH_NativeXComponent,
    timestamp: u64,
    target_timestamp: u64,
) callconv(.c) void {
    const component_raw = XComponentRaw.init(component) catch return;
    const registration = managedRegistration(component_raw.handle) orelse return;
    if (registration.callbacks.on_frame) |callback| {
        callback(
            registration.callbacks.context,
            component_raw,
            timestamp,
            target_timestamp,
        );
    }
}

fn onKeyEvent(
    component: ?*raw.OH_NativeXComponent,
    window: ?*anyopaque,
) callconv(.c) void {
    const inputs = callbackInputs(component, window) orelse return;
    const callback = inputs.registration.callbacks.on_key_event orelse return;

    var key_event: ?*raw.OH_NativeXComponent_KeyEvent = null;
    var result = raw.OH_NativeXComponent_GetKeyEvent(
        inputs.component.handle,
        &key_event,
    );
    if (result != raw.OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        notifyError(inputs.registration, inputs.component, result);
        return;
    }
    const event_handle = key_event orelse {
        notifyError(
            inputs.registration,
            inputs.component,
            raw.OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER,
        );
        return;
    };

    var action: raw.OH_NativeXComponent_KeyAction = 0;
    result = raw.OH_NativeXComponent_GetKeyEventAction(event_handle, &action);
    if (result != raw.OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        notifyError(inputs.registration, inputs.component, result);
        return;
    }

    var code: raw.OH_NativeXComponent_KeyCode = 0;
    result = raw.OH_NativeXComponent_GetKeyEventCode(event_handle, &code);
    if (result != raw.OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        notifyError(inputs.registration, inputs.component, result);
        return;
    }

    var device_id: i64 = 0;
    result = raw.OH_NativeXComponent_GetKeyEventDeviceId(event_handle, &device_id);
    if (result != raw.OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        notifyError(inputs.registration, inputs.component, result);
        return;
    }

    var source: raw.OH_NativeXComponent_EventSourceType = 0;
    result = raw.OH_NativeXComponent_GetKeyEventSourceType(event_handle, &source);
    if (result != raw.OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        notifyError(inputs.registration, inputs.component, result);
        return;
    }

    var timestamp: i64 = 0;
    result = raw.OH_NativeXComponent_GetKeyEventTimestamp(event_handle, &timestamp);
    if (result != raw.OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        notifyError(inputs.registration, inputs.component, result);
        return;
    }

    callback(
        inputs.registration.callbacks.context,
        inputs.component,
        inputs.window,
        .{
            .code = .fromRaw(code),
            .action = @enumFromInt(action),
            .device_id = device_id,
            .source = @enumFromInt(source),
            .timestamp = timestamp,
        },
    );
}

fn onUIInputEvent(
    component: ?*raw.OH_NativeXComponent,
    event: ?*raw.ArkUI_UIInputEvent,
    event_type: raw.ArkUI_UIInputEvent_Type,
) callconv(.c) void {
    const component_raw = XComponentRaw.init(component) catch return;
    const registration = managedRegistration(component_raw.handle) orelse return;
    const callback = registration.callbacks.on_ui_input_event orelse return;
    const event_raw = event orelse {
        notifyError(
            registration,
            component_raw,
            raw.OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER,
        );
        return;
    };
    callback(
        registration.callbacks.context,
        component_raw,
        event_raw,
        event_type,
    );
}

test {
    std.testing.refAllDecls(@This());
}
