unit ncaFrmHorario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxColorComboBox, cxControls, cxContainer, cxEdit, cxLabel, LMDPNGImage,
  ExtCtrls, LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, ncClassesBase, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons;

type
  TFrmHorario = class(TForm)
    panH: TLMDSimplePanel;
    panH2: TLMDSimplePanel;
    panHorarios: TLMDSimplePanel;
    LMDSimplePanel7: TLMDSimplePanel;
    LMDSimplePanel14: TLMDSimplePanel;
    Dia: TLMDLabel;
    LMDLabel11: TLMDLabel;
    LMDSimplePanel17: TLMDSimplePanel;
    LMDLabel4: TLMDLabel;
    panSab: TLMDSimplePanel;
    cxLabel27: TcxLabel;
    cxLabel28: TcxLabel;
    cxLabel29: TcxLabel;
    cxLabel30: TcxLabel;
    cxLabel31: TcxLabel;
    cxLabel32: TcxLabel;
    cxLabel33: TcxLabel;
    cxLabel34: TcxLabel;
    cxLabel35: TcxLabel;
    cxLabel36: TcxLabel;
    cxLabel37: TcxLabel;
    cxLabel38: TcxLabel;
    cxLabel39: TcxLabel;
    cxLabel40: TcxLabel;
    cxLabel41: TcxLabel;
    cxLabel42: TcxLabel;
    cxLabel43: TcxLabel;
    cxLabel44: TcxLabel;
    cxLabel45: TcxLabel;
    cxLabel46: TcxLabel;
    cxLabel47: TcxLabel;
    cxLabel48: TcxLabel;
    cxLabel49: TcxLabel;
    cxLabel50: TcxLabel;
    LMDSimplePanel19: TLMDSimplePanel;
    LMDLabel5: TLMDLabel;
    panDom: TLMDSimplePanel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    cxLabel24: TcxLabel;
    cxLabel25: TcxLabel;
    cxLabel26: TcxLabel;
    LMDSimplePanel4: TLMDSimplePanel;
    LMDLabel1: TLMDLabel;
    panSex: TLMDSimplePanel;
    cxLabel51: TcxLabel;
    cxLabel52: TcxLabel;
    cxLabel53: TcxLabel;
    cxLabel54: TcxLabel;
    cxLabel55: TcxLabel;
    cxLabel56: TcxLabel;
    cxLabel57: TcxLabel;
    cxLabel58: TcxLabel;
    cxLabel59: TcxLabel;
    cxLabel60: TcxLabel;
    cxLabel61: TcxLabel;
    cxLabel62: TcxLabel;
    cxLabel63: TcxLabel;
    cxLabel64: TcxLabel;
    cxLabel65: TcxLabel;
    cxLabel66: TcxLabel;
    cxLabel67: TcxLabel;
    cxLabel68: TcxLabel;
    cxLabel69: TcxLabel;
    cxLabel70: TcxLabel;
    cxLabel71: TcxLabel;
    cxLabel72: TcxLabel;
    cxLabel73: TcxLabel;
    cxLabel74: TcxLabel;
    LMDSimplePanel6: TLMDSimplePanel;
    LMDLabel2: TLMDLabel;
    panQui: TLMDSimplePanel;
    cxLabel75: TcxLabel;
    cxLabel76: TcxLabel;
    cxLabel77: TcxLabel;
    cxLabel78: TcxLabel;
    cxLabel79: TcxLabel;
    cxLabel80: TcxLabel;
    cxLabel81: TcxLabel;
    cxLabel82: TcxLabel;
    cxLabel83: TcxLabel;
    cxLabel84: TcxLabel;
    cxLabel85: TcxLabel;
    cxLabel86: TcxLabel;
    cxLabel87: TcxLabel;
    cxLabel88: TcxLabel;
    cxLabel89: TcxLabel;
    cxLabel90: TcxLabel;
    cxLabel91: TcxLabel;
    cxLabel92: TcxLabel;
    cxLabel93: TcxLabel;
    cxLabel94: TcxLabel;
    cxLabel95: TcxLabel;
    cxLabel96: TcxLabel;
    cxLabel97: TcxLabel;
    cxLabel98: TcxLabel;
    LMDSimplePanel9: TLMDSimplePanel;
    LMDLabel3: TLMDLabel;
    panQua: TLMDSimplePanel;
    cxLabel99: TcxLabel;
    cxLabel100: TcxLabel;
    cxLabel101: TcxLabel;
    cxLabel102: TcxLabel;
    cxLabel103: TcxLabel;
    cxLabel104: TcxLabel;
    cxLabel105: TcxLabel;
    cxLabel106: TcxLabel;
    cxLabel107: TcxLabel;
    cxLabel108: TcxLabel;
    cxLabel109: TcxLabel;
    cxLabel110: TcxLabel;
    cxLabel111: TcxLabel;
    cxLabel112: TcxLabel;
    cxLabel113: TcxLabel;
    cxLabel114: TcxLabel;
    cxLabel115: TcxLabel;
    cxLabel116: TcxLabel;
    cxLabel117: TcxLabel;
    cxLabel118: TcxLabel;
    cxLabel119: TcxLabel;
    cxLabel120: TcxLabel;
    cxLabel121: TcxLabel;
    cxLabel122: TcxLabel;
    LMDSimplePanel11: TLMDSimplePanel;
    LMDLabel6: TLMDLabel;
    panTer: TLMDSimplePanel;
    cxLabel123: TcxLabel;
    cxLabel124: TcxLabel;
    cxLabel125: TcxLabel;
    cxLabel126: TcxLabel;
    cxLabel127: TcxLabel;
    cxLabel128: TcxLabel;
    cxLabel129: TcxLabel;
    cxLabel130: TcxLabel;
    cxLabel131: TcxLabel;
    cxLabel132: TcxLabel;
    cxLabel133: TcxLabel;
    cxLabel134: TcxLabel;
    cxLabel135: TcxLabel;
    cxLabel136: TcxLabel;
    cxLabel137: TcxLabel;
    cxLabel138: TcxLabel;
    cxLabel139: TcxLabel;
    cxLabel140: TcxLabel;
    cxLabel141: TcxLabel;
    cxLabel142: TcxLabel;
    cxLabel143: TcxLabel;
    cxLabel144: TcxLabel;
    cxLabel145: TcxLabel;
    cxLabel146: TcxLabel;
    LMDSimplePanel13: TLMDSimplePanel;
    LMDLabel7: TLMDLabel;
    panSeg: TLMDSimplePanel;
    cxLabel147: TcxLabel;
    cxLabel148: TcxLabel;
    cxLabel149: TcxLabel;
    cxLabel150: TcxLabel;
    cxLabel151: TcxLabel;
    cxLabel152: TcxLabel;
    cxLabel153: TcxLabel;
    cxLabel154: TcxLabel;
    cxLabel155: TcxLabel;
    cxLabel156: TcxLabel;
    cxLabel157: TcxLabel;
    cxLabel158: TcxLabel;
    cxLabel159: TcxLabel;
    cxLabel160: TcxLabel;
    cxLabel161: TcxLabel;
    cxLabel162: TcxLabel;
    cxLabel163: TcxLabel;
    cxLabel164: TcxLabel;
    cxLabel165: TcxLabel;
    cxLabel166: TcxLabel;
    cxLabel167: TcxLabel;
    cxLabel168: TcxLabel;
    cxLabel169: TcxLabel;
    cxLabel170: TcxLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    Image1: TImage;
    cxLabel1: TcxLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    LMDSimplePanel5: TLMDSimplePanel;
    edCor: TcxColorComboBox;
    cxLabel2: TcxLabel;
    btnTodos: TcxButton;
    procedure LMDSpeedButton97MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnTodosClick(Sender: TObject);
  private
    { Private declarations }
    FAtual : TncHoraTarifa;
    FTA    : Integer;
    FAlterou : Boolean;
    FOnAlterou: TNotifyEvent;
    FMouseDown : Boolean;
    procedure LoadDia(pan: TLMDSimplePanel; T: TncTipoAcesso);
    procedure RefreshDia(pan: TLMDSimplePanel; T: TncTipoAcesso);
    function Orig: PncHoraTarifa;
    procedure SetAlterou(const Value: Boolean);
  public
    procedure RefreshTarifas;
    procedure LoadTarifas;
    procedure Load;
    procedure Save;
    procedure Init(aTA: Integer; aOnAlterou: TNotifyEvent; aParent: TWinControl);
    
    function TAObj: TncTipoAcesso;

    property TA: Integer read FTA;

    property Alterou: Boolean
      read FAlterou write SetAlterou;

    property OnAlterou: TNotifyEvent
      read FOnAlterou write FOnAlterou;  
    { Public declarations }
  end;

