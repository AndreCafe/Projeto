unit ncgDMArqs;

interface

uses
  SysUtils, 
  Windows,
  Classes, 
  LMDCustomComponent, 
  lmdcont, 
  madremote,
  madCodeHook,
  madstrings,
  ncDebug,
  lmdsysinfo,
  ncVersionInfo, LMDBaseController, LMDCustomContainer, LMDGenericList;

type
  TdmArqs = class(TDataModule)
    glArqs: TLMDGenericList;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SalvaArqs;
    procedure ExtractNovaPV;
    class procedure NexUpd(S: String);
  end;

  procedure CheckHookDriver;
  
  function Inject(inject: boolean; dllname: String) : boolean;
  

var
  dmArqs: TdmArqs;

const
  ServiceName = 'NexGuardIS';
  

implementation

uses ncCheckWin64, ncgFrmPri, ncShellStart{, ncgDMArqsPrint};

{$R *.dfm}

{ TdmArqs }

procedure ExecFile(CmdLine: string; aWait: Boolean = False; aWaitTime: Cardinal = INFINITE);
var
  zCmdLine: array[0..512] of char;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  StrPCopy(zCmdLine, CmdLine);
  FillChar(StartupInfo, Sizeof(StartupInfo), #0);
  StartupInfo.cb:= Sizeof(StartupInfo);
{  StartupInfo.dwFlags:= STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow:= Visibility;}
  if CreateProcess(nil,
      zCmdLine, { pointer to command line string }
      nil, { pointer to process security attributes }
      nil, { pointer to thread security attributes }
      False, { handle inheritance flag }
      CREATE_NEW_CONSOLE or
      NORMAL_PRIORITY_CLASS, { creation flags }
      nil, { pointer to new environment block }
      nil, { pointer to current directory name }
      StartupInfo,
      ProcessInfo) then 
  begin
    if aWait then 
      WaitForSingleObject(ProcessInfo.hProcess, aWaitTime);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
  end;
end;

function WaitForService: boolean;
// when the PC boots up and your program is in the autostart
// it may happen that your program runs before the service is ready
// so this function makes sure that the service is up and running
const SERVICE_START               = $10;
      SERVICE_CONTROL_INTERROGATE = 4;
      SERVICE_STOPPED             = 1;
      SERVICE_START_PENDING       = 2;
      SERVICE_RUNNING             = 4;
var c1, c2 : dword;
    ss     : array [0..6] of dword;
    i1     : integer;
    dll    : dword;
    OpenSCManagerA     : function (machine, database: pchar; access: dword) : dword; stdcall;
    OpenServiceA       : function (scMan: dword; service: pchar; access: dword) : dword; stdcall;
    ControlService     : function (service, control: dword; status: pointer) : bool; stdcall;
    StartServiceA      : function (service: dword; argCnt: dword; args: pointer) : bool; stdcall;
    CloseServiceHandle : function (handle: dword) : bool; stdcall;
begin
  result := false;
  // dynamic advapi32 API linking
  dll := LoadLibrary('advapi32.dll');
  OpenSCManagerA     := GetProcAddress(dll, 'OpenSCManagerA');
  OpenServiceA       := GetProcAddress(dll, 'OpenServiceA');
  ControlService     := GetProcAddress(dll, 'ControlService');
  StartServiceA      := GetProcAddress(dll, 'StartServiceA');
  CloseServiceHandle := GetProcAddress(dll, 'CloseServiceHandle');
  if (@OpenSCManagerA     <> nil) and
     (@OpenServiceA       <> nil) and
     (@ControlService     <> nil) and
     (@StartServiceA      <> nil) and
     (@CloseServiceHandle <> nil) then begin
    // first we contact the service control manager
    c1 := OpenSCManagerA(nil, nil, 0);
    if c1 <> 0 then begin
      // okay, that worked, now we try to open our service
      c2 := OpenServiceA(c1, pchar(serviceName), GENERIC_READ or SERVICE_START);
      if c2 <> 0 then begin
        // that worked, too, let's check its state
        if ControlService(c2, SERVICE_CONTROL_INTERROGATE, @ss) then begin
          if ss[1] = SERVICE_STOPPED then
            // the service is stopped (for whatever reason), so let's start it
            StartServiceA(c2, 0, nil);
          // now we wait until the process is in a clear state (timeout 15 sec)
          for i1 := 1 to 300 do begin
            if (not ControlService(c2, SERVICE_CONTROL_INTERROGATE, @ss)) or
               (ss[1] <> SERVICE_START_PENDING) then
              break;
            Sleep(50);
          end;
          // is it finally running or not?
          result := ss[1] = SERVICE_RUNNING;
        end;
        CloseServiceHandle(c2);
      end else begin
        ExecFile('"'+ExtractFilePath(ParamStr(0))+'guardis.exe" INSTALAR SILENT');
        Sleep(1000);
      end;  
      CloseServiceHandle(c1);
    end;
  end;
  FreeLibrary(dll);
end;

// ***************************************************************

type
  // this is the information record which we send to our injection service
  TDllInjectRequest = packed record
    inject  : bool;
    timeOut : dword;
    session : dword;
    dllname : array [0..MAX_PATH] of char;
  end;

function Inject(inject: boolean; dllname: String) : boolean;
// (un)inject our dll system wide
var dir : TDllInjectRequest;
    res : bool;
begin
  if NoInj then begin
    Result := False;
    Exit;
  end;

  // first let's try to inject the dlls without the help of the service
  if inject then
    result := InjectLibrary(ALL_SESSIONS and (not CURRENT_PROCESS), dllname) else
    result := UninjectLibrary(ALL_SESSIONS and (not CURRENT_PROCESS), dllname);

  if (not result) and (Win32Platform = VER_PLATFORM_WIN32_NT) and (not NoGuardIS) then begin
    DebugMsg('Inject Falhou. Inject by service');
    // didn't work, so let's try to ask our service for help
    // first of all we wait until the service is ready to go
    WaitForService;
    // then we prepare a dll injection request record
    dir.inject  := inject;
    dir.timeOut := 5000;
    dir.session := GetCurrentSessionId;   
    Fillchar(dir.dllname, sizeOf(dir.dllname), 0);
    StrCat(dir.dllname, pchar(dllname));
    // now we try to contact our injection service
    result := SendIpcMessage(ServiceName, @dir, sizeOf(dir), @res, sizeOf(res), 15000, true) and res;
  end;
end;

procedure TdmArqs.ExtractNovaPV;
begin
  try
    glArqs.Items[8].SaveToFile(ExtractFilePath(ParamStr(0))+'novapv.exe');
  except
  end; 
  Free;
end;

class procedure TdmArqs.NexUpd(S: String);
var 
  sExe: String;
begin
  sExe := ExtractFilePath(ParamStr(0)) + 'NexUpd.exe';
  if not FileExists(sExe) then begin
    with TdmArqs.Create(nil) do try
      glArqs.Items[2].SaveToFile(sExe);
    finally
      Free;
    end;
  end;
  ShellStart(sExe,'"'+S+'"', '', 0);
  Sleep(500);
  DeleteFile(PAnsiChar(sExe));
end;

procedure TdmArqs.SalvaArqs;
var 
  S: String;
  aExtrair, aTudo: Boolean;
  aExiste: Boolean;
  SR : TSearchRec;
  aVersion: String;
begin
  DebugMsg('Salvando arquivos...');
  try
    glArqs.Items[0].SaveToFile(ExtractFilePath(ParamStr(0))+'guardprintapi.dll');
  except
  end;  

  try
    glArqs.Items[3].SaveToFile(ExtractFilePath(ParamStr(0))+'nexcafe.nve');
  except
  end; 

  try
    glArqs.Items[7].SaveToFile(ExtractFilePath(ParamStr(0))+'nexap.exe');
  except
  end; 

  try
    if IsWow64 then
      glArqs.Items[6].SaveToFile(ExtractFilePath(ParamStr(0))+'nxnex.dll') else
      glArqs.Items[5].SaveToFile(ExtractFilePath(ParamStr(0))+'nxnex.dll');
  except
  end;

  {try
    glArqs.Items[7].SaveToFile(ExtractFilePath(ParamStr(0))+'nexap.exe');
  except
  end; }
  
  if (Win32Platform = VER_PLATFORM_WIN32_NT) then 
  try
    S := ExtractFilePath(ParamStr(0))+'guardis.exe';
    aExiste := FileExists(S);
    aExtrair := (not aExiste);
    aVersion := GetVersionInfo;
    if not aExtrair then
      aExtrair := (slConfig.Values['versao']<>aVersion);

    if aExtrair and aExiste then 
      ExecFile('"'+S+'" REMOVER SILENT', True, 4000);

    if aExtrair then 
      glArqs.Items[1].SaveToFile(S);

    S := ExtractFilePath(ParamStr(0))+'wguard.exe';
    aExiste := FileExists(S);
    aExtrair := (not aExiste);
    if not aExtrair then
      aExtrair := (slConfig.Values['versao']<>aVersion);

    if ThinClient then begin 
      if aExtrair then 
        glArqs.Items[4].SaveToFile(S);
      ExecFile('"'+S+'" REMOVER SILENT', True, 100);
    end else begin
      if aExtrair and aExiste then 
        ExecFile('"'+S+'" REMOVER SILENT', True, 4000);

      if aExtrair then 
        glArqs.Items[4].SaveToFile(S);
    
      ExecFile('"'+S+'" INSTALAR SILENT');
    end;

    slConfig.Values['versao'] := aVersion;
    slConfig.SaveToFile(IniFName);
    
  except
  end; 
  DebugMsg('Arquivos salvos com sucesso...');
end;

procedure CheckHookDriver;
var 
  S: String;
  SI : TLMDSysInfo;
  Arq : TextFile;
begin
  DebugMsg('CheckHookDriver ...');
  SI := TLmdSysInfo.Create(nil);
  try
    S := SI.WinSysPath+'\hookinst.sys';
    DebugMsg('SI.WinSysPath - '+S);
    
    if not FileExists(S) then begin
      DebugMsg('Instalar MadCHook');
      if InstallMadCHook then begin
        DebugMsg('MadCHook instalado');
        AssignFile(Arq, S);
        try
          DebugMsg('Gravar arquivo '+S);
          Rewrite(Arq);
          Writeln(Arq, 'installed');
          DebugMsg('Arquivo gravado');
        finally
          CloseFile(Arq);
        end;  
      end;
    end else
      DebugMsg('Não instalou MadCHook');
  
//    if (Win32Platform <> VER_PLATFORM_WIN32_NT) then Exit;
  
    if not NoGuardIS then begin
      if (Win32Platform = VER_PLATFORM_WIN32_NT) then begin
        DebugMsg('Iniciar GuardIS');
        WaitForService;
        DebugMsg('GuardIS Iniciado');
      end;
    end else
      DebugMsg('GuardIS = N');
  except
  end;      
  DebugMsg('SI.Free 1');
  SI.Free;
  DebugMsg('SI.Free 2');
end;

end.
