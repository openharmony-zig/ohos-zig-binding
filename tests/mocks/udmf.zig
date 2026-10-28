pub const OH_UdmfData = struct { value: u8 = 0 };
pub const OH_UdmfRecord = struct { value: u8 = 0 };
pub const OH_UdsPlainText = struct { value: u8 = 0 };
pub var data: OH_UdmfData = .{};
pub var record: OH_UdmfRecord = .{};
pub var text: OH_UdsPlainText = .{};
pub var values: [2]?*OH_UdmfRecord = .{ &record, null };
pub var count: c_uint = 1;
pub var get_status: c_int = 0;
pub var data_destroyed: usize = 0;
pub var record_destroyed: usize = 0;
pub var text_destroyed: usize = 0;
pub fn reset() void {
    count = 1;
    get_status = 0;
    data_destroyed = 0;
    record_destroyed = 0;
    text_destroyed = 0;
}
pub fn OH_UdmfData_Create() ?*OH_UdmfData {
    return &data;
}
pub fn OH_UdmfData_Destroy(_: *OH_UdmfData) void {
    data_destroyed += 1;
}
pub fn OH_UdmfData_GetRecords(_: *OH_UdmfData, len: *c_uint) [*c]?*OH_UdmfRecord {
    len.* = count;
    return if (count == 0) null else &values;
}
pub fn OH_UdmfData_GetRecordCount(_: *OH_UdmfData) c_int {
    return @intCast(count);
}
pub fn OH_UdmfData_GetRecord(_: ?*OH_UdmfData, index: c_uint) ?*OH_UdmfRecord {
    return values[index];
}
pub fn OH_UdmfRecord_Destroy(_: *OH_UdmfRecord) void {
    record_destroyed += 1;
}
pub fn OH_UdsPlainText_Create() ?*OH_UdsPlainText {
    return &text;
}
pub fn OH_UdsPlainText_Destroy(_: *OH_UdsPlainText) void {
    text_destroyed += 1;
}
pub fn OH_UdmfData_GetPrimaryPlainText(_: *OH_UdmfData, _: ?*OH_UdsPlainText) c_int {
    return get_status;
}
pub fn OH_UdmfRecord_GetPlainText(_: *OH_UdmfRecord, _: ?*OH_UdsPlainText) c_int {
    return get_status;
}
