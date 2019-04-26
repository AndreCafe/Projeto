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
  cxLabel, LMDControl;

type
  TEnviarMsg = procedure (const aPara: Integer; const aTexto: String) of object;
  
  TFrmBaseChat = class(TForm)
    panPri: TLMDSplitterPanel;
    LMDSplitterPane1: TLMDSplitterPane;
    LMDSplitterPane2: TLMDSplitterPane;
    meTexto: TMemo;
    panEnviar: TLMDSimplePanel;
    edMaq: TcxComboBox;
    lbMaq: TLabel;
    btnEnviar: TcxButton;
    TimerAtencao: TTimer;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    TV: TcxGridTableView;
    TVQuem: TcxGridColumn;
    TVTexto: TcxGridColumn;
    TVAtendente: TcxGridColumn;
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
  public
    procedure DeleteAll;
    
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

procedure TFrmBaseChat.btnEnviarClick(Sender: TObject);
begin
  Atencao := False;
  meTexto.Text := Trim(meTexto.Text);
  if meTexto.Text='' then Exit;
  
  if FMaq>0 then
    FEnviarMsg(0, meTexto.Text)
  else
  if SameText(edMaq.Text, 'Todos') then
    FEnviarMsg(-1, meTexto.Text)else
    FEnviarMsg(StrToInt(edMaq.Text), meTexto.Text);
    
  meTexto.Lines.Clear;
  btnEnviar.Enabled := False;
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
  btnEnviar.Enabled := (meTexto.Text>'');
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

  if (aDe>0) and (FMaq=0) and (meTexto.Text='') then
    edMaq.Text := IntToStr(aDe); 

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
  lbMaq.Visible := (FMaq=0);
  edMaq.Visible := (FMaq=0);
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
  Atencao := False;
end;

procedure TFrmBaseChat.meTextoExit(Sender: TObject);
begin
  meTexto.Color := clWhite;
end;

procedure TFrmBaseChat.edMaqPropertiesInitPopup(Sender: TObject);
begin
  if Assigned(FPrecisaVisibilidade) then FPrecisaVisibilidade(Self);
end;

end.