var
  FrmHorario: TFrmHorario;

implementation

uses ncaDM, ncaFrmPri;

{$R *.dfm}

{ TForm1 }

function InverseColor(BackGroundColor : TColor):TColor;
const
 cHalfBrightness = ((0.3 * 255.0) + (0.59 * 255.0) + (0.11 * 255.0)) / 2.0;
var
 Brightness : double;
begin
 with TRGBQuad(BackGroundColor) do
  BrightNess := (0.3 * rgbRed) + (0.59 * rgbGreen) + (0.11 * rgbBlue);
 if (Brightness>cHalfBrightNess) then
  result := clblack
 else
  result := clwhite;
end;

procedure TFrmHorario.btnTodosClick(Sender: TObject);
var 
  D, H : Integer;
  T: TncTipoAcesso;
begin
  T := TAObj;
  if T=nil then Exit;

  if gTarifas.PorCor[edCor.ColorValue]=nil then begin
    ShowMessage('É necessário selecionar uma tarifa');
    Exit;
  end;

  for D := 1 to 7 do 
    for H := 0 to 23 do 
      if FAtual[D, H]<>edCor.ColorValue then begin
        Alterou := True;
        FAtual[D, H] := edCor.ColorValue;
      end;

  if Alterou then begin
    LoadDia(panDom, T);
    LoadDia(panSeg, T);
    LoadDia(panTer, T);
    LoadDia(panQua, T);
    LoadDia(panQui, T);
    LoadDia(panSex, T);
    LoadDia(panSab, T);
  end;   
