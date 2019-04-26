unit ncProtecao98;

interface

uses 
  ExtCtrls, 
  SysUtils, 
  Forms, 
  Dialogs, 
  Messages, 
  Graphics, 
  Classes, 
  Windows, 
  Menus, 
  ncProtecao, {xpButton,} 
  Registry;

const
  PolicyStr : PChar = 'Policy';

  Drives_Mask : Array['A'..'Z'] of Cardinal = (
{a}   $01, 
{b}   $02,
{c}   $04,
{d}   $08,
{e}   $10,
{f}   $20,
{g}   $40,
{h}   $80,
{i}   $100,
{j}   $200,
{k}   $400,
{l}   $800,
{m}   $1000,
{n}   $2000,
{o}   $4000,
{p}   $8000,
{q}   $10000,
{r}   $20000,
{s}   $40000,
{t}   $80000,
{u}   $100000,
{v}   $200000,
{w}   $400000,
{x}   $800000,
{y}   $1000000,
{z}   $2000000);

type

   TncProtege98 = class (TncProtegeWindows)
   private
     FStartMenu   : TPopupMenu;
     FRegistry    : TRegistry;
     FLastOpen    : String;
     FDesktopLV   : HWND;
     FTimerDskTop : TTimer;
     FBin         : Array[1..1024] of Byte;
     FBinSize     : Integer;
   protected
     procedure OnDesktopTimer(Sender: TObject);
     procedure _NoDesktop(No: Boolean); override;

     procedure _NoAltTab(No: Boolean); override;
     procedure _NoAltEsc(No: Boolean); override;
     procedure _NoWinkeys(No: Boolean); override;
     procedure _NoCtrlEsc(No: Boolean); override;
     procedure _NoTaskbar(No: Boolean); override;
     procedure _NoTaskLinks(No: Boolean); override;
     procedure _NoTaskTray(No: Boolean); override;
     procedure _NoCtrlPanel(No: Boolean); override;
     procedure _NoDownload(No: Boolean); override;
     procedure _NoExeDownload(No: Boolean); override;
     procedure _NoDocs(No: Boolean); override;
     procedure _NoRunCmd(No: Boolean); override;
     procedure _NoNetwork(No: Boolean); override;
     procedure _NoRightClick(No: Boolean); override;
     procedure _NoToolbars(No: Boolean); override;

     procedure DoHideDrives(ADrives: String); override;
     
     procedure SetStartMenu(const Value: TPopupMenu); override;
     function GetStartMenu: TPopupMenu; override;
     procedure SetNoStartMenu(const Value: Boolean); override;

     procedure AplicaProtStartMenu;
     procedure ClicouStartMenu(Sender: TObject);
     procedure RegOpenEx(AHKey: HKEY; S: String);
     procedure RegWriteEx(AHKey: HKEY; Key, Nome: String; Valor: Boolean);
     procedure RegWriteStringEx(AHKEY: HKEY; Key, Nome: String; Valor: String);
     procedure RegWriteDWEx(AHKey: HKEY; Key, Nome: String; Valor: DWORD);
     procedure RegDeleteEx(AHKey: HKey; Key, Nome: String);
     procedure RegReadBin(AHKey: HKey; Key, Nome: String);
     procedure RegWriteBin(AHKey: HKey; Key, Nome: String);
     procedure RegDeleteKey(Key: String);

     procedure RegClose;
     procedure RegWrite(Key, Nome: String; Valor: Boolean);
     procedure RegWriteString(Key, Nome: String; Valor: String);
     procedure RegWriteDW(Key, Nome: String; Valor: DWORD);
     procedure RegDelete(Key, Nome: String);

     procedure ApplyClassicMenu(aClassic: Boolean); override;
     
   public
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;

     procedure _NoCtrlAltDel(No: Boolean); override;

     procedure AtivaProtecao; override;
     procedure DesativaProtecao; override;
     procedure ForceIEStartPage(S: String); override;
     procedure AutoStart(Ativar: Boolean); override;

     procedure AplicaNonEnum(aBloquear: Boolean); override;
     
     function CriaReg: Boolean;
     procedure DestroyReg;
     procedure BroadcastChanges;
     procedure PermitirDownload(aPermitir, aPermitirExe: Boolean);

     class procedure NexCafe_Installed(aSim: Boolean);
   end;  

   TThreadAlterouPolicies = class ( TThread )
   protected
     procedure Execute; override;
   end;  
     

function GetDesktopListViewHandle: Hwnd;

