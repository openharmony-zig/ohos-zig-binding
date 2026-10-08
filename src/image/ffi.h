#pragma once

#include <stdbool.h>
#include <stdint.h>
#include <multimedia/image_framework/image_mdk.h>
#include <multimedia/image_framework/image_mdk_common.h>
#include <multimedia/image_framework/image_packer_mdk.h>
/* SDK MDK signatures use an unqualified struct name. */
typedef struct OhosPixelMapCreateOps OhosPixelMapCreateOps;
#include <multimedia/image_framework/image_pixel_map_mdk.h>
/* The deprecated API 8 image_pixel_map_napi.h is C++ only.
 * Use the API 10+ pixel-map MDK declarations above. */
#include <multimedia/image_framework/image_receiver_mdk.h>
#include <multimedia/image_framework/image_source_mdk.h>
