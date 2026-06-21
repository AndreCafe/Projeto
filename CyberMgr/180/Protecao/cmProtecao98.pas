unit cmProtecao98;

interface

uses ExtCtrls, SysUtils, Forms, Dialogs, Messages, Graphics, Classes, Windows, Menus, cmProtecao, {xpButton,} Registry;

const
  PolicyStr : PChar = 'Policy';

type

   TCMProtege98 = class (TCMProtegeWindows)
   private
     FStartMenu   : TPopupMenu;
//     FButton      : TxpButton;
     FRegistry    : TRegistry;
     FLastOpen    : String;
     FDesktopLV   : HWND;
     FTimerDskTop : TTimer;
   protected
     procedure OnDesktopTimer(Sender: TObject);
     procedure _NoDesktop(No: Boolean); override;
     procedure _NoCtrlAltDel(No: Boolean); override;

     procedure _NoAltTab(No: Boolean); override;
     procedure _NoAltEsc(No: Boolean); override;
     procedure _NoWinkeys(No: Boolean); override;
     procedure _NoCtrlEsc(No: Boolean); override;
     procedure _NoTaskbar(No: Boolean); override;
     procedure _NoTaskLinks(No: Boolean); override;
     procedure _NoTaskTray(No: Boolean); override;
     procedure _NoCtrlPanel(No: Boolean); override;
     procedure _NoDownload(No: Boolean); override;
     procedure _NoRunCmd(No: Boolean); override;


     procedure SetStartMenu(const Value: TPopupMenu); override;
     function GetStartMenu: TPopupMenu; override;
     procedure SetNoStartMenu(const Value: Boolean); override;


     procedure AplicaProtStartMenu;
     procedure ClicouStartMenu(Sender: TObject);
     procedure RegOpen(S: String);
     procedure RegClose;
     procedure RegWrite(Key, Nome: String; Valor: Boolean);
     procedure RegWriteString(Key, Nome: String; Valor: String);
     procedure RegWriteDW(Key, Nome: String; Valor: DWORD);
     procedure RegDelete(Key, Nome: String);
   public
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;

     procedure AtivaProtecao; override;
     procedure DesativaProtecao; override;
     procedure ForceIEStartPage(S: String); override;
     procedure AutoStart(Ativar: Boolean); override;
   end;  

const
   Reg_Explorer  = '\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer';
   Reg_System    = '\Software\Microsoft\Windows\CurrentVersion\Policies\System';
   Reg_IEZone3   = '\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3';
   Reg_IECP      = '\Software\Policies\Microsoft\Internet Explorer\Control Panel';
   Reg_IEMain    = '\Software\Microsoft\Internet Explorer\Main';
   Reg_AutoStart = '\Software\Microsoft\Windows\CurrentVersion\Run';

   BoolInt : Array[Boolean] of Integer = (0, 1);

var
  DesktopListViewHandle : HWND;
  FTaskBarH    : HWND;
  FStartBtnH   : HWND;


implementation  

procedure TCMProtege98.RegClose;
begin
  FLastOpen := '';
  FRegistry.CloseKey;
end;  
 

