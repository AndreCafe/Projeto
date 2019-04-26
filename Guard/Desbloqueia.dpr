program Desbloqueia;

uses
  Forms,
  SysUtils,
  Windows,
  madCodeHook  ,
  lmdsysinfo,
  SsBase,
  StShrtCt,
  StShlCtl,
  ncgDesliga,
  Classes,
  WindowList,
  Messages,
  madKernel,
  ncgShell,
  ElevationUtils,
  dwlDesktop in 'C:\Comp\dwl\source-code\dwlginaSource\dwlDesktop.pas' {,
  ncDosCmd in '..\Comp\ncDosCmd.pas'},
  ncgLVBack in 'ncgLVBack.pas',
  ncShellStart,
  ncProtecao98 in 'ncProtecao98.pas',
  ncgRemoveRestr in 'ncgRemoveRestr.pas';

{$R *.RES}
{$R NexGuardmanifest.res NexGuardmanifest.rc}



var
  shutdownFlags : Cardinal;
  MutexH : THandle;
  buffer : String;
  JaAbriu : Boolean;
  S, S2: String;

{ HackClass }

procedure ExecFile(CmdLine: string);
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
  CreateProcess(nil,
      zCmdLine, { pointer to command line string }
      nil, { pointer to process security attributes }
      nil, { pointer to thread security attributes }
      False, { handle inheritance flag }
      CREATE_NEW_CONSOLE or
      NORMAL_PRIORITY_CLASS, { creation flags }
      nil, { pointer to new environment block }
      nil, { pointer to current directory name }
      StartupInfo,
      ProcessInfo);
  CloseHandle(ProcessInfo.hProcess);
  CloseHandle(ProcessInfo.hThread);
end;


procedure DisableUAC;
begin
  if IsUACEnabled then
    ShellStartCustom('cmd.exe', '/c %windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f', '%windir%\System32\', 0, 1, 'runas');
end;

procedure ApagaDir(str: String);
var 
  sr: TSearchRec;
  T: Cardinal;
begin
  try
    if FindFirst(str+'\*.*', faAnyFile, sr) = 0 then
    try
      repeat
        if (sr.name<>'.') and (sr.name<>'..') then
        if (sr.Attr = faDirectory) then 
          ApagaDir(str+'\'+sr.Name) 
        else begin
          T := GetTickCount;
          repeat
          until DeleteFile(pchar(str+'\'+sr.Name)) or ((GetTickCount-T)>15000);
        end;
      until FindNext(sr) <> 0;
    finally  
      sysutils.FindClose(sr);
    end;
    rmdir(str);
  except
  end;  
end;

procedure RemoveDriverHook;
var 
  S: String;
  SI : TLMDSysInfo;
begin
  SI := TLmdSysInfo.Create(nil);
  try
    S := SI.WinSysPath+'\hookinst.sys';
    if UninstallMadCHook and FileExists(S) then
      DeleteFile(PAnsiChar(S));
  finally
    SI.Free;
  end;      
end;

procedure AjustaAtalhos;
var 
  str: String;
  sc : TstShortCut;
begin
  sc := TstShortCut.Create(nil);
  try
    sc.AutoName := False;
    sc.FileName := ParamStr(0);
    sc.StartInDir := ExtractFileDir(ParamStr(0));
    sc.SpecialFolder := sfCommonPrograms;
    sc.MakePath(str);
    SetFileAttributes(pchar(str+'Cyber-Manager'), FILE_ATTRIBUTE_NORMAL);
    ApagaDir(str+'Cyber-Manager');
    Mkdir(str+'NexCafé');
    sc.Description := 'NexCafé\NexCafé NexGuard';
    sc.CreateShortcut;

    sc.SpecialFolder := sfDesktop;
    sc.MakePath(str);
    str := str+'Cyber Manager CM-Guard.lnk';
    if FileExists(str) then begin
      SetFileAttributes(pchar(str), FILE_ATTRIBUTE_NORMAL);
      DeleteFile(pchar(str));
      sc.Description := 'NexCafé NexGuard';
      sc.CreateShortcut;
    end;  
  except
  end;
  sc.Free;
end;
  
begin
  LongTimeFormat := 'hh:mm:ss';
  
  Application.Initialize;
 
  ChangeShellData(False, False);
  TncProtege98.NexCafe_Installed(False);
  RemoveDriverHook;
  try
    ExecFile('"'+ExtractFilePath(ParamStr(0))+'guardis.exe" REMOVER SILENT');
  except
  end;
    
  with TncProtege98.Create(nil) do
  try
    AutoStart(False);
    BloqueiaCtrlAltDel := False;
    Free;
  except
  end;
  TFrmRemoveRestr.Create(nil).ShowModal;
end.