end;

procedure TFrmHorario.FormCreate(Sender: TObject);
begin
  FMouseDown := False;
end;

procedure TFrmHorario.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMouseDown := True;
end;

procedure TFrmHorario.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMouseDown := False;
end;

procedure TFrmHorario.Init(aTA: integer; aOnAlterou: TNotifyEvent; aParent: TWinControl);
var D, H: Integer;
begin
  FTA := aTA;
  FOnAlterou := aOnAlterou;
  panH.Parent := aParent;
  Load;
end;

procedure TFrmHorario.LMDSpeedButton97MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var 
  L: TcxLabel;
  H: Integer;
begin
  if (not (ssLeft in Shift))  and (not (ssRight in Shift)) then 
    Exit;
  L := TcxLabel(Sender);
  H := StrToInt(L.Caption);  
  
  if FAtual[L.Parent.Tag, H] = edCor.ColorValue then Exit;

  L.Style.Color := edCor.ColorValue;
  L.Style.TextColor := InverseColor(edCor.ColorValue);
  FAtual[L.Parent.Tag, H] := L.Style.Color;
  Alterou := True;
end;

procedure TFrmHorario.Load;
var 
  D, H: Integer;
  T: TncTipoAcesso;
begin
  T := TAObj;
  if T=nil then Exit;
  
  LoadTarifas;
  
  Move(T.PHoraTarifa^, FAtual, SizeOf(FAtual));
  LoadDia(panDom, T);
  LoadDia(panSeg, T);
  LoadDia(panTer, T);
  LoadDia(panQua, T);
  LoadDia(panQui, T);
  LoadDia(panSex, T);
  LoadDia(panSab, T);
    
  FAlterou := False;
