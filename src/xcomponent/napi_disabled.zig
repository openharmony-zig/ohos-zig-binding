const raw = @import("xcomponent_sys");

/// Placeholder type used only so the core XComponent module can be imported
/// without downloading or compiling zig-napi.
pub const Env = struct {};

/// Placeholder type used only while the optional N-API integration is off.
pub const Object = struct {};

pub const Error = error{
    InvalidComponent,
    NapiCallFailed,
};

pub fn unwrap(_: Env, _: Object) Error!*raw.OH_NativeXComponent {
    @compileError(
        "xcomponent N-API integration is disabled; pass .xcomponent_napi = true " ++
            "to the ohos_zig_binding dependency or use -Dxcomponent_napi=true",
    );
}
