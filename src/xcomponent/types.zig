const std = @import("std");
const api = @import("ohos_zig_binding_api");
const raw = @import("xcomponent_sys");

pub const max_touch_points: usize = 10;
pub const max_id_len: usize = 128;

pub const ResultCode = enum(i32) {
    success = 0,
    failed = -1,
    bad_parameter = -2,
    _,

    pub fn fromRaw(value: i32) ResultCode {
        return @enumFromInt(value);
    }
};

pub const Action = enum(i32) {
    unknown = -1,
    down = 0,
    up = 1,
    _,
};

pub const EventSource = enum(u32) {
    unknown = 0,
    mouse = 1,
    touchscreen = 2,
    touchpad = 3,
    joystick = 4,
    keyboard = 5,
    _,
};

pub const TouchEvent = enum(u32) {
    down = 0,
    up = 1,
    move = 2,
    cancel = 3,
    unknown = 4,
    _,
};

pub const TouchPointTool = enum(u32) {
    unknown = 0,
    finger = 1,
    pen = 2,
    rubber = 3,
    brush = 4,
    pencil = 5,
    airbrush = 6,
    mouse = 7,
    lens = 8,
    _,
};

const MouseActionBaseline = enum(u32) {
    none = 0,
    press = 1,
    release = 2,
    move = 3,
    _,
};

const MouseActionApi18 = enum(u32) {
    none = 0,
    press = 1,
    release = 2,
    move = 3,
    cancel = 4,
    _,
};

/// API 18 adds the named `cancel` action. On lower API levels the value remains
/// representable through the non-exhaustive enum, but no `.cancel` declaration
/// is exposed.
pub const MouseAction = if (api.available(18)) MouseActionApi18 else MouseActionBaseline;

pub const MouseButton = enum(u32) {
    none = 0,
    left = 0x01,
    right = 0x02,
    middle = 0x04,
    back = 0x08,
    forward = 0x10,
    _,
};

pub const KeyCode = @import("key_code.zig").KeyCode;

pub const XComponentSize = struct {
    width: u64,
    height: u64,
};

pub const XComponentOffset = struct {
    x: f64,
    y: f64,
};

pub const TouchPointData = struct {
    id: i32 = 0,
    screen_x: f32 = 0,
    screen_y: f32 = 0,
    x: f32 = 0,
    y: f32 = 0,
    event_type: TouchEvent = .unknown,
    size: f64 = 0,
    force: f32 = 0,
    timestamp: i64 = 0,
    is_pressed: bool = false,
    event_tool_type: TouchPointTool = .unknown,

    pub fn fromRaw(value: raw.OH_NativeXComponent_TouchPoint) TouchPointData {
        return .{
            .id = value.id,
            .screen_x = value.screenX,
            .screen_y = value.screenY,
            .x = value.x,
            .y = value.y,
            .event_type = @enumFromInt(@field(value, "type")),
            .size = value.size,
            .force = value.force,
            .timestamp = value.timeStamp,
            .is_pressed = value.isPressed,
        };
    }

    pub fn toRaw(self: TouchPointData) raw.OH_NativeXComponent_TouchPoint {
        var value: raw.OH_NativeXComponent_TouchPoint = .{
            .id = self.id,
            .screenX = self.screen_x,
            .screenY = self.screen_y,
            .x = self.x,
            .y = self.y,
            .size = self.size,
            .force = self.force,
            .timeStamp = self.timestamp,
            .isPressed = self.is_pressed,
        };
        @field(value, "type") = @intFromEnum(self.event_type);
        return value;
    }
};

pub const TouchEventData = struct {
    id: i32 = 0,
    screen_x: f32 = 0,
    screen_y: f32 = 0,
    x: f32 = 0,
    y: f32 = 0,
    event_type: TouchEvent = .unknown,
    size: f64 = 0,
    force: f32 = 0,
    device_id: i64 = 0,
    timestamp: i64 = 0,
    touch_points: [max_touch_points]TouchPointData =
        [_]TouchPointData{.{}} ** max_touch_points,
    num_points: u32 = 0,

    pub fn fromRaw(value: raw.OH_NativeXComponent_TouchEvent) TouchEventData {
        var result: TouchEventData = .{
            .id = value.id,
            .screen_x = value.screenX,
            .screen_y = value.screenY,
            .x = value.x,
            .y = value.y,
            .event_type = @enumFromInt(@field(value, "type")),
            .size = value.size,
            .force = value.force,
            .device_id = value.deviceId,
            .timestamp = value.timeStamp,
            .num_points = @min(value.numPoints, max_touch_points),
        };
        for (0..result.num_points) |index| {
            result.touch_points[index] = .fromRaw(value.touchPoints[index]);
        }
        return result;
    }

    pub fn toRaw(self: TouchEventData) raw.OH_NativeXComponent_TouchEvent {
        var value: raw.OH_NativeXComponent_TouchEvent = .{
            .id = self.id,
            .screenX = self.screen_x,
            .screenY = self.screen_y,
            .x = self.x,
            .y = self.y,
            .size = self.size,
            .force = self.force,
            .deviceId = self.device_id,
            .timeStamp = self.timestamp,
            .numPoints = @min(self.num_points, max_touch_points),
        };
        @field(value, "type") = @intFromEnum(self.event_type);
        for (0..value.numPoints) |index| {
            value.touchPoints[index] = self.touch_points[index].toRaw();
        }
        return value;
    }

    pub fn points(self: *const TouchEventData) []const TouchPointData {
        return self.touch_points[0..@min(self.num_points, max_touch_points)];
    }
};

pub const MouseEventData = struct {
    x: f32,
    y: f32,
    screen_x: f32,
    screen_y: f32,
    timestamp: i64,
    action: MouseAction,
    button: MouseButton,

    pub fn fromRaw(value: raw.OH_NativeXComponent_MouseEvent) MouseEventData {
        return .{
            .x = value.x,
            .y = value.y,
            .screen_x = value.screenX,
            .screen_y = value.screenY,
            .timestamp = value.timestamp,
            .action = @enumFromInt(value.action),
            .button = @enumFromInt(value.button),
        };
    }
};

pub const KeyEventData = struct {
    code: KeyCode,
    action: Action,
    device_id: i64,
    source: EventSource,
    timestamp: i64,
};

test "touch event conversion clamps the native point count" {
    var native_event: raw.OH_NativeXComponent_TouchEvent = .{
        .numPoints = 100,
    };
    @field(native_event, "type") = raw.OH_NATIVEXCOMPONENT_MOVE;

    const converted = TouchEventData.fromRaw(native_event);
    try std.testing.expectEqual(@as(u32, max_touch_points), converted.num_points);
    try std.testing.expectEqual(TouchEvent.move, converted.event_type);
}
