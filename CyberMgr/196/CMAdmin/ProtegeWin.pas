unit ProtegeWin;

{.$define Winlock}

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Menus,
  Dialogs,
  {$ifdef Winlock}
  dWinlock,
  {$endif}
  AMWinEnv,
  uPFrmBotaoIniciar;

type

  TProtegeWin = class(TComponent)
  private
    FNoDesktop : Boolean;
    FNoTaskBar : Boolean;
    FNoWinkeys : Boolean;
    FNoStartMenu : Boolean;
    FReplaceStartMenu: Boolean;
    FLock95     : TAMWinEnv;
    {$ifdef Winlock}
    FLockNT     : TdWinlock;
    {$endif}
    FMenu       : TPopupMenu;
    FFrmIniciar : TFrmIniciar;
    procedure SetReplaceStartMenu(const Value: Boolean);
    procedure SetNoDesktop(const Value: Boolean);
    procedure SetNoStartMenu(const Value: Boolean);
    procedure SetNoTaskBar(const Value: Boolean);
    procedure SetNoWinkeys(const Value: Boolean);
    procedure SetMenu(const Value: TPopupMenu);
  protected
    
    { Protected declarations }
  public
    constructor Create(AComponent: TComponent); override;
    destructor Destroy; override;
    { Public declarations }
  published
    { Published declarations }

    property NoDesktop: Boolean
      read FNoDesktop write SetNoDesktop;

    property NoTaskBar: Boolean
      read FNoTaskBar write SetNoTaskBar;

    property NoWinkeys: Boolean
      read FNoWinkeys write SetNoWinkeys;

    property NoStartMenu: Boolean
      read FNoStartMenu write SetNoStartMenu;

    property ReplaceStartMenu: Boolean
      read FReplaceStartMenu write SetReplaceStartMenu;

    property PopupMenu: TPopupMenu
      read FMenu write SetMenu;  
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('System', [TProtegeWin]);
end;

{ TProtegeWin }

constructor TProtegeWin.Create(AComponent: TComponent);
begin
  inherited;
  FFrmIniciar := nil;
  FNoDesktop := False;
  FNoTaskBar := False;
  FNoWinkeys := False;
  FNoStartMenu := False;
  FReplaceStartMenu := False;
  FReplaceStartMenu := False;
  {$ifdef Winlock}
  FLockNT := nil;
  {$endif}
  FLock95 := nil;
  FMenu := nil;
  {$ifdef Winlock}
  if Win32Platform=VER_PLATFORM_WIN32_NT then
    FLockNT := TdWinlock.Create(Self)
  else
  {$endif}
    FLock95 := TAMWinEnv.Create(Self);  
end;

destructor TProtegeWin.Destroy;
begin
  if FFrmIniciar <> nil then FreeAndNil(FFrmIniciar);
  {$ifdef Winlock}
  if FLockNT <> nil then FreeAndNil(FLockNT);
  {$endif}
  if FLock95 <> nil then FreeAndNil(FLock95);
  inherited;
end;

procedure TProtegeWin.SetReplaceStartMenu(const Value: Boolean);
begin
  if Value = FReplaceStartMenu then Exit;
  FReplaceStartMenu := Value;
  if Value then begin
    NoWinkeys := True;
    if FLock95 <> nil then begin
      NoStartMenu := True;
      Application.CreateForm(TFrmIniciar, FFrmIniciar);
      FFrmIniciar.PopupMenu := FMenu;
      FFrmIniciar.ShowModal;
    end {$ifdef Winlock} else begin
      FLockNT.ReplaceStartmenu := True;
      FLockNT.StartMenu := FMenu;
    end {$endif} ;  
  end else begin
    if FLock95 <> nil then 
      FreeAndNil(FFrmIniciar)
    {$ifdef Winlock}  
    else 
      FLockNT.ReplaceStartmenu := False {$endif} ;
  end;  
end;

procedure TProtegeWin.SetNoDesktop(const Value: Boolean);
begin
  if Value = FNoDesktop then Exit;
  FNoDesktop := Value;
  if Value then begin
    if FLock95 <> nil then 
      FLock95.HideOption := FLock95.HideOption + [hoDesktopIcons]
    else
    {$ifdef Winlock}
      FLockNT.noDesktop := True {$endif} ;
  end else begin
    if FLock95 <> nil then 
      FLock95.HideOption := FLock95.HideOption - [hoDesktopIcons]
    {$ifdef Winlock}
    else
      FLockNT.noDesktop := False {$endif} ;
  end;
end;

procedure TProtegeWin.SetNoStartMenu(const Value: Boolean);
begin
  if Value = FNoStartMenu then Exit;
  FNoStartMenu := Value;
  if Value then begin
    if FLock95 <> nil then 
      FLock95.HideOption := FLock95.HideOption + [hoStartButton]
    {$ifdef Winlock}  
    else
      FLockNT.noStartbutton := True {$endif} ;  
  end else begin
    if FLock95 <> nil then 
      FLock95.HideOption := FLock95.HideOption - [hoStartButton]
    {$ifdef Winlock}  
    else
      FLockNT.noStartbutton := False {$endif};
  end;
end;

procedure TProtegeWin.SetNoTaskBar(const Value: Boolean);
begin
  if Value = FNoTaskBar then Exit;
  FNoTaskBar := Value;

  if Value then begin
    if FLock95 <> nil then 
      FLock95.HideOption := FLock95.HideOption + [hoTrayBar]
    {$ifdef Winlock}  
    else
      FLockNT.noTaskbar := True {$endif};
  end else begin
    if FLock95 <> nil then 
      FLock95.HideOption := FLock95.HideOption - [hoTrayBar]
    {$ifdef Winlock}  
    else
      FLockNT.noTaskBar := False {$endif};
  end;
  
end;

procedure TProtegeWin.SetNoWinkeys(const Value: Boolean);
begin
  if Value = FNoWinkeys then Exit;
  FNoWinkeys := Value;

  if Value then begin
    if FLock95 <> nil then 
      FLock95.DisableSysKey := True
    {$ifdef Winlock}  
    else begin
      FLockNT.noCtrlAltDel := True;
      FLockNT.noAltTab := True;
      FLockNT.noAltEsc := True;
      FLockNT.noAltF4 := True;
      FLockNT.noCtrlEsc := True;
      FLockNT.noWinkeys := True;
    end {$endif};  
  end else begin
    if FLock95 <> nil then 
      FLock95.DisableSysKey := False
    {$ifdef Winlock}  
    else begin
      FLockNT.noCtrlAltDel := True;
      FLockNT.noAltTab := True;
      FLockNT.noAltEsc := True;
      FLockNT.noAltF4 := True;
      FLockNT.noCtrlEsc := True;
      FLockNT.noWinkeys := True;
      FLockNT.noTaskBar := False;
    end {$endif} ;  
  end;
  
end;

procedure TProtegeWin.SetMenu(const Value: TPopupMenu);
begin
  FMenu := Value;
  if FFrmIniciar<>nil then FFrmIniciar.PopupMenu := FMenu;
end;

end.
 
