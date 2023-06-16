const std = @import("std");
const windows = std.os.windows;
const WINAPI = windows.WINAPI;
const LPSTR = windows.LPSTR;
const LPCSTR = windows.LPCSTR;
const BOOL = windows.BOOL;
const DWORD = windows.DWORD;

pub const GetUserWxWorkVersion = *const fn (szVersion: LPSTR) callconv(WINAPI) BOOL;
pub const UseUtf8 = *const fn () callconv(WINAPI) BOOL;
pub const InitWxWorkSocket = *const fn (dwConnectCallback: DWORD, dwRecvCallback: DWORD, dwCloseCallback: DWORD) callconv(WINAPI) BOOL;
pub const InjectWxWork = *const fn (szDllPath: LPCSTR, szWxWorkExePath: LPCSTR) callconv(WINAPI) BOOL;
pub const InjectWxWorkPid = *const fn (dwPid: DWORD, szDllPath: LPCSTR) callconv(WINAPI) BOOL;
pub const InjectWxWorkMultiOpen = *const fn (szDllPath: LPCSTR, szWxWorkExePath: LPCSTR) callconv(.Stdcall) BOOL;
pub const SendWxWorkData = *const fn (dwClientId: DWORD, szJsonData: LPCSTR) callconv(WINAPI) BOOL;
pub const DestroyWxWork = *const fn () callconv(WINAPI) BOOL;
