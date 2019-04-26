unit ncgShell;

interface

uses Windows, SysUtils, Classes, Registry, madKernel, Dialogs;

type
  TnexShellDir = (sdDesktop, sdStartMenu, sdPrograms, sdStartup);
  TnexExplorerShellfolder = (esfShellFolders, esfUserShellFolders);

function GetShellDir(aShellDir: TnexShellDir; aUser, aNexCafe: Boolean): String;
function GetShellData(aESF: TnexExplorerShellFolder; aShellDir: TnexShellDir; aUser, aNexCafe: Boolean): String;

procedure ChangeShellData(DesktopToNexCafe, MenuIniciarToNexCafe: Boolean);

function StartupSubFolder: String;
function StartMenuSubFolder: String;
function ProgramsSubFolder: String;

function GetWinBaseFolder(aShellDir: TnexShellDir; aUser: Boolean): String;

procedure DelTree(aFolder: String; aOnlyFolders: Boolean);

procedure StartExplorer(aForce: Boolean = False);


var
  UserCommonStartupFolder,
  UserStartupFolder,
  CommonStartupFolder, 
  StartupFolder : String;
  CurrentUserName : String;

const 
  ValueName : Array[TnexShellDir] of String = (
    'Desktop', 'Start Menu', 'Programs', 'Startup');

implementation

uses ncShellStart, ncDebug;

const
   path_Explorer  = '\Software\Microsoft\Windows\CurrentVersion\Explorer';
   BoolStr : Array[Boolean] of String = ('FALSE', 'TRUE');

function SysDrive: String;
begin
  Result := Copy(CommonStartupFolder, 1, 3);
end;

procedure DelFolder(aFolder: String; SL: TStrings; aOnlyFolders: Boolean);
var 
  SR : TSearchRec;
  S : String;
