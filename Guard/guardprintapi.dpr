// ***************************************************************
//  HookPrintAPIs.dll         version:  1.0   ·  date: 2003-06-15
//  -------------------------------------------------------------
//  hook several print APIs and notify application about calls
//  -------------------------------------------------------------
//  Copyright (C) 1999 - 2003 www.madshi.net, All Rights Reserved
// ***************************************************************

// 2003-06-15 1.0  initial release

library guardprintapi;

{$IMAGEBASE $5a000000}

uses
  Messages, 
  Windows,
  madCodeHook,
  madStrings,
  WinSpool;

// ***************************************************************

type
  TPrintNotification = record
    process : array [0..MAX_PATH] of char;
    api     : array [0..MAX_PATH] of char;
    params  : array [0..MAX_PATH] of char;
    result  : array [0..MAX_PATH] of char;
  end;

procedure NotifyApplication(api: string; deviceA: pchar; deviceW: pwidechar;
                            dc: dword; dia: PDocInfoA; diw: PDocInfoW;
                            job: integer; result: boolean);
// this function composes all the strings and sends them to our log window
var pn      : TPrintNotification;
    arrChA  : array [0..MAX_PATH] of char;
    arrChW  : array [0..MAX_PATH] of wideChar;
    session : dword;
begin
  // fill the "process" and "api" strings, the format is independent of the API
  if GetVersion and $80000000 = 0 then begin
    GetModuleFileNameW(0, arrChW, MAX_PATH);
    WideToAnsi(arrChW, pn.process);
  end else
    GetModuleFileNameA(0, pn.process, MAX_PATH);
  lstrcpyA(pn.api, pchar(api));
  if (deviceA <> nil) or (deviceW <> nil) then begin
    // this is the CreateDCA/W API
    if deviceA <> nil then begin
      lstrcpyA(arrChA, deviceA);
      arrChA[11] := #0;
      if lstrcmpA('\\.\DISPLAY', arrChA) = 0 then
        // no, we don't want to display dcs!
        exit;
      lstrcpyA(arrChA, deviceA);
    end else begin
      lstrcpyW(arrChW, deviceW);
      arrChW[11] := #0;
      if lstrcmpW('\\.\DISPLAY', arrChW) = 0 then
        exit;
      WideToAnsi(deviceW, arrChA);
    end;
    // we output one parameter, namely the printer name
    lstrcpyA(pn.params, 'printer: "');
    lstrcatA(pn.params, arrChA);
    lstrcatA(pn.params, '"');
    // the result is either a valid dc handle or a failure indicator
    if dc <> 0 then begin
      lstrcpyA(pn.result, 'dc: ');
      lstrcatA(pn.result, pchar(IntToHexEx(dc)));
    end else
      lstrcpyA(pn.result, 'error');
  end else 
  if dc<>0 then begin
    // all other APIs have a "dc" paramter, so we output it first
    lstrcpyA(pn.params, 'dc: ');
    lstrcatA(pn.params, pchar(IntToHexEx(dc)));
    if (dia <> nil) or (diw <> nil) then begin
      // this is the StartDocA/W API, it has an additional "doc" parameter
      if dia <> nil then begin
        // ansi version
        if dia^.lpszDocName <> nil then begin
          lstrcatA(pn.params, '; doc: "');
          lstrcatA(pn.params, dia^.lpszDocName);
          lstrcatA(pn.params, '"');
        end;
        if dia^.lpszOutput <> nil then begin
          lstrcatA(pn.params, '; output: "');
          lstrcatA(pn.params, dia^.lpszOutput);
          lstrcatA(pn.params, '"');
        end;
      end else begin
        // wide version
        if diw^.lpszDocName <> nil then begin
          WideToAnsi(diw^.lpszDocName, arrChA);
          lstrcatA(pn.params, '; doc: "');
          lstrcatA(pn.params, arrChA);
          lstrcatA(pn.params, '"');
        end;
        if diw^.lpszOutput <> nil then begin
          WideToAnsi(diw^.lpszOutput, arrChA);
          lstrcatA(pn.params, '; output: "');
          lstrcatA(pn.params, arrChA);
          lstrcatA(pn.params, '"');
        end;
      end;
      // the result is either a valid job identifier or a failure indicator
      if job > 0 then begin
        lstrcpyA(pn.result, 'job: ');
        lstrcatA(pn.result, pchar(IntToHexEx(job)));
      end else
        lstrcpyA(pn.result, 'error');
    end else
      // all the other ideas have only a boolean result
      if result then
           lstrcpyA(pn.result, 'success')
      else lstrcpyA(pn.result, 'error'  );
  end else begin
    if result then
      lstrcpyA(pn.result, 'success') else 
      lstrcpyA(pn.result, 'error'  );
  end;
  
  // which terminal server (XP fast user switching) session shall we contact?
  if AmSystemProcess and (GetCurrentSessionId = 0) then
    // some system process are independent of sessions
    // so let's contact the PrintMonitor application instance
    // which is running in the current input session
    session := GetInputSessionId
  else
    // we're an application running in a specific session
    // let's contact the PrintMonitor application instance
    // which runs in the same session as we do
    session := GetCurrentSessionId;
  // now send the composed strings to our log window
  // hopefully there's an instance running in the specified session
  SendIpcMessage(pchar('guardPrintMonitor' + IntToStrEx(session)), @pn, sizeOf(pn));
