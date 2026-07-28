const napi = @import("napi");
const xcomponent = @import("xcomponent");

comptime {
    if (napi.Env != xcomponent.Env or napi.Object != xcomponent.Object) {
        @compileError("xcomponent must use the application's zig-napi Env/Object types");
    }
}

test "xcomponent init accepts zig-napi values" {
    const env: napi.Env = undefined;
    const exports: napi.Object = undefined;
    _ = xcomponent.XComponent.init(env, exports) catch {};
}
