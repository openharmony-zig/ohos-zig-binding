const std = @import("std");

const raw = @import("input_method_sys");

pub const AttachOptionsHandle = raw.InputMethod_AttachOptions;
pub const EnterKeyType = raw.InputMethod_EnterKeyType;
pub const ExtendAction = raw.InputMethod_ExtendAction;
pub const Direction = raw.InputMethod_Direction;
pub const InputMethodProxyHandle = raw.InputMethod_InputMethodProxy;
pub const KeyboardStatus = raw.InputMethod_KeyboardStatus;
pub const PrivateCommand = raw.InputMethod_PrivateCommand;
pub const TextConfig = raw.InputMethod_TextConfig;
pub const TextEditorProxy = raw.InputMethod_TextEditorProxy;
pub const TextInputType = raw.InputMethod_TextInputType;

pub const keyboard_status = struct {
    pub const none: KeyboardStatus = raw.IME_KEYBOARD_STATUS_NONE;
    pub const hidden: KeyboardStatus = raw.IME_KEYBOARD_STATUS_HIDE;
    pub const shown: KeyboardStatus = raw.IME_KEYBOARD_STATUS_SHOW;
};

pub const enter_key = struct {
    pub const unspecified: EnterKeyType = raw.IME_ENTER_KEY_UNSPECIFIED;
    pub const newline: EnterKeyType = raw.IME_ENTER_KEY_NEWLINE;
};

pub const text_input_type = struct {
    pub const text: TextInputType = raw.IME_TEXT_INPUT_TYPE_TEXT;
    pub const multiline: TextInputType = raw.IME_TEXT_INPUT_TYPE_MULTILINE;
};

pub const direction = struct {
    pub const up: Direction = raw.IME_DIRECTION_UP;
    pub const down: Direction = raw.IME_DIRECTION_DOWN;
    pub const left: Direction = raw.IME_DIRECTION_LEFT;
    pub const right: Direction = raw.IME_DIRECTION_RIGHT;
};

pub const GetTextConfigFn = raw.OH_TextEditorProxy_GetTextConfigFunc;
pub const InsertTextFn = raw.OH_TextEditorProxy_InsertTextFunc;
pub const DeleteForwardFn = raw.OH_TextEditorProxy_DeleteForwardFunc;
pub const DeleteBackwardFn = raw.OH_TextEditorProxy_DeleteBackwardFunc;
pub const SendKeyboardStatusFn = raw.OH_TextEditorProxy_SendKeyboardStatusFunc;
pub const SendEnterKeyFn = raw.OH_TextEditorProxy_SendEnterKeyFunc;
pub const MoveCursorFn = raw.OH_TextEditorProxy_MoveCursorFunc;
pub const HandleSetSelectionFn = raw.OH_TextEditorProxy_HandleSetSelectionFunc;
pub const HandleExtendActionFn = raw.OH_TextEditorProxy_HandleExtendActionFunc;
pub const GetLeftTextOfCursorFn = raw.OH_TextEditorProxy_GetLeftTextOfCursorFunc;
pub const GetRightTextOfCursorFn = raw.OH_TextEditorProxy_GetRightTextOfCursorFunc;
pub const GetTextIndexAtCursorFn = raw.OH_TextEditorProxy_GetTextIndexAtCursorFunc;
pub const ReceivePrivateCommandFn = raw.OH_TextEditorProxy_ReceivePrivateCommandFunc;
pub const SetPreviewTextFn = raw.OH_TextEditorProxy_SetPreviewTextFunc;
pub const FinishTextPreviewFn = raw.OH_TextEditorProxy_FinishTextPreviewFunc;

pub const InputMethodError = error{
    EditorUnavailable,
    AttachOptionsUnavailable,
    AttachFailed,
    NativeCallFailed,
};

pub const EditorCallbacks = struct {
    get_text_config: GetTextConfigFn,
    insert_text: InsertTextFn,
    delete_forward: DeleteForwardFn,
    delete_backward: DeleteBackwardFn,
    send_keyboard_status: SendKeyboardStatusFn,
    send_enter_key: SendEnterKeyFn,
    move_cursor: MoveCursorFn,
    handle_set_selection: HandleSetSelectionFn,
    handle_extend_action: HandleExtendActionFn,
    get_left_text_of_cursor: GetLeftTextOfCursorFn,
    get_right_text_of_cursor: GetRightTextOfCursorFn,
    get_text_index_at_cursor: GetTextIndexAtCursorFn,
    receive_private_command: ReceivePrivateCommandFn,
    set_preview_text: SetPreviewTextFn,
    finish_text_preview: FinishTextPreviewFn,
};

