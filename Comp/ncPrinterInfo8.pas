unit ncPrinterInfo8;

interface

uses windows, sysutils, classes, forms, ncPrinterConstsAndTypes,
     ncPrintException, printers, winspool, ncCommonProc, registry, strutils,
     dialogs, math, IniFiles, uLogs;

function ChangePrinterPaper(APrinterName: PChar; aPaperSize, aPaperLength, aPaperWidth, aOrientation: SHORT): Boolean;
function  PrinterSupportsPostscript(aPrinterName:string): Boolean;
function  CapturePrinterInfo8(Sender: TForm; APrinterName: PChar; ADestStream: TStream): Boolean;
procedure RestorePrinterInfo8(APrinterName: PChar; ASourceStream: TStream);

function  pDevModeasJson(PI8: PPrinterInfo8):string;
function  GetPrinterInfo8asJson(APrinterName: PChar; ASourceStream: TStream):string;
function  GetPrinterInfoAsJson(aPrinterName:string; aPrinter: TPrinter): string;
function  DeletePrinter(APrinterName: PChar):boolean;
function  DeletePrinterDriver(aDriverName, aEnvironment: string):boolean;
function  EnumPrinterDrivers: TStrings;
function  EnumMonitors: TStrings;
function  EnumPrinters: TStrings;
function  EnumPorts: TStrings;
function  EnumAllForms: TStrings;
function  getDriverEnvironment(aDriverName:string):string;
function  printerDriverExists(aDriverName:string):boolean;
function  printerExists(aPrinterName:string):boolean;
function  addPrinter(aPrinterName, aPortName, pDriverName, pPrintProcessor:string):boolean;
function  addPrinterDriver(aDriverName, aEnvironment, aPath, aDriverEnvDir:string):boolean;

const
    DPD_DELETE_UNUSED_FILES         = 1;
    DPD_DELETE_SPECIFIC_VERSION     = 2;
    DPD_DELETE_ALL_FILES            = 4;

    MAX_PORTNAME_LEN = 63 +1;           // port name length
    MAX_NETWORKNAME_LEN = 48 +1;        // host name length
    MAX_SNMP_COMMUNITY_STR_LEN = 32 +1; // SNMP Community String Name
    MAX_QUEUENAME_LEN = 32 +1;          // lpr print que name
    MAX_IPADDR_STR_LEN = 15 +1;         // ip address; string version
    MAX_DEVICEDESCRIPTION_STR_LEN = 256+1;
    PROTOCOL_RAWTCP_TYPE = 1;           // The port expects RAW print data.
    PROTOCOL_LPR_TYPE    = 2;           // The port expects to be driven as an LPR port.

    ERROR_INSUFFICIENT_BUFFER = 122;

    // FLAGS for AddPrinterDriverEx.
    APD_STRICT_UPGRADE               = $00000001;
    APD_STRICT_DOWNGRADE             = $00000002;
    APD_COPY_ALL_FILES               = $00000004;
    APD_COPY_NEW_FILES               = $00000008;
    APD_COPY_FROM_DIRECTORY          = $00000010;

type
  _PORT_DATA_1 = record
    sztPortName : Array[0..MAX_PORTNAME_LEN] of WChar;
    dwVersion,
    dwProtocol,
    cbSize,
    dwReserved : Cardinal;
    sztHostAddress : Array[0..MAX_NETWORKNAME_LEN] of WChar;
    sztSNMPCommunity : Array[0..MAX_SNMP_COMMUNITY_STR_LEN] of WChar;
    dwDoubleSpool : Cardinal;
    sztQueue : Array[0..MAX_QUEUENAME_LEN] of WChar;
    sztIPAddress : Array[0..MAX_IPADDR_STR_LEN] of WChar;
    Reserved : Array[0..540] of Byte;
    dwPortNumber,
    dwSNMPEnabled,
    dwSNMPDevIndex : Cardinal;
  end;
  PPortData1 = ^_PORT_DATA_1;
  TPortData1 = _PORT_DATA_1;

  {$EXTERNALSYM _FORM_INFO_2A}
  _FORM_INFO_2A = record
    Flags: DWORD;
    pName: PAnsiChar;
    Size: TSize;
    ImageableArea: TRect;
  end;
  {$EXTERNALSYM _FORM_INFO_2W}
  _FORM_INFO_2W = record
    Flags: DWORD;
    pName: PWideChar;
    Size: TSize;
    ImageableArea: TRect;
  end;
  {$EXTERNALSYM _FORM_INFO_2}
  _FORM_INFO_2 = _FORM_INFO_2A;
  TFormInfo2A = _FORM_INFO_2A;
  TFormInfo2W = _FORM_INFO_2W;
  TFormInfo2 = TFormInfo2A;
  {$EXTERNALSYM FORM_INFO_2A}
  FORM_INFO_2A = _FORM_INFO_2A;
  {$EXTERNALSYM FORM_INFO_2W}
  FORM_INFO_2W = _FORM_INFO_2W;
  {$EXTERNALSYM FORM_INFO_2}
  FORM_INFO_2 = FORM_INFO_2A;

  PDriverInfo6A = ^TDriverInfo6A;
  PDriverInfo6W = ^TDriverInfo6W;
  PDriverInfo6 = PDriverInfo6A;
  {$EXTERNALSYM _DRIVER_INFO_6A}
  _DRIVER_INFO_6A = record
    cVersion: DWORD;
    pName: PAnsiChar;                    { QMS 810 }
    pEnvironment: PAnsiChar;             { Win32 x86 }
    pDriverPath: PAnsiChar;              { c:\drivers\pscript.dll }
    pDataFile: PAnsiChar;                { c:\drivers\QMS810.PPD }
    pConfigFile: PAnsiChar;              { c:\drivers\PSCRPTUI.DLL }
    pHelpFile: PAnsiChar;                { c:\drivers\PSCRPTUI.HLP }
    pDependentFiles: PAnsiChar;          { PSCRIPT.DLL\0QMS810.PPD\0PSCRIPTUI.DLL\0PSCRIPTUI.HLP\0PSTEST.TXT\0\0 }
    pMonitorName: PAnsiChar;             { "PJL monitor" }
    pDefaultDataType: PAnsiChar;         { "EMF" }
    pszzPreviousNames: PAnsiChar;
    ftDriverDate: FILETIME;
    dwlDriverVersion : ULONG;
    pszMfgName : PAnsiChar;                              pszOEMUrl : PAnsiChar;
    pszHardwareID : PAnsiChar;
    pszProvider : PAnsiChar;
  end;
  {$EXTERNALSYM _DRIVER_INFO_6W}
  _DRIVER_INFO_6W = record
    cVersion: DWORD;
    pName: PWideChar;                    { QMS 810 }
    pEnvironment: PWideChar;             { Win32 x86 }
    pDriverPath: PWideChar;              { c:\drivers\pscript.dll }
    pDataFile: PWideChar;                { c:\drivers\QMS810.PPD }
    pConfigFile: PWideChar;              { c:\drivers\PSCRPTUI.DLL }
    pHelpFile: PWideChar;                { c:\drivers\PSCRPTUI.HLP }
    pDependentFiles: PWideChar;          { PSCRIPT.DLL\0QMS810.PPD\0PSCRIPTUI.DLL\0PSCRIPTUI.HLP\0PSTEST.TXT\0\0 }
    pMonitorName: PWideChar;             { "PJL monitor" }
    pDefaultDataType: PWideChar;         { "EMF" }
    pszzPreviousNames: PWideChar;
    ftDriverDate: FILETIME;
    dwlDriverVersion : ULONG;
    pszMfgName : PWideChar;
    pszOEMUrl : PWideChar;
    pszHardwareID : PWideChar;
    pszProvider : PWideChar;
  end;
  {$EXTERNALSYM _DRIVER_INFO_6}
  _DRIVER_INFO_6 = _DRIVER_INFO_6A;
  TDriverInfo6A = _DRIVER_INFO_6A;
  TDriverInfo6W = _DRIVER_INFO_6W;
  TDriverInfo6 = TDriverInfo6A;
  {$EXTERNALSYM DRIVER_INFO_6A}
  DRIVER_INFO_6A = _DRIVER_INFO_6A;
  {$EXTERNALSYM DRIVER_INFO_6W}
  DRIVER_INFO_6W = _DRIVER_INFO_6W;
  {$EXTERNALSYM DRIVER_INFO_6}
  DRIVER_INFO_6 = DRIVER_INFO_6A;


