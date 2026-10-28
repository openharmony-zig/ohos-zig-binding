//! Generated resource owners. Do not copy acquired owners.
//! Stop callbacks and detach dependent objects before deinit.
const ffi = @import("ohos_zig_binding_ffi");
const api = @import("ohos_zig_binding_api");
const raw = @import("udmf_sys");

pub const UdmfDataLoadInfo = ffi.Resource(raw.OH_UdmfDataLoadInfo_Create, raw.OH_UdmfDataLoadInfo_Destroy, api, "udmf.owned.UdmfDataLoadInfo", 20);
pub const UdmfDataLoadParams = ffi.Resource(raw.OH_UdmfDataLoadParams_Create, raw.OH_UdmfDataLoadParams_Destroy, api, "udmf.owned.UdmfDataLoadParams", 20);
pub const UdmfGetDataParams = ffi.Resource(raw.OH_UdmfGetDataParams_Create, raw.OH_UdmfGetDataParams_Destroy, api, "udmf.owned.UdmfGetDataParams", 15);
