#pragma once

#include <stdbool.h>
#include <stdint.h>
#include <stdint.h>
#include <stddef.h>
#include <network/netstack/net_http_type.h>
#include <network/netstack/net_http.h>
#include <network/netstack/net_ssl/net_ssl_c_type.h>
#include <network/netstack/net_ssl/net_ssl_c.h>
/* The SDK WebSocket header uses C++ struct names in its C declarations. */
typedef struct WebSocket WebSocket;
typedef struct WebSocket_RequestOptions WebSocket_RequestOptions;
typedef struct WebSocket_OpenResult WebSocket_OpenResult;
typedef struct WebSocket_CloseResult WebSocket_CloseResult;
typedef struct WebSocket_ErrorResult WebSocket_ErrorResult;
#include <network/netstack/net_websocket_type.h>
#include <network/netstack/net_websocket.h>
