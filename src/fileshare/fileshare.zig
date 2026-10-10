const std = @import("std");
const ffi = @import("ohos_zig_binding_ffi");
pub const raw = @import("fileshare_sys");
pub const Error = ffi.Error;

pub const Policy = struct {
    uri: [:0]const u8,
    operation_mode: c_uint,
};

pub const Operation = enum { persist, revoke, activate, deactivate };

/// Owns per-policy failures even when the operation's overall status is nonzero.
pub const PolicyResult = struct {
    status: raw.FileManagement_ErrCode,
    items: [*c]raw.FileShare_PolicyErrorResult,
    len: c_uint,

    pub fn errors(self: PolicyResult) []const raw.FileShare_PolicyErrorResult {
        return if (self.len == 0) &.{} else self.items[0..self.len];
    }

    pub fn deinit(self: *PolicyResult) void {
        if (self.items != null) raw.OH_FileShare_ReleasePolicyErrorResult(self.items, self.len);
        self.items = null;
        self.len = 0;
    }
};

fn makePolicies(allocator: std.mem.Allocator, policies: []const Policy) Error![]raw.FileShare_PolicyInfo {
    _ = try ffi.count(c_uint, policies.len);
    const values = try allocator.alloc(raw.FileShare_PolicyInfo, policies.len);
    errdefer allocator.free(values);
    for (policies, values) |policy, *value| {
        if (policy.uri.len == 0) return error.InvalidArgument;
        value.* = .{
            .uri = @constCast(policy.uri.ptr),
            .length = try ffi.count(c_uint, policy.uri.len),
            .operationMode = policy.operation_mode,
        };
    }
    return values;
}

pub fn apply(allocator: std.mem.Allocator, operation: Operation, policies: []const Policy) Error!PolicyResult {
    const values = try makePolicies(allocator, policies);
    defer allocator.free(values);
    var result: PolicyResult = .{ .status = 0, .items = null, .len = 0 };
    const function: *const @TypeOf(raw.OH_FileShare_PersistPermission) = switch (operation) {
        .persist => raw.OH_FileShare_PersistPermission,
        .revoke => raw.OH_FileShare_RevokePermission,
        .activate => raw.OH_FileShare_ActivatePermission,
        .deactivate => raw.OH_FileShare_DeactivatePermission,
    };
    result.status = function(values.ptr, @intCast(values.len), &result.items, &result.len);
    if (result.len != 0 and result.items == null) return error.UnexpectedNull;
    return result;
}

pub fn checkPersistentPermission(allocator: std.mem.Allocator, policies: []const Policy) Error![]bool {
    const values = try makePolicies(allocator, policies);
    defer allocator.free(values);
    var result: [*c]bool = null;
    var len: c_uint = 0;
    const status = raw.OH_FileShare_CheckPersistentPermission(values.ptr, @intCast(values.len), &result, &len);
    defer std.c.free(result);
    try ffi.check(status);
    if (len != values.len or (len != 0 and result == null)) return error.UnexpectedNull;
    return allocator.dupe(bool, if (len == 0) &.{} else result[0..len]);
}