begin
  SL.Add('@@@'+aFolder);
  if FindFirst(aFolder+'\*.*', faAnyFile, SR)=0 then
  try
    repeat
      if (SR.Name<>aFolder) and (SR.Name<>'.') and (SR.Name<>'..') then
      if (SR.Attr and faDirectory) = faDirectory then
        DelFolder(aFolder+'\'+SR.Name, SL, aOnlyFolders)
      else
      if not aOnlyFolders then begin
        S := SR.Name;
        Windows.DeleteFile(PChar(SR.Name));
        SL.Add(aFolder+'\'+S);
      end;
    until FindNext(SR)<>0;
  finally
    FindClose(SR);
  end;
end;

procedure DelTree(aFolder: String; aOnlyFolders: Boolean);
var 
  SL : TStrings;
  I  : Integer;
  S  : String;
begin
  SL := TStringList.Create;
  try
    DelFolder(aFolder, SL, aOnlyFolders);
    for I := SL.Count-1 downto 0 do begin
      S := SL[I];
      if Copy(S, 1, 3)<>'@@@' then begin
        Windows.DeleteFile(PChar(S));
        SL.Delete(I);
      end;
    end;
    for I := SL.Count-1 downto 0 do begin
      S := SL[I];
      Delete(S, 1, 3);
      RemoveDirectory(PChar(S));
    end;
    
  finally
    SL.Free;
  end;
end;   

procedure FechaProc(ProcessID: Cardinal);
VAR ProcessHandle: THANDLE;
    ExitCode: DWORD;
begin
   ExitCode:= 0;
   ProcessHandle:= OpenProcess(PROCESS_CREATE_THREAD OR
                               PROCESS_VM_OPERATION
                               OR PROCESS_VM_WRITE OR PROCESS_VM_READ OR
                               PROCESS_TERMINATE,
                               FALSE,ProcessID);
   if (ProcessHandle > 0) then
   BEGIN
       GetExitCodeProcess(ProcessHandle, ExitCode);
       TerminateProcess(ProcessHandle,ExitCode);
       CloseHandle(ProcessHandle);
   END;
end;
   
procedure StartExplorer(aForce: Boolean = False);
begin
  if aForce or (Processes('explorer.exe').ItemCount=0) then 
    ShellStart('explorer.exe');
end;

procedure ChangeShellData(DesktopToNexCafe, MenuIniciarToNexCafe: Boolean);
var R: TRegistry; SD : TnexShellDir; S: String;
begin
  DebugMsg('*** ChangeShellData - DesktopToNexCafe: ' + BoolStr[DesktopToNexCafe] + ' - MenuIniciarToNexCafe: ' + BoolStr[MenuIniciarToNexCafe]);
  R := TRegistry.Create;
  try
    R.RootKey := HKEY_CURRENT_USER;
    R.Access := KEY_ALL_ACCESS;
    if R.OpenKey(path_Explorer+'\User Shell Folders', True) then 
      for SD := Low(TnexShellDir) to High(TnexShellDir) do 
        if SD<>sdStartup then
        if SD=sdDesktop then
          R.WriteExpandString(ValueName[SD], GetShellData(esfUserShellFolders, SD, True, DesktopToNexCafe)) else
          R.WriteExpandString(ValueName[SD], GetShellData(esfUserShellFolders, SD, True, MenuIniciarToNexCafe));
    R.CloseKey;

    if R.OpenKey(path_Explorer+'\Shell Folders', True) then 
      for SD := Low(TnexShellDir) to High(TnexShellDir) do 
        if SD<>sdStartup then
        if SD=sdDesktop then
          R.WriteExpandString(ValueName[SD], GetShellData(esfShellFolders, SD, True, DesktopToNexCafe)) else
          R.WriteExpandString(ValueName[SD], GetShellData(esfShellFolders, SD, True, MenuIniciarToNexCafe));
          
    R.CloseKey;          
    
    R.RootKey := HKEY_LOCAL_MACHINE; 
    R.Access := KEY_ALL_ACCESS;
     
    if R.OpenKey(path_Explorer+'\User Shell Folders', False) then 
      for SD := Low(TnexShellDir) to High(TnexShellDir) do 
        if SD<>sdStartup then begin
          if Sd=sdDesktop then
            S := GetShellData(esfUserShellFolders, SD, False, DesktopToNexCafe) else
            S := GetShellData(esfUserShellFolders, SD, False, MenuIniciarToNexCafe);
            
          R.WriteExpandString('Common ' + ValueName[SD], S);
        end;
    R.CloseKey;

    if R.OpenKey(path_Explorer+'\Shell Folders', False) then 
      for SD := Low(TnexShellDir) to High(TnexShellDir) do 
        if SD<>sdStartup then begin
          if SD=sdDesktop then
            S := GetShellData(esfShellFolders, SD, False, DesktopToNexCafe) else
            S := GetShellData(esfShellFolders, SD, False, MenuIniciarToNexCafe);
            
          R.WriteExpandString('Common ' + ValueName[SD], S);
        end;
      
    R.CloseKey;
  finally
    R.Free;
  end;
end;   

function GetCurrentUserName:String;
var le:DWORD;
begin
   le:=63;
   SetLength(result,le);
   if GetUsername(PChar(result),le) then 
     SetLength(result, le-1) else 
     result:='(erro)';
end;
   
function GetShellDirRegistry(const aShellDir: TnexShellDir; const aKey: HKEY = HKEY_CURRENT_USER; const aUser: Boolean = True) : String;
var 
  R : TRegistry;
  S : String;
begin
  R := TRegistry.Create;
  try
    R.RootKey := aKey;
    if aUser then
      S := '\User Shell Folders' else
      S := '\Shell Folders';
      
    if not R.OpenKeyReadOnly(path_explorer+S) then begin
      Result := '';
      Exit;
    end;

    if aKey = HKEY_CURRENT_USER then
      Result := R.ReadString(ValueName[aShellDir]) else
      Result := R.ReadString('Common '+ValueName[aShellDir]);
  finally
    R.Free;
  end;
  DebugMsg('GetShellDirRegistry -  aUser: ' + BoolStr[aUser] + ' - Result: ' + Result);
end;
   
function AppShellFolder(aUser: Boolean): String;
begin
  Result := ExtractFilePath(ParamStr(0))+'Shell\';
  if aUser then
    Result := Result + 'User\' else
    Result := Result + 'Common\';
end;  

function GetWinBaseFolder(aShellDir: TnexShellDir; aUser: Boolean): String;
var I, C: Integer;
begin
  if Win32MajorVersion>5 then begin
    if aShellDir=sdDesktop then begin
      if aUser then
        Result := SysDrive + 'Users\'+CurrentUserName+'\' else
        Result := SysDrive + 'Users\Public\';
    end else begin
      if aUser then
        Result := StartupFolder else
        Result := CommonStartupFolder;

      C := 0;  
      for I := Length(Result) downto 1 do begin
        if Result[I]='\' then Inc(C);
        if C=3 then Break;
      end;
      
      Result := Copy(Result, 1, I);
    end;
  end else begin
    if aUser then
      Result := SysDrive+ 'Documents And Settings\'+CurrentUserName+'\' else
      Result := SysDrive + 'Documents And Settings\All Users\';
  end;
  debugMsg('GetWinBaseFolder - aUser: ' + BoolStr[aUser]+ ' - Res: ' + Result);
end;

function GetUserWinBaseFolder(aShellDir: TnexShellDir; aUser: Boolean): String;
var I, C: Integer;
begin
  if Win32MajorVersion>5 then begin
    if aShellDir=sdDesktop then begin
      if aUser then
        Result := '%USERPROFILE%\' else
        Result := '%ALLUSERSPROFILE%\';
    end else begin
      if aUser then
        Result := UserStartupFolder else
        Result := UserCommonStartupFolder;

      C := 0;  
      for I := Length(Result) downto 1 do begin
        if Result[I]='\' then Inc(C);
        if C=3 then Break;
      end;
      
      Result := Copy(Result, 1, I);
    end;
  end else begin
    if aUser then
      Result := '%USERPROFILE%\' else
      Result := '%ALLUSERSPROFILE%\';
  end;
  debugMsg('*** GetUserWinBaseFolder - aUser: ' + BoolStr[aUser]+ ' - Res: ' + Result);
end;

function GetShellDir(aShellDir: TnexShellDir; aUser, aNexCafe: Boolean): String;
begin
  if aNexCafe then begin
    case aShellDir of
      sdDesktop: Result := AppShellFolder(aUser) + 'Desktop';
      sdStartMenu: Result := AppShellFolder(aUser) + StartMenuSubFolder;
      sdPrograms: Result := AppShellFolder(aUser) + ProgramsSubFolder;
    end;
  end else begin
    case aShellDir of
      sdDesktop: Result := GetWinBaseFolder(aShellDir, aUser) + 'Desktop';
      sdStartMenu: Result := GetWinBaseFolder(aShellDir, aUser) + StartMenuSubFolder;
      sdPrograms: Result := GetWinBasefolder(aShellDir, aUser) + ProgramsSubFolder;
    end;
  end;
  DebugMsg('*** GetShellDir - aUser: ' + BoolStr[aUser] + ' - aNexCafe: ' + BoolStr[aNexCafe] + ' - Res: ' + Result);
end;

function GetShellData(aESF: TnexExplorerShellFolder; aShellDir: TnexShellDir; aUser, aNexCafe: Boolean): String;
begin
  if aNexCafe then begin
    Result := GetShellDir(aShellDir, aUser, True);
  end else begin
    if aESF=esfShellFolders then
      Result := GetShellDir(aShellDir, aUser, False)
    else  
      case aShellDir of
        sdDesktop: Result := GetUserWinBaseFolder(aShellDir, aUser) + 'Desktop';
        sdStartMenu: Result := GetUserWinBaseFolder(aShellDir, aUser) + StartMenuSubFolder;
        sdPrograms: Result := GetUserWinBasefolder(aShellDir, aUser) + ProgramsSubFolder;
      end;
  end;
  DebugMsg('*** GetShellData - aUser: ' + BoolStr[aUser] + ' - aNexCafe: ' + BoolStr[aNexCafe] + ' - Res: ' + Result);
end;

function StartupSubFolder: String;
var I, C: Integer;
begin
  Result := '';
  C := 0;
  for I := Length(StartupFolder) downto 1 do begin
    if StartupFolder[I]='\' then Inc(C);
    if C=3 then Break;
    Result := StartupFolder[I] + Result;
  end;
end;

function StartMenuSubFolder: String;
begin
  Result := StartupSubFolder;
  Result := Copy(Result, 1, Pos('\', Result)-1);
end;

function ProgramsSubFolder: String;
var I : Integer;
begin
  Result := StartupSubFolder;
  for I := Length(Result) downto 1 do 
    if Result[I]='\' then begin
      Result := Copy(Result, 1, I-1);
      Exit;
    end;
end;

initialization
  StartupFolder := GetShellDirRegistry(sdStartup, HKEY_CURRENT_USER, False);
  CommonStartupFolder := GetShellDirRegistry(sdStartup, HKEY_LOCAL_MACHINE, False);
  UserStartupFolder := GetShellDirRegistry(sdStartup, HKEY_CURRENT_USER, True);
  UserCommonStartupFolder := GetShellDirRegistry(sdStartup, HKEY_LOCAL_MACHINE, True);
  
  CurrentUserName := GetCurrentUserName;

  

end.
