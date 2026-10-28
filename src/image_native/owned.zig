//! Generated resource owners. Do not copy acquired owners.
//! Stop callbacks and detach dependent objects before deinit.
const ffi = @import("ohos_zig_binding_ffi");
const api = @import("ohos_zig_binding_api");
const raw = @import("image_native_sys");

pub const AuxiliaryPictureInfo = ffi.Resource(raw.OH_AuxiliaryPictureInfo_Create, raw.OH_AuxiliaryPictureInfo_Release, api, "image_native.owned.AuxiliaryPictureInfo", 13);
pub const AuxiliaryPictureNative = ffi.Resource(raw.OH_AuxiliaryPictureNative_Create, raw.OH_AuxiliaryPictureNative_Release, api, "image_native.owned.AuxiliaryPictureNative", 13);
pub const ComposeOptions = ffi.Resource(raw.OH_ComposeOptions_Create, raw.OH_ComposeOptions_Release, api, "image_native.owned.ComposeOptions", 23);
pub const DecodingOptionsForPicture = ffi.Resource(raw.OH_DecodingOptionsForPicture_Create, raw.OH_DecodingOptionsForPicture_Release, api, "image_native.owned.DecodingOptionsForPicture", 13);
pub const ImageSourceInfo = ffi.Resource(raw.OH_ImageSourceInfo_Create, raw.OH_ImageSourceInfo_Release, api, "image_native.owned.ImageSourceInfo", 12);
pub const PackingOptionsForSequence = ffi.Resource(raw.OH_PackingOptionsForSequence_Create, raw.OH_PackingOptionsForSequence_Release, api, "image_native.owned.PackingOptionsForSequence", 18);
pub const PictureMetadata = ffi.Resource(raw.OH_PictureMetadata_Create, raw.OH_PictureMetadata_Release, api, "image_native.owned.PictureMetadata", 13);
pub const PixelmapImageInfo = ffi.Resource(raw.OH_PixelmapImageInfo_Create, raw.OH_PixelmapImageInfo_Release, api, "image_native.owned.PixelmapImageInfo", 12);
pub const PixelmapInitializationOptions = ffi.Resource(raw.OH_PixelmapInitializationOptions_Create, raw.OH_PixelmapInitializationOptions_Release, api, "image_native.owned.PixelmapInitializationOptions", 12);