/// Owned application-side text editor proxy.
///
/// It must remain alive while an input method is attached to it.
pub const TextEditor = struct {
    handle: ?*TextEditorProxy,

    pub fn init(callbacks: EditorCallbacks) InputMethodError!TextEditor {
        const handle = raw.OH_TextEditorProxy_Create() orelse
            return error.EditorUnavailable;
        errdefer raw.OH_TextEditorProxy_Destroy(handle);

        try check(raw.OH_TextEditorProxy_SetGetTextConfigFunc(handle, callbacks.get_text_config));
        try check(raw.OH_TextEditorProxy_SetInsertTextFunc(handle, callbacks.insert_text));
        try check(raw.OH_TextEditorProxy_SetDeleteForwardFunc(handle, callbacks.delete_forward));
        try check(raw.OH_TextEditorProxy_SetDeleteBackwardFunc(handle, callbacks.delete_backward));
        try check(raw.OH_TextEditorProxy_SetSendKeyboardStatusFunc(handle, callbacks.send_keyboard_status));
        try check(raw.OH_TextEditorProxy_SetSendEnterKeyFunc(handle, callbacks.send_enter_key));
        try check(raw.OH_TextEditorProxy_SetMoveCursorFunc(handle, callbacks.move_cursor));
        try check(raw.OH_TextEditorProxy_SetHandleSetSelectionFunc(handle, callbacks.handle_set_selection));
        try check(raw.OH_TextEditorProxy_SetHandleExtendActionFunc(handle, callbacks.handle_extend_action));
        try check(raw.OH_TextEditorProxy_SetGetLeftTextOfCursorFunc(handle, callbacks.get_left_text_of_cursor));
        try check(raw.OH_TextEditorProxy_SetGetRightTextOfCursorFunc(handle, callbacks.get_right_text_of_cursor));
        try check(raw.OH_TextEditorProxy_SetGetTextIndexAtCursorFunc(handle, callbacks.get_text_index_at_cursor));
        try check(raw.OH_TextEditorProxy_SetReceivePrivateCommandFunc(handle, callbacks.receive_private_command));
        try check(raw.OH_TextEditorProxy_SetSetPreviewTextFunc(handle, callbacks.set_preview_text));
        try check(raw.OH_TextEditorProxy_SetFinishTextPreviewFunc(handle, callbacks.finish_text_preview));
        return .{ .handle = handle };
    }

    pub fn deinit(self: *TextEditor) void {
        const handle = self.handle orelse return;
        self.handle = null;
        raw.OH_TextEditorProxy_Destroy(handle);
    }
};

pub const AttachOptions = struct {
    handle: ?*AttachOptionsHandle,

    pub fn init(show_keyboard: bool) InputMethodError!AttachOptions {
        return .{
            .handle = raw.OH_AttachOptions_Create(show_keyboard) orelse
                return error.AttachOptionsUnavailable,
        };
    }

    pub fn deinit(self: *AttachOptions) void {
        const handle = self.handle orelse return;
        self.handle = null;
        raw.OH_AttachOptions_Destroy(handle);
    }
};

/// Service-owned proxy returned by attach. `detach` invalidates it.
pub const InputMethod = struct {
    handle: ?*InputMethodProxyHandle,

    pub fn attach(
        editor: *const TextEditor,
        options: *const AttachOptions,
    ) InputMethodError!InputMethod {
        var handle: ?*InputMethodProxyHandle = null;
        try check(raw.OH_InputMethodController_Attach(
            editor.handle,
            options.handle,
            &handle,
        ));
        return .{ .handle = handle orelse return error.AttachFailed };
    }

    pub fn showKeyboard(self: *const InputMethod) InputMethodError!void {
        try check(raw.OH_InputMethodProxy_ShowKeyboard(self.handle));
    }

    pub fn detach(self: *InputMethod) InputMethodError!void {
        const handle = self.handle orelse return;
        try check(raw.OH_InputMethodController_Detach(handle));
        self.handle = null;
    }
};

pub fn configureText(
    config: ?*TextConfig,
    input_type: TextInputType,
    enter_key_type: EnterKeyType,
) InputMethodError!void {
    try check(raw.OH_TextConfig_SetInputType(config, input_type));
    try check(raw.OH_TextConfig_SetEnterKeyType(config, enter_key_type));
}

fn check(result: raw.InputMethod_ErrorCode) InputMethodError!void {
    if (result != raw.IME_ERR_OK) return error.NativeCallFailed;
}

test "input method public declarations are reachable" {
    std.testing.refAllDecls(@This());
}
