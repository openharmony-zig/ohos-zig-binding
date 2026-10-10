const std = @import("std");
const ffi = @import("ohos_zig_binding_ffi");
const api = @import("ohos_zig_binding_api");
pub const raw = @import("bundle_sys");
pub const Error = ffi.Error;

/// SDK-owned strings. Do not copy this owner; call deinit exactly once.
pub const ApplicationInfo = struct {
    value: raw.OH_NativeBundle_ApplicationInfo,

    pub fn deinit(self: *ApplicationInfo) void {
        std.c.free(self.value.bundleName);
        std.c.free(self.value.fingerprint);
        self.value.bundleName = null;
        self.value.fingerprint = null;
    }

    pub fn bundleName(self: ApplicationInfo) []const u8 {
        return if (self.value.bundleName != null) std.mem.span(self.value.bundleName) else "";
    }

    pub fn fingerprint(self: ApplicationInfo) []const u8 {
        return if (self.value.fingerprint != null) std.mem.span(self.value.fingerprint) else "";
    }
};

pub fn getApplicationInfo() Error!ApplicationInfo {
    var info: ApplicationInfo = .{ .value = raw.OH_NativeBundle_GetCurrentApplicationInfo() };
    if (info.value.bundleName == null or info.value.fingerprint == null) {
        info.deinit();
        return error.UnexpectedNull;
    }
    return info;
}

/// Returned strings belong to allocator and must be freed by the caller.
pub fn getAppId(allocator: std.mem.Allocator) Error![]u8 {
    return ffi.takeString(allocator, raw.OH_NativeBundle_GetAppId());
}

pub fn getAppIdentifier(allocator: std.mem.Allocator) Error![]u8 {
    return ffi.takeString(allocator, raw.OH_NativeBundle_GetAppIdentifier());
}

pub fn getCompatibleDeviceType(allocator: std.mem.Allocator) Error![]u8 {
    comptime api.require("bundle.getCompatibleDeviceType", 14);
    return ffi.takeString(allocator, raw.OH_NativeBundle_GetCompatibleDeviceType());
}

pub const MainElementName = struct {
    comptime {
        api.require("bundle.MainElementName", 13);
    }
    value: raw.OH_NativeBundle_ElementName,

    pub fn deinit(self: *MainElementName) void {
        std.c.free(self.value.bundleName);
        std.c.free(self.value.moduleName);
        std.c.free(self.value.abilityName);
        self.value = std.mem.zeroes(raw.OH_NativeBundle_ElementName);
    }
};

pub fn getMainElementName() Error!MainElementName {
    comptime api.require("bundle.getMainElementName", 13);
    var name: MainElementName = .{ .value = raw.OH_NativeBundle_GetMainElementName() };
    if (name.value.bundleName == null or name.value.moduleName == null or name.value.abilityName == null) {
        name.deinit();
        return error.UnexpectedNull;
    }
    return name;
}
