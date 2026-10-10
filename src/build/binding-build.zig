const std = @import("std");

const registry = @import("modules.zig");

pub const default_api = registry.default_api;

pub const AddModulesOptions = struct {
    /// OpenHarmony API level used by Zig wrapper export guards.
    /// When null, `-Dapi=<level>` is used if present, then the module default.
    api: ?u32 = null,
    /// Enable zig-napi `Env`/`Object` integration for `xcomponent`.
    /// When null, `-Dxcomponent_napi=<bool>` is used, then false.
    xcomponent_napi: ?bool = null,
    /// Enable HMS OpenGTX. Requires HMS_NDK_HOME or HMS_SDK_HOME.
    opengtx: ?bool = null,
};

const api_option_description = "OpenHarmony API level used by Zig wrapper export guards";
const xcomponent_napi_option_description =
    "Enable optional zig-napi Env/Object integration for xcomponent";

pub fn opengtxOption(b: *std.Build) ?bool {
    return b.option(bool, "opengtx", "Enable HMS OpenGTX bindings (requires the HMS native SDK)");
}

pub fn apiOption(b: *std.Build) ?u32 {
    return b.option(u32, "api", api_option_description);
}

pub fn xcomponentNapiOption(b: *std.Build) ?bool {
    return b.option(bool, "xcomponent_napi", xcomponent_napi_option_description);
}

pub fn addModules(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
    options: AddModulesOptions,
) !void {
    const command_line_api = if (options.api == null) apiOption(b) else null;
    const command_line_xcomponent_napi =
        if (options.xcomponent_napi == null) xcomponentNapiOption(b) else null;
    const command_line_opengtx = if (options.opengtx == null) opengtxOption(b) else null;
    try registry.addAll(b, target, optimize, .{
        .api = options.api orelse command_line_api,
        .opengtx = options.opengtx orelse command_line_opengtx orelse false,
        .xcomponent_napi = options.xcomponent_napi orelse
            command_line_xcomponent_napi orelse false,
    });
}
