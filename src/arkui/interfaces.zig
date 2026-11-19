//! Generated typed dispatch for native interface tables.
//! Returned handles and callback storage follow SDK ownership rules.
const raw = @import("arkui_sys");
const api = @import("ohos_zig_binding_api");
const Error = @import("ohos_zig_binding_ffi").Error;

fn Method(comptime Table: type, comptime name: []const u8) type {
    return @typeInfo(@typeInfo(@FieldType(Table, name)).optional.child).pointer.child;
}
fn Param(comptime Table: type, comptime name: []const u8, comptime index: usize) type {
    return @typeInfo(Method(Table, name)).@"fn".param_types[index].?;
}
fn Return(comptime Table: type, comptime name: []const u8) type {
    return @typeInfo(Method(Table, name)).@"fn".return_type.?;
}

pub const ArkUI_NativeAnimateAPI_1 = struct {
    const Self = @This();
    const Table = raw.ArkUI_NativeAnimateAPI_1;
    table: *const Table,
    pub fn load() Error!Self {
        const value = raw.OH_ArkUI_QueryModuleInterfaceByName(raw.ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1") orelse return error.UnexpectedNull;
        return .{ .table = @ptrCast(@alignCast(value)) };
    }
    pub fn animateTo(self: Self, arg0: Param(Table, "animateTo", 0), arg1: Param(Table, "animateTo", 1), arg2: Param(Table, "animateTo", 2), arg3: Param(Table, "animateTo", 3)) Error!Return(Table, "animateTo") {
        const function = self.table.animateTo orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2, arg3);
    }
    pub fn keyframeAnimateTo(self: Self, arg0: Param(Table, "keyframeAnimateTo", 0), arg1: Param(Table, "keyframeAnimateTo", 1)) Error!Return(Table, "keyframeAnimateTo") {
        const function = self.table.keyframeAnimateTo orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn createAnimator(self: Self, arg0: Param(Table, "createAnimator", 0), arg1: Param(Table, "createAnimator", 1)) Error!Return(Table, "createAnimator") {
        const function = self.table.createAnimator orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn disposeAnimator(self: Self, arg0: Param(Table, "disposeAnimator", 0)) Error!Return(Table, "disposeAnimator") {
        const function = self.table.disposeAnimator orelse return error.InvalidHandle;
        return function(arg0);
    }
};

pub const ArkUI_NativeDialogAPI_1 = struct {
    const Self = @This();
    const Table = raw.ArkUI_NativeDialogAPI_1;
    table: *const Table,
    pub fn load() Error!Self {
        const value = raw.OH_ArkUI_QueryModuleInterfaceByName(raw.ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1") orelse return error.UnexpectedNull;
        return .{ .table = @ptrCast(@alignCast(value)) };
    }
    pub fn create(self: Self) Error!Return(Table, "create") {
        const function = self.table.create orelse return error.InvalidHandle;
        return function();
    }
    pub fn dispose(self: Self, arg0: Param(Table, "dispose", 0)) Error!Return(Table, "dispose") {
        const function = self.table.dispose orelse return error.InvalidHandle;
        return function(arg0);
    }
    pub fn setContent(self: Self, arg0: Param(Table, "setContent", 0), arg1: Param(Table, "setContent", 1)) Error!Return(Table, "setContent") {
        const function = self.table.setContent orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn removeContent(self: Self, arg0: Param(Table, "removeContent", 0)) Error!Return(Table, "removeContent") {
        const function = self.table.removeContent orelse return error.InvalidHandle;
        return function(arg0);
    }
    pub fn setContentAlignment(self: Self, arg0: Param(Table, "setContentAlignment", 0), arg1: Param(Table, "setContentAlignment", 1), arg2: Param(Table, "setContentAlignment", 2), arg3: Param(Table, "setContentAlignment", 3)) Error!Return(Table, "setContentAlignment") {
        const function = self.table.setContentAlignment orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2, arg3);
    }
    pub fn resetContentAlignment(self: Self, arg0: Param(Table, "resetContentAlignment", 0)) Error!Return(Table, "resetContentAlignment") {
        const function = self.table.resetContentAlignment orelse return error.InvalidHandle;
        return function(arg0);
    }
    pub fn setModalMode(self: Self, arg0: Param(Table, "setModalMode", 0), arg1: Param(Table, "setModalMode", 1)) Error!Return(Table, "setModalMode") {
        const function = self.table.setModalMode orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn setAutoCancel(self: Self, arg0: Param(Table, "setAutoCancel", 0), arg1: Param(Table, "setAutoCancel", 1)) Error!Return(Table, "setAutoCancel") {
        const function = self.table.setAutoCancel orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn setMask(self: Self, arg0: Param(Table, "setMask", 0), arg1: Param(Table, "setMask", 1), arg2: Param(Table, "setMask", 2)) Error!Return(Table, "setMask") {
        const function = self.table.setMask orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2);
    }
    pub fn setBackgroundColor(self: Self, arg0: Param(Table, "setBackgroundColor", 0), arg1: Param(Table, "setBackgroundColor", 1)) Error!Return(Table, "setBackgroundColor") {
        const function = self.table.setBackgroundColor orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn setCornerRadius(self: Self, arg0: Param(Table, "setCornerRadius", 0), arg1: Param(Table, "setCornerRadius", 1), arg2: Param(Table, "setCornerRadius", 2), arg3: Param(Table, "setCornerRadius", 3), arg4: Param(Table, "setCornerRadius", 4)) Error!Return(Table, "setCornerRadius") {
        const function = self.table.setCornerRadius orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2, arg3, arg4);
    }
    pub fn setGridColumnCount(self: Self, arg0: Param(Table, "setGridColumnCount", 0), arg1: Param(Table, "setGridColumnCount", 1)) Error!Return(Table, "setGridColumnCount") {
        const function = self.table.setGridColumnCount orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn enableCustomStyle(self: Self, arg0: Param(Table, "enableCustomStyle", 0), arg1: Param(Table, "enableCustomStyle", 1)) Error!Return(Table, "enableCustomStyle") {
        const function = self.table.enableCustomStyle orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn enableCustomAnimation(self: Self, arg0: Param(Table, "enableCustomAnimation", 0), arg1: Param(Table, "enableCustomAnimation", 1)) Error!Return(Table, "enableCustomAnimation") {
        const function = self.table.enableCustomAnimation orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn registerOnWillDismiss(self: Self, arg0: Param(Table, "registerOnWillDismiss", 0), arg1: Param(Table, "registerOnWillDismiss", 1)) Error!Return(Table, "registerOnWillDismiss") {
        const function = self.table.registerOnWillDismiss orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn show(self: Self, arg0: Param(Table, "show", 0), arg1: Param(Table, "show", 1)) Error!Return(Table, "show") {
        const function = self.table.show orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn close(self: Self, arg0: Param(Table, "close", 0)) Error!Return(Table, "close") {
        const function = self.table.close orelse return error.InvalidHandle;
        return function(arg0);
    }
    pub fn registerOnWillDismissWithUserData(self: Self, arg0: Param(Table, "registerOnWillDismissWithUserData", 0), arg1: Param(Table, "registerOnWillDismissWithUserData", 1), arg2: Param(Table, "registerOnWillDismissWithUserData", 2)) Error!Return(Table, "registerOnWillDismissWithUserData") {
        const function = self.table.registerOnWillDismissWithUserData orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2);
    }
};

pub const ArkUI_NativeGestureAPI_1 = struct {
    const Self = @This();
    const Table = raw.ArkUI_NativeGestureAPI_1;
    table: *const Table,
    pub fn load() Error!Self {
        const value = raw.OH_ArkUI_QueryModuleInterfaceByName(raw.ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1") orelse return error.UnexpectedNull;
        return .{ .table = @ptrCast(@alignCast(value)) };
    }
    pub fn createTapGesture(self: Self, arg0: Param(Table, "createTapGesture", 0), arg1: Param(Table, "createTapGesture", 1)) Error!Return(Table, "createTapGesture") {
        const function = self.table.createTapGesture orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn createLongPressGesture(self: Self, arg0: Param(Table, "createLongPressGesture", 0), arg1: Param(Table, "createLongPressGesture", 1), arg2: Param(Table, "createLongPressGesture", 2)) Error!Return(Table, "createLongPressGesture") {
        const function = self.table.createLongPressGesture orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2);
    }
    pub fn createPanGesture(self: Self, arg0: Param(Table, "createPanGesture", 0), arg1: Param(Table, "createPanGesture", 1), arg2: Param(Table, "createPanGesture", 2)) Error!Return(Table, "createPanGesture") {
        const function = self.table.createPanGesture orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2);
    }
    pub fn createPinchGesture(self: Self, arg0: Param(Table, "createPinchGesture", 0), arg1: Param(Table, "createPinchGesture", 1)) Error!Return(Table, "createPinchGesture") {
        const function = self.table.createPinchGesture orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn createRotationGesture(self: Self, arg0: Param(Table, "createRotationGesture", 0), arg1: Param(Table, "createRotationGesture", 1)) Error!Return(Table, "createRotationGesture") {
        const function = self.table.createRotationGesture orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn createSwipeGesture(self: Self, arg0: Param(Table, "createSwipeGesture", 0), arg1: Param(Table, "createSwipeGesture", 1), arg2: Param(Table, "createSwipeGesture", 2)) Error!Return(Table, "createSwipeGesture") {
        const function = self.table.createSwipeGesture orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2);
    }
    pub fn createGroupGesture(self: Self, arg0: Param(Table, "createGroupGesture", 0)) Error!Return(Table, "createGroupGesture") {
        const function = self.table.createGroupGesture orelse return error.InvalidHandle;
        return function(arg0);
    }
    pub fn dispose(self: Self, arg0: Param(Table, "dispose", 0)) Error!Return(Table, "dispose") {
        const function = self.table.dispose orelse return error.InvalidHandle;
        return function(arg0);
    }
    pub fn addChildGesture(self: Self, arg0: Param(Table, "addChildGesture", 0), arg1: Param(Table, "addChildGesture", 1)) Error!Return(Table, "addChildGesture") {
        const function = self.table.addChildGesture orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn removeChildGesture(self: Self, arg0: Param(Table, "removeChildGesture", 0), arg1: Param(Table, "removeChildGesture", 1)) Error!Return(Table, "removeChildGesture") {
        const function = self.table.removeChildGesture orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn setGestureEventTarget(self: Self, arg0: Param(Table, "setGestureEventTarget", 0), arg1: Param(Table, "setGestureEventTarget", 1), arg2: Param(Table, "setGestureEventTarget", 2), arg3: Param(Table, "setGestureEventTarget", 3)) Error!Return(Table, "setGestureEventTarget") {
        const function = self.table.setGestureEventTarget orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2, arg3);
    }
    pub fn addGestureToNode(self: Self, arg0: Param(Table, "addGestureToNode", 0), arg1: Param(Table, "addGestureToNode", 1), arg2: Param(Table, "addGestureToNode", 2), arg3: Param(Table, "addGestureToNode", 3)) Error!Return(Table, "addGestureToNode") {
        const function = self.table.addGestureToNode orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2, arg3);
    }
    pub fn removeGestureFromNode(self: Self, arg0: Param(Table, "removeGestureFromNode", 0), arg1: Param(Table, "removeGestureFromNode", 1)) Error!Return(Table, "removeGestureFromNode") {
        const function = self.table.removeGestureFromNode orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn setGestureInterrupterToNode(self: Self, arg0: Param(Table, "setGestureInterrupterToNode", 0), arg1: Param(Table, "setGestureInterrupterToNode", 1)) Error!Return(Table, "setGestureInterrupterToNode") {
        const function = self.table.setGestureInterrupterToNode orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn getGestureType(self: Self, arg0: Param(Table, "getGestureType", 0)) Error!Return(Table, "getGestureType") {
        const function = self.table.getGestureType orelse return error.InvalidHandle;
        return function(arg0);
    }
    pub fn setInnerGestureParallelTo(self: Self, arg0: Param(Table, "setInnerGestureParallelTo", 0), arg1: Param(Table, "setInnerGestureParallelTo", 1), arg2: Param(Table, "setInnerGestureParallelTo", 2)) Error!Return(Table, "setInnerGestureParallelTo") {
        const function = self.table.setInnerGestureParallelTo orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2);
    }
    pub fn createTapGestureWithDistanceThreshold(self: Self, arg0: Param(Table, "createTapGestureWithDistanceThreshold", 0), arg1: Param(Table, "createTapGestureWithDistanceThreshold", 1), arg2: Param(Table, "createTapGestureWithDistanceThreshold", 2)) Error!Return(Table, "createTapGestureWithDistanceThreshold") {
        const function = self.table.createTapGestureWithDistanceThreshold orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2);
    }
};

pub const ArkUI_NativeGestureAPI_2 = struct {
    const Self = @This();
    const Table = raw.ArkUI_NativeGestureAPI_2;
    table: *const Table,
    pub fn load() Error!Self {
        comptime api.require("arkui.interfaces.ArkUI_NativeGestureAPI_2", 18);
        const value = raw.OH_ArkUI_QueryModuleInterfaceByName(raw.ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_2") orelse return error.UnexpectedNull;
        return .{ .table = @ptrCast(@alignCast(value)) };
    }
    pub fn setGestureInterrupterToNode(self: Self, arg0: Param(Table, "setGestureInterrupterToNode", 0), arg1: Param(Table, "setGestureInterrupterToNode", 1), arg2: Param(Table, "setGestureInterrupterToNode", 2)) Error!Return(Table, "setGestureInterrupterToNode") {
        comptime api.require("arkui.interfaces.ArkUI_NativeGestureAPI_2.setGestureInterrupterToNode", 18);
        const function = self.table.setGestureInterrupterToNode orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2);
    }
};

pub const ArkUI_NativeNodeAPI_1 = struct {
    const Self = @This();
    const Table = raw.ArkUI_NativeNodeAPI_1;
    table: *const Table,
    pub fn load() Error!Self {
        const value = raw.OH_ArkUI_QueryModuleInterfaceByName(raw.ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1") orelse return error.UnexpectedNull;
        return .{ .table = @ptrCast(@alignCast(value)) };
    }
    pub fn createNode(self: Self, arg0: Param(Table, "createNode", 0)) Error!Return(Table, "createNode") {
        const function = self.table.createNode orelse return error.InvalidHandle;
        return function(arg0);
    }
    pub fn disposeNode(self: Self, arg0: Param(Table, "disposeNode", 0)) Error!Return(Table, "disposeNode") {
        const function = self.table.disposeNode orelse return error.InvalidHandle;
        return function(arg0);
    }
    pub fn addChild(self: Self, arg0: Param(Table, "addChild", 0), arg1: Param(Table, "addChild", 1)) Error!Return(Table, "addChild") {
        const function = self.table.addChild orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn removeChild(self: Self, arg0: Param(Table, "removeChild", 0), arg1: Param(Table, "removeChild", 1)) Error!Return(Table, "removeChild") {
        const function = self.table.removeChild orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn insertChildAfter(self: Self, arg0: Param(Table, "insertChildAfter", 0), arg1: Param(Table, "insertChildAfter", 1), arg2: Param(Table, "insertChildAfter", 2)) Error!Return(Table, "insertChildAfter") {
        const function = self.table.insertChildAfter orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2);
    }
    pub fn insertChildBefore(self: Self, arg0: Param(Table, "insertChildBefore", 0), arg1: Param(Table, "insertChildBefore", 1), arg2: Param(Table, "insertChildBefore", 2)) Error!Return(Table, "insertChildBefore") {
        const function = self.table.insertChildBefore orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2);
    }
    pub fn insertChildAt(self: Self, arg0: Param(Table, "insertChildAt", 0), arg1: Param(Table, "insertChildAt", 1), arg2: Param(Table, "insertChildAt", 2)) Error!Return(Table, "insertChildAt") {
        const function = self.table.insertChildAt orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2);
    }
    pub fn setAttribute(self: Self, arg0: Param(Table, "setAttribute", 0), arg1: Param(Table, "setAttribute", 1), arg2: Param(Table, "setAttribute", 2)) Error!Return(Table, "setAttribute") {
        const function = self.table.setAttribute orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2);
    }
    pub fn getAttribute(self: Self, arg0: Param(Table, "getAttribute", 0), arg1: Param(Table, "getAttribute", 1)) Error!Return(Table, "getAttribute") {
        const function = self.table.getAttribute orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn resetAttribute(self: Self, arg0: Param(Table, "resetAttribute", 0), arg1: Param(Table, "resetAttribute", 1)) Error!Return(Table, "resetAttribute") {
        const function = self.table.resetAttribute orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn registerNodeEvent(self: Self, arg0: Param(Table, "registerNodeEvent", 0), arg1: Param(Table, "registerNodeEvent", 1), arg2: Param(Table, "registerNodeEvent", 2), arg3: Param(Table, "registerNodeEvent", 3)) Error!Return(Table, "registerNodeEvent") {
        const function = self.table.registerNodeEvent orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2, arg3);
    }
    pub fn unregisterNodeEvent(self: Self, arg0: Param(Table, "unregisterNodeEvent", 0), arg1: Param(Table, "unregisterNodeEvent", 1)) Error!Return(Table, "unregisterNodeEvent") {
        const function = self.table.unregisterNodeEvent orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn registerNodeEventReceiver(self: Self, arg0: Param(Table, "registerNodeEventReceiver", 0)) Error!Return(Table, "registerNodeEventReceiver") {
        const function = self.table.registerNodeEventReceiver orelse return error.InvalidHandle;
        return function(arg0);
    }
    pub fn unregisterNodeEventReceiver(self: Self) Error!Return(Table, "unregisterNodeEventReceiver") {
        const function = self.table.unregisterNodeEventReceiver orelse return error.InvalidHandle;
        return function();
    }
    pub fn markDirty(self: Self, arg0: Param(Table, "markDirty", 0), arg1: Param(Table, "markDirty", 1)) Error!Return(Table, "markDirty") {
        const function = self.table.markDirty orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn getTotalChildCount(self: Self, arg0: Param(Table, "getTotalChildCount", 0)) Error!Return(Table, "getTotalChildCount") {
        const function = self.table.getTotalChildCount orelse return error.InvalidHandle;
        return function(arg0);
    }
    pub fn getChildAt(self: Self, arg0: Param(Table, "getChildAt", 0), arg1: Param(Table, "getChildAt", 1)) Error!Return(Table, "getChildAt") {
        const function = self.table.getChildAt orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn getFirstChild(self: Self, arg0: Param(Table, "getFirstChild", 0)) Error!Return(Table, "getFirstChild") {
        const function = self.table.getFirstChild orelse return error.InvalidHandle;
        return function(arg0);
    }
    pub fn getLastChild(self: Self, arg0: Param(Table, "getLastChild", 0)) Error!Return(Table, "getLastChild") {
        const function = self.table.getLastChild orelse return error.InvalidHandle;
        return function(arg0);
    }
    pub fn getPreviousSibling(self: Self, arg0: Param(Table, "getPreviousSibling", 0)) Error!Return(Table, "getPreviousSibling") {
        const function = self.table.getPreviousSibling orelse return error.InvalidHandle;
        return function(arg0);
    }
    pub fn getNextSibling(self: Self, arg0: Param(Table, "getNextSibling", 0)) Error!Return(Table, "getNextSibling") {
        const function = self.table.getNextSibling orelse return error.InvalidHandle;
        return function(arg0);
    }
    pub fn registerNodeCustomEvent(self: Self, arg0: Param(Table, "registerNodeCustomEvent", 0), arg1: Param(Table, "registerNodeCustomEvent", 1), arg2: Param(Table, "registerNodeCustomEvent", 2), arg3: Param(Table, "registerNodeCustomEvent", 3)) Error!Return(Table, "registerNodeCustomEvent") {
        const function = self.table.registerNodeCustomEvent orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2, arg3);
    }
    pub fn unregisterNodeCustomEvent(self: Self, arg0: Param(Table, "unregisterNodeCustomEvent", 0), arg1: Param(Table, "unregisterNodeCustomEvent", 1)) Error!Return(Table, "unregisterNodeCustomEvent") {
        const function = self.table.unregisterNodeCustomEvent orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn registerNodeCustomEventReceiver(self: Self, arg0: Param(Table, "registerNodeCustomEventReceiver", 0)) Error!Return(Table, "registerNodeCustomEventReceiver") {
        const function = self.table.registerNodeCustomEventReceiver orelse return error.InvalidHandle;
        return function(arg0);
    }
    pub fn unregisterNodeCustomEventReceiver(self: Self) Error!Return(Table, "unregisterNodeCustomEventReceiver") {
        const function = self.table.unregisterNodeCustomEventReceiver orelse return error.InvalidHandle;
        return function();
    }
    pub fn setMeasuredSize(self: Self, arg0: Param(Table, "setMeasuredSize", 0), arg1: Param(Table, "setMeasuredSize", 1), arg2: Param(Table, "setMeasuredSize", 2)) Error!Return(Table, "setMeasuredSize") {
        const function = self.table.setMeasuredSize orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2);
    }
    pub fn setLayoutPosition(self: Self, arg0: Param(Table, "setLayoutPosition", 0), arg1: Param(Table, "setLayoutPosition", 1), arg2: Param(Table, "setLayoutPosition", 2)) Error!Return(Table, "setLayoutPosition") {
        const function = self.table.setLayoutPosition orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2);
    }
    pub fn getMeasuredSize(self: Self, arg0: Param(Table, "getMeasuredSize", 0)) Error!Return(Table, "getMeasuredSize") {
        const function = self.table.getMeasuredSize orelse return error.InvalidHandle;
        return function(arg0);
    }
    pub fn getLayoutPosition(self: Self, arg0: Param(Table, "getLayoutPosition", 0)) Error!Return(Table, "getLayoutPosition") {
        const function = self.table.getLayoutPosition orelse return error.InvalidHandle;
        return function(arg0);
    }
    pub fn measureNode(self: Self, arg0: Param(Table, "measureNode", 0), arg1: Param(Table, "measureNode", 1)) Error!Return(Table, "measureNode") {
        const function = self.table.measureNode orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn layoutNode(self: Self, arg0: Param(Table, "layoutNode", 0), arg1: Param(Table, "layoutNode", 1), arg2: Param(Table, "layoutNode", 2)) Error!Return(Table, "layoutNode") {
        const function = self.table.layoutNode orelse return error.InvalidHandle;
        return function(arg0, arg1, arg2);
    }
    pub fn addNodeEventReceiver(self: Self, arg0: Param(Table, "addNodeEventReceiver", 0), arg1: Param(Table, "addNodeEventReceiver", 1)) Error!Return(Table, "addNodeEventReceiver") {
        const function = self.table.addNodeEventReceiver orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn removeNodeEventReceiver(self: Self, arg0: Param(Table, "removeNodeEventReceiver", 0), arg1: Param(Table, "removeNodeEventReceiver", 1)) Error!Return(Table, "removeNodeEventReceiver") {
        const function = self.table.removeNodeEventReceiver orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn addNodeCustomEventReceiver(self: Self, arg0: Param(Table, "addNodeCustomEventReceiver", 0), arg1: Param(Table, "addNodeCustomEventReceiver", 1)) Error!Return(Table, "addNodeCustomEventReceiver") {
        const function = self.table.addNodeCustomEventReceiver orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn removeNodeCustomEventReceiver(self: Self, arg0: Param(Table, "removeNodeCustomEventReceiver", 0), arg1: Param(Table, "removeNodeCustomEventReceiver", 1)) Error!Return(Table, "removeNodeCustomEventReceiver") {
        const function = self.table.removeNodeCustomEventReceiver orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn setUserData(self: Self, arg0: Param(Table, "setUserData", 0), arg1: Param(Table, "setUserData", 1)) Error!Return(Table, "setUserData") {
        const function = self.table.setUserData orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn getUserData(self: Self, arg0: Param(Table, "getUserData", 0)) Error!Return(Table, "getUserData") {
        const function = self.table.getUserData orelse return error.InvalidHandle;
        return function(arg0);
    }
    pub fn setLengthMetricUnit(self: Self, arg0: Param(Table, "setLengthMetricUnit", 0), arg1: Param(Table, "setLengthMetricUnit", 1)) Error!Return(Table, "setLengthMetricUnit") {
        const function = self.table.setLengthMetricUnit orelse return error.InvalidHandle;
        return function(arg0, arg1);
    }
    pub fn getParent(self: Self, arg0: Param(Table, "getParent", 0)) Error!Return(Table, "getParent") {
        const function = self.table.getParent orelse return error.InvalidHandle;
        return function(arg0);
    }
    pub fn removeAllChildren(self: Self, arg0: Param(Table, "removeAllChildren", 0)) Error!Return(Table, "removeAllChildren") {
        const function = self.table.removeAllChildren orelse return error.InvalidHandle;
        return function(arg0);
    }
};