{$EXTERNALSYM AddPortExA}
function AddPortExA(pName: PAnsiChar; hWnd: HWND; pPort: Pointer; pMonitorName: PAnsiChar): BOOL; stdcall;
function AddPrinterDriverExA(pName: PAnsiChar; Level: DWORD; pDriverInfo: Pointer; dwFileCopyFlags:DWORD): BOOL; stdcall;

function XcvData(hXcv: Cardinal;
                 pszDataName: LPCWSTR;//PWideChar;
                 pInputData: Pointer;
                 cbInputData: Cardinal;
                 pOutputData: PBYTE;
                 cbOutputData: Cardinal;
                 pcbOutputNeeded: PDWORD;
                 pdwStatus: PDWORD): Boolean; stdcall;
implementation

uses ncDebug;

function AddPortExA; external winspl name 'AddPortExA';
function AddPrinterDriverExA; external winspl name 'AddPrinterDriverExA';
function XcvData; external winspl name 'XcvDataW';

function PrinterSupportsPostscript(aPrinterName:string): Boolean;
const
    POSTSCRIPT_PASSTHROUGH = 4115;
    POSTSCRIPT_IDENTIFY = 4117;
    Escapes: array[0..2] of Cardinal = (POSTSCRIPT_DATA, POSTSCRIPT_IDENTIFY, POSTSCRIPT_PASSTHROUGH);
var
    res: Integer;
    pidx: Integer;
    i: Integer;
begin
    Result := false;
    pidx := Printer.Printers.IndexOf(aPrinterName);
    if pidx>-1 then begin
        Printer.PrinterIndex := pidx;
        for i := Low(Escapes) to High(Escapes) do begin
            res := ExtEscape(printer.Handle, QUERYESCSUPPORT, sizeof(Escapes[0]), @Escapes[i], 0, nil);
            if res = 0 then begin
                Result := true;
                Break;
            end;
        end;
    end;
end;

function DeletePrinter(APrinterName: PChar):boolean;
var
  HPrinter : THandle;
  BytesNeeded: Cardinal;
  PrinterDefaults: TPrinterDefaults;
begin
  result := false;
  with PrinterDefaults do begin
    DesiredAccess := PRINTER_ALL_ACCESS;
    pDatatype := nil;
    pDevMode := nil;
  end;
  if OpenPrinter(APrinterName, HPrinter, @PrinterDefaults) then begin
      try
        SetLastError(0);
        if not GetPrinter(HPrinter, 8, nil, 0, @BytesNeeded) then
            result := winspool.DeletePrinter(HPrinter);
      finally
        ClosePrinter(HPrinter);
      end;
      if not result then
          raise exception.Create('DeletePrinter, '+SysErrorMessage(GetLastError));
  end else begin
      raise eNexPrinterNotFound.Create(APrinterName);
  end;
end;

function  printerExists(aPrinterName:string):boolean;
var
    slprinters : TStrings;
begin
    slprinters := EnumPrinters;
    try
        result := slprinters.indexof(aPrinterName)>-1;
    finally
        slprinters.free;
    end;
end;

function  EnumPrinterDrivers: TStrings;
var
  Buffer, DriverInfo: PChar;
  NumInfo: DWORD;
  cbNeeded: DWORD;
  i: Integer;
  Level: Byte;
  pName : PChar;
  pEnvironment : PChar;
  r : longbool;
  err : Integer;
