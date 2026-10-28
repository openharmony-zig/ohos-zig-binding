const std = @import("std");
const udmf = @import("udmf");
const raw = udmf.raw;

test "data record views borrow native storage without releasing it" {
    raw.reset();
    var data = try udmf.Data.create();
    const records = try data.records();
    try std.testing.expectEqual(@as(usize, 1), records.count());
    try std.testing.expectEqual(&raw.record, (try records.get(0)).handle);
    try std.testing.expectEqual(&raw.record, (try data.record(0)).handle);
    try std.testing.expectError(error.InvalidArgument, records.get(1));
    try std.testing.expectError(error.InvalidArgument, data.record(1));
    data.deinit();
    data.deinit();
    try std.testing.expectEqual(@as(usize, 1), raw.data_destroyed);
    try std.testing.expectEqual(@as(usize, 0), raw.record_destroyed);
    try std.testing.expectError(error.InvalidHandle, data.records());
}

test "empty and null record entries are checked" {
    raw.reset();
    var data = try udmf.Data.create();
    defer data.deinit();
    raw.count = 0;
    try std.testing.expectEqual(@as(usize, 0), (try data.records()).count());
    raw.count = 2;
    try std.testing.expectError(error.UnexpectedNull, (try data.records()).get(1));
    try std.testing.expectError(error.UnexpectedNull, data.record(1));
}

test "typed getters clean up failed output containers and return owned results" {
    raw.reset();
    var data = try udmf.Data.create();
    defer data.deinit();
    const record = try data.record(0);
    raw.get_status = -1;
    try std.testing.expectError(error.NativeCallFailed, data.primaryPlainText());
    try std.testing.expectError(error.NativeCallFailed, record.plainText());
    try std.testing.expectEqual(@as(usize, 2), raw.text_destroyed);
    raw.get_status = 0;
    var text = try record.plainText();
    try std.testing.expectEqual(@as(usize, 2), raw.text_destroyed);
    text.deinit();
    text.deinit();
    try std.testing.expectEqual(@as(usize, 3), raw.text_destroyed);
}
