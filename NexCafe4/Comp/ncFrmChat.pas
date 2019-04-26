unit ncFrmChat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookAndFeels,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, LMDSimplePanel,
  LMDCustomScrollBox, LMDScrollBox, lmdsplt, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, cxMemo, ExtCtrls,
  cxLabel, LMDControl, LMDPNGImage;

type
  TEnviarMsg = procedure (const aPara: Integer; const aTexto: String) of object;
  
  TFrmBaseChat = class(TForm)
    TimerAtencao: TTimer;
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    cxLabel1: TcxLabel;
    panPri: TLMDSimplePanel;
    Grid: TcxGrid;
    TV: TcxGridTableView;
    TVQuem: TcxGridColumn;
    TVTexto: TcxGridColumn;
    TVAtendente: TcxGridColumn;
    GL: TcxGridLevel;
    panTexto: TLMDSimplePanel;
    meTexto: TMemo;
    panEnviarCli: TLMDSimplePanel;
    panEnviarAdmin: TLMDSimplePanel;
    cxLabel2: TcxLabel;
    edMaq: TcxComboBox;
    btnEnviar: TcxButton;
    cxButton1: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure meTextoChange(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure meTextoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edMaqPropertiesCloseUp(Sender: TObject);
    procedure meTextoEnter(Sender: TObject);
    procedure meTextoExit(Sender: TObject);
    procedure TimerAtencaoTimer(Sender: TObject);
    procedure RVEnter(Sender: TObject);
    procedure edMaqEnter(Sender: TObject);
    procedure RVMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure edMaqPropertiesInitPopup(Sender: TObject);
    procedure edMaqExit(Sender: TObject);
    procedure TVQuemCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    FMaq: Integer;
    FEnviarMsg: TEnviarMsg;
    FAtencao: Boolean;
    FMudouAtencao: TNotifyEvent;
    FNaoPiscar: Boolean;
    FPrecisaVisibilidade: TNotifyEvent;
    procedure SetEnviarMsg(const Value: TEnviarMsg);
    procedure SetMaq(const Value: Integer);
    procedure SetAtencao(const Value: Boolean);
    { Private declarations }
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    procedure DeleteAll;

    procedure Restaura;
    
    procedure MsgEnv(const aHora: TDateTime; const aDe, aPara:Integer; const aTexto: String);
    { Public declarations }
    property EnviarMsg: TEnviarMsg
      read FEnviarMsg write SetEnviarMsg;
      
    property NumMaq: Integer 
      read FMaq write SetMaq;

    property Atencao: Boolean
      read FAtencao write SetAtencao;  

    property MudouAtencao: TNotifyEvent
      read FMudouAtencao write FMudouAtencao;  

    property NaoPiscar: Boolean
      read FNaoPiscar write FNaoPiscar;  

    property PrecisaVisibilidade: TNotifyEvent
      read FPrecisaVisibilidade write FPrecisaVisibilidade;     
  end;

var
  FrmBaseChat: TFrmBaseChat;

implementation

{$R *.dfm}

{ TFrmBaseChat }

function ZeroPad(I: Integer): String;
begin
  Result := IntToStr(I);
  if I=-1 then 
    Result := ' Todas - ' else
    Result := ' Maq.'+Result+' - ';  
end;

procedure TFrmBaseChat.CreateParams(var Params: TCreateParams);
begin
  inherited;
  params.ExStyle := params.ExStyle or WS_EX_APPWINDOW;
  params.WndParent := GetDesktopwindow;
end;


procedure TFrmBaseChat.btnEnviarClick(Sender: TObject);
var M : Integer;
begin
  Atencao := False;
  meTexto.Text := Trim(meTexto.Text);
  if meTexto.Text='' then Exit;
  
  if FMaq>0 then
    FEnviarMsg(0, meTexto.Text)
  else begin
    M := edMaq.ItemIndex;
    if M=0 then M := -1;
    FEnviarMsg(M, meTexto.Text);
  end;
    
  meTexto.Lines.Clear;
//  btnEnviar.Enabled := False;
  if Assigned(FPrecisaVisibilidade) then FPrecisaVisibilidade(Self);

  meTexto.SetFocus;
end;

procedure TFrmBaseChat.DeleteAll;
begin
  TV.DataController.BeginFullUpdate;
  try
    while TV.DataController.RecordCount>0 do
      TV.DataController.DeleteRecord(0);
  finally
    TV.DataController.EndFullUpdate;
  end;
end;

procedure TFrmBaseChat.edMaqEnter(Sender: TObject);
begin
  Atencao := False;
end;

procedure TFrmBaseChat.edMaqExit(Sender: TObject);
begin
  if Assigned(FPrecisaVisibilidade) then FPrecisaVisibilidade(Self);
end;

procedure TFrmBaseChat.edMaqPropertiesCloseUp(Sender: TObject);
begin
  if Assigned(FPrecisaVisibilidade) then FPrecisaVisibilidade(Self);
  try
    meTexto.SetFocus;
  except
  end;
end;

procedure TFrmBaseChat.FormCreate(Sender: TObject);
begin
  FMaq := 0;
  FEnviarMsg := nil;
  FMudouAtencao := nil;
  FNaoPiscar := False;
  FAtencao := True;
  Atencao := False;
  FPrecisaVisibilidade := nil;
end;

procedure TFrmBaseChat.meTextoChange(Sender: TObject);
begin
//  btnEnviar.Enabled := (meTexto.Text>'');
end;

procedure TFrmBaseChat.meTextoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (not (ssCtrl in Shift)) and (Key=13) and (meTexto.Text>'') then
    btnEnviarClick(nil);
end;

procedure TFrmBaseChat.MsgEnv(const aHora: TDateTime; const aDe, aPara: Integer;
  const aTexto: String);
var 
  S, sFmt: String;  
  I: Integer;
begin
  if (aDe>0) then
    S := ZeroPad(aDe) else
    S := ZeroPad(aPara);

  if aDe=FMaq then
    I := 0 else
    I := 3;

  if (aDe>0) and (FMaq=0) and (Trim(meTexto.Text)='') then
  try
    edMaq.ItemIndex := aDe;
  except
  end;

  I := TV.DataController.AppendRecord;  

  if Int(Now)=Int(aHora) then
    sFmt := 'hh:mm:ss' else
    sFmt := 'dd/mm/yyyy hh:mm:ss';
    
  if FMaq=0 then 
    S := S+' '+FormatDateTime(sFmt, aHora) else
    S := FormatDateTime('hh:mm:ss', aHora);

  if aDe=0 then
    S := S+' - Atendente diz:' else
    S := S+' - Cliente diz:';

  TV.DataController.Values[I, 0] := S;
  TV.DataController.Values[I, 1] := aTexto;
  TV.DataController.Values[I, 2] := (aDe=0);
    
  if (aDe<>FMaq) and (not meTexto.Focused) and (not Grid.Focused) and (not edMaq.Focused) then
    Atencao := True;
end;

function ForceForegroundWindow(hwnd: THandle): boolean;
const
  SPI_GETFOREGROUNDLOCKTIMEOUT = $2000;
  SPI_SETFOREGROUNDLOCKTIMEOUT = $2001;
var
  ForegroundThreadID: DWORD;
  ThisThreadID : DWORD;
  timeout : DWORD;
begin
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

procedure TFrmBaseChat.Restaura;
begin
  ForceForegroundWindow(Handle);
end;

procedure TFrmBaseChat.RVEnter(Sender: TObject);
begin
  Atencao := False;
end;

procedure TFrmBaseChat.RVMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Atencao := False;
end;

procedure TFrmBaseChat.SetAtencao(const Value: Boolean);
begin
  if Value=FAtencao then Exit;
  FAtencao := Value;
  if FAtencao then begin
    if not NaoPiscar then 
      panPri.Bevel.BorderinnerWidth := 3;
    TimerAtencao.Enabled := True;
    
    Application.BringToFront;
  end else begin
    panPri.Bevel.BorderInnerWidth := 0;
    TimerAtencao.Enabled := False;
  end;
  if Assigned(FMudouAtencao) then
     FMudouAtencao(Self);
end;

procedure TFrmBaseChat.SetEnviarMsg(const Value: TEnviarMsg);
begin
  FEnviarMsg := Value;
  meTexto.Enabled := Assigned(FEnviarMsg);
end;

procedure TFrmBaseChat.SetMaq(const Value: Integer);
begin
  FMaq := Value;
  panEnviarAdmin.Visible := (FMaq=0);
  panEnviarCli.Visible := not panEnviarAdmin.Visible;
end;

procedure TFrmBaseChat.TimerAtencaoTimer(Sender: TObject);
begin
  with panPri.Bevel do
  if BorderColor=clOlive then
    BorderColor := clYellow else
    BorderColor := clOlive;
    
{  if meTexto.Focused or RV.Focused or edMaq.Focused then
    Atencao := False;}
end;

procedure TFrmBaseChat.TVQuemCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var V: Variant;  
begin
  V := AViewInfo.GridRecord.Values[TVAtendente.Index];
  if (V<>null) and (V<>True) then
    ACanvas.Font.Style := [fsBold];
end;

procedure TFrmBaseChat.meTextoEnter(Sender: TObject);
begin
  meTexto.Color := $00CAFFCA;
  panEnviarCli.Color := $00CAFFCA;
  Atencao := False;
end;

procedure TFrmBaseChat.meTextoExit(Sender: TObject);
begin
  meTexto.Color := clWhite;
  panEnviarCli.Color := clWhite;
end;

procedure TFrmBaseChat.edMaqPropertiesInitPopup(Sender: TObject);
begin
  if Assigned(FPrecisaVisibilidade) then FPrecisaVisibilidade(Self);
end;

end.
