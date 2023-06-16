const std = @import("std");
const winapi = @import("winapi.zig");
const Manager = @This();

exe_path: []const u8,
dll_path: []const u8,
loader: std.DynLib,

const InitOption = struct {
    exe_path: []const u8,
    dll_path: []const u8,
};

pub fn init(options: InitOption) !Manager {
    var manager = Manager{
        .loader = try std.DynLib.open(options.dll_path),
        .exe_path = options.exe_path,
        .dll_path = options.dll_path,
    };

    const useUtf8 = try manager.lookupSymbol("UseUtf8");
    //const initWecomSocket = try manager.lookupSymbol("InitWxWorkSocket");

    _ = useUtf8();
    //_ = initWecomSocket();

    return manager;
}

fn lookupSymbol(self: *Manager, comptime name: [:0]const u8) !@field(winapi, name) {
    if (self.loader.lookup(@field(winapi, name), name)) |field| {
        return field;
    }
    return error.LookupSymbolFailed;
}

pub fn deinit(self: *Manager) void {
    self.loader.close();
    self.* = undefined;
}

test "init/deinit manager" {
    var manager = try Manager.init(.{
        .exe_path = "",
        .dll_path = "lib/WxWorkLoader_x64.dll",
    });
    defer manager.deinit();
}
