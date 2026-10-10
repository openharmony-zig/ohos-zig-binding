const ffi = @import("ohos_zig_binding_ffi");
pub const raw = @import("huks_sys");
pub const Error = ffi.Error;
pub const Param = raw.OH_Huks_Param;

fn check(result: raw.OH_Huks_Result) Error!void {
    try ffi.check(result.errorCode);
}
fn blob(bytes: []const u8) Error!raw.OH_Huks_Blob {
    return .{ .size = try ffi.count(u32, bytes.len), .data = @constCast(bytes.ptr) };
}

/// Immutable native parameter set; input blob parameters are copied by build.
pub const ParamSet = struct {
    handle: ?*raw.OH_Huks_ParamSet,
    pub fn create(params: []const Param) Error!ParamSet {
        var value: ParamSet = .{ .handle = null };
        try check(raw.OH_Huks_InitParamSet(&value.handle));
        errdefer value.deinit();
        if (value.handle == null) return error.UnexpectedNull;
        if (params.len != 0) try check(raw.OH_Huks_AddParams(value.handle, params.ptr, try ffi.count(u32, params.len)));
        try check(raw.OH_Huks_BuildParamSet(&value.handle));
        return value;
    }
    pub fn deinit(self: *ParamSet) void {
        if (self.handle != null) raw.OH_Huks_FreeParamSet(&self.handle);
        self.handle = null;
    }
};

pub const Key = struct {
    /// Borrowed alias bytes; caller keeps them alive while using this value.
    alias: []const u8,
    pub fn init(alias: []const u8) Error!Key {
        if (alias.len == 0 or alias.len > 128) return error.InvalidArgument;
        return .{ .alias = alias };
    }
    pub fn generate(self: Key, params: ParamSet) Error!void {
        const name = try blob(self.alias);
        try check(raw.OH_Huks_GenerateKeyItem(&name, params.handle orelse return error.InvalidHandle, null));
    }
    pub fn importKey(self: Key, params: ParamSet, bytes: []const u8) Error!void {
        const name = try blob(self.alias);
        const value = try blob(bytes);
        try check(raw.OH_Huks_ImportKeyItem(&name, params.handle orelse return error.InvalidHandle, &value));
    }
    pub fn exportPublicKey(self: Key, params: ParamSet, output: []u8) Error![]u8 {
        const name = try blob(self.alias);
        var value = try blob(output);
        try check(raw.OH_Huks_ExportPublicKeyItem(&name, params.handle orelse return error.InvalidHandle, &value));
        if (value.size > output.len) return error.BufferTooSmall;
        return output[0..value.size];
    }
    pub fn delete(self: Key, params: ParamSet) Error!void {
        const name = try blob(self.alias);
        try check(raw.OH_Huks_DeleteKeyItem(&name, params.handle orelse return error.InvalidHandle));
    }
    pub fn exists(self: Key, params: ParamSet) Error!bool {
        const name = try blob(self.alias);
        const result = raw.OH_Huks_IsKeyItemExist(&name, params.handle orelse return error.InvalidHandle);
        if (result.errorCode == raw.OH_HUKS_ERR_CODE_ITEM_NOT_EXIST) return false;
        try check(result);
        return true;
    }
};

/// Move-only streaming operation. finish and abort end the session; deinit
/// aborts unfinished work. Output buffers belong to the caller.
pub const Session = struct {
    handle_bytes: [64]u8 = @splat(0),
    token_bytes: [64]u8 = @splat(0),
    handle_len: u32 = 0,
    token_len: u32 = 0,
    active: bool = false,

    pub fn create(key: Key, params: ParamSet) Error!Session {
        var value: Session = .{};
        var handle = try blob(&value.handle_bytes);
        var token_value = try blob(&value.token_bytes);
        const alias = try blob(key.alias);
        try check(raw.OH_Huks_InitSession(&alias, params.handle orelse return error.InvalidHandle, &handle, &token_value));
        if (handle.size > value.handle_bytes.len or token_value.size > value.token_bytes.len) {
            _ = raw.OH_Huks_AbortSession(&handle, params.handle);
            return error.BufferTooSmall;
        }
        value.handle_len = handle.size;
        value.token_len = token_value.size;
        value.active = true;
        return value;
    }
    pub fn token(self: *const Session) []const u8 {
        return self.token_bytes[0..self.token_len];
    }
    pub fn update(self: *Session, params: ParamSet, input: []const u8, output: []u8) Error![]u8 {
        if (!self.active) return error.InvalidHandle;
        const handle = try blob(self.handle_bytes[0..self.handle_len]);
        const data = try blob(input);
        var result = try blob(output);
        try check(raw.OH_Huks_UpdateSession(&handle, params.handle orelse return error.InvalidHandle, &data, &result));
        if (result.size > output.len) return error.BufferTooSmall;
        return output[0..result.size];
    }
    pub fn finish(self: *Session, params: ParamSet, input: []const u8, output: []u8) Error![]u8 {
        if (!self.active) return error.InvalidHandle;
        const handle = try blob(self.handle_bytes[0..self.handle_len]);
        const data = try blob(input);
        var result = try blob(output);
        const parameters = params.handle orelse return error.InvalidHandle;
        self.active = false;
        try check(raw.OH_Huks_FinishSession(&handle, parameters, &data, &result));
        if (result.size > output.len) return error.BufferTooSmall;
        return output[0..result.size];
    }
    pub fn abort(self: *Session, params: ParamSet) Error!void {
        if (!self.active) return;
        const handle = try blob(self.handle_bytes[0..self.handle_len]);
        const parameters = params.handle orelse return error.InvalidHandle;
        self.active = false;
        try check(raw.OH_Huks_AbortSession(&handle, parameters));
    }
    pub fn deinit(self: *Session) Error!void {
        if (!self.active) return;
        var empty = try ParamSet.create(&.{});
        defer empty.deinit();
        try self.abort(empty);
    }
};
