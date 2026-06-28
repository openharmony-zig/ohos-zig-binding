const std = @import("std");
const hilog = @import("hilog_sys");
const raw = @import("raw.zig");
const types = @import("types.zig");

const Level = types.Level;
const Options = types.Options;

var global_options_lock: std.atomic.Mutex = .unlocked;
var global_options: Options = .{};

/// Set the process-wide options used by the top-level logging helpers.
/// The tag slice must outlive later logging calls.
pub fn setGlobalOptions(options: Options) void {
    lock(&global_options_lock);
    defer global_options_lock.unlock();
    global_options = options;
}

pub fn getGlobalOptions() Options {
    lock(&global_options_lock);
    defer global_options_lock.unlock();
    return global_options;
}

pub const Hilog = struct {
    options: Options = .{},

    pub fn init(options: Options) Hilog {
        return .{ .options = options };
    }

    pub fn setOptions(self: *Hilog, options: Options) void {
        self.options = options;
    }

    pub fn print(self: *const Hilog, level: Level, msg: []const u8) c_int {
        return printWithOptions(level, self.options, msg);
    }

    pub fn printFmt(self: *const Hilog, level: Level, comptime fmt: []const u8, args: anytype) c_int {
        return printFmtWithOptions(level, self.options, fmt, args);
    }

    pub fn debug(self: *const Hilog, msg: []const u8) void {
        _ = self.print(.debug, msg);
    }

    pub fn info(self: *const Hilog, msg: []const u8) void {
        _ = self.print(.info, msg);
    }

    pub fn warn(self: *const Hilog, msg: []const u8) void {
        _ = self.print(.warn, msg);
    }

    pub fn err(self: *const Hilog, msg: []const u8) void {
        _ = self.print(.err, msg);
    }

    pub fn @"error"(self: *const Hilog, msg: []const u8) void {
        self.err(msg);
    }

    pub fn fatal(self: *const Hilog, msg: []const u8) void {
        _ = self.print(.fatal, msg);
    }

    pub fn debugf(self: *const Hilog, comptime fmt: []const u8, args: anytype) void {
        _ = self.printFmt(.debug, fmt, args);
    }

    pub fn infof(self: *const Hilog, comptime fmt: []const u8, args: anytype) void {
        _ = self.printFmt(.info, fmt, args);
    }

    pub fn warnf(self: *const Hilog, comptime fmt: []const u8, args: anytype) void {
        _ = self.printFmt(.warn, fmt, args);
    }

    pub fn errf(self: *const Hilog, comptime fmt: []const u8, args: anytype) void {
        _ = self.printFmt(.err, fmt, args);
    }

    pub fn errorf(self: *const Hilog, comptime fmt: []const u8, args: anytype) void {
        self.errf(fmt, args);
    }

    pub fn fatalf(self: *const Hilog, comptime fmt: []const u8, args: anytype) void {
        _ = self.printFmt(.fatal, fmt, args);
    }
};

pub const Logger = Hilog;

pub fn print(level: Level, msg: []const u8) c_int {
    return printWithOptions(level, getGlobalOptions(), msg);
}

pub fn printFmt(level: Level, comptime fmt: []const u8, args: anytype) c_int {
    return printFmtWithOptions(level, getGlobalOptions(), fmt, args);
}

pub fn printWithOptions(level: Level, options: Options, msg: []const u8) c_int {
    const allocator = std.heap.smp_allocator;
    const tag_z = allocator.dupeZ(u8, options.tag) catch return -1;
    defer allocator.free(tag_z);
    const msg_z = allocator.dupeZ(u8, msg) catch return -1;
    defer allocator.free(msg_z);

    return hilog.OH_LOG_Print(
        raw.rawType(options.log_type),
        raw.rawLevel(level),
        @as(c_uint, @intCast(options.domain)),
        @ptrCast(tag_z.ptr),
        "%{public}s",
        @as([*:0]const u8, msg_z.ptr),
    );
}

pub fn printFmtWithOptions(level: Level, options: Options, comptime fmt: []const u8, args: anytype) c_int {
    var buffer: [1024]u8 = undefined;
    const msg = std.fmt.bufPrint(&buffer, fmt, args) catch |format_err| switch (format_err) {
        error.NoSpaceLeft => {
            const allocator = std.heap.smp_allocator;
            const allocated = std.fmt.allocPrint(allocator, fmt, args) catch return -1;
            defer allocator.free(allocated);
            return printWithOptions(level, options, allocated);
        },
    };
    return printWithOptions(level, options, msg);
}

pub fn log(level: Level, msg: []const u8) void {
    _ = print(level, msg);
}

pub fn logf(level: Level, comptime fmt: []const u8, args: anytype) void {
    _ = printFmt(level, fmt, args);
}

pub fn debug(msg: []const u8) void {
    log(.debug, msg);
}

pub fn info(msg: []const u8) void {
    log(.info, msg);
}

pub fn warn(msg: []const u8) void {
    log(.warn, msg);
}

pub fn err(msg: []const u8) void {
    log(.err, msg);
}

pub fn @"error"(msg: []const u8) void {
    err(msg);
}

pub fn fatal(msg: []const u8) void {
    log(.fatal, msg);
}

pub fn debugf(comptime fmt: []const u8, args: anytype) void {
    logf(.debug, fmt, args);
}

pub fn infof(comptime fmt: []const u8, args: anytype) void {
    logf(.info, fmt, args);
}

pub fn warnf(comptime fmt: []const u8, args: anytype) void {
    logf(.warn, fmt, args);
}

pub fn errf(comptime fmt: []const u8, args: anytype) void {
    logf(.err, fmt, args);
}

pub fn errorf(comptime fmt: []const u8, args: anytype) void {
    errf(fmt, args);
}

pub fn fatalf(comptime fmt: []const u8, args: anytype) void {
    logf(.fatal, fmt, args);
}

pub fn isLoggable(level: Level) bool {
    return isLoggableWithOptions(level, getGlobalOptions());
}

pub fn isLoggableWithOptions(level: Level, options: Options) bool {
    const allocator = std.heap.smp_allocator;
    const tag_z = allocator.dupeZ(u8, options.tag) catch return false;
    defer allocator.free(tag_z);

    return hilog.OH_LOG_IsLoggable(
        @as(c_uint, @intCast(options.domain)),
        @ptrCast(tag_z.ptr),
        raw.rawLevel(level),
    );
}

fn lock(mutex: *std.atomic.Mutex) void {
    while (!mutex.tryLock()) {
        std.Thread.yield() catch {};
    }
}
