const std = @import("std");

pub const raw = @import("ashmem_sys");

const device_path = "/dev/ashmem";
const name_buffer_len: usize = raw.ASHMEM_NAME_LEN;
const max_name_len = name_buffer_len - 1;

pub const AshmemError = error{
    InvalidName,
    InvalidSize,
    InvalidFileDescriptor,
    SystemCallFailed,
    AlreadyMapped,
    NotMapped,
    ProtectionDenied,
    OutOfBounds,
};

/// Access requested for both the kernel ashmem region and its local mapping.
pub const Protection = packed struct(u3) {
    read: bool = false,
    write: bool = false,
    execute: bool = false,

    pub const read_only: Protection = .{ .read = true };
    pub const read_write: Protection = .{ .read = true, .write = true };

    fn native(self: Protection) c_int {
        var result: c_int = raw.PROT_NONE;
        if (self.read) result |= raw.PROT_READ;
        if (self.write) result |= raw.PROT_WRITE;
        if (self.execute) result |= raw.PROT_EXEC;
        return result;
    }

    fn contains(self: Protection, required: Protection) bool {
        return (!required.read or self.read) and
            (!required.write or self.write) and
            (!required.execute or self.execute);
    }
};

/// An owned OpenHarmony ashmem descriptor with an optional local mapping.
///
/// `attach` duplicates a descriptor received from another runtime or process,
/// so `deinit` never closes the caller's descriptor. Values are intentionally
/// not copy-safe; call `clone` when another owner is needed and call `deinit`
/// exactly once for every owner.
///
/// Shared reads and writes are not process-synchronized. Callers must provide
/// a protocol such as immutable frames, double buffering, or an IPC lock.
pub const Ashmem = struct {
    owned_fd: c_int = -1,
    region_size: usize = 0,
    mapping: ?[*]u8 = null,
    mapping_protection: Protection = .{},

    /// Creates a named ashmem region. The name is diagnostic only.
    pub fn create(name: []const u8, region_size: usize) AshmemError!Ashmem {
        if (name.len == 0 or name.len > max_name_len or
            std.mem.indexOfScalar(u8, name, 0) != null)
        {
            return error.InvalidName;
        }
        if (region_size == 0 or region_size > std.math.maxInt(i32)) return error.InvalidSize;

        const descriptor = retryOpen(device_path, raw.O_RDWR | raw.O_CLOEXEC) catch
            return error.SystemCallFailed;
        errdefer closeFd(descriptor);

        var name_buffer = [_]u8{0} ** name_buffer_len;
        @memcpy(name_buffer[0..name.len], name);
        if (retrySetName(descriptor, &name_buffer) < 0) {
            return error.SystemCallFailed;
        }
        if (retrySetSize(descriptor, region_size) < 0) {
            return error.SystemCallFailed;
        }

        return .{ .owned_fd = descriptor, .region_size = region_size };
    }

    /// Duplicates and validates an ashmem descriptor received through IPC.
    pub fn attach(source_fd: c_int) AshmemError!Ashmem {
        if (source_fd < 0) return error.InvalidFileDescriptor;
        const owned_fd = retryDup(source_fd) catch return error.SystemCallFailed;
        errdefer closeFd(owned_fd);

        const size_result = retryGetSize(owned_fd);
        if (size_result <= 0) return error.InvalidFileDescriptor;

        return .{
            .owned_fd = owned_fd,
            .region_size = @intCast(size_result),
        };
    }

    pub fn clone(self: *const Ashmem) AshmemError!Ashmem {
        return attach(try self.fd());
    }

    pub fn fd(self: *const Ashmem) AshmemError!c_int {
        if (self.owned_fd < 0) return error.InvalidFileDescriptor;
        return self.owned_fd;
    }

    pub fn size(self: *const Ashmem) usize {
        return self.region_size;
    }

    /// Permanently narrows the maximum kernel protection for this region.
    /// Ashmem does not allow a later call to restore removed access.
    pub fn setProtection(self: *const Ashmem, protection: Protection) AshmemError!void {
        const descriptor = try self.fd();
        if (retrySetProtection(descriptor, @intCast(protection.native())) < 0) {
            return error.SystemCallFailed;
        }
    }

    pub fn map(self: *Ashmem, protection: Protection) AshmemError!void {
        if (self.mapping != null) return error.AlreadyMapped;
        const descriptor = try self.fd();
        const address = raw.mmap(
            null,
            self.region_size,
            protection.native(),
            raw.MAP_SHARED,
            descriptor,
            0,
        );
        if (address == raw.MAP_FAILED or address == null) return error.SystemCallFailed;

        self.mapping = @ptrCast(address.?);
        self.mapping_protection = protection;
    }

    pub fn mapReadOnly(self: *Ashmem) AshmemError!void {
        try self.map(.read_only);
    }

    pub fn mapReadWrite(self: *Ashmem) AshmemError!void {
        try self.map(.read_write);
    }

    pub fn unmap(self: *Ashmem) AshmemError!void {
        const address = self.mapping orelse return;
        if (raw.munmap(@ptrCast(address), self.region_size) != 0) {
            return error.SystemCallFailed;
        }
        self.mapping = null;
        self.mapping_protection = .{};
    }

    pub fn read(self: *const Ashmem, offset: usize, output: []u8) AshmemError!void {
        const source = try self.checkedRange(offset, output.len, .read_only);
        @memcpy(output, source);
    }

    pub fn write(self: *Ashmem, offset: usize, input: []const u8) AshmemError!void {
        const destination = try self.checkedRange(offset, input.len, .{ .write = true });
        @memcpy(destination, input);
    }

    /// Returns the local mapping. The slice becomes invalid after `unmap` or
    /// `deinit`; callers remain responsible for cross-process synchronization.
    pub fn bytes(self: *Ashmem) AshmemError![]u8 {
        if (!self.mapping_protection.write) return error.ProtectionDenied;
        const address = self.mapping orelse return error.NotMapped;
        return address[0..self.region_size];
    }

    pub fn bytesReadOnly(self: *const Ashmem) AshmemError![]const u8 {
        if (!self.mapping_protection.read) return error.ProtectionDenied;
        const address = self.mapping orelse return error.NotMapped;
        return address[0..self.region_size];
    }

    /// Unmaps and closes owned resources. This operation is idempotent.
    pub fn deinit(self: *Ashmem) void {
        self.unmap() catch {};
        closeFd(self.owned_fd);
        self.owned_fd = -1;
        self.region_size = 0;
    }

    fn checkedRange(
        self: *const Ashmem,
        offset: usize,
        length: usize,
        required: Protection,
    ) AshmemError![]u8 {
        const address = self.mapping orelse return error.NotMapped;
        if (!self.mapping_protection.contains(required)) return error.ProtectionDenied;
        if (offset > self.region_size or length > self.region_size - offset) {
            return error.OutOfBounds;
        }
        return address[offset .. offset + length];
    }
};

