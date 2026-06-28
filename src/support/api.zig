const std = @import("std");
const options = @import("ohos_zig_binding_options");

pub const current: u32 = options.api;
pub const baseline: u32 = 12;

pub fn available(comptime introduced: u32) bool {
    return current >= introduced;
}

pub fn require(comptime public_name: []const u8, comptime introduced: u32) void {
    if (introduced <= baseline) return;
    if (!available(introduced)) {
        @compileError(std.fmt.comptimePrint(
            "{s} requires OpenHarmony API {d}, but the binding was generated with API {d}",
            .{ public_name, introduced, current },
        ));
    }
}
