unit ncgFrmExpYAD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncExpandArea, OleCtrls, SHDocVw_EWB, EwbCore, EmbeddedWB, ncgWebApi, ncSessao,
  ExtCtrls, madKernel;

type
  TFrmExpYAD = class(TncFrmExpandArea)
    Timer2: TTimer;
    Timer3: TTimer;
    WB: TEmbeddedWB;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure WBDocumentComplete(ASender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    procedure WBNavigateError(ASender: TObject; const pDisp: IDispatch; var URL,
      Frame, StatusCode: OleVariant; var Cancel: WordBool);
    procedure WBShowDialog(Sender: TObject; h: Cardinal; StyleEx: Integer;
      OldCaption: string; var NewCaption: WideString; var Cancel: Boolean);
    function WBShowMessage(Sender: TObject; HWND: Cardinal; lpstrText,
      lpstrCaption: PWideChar; dwType: Integer; lpstrHelpFile: PWideChar;
      dwHelpContext: Integer; var plResult: Integer): HRESULT;
    procedure WBGetExternal(Sender: TCustomEmbeddedWB;
      var ppDispatch: IDispatch);
  private
    FLastSSPost: Cardinal;
    FadWidth : Integer;
    FadHeight : Integer;
    FOnChangeADSize : TNotifyEvent;
    { Private declarations }
    procedure wmReposicionar(var Message: TMessage); message WM_USER;
    procedure wmAfterClick(var Message: TMessage); message WM_USER+1;
    procedure Reposicionar;
  protected 
    procedure ExecJS(aJS: String); override;
    procedure DoCreate; override;
    procedure _Retract; override;
    procedure _Expand; override;
    
    
  public
    procedure Navigate;
    procedure setADSize(aWidth, aHeight: Integer);
    { Public declarations }

    property OnChangeADSize: TNotifyEvent
      read FOnChangeADSize write FOnChangeADSize;

    property adWidth: Integer
      read FadWidth;

    property adHeight: Integer
      read Fadheight;
  end;

  TncjsFrmYAD = class( TncgWebApi )
  private
    function adWidth : Integer;
    function adHeight : Integer;
  published
    procedure setADSize(const adWidth, adHeight : OleVariant);
    
    procedure enableExpand(const 
                             expandWidth,
                             triggerGap,
                             expandMode,
                             retractJS : OleVariant);
    procedure retract;
  
  end;  

  procedure CriaExpYAD;
  procedure DestroiExpYAD;

var
  FrmExpYAD: TFrmExpYAD = nil;
  MaxWidth : Integer = 160;
  ExpYADHandle : HWND = 0;

implementation

uses 
  uVersionInfo, 
  uNR_chaveseg, 
  ncHttp, 
  ncgFrmPri,
  ncClassesBase, 
  ncDebug,
  DateUtils, 
  ncFrmPrintReview, 
  ncgFrmYAD, 
  ncWBFrameExecScript, 
  automation, nexUrls, ncgLimiteTela;

{$R *.dfm}

{ TncjsFrmYAD }

const
   expframe_name = 'y_expandable';

procedure CriaExpYAD;
begin
  if FrmExpYAD=nil then 
    FrmExpYAD := TFrmExpYAD.Create(nil);
  FrmExpYAD.Show;  
  ExpYADHandle := FrmExpYAD.Handle;
end;

procedure DestroiExpYAD;
begin
  ExpYADHandle := 0;
  if Assigned(FrmExpYAD) then
    FreeAndNil(FrmExpYAD);
end;
   
function SoDig(S: String): String;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do  
    if S[i] in ['0'..'9'] then
      Result := Result + S[i];
end;

function TncjsFrmYAD.adHeight: Integer;
begin
  Result := TFrmExpYAD(FObject).FadHeight;
end;

function TncjsFrmYAD.adWidth: Integer;
begin
  Result := TFrmExpYAD(FObject).FadWidth;
end;

procedure TncjsFrmYAD.enableExpand(const expandWidth, triggerGap, expandMode,
  retractJS: OleVariant);
var
  aGap: Integer;
  aTriggerR, 
  aExpR: TRect;
  aExpH, 
  aExpW : Integer;
  S : String;
  sExpandPos,
  sExpandMode, 
  sRetract : String;
begin
  try
    aGap := triggerGap;
  except
    aGap := 10;
  end;
  if (aGap>119) or (aGap<10) then
    aGap := 10;
  aTriggerR.Top := TFrmExpYAD(FObject).Top;
  aTriggerR.Left := Screen.Width-(adWidth-aGap);
  aTriggerR.Right := Screen.Width;
  aTriggerR.Bottom := aTriggerR.Top+adHeight-1;

  S := expandWidth;
  if copy(S, Length(S), 1)='%' then
    aExpW := Trunc(StrToIntDef(SoDig(S), 0) * RectW(gDesktopRect) / 100) else
    aExpW := StrToIntDef(SoDig(S), 0);

  if aExpW>RectW(gDesktopRect) then 
    aExpW := RectW(gDesktopRect);

  aExpH := adHeight;

//  if aExpW <= RectW(aTriggerR) then
{  else begin
    aExpR.Left := aTriggerR.Left - ((aExpW - RectW(aTriggerR)) div 2 );
    if ((aExpW - RectW(aTriggerR)) mod 2) > 0 then aExpR.Left := aExpR.Left - 1;
    if aExpR.Left < 0 then aExpR.Left := 0;
  end;}

  MaxWidth := adWidth + aExpW;

  PostMessage(TFrmExpYAD(FObject).Handle, wm_user, 0, 0);

  aExpR.Left   := Screen.Width - MaxWidth;
  aExpR.Right  := Screen.Width - adWidth;
  aExpR.Top    := aTriggerR.Top;
  aExpR.Bottom := aTriggerR.Bottom;
  
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

  TncSkyExpandArea.Create(TncFrmExpandArea(FObject), 
                       aTriggerR, 
                       aExpR, sRetract,
                       not SameText(sExpandMode, 'mouseclick'));
end;

procedure TncjsFrmYAD.retract;
begin
  TFrmExpYAD(FObject).ExpandedArea := nil;
end;


procedure TncjsFrmYAD.setADSize(const adWidth, adHeight: OleVariant);
begin
  TFrmExpYAD(FObject).setADSize(adWidth, adHeight);
end;

procedure TFrmExpYAD.DoCreate;
begin
  inherited;
  setAdSize(gUrls.SkyWidth(Screen.Width), 600);
end;

procedure TFrmExpYAD.ExecJS(aJS: String);
begin
  try
    FrameExecScript(WB, aJS, expframe_name);
  except
    on E: Exception do 
      DebugMsg('TFrmExpYAD.ExecJS - Exception: ' + E.Message);
  end;
end;

procedure TFrmExpYAD.FormCreate(Sender: TObject);
begin
  inherited;
  FLastSSPost := 0;
  FOnChangeADSize := nil;
  
  setADSize(gUrls.SkyWidth(Screen.Width), 600);

  Timer2.Enabled := False;
  Timer2.Interval := 3000;
  Timer2.Enabled := True;
end;

function HTMLSite(Sexo: String; DataNasc: TDateTime): String;
begin
  if gConfig.Sky_Url>'' then
    Result := gConfig.Sky_Url else
    Result := gUrls.Url('ad_sky');

  Result := AddParamUrl(Result, 'w='+IntToStr(gUrls.SkyWidth(Screen.Width)));

//  Result := 'http://ads.yahoo.com/st?ad_type=iframe&ad_size=430x600,160x600&section=716452&pub_url=nexcafe.com.br&conta='+gConfig.Conta;
  
  if Sexo<>'' then
    Result := AddParamUrl(Result, 'gen='+lowercase(Sexo));
    
  if DataNasc>0 then
    Result := AddParamUrl(Result, 'yob='+IntToStr(YearOf(DataNasc)));

  DebugMsg('HTMLSite - Result: ' + Result);
end;

procedure TFrmExpYAD.Navigate;
var S: TncSessao;
begin
  try
    Timer2.Enabled := False;
    Timer2.Interval := gConfig.NormBRT * 1000;
    Timer2.Enabled := True;
    
    S := FrmPri.CM.SessaoMaq;
    if S<>nil then begin
      MaxWidth := FadWidth;
      Reposicionar;
      try
        ExpandedArea := nil;
        gExpandAreaList.FreeAreaFromForm(Self);
      except
      end;
      WB.Navigate(HTMLSite(S.Sexo, S.DataNasc));
    end;
  except
    On E: Exception do 
      DebugMsg('TFrmExpYAD.Navigate - Exception: ' + E.Message);
  end;
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


procedure TFrmExpYAD.Reposicionar;
begin
  RetractR.Left := Screen.Width - FadWidth;
  RetractR.Top := posYAD;
  RetractR.Right := Screen.Width;
  RetractR.Bottom := posYAD+FadHeight-1;

  Width := MaxWidth;
  Left  := Screen.Width - MaxWidth;
  Top := posYAD;
  Height := FadHeight;
  Panel1.Visible := (ExpandedArea=nil);
  Panel1.Width := MaxWidth - FadWidth;
end;

procedure TFrmExpYAD.setADSize(aWidth, aHeight: Integer);
begin
  gRemWidth := aWidth+3;
  
  FadWidth := aWidth;
  FadHeight := aHeight;
  RetractR.Left := Screen.Width - aWidth;
  RetractR.Top := posYAD;
  RetractR.Right := Screen.Width;
  RetractR.Bottom := posYAD+aHeight-1;

  maxWidth := aWidth;
  panel1.Visible := False;
  panel1.Top := 0;
  panel1.Height := aHeight;
  panel1.Left := 0;
  panel1.Width := maxWidth - aWidth;
  
  Top := posYAD;
  Width := maxWidth;
  Height := aHeight;
  Left := Screen.Width - maxWidth;
  WB.Width := Screen.Width;

  if Assigned(FOnChangeADSize) then FOnChangeADSize(Self);
end;

function FullWindow: Boolean;
var I, scw, sch : Integer;
  W : IWindow;
  R : TRect;
begin
  Result := False;
  W := ForegroundWindow;
  if W=nil then Exit;
  Result := True;
  scw := Screen.Width;
  sch := Screen.Height;
  with W do 
  if (not SameText(ClassName, 'ProgMan')) and (not SameText(ClassName, 'TFRMCONN')) then begin
    R := GetRect;
    if ((R.Right-R.Left)>=scw) and
       ((R.Bottom-R.Top)>=sch) then Exit;
  end;
  Result := False;
end; 

procedure TFrmExpYAD.Timer2Timer(Sender: TObject);
begin
  if (not FullWindow) and (not Expanded) then 
    Navigate
  else begin
    Timer2.Enabled := False;
    Timer2.Interval := 3000;
    Timer2.Enabled := True;
  end;
end;

procedure TFrmExpYAD.Timer3Timer(Sender: TObject);
begin
  Timer3.Enabled := False;
  try
    if FullWindow then Exit;
    Reposicionar;
    if FrmPrintReview.Ativo then Exit;
//    BringWindowToTop(Handle);
    SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, (SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE));
    ShowWindow(Handle, SW_SHOWNOACTIVATE);
    Self.Repaint;
