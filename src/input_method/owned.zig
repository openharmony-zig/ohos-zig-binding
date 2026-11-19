//! Generated resource owners. Do not copy acquired owners.
//! Stop callbacks and detach dependent objects before deinit.
const ffi = @import("ohos_zig_binding_ffi");
const api = @import("ohos_zig_binding_api");
const raw = @import("input_method_sys");

pub const CursorInfo = ffi.Resource(raw.OH_CursorInfo_Create, raw.OH_CursorInfo_Destroy, api, "input_method.owned.CursorInfo", 12);
pub const PrivateCommand = ffi.Resource(raw.OH_PrivateCommand_Create, raw.OH_PrivateCommand_Destroy, api, "input_method.owned.PrivateCommand", 12);
pub const TextConfig = ffi.Resource(raw.OH_TextConfig_Create, raw.OH_TextConfig_Destroy, api, "input_method.owned.TextConfig", 12);
