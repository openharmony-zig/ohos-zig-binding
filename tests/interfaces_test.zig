const std = @import("std");
const interfaces = @import("interfaces");
const raw = @import("web_sys");
var refreshed: usize = 0;
fn refresh(_: [*c]const u8) callconv(.c) void {
    refreshed += 1;
}

test "Web interface checks table extent before dispatch and checks null methods" {
    refreshed = 0;
    var table = raw.ArkWeb_ControllerAPI{ .size = @sizeOf(usize), .refresh = refresh };
    const controller = interfaces.ArkWeb_ControllerAPI{ .table = &table };
    try std.testing.expectError(error.InvalidHandle, controller.refresh("web"));
    try std.testing.expectEqual(@as(usize, 0), refreshed);
    table.size = @sizeOf(raw.ArkWeb_ControllerAPI);
    table.refresh = null;
    try std.testing.expectError(error.InvalidHandle, controller.refresh("web"));
    table.refresh = refresh;
    try controller.refresh("web");
    try std.testing.expectEqual(@as(usize, 1), refreshed);
}

test "Web interface lookup handles unavailable tables" {
    raw.load_result = null;
    try std.testing.expectError(error.UnexpectedNull, interfaces.ArkWeb_ControllerAPI.load());
    var table = raw.ArkWeb_ControllerAPI{ .size = @sizeOf(raw.ArkWeb_ControllerAPI), .refresh = refresh };
    raw.load_result = &table;
    defer raw.load_result = null;
    const controller = try interfaces.ArkWeb_ControllerAPI.load();
    try std.testing.expectEqual(&table, controller.table);
}
