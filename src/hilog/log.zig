pub const types = @import("types.zig");
pub const core = @import("core.zig");
pub const config = @import("config.zig");
pub const redirect = @import("redirect.zig");

pub const default_domain = types.default_domain;
pub const default_tag = types.default_tag;
pub const redirect_tag = types.redirect_tag;

pub const LogType = types.LogType;
pub const Level = types.Level;
pub const Options = types.Options;
pub const LogCallback = types.LogCallback;
pub const PreferStrategy = types.PreferStrategy;

pub const Hilog = core.Hilog;
pub const Logger = core.Logger;
pub const setGlobalOptions = core.setGlobalOptions;
pub const getGlobalOptions = core.getGlobalOptions;
pub const print = core.print;
pub const printFmt = core.printFmt;
pub const printWithOptions = core.printWithOptions;
pub const printFmtWithOptions = core.printFmtWithOptions;
pub const log = core.log;
pub const logf = core.logf;
pub const debug = core.debug;
pub const info = core.info;
pub const warn = core.warn;
pub const err = core.err;
pub const @"error" = core.@"error";
pub const fatal = core.fatal;
pub const debugf = core.debugf;
pub const infof = core.infof;
pub const warnf = core.warnf;
pub const errf = core.errf;
pub const errorf = core.errorf;
pub const fatalf = core.fatalf;
pub const isLoggable = core.isLoggable;
pub const isLoggableWithOptions = core.isLoggableWithOptions;

pub const setCallback = config.setCallback;
pub const clearCallback = config.clearCallback;
pub const setMinLogLevel = config.setMinLogLevel;
pub const setLogLevel = config.setLogLevel;

pub const RedirectOptions = redirect.RedirectOptions;
pub const RedirectError = redirect.RedirectError;
pub const RedirectHandle = redirect.RedirectHandle;
pub const forwardStdioToHilog = redirect.forwardStdioToHilog;
pub const forward_stdio_to_hilog = redirect.forward_stdio_to_hilog;
pub const forwardStdioToHilogWithOptions = redirect.forwardStdioToHilogWithOptions;
