const std = @import("std");
const hilog = @import("hilog_sys");

const linux = std.os.linux;
const posix = std.posix;

pub const default_domain: u32 = 0x0000;
pub const default_tag = "zig-ohos";
pub const redirect_tag = "ZigStdoutStderr";

pub const LogType = enum(u32) {
    app = 0,
};

pub const Level = enum(u32) {
    debug = 3,
    info = 4,
    warn = 5,
    err = 6,
    fatal = 7,
};

pub const PreferStrategy = enum(u32) {
    unset_log_level = 0,
    prefer_close_log = 1,
    prefer_open_log = 2,
};

pub const Options = struct {
    domain: u32 = default_domain,
    tag: []const u8 = default_tag,
    log_type: LogType = .app,
};

pub const LogCallback = hilog.LogCallback;

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
        rawType(options.log_type),
        rawLevel(level),
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
        rawLevel(level),
    );
}

pub fn setCallback(callback: LogCallback) void {
    hilog.OH_LOG_SetCallback(callback);
}

pub fn clearCallback() void {
    hilog.OH_LOG_SetCallback(null);
}

pub fn setMinLogLevel(level: Level) void {
    hilog.OH_LOG_SetMinLogLevel(rawLevel(level));
}

pub fn setLogLevel(level: Level, strategy: PreferStrategy) void {
    hilog.OH_LOG_SetLogLevel(rawLevel(level), rawPreferStrategy(strategy));
}

pub const RedirectOptions = struct {
    log_options: Options = .{ .tag = redirect_tag },
    level: Level = .info,
};

pub const RedirectError = std.Thread.SpawnError || error{
    UnsupportedTarget,
    ProcessFdLimit,
    SystemResources,
    PermissionDenied,
    Unexpected,
};

pub const RedirectHandle = struct {
    thread: std.Thread,

    pub fn join(self: RedirectHandle) void {
        self.thread.join();
    }

    pub fn detach(self: RedirectHandle) void {
        self.thread.detach();
    }
};

pub fn forwardStdioToHilog() RedirectError!RedirectHandle {
    return forwardStdioToHilogWithOptions(.{});
}

pub fn forward_stdio_to_hilog() RedirectError!RedirectHandle {
    return forwardStdioToHilog();
}

pub fn forwardStdioToHilogWithOptions(options: RedirectOptions) RedirectError!RedirectHandle {
    if (@import("builtin").os.tag != .linux) return error.UnsupportedTarget;

    const fds = try pipeCloexec();
    const read_fd = fds[0];
    const write_fd = fds[1];

    var read_owned = true;
    var write_owned = true;
    errdefer if (read_owned) closeFd(read_fd);
    errdefer if (write_owned) closeFd(write_fd);

    try dup2Fd(write_fd, posix.STDOUT_FILENO);
    try dup2Fd(write_fd, posix.STDERR_FILENO);

    closeFd(write_fd);
    write_owned = false;

    const thread = try std.Thread.spawn(
        .{ .allocator = std.heap.smp_allocator },
        forwardPipeToHilog,
        .{ read_fd, options },
    );
    read_owned = false;

    return .{ .thread = thread };
}

fn forwardPipeToHilog(read_fd: posix.fd_t, options: RedirectOptions) void {
    defer closeFd(read_fd);

    var read_buffer: [4096]u8 = undefined;
    var line_buffer: [4096]u8 = undefined;
    var line_len: usize = 0;

    while (true) {
        const len = posix.read(read_fd, &read_buffer) catch {
            _ = printWithOptions(.err, options.log_options, "hilog stdio forwarder failed to read from pipe");
            return;
        };
        if (len == 0) break;

        for (read_buffer[0..len]) |byte| {
            if (byte == '\n') {
                flushForwardedLine(options, line_buffer[0..line_len]);
                line_len = 0;
                continue;
            }

            if (line_len == line_buffer.len) {
                flushForwardedLine(options, line_buffer[0..line_len]);
                line_len = 0;
            }

            line_buffer[line_len] = byte;
            line_len += 1;
        }
    }

    if (line_len != 0) {
        flushForwardedLine(options, line_buffer[0..line_len]);
    }
}

fn flushForwardedLine(options: RedirectOptions, line: []const u8) void {
    const trimmed = std.mem.trimEnd(u8, line, "\r");
    _ = printWithOptions(options.level, options.log_options, trimmed);
}

fn pipeCloexec() RedirectError![2]posix.fd_t {
    var fds: [2]posix.fd_t = undefined;
    while (true) {
        const rc = linux.pipe2(&fds, .{ .CLOEXEC = true });
        switch (posix.errno(rc)) {
            .SUCCESS => return fds,
            .INTR => continue,
            else => |errno| return errnoToRedirectError(errno),
        }
    }
}

fn dup2Fd(old_fd: posix.fd_t, new_fd: posix.fd_t) RedirectError!void {
    while (true) {
        const rc = linux.dup2(old_fd, new_fd);
        switch (posix.errno(rc)) {
            .SUCCESS => return,
            .INTR => continue,
            else => |errno| return errnoToRedirectError(errno),
        }
    }
}

fn closeFd(fd: posix.fd_t) void {
    _ = linux.close(fd);
}

fn errnoToRedirectError(errno: posix.E) RedirectError {
    return switch (errno) {
        .MFILE => error.ProcessFdLimit,
        .NFILE, .NOMEM => error.SystemResources,
        .ACCES, .PERM => error.PermissionDenied,
        else => error.Unexpected,
    };
}

fn rawType(log_type: LogType) hilog.LogType {
    return @as(hilog.LogType, @intCast(@intFromEnum(log_type)));
}

fn rawLevel(level: Level) hilog.LogLevel {
    return @as(hilog.LogLevel, @intCast(@intFromEnum(level)));
}

fn rawPreferStrategy(strategy: PreferStrategy) hilog.PreferStrategy {
    return @as(hilog.PreferStrategy, @intCast(@intFromEnum(strategy)));
}

fn lock(mutex: *std.atomic.Mutex) void {
    while (!mutex.tryLock()) {
        std.Thread.yield() catch {};
    }
}