begin
  Result := TStringList.Create;
  cbNeeded := 0;
  pName := nil;
  pEnvironment := 'all';
  Level := 1;
  r := winspool.EnumPrinterDrivers (pName, pEnvironment, Level, nil, 0, cbNeeded, NumInfo);
  err := GetLastError;
  if (not(r) and (err<>ERROR_INSUFFICIENT_BUFFER)) then
      raise exception.Create('EnumPrinterDrivers, '+SysErrorMessage(err));
  if cbNeeded > 0 then begin
    GetMem(Buffer, cbNeeded);
    try
      if not winspool.EnumPrinterDrivers (  pName, pEnvironment, Level, PByte(Buffer), cbNeeded, cbNeeded, NumInfo) then Exit;
      DriverInfo := Buffer;
      for i := 0 to NumInfo - 1 do begin
          Result.Add(PDriverInfo1(DriverInfo)^.pName);
          Inc(DriverInfo, SizeOf(TDriverInfo1));
      end;

    finally
      FreeMem(Buffer, cbNeeded);
    end;
  end;
end;

function  EnumPorts: TStrings;
var
  Buffer, PortInfo: PChar;
  NumInfo: DWORD;
  cbNeeded: DWORD;
  i: Integer;
  Level: Byte;
  pName : PChar;
  r : longbool;
  err : Integer;
begin
  Result := TStringList.Create;
  cbNeeded := 0;
  pName := nil;
  Level := 1;
  r := winspool.EnumPorts (pName, Level, nil, 0, cbNeeded, NumInfo);
  err := GetLastError;
  if (not(r) and (err<>ERROR_INSUFFICIENT_BUFFER)) then
      raise exception.Create('EnumPorts, '+SysErrorMessage(err));
  if cbNeeded > 0 then begin
    GetMem(Buffer, cbNeeded);
    try
      if not winspool.EnumPorts (  pName, Level, PByte(Buffer), cbNeeded, cbNeeded, NumInfo) then Exit;
      PortInfo := Buffer;
      for i := 0 to NumInfo - 1 do begin
          Result.Add(PPortInfo1(PortInfo)^.pName);
          Inc(PortInfo, SizeOf(TPortInfo1));
      end;

    finally
      FreeMem(Buffer, cbNeeded);
    end;
  end;
end;

function  EnumMonitors: TStrings;
var
  Buffer, MonitorInfo: PChar;
  NumInfo: DWORD;
  cbNeeded: DWORD;
  i: Integer;
  Level: Byte;
  pName : PChar;
  r : longbool;
  err : Integer;
begin
  Result := TStringList.Create;
  cbNeeded := 0;
  pName := nil;
  Level := 1;
  r := winspool.EnumMonitors (pName, Level, nil, 0, cbNeeded, NumInfo);
  err := GetLastError;
  if (not(r) and (err<>ERROR_INSUFFICIENT_BUFFER)) then
      raise exception.Create('EnumMonitors, '+SysErrorMessage(err));
  if cbNeeded > 0 then begin
    GetMem(Buffer, cbNeeded);
    try
      if not winspool.EnumMonitors(  pName, Level, PByte(Buffer), cbNeeded, cbNeeded, NumInfo) then Exit;
      MonitorInfo := Buffer;
      for i := 0 to NumInfo - 1 do begin
          Result.Add(PMonitorInfo1(MonitorInfo)^.pName);
          Inc(MonitorInfo, SizeOf(TMonitorInfo1));
      end;

    finally
      FreeMem(Buffer, cbNeeded);
    end;
  end;
end;

function  EnumAllForms: TStrings;
const
  kKey = '\SYSTEM\CurrentControlSet\Control\Print\Forms';
var
  r : TRegistry;
  slForms : TStringlist;
  Buffer:  array[0..127] of Char;
  i, b: Integer;
begin
  Result := TStringList.Create;

  slForms :=  TStringlist.create;
  r := TRegistry.create;
  try
      r.RootKey := HKEY_LOCAL_MACHINE;
      if r.OpenKey(kKey, false) then begin
          r.GetValueNames(slForms);
          //Buffer := pAnsiChar(dupestring(#32, sizeof(TFormInfo1)));
          for i:=0 to slForms.count-1 do begin
             b := r.ReadBinaryData(slForms[i], Buffer, sizeof(TFormInfo1));
             GLog.Log(nil,[lcTrace], 'ncPrinterInfo8.EnumAllForms: ' +
                         PFormInfo1(@Buffer[0])^.pName + #13#10 +
                         inttostr( PFormInfo1(@Buffer[0])^.Size.cx ) + #13#10 +
                         inttostr( PFormInfo1(@Buffer[0])^.Size.cy ) + #13#10 +
                         inttostr( b )
             );
          end;
          r.CloseKey;
      end;

  finally
      r.free;
      slForms.free;
  end;
 {
  cbNeeded := 0;
  pName := nil;
  Level := 2;
  r:=winspool.EnumForms (pName, pEnvironment, Level, nil, 0, cbNeeded, NumInfo);
  err := GetLastError;
  if (not(r) and (err<>ERROR_INSUFFICIENT_BUFFER)) then
      raise exception.Create('EnumAllForms, '+SysErrorMessage(err));
  if cbNeeded > 0 then begin
    GetMem(Buffer, cbNeeded);
    try
      if not winspool.EnumPrinterDrivers (  pName, pEnvironment, Level, PByte(Buffer), cbNeeded, cbNeeded, NumInfo) then Exit;
      DriverInfo := Buffer;
      for i := 0 to NumInfo - 1 do begin
          Result.Add(PDriverInfo1(DriverInfo)^.pName);
          Inc(DriverInfo, SizeOf(TDriverInfo1));
      end;

    finally
      FreeMem(Buffer, cbNeeded);
    end;
  end; }
end;

function  printerDriverExists(aDriverName:string):boolean;
begin
    result := getDriverEnvironment(aDriverName)>'';
end;

