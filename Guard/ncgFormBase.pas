unit ncgFormBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TFormBaseGuard = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    FDontForceForeground : Boolean;
    { Private declarations }
    procedure OnMostrar(Sender: TObject);
    procedure OnEsconder(Sender: TObject);
  protected
  public
    { Public declarations }
    procedure OnTimerTop; virtual;  
    procedure Esconder; virtual;
    procedure Mostrar; 

    property DontForceForeground: Boolean
      read FDontForceForeground write FDontForceForeground;
  end;

var
  FormBaseGuard: TFormBaseGuard;

implementation

uses ncgFrmPri, ncDebug;

{$R *.dfm}

{ TFormBaseGuard }

function ForceForegroundWindow(hwnd: THandle; aFormName: String): boolean;
const
  SPI_GETFOREGROUNDLOCKTIMEOUT = $2000;
  SPI_SETFOREGROUNDLOCKTIMEOUT = $2001;
var
  ForegroundThreadID: DWORD;
  ThisThreadID : DWORD;
  timeout : DWORD;
begin
  DebugMsg('ForceForeGroundWindow - aFormName: '+aFormName);
  if IsIconic(hwnd) then ShowWindow(hwnd, SW_RESTORE);
  if GetForegroundWindow = hwnd then 
    Result := true
  else begin

  // Windows 98/2000 doesn't want to foreground a window when some other
  // window has keyboard focus
  
    if ((Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion > 4)) or
        ((Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and
        ((Win32MajorVersion > 4) or ((Win32MajorVersion = 4) and
        (Win32MinorVersion > 0)))) then
    begin
  
  // Code from Karl E. Peterson, www.mvps.org/vb/sample.htm
  // Converted to Delphi by Ray Lischner
  // Published in The Delphi Magazine 55, page 16
  
      Result := false;
      ForegroundThreadID := GetWindowThreadProcessID(GetForegroundWindow,nil);
      ThisThreadID := GetWindowThreadPRocessId(hwnd,nil);
      if AttachThreadInput(ThisThreadID, ForegroundThreadID, true) then
      begin
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hwnd);
        AttachThreadInput(ThisThreadID, ForegroundThreadID, false);
        Result := (GetForegroundWindow = hwnd);
      end;
      if not Result then begin
  // Code by Daniel P. Stasinski
        SystemParametersInfo(SPI_GETFOREGROUNDLOCKTIMEOUT, 0, @timeout, 0);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(0),  SPIF_SENDCHANGE);
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hWnd);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0,
        TObject(timeout), SPIF_SENDCHANGE);
      end;
    end
    else begin
      BringWindowToTop(hwnd); // IE 5.5 related hack
      SetForegroundWindow(hwnd);
    end;
  
    Result := (GetForegroundWindow = hwnd);
  end;
end; { ForceForegroundWindow }



procedure TFormBaseGuard.Esconder;
begin
  try
    Hide;
  except
    on E: Exception do begin
      DebugMsg('TFormBaseGuard.Esconder - Name: ' + Self.Name + ' - Exception: ' + E.Message);
      with TTimer.Create(Self) do begin
        Interval := 50;
        OnTimer := OnEsconder;
        Enabled := True;
      end;
    end;
  end;
end;

procedure TFormBaseGuard.FormCreate(Sender: TObject);
begin
  FDontForceForeground := False;
end;

procedure TFormBaseGuard.Mostrar;
var H: HWND;
begin
  try
    DebugMsg('TFormBaseGuard.Mostrar - Form ' + Name);

    Show;
        
    ForceForegroundWindow(Handle, 'TFormBaseGuard.Mostrar - ' + Name);
    SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, (SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE));
    
{    H := GetForeGroundWindow;
    ShowWindow(Handle, SW_SHOW);
    if (H <> Handle) and (H <> FindWindow('Shell_TrayWnd', nil)) then begin
      keybd_event(VK_LWIN, Mapvirtualkey(VK_LWIN, 0), 0, 0);
      keybd_event(VK_LWIN, Mapvirtualkey(VK_LWIN, 0), KEYEVENTF_KEYUP, 0);
      keybd_event(VK_CONTROL, Mapvirtualkey(VK_CONTROL, 0), 0, 0);
      keybd_event(VK_ESCAPE, Mapvirtualkey(VK_ESCAPE, 0), 0, 0);
      keybd_event(VK_ESCAPE, Mapvirtualkey(VK_ESCAPE, 0), KEYEVENTF_KEYUP, 0);
      keybd_event(VK_CONTROL, Mapvirtualkey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0);
      SetForegroundWindow(Handle);
    end;     }
    
  except
    on E: Exception do begin
      DebugMsg('TFormBaseGuard.Mostrar - Name: ' + Self.Name + ' - Exception: ' + E.Message);
      with TTimer.Create(Self) do begin
        Interval := 50;
        OnTimer := OnMostrar;
        Enabled := True;
      end;
    end;
  end;
end;

procedure TFormBaseGuard.OnEsconder(Sender: TObject);
begin
  try
    Hide;
  finally
    Sender.Free;
  end;
end;

procedure TFormBaseGuard.OnMostrar(Sender: TObject);
begin
  try
    Show;  
  finally
    Sender.Free;
  end;
end;

procedure TFormBaseGuard.OnTimerTop;
begin

end;

end.

procedure DoCreate;
begin
  try
    inherited
  finally
    Tradução;
  end;
end;
    
  if Assigned(FOnCreate) then
  try
    FOnCreate(Self);
  except
    if not HandleCreateException then
      raise;
  end;
  if fsVisible in FFormState then Visible := True;
end;

