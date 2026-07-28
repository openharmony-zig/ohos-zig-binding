const napi = @import("xcomponent_napi");
const raw = @import("xcomponent_sys");

pub const Env = napi.Env;
pub const Object = napi.Object;

pub const Error = error{
    InvalidComponent,
    NapiCallFailed,
};

const native_xcomponent_object_name: [*:0]const u8 = "__NATIVE_XCOMPONENT_OBJ__";

pub fn unwrap(env: Env, exports: Object) Error!*raw.OH_NativeXComponent {
    const sys = napi.napi_sys.napi_sys;

    var exported_component: sys.napi_value = undefined;
    if (sys.napi_get_named_property(
        env.raw,
        exports.raw,
        native_xcomponent_object_name,
        &exported_component,
    ) != sys.napi_ok) {
        return error.NapiCallFailed;
    }

    var instance: ?*anyopaque = null;
    if (sys.napi_unwrap(env.raw, exported_component, &instance) != sys.napi_ok) {
        return error.NapiCallFailed;
    }
    return @ptrCast(instance orelse return error.InvalidComponent);
}
