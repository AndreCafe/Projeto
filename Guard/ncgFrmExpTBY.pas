unit ncgFrmExpTBY;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, ncgWebApi,
  Dialogs, ncExpandArea, OleCtrls, SHDocVw_EWB, EwbCore, MSHTML_EWB, EmbeddedWB, Automation,
  ExtCtrls, StdCtrls;

type
  TFrmExpTBY = class(TncFrmExpandArea)
    WB: TEmbeddedWB;
    TimerNav: TTimer;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure WBGetExternal(Sender: TCustomEmbeddedWB;
      var ppDispatch: IDispatch);
    procedure TimerNavTimer(Sender: TObject);
    procedure WBNavigateComplete2(ASender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    procedure WBNavigateError(ASender: TObject; const pDisp: IDispatch; var URL,
      Frame, StatusCode: OleVariant; var Cancel: WordBool);
    procedure WBDownloadComplete(Sender: TObject);
    procedure WBDocumentComplete(ASender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FIDSessao: Integer;
    FLastSSError : Integer;
    FErroNav : Boolean;
    
    { Private declarations }
    function URL: String;
    function ToolbarWidth: Integer;
    procedure SetIDSessao(const Value: Integer);
  protected 
    procedure ExecJS(aJS: String); override;
  public
    procedure Navigate; 
    procedure RetryNav;
    property IDSessao : Integer
      read FIDSessao write SetIDSessao;
    { Public declarations }
  end;

  TncjsFrmTBY = class( TncgWebApi )
  published
    procedure enableExpand(const 
                             triggerTop,
                             triggerLeft,
                             triggerBottom,
                             triggerRight,
                             expandHeight,
                             expandWidth,
                             expandMode,
//                             expandPos,
                             retractJS : OleVariant);
    procedure retract;
  
  end;

  procedure CheckFrmExpTby;

var
  FrmExpTBY: TFrmExpTBY;
  tbyHeight : Integer = 30;

const
   expframe_name = 'y_expandable';  

implementation

uses 
  uVersionInfo,
  unr_chaveseg, 
  ncWBFrameExecScript, 
  ncClassesBase, 
  ncDebug, 
  ncgFrmTop, 
  ncgFrmPri, 
  ncHttp, nexUrls;

{$R *.dfm}

procedure CheckFrmExpTby;
var Criar: Boolean;
begin
  Criar := Assigned(FrmTopB) and (FrmPri.ToolbarType=tbFree);
  if Criar then begin
    if FrmExpTBY=nil then begin
      DebugMsg('CheckFrmExpTby - Create!');
      TFrmExpTBY.Create(FrmTopB);
      FrmExpTBY.Show;
      FrmExpTBY.IDSessao := FrmPri.IDSessao;
    end;
  end else
  if Assigned(FrmExpTBY) then
    FrmExpTBY.Free;
end;

procedure TFrmExpTBY.ExecJS(aJS: String);
begin
  inherited;
  try
    FrameExecScript(WB, aJS, expframe_name);
  except
  end;
end;

procedure TFrmExpTBY.FormCreate(Sender: TObject);
var R : TRect;
begin
  inherited;
  FrmExpTBY := Self;
  FIDSessao := 0;
  FLastSSError := 0;
  FErroNav  := False;
  
  RetractR.Left := 0;
  RetractR.Top  := 0;
  RetractR.Bottom := tbyHeight-1;
  RetractR.Right  := ToolbarWidth-1;
  WB.Height := Screen.Height;
  WB.Width  := Screen.Width;
  Left := 0;
  Height := tbyHeight;
  Width := ToolbarWidth;
  R.Left := ToolbarWidth;
  R.Right := Screen.Width-1;
  R.Top := 0;
  R.Bottom := tbyHeight-1;
  CreateInvPanel(R, False);
end;

procedure TFrmExpTBY.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmExpTBY := nil;
end;

procedure TFrmExpTBY.Navigate;
begin
  try
    FErroNav := False;
    gExpandAreaList.FreeAreaFromForm(Self);
    WB.Navigate(URL);
    DebugMsg('TFrmExpTBY.Navigate: ' + URL);
  except
    RetryNav;
  end;
end;

procedure TFrmExpTBY.RetryNav;
begin
  if IDSessao<>0 then 
    TimerNav.Enabled := True;
end;

procedure TFrmExpTBY.SetIDSessao(const Value: Integer);
begin
  if Value = FIDSessao then Exit;
  FIDSessao := Value;
  DebugMsg('TFrmExpTBY.SetIDSessao: '+IntToStr(Value));
  if FIDSessao>0 then 
    RetryNav;
end;

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

procedure TFrmExpTBY.Timer1Timer(Sender: TObject);
begin
  inherited;
  if Visible then begin
    Top := 0;
//   BringToFront;
//    ForceForegroundWindow(Handle, 'TFrmExpTBY');
  end;
end;

procedure TFrmExpTBY.TimerNavTimer(Sender: TObject);
begin
  inherited;
  TimerNav.Enabled := False;
  if FIDSessao<>0 then
    Navigate;
end;

function TFrmExpTBY.ToolbarWidth: Integer;
begin
  if Screen.Width >= 1024 then
    Result := 668 else
    Result := 440;
end;

function TFrmExpTBY.URL: String;
begin
  if gTBUrl>'' then
    Result := gTBUrl
  else
  if gConfig.Toolbar_Url>'' then
    Result := gConfig.Toolbar_Url 
  else
    Result := gUrls.Url('ad_toolbar');
    
  DebugMsg('TFrmExpTBY.Url: '+Result);  
end;

{ TncjsFrmTBY }
function SoDig(S: String): String;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do  
    if S[i] in ['0'..'9'] then
      Result := Result + S[i];
end;

procedure TncjsFrmTBY.enableExpand(const triggerTop, triggerLeft, triggerBottom,
  triggerRight, expandHeight, expandWidth, expandMode, retractJS: OleVariant);
var
  aTriggerR, 
  aExpR: TRect;
  aExpH, 
  aExpW : Integer;
  S : String;
  sExpandPos,
  sExpandMode, 
  sRetract : String;
begin
  aTriggerR.Top := triggerTop;
  aTriggerR.Left := triggerLeft;
  aTriggerR.Right := triggerRight;
  aTriggerR.Bottom := triggerBottom;

  S := expandWidth;
  if copy(S, Length(S), 1)='%' then
    aExpW := Trunc(StrToIntDef(SoDig(S), 0) * RectW(gDesktopRect) / 100) else
    aExpW := StrToIntDef(SoDig(S), 0);

  if aExpW>RectW(gDesktopRect) then 
    aExpW := RectW(gDesktopRect);

  S := expandHeight;
  if copy(S, Length(S), 1)='%' then
    aExpH := Trunc(StrToIntDef(SoDig(S), 0) * RectH(gDesktopRect) / 100) else
    aExpH := StrToIntDef(SoDig(S), 0);

  if aExpH>RectH(gDesktopRect) then 
    aExpH := RectH(gDesktopRect);

  if (aExpH*aExpW) > MaxExpPixels then 
    aExpH := MaxExpPixels div aExpW;

  try
    sExpandPos := ''; //expandPos;
  finally
    sExpandPos := '';
  end;

  if sExpandPos = '0' then
    aExpR.Left := 0
  else
    aExpR.Left := aTriggerR.Left + StrToIntDef(sExpandPos, 0);

  if aExpR.Left < 0 then
    aTriggerR.Left := 0;
  
//  if aExpW <= RectW(aTriggerR) then
{  else begin
    aExpR.Left := aTriggerR.Left - ((aExpW - RectW(aTriggerR)) div 2 );
    if ((aExpW - RectW(aTriggerR)) mod 2) > 0 then aExpR.Left := aExpR.Left - 1;
    if aExpR.Left < 0 then aExpR.Left := 0;
  end;}

  aExpR.Right := aExpR.Left + aExpW - 1;
  aExpR.Top := tbyHeight;
  aExpR.Bottom := aExpH + aExpR.Top - 1;
  
  try
    sExpandMode := expandMode;
  except
    sExpandMode := '';
  end;
  
  try
    sRetract := retractJS;
  except
    sRetract := '';
  end;

  TncExpandArea.Create(TncFrmExpandArea(FObject), 
                       aTriggerR, 
                       aExpR, sRetract, 
                       not SameText(sExpandMode, 'mouseclick'));
end;

procedure TncjsFrmTBY.retract;
begin
  TFrmExpTBY(FObject).ExpandedArea := nil;
end;

procedure TFrmExpTBY.WBDocumentComplete(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  inherited;
  DebugMsg('TFrmExpTBY - WBDocumentComplete');
  
  if not FErroNav then begin
    WB.Visible := True;

    try
      WB.OleObject.Document.Body.Style.Margin := '0';
    except
    end;
    
  end;
end;

procedure TFrmExpTBY.WBDownloadComplete(Sender: TObject);
begin
  inherited;
  if not FErroNav then
    WB.Visible := True;
end;

procedure TFrmExpTBY.WBGetExternal(Sender: TCustomEmbeddedWB;
  var ppDispatch: IDispatch);
begin
  inherited;
  ppDispatch := TAutoObjectDispatch.Create(TncjsFrmTBY.Create(Self, WB)) as IDispatch;
end;

procedure TFrmExpTBY.WBNavigateComplete2(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  inherited;
  DebugMsg('TFrmExpTBY - WBNavigateComplete2');
  if not FErroNav then
    WB.Visible := True;
end;

procedure TFrmExpTBY.WBNavigateError(ASender: TObject; const pDisp: IDispatch;
  var URL, Frame, StatusCode: OleVariant; var Cancel: WordBool);
var s: String;

begin
  inherited;
  Cancel := False;
  if MesmaURL(Self.URL, URL) and (StatusCode<=0) then begin
    FErroNav := True;
    RetryNav;
  end;
  if FLastSSError <> FIDSessao then begin
    FLastSSError := FIDSessao;
    s := httpGet('http://erros.nextar.com.br/obtemchaveseg');
    httpPost('http://erros.nextar.com.br/add', 
      'conta='+gConfig.Conta+sLineBreak+
      'maq='+IntToStr(FrmPri.CM.Maquina)+slinebreak+
      'origem=toolbar'+slinebreak+
      'url='+URL+sLineBreak+
      'statuscode='+statuscode+sLineBreak+
      'ver='+SelfShortVer+sLineBreak+
      'chaveseg='+s+slineBreak+
      'senhaseg='+gerasenhaseg(s));
  end;
end;

end.