procedure TCMProtege98.RegOpen(S: String);
begin
  if FLastOpen<>S then begin
    RegClose;
    FRegistry.RootKey := HKEY_CURRENT_USER;
    FRegistry.Access := KEY_ALL_ACCESS;
    
    FLastOpen := S;
    FRegistry.OpenKey('\Software\Microsoft\Windows\CurrentVersion\'+S, True);
  end;  
end;

procedure TCMProtege98.RegWrite(Key, Nome: String; Valor: Boolean);
begin
  if Valor then
    RegWriteDW(Key, Nome, 1)
  else
    RegWriteDW(Key, Nome, 0)
end;

procedure TCMProtege98.RegWriteDW(Key, Nome: String; Valor: DWORD);
begin
  try
    FRegistry.RootKey := HKEY_CURRENT_USER;
    FRegistry.Access := KEY_ALL_ACCESS;
    FRegistry.OpenKey(Key+'\', True);
    FRegistry.WriteInteger(Nome, Valor);
    FRegistry.CloseKey;

    try
      FRegistry.RootKey := HKEY_LOCAL_MACHINE;
      FRegistry.Access := KEY_ALL_ACCESS;
      FRegistry.OpenKey(Key+'\', True);
      FRegistry.WriteInteger(Nome, Valor);
      FRegistry.CloseKey;
    except
    end;  

  except
  end;
end;

procedure TCMProtege98.RegDelete(Key, Nome: String);
begin
  try
    FRegistry.RootKey := HKEY_CURRENT_USER;
    FRegistry.Access := KEY_ALL_ACCESS;
    if FRegistry.OpenKey(Key+'\', True) then begin
      FRegistry.DeleteValue(Nome);
      FRegistry.CloseKey;
    end;
  except
  end;

  try
    FRegistry.RootKey := HKEY_LOCAL_MACHINE;
    FRegistry.Access := KEY_ALL_ACCESS;
    if FRegistry.OpenKey(Key+'\', True) then begin
      FRegistry.DeleteValue(Nome);
      FRegistry.CloseKey;
    end;  
  except
  end;
end;

procedure TCMProtege98.RegWriteString(Key, Nome: String; Valor: String);
begin
  try
    FRegistry.RootKey := HKEY_CURRENT_USER;
    FRegistry.Access := KEY_ALL_ACCESS;
    FRegistry.OpenKey(Key+'\', True);
    FRegistry.WriteString(Nome, Valor);
    FRegistry.CloseKey;

    try
      FRegistry.RootKey := HKEY_LOCAL_MACHINE;
      FRegistry.Access := KEY_ALL_ACCESS;
      FRegistry.OpenKey(Key+'\', True);
      FRegistry.WriteString(Nome, Valor);
      FRegistry.CloseKey;
    except
    end;

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
     Result := FindWindow('ProgMan', nil);
     DesktopListViewHandle:=0;
     enumchildwindows(Result,@GetDeskHandle,0);
     Result:=DesktopListViewHandle;
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
  H := FindWindow('Shell_TrayWnd', nil);
  if (H<>FTaskbarH) or (FStartBtnH=0) then begin
    FTaskbarH := H;
    FStartBtnH := FindWindowEx(FTaskbarH, 0, 'Button', nil);
  end;

  if bVisible then begin
    Windows.SetParent(FStartBtnH, FTaskbarH);
    ShowWindow(FStartBtnH, 1);
  end else begin
    Windows.SetParent(FStartBtnH, Application.Mainform.Handle);
    ShowWindow(FStartBtnH, 0);
  end;

    
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

procedure TCMProtege98._NoDesktop(No: Boolean);
var H : HWND;
begin
  H := GetDesktopListViewHandle;
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
  RegWrite(Reg_Explorer, 'NoBandCustomize', No);
  RegWrite(Reg_Explorer, 'NoToolbarCustomize', No);
  RegWrite(Reg_Explorer, 'NoViewContextMenu', No); 
  RegWrite(Reg_Explorer, 'ClassicShell', No);  
  RegWrite(Reg_Explorer, 'NoToolbarsOnTaskbar', No);  
    
{  RegWrite(Reg_Explorer, 'NoDesktop', No); }
end;

procedure TCMProtege98._NoCtrlAltDel(No: Boolean);
var B: Boolean;
begin
  SystemParametersInfo( SPI_SCREENSAVERRUNNING, Word(No), @b, 0);
  RegWrite(Reg_System, 'DisableLockWorkstation', No);
  RegWrite(Reg_System, 'DisableTaskMgr', No);
  RegWrite(Reg_System, 'DisableChangePassword', No);
  RegWrite(Reg_Explorer, 'NoClose', No);
  RegWrite(Reg_Explorer, 'NoLogoff', No);
end;

procedure TCMProtege98._NoCtrlPanel(No: Boolean);
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    RegWrite(Reg_Explorer, 'NoControlPanel', No)
  else
    RegWrite(Reg_Explorer, 'NoSetFolders', No);


  RegWrite(Reg_Explorer, 'NoSetTaskbar', No);
  RegWrite(Reg_Explorer, 'NoFileUrl', No);
  RegWrite(Reg_System, 'NoDispCPL', No);
end;

procedure TCMProtege98._NoDownload(No: Boolean);
begin
  if No then
    RegWriteDW(Reg_IEZone3, '1803', 3)
  else
    RegWriteDW(Reg_IEZone3, '1803', 0);

  RegWrite(Reg_IECP, 'SecurityTab', No);
end;

procedure TCMProtege98._NoAltTab(No: Boolean);
begin
//  _NoCtrlAltDel(No or GetOpcaoBool(cmp_NoCtrlAltDel));
end;

procedure TCMProtege98._NoAltEsc(No: Boolean);
begin
//  _NoCtrlAltDel(No or GetOpcaoBool(cmp_NoCtrlAltDel));
end;

procedure TCMProtege98._NoWinkeys(No: Boolean);
begin
  RegWrite(Reg_Explorer, 'NoWinKeys', No);
end;

procedure TCMProtege98._NoCtrlEsc(No: Boolean);
begin
//  _NoCtrlAltDel(No or GetOpcaoBool(cmp_NoCtrlAltDel));
end;

procedure TCMProtege98._NoTaskbar(No: Boolean);
var H : HWND;
begin
  H := FindWindow('Shell_TrayWnd', nil);
  if No then 
    ShowWindow(H, SW_HIDE)
  else  
    ShowWindow(H, SW_SHOW);
end;

procedure TCMProtege98._NoTaskLinks(No: Boolean);
begin
end;

procedure TCMProtege98._NoTaskTray(No: Boolean);
var H : HWND;
begin
  H := FindWindow('Shell_TrayWnd', nil);
  H := FindWindowEx(H, 0, 'TrayNotifyWnd', nil);
  if No then 
    ShowWindow(H, SW_HIDE)
  else  
    ShowWindow(H, SW_SHOW);
end;

procedure TCMProtege98.SetNoStartMenu(const Value: Boolean);
begin
  inherited;
  AplicaProtStartMenu;
end;

procedure TCMProtege98.SetStartMenu(const Value: TPopupMenu);
begin
  if Value<>FStartMenu then begin
    FStartMenu := Value;
    AplicaProtStartMenu;
  end;  
end;

function TCMProtege98.GetStartMenu: TPopupMenu;
begin
  Result := FStartMenu;
end;

constructor TCMProtege98.Create(AOwner: TComponent);
begin
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
  FRegistry := nil;
end;

destructor TCMProtege98.Destroy;
begin
  inherited;
  FTimerDskTop.Free;
//  FreeAndNil(FButton);
end;

procedure TCMProtege98.AtivaProtecao;
var
  MsgRes: Cardinal;
  I : Integer;
begin
  FRegistry := TRegistry.Create;
  FRegistry.RootKey := HKEY_CURRENT_USER;
  try
    inherited;
    AplicaProtStartMenu;
{    for I := 1 to 10 do begin
      PostMessage(HWND_BROADCAST, WM_WININICHANGE, 0, LParam(PolicyStr));
      PostMessage(HWND_BROADCAST, WM_WININICHANGE, 0, 0);
    end;}

   SendMessageTimeout(HWND_BROADCAST, WM_WININICHANGE, 0, LParam(PChar('Policy')),
                      SMTO_ABORTIFHUNG, 100, MsgRes);
   SendMessageTimeout(HWND_BROADCAST, WM_WININICHANGE, 0, 0,
                      SMTO_ABORTIFHUNG, 100, MsgRes);
  finally
    FreeAndNil(FRegistry);
  end;
end;

procedure TCMProtege98.DesativaProtecao;
var
  MsgRes: Cardinal;
  I : Integer;
begin
  FRegistry := TRegistry.Create;
  FRegistry.RootKey := HKEY_CURRENT_USER;
  try
    inherited;
    AplicaProtStartMenu;
{    for I := 1 to 10 do begin
      PostMessage(HWND_BROADCAST, WM_WININICHANGE, 0, LParam(PolicyStr));
      PostMessage(HWND_BROADCAST, WM_WININICHANGE, 0, 0);
    end;}

    SendMessageTimeout(HWND_BROADCAST, WM_WININICHANGE, 0, LParam(PChar('Policy')),
                       SMTO_ABORTIFHUNG, 100, MsgRes);

    SendMessageTimeout(HWND_BROADCAST, WM_WININICHANGE, 0, 0,
                       SMTO_ABORTIFHUNG, 100, MsgRes);
  finally
    FreeAndNil(FRegistry);
  end;
end;

procedure TCMProtege98.AplicaProtStartMenu;
begin
  if Ativo and (StartMenu<>nil) and (not NoStartMenu) then
  begin
    ShowStartButton(False);
{    FButton.ParentWindow := FindWindow('Shell_TrayWnd', nil);
    FButton.Left := 0;
    FButton.Visible := True;}
  end else begin
    ShowStartButton(not (Ativo and NoStartMenu));
{    FButton.ParentWindow := 0;
    FButton.Visible := False;}
  end;
end;

procedure TCMProtege98.ClicouStartMenu(Sender: TObject);
var P : TPoint;
begin
  if StartMenu<>nil then begin
{    P.x := FButton.Left;
    P.y := FButton.top;
    P := FButton.ClientToScreen(P);}
    StartMenu.Popup(0, P.Y - 1);
  end;
end;

procedure TCMProtege98.OnDesktopTimer(Sender: TObject);
begin
  ShowWindow(FDesktopLV, SW_HIDE);
end;

procedure TCMProtege98.ForceIEStartPage(S: String);
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

procedure TCMProtege98._NoRunCmd(No: Boolean);
begin
  RegWrite(Reg_Explorer, 'NoRun', No);
end;

procedure TCMProtege98.AutoStart(Ativar: Boolean);
var Criou: Boolean;
begin
  if FRegistry = nil then begin
    FRegistry := TRegistry.Create;
    Criou := True;
  end else
    Criou := False;

  try
    if Ativar then
      RegWriteString(Reg_AutoStart, 'cmguard', '"'+ParamStr(0)+'"')
    else
      RegDelete(Reg_AutoStart, 'cmguard');
  finally
    if Criou then FreeAndNil(FRegistry);
  end;      
end;

end.