//    BringWindowToTop(Handle);
  finally
    Timer3.Interval := 5000;
    Timer3.Enabled := True;
  end;
end;

procedure TFrmExpYAD.WBDocumentComplete(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  try
    WB.OleObject.Document.Body.Style.Margin := '0';
  except
  end;
end;

procedure TFrmExpYAD.WBGetExternal(Sender: TCustomEmbeddedWB;
  var ppDispatch: IDispatch);
begin
  inherited;
  ppDispatch := TAutoObjectDispatch.Create(TncjsFrmYAD.Create(Self, WB)) as IDispatch;
end;

procedure TFrmExpYAD.WBNavigateError(ASender: TObject; const pDisp: IDispatch;
  var URL, Frame, StatusCode: OleVariant; var Cancel: WordBool);
begin
  Cancel := False;
end;

procedure TFrmExpYAD.WBShowDialog(Sender: TObject; h: Cardinal;
  StyleEx: Integer; OldCaption: string; var NewCaption: WideString;
  var Cancel: Boolean);
begin
  DebugMsg('YAD - WBShowDialog - NewCaption');
  Cancel := False;
end;

function TFrmExpYAD.WBShowMessage(Sender: TObject; HWND: Cardinal; lpstrText,
  lpstrCaption: PWideChar; dwType: Integer; lpstrHelpFile: PWideChar;
  dwHelpContext: Integer; var plResult: Integer): HRESULT;
begin
  plResult := 0;
  Result := 0;
  DebugMsg('YAD - WBShowMessage - lpstrCaption: '+lpstrCaption);
end;

procedure TFrmExpYAD.wmAfterClick(var Message: TMessage);
begin
  DestroiExpYad;
  CriaExpYad;
end;

procedure TFrmExpYAD.wmReposicionar(var Message: TMessage);
begin
  Reposicionar;
end;

procedure TFrmExpYAD._Expand;
begin
  DebugMsg('TFrmExpYAD._Expand');
  Panel1.Visible := False;
end;

procedure TFrmExpYAD._Retract;
begin
  DebugMsg('TFrmExpYAD._Retract');
  Panel1.Visible := True;
  if ExpandedArea.RetractJS>'' then
  try
    ExecJS(ExpandedArea.RetractJS);
  except
    on E: Exception do 
      DebugMsg('TFrmExpYAD._Retract - Exception: ' + E.Message);
  end;
end;

end.