end;

// ***************************************************************

var CreateDCANext : function (driver, device, output: pchar; dm: PDeviceModeA) : dword; stdcall;
    CreateDCWNext : function (driver, device, output: pwidechar; dm: PDeviceModeW) : dword; stdcall;
    StartDocANext : function (dc: dword; const di: TDocInfoA) : integer; stdcall;
    StartDocWNext : function (dc: dword; const di: TDocInfoW) : integer; stdcall;
    EndDocNext    : function (dc: dword) : integer; stdcall;
    StartPageNext : function (dc: dword) : integer; stdcall;
    EndPageNext   : function (dc: dword) : integer; stdcall;
    AbortDocNext  : function (dc: dword) : integer; stdcall;

    PostMessageANext : function (hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
    PostMessageWNext : function (hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
    
    
    DocumentPropertiesNext : function (
      hWnd: HWND; hPrinter: THandle; pDeviceName: PChar;
      const pDevModeOutput: TDeviceMode; var pDevModeInput: TDeviceMode;
      fMode: DWORD): Longint; stdcall;
      
    DocumentPropertiesANext : function (
      hWnd: HWND; hPrinter: THandle; pDeviceName: PAnsiChar;
      pDevModeOutput: PDeviceModeA; pDevModeInput: PDeviceModeA;
      fMode: DWORD): Longint; stdcall;

    DocumentPropertiesWNext : function (
      hWnd: HWND; hPrinter: THandle; pDeviceName: PWideChar;
      pDevModeOutput: PDeviceModeW; PDevModeInput: PDeviceModeW;
      fMode: DWORD): Longint; stdcall;

function CreateDCACallback(driver, device, output: pchar; dm: PDeviceModeA) : dword; stdcall;
var Copies : Short;
begin

  RenewHook(@DocumentPropertiesANext);
  RenewHook(@DocumentPropertiesWNext);

  if dm <> nil then
    Copies := dm^.dmCopies else
    Copies := 0;  
    
  result := CreateDCANext(driver, device, output, dm);
  // we log this call only if it is a printer DC creation
  if (device <> nil) and (not IsBadReadPtr(device, 1)) and (device^ <> #0) then
    NotifyApplication('CreateDCA'+IntToStrEx(Copies), device, nil, result, nil, nil, 0, false);
end;

function CreateDCWCallback(driver, device, output: pwidechar; dm: PDeviceModeW) : dword; stdcall;
var Copies : Short;
begin

  RenewHook(@DocumentPropertiesANext);
  RenewHook(@DocumentPropertiesWNext);
  
  if dm <> nil then
    Copies := dm^.dmCopies else 
    Copies := 0;  
    
  result := CreateDCWNext(driver, device, output, dm);
  if (device <> nil) and (not IsBadReadPtr(device, 2)) and (device^ <> #0) then
    NotifyApplication('CreateDCW'+IntToStrEx(Copies), nil, device, result, nil, nil, 0, false);
end;

function PostMessageACallback(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  result := PostMessageANext(hWnd, Msg, wParam, lParam);
  if Msg = $0012 then
    NotifyApplication('PostMessage', nil, nil, 0, nil, nil, 0, false);
end;

function PostMessageWCallback(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  result := PostMessageWNext(hWnd, Msg, wParam, lParam);
  if Msg = $0012 then
    NotifyApplication('PostMessage', nil, nil, 0, nil, nil, 0, false);
end;

function StartDocACallback(dc: dword; const di: TDocInfoA) : integer; stdcall;
begin
  result := StartDocANext(dc, di);
  NotifyApplication('StartDocA', nil, nil, dc, @di, nil, result, false);
end;

function StartDocWCallback(dc: dword; const di: TDocInfoW) : integer; stdcall;
begin
  result := StartDocWNext(dc, di);
  NotifyApplication('StartDocW', nil, nil, dc, nil, @di, result, false);
end;

function EndDocCallback(dc: dword) : integer; stdcall;
begin
  result := EndDocNext(dc);
  NotifyApplication('EndDoc', nil, nil, dc, nil, nil, 0, result > 0);
end;

function StartPageCallback(dc: dword) : integer; stdcall;
begin
  result := StartPageNext(dc);
  NotifyApplication('StartPage', nil, nil, dc, nil, nil, 0, result > 0);
end;

function EndPageCallback(dc: dword) : integer; stdcall;
begin
  result := EndPageNext(dc);
  NotifyApplication('EndPage', nil, nil, dc, nil, nil, 0, result > 0);
end;

function AbortDocCallback(dc: dword) : integer; stdcall;
begin
  result := AbortDocNext(dc);
  NotifyApplication('AbortDoc', nil, nil, dc, nil, nil, 0, result > 0);
end;

function DocumentPropertiesCallback(
      hWnd: HWND; hPrinter: THandle; pDeviceName: PChar;
      pDevModeOutput: TDeviceMode; pDevModeInput: TDeviceMode;
      fMode: DWORD): Longint; stdcall;
var
  Copies : Integer;      
begin
  result := DocumentPropertiesNext(hWnd, hPrinter, pDeviceName, pDevModeOutput, pDevModeInput, fMode);
  Copies := 1;
  if pDevModeOutput.dmCopies>Copies then
    Copies := pDevModeOutput.dmCopies
  else
    if pDevModeInput.dmCopies>Copies then
      Copies := pDevModeInput.dmCopies;
    
  NotifyApplication('DocProp'+IntToStrEx(Copies), pDeviceName, nil, result, nil, nil, 0, result > 0);
end;

function DocumentPropertiesACallback(
      hWnd: HWND; hPrinter: THandle; pDeviceName: PAnsiChar;
      pDevModeOutput: PDeviceModeA; pDevModeInput: PDeviceModeA;
      fMode: DWORD): Longint; stdcall;
var
  Copies : Integer;      
begin
  result := DocumentPropertiesANext(hWnd, hPrinter, pDeviceName, pDevModeOutput, pDevModeInput, fMode);
  Copies := 1;
  if pDevModeOutput<>nil then begin
    if pDevModeOutput^.dmCopies>Copies then
      Copies := pDevModeOutput^.dmCopies;
  end else
  if pDevModeInput<>nil then
    if pDevModeInput^.dmCopies>Copies then
      Copies := pDevModeInput^.dmCopies;
    
  NotifyApplication('DocPropA'+IntToStrEx(Copies), pDeviceName, nil, result, nil, nil, 0, result > 0);
end;
      
function DocumentPropertiesWCallback(
      hWnd: HWND; hPrinter: THandle; pDeviceName: PWideChar;
      pDevModeOutput: PDeviceModeW; pDevModeInput: PDeviceModeW;
      fMode: DWORD): Longint; stdcall;
var
  Copies : Integer;      
begin
  result := DocumentPropertiesWNext(hWnd, hPrinter, pDeviceName, pDevModeOutput, pDevModeInput, fMode);
  Copies := 1;
  if pDevModeOutput<>nil then begin
    if pDevModeOutput^.dmCopies>Copies then
      Copies := pDevModeOutput^.dmCopies;
  end else
  if pDevModeInput<>nil then
    if pDevModeInput^.dmCopies>Copies then
      Copies := pDevModeInput^.dmCopies;
  NotifyApplication('DocPropW'+IntToStrEx(Copies), nil, pDeviceName, result, nil, nil, 0, result > 0);
end;     

// ***************************************************************


Procedure EntryPoint(Reason: integer);
var buf: array[0..MAX_PATH] of char;
 begin
  case Reason of
  DLL_PROCESS_DETACH:
  begin
 // DLL is unloaded and you can get notified here
  end;
  DLL_PROCESS_ATTACH:
  begin       
    GetModuleFileName(0, @buf, sizeof(buf));
    if (posPchar(pchar('msnmsgr.exe'), buf, 0, 0, True)>0) or 
       (posPchar(pchar('skype.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('photoshop.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('fifa09.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('farcry2.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('fc2launcher.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('ragnarok.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('rundll32.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('bf2.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('hl.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('cstrike.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('frzstate.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('left4dead.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('dfservex.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('sims2.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('ts2bodyshop.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('packageinstaller.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('deadislandgame.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('matonline.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('matlauncher.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('mat.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('undiffer.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('chrome.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('airgcfg.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('aniwconnservice.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('lms.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('mscorsvw.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('seaport.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('uns.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('services.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('wzcsldr2.exe'), buf, 0, 0, True)>0) or

       (posPchar(pchar('hdeck.exe'), buf, 0, 0, True)>0) or

       (posPchar(pchar('svchost.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('wininit.exe'), buf, 0, 0, True)>0) or

       (posPchar(pchar('nexguard.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('rthdcpl.exe'), buf, 0, 0, True)>0) or
       
       (posPchar(pchar('rf.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('rdm.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('rfaviplayer.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('sendlog.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('fggm.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('hsupdate.exe'), buf, 0, 0, True)>0) or

       (posPchar(pchar('iw3mp.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('iw3sp.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('pnkbstrb.exe'), buf, 0, 0, True)>0) or

       (posPchar(pchar('conquer.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('play.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('timedelay.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('ctfmon.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('frzstate2k.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('df5serv.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('grandchase.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('main.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('gamemon.des'), buf, 0, 0, True)>0) or

       (posPchar(pchar('tb85rtm.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('tb85run.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('tb85net.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('tbload.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('tb85main.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('wowexec'), buf, 0, 0, True)>0) or       
       
       (posPchar(pchar('age3.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('avatar.exe'), buf, 0, 0, True)>0) or  
       (posPchar(pchar('combatarms.exe'), buf, 0, 0, True)>0) or              
       (posPchar(pchar('age3x.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('age3y.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('steam.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('starter.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('bf1942.exe'), buf, 0, 0, True)>0) or
       (PosPChar(pchar('theduel.exe'), buf, 0, 0, True)>0) or
       (PosPChar(pchar('patcher.exe'), buf, 0, 0, True)>0) or
       (PosPChar(pchar('bareport.exe'), buf, 0, 0, True)>0) or
       (PosPChar(pchar('creportbugs.exe'), buf, 0, 0, True)>0) or
       (PosPChar(pchar('pwprotector.exe'), buf, 0, 0, True)>0) or
       (PosPChar(pchar('elementclient.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('gta4launcher.exe'), buf, 0, 0, True)>0) or
       (PosPChar(pchar('gunzlauncher.exe'), buf, 0, 0, True)>0) or
       (PosPChar(pchar('xtrap'), buf, 0, 0, True)>0) or
       (PosPChar(pchar('launcher.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('explorer.exe'), buf, 0, 0, True)>0) or
       (posPchar(pchar('winlogon.exe'), buf, 0, 0, True)>0) 
    then
      ExitCode :=-1
    else begin 
      CollectHooks;
      HookAPI(winspl, 'DocumentPropertiesA',  @DocumentPropertiesACallback,  @DocumentPropertiesANext);
      HookAPI(winspl, 'DocumentPropertiesW',  @DocumentPropertiesWCallback,  @DocumentPropertiesWNext);
      HookAPI('gdi32.dll', 'CreateDCA', @CreateDCACallback, @CreateDCANext);
      HookAPI('gdi32.dll', 'CreateDCW', @CreateDCWCallback, @CreateDCWNext);
      HookAPI('gdi32.dll', 'StartDocA', @StartDocACallback, @StartDocANext);
      HookAPI('gdi32.dll', 'StartDocW', @StartDocWCallback, @StartDocWNext);
      HookAPI('gdi32.dll', 'EndDoc',    @EndDocCallback,    @EndDocNext   );
      HookAPI('gdi32.dll', 'StartPage', @StartPageCallback, @StartPageNext);
      HookAPI('gdi32.dll', 'EndPage',   @EndPageCallback,   @EndPageNext  );
      HookAPI('gdi32.dll', 'AbortDoc',  @AbortDocCallback,  @AbortDocNext );
{      HookAPI('user32.dll', 'PostMessageA', @PostMessageACallback, @PostMessageANext);
      HookAPI('user32.dll', 'PostMessageW', @PostMessageWCallback, @PostMessageWNext);}
      FlushHooks;
    end;
  end;
 
  DLL_THREAD_ATTACH: ;
  DLL_THREAD_DETACH: ;
  end;
end;
 
begin
  DisableThreadLibraryCalls(hInstance);
  DLLProc :=@EntryPoint;
  EntryPoint(DLL_PROCESS_ATTACH); 
  // collecting hooks can improve the hook installation performance in win9x
end.