end;

procedure TFrmHorario.LoadDia(pan: TLMDSimplePanel; T: TncTipoAcesso);
var 
  I, H : Integer;
  L : TcxLabel;
  THO : TncTarifa;
begin
  for I := 0 to pan.ControlCount - 1 do  begin
    L := TcxLabel(pan.Controls[I]);
    THO := gTarifas.PorCor[FAtual[pan.Tag, StrToInt(L.Caption)]];
    if THO = nil then
      THO := T.TarifaPadraoObj;
      
    if THO<>nil then
      L.Style.Color := THO.Cor else
      L.Style.Color := clWhite;
      
    L.Style.TextColor := InverseColor(L.Style.Color);  
  end;
end;

procedure TFrmHorario.RefreshDia(pan: TLMDSimplePanel; T: TncTipoAcesso);
var 
  I, H : Integer;
  L : TcxLabel;
  THO : TncTarifa;
begin
  for I := 0 to pan.ControlCount - 1 do  begin
    L := TcxLabel(pan.Controls[I]);
    H := StrToInt(L.Caption);
    if (gTarifas.PorCor[L.Style.Color]=nil) or
       (gTarifas.PorCor[FAtual[pan.Tag, H]]=nil) then
    begin
      THO := T.TarifaPadraoObj;
      if THO<>nil then
        L.Style.Color := THO.Cor else
        L.Style.Color := clWhite;
      L.Style.TextColor := InverseColor(L.Style.Color);
    end;
  end;
end;

procedure TFrmHorario.RefreshTarifas;
var 
  T : TncTipoAcesso;
  I : Integer;
begin
  T := TAObj;
  if T=nil then Exit;

  with edCor.Properties do
  for I := CustomColors.Count-1 downto 0 do
  if gTarifas.PorCor[CustomColors[I].Color]=nil then
    CustomColors.Delete(I);

  with edCor do 
  with Properties do 
    for I := 0 to gTarifas.Count - 1 do
      CustomColors.AddColor(gTarifas[I].Cor, gTarifas[I].Descricao);

  RefreshDia(panDom, T);
  RefreshDia(panSeg, T);
  RefreshDia(panTer, T);
  RefreshDia(panQua, T);
  RefreshDia(panQui, T);
  RefreshDia(panSex, T);
  RefreshDia(panSab, T);
end;

function TFrmHorario.Orig: PncHoraTarifa;
begin
  if TAObj<>nil then
    Result := TAObj.PHoraTarifa;
end;

procedure TFrmHorario.LoadTarifas;
var I: Integer;
begin
  with edCor do 
  with Properties do begin
    CustomColors.Clear;
    for I := 0 to gTarifas.Count - 1 do
      with CustomColors.Add do begin
        Color := gTarifas[I].Cor;
        Description := gTarifas[I].Descricao;
      end;
  end;
  if gTarifas.Count>0 then
  if (TAObj<>nil) and (TAObj.TarifaPadraoObj<>nil) then
    edCor.ColorValue := TAObj.TarifaPadraoObj.Cor else
    edCor.ColorValue := gTarifas[0].Cor;
end;

procedure TFrmHorario.Save;
var T: TncTipoAcesso;
begin
  T := TAObj;
  if T=nil then Exit;

  if FAlterou then begin
    FAlterou := False;
    T.AtualizaCache;
    Move(FAtual, T.PHoraTarifa^, SizeOf(FAtual));
    T.HoraTarifaStr := T.HoraTarifaStr;
    Dados.CM.SalvaAlteracoesObj(T, False);
  end else
    Load;
end;

procedure TFrmHorario.SetAlterou(const Value: Boolean);
begin
  if Value=FAlterou then Exit;

  FAlterou := Value;
  if Value and Assigned(FOnAlterou) then
    FOnAlterou(Self);
end;

function TFrmHorario.TAObj: TncTipoAcesso;
begin
  Result := gTiposAcesso.PorCodigo[FTA];
end;

end.
