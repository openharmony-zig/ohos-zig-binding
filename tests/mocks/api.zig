pub const current: u32 = 26;
pub fn require(comptime _: []const u8, comptime introduced: u32) void {
    if (introduced > current) @compileError("API not available");
}