fn retryOpen(path: [*:0]const u8, flags: c_int) !c_int {
    while (true) {
        const result = raw.open(path, flags);
        if (result >= 0) return result;
        if (std.posix.errno(result) != .INTR) return error.OpenFailed;
    }
}

fn retryDup(fd: c_int) !c_int {
    while (true) {
        const result = raw.fcntl(fd, raw.F_DUPFD_CLOEXEC, @as(c_int, 0));
        if (result >= 0) return result;
        if (std.posix.errno(result) != .INTR) return error.DupFailed;
    }
}

fn retrySetName(fd: c_int, name: [*c]const u8) c_int {
    while (true) {
        const result = raw.ohos_zig_ashmem_set_name(fd, name);
        if (result >= 0 or std.posix.errno(result) != .INTR) return result;
    }
}

fn retrySetSize(fd: c_int, size_value: usize) c_int {
    while (true) {
        const result = raw.ohos_zig_ashmem_set_size(fd, size_value);
        if (result >= 0 or std.posix.errno(result) != .INTR) return result;
    }
}

fn retryGetSize(fd: c_int) c_int {
    while (true) {
        const result = raw.ohos_zig_ashmem_get_size(fd);
        if (result >= 0 or std.posix.errno(result) != .INTR) return result;
    }
}

fn retrySetProtection(fd: c_int, protection: c_ulong) c_int {
    while (true) {
        const result = raw.ohos_zig_ashmem_set_protection(fd, protection);
        if (result >= 0 or std.posix.errno(result) != .INTR) return result;
    }
}

fn closeFd(fd: c_int) void {
    if (fd >= 0) _ = raw.close(fd);
}

test "protection containment is explicit" {
    try std.testing.expect(Protection.read_write.contains(.read_only));
    try std.testing.expect(Protection.read_write.contains(.{ .write = true }));
    try std.testing.expect(!Protection.read_only.contains(.{ .write = true }));
}

test "all public declarations compile" {
    std.testing.refAllDecls(@This());
}