const
   Reg_Explorer  = '\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer';
   
   Reg_Programs  = '\Software\Microsoft\Windows\CurrentVersion\Policies\Programs';
   Reg_NonEnum   = '\Software\Microsoft\Windows\CurrentVersion\Policies\NonEnum';
   Reg_ExpClsID  = '\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID';
   Reg_ExpAdv    = '\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced';                                            
   Reg_ExpHide1  = '\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu';
   Reg_ExpHide2  = '\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel';
   Reg_Winlogon  = '\Software\Microsoft\Windows NT\CurrentVersion\Winlogon';
   

   Reg_CP_Desk   = '\Control Panel\Desktop';
   
   Reg_ShellState = '\Software\Microsoft\Windows\CurrentVersion\Explorer';
   Reg_System    = '\Software\Microsoft\Windows\CurrentVersion\Policies\System';
   Reg_IEZone3   = '\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3';
   Reg_IEZone4   = '\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4';
   
   Reg_IETabs    = '\Software\Policies\Microsoft\Internet Explorer\TabbedBrowsing';
   Reg_AutoRec   = '\Software\Policies\Microsoft\Internet Explorer\Recovery';
   
   Reg_IECP      = '\Software\Policies\Microsoft\Internet Explorer\Control Panel';
   Reg_IEMain    = '\Software\Microsoft\Internet Explorer\Main';
   Reg_AutoStart = '\Software\Microsoft\Windows\CurrentVersion\Run';
   Reg_Compat    = '\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers';
   Reg_ShellFolder = '\CLSID\{208D2C60-3AEA-1069-A2D7-08002B30309D}\ShellFolder';

   BoolInt : Array[Boolean] of Integer = (0, 1);

var
  DesktopListViewHandle : HWND;
  FTaskBarH    : HWND;
  FStartBtnH   : HWND;


function GetDesktopHWND: HWND;
  
implementation

uses ncgFrmHide, ncDebug, ncgClassicMenu, ncClassesBase;


procedure TncProtege98.RegClose;
begin
  FLastOpen := '';
  if Assigned(FRegistry) then
    FRegistry.CloseKey;
end;  
 

procedure TncProtege98.RegOpenEx(AHKey: HKey; S: String);
begin
  if FLastOpen<>S then begin
    RegClose;
    if not Assigned(FRegistry) then  Exit;
      
    FRegistry.RootKey := AHKEY;
    FRegistry.Access := KEY_ALL_ACCESS;
    
    FLastOpen := S;
    FRegistry.OpenKey(S, True);
  end;  
end;

procedure TncProtege98.RegWriteEx(AHKey: HKEY; Key, Nome: String; Valor: Boolean);
begin
  if Valor then
    RegWriteDWEx(AHKEY, Key, Nome, 1) else
    RegWriteDWEx(AHKEY, Key, Nome, 0);
end;

