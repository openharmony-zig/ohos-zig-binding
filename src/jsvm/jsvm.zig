//! JSVM owners are move-only and thread-confined. Enter VM, environment and
//! handle scopes in that order; close them in reverse order before parents.
const std = @import("std");
const ffi = @import("ohos_zig_binding_ffi");
pub const raw = @import("jsvm_sys");
pub const Error = ffi.Error || error{PendingException};
fn check(status: raw.JSVM_Status) Error!void {
    if (status == raw.JSVM_PENDING_EXCEPTION) return error.PendingException;
    try ffi.check(status);
}
/// Initialize once per process before creating VMs. Repeated initialization
/// errors are propagated, so this also works with another library owning init.
pub fn initialize(options: *const raw.JSVM_InitOptions) Error!void {
    try check(raw.OH_JSVM_Init(options));
}
pub const Vm = struct {
    handle: raw.JSVM_VM,
    pub fn create(options: raw.JSVM_CreateVMOptions) Error!Vm {
        var handle: raw.JSVM_VM = null;
        try check(raw.OH_JSVM_CreateVM(&options, &handle));
        return .{ .handle = handle orelse return error.UnexpectedNull };
    }
    pub fn deinit(self: *Vm) Error!void {
        if (self.handle) |handle| {
            try check(raw.OH_JSVM_DestroyVM(handle));
            self.handle = null;
        }
    }
    pub fn openScope(self: Vm) Error!VmScope {
        const vm = self.handle orelse return error.InvalidHandle;
        var scope: raw.JSVM_VMScope = null;
        try check(raw.OH_JSVM_OpenVMScope(vm, &scope));
        return .{ .vm = vm, .handle = scope orelse return error.UnexpectedNull };
    }
    pub fn createEnv(self: Vm, properties: []const raw.JSVM_PropertyDescriptor) Error!Env {
        var handle: raw.JSVM_Env = null;
        try check(raw.OH_JSVM_CreateEnv(self.handle orelse return error.InvalidHandle, properties.len, properties.ptr, &handle));
        return .{ .handle = handle orelse return error.UnexpectedNull };
    }
    pub fn pumpMessageLoop(self: Vm) Error!bool {
        var result = false;
        try check(raw.OH_JSVM_PumpMessageLoop(self.handle orelse return error.InvalidHandle, &result));
        return result;
    }
    pub fn performMicrotaskCheckpoint(self: Vm) Error!void {
        try check(raw.OH_JSVM_PerformMicrotaskCheckpoint(self.handle orelse return error.InvalidHandle));
    }
};
pub const VmScope = struct {
    vm: raw.JSVM_VM,
    handle: raw.JSVM_VMScope,
    pub fn deinit(self: *VmScope) Error!void {
        if (self.handle) |handle| {
            try check(raw.OH_JSVM_CloseVMScope(self.vm, handle));
            self.handle = null;
        }
    }
};
pub const EnvScope = struct {
    env: raw.JSVM_Env,
    handle: raw.JSVM_EnvScope,
    pub fn deinit(self: *EnvScope) Error!void {
        if (self.handle) |handle| {
            try check(raw.OH_JSVM_CloseEnvScope(self.env, handle));
            self.handle = null;
        }
    }
};
pub const HandleScope = struct {
    env: raw.JSVM_Env,
    handle: raw.JSVM_HandleScope,
    pub fn deinit(self: *HandleScope) Error!void {
        if (self.handle) |handle| {
            try check(raw.OH_JSVM_CloseHandleScope(self.env, handle));
            self.handle = null;
        }
    }
};
pub const Env = struct {
    handle: raw.JSVM_Env,
    pub fn deinit(self: *Env) Error!void {
        if (self.handle) |handle| {
            try check(raw.OH_JSVM_DestroyEnv(handle));
            self.handle = null;
        }
    }
    pub fn openScope(self: Env) Error!EnvScope {
        const env = self.handle orelse return error.InvalidHandle;
        var scope: raw.JSVM_EnvScope = null;
        try check(raw.OH_JSVM_OpenEnvScope(env, &scope));
        return .{ .env = env, .handle = scope orelse return error.UnexpectedNull };
    }
    pub fn openHandleScope(self: Env) Error!HandleScope {
        const env = self.handle orelse return error.InvalidHandle;
        var scope: raw.JSVM_HandleScope = null;
        try check(raw.OH_JSVM_OpenHandleScope(env, &scope));
        return .{ .env = env, .handle = scope orelse return error.UnexpectedNull };
    }
    pub fn string(self: Env, text: []const u8) Error!Value {
        const env = self.handle orelse return error.InvalidHandle;
        var value: raw.JSVM_Value = null;
        try check(raw.OH_JSVM_CreateStringUtf8(env, text.ptr, text.len, &value));
        return Value.fromRaw(env, value);
    }
    pub fn number(self: Env, value: f64) Error!Value {
        const env = self.handle orelse return error.InvalidHandle;
        var result: raw.JSVM_Value = null;
        try check(raw.OH_JSVM_CreateDouble(env, value, &result));
        return Value.fromRaw(env, result);
    }
    /// Compile and run in the active handle scope. The returned value is borrowed.
    pub fn eval(self: Env, source: []const u8) Error!Value {
        const text = try self.string(source);
        var script: raw.JSVM_Script = null;
        try check(raw.OH_JSVM_CompileScript(text.env, text.handle, null, 0, true, null, &script));
        var result: raw.JSVM_Value = null;
        try check(raw.OH_JSVM_RunScript(text.env, script, &result));
        return Value.fromRaw(text.env, result);
    }
    pub fn takeException(self: Env) Error!Value {
        const env = self.handle orelse return error.InvalidHandle;
        var result: raw.JSVM_Value = null;
        try check(raw.OH_JSVM_GetAndClearLastException(env, &result));
        return Value.fromRaw(env, result);
    }
};
/// Borrowed JS value, valid only in its environment and current handle scope.
pub const Value = struct {
    env: raw.JSVM_Env,
    handle: raw.JSVM_Value,
    pub fn fromRaw(env: raw.JSVM_Env, value: raw.JSVM_Value) Error!Value {
        if (env == null or value == null) return error.InvalidHandle;
        return .{ .env = env, .handle = value };
    }
    pub fn toNumber(self: Value) Error!f64 {
        var result: f64 = 0;
        try check(raw.OH_JSVM_GetValueDouble(self.env, self.handle, &result));
        return result;
    }
    pub fn toString(self: Value, allocator: std.mem.Allocator) Error![]u8 {
        var value: raw.JSVM_Value = null;
        try check(raw.OH_JSVM_CoerceToString(self.env, self.handle, &value));
        var length: usize = 0;
        try check(raw.OH_JSVM_GetValueStringUtf8(self.env, value, null, 0, &length));
        const capacity = std.math.add(usize, length, 1) catch return error.InvalidArgument;
        const buffer = try allocator.alloc(u8, capacity);
        defer allocator.free(buffer);
        var written: usize = 0;
        try check(raw.OH_JSVM_GetValueStringUtf8(self.env, value, buffer.ptr, buffer.len, &written));
        if (written > length) return error.BufferTooSmall;
        return allocator.dupe(u8, buffer[0..written]);
    }
    /// A strong reference keeps this value alive across handle scopes.
    pub fn retain(self: Value) Error!Reference {
        var handle: raw.JSVM_Ref = null;
        try check(raw.OH_JSVM_CreateReference(self.env, self.handle, 1, &handle));
        return .{ .env = self.env, .handle = handle orelse return error.UnexpectedNull };
    }
};
pub const Reference = struct {
    env: raw.JSVM_Env,
    handle: raw.JSVM_Ref,
    pub fn value(self: Reference) Error!Value {
        var result: raw.JSVM_Value = null;
        try check(raw.OH_JSVM_GetReferenceValue(self.env, self.handle orelse return error.InvalidHandle, &result));
        return Value.fromRaw(self.env, result);
    }
    pub fn deinit(self: *Reference) Error!void {
        if (self.handle) |handle| {
            try check(raw.OH_JSVM_DeleteReference(self.env, handle));
            self.handle = null;
        }
    }
};
