const std = @import("std");
const core = @import("core.zig");
const types = @import("types.zig");

const linux = std.os.linux;
const posix = std.posix;

pub const RedirectOptions = struct {
    log_options: types.Options = .{ .tag = types.redirect_tag },
    level: types.Level = .info,
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
            _ = core.printWithOptions(.err, options.log_options, "hilog stdio forwarder failed to read from pipe");
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
    _ = core.printWithOptions(options.level, options.log_options, trimmed);
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