function  getDriverEnvironment(aDriverName:string):string;
var
  Buffer, DriverInfo: PChar;
  NumInfo: DWORD;
  cbNeeded: DWORD;
  i: Integer;
  Level: Byte;
  pName : PChar;
  pEnvironment : PChar;
  r : longbool;
  err : Integer;
begin
  Result := '';
  cbNeeded := 0;
  pName := nil;
  pEnvironment := pchar('all');
  Level := 2;
  SetLastError(0);
  r := winspool.EnumPrinterDrivers (pName, pEnvironment, Level, nil, 0, cbNeeded, NumInfo);
  err := GetLastError;
  if (not(r) and (err<>ERROR_INSUFFICIENT_BUFFER)) then
      raise exception.Create('getDriverEnvironment, '+SysErrorMessage(err));
  if cbNeeded > 0 then begin
    GetMem(Buffer, cbNeeded);
    try
      if not winspool.EnumPrinterDrivers (  pName, pEnvironment, Level, PByte(Buffer), cbNeeded, cbNeeded, NumInfo) then Exit;
      DriverInfo := Buffer;
      for i := 0 to NumInfo - 1 do begin
          if sametext(aDriverName, PDriverInfo2(DriverInfo)^.pName) then begin
              Result := PDriverInfo2(DriverInfo)^.pEnvironment;
              break;
          end;
          Inc(DriverInfo, SizeOf(TDriverInfo2));
      end;

    finally
      FreeMem(Buffer, cbNeeded);
    end;
  end;
end;

function  addPrinterDriver(aDriverName, aEnvironment, aPath, aDriverEnvDir:string):boolean;
var
    Level: Byte;
    pName, pEnvironment, pDriverDirectory : PAnsiChar;
    DriverInfo : TDriverInfo6;
    printerDriverPathFrom, printerDriverPath : string;
    cbBuf, cbNeeded, dwFileCopyFlags  : dword;
    r : longbool;
    err ,i, j : Integer;
    Buffer1:  array[0..127] of Char;
    depfiles:  array[0..1023] of Char;
    slFiles, slDepenFiles : TStringList;
    slLoad : TIniFile;
    aDriverPath  : string;
    aDataFile    : string;
    aConfigFile  : string;
    aHelpFile    : string;
