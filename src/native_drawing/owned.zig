//! Generated resource owners. Do not copy acquired owners.
//! Stop callbacks and detach dependent objects before deinit.
const ffi = @import("ohos_zig_binding_ffi");
const api = @import("ohos_zig_binding_api");
const raw = @import("native_drawing_sys");

pub const Bitmap = ffi.Resource(raw.OH_Drawing_BitmapCreate, raw.OH_Drawing_BitmapDestroy, api, "native_drawing.owned.Bitmap", 8);
pub const Filter = ffi.Resource(raw.OH_Drawing_FilterCreate, raw.OH_Drawing_FilterDestroy, api, "native_drawing.owned.Filter", 11);
pub const FontFeatures = ffi.Resource(raw.OH_Drawing_FontFeaturesCreate, raw.OH_Drawing_FontFeaturesDestroy, api, "native_drawing.owned.FontFeatures", 20);
pub const Image = ffi.Resource(raw.OH_Drawing_ImageCreate, raw.OH_Drawing_ImageDestroy, api, "native_drawing.owned.Image", 12);
pub const Matrix = ffi.Resource(raw.OH_Drawing_MatrixCreate, raw.OH_Drawing_MatrixDestroy, api, "native_drawing.owned.Matrix", 11);
pub const Path = ffi.Resource(raw.OH_Drawing_PathCreate, raw.OH_Drawing_PathDestroy, api, "native_drawing.owned.Path", 8);
pub const Pen = ffi.Resource(raw.OH_Drawing_PenCreate, raw.OH_Drawing_PenDestroy, api, "native_drawing.owned.Pen", 8);
pub const Point = ffi.Resource(raw.OH_Drawing_PointCreate, raw.OH_Drawing_PointDestroy, api, "native_drawing.owned.Point", 11);
pub const Rect = ffi.Resource(raw.OH_Drawing_RectCreate, raw.OH_Drawing_RectDestroy, api, "native_drawing.owned.Rect", 11);
pub const RoundRect = ffi.Resource(raw.OH_Drawing_RoundRectCreate, raw.OH_Drawing_RoundRectDestroy, api, "native_drawing.owned.RoundRect", 11);
pub const SamplingOptions = ffi.Resource(raw.OH_Drawing_SamplingOptionsCreate, raw.OH_Drawing_SamplingOptionsDestroy, api, "native_drawing.owned.SamplingOptions", 12);
pub const ShadowLayer = ffi.Resource(raw.OH_Drawing_ShadowLayerCreate, raw.OH_Drawing_ShadowLayerDestroy, api, "native_drawing.owned.ShadowLayer", 12);