procedure TncProtege98.RegWriteDWEx(AHKey: HKEY; Key, Nome: String; Valor: DWORD);
begin
  try
    FRegistry.RootKey := AHKEY;
    FRegistry.Access := KEY_ALL_ACCESS;
    FRegistry.OpenKey(Key+'\', True);
    FRegistry.WriteInteger(Nome, Valor);
    FRegistry.CloseKey;
  except
  end;  
end;

procedure TncProtege98.RegReadBin(AHKey: HKey; Key, Nome: String);
begin
  try
    FRegistry.RootKey := AHKEY;
    FRegistry.Access := KEY_ALL_ACCESS;
    FRegistry.OpenKey(Key+'\', True);
    FillChar(FBin, SizeOf(FBin), 0);
    FBinSize := 0;
    FBinSize := FRegistry.ReadBinaryData(Nome, FBin, SizeOf(FBin));
    FRegistry.CloseKey;
  except
  end;  
end;

procedure TncProtege98.RegWriteBin(AHKey: HKey; Key, Nome: String);
begin
  try
    FRegistry.RootKey := AHKEY;
    FRegistry.Access := KEY_ALL_ACCESS;
    FRegistry.OpenKey(Key+'\', True);
    FRegistry.WriteBinaryData(Nome, FBin, FBinSize);
    FRegistry.CloseKey;
  except
  end;  
end;

procedure TncProtege98.RegDeleteEx(AHKEY: HKEY; Key, Nome: String);
begin
  try
    FRegistry.RootKey := AHKEY;
    FRegistry.Access := KEY_ALL_ACCESS;
    if FRegistry.OpenKey(Key+'\', True) then begin
      FRegistry.DeleteValue(Nome);
      FRegistry.CloseKey;
    end;
  except
  end;  
end;

procedure TncProtege98.RegDeleteKey(Key: String);
begin
  try
    FRegistry.RootKey := HKEY_CURRENT_USER;
    FRegistry.Access := KEY_ALL_ACCESS;
    FRegistry.DeleteKey(Key);

    FRegistry.RootKey := HKEY_LOCAL_MACHINE;
    FRegistry.Access := KEY_ALL_ACCESS;
    FRegistry.DeleteKey(Key);
  except
  end;
end;

procedure TncProtege98.RegWriteStringEx(AHKey: HKEY; Key, Nome: String; Valor: String);
begin
  try
    FRegistry.RootKey := AHKEY;
    FRegistry.Access := KEY_ALL_ACCESS;
    FRegistry.OpenKey(Key+'\', True);
    FRegistry.WriteString(Nome, Valor);
    FRegistry.CloseKey;
  except
  end;  
end;

function GetDeskHandle(ArrivingHandle:hwnd;lparam:lparam):boolean; stdcall;
var
   cname:array[0..100] of char;
begin
     result:=true;
     getclassname(ArrivingHandle,cname,100);

     if cname='SysListView32' then
    begin
          DesktopListViewHandle:=ArrivingHandle;
          result:=false;
     end;
end;

function GetDesktopListViewHandle: Hwnd;
begin
     Result := GetDesktopHWND;
     DesktopListViewHandle:=0;
     enumchildwindows(Result,@GetDeskHandle,0);
     Result:=DesktopListViewHandle;
end;

function GetDesktopHWND: HWND;
begin
  Result := FindWindow('ProgMan', nil);
  if Result <> 0 then
    Result := FindWindowEx(Result, 0, 'ShellDll_DefView', nil);
  if Result <> 0 then
    Result := FindWindowEx(Result, 0, 'SysListView32', nil);
end;

function GetDesktopParent: HWND;
begin
  Result := FindWindow('ProgMan', nil);
  if Result <> 0 then
    Result := FindWindowEx(Result, 0, 'ShellDll_DefView', nil);
end;

{procedure ShowStartButton(bvisible: Boolean); 
var 
  h: hwnd; 
  TaskWindow: hwnd;
begin
  if bvisible then
  begin
    h := FindWindowEx(GetDesktopWindow, 0, 'Button', nil); 
    TaskWindow := FindWindow('Shell_TrayWnd', nil); 
    ShowWindow(h, 1); 
    Windows.SetParent(h, TaskWindow); 
  end  
  else 
  begin 
    h := FindWindowEx(FindWindow('Shell_TrayWnd', nil), 0, 'Button', nil); 
    ShowWindow(h, 0); 
    Windows.SetParent(h, 0); 
  end; 
end;}

procedure ShowStartButton(bvisible: Boolean);
var H : HWND;
begin
  HideStartMenu := not bVisible;
  Exit;
  
{  H := FindWindow('Shell_TrayWnd', nil);
  if (H<>FTaskbarH) or (FStartBtnH=0) then begin
    FTaskbarH := H;
    FStartBtnH := FindWindowEx(FTaskbarH, 0, 'Button', nil);
    if FStartBtnH=0 then
      FStartBtnH := FindWindow('BUTTON', 'START');
  end;

  if FStartBtnH>0 then
  if bVisible then begin
    Windows.SetParent(FStartBtnH, FTaskbarH);
    ShowWindow(FStartBtnH, SW_SHOW);
  end else begin
    Windows.SetParent(FStartBtnH, HideHandle);
    ShowWindow(FStartBtnH, SW_HIDE);
  end;}

    
{  if bvisible then begin
    if HStartButton<>0 then begin
      Windows.SetParent(HStartButton, FindWindow('Shell_TrayWnd', nil));
      ShowWindow(HStartButton, 1); 
      HStartButton := 0;
    end;  
  end else begin 
    HStartButton := FindWindowEx(FindWindow('Shell_TrayWnd', nil), 0, 'Button', nil); 
    ShowWindow(HStartButton, 0); 
    Windows.SetParent(HStartButton, 0); 
  end; }
end;

procedure TncProtege98._NoDesktop(No: Boolean);
var 
  H : HWND;
begin

  RegWrite(Reg_Explorer, 'NoDesktop', False); 

  Exit;
  
  H := GetDesktopHWND;
  if H<>0 then
  if No then begin
    FDesktopLV := H;
    FTimerDskTop.Enabled := True;
    FTimerDskTop.OnTimer := OnDesktopTimer;
    ShowWindow(H, SW_HIDE);
    EnableWindow(H, False);
  end else begin
    FTimerDskTop.Enabled := False;
    FTimerDskTop.OnTimer := nil;
    ShowWindow(H, SW_SHOW);
    EnableWindow(H, True);
  end;
end;

procedure TncProtege98._NoCtrlAltDel(No: Boolean);
const
  BoolSt : Array[Boolean] of String = ('False', 'True');
var 
  B: Boolean;
begin
  SystemParametersInfo( SPI_SCREENSAVERRUNNING, Word(No), @b, 0);

  RegWrite(Reg_System, 'DisableLockWorkstation', No);
  RegWrite(Reg_System, 'DisableTaskMgr', BloqueiaCtrlAltDel);
  DebugMsg('DisableTaskMgr = ' + BoolSt[No]);
  DebugMsg('Win32MajorVersion = ' + IntToStr(Win32MajorVersion));
  RegWrite(Reg_System, 'DisableChangePassword', No);
  RegWrite(Reg_Explorer, 'NoClose', No);
  RegWrite(Reg_Explorer, 'NoFind', No);
  RegWrite(Reg_Explorer, 'NoLogoff', No);
  RegWrite(Reg_System, 'HideFastUserSwitching', No);
  
  if Win32MajorVersion  < 6 then
    RegWrite(Reg_Explorer, 'NoActiveDesktop', True) else
    RegWrite(Reg_Explorer, 'NoActiveDesktop', False);

  RegWrite(Reg_Explorer, 'NoToolbarCustomize', No);
  RegWrite(Reg_Explorer, 'NoBandCustomize', No); 
    
  if Win32MajorVersion < 6 then  
    RegWrite(Reg_Explorer, 'ClassicShell', No);  
end;

procedure TncProtege98._NoCtrlPanel(No: Boolean);
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    RegWrite(Reg_Explorer, 'NoControlPanel', No);
  RegWrite(Reg_Explorer, 'NoSetFolders', No);
  RegWrite(Reg_Explorer, 'NoSetTaskbar', No);
  RegWrite(Reg_Explorer, 'NoPrinters', No);
  RegWrite(Reg_ExpAdv, 'Start_ShowPrinters', not No);
  RegWrite(Reg_ExpAdv, 'Start_ShowControlPanel', not No);
  RegWrite(Reg_ExpAdv, 'Start_ShowNetPlaces', not No);
  
  RegWrite(Reg_Explorer, 'NoSMHelp', No);
  RegWrite(Reg_Explorer, 'NoRecentDocsHistory', No);
  RegWrite(Reg_Explorer, 'NoUserNameInStartMenu', No);
  RegWrite(Reg_Explorer, 'NoManageMyComputerVerb', No);
  
  RegWrite(Reg_Programs, 'NoDefaultPrograms', No);
  RegWrite(Reg_Programs, 'NoGetPrograms', No);
  RegWrite(Reg_Programs, 'NoInstalledUpdates', No);
  RegWrite(Reg_Programs, 'NoProgramsAndFeatures', No);
  RegWrite(Reg_Programs, 'NoProgramsCPL', No);
  RegWrite(Reg_Programs, 'NoWindowsFeatures', No);
  RegWrite(Reg_Programs, 'NoWindowsMarketPlace', No);

  RegWrite(Reg_CP_Desk, 'AutoEndTasks', False);

  if Win32MajorVersion>=6 then begin
    RegDelete(Reg_CP_Desk, 'WaitToKillAppTimeout');
    RegDelete(Reg_CP_Desk, 'HungAppTimeout');
  end else begin
    RegWriteDW(Reg_CP_Desk, 'WaitToKillAppTimeout', 20000);
    RegWriteDW(Reg_CP_Desk, 'HungAppTimeout', 20000);
  end;

  RegWrite(Reg_Explorer, 'NoFileUrl', False {No});
  
  RegWriteDW(Reg_IETabs, 'Enabled', 1);
  RegWriteDW(Reg_AutoRec, 'AutoRecover', 2);
  RegWriteDW(Reg_IETabs, 'WarnOnClose', 0);

  RegWriteDW(Reg_Winlogon, 'AutoRestartShell', 1);

  RegWrite(Reg_ExpHide1, '{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}', No);
  RegWrite(Reg_ExpHide2, '{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}', True{No});
end;

procedure TncProtege98._NoDocs(No: Boolean);
begin
  inherited;
  RegWrite(Reg_ExpHide1, '{450D8FBA-AD25-11D0-98A8-0800361B1103}', No);
  RegWrite(Reg_ExpHide2, '{450D8FBA-AD25-11D0-98A8-0800361B1103}', No);
  
  RegWrite(Reg_Explorer, 'NoSMMyDocs', No);
  RegWrite(Reg_Explorer, 'NoSMMyPictures', No);
  RegWrite(Reg_Explorer, 'NoStartMenuMyMusic', No);
end;

procedure TncProtege98._NoDownload(No: Boolean);
begin
  if No then
    RegWriteDW(Reg_IEZone3, '1803', 3) else
    RegWriteDW(Reg_IEZone3, '1803', 0);
    
//  RegWriteDW(Reg_IEZone3, '1206', 0);  
  RegWriteDW(Reg_IEZone3, '1607', 3);
  RegWriteDW(Reg_IEZone3, '1406', 3);
  RegWriteDW(Reg_IEZone4, '180B', 0);
  
  RegWrite(Reg_IECP, 'SecurityTab', No);
end;

procedure TncProtege98._NoExeDownload(No: Boolean);
begin
  inherited;
  if No then begin
    RegWriteDW(Reg_IEZone3, '1806', 3);
    RegWriteDW(Reg_IEZone3, '1804', 3);
  end else begin
    RegWriteDW(Reg_IEZone3, '1806', 1);
    RegWriteDW(Reg_IEZone3, '1804', 1);
  end;
end;

procedure TncProtege98._NoAltTab(No: Boolean);
begin
//  _NoCtrlAltDel(No or GetOpcaoBool(cmp_NoCtrlAltDel));
end;

procedure TncProtege98._NoAltEsc(No: Boolean);
begin
//  _NoCtrlAltDel(No or GetOpcaoBool(cmp_NoCtrlAltDel));
end;

procedure TncProtege98._NoWinkeys(No: Boolean);
begin
  RegWrite(Reg_Explorer, 'NoWinKeys', No);
end;

procedure TncProtege98._NoCtrlEsc(No: Boolean);
begin
//  _NoCtrlAltDel(No or GetOpcaoBool(cmp_NoCtrlAltDel));
end;

procedure TncProtege98._NoTaskbar(No: Boolean);
var H : HWND;
begin
{  Exit;   //// *********
  
  H := FindWindow('Shell_TrayWnd', nil);
  if No then 
    ShowWindow(H, SW_HIDE)
  else  
    ShowWindow(H, SW_SHOW);}
end;

procedure TncProtege98._NoTaskLinks(No: Boolean);
begin
end;

procedure TncProtege98._NoTaskTray(No: Boolean);
var H1, H, DesktopH : HWND;
begin
  Exit;
  
  H1 := FindWindow('Shell_TrayWnd', nil);
  H := FindWindowEx(H1, 0, 'TrayNotifyWnd', nil);
  DesktopH := GetDesktopHWND;
  if H=0 then 
    H := FindWindowEx(DesktopH, 0, 'TrayNotifyWnd', nil);
  if No then begin
    ShowWindow(H, SW_HIDE);
    SetParent(H, DesktopH);
  end else begin
    ShowWindow(H, SW_SHOW);
    SetParent(H, H1);
  end;  
end;

procedure TncProtege98._NoToolbars(No: Boolean);
const BoolStr : Array[Boolean] of String = ('False', 'True');
begin
  inherited;
  DebugMsg('TncProtege98._NoToolbars - No = ' + BoolStr[No]);
  RegWrite(Reg_Explorer, 'NoToolbarsOnTaskbar', No);
end;

procedure TncProtege98.SetNoStartMenu(const Value: Boolean);
begin
  inherited;
  AplicaProtStartMenu;
end;

procedure TncProtege98.SetStartMenu(const Value: TPopupMenu);
begin
  if Value<>FStartMenu then begin
    FStartMenu := Value;
    AplicaProtStartMenu;
  end;  
end;

function TncProtege98.GetStartMenu: TPopupMenu;
begin
  Result := FStartMenu;
end;

class procedure TncProtege98.NexCafe_Installed(aSim: Boolean);
var R: TRegistry;
begin
  R := TRegistry.Create;
  try
    R.Access := KEY_ALL_ACCESS;
    R.RootKey := HKEY_CURRENT_USER;
    R.OpenKey('\Software\NexCafe', True);
    if aSim then 
      R.WriteInteger('Installed', 20101) else
      R.WriteInteger('Installed', 0);
    R.CloseKey;  
  finally
    R.Free;
  end;
end;

procedure TncProtege98.AplicaNonEnum(aBloquear: Boolean);
var 
  I : Integer;
  B : Boolean;
begin
  for I := 0 to slNonEnum.Count - 1 do  begin
    B := aBloquear and (slNonEnum.ValueFromIndex[I]='0');
    RegWrite(Reg_NonEnum, slNonEnum.Names[I], B);
    if not B then 
      RegDeleteKey(Reg_ExpClsid+'\'+slNonEnum.Names[I]+'\ShellFolder');
  end;
end;

constructor TncProtege98.Create(AOwner: TComponent);
begin
  FRegistry := nil;
  FTaskbarH := FindWindow('Shell_TrayWnd', nil);
  FStartBtnH := FindWindowEx(FTaskbarH, 0, 'Button', nil);

  inherited;
  FTimerDskTop := TTimer.Create(nil);
  FTimerDskTop.Interval := 50;
  FStartMenu := nil;
{  FButton := TxpButton.Create(nil);
  FButton.Caption := 'Iniciar';
  FButton.Width := 61;
  FButton.Height := 22;
  FButton.Left := 0;
  FButton.OnClick := ClicouStartMenu;
  FButton.Font.Style := [fsBold];}
end;

destructor TncProtege98.Destroy;
begin
  inherited;
  FTimerDskTop.Free;
  TThreadAlterouPolicies.Create(False);
//  FreeAndNil(FButton);
end;

procedure TncProtege98.AtivaProtecao;
var MsgRes: Cardinal;
begin
  FRegistry := TRegistry.Create;
  try
    FRegistry.RootKey := HKEY_CURRENT_USER;
    RegDelete('\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers', 
              'C:\nexcafe\ncguard.exe');
    inherited;
    AplicaProtStartMenu;

    SendMessageTimeout(HWND_BROADCAST, WM_WININICHANGE, 0, LParam(PChar('Policy')),
                       SMTO_ABORTIFHUNG, 200, MsgRes);
    
    PostMessage(HWND_BROADCAST, WM_WININICHANGE, 0, LParam(PChar(PolicyStr)));

    TThreadAlterouPolicies.Create(False);
  finally
    FreeAndNil(FRegistry);
  end;
end;

procedure TncProtege98.DesativaProtecao;
begin
  FRegistry := TRegistry.Create;
  FRegistry.RootKey := HKEY_CURRENT_USER;
  try
    inherited;
    DoHideDrives('');
    AplicaProtStartMenu;
    TThreadAlterouPolicies.Create(False);
  finally
    FreeAndNil(FRegistry);
  end;
end;

procedure TncProtege98.AplicaProtStartMenu;
begin
  HideStartMenu := NoStartMenu;
  RegWrite(Reg_Explorer, 'NoStartMenuMorePrograms', Ativo and NoStartMenu);
  RegWrite(Reg_Explorer, 'NoStartMenuPinnedList', Ativo and NoStartMenu);
  RegWrite(Reg_Explorer, 'NoStartMenuMyMusic', Ativo and NoStartMenu);
  RegWrite(Reg_Explorer, 'NoStartMenuNetworkPlaces', Ativo and NoStartMenu);
  RegWrite(Reg_Explorer, 'NoRecentDocsHistory', Ativo);
  RegWrite(Reg_ExpAdv, 'Start_ShowMyDocs', (not Ativo) or ((not NoStartMenu) and (not gConfig.BloqMeusDocumentos)));
  RegWrite(Reg_ExpAdv, 'Start_ShowDownloads', (not Ativo) or ((not NoStartMenu) and (not gConfig.BloqMeusDocumentos)));
  RegWrite(Reg_ExpAdv, 'Start_ShowUser', (not Ativo));
  RegWrite(Reg_ExpAdv, 'Start_ShowRun', (not Ativo));
  RegWrite(Reg_ExpAdv, 'Start_NotifyNewApps', (not Ativo));
  RegWrite(Reg_ExpAdv, 'Start_ShowRecentDocs', (not Ativo));
  RegWrite(Reg_ExpAdv, 'Start_ShowSetProgramAccessAndDefaults', (not Ativo));
  RegWrite(Reg_ExpAdv, 'StartMenuAdminTools', (not Ativo));
  RegWrite(Reg_ExpAdv, 'Start_TrackProgs', (not Ativo));
  RegWrite(Reg_ExpAdv, 'Start_TrackDocs', (not Ativo));
  RegWrite(Reg_ExpAdv, 'Start_SearchPrograms', (not Ativo));
  

  if not Ativo then
    RegWriteDW(Reg_ExpAdv, 'Start_SearchFiles', 2) else
    RegWriteDW(Reg_ExpAdv, 'Start_SearchFiles', 0);
    
  

  RegWrite(Reg_ExpHide1, '{031E4825-7B94-4DC3-B131-E946B44C8DD5}', True);
  RegWrite(Reg_ExpHide2, '{031E4825-7B94-4DC3-B131-E946B44C8DD5}', True);
  
  RegWrite(Reg_ExpHide1, '{B4FB3F98-C1EA-428d-A78A-D1F5659CBA93}', True);
  RegWrite(Reg_ExpHide2, '{B4FB3F98-C1EA-428d-A78A-D1F5659CBA93}', True);
  
  
  RegWrite(Reg_Explorer, 'StartMenuLogoff', Ativo);
  RegWrite(Reg_Explorer, 'ForceStartMenuLogoff', not Ativo);

  if Ativo then
    RegWriteDW(Reg_ExpAdv, 'Start_PowerButtonAction', $FFFF) else
    RegWriteDW(Reg_ExpAdv, 'Start_PowerButtonAction', 2);
    
  RegWrite(Reg_ExpAdv, 'Start_NotifyNewApps', (not Ativo));
  RegWrite(Reg_ExpAdv, 'Start_ShowMyMusic', (not Ativo) or ((not NoStartMenu) and (not gConfig.BloqMeusDocumentos)));
  RegWrite(Reg_ExpAdv, 'Start_ShowMyPics', (not Ativo) or ((not NoStartMenu) and (not gConfig.BloqMeusDocumentos)));
  RegWrite(Reg_ExpAdv, 'Start_ShowMyGames', (not Ativo) or ((not NoStartMenu) and (not gConfig.BloqMeusDocumentos)));
  RegWrite(Reg_ExpAdv, 'Start_ShowMyComputer', (not Ativo) or ((not NoStartMenu) and (not gConfig.BloqMeuComputador)));
end;


procedure TncProtege98.ApplyClassicMenu(aClassic: Boolean);
begin
  inherited;
  RegWrite(Reg_Explorer, 'NoSimpleStartMenu', aClassic);
  RegReadBin(HKEY_CURRENT_USER, Reg_ShellState, 'ShellState');
  if aClassic then begin
    if FBin[33]=2 then begin
      FBin[33] := 0;
      RegWriteBin(HKEY_CURRENT_USER, Reg_ShellState, 'ShellState');
    end;
  end else begin
    if FBin[33]=0 then begin
      FBin[33] := 2;
      RegWriteBin(HKEY_CURRENT_USER, Reg_ShellState, 'ShellState');
    end;
  end;
  
end;

procedure TncProtege98.ClicouStartMenu(Sender: TObject);
var P : TPoint;
begin
  if StartMenu<>nil then begin
{    P.x := FButton.Left;
    P.y := FButton.top;
    P := FButton.ClientToScreen(P);}
    StartMenu.Popup(0, P.Y - 1);
  end;
end;

procedure TncProtege98.OnDesktopTimer(Sender: TObject);
begin
  ShowWindow(FDesktopLV, SW_HIDE);
end;

procedure TncProtege98.ForceIEStartPage(S: String);
var Criou: Boolean;
begin
  if FRegistry = nil then begin
    FRegistry := TRegistry.Create;
    Criou := True;
  end else
    Criou := False;
  try
    RegWriteString(Reg_IEMain, 'Start Page', S);
  finally
    if Criou then FreeAndNil(FRegistry);
  end;    
end;

procedure TncProtege98._NoRunCmd(No: Boolean);
begin
  RegWrite(Reg_Explorer, 'NoRun', No);
end;

procedure TncProtege98.AutoStart(Ativar: Boolean);
var Criou: Boolean;
begin
  if FRegistry = nil then begin
    FRegistry := TRegistry.Create;
    Criou := True;
  end else
    Criou := False;

  try
    RegDelete(Reg_AutoStart, 'cmguard');
    RegDelete(Reg_AutoStart, 'ncguard');
  
    if Ativar then
      RegWriteString(Reg_AutoStart, 'nexguard', '"'+ParamStr(0)+'"')
    else
      RegDelete(Reg_AutoStart, 'nexguard');
  finally
    if Criou then FreeAndNil(FRegistry);
  end;      
end;

procedure TncProtege98.DoHideDrives(ADrives: String);
var 
  Valor: Cardinal;
  C : Char;
begin
  Valor := 0;
  for C := 'A' to 'Z' do
    if Pos(C, ADrives)>0 then
       Valor := Valor + Drives_Mask[C];

  RegWriteDW(Reg_Explorer, 'NoDrives', Valor);            
  RegWriteDW(Reg_Explorer, 'NoViewOnDrive', Valor);
end;

procedure TncProtege98.RegDelete(Key, Nome: String);
begin
  RegDeleteEx(HKEY_CURRENT_USER, Key, Nome);
  RegDeleteEx(HKEY_LOCAL_MACHINE, Key, Nome);
end;

procedure TncProtege98.RegWrite(Key, Nome: String; Valor: Boolean);
begin
  RegWriteEx(HKEY_CURRENT_USER, Key, Nome, Valor);
  RegWriteEx(HKEY_LOCAL_MACHINE, Key, Nome, Valor);
end;

procedure TncProtege98.RegWriteDW(Key, Nome: String; Valor: DWORD);
begin
  RegWriteDWEx(HKEY_CURRENT_USER, Key, Nome, Valor);
  RegWriteDWEx(HKEY_LOCAL_MACHINE, Key, Nome, Valor);
end;

procedure TncProtege98.RegWriteString(Key, Nome, Valor: String);
begin
  RegWriteStringEx(HKEY_CURRENT_USER, Key, Nome, Valor);
  RegWriteStringEx(HKEY_LOCAL_MACHINE, Key, Nome, Valor);
end;

procedure TncProtege98._NoNetwork(No: Boolean);
begin
  RegWrite(Reg_Explorer, 'NoNetHood', No);
  RegWrite(Reg_Explorer, 'NoNetConnectDisconnect', No);
  RegWrite(Reg_Explorer, 'NoWorkgroupContentes', No);
  RegWrite(Reg_Explorer, 'NoComputersNearMe', No);
  RegWrite(Reg_Explorer, 'NoEntireNetwork', No);
  RegWrite(Reg_Explorer, 'NoStartMenuNetworkPlaces', No);
  RegWrite(Reg_Explorer, 'NoNetworkConnections', No);
  RegWrite(Reg_ExpAdv, 'Start_ShowNetPlaces', not No);
  RegWrite(Reg_System, 'NoDispCPL', No);
  if No then
    RegWriteDWEx(HKEY_CLASSES_ROOT, Reg_ShellFolder, 'Attributes', 20180000) else
    RegDeleteEx(HKEY_CLASSES_ROOT, Reg_ShellFolder, 'Attributes'); 

   
  RegWrite(Reg_ExpHide1, '{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}', No);
  RegWrite(Reg_ExpHide2, '{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}', True);
end;

procedure TncProtege98.BroadcastChanges;
var
  Criou : Boolean;
begin
  Criou := CriaReg;
  try
    try
      TThreadAlterouPolicies.Create(False);
    except
    end;                     
  finally
    if Criou then 
      DestroyReg;
  end;
end;

function TncProtege98.CriaReg: Boolean;
begin
  if FRegistry=nil then begin
    FRegistry := TRegistry.Create;
    FRegistry.RootKey := HKEY_CURRENT_USER;
    Result := True;
  end else
    Result := False;  
end;

procedure TncProtege98.DestroyReg;
begin
  FreeAndNil(FRegistry);
end;

procedure TncProtege98.PermitirDownload(aPermitir, aPermitirExe: Boolean); 
var Criou: Boolean; 
begin
  Criou := CriaReg;
  try
    if aPermitir then
      RegWriteDW(Reg_IEZone3, '1803', 0)
    else
      RegWriteDW(Reg_IEZone3, '1803', 3);

    RegWrite(Reg_IECP, 'SecurityTab', not aPermitir);

    if not aPermitirExe then begin
      RegWriteDW(Reg_IEZone3, '1806', 3);
      RegWriteDW(Reg_IEZone3, '1804', 3);
    end else begin
      RegWriteDW(Reg_IEZone3, '1806', 1);
      RegWriteDW(Reg_IEZone3, '1804', 1);
    end;

    BroadCastChanges;
  finally
    if Criou then 
      DestroyReg;
  end;    
end;

{ TThreadAlterouPolicies }

procedure TThreadAlterouPolicies.Execute;
var 
  MsgRes: Cardinal;
  I : Integer;
begin
  Try Free; except end;
  try
    SendMessageTimeout(HWND_BROADCAST, WM_WININICHANGE, 0, LParam(PChar('Policy')),
                       SMTO_ABORTIFHUNG, 200, MsgRes);
    SendMessageTimeout(HWND_BROADCAST, WM_WININICHANGE, 1, LParam(PChar('Policy')),
                       SMTO_ABORTIFHUNG, 200, MsgRes);
    SendMessageTimeout(HWND_BROADCAST, WM_WININICHANGE, 0, 0,
                       SMTO_ABORTIFHUNG, 200, MsgRes);
  except
  end;
end;

procedure TncProtege98._NoRightClick(No: Boolean);
begin
  inherited;
  RegWrite(Reg_Explorer, 'NoViewContextMenu', No); 
end;

end.

24,00,00,00,38,28,00,00,00,00,00,00,00,00,00,00,00,00,00,00, 01,00,00,00,12,00,00,00,00,00,00,00,00,00,00,00