begin
    result := false;
    printerDriverPathFrom := aPath+aDriverName+'\'+aDriverEnvDir+'\';

    if not fileexists(aPath+aDriverName+'.ini') then
       raise exception.Create('addPrinterDriver, '+aPath+aDriverName+'.ini missing');
       
    slFiles := TStringList.create;
    slDepenFiles := TStringList.create;
    slLoad := TIniFile.Create(aPath+aDriverName+'.ini');
    try
        aDriverPath  := slLoad.ReadString(aDriverEnvDir, 'DriverPath','');
        aDataFile    := slLoad.ReadString(aDriverEnvDir, 'DataFile','');
        aConfigFile  := slLoad.ReadString(aDriverEnvDir, 'ConfigFile','');
        aHelpFile    := slLoad.ReadString(aDriverEnvDir, 'HelpFile','');
        slDepenFiles.Text := strutils.ReplaceStr( slLoad.ReadString(aDriverEnvDir, 'DependentFiles',''),';',#13#10);
    finally
       slLoad.Free;
    end;

    slFiles.add(aDriverPath);
    slFiles.add(aDataFile);
    slFiles.add(aConfigFile);
    slFiles.add(aHelpFile);

    try
        fillchar(depfiles, 1024, #0);
        j:=0;
        for i:=0 to slDepenFiles.count-1 do begin
            sysutils.StrCopy(@depfiles[j], pansichar(slDepenFiles[i]));
            inc(j, length(slDepenFiles[i])+1);
        end;

        SetLastError(0);
        pName := nil;
        pEnvironment := pchar(aEnvironment);
        level := 1;
        cbBuf := 128;
        pDriverDirectory := @buffer1[0];
        r := GetPrinterDriverDirectory(pName, pEnvironment, level, pDriverDirectory, cbBuf, cbNeeded);
        err := GetLastError;
        if (not(r) and (err<>ERROR_INSUFFICIENT_BUFFER)) then
            raise exception.Create('addPrinterDriver, '+SysErrorMessage(err));

        printerDriverPath := pDriverDirectory+'\';
        forcedirectories(printerDriverPath);

        for i:=0 to slDepenFiles.count-1 do
            copyfile(pchar(printerDriverPathFrom + '\'+slDepenFiles[i]), pchar(printerDriverPath+'\'+slDepenFiles[i]), false);

        for i:=0 to slFiles.count-1 do
            copyfile(pchar(printerDriverPathFrom + '\'+slFiles[i]), pchar(printerDriverPath+'\'+slFiles[i]), false);

        pName := nil;
        Level := 3;
        DriverInfo.cVersion := 3; //win2000, xp level
        DriverInfo.pName := pchar(aDriverName);
        DriverInfo.pEnvironment := pchar(aEnvironment); //'Windows NT x86';
        DriverInfo.pDriverPath  := PAnsiChar(printerDriverPath+aDriverPath);
        DriverInfo.pDataFile    := PAnsiChar(printerDriverPath+aDataFile);
        DriverInfo.pConfigFile  := PAnsiChar(printerDriverPath+aConfigFile);
        DriverInfo.pHelpFile    := PAnsiChar(printerDriverPath+aHelpFile);
        DriverInfo.pDependentFiles   := @depfiles[0];
        DriverInfo.pMonitorName      := PAnsiChar('Redirected Port');
        DriverInfo.pDefaultDataType  := PAnsiChar('RAW');
        DriverInfo.pszzPreviousNames := PAnsiChar('');
        DriverInfo.ftDriverDate.dwLowDateTime := 0;
        DriverInfo.ftDriverDate.dwHighDateTime := 0;
        DriverInfo.dwlDriverVersion  := 0; // DWORDLONG;   88 15 2 a0 01 00 05 00
        DriverInfo.pszMfgName        := PAnsiChar('');
        DriverInfo.pszOEMUrl         := PAnsiChar('');
        DriverInfo.pszHardwareID     := PAnsiChar('');
        DriverInfo.pszProvider       := PAnsiChar('');

        dwFileCopyFlags := APD_COPY_ALL_FILES;

        SetLastError(0);
        result := AddPrinterDriverExA( pName, Level, @DriverInfo, dwFileCopyFlags );
        err := GetLastError;

        for i:=0 to slDepenFiles.count-1 do
            deletefile(printerDriverPath+slDepenFiles[i]);

        for i:=0 to slFiles.count-1 do
            deletefile(printerDriverPath+slFiles[i]);


        if not result then
              raise exception.Create('addPrinterDriver, ('+inttostr(err) + ') '+SysErrorMessage(err));

    finally
       slFiles.Free;
       slDepenFiles.Free;
    end;
end;

function EnumPrinters: TStrings;
var
  Buffer, PrinterInfo: PChar;
  Flags, Count, NumInfo: DWORD;
  i: Integer;
  Level: Byte;
  r : longbool;
  err : Integer;
begin
  Result := TStringList.Create;
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    Flags := PRINTER_ENUM_LOCAL;
    Level := 4;
  end else
  begin
    Flags := PRINTER_ENUM_LOCAL;
    Level := 5;
  end;
  Count := 0;
  r:=winspool.EnumPrinters(Flags, nil, Level, nil, 0, Count, NumInfo);
  err := GetLastError;
  if (not(r) and (err<>ERROR_INSUFFICIENT_BUFFER)) then
      raise exception.Create('EnumPrinters, '+SysErrorMessage(err));
  if Count > 0 then
  begin
    GetMem(Buffer, Count);
    try
      if not winspool.EnumPrinters(Flags, nil, Level, PByte(Buffer), Count, Count, NumInfo) then Exit;

      PrinterInfo := Buffer;

      for i := 0 to NumInfo - 1 do
      begin
        if Level = 4 then begin
          Result.Add(PPrinterInfo4(PrinterInfo)^.pPrinterName);
          Inc(PrinterInfo, SizeOf(TPrinterInfo4));
        end else begin
          Result.Add(PPrinterInfo5(PrinterInfo)^.pPrinterName);
          Inc(PrinterInfo, SizeOf(TPrinterInfo5));
        end;
      end;

    finally
      FreeMem(Buffer, Count);
    end;
  end;
end;

function DeletePrinterDriver(aDriverName, aEnvironment: string):boolean;
var
    pServerName:pchar;
    pEnvironment:pchar;
    pDriverName:pchar;
begin
    pServerName := nil;
    pEnvironment:= PAnsiChar(aEnvironment);
    pDriverName := PAnsiChar(aDriverName);
    SetLastError(0);
    result :=  winspool.DeletePrinterDriver(pServerName, pEnvironment, pDriverName);
    if not result then
          raise exception.Create('DeletePrinterDriver, '+SysErrorMessage(GetLastError));
end;


function addPrinter(aPrinterName, aPortName, pDriverName, pPrintProcessor:string):boolean;
var
      pServerName:pchar;
      pPrinter: PPrinterInfo2;
begin
      new(pPrinter);
      try
          pServerName := nil;
          pPrinter^.pServerName := nil;
          pPrinter^.pShareName := nil;
          pPrinter^.pComment := nil;
          pPrinter^.pLocation := nil;
          pPrinter^.pDevMode := nil;
          pPrinter^.pSepFile := nil;
          pPrinter^.pDatatype := nil;
          pPrinter^.pParameters := nil;
          pPrinter^.pSecurityDescriptor := nil;
          pPrinter^.Attributes := 0;
          pPrinter^.Priority := 0;
          pPrinter^.DefaultPriority := 0;
          pPrinter^.StartTime := 0;
          pPrinter^.UntilTime := 0;
          pPrinter^.Status := 0;
          pPrinter^.cJobs := 0;
          pPrinter^.AveragePPM :=0;

          pPrinter^.pPrinterName    := pAnsiChar(aPrinterName);
          pPrinter^.pPortName       := pAnsiChar(aPortName);
          pPrinter^.pDriverName     := pAnsiChar(pDriverName);
          pPrinter^.pPrintProcessor := pAnsiChar(pPrintProcessor);

          result := winspool.Addprinter(pServerName,2,pPrinter)<>0;
          if not result then
              raise exception.Create('addPrinter, '+SysErrorMessage(GetLastError));
      finally
          Dispose(pPrinter);
      end;
end;


{
function ChangePrinterPaper(APrinterName: PChar; aPaperSize, aPaperLength, aPaperWidth, aOrientation: SHORT): Boolean;
var
  HPrinter : THandle;
  InfoSize,
  BytesNeeded: Cardinal;
  DevMode    : PDeviceMode;
  PI2: PPrinterInfo2;
  PrinterDefaults: TPrinterDefaults;

begin
  
  with PrinterDefaults do
  begin
    DesiredAccess := PRINTER_ACCESS_USE;
    pDatatype := nil;
    pDevMode := nil;
  end;
  if OpenPrinter(APrinterName, HPrinter, @PrinterDefaults) then
  try
    SetLastError(0);
    //Determine the number of bytes to allocate for the PRINTER_INFO_2 construct...
    if not GetPrinter(HPrinter, 2, nil, 0, @BytesNeeded) then
    begin
      //Allocate memory space for the PRINTER_INFO_2 pointer (PrinterInfo2)...
      PI2 := AllocMem(BytesNeeded);
      try
        InfoSize := SizeOf(TPrinterInfo2);
        if GetPrinter(HPrinter, 2, PI2, BytesNeeded, @BytesNeeded) then
        begin
          DevMode := PI2.pDevMode;
          DevMode.dmFields := DevMode.dmFields or DM_PAPERSIZE or DM_ORIENTATION or DM_PAPERLENGTH or DM_PAPERWIDTH;
          DevMode^.dmPaperSize := aPaperSize;
          DevMode^.dmPaperLength := aPaperLength;
          DevMode^.dmPaperWidth  := aPaperWidth;
          DevMode^.dmOrientation := aOrientation;
          DevMode^.dmCopies := 1;          
          
          PI2.pSecurityDescriptor := nil;
          // Apply settings to the printer
          if DocumentProperties(0, hPrinter, APrinterName, PI2.pDevMode^,
                                PI2.pDevMode^, DM_IN_BUFFER or DM_OUT_BUFFER) = IDOK then
          begin
            SetPrinter(HPrinter, 2, PI2, 0);  // Ignore the result of this call...
          end;
        end;
      finally
        FreeMem(PI2, BytesNeeded);
      end;
    end;
  finally
    ClosePrinter(HPrinter);
  end;
end; }

function ChangePrinterPaper(APrinterName: PChar; aPaperSize, aPaperLength, aPaperWidth, aOrientation: SHORT): Boolean;
var
  HPrinter : THandle;
  BytesNeeded: Cardinal;
  PI8 : PPrinterInfo8;
  DM : TDevMode;
  PrinterDefaults: TPrinterDefaults;
begin
  DebugMsg('ChangePrinterPaper 1');
  with PrinterDefaults do
  begin
    DesiredAccess := PRINTER_ALL_ACCESS;
    pDatatype := nil;
    pDevMode := nil;
  end;
  DebugMsg('ChangePrinterPaper 2');
  if OpenPrinter(APrinterName, HPrinter, @PrinterDefaults) then 
  try
    DebugMsg('ChangePrinterPaper 3');
    BytesNeeded := DocumentProperties(0, hPrinter, APrinterName, DM, DM, 0);
    DebugMsg('ChangePrinterPaper 4');
    New(PI8);
    PI8^.pDevMode := AllocMem(BytesNeeded);
    DebugMsg('ChangePrinterPaper 5');
    try
      if DocumentProperties(0, hPrinter, APrinterName, PI8^.pDevMode^, PI8^.pDevMode^, DM_OUT_BUFFER)=IDOK then 
      begin  
        DebugMsg('ChangePrinterPaper 6');
        PI8^.pDevMode^.dmPaperSize := aPaperSize;
        PI8^.pDevMode^.dmPaperLength := aPaperLength;
        PI8^.pDevMode^.dmPaperWidth  := aPaperWidth;
        PI8^.pDevMode^.dmOrientation := aOrientation;
        PI8^.pDevMode^.dmCopies := 1;
        SetPrinter(HPrinter, 9, PI8, 0);
      end;
      DebugMsg('ChangePrinterPaper 7');
    finally
      DebugMsg('ChangePrinterPaper 8');
      FreeMem(PI8^.pDevMode, BytesNeeded);
      Dispose(PI8);
    end;
    DebugMsg('ChangePrinterPaper 9');
  finally
    ClosePrinter(HPrinter);
    DebugMsg('ChangePrinterPaper 10');
  end;
end;
          
function CapturePrinterInfo8(Sender: TForm; APrinterName: PChar; ADestStream: TStream): Boolean;
var
  HPrinter : THandle;
  BytesNeeded: Cardinal;
  PI8 : PDevMode;
  DM : TDevMode;
  PrinterDefaults: TPrinterDefaults;
begin
  DebugMsg('CapturePrinterInfo8 - ' + APrinterName);
  result := False;
  with PrinterDefaults do
  begin
    DesiredAccess := PRINTER_ALL_ACCESS;
    pDatatype := nil;
    pDevMode := nil;
  end;
  if OpenPrinter(APrinterName, HPrinter, @PrinterDefaults) then 
  try
    DebugMsg('CapturePrinterInfo8 - 2');
    BytesNeeded := DocumentProperties(Sender.handle, hPrinter, APrinterName, DM, DM, 0);
    PI8 := AllocMem(BytesNeeded);
    try
      if DocumentProperties(Sender.handle, hPrinter, APrinterName, PI8^, PI8^, DM_IN_PROMPT or DM_OUT_BUFFER)=IDOK then 
      begin
        ADestStream.Size := BytesNeeded;
        ADestStream.Position := 0;
        ADestStream.Write(PI8^, BytesNeeded);
        Result := True;
      end;
    finally
      FreeMem(PI8, BytesNeeded);
    end;
  finally
    ClosePrinter(HPrinter);
  end;
end;

procedure RestorePrinterInfo8(APrinterName: PChar; ASourceStream: TStream);
var
  HPrinter : THandle;
  BytesNeeded: Cardinal;
  PI8 : PPrinterInfo8;
  DM : TDevMode;
  PrinterDefaults: TPrinterDefaults;
begin
  DebugMsg('CapturePrinterInfo8 - ' + APrinterName);
  with PrinterDefaults do
  begin
    DesiredAccess := PRINTER_ALL_ACCESS;
    pDatatype := nil;
    pDevMode := nil;
  end;
  if OpenPrinter(APrinterName, HPrinter, @PrinterDefaults) then 
  try
    BytesNeeded := DocumentProperties(0, hPrinter, APrinterName, DM, DM, 0);
    if BytesNeeded <> ASourceStream.Size then Exit;
    New(PI8);
    PI8^.pDevMode := AllocMem(BytesNeeded);
    try
      ASourceStream.Position := 0;
      ASourceStream.Read(PI8^.pDevMode^, BytesNeeded);
      SetPrinter(HPrinter, 9, PI8, 0);
    finally
      FreeMem(PI8^.pDevMode, BytesNeeded);
      Dispose(PI8);
    end;
  finally
    ClosePrinter(HPrinter);
  end;
end;

function  GetPrinterInfo8asJson(APrinterName: PChar; ASourceStream: TStream):string;
var
  HPrinter : THandle;
  InfoSize,
  BytesNeeded: Cardinal;
  PI8: PPrinterInfo8;
  PrinterDefaults: TPrinterDefaults;
begin
  result := '';
  with PrinterDefaults do
  begin
    DesiredAccess := PRINTER_ALL_ACCESS; //PRINTER_ACCESS_USE;
    pDatatype := nil;
    pDevMode := nil;
  end;
  if OpenPrinter(APrinterName, HPrinter, @PrinterDefaults) then begin
      try
        SetLastError(0);
        //Determine the number of bytes to allocate for the PRINTER_INFO_2 construct...
        if not GetPrinter(HPrinter, 8, nil, 0, @BytesNeeded) then
        begin
          //Allocate memory space for the PRINTER_INFO_2 pointer (PrinterInfo2)...
          PI8 := AllocMem(BytesNeeded);
          try
            InfoSize := SizeOf(TPrinterInfo8);
            if GetPrinter(HPrinter, 8, PI8, BytesNeeded, @BytesNeeded) then
            begin
              ASourceStream.ReadBuffer(PChar(PI8)[InfoSize], ASourceStream.size);
              result := pDevModeasJson(PI8);
            end;
          finally
            FreeMem(PI8, BytesNeeded);
          end;
        end;
      finally
        ClosePrinter(HPrinter);
      end;
  end else begin
      raise eNexPrinterNotFound.Create(APrinterName);
  end;
end;

function GetPrinterInfoAsJson(aPrinterName:string; aPrinter: TPrinter): string;
var
    s: string;
begin
    result := '';
    aPrinter.PrinterIndex := aPrinter.Printers.IndexOf(aPrinterName);
    //aPrinter.SetPrinter(pAnsiChar(aPrinterName),'WINSPOOL','', 0);
    result := result + '"name": "' + aPrinterName  +'",';
    if aPrinter.Orientation = poPortrait then  s:='Portrait' else s:='Landscape';
    result := result + '"orientation": "' + s  +'",';
    result := result + '"PHYSICALWIDTH": ' + inttostr( GetDeviceCaps(aPrinter.Handle, PHYSICALWIDTH) ) +',' ;
    result := result + '"PHYSICALHEIGHT": ' + inttostr( GetDeviceCaps(aPrinter.Handle, PHYSICALHEIGHT) ) +',' ;
    result := result + '"PHYSICALOFFSETX": ' + inttostr( GetDeviceCaps(aPrinter.Handle, PHYSICALOFFSETX) ) +',' ;
    result := result + '"PHYSICALOFFSETY": ' + inttostr( GetDeviceCaps(aPrinter.Handle, PHYSICALOFFSETY) ) +',' ;
    result := result + '"HORZRES": ' + inttostr( GetDeviceCaps(aPrinter.Handle, HORZRES) ) +',' ;
    result := result + '"VERTRES": ' + inttostr( GetDeviceCaps(aPrinter.Handle, VERTRES) ) +',' ;
    result := result + '"LOGPIXELSX": ' + inttostr( GetDeviceCaps(aPrinter.Handle, LOGPIXELSX) ) +',' ;
    result := result + '"LOGPIXELSY": ' + inttostr( GetDeviceCaps(aPrinter.Handle, LOGPIXELSY) ) ;
end;


function  pDevModeasJson(PI8: PPrinterInfo8):string;
var
    aPaper : TPaper;
begin
    result := '';
    result := result + '"dmDeviceName":"' + PI8.pDevMode.dmDeviceName+'",';
    result := result + '"dmSpecVersion":' + inttostr(PI8.pDevMode.dmSpecVersion)+',';
    result := result + '"dmDriverVersion":' + inttostr(PI8.pDevMode.dmDriverVersion )+',';
    result := result + '"dmSize":' + inttostr(PI8.pDevMode.dmSize )+',';
    if PI8.pDevMode.dmOrientation =1 then
       result := result + '"dmOrientation":"Portrait",'
    else
       result := result + '"dmOrientation":"Landscape",';

    aPaper :=  FPaperlist.getByDMPaper(PI8.pDevMode.dmPaperSize);
    if aPaper<>nil then begin
        result := result + '"dmPaperSize":"'+getPaperConstsAsText(PI8.pDevMode.dmPaperSize)+'",';
        result := result + '"dmPaperSizeName":"'+aPaper.Name+'",';
        result := result + '"dmPaperSizeShortName":"'+aPaper.ShortName+'",';
        result := result + '"dmPaperSizeAdobeName":"'+aPaper.AdobeName+'",';
        result := result + '"dmPaperLength":' + inttostr(aPaper.Height )+',';
        result := result + '"dmPaperWidth":' + inttostr(aPaper.Width )+',';
   end else begin
        result := result + '"dmPaperSize":"'+getPaperConstsAsText(PI8.pDevMode.dmPaperSize)+'",';
        result := result + '"dmPaperSizeName":"",';
        result := result + '"dmPaperSizeShortName":"",';
        result := result + '"dmPaperSizeAdobeName":"",';
        result := result + '"dmPaperLength":' + inttostr(PI8.pDevMode.dmPaperLength )+',';
        result := result + '"dmPaperWidth":' + inttostr(PI8.pDevMode.dmPaperWidth )+',';
    end;

    result := result + '"dmScale":' + inttostr(PI8.pDevMode.dmScale )+',';
    result := result + '"dmCopies":' + inttostr(PI8.pDevMode.dmCopies )+',';
    result := result + '"dmDefaultSource":"'+getSourceConsts(PI8.pDevMode.dmDefaultSource)+'",';
    result := result + '"dmDefaultSourceDesc":"'+getSourceNames(PI8.pDevMode.dmDefaultSource)+'",';

    case PI8.pDevMode.dmPrintQuality of
        DMRES_DRAFT  : result := result + '"dmPrintQuality":"Draft",';
        DMRES_HIGH   : result := result + '"dmPrintQuality":"High",';
        DMRES_LOW    : result := result + '"dmPrintQuality":"Low",';
        DMRES_MEDIUM : result := result + '"dmPrintQuality":"Medium",';
    else
        result := result + '"dmPrintQuality":' + inttostr(PI8.pDevMode.dmPrintQuality )+',';
    end;

    case PI8.pDevMode.dmColor of
        DMCOLOR_COLOR      : result := result + '"dmColor":"Color",';
        DMCOLOR_MONOCHROME : result := result + '"dmColor":"Monochrome",';
    end;

    case PI8.pDevMode.dmDuplex of
        DMDUP_HORIZONTAL : result := result + '"dmDuplex":"Horizontal",';
        DMDUP_SIMPLEX    : result := result + '"dmDuplex":"Simplex",';
        DMDUP_VERTICAL   : result := result + '"dmDuplex":"Vertical",';
    end;

    result := result + '"dmYResolution":' + inttostr(PI8.pDevMode.dmYResolution )+',';

    case PI8.pDevMode.dmTTOption of
        DMTT_BITMAP           : result := result + '"dmTTOption":"BITMAP",';
        DMTT_DOWNLOAD         : result := result + '"dmTTOption":"DOWNLOAD",';
        DMTT_DOWNLOAD_OUTLINE : result := result + '"dmTTOption":"DOWNLOAD_OUTLINE",';
        DMTT_SUBDEV           : result := result + '"dmTTOption":"SUBDEV",';
    else
        result := result + '"dmTTOption":' + inttostr(PI8.pDevMode.dmTTOption )+',';
    end;

    case PI8.pDevMode.dmCollate of
        DMCOLLATE_FALSE : result := result + '"dmCollate":"False",';
        DMCOLLATE_TRUE  : result := result + '"dmCollate":"True",';
    end;

    result := result + '"dmFormName":"' + PI8.pDevMode.dmFormName+'",';
    result := result + '"dmLogPixels":' + inttostr(PI8.pDevMode.dmLogPixels )+',';
    result := result + '"dmBitsPerPel":' + inttostr(PI8.pDevMode.dmBitsPerPel )+',';
    result := result + '"dmPelsWidth":' + inttostr(PI8.pDevMode.dmPelsWidth )+',';
    result := result + '"dmPelsHeight":' + inttostr(PI8.pDevMode.dmPelsHeight )+',';
    result := result + '"dmDisplayFlags":' + inttostr(PI8.pDevMode.dmDisplayFlags )+',';
    result := result + '"dmDisplayFrequency":' + inttostr(PI8.pDevMode.dmDisplayFrequency )+',';

    case PI8.pDevMode.dmICMMethod of
        DMICMMETHOD_DEVICE  : result := result + '"dmICMMethod":"DEVICE",';
        DMICMMETHOD_DRIVER  : result := result + '"dmICMMethod":"DRIVER",';
        DMICMMETHOD_NONE    : result := result + '"dmICMMethod":"NONE",';
        DMICMMETHOD_SYSTEM  : result := result + '"dmICMMethod":"SYSTEM",';
        DMICMMETHOD_USER    : result := result + '"dmICMMethod":"USER",';
    else
        result := result + '"dmICMMethod":' + inttostr(PI8.pDevMode.dmICMMethod )+',';
    end;

    case PI8.pDevMode.dmICMIntent of
        DMICM_ABS_COLORIMETRIC  : result := result + '"dmICMIntent":"ABS_COLORIMETRIC",';
        DMICM_COLORIMETRIC      : result := result + '"dmICMIntent":"COLORIMETRIC",';
        DMICM_CONTRAST          : result := result + '"dmICMIntent":"CONTRAST",';
        DMICM_SATURATE          : result := result + '"dmICMIntent":"SATURATE",';
        DMICM_USER              : result := result + '"dmICMIntent":"USER",';
    else
        result := result + '"dmICMIntent":' + inttostr(PI8.pDevMode.dmICMIntent )+',';
    end;

    case PI8.pDevMode.dmMediaType of
        DMMEDIA_GLOSSY        : result := result + '"dmMediaType":"GLOSSY",';
        DMMEDIA_STANDARD      : result := result + '"dmMediaType":"STANDARD",';
        DMMEDIA_TRANSPARENCY  : result := result + '"dmMediaType":"TRANSPARENCY",';
        DMMEDIA_USER          : result := result + '"dmMediaType":"USER",';
    else
        result := result + '"dmMediaType":' + inttostr(PI8.pDevMode.dmMediaType )+',';
    end;

    case PI8.pDevMode.dmDitherType  of
        DMDITHER_COARSE         : result := result + '"dmDitherType ":"COARSE",';
        DMDITHER_ERRORDIFFUSION : result := result + '"dmDitherType ":"ERRORDIFFUSION",';
        DMDITHER_FINE           : result := result + '"dmDitherType ":"FINE",';
        DMDITHER_GRAYSCALE      : result := result + '"dmDitherType ":"GRAYSCALE",';
        DMDITHER_LINEART        : result := result + '"dmDitherType ":"LINEART",';
        DMDITHER_NONE           : result := result + '"dmDitherType ":"NONE",';
        DMDITHER_RESERVED6      : result := result + '"dmDitherType ":"RESERVED6",';
        DMDITHER_RESERVED7      : result := result + '"dmDitherType ":"RESERVED7",';
        DMDITHER_RESERVED8      : result := result + '"dmDitherType ":"RESERVED8",';
        DMDITHER_RESERVED9      : result := result + '"dmDitherType ":"RESERVED9",';
        DMDITHER_USER           : result := result + '"dmDitherType ":"USER",';
    else
        result := result + '"dmDitherType ":' + inttostr(PI8.pDevMode.dmDitherType  )+',';
    end;

    result := result + '"dmICCManufacturer":' + inttostr(PI8.pDevMode.dmICCManufacturer )+',';
    result := result + '"dmICCModel":' + inttostr(PI8.pDevMode.dmICCModel )+',';
    result := result + '"dmPanningWidth":' + inttostr(PI8.pDevMode.dmPanningWidth )+',';
    result := result + '"dmPanningHeight":' + inttostr(PI8.pDevMode.dmPanningHeight ) ;
end;

end.
