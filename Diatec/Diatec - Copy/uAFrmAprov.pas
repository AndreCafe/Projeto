unit uAFrmAprov;

interface

uses
  uDTSyncDef,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, LMDBaseGraphicControl,
  LMDBaseLabel, LMDCustomLabel, LMDLabel, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton, 
  kbmMemTable, cxStyles, cxGraphics, cxEdit, cxImageComboBox,
  cxCurrencyEdit, cxMemo, cxDBEdit, cxContainer, cxTextEdit, cxVGrid,
  cxDBVGrid, cxControls, cxInplaceContainer;

type
  TFrmAprov = class(TForm)
    panBotoes: TLMDSimplePanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    LMDSimplePanel1: TLMDSimplePanel;
    gbDados: TGroupBox;
    gbTec: TGroupBox;
    LMDSimplePanel2: TLMDSimplePanel;
    bt3: TLMDSpeedButton;
    bt2: TLMDSpeedButton;
    bt1: TLMDSpeedButton;
    bt0: TLMDSpeedButton;
    lbValorTec: TLabel;
    gbCli: TGroupBox;
    lbValorCli: TLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    bc4: TLMDSpeedButton;
    bc3: TLMDSpeedButton;
    bc2: TLMDSpeedButton;
    bc1: TLMDSpeedButton;
    bc0: TLMDSpeedButton;
    LMDSimplePanel4: TLMDSimplePanel;
    LMDSimplePanel5: TLMDSimplePanel;
    lbMotivo: TLMDLabel;
    MT: TkbmMemTable;
    MTSync: TBooleanField;
    MTTecnico: TStringField;
    MTCliente: TStringField;
    MTDataI: TDateField;
    MTDataF: TDateField;
    MTItem: TWordField;
    MTTipo: TWordField;
    MTValor: TCurrencyField;
    MTJustDiverg: TMemoField;
    MTDescr: TMemoField;
    MTNumF: TIntegerField;
    MTValorDef: TCurrencyField;
    MTValorCli: TCurrencyField;
    MTValorTec: TCurrencyField;
    MTStatusTec: TWordField;
    MTLogID: TIntegerField;
    MTStatusCli: TWordField;
    dsMT: TDataSource;
    lbDifPadrao: TLMDLabel;
    lbValorDef: TLMDLabel;
    VG: TcxDBVerticalGrid;
    VGTipo1: TcxDBEditorRow;
    VGValor1: TcxDBEditorRow;
    VGDescr1: TcxDBEditorRow;
    VGValorDef1: TcxDBEditorRow;
    edValorCli: TcxDBCurrencyEdit;
    edValorTec: TcxDBCurrencyEdit;
    edMotivo: TcxDBMemo;
    procedure VGDrawValue(Sender: TObject; ACanvas: TcxCanvas;
      APainter: TcxvgPainter; AValueInfo: TcxRowValueInfo; var Done: Boolean);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bc1Click(Sender: TObject);
    procedure bt0Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FStatusC : Integer;
    FStatusT : Integer;
    FTab     : TDataset;
    FNovo    : Boolean;
    
    procedure Valida;
    procedure AjustaMask;
    procedure SetStatusC(const Value: Integer);
    procedure SetStatusT(const Value: Integer);

    function GetBtn(aNomeBase: String; aStatus: Integer): TLMDSpeedButton;
    { Private declarations }
  public
    procedure Editar(aTab: TDataset);

    property StatusC: Integer
      read FStatusC write SetStatusC;

    property StatusT: Integer
      read FStatusT write SetStatusT;  
    { Public declarations }
  end;

var
  FrmAprov: TFrmAprov;

implementation
                                       
uses uAFrmItemRA, uDMA;

const
  CoresC : Array[sfracNaoPaga..sfracNaoCobrar, 0..1] of TColor = 
  ((clGray, clWhite), 
   (clGray, clWhite),
   (clGreen, clWhite),
   (clYellow, clBlack),
   (clRed, clWhite));

  CoresT : Array[sfratPendente..sfratReprovado, 0..1] of TColor =
  ((clGray, clWhite), 
   (clGreen, clWhite),
   (clYellow, clBlack),
   (clRed, clWhite));
   
{$R *.dfm}

{ TFrmItemRA }

procedure TransfDados(TF, TD: TDataset);
var 
  I : Integer;
  F : TField;
begin
  for I := 0 to TD.FieldCount-1 do with TD.Fields[I] do begin
    F := TF.FindField(FieldName);
    if (F<>nil) and (FieldKind=fkData) then
      Value := F.Value;
  end;
end; 

procedure TFrmAprov.Editar(aTab: TDataset);
begin
  FTab := aTab;
  MT.Insert;
  TransfDados(FTab, MT);
  MT.Post;
  try
    if not DM.tRAF.FindKey([mtNumF.Value]) then 
      Raise Exception.Create('Consolidação não encontrada!!!');
  except
    Free;
    Raise;
  end;

  lbValorDef.Visible := (MTValorDef.Value <> MTValor.Value);
  lbDifPadrao.Visible := lbValorDef.Visible;

  gbCli.Enabled := DM.tRAFDHFechaCli.IsNull;
  gbTec.Enabled := DM.tRAFDHFechaTec.IsNull;
  btnOk.Enabled := gbCli.Enabled or gbTec.Enabled;
  
  MT.Edit;
  AjustaMask;
  ShowModal;
end;

procedure TFrmAprov.btnOkClick(Sender: TObject);
begin
  Valida;
  if not (MT.State in [dsEdit, dsInsert]) then MT.Edit;
  MTStatusCli.Value := StatusC;
  MTStatusTec.Value := StatusT;
  MT.Post;
  FTab.Edit;
  TransfDados(MT, FTab);
  FTab.Post;
  Close;
end;

procedure TFrmAprov.Valida;
begin
  if (StatusC=sfracAprovDiverg) then 
  if (mtValorCli.Value<0.01) or (mtValorCli.Value = mtValor.Value) then begin
    edValorCli.SetFocus;
    Raise Exception.Create('Valor para cliente inválido para aprovação c/ divergência');
  end;

  if (StatusT=sfratAprovDiverg) then 
  if (mtValorTec.Value = mtValor.Value) or (mtValorTec.Value<0.01) then begin
    edValorTec.SetFocus;
    Raise Exception.Create('Valor para técnico inválido para aprovação c/ divergência');
  end;
end;

procedure TFrmAprov.VGDrawValue(Sender: TObject; ACanvas: TcxCanvas;
  APainter: TcxvgPainter; AValueInfo: TcxRowValueInfo; var Done: Boolean);
begin
  if AValueInfo.Row=VGValor1 then begin
    if mtValor.Value = mtValorDef.Value then 
      ACanvas.Brush.Color := clGreen
    else
      ACanvas.Brush.Color := clRed;
    ACanvas.Canvas.Font.Color := clWhite;
  end;
end;

procedure TFrmAprov.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmAprov.AjustaMask;
begin
  if MTTipo.Value = tiraKM then begin
    with TcxCurrencyEditProperties(VGValor1.Properties.EditProperties) do begin
      DisplayFormat := '####';
      MaxValue := 9999;
      MinValue := 0;
      DecimalPlaces := 0;
    end;  

    VGValor1.Properties.Caption := 'Quantidade';
  
    with edValorTec.Properties do begin
      DisplayFormat := '####';
      MaxValue := 9999;
      MinValue := 0;
      DecimalPlaces := 0;
    end;  

    with edValorCli.Properties do begin 
      DisplayFormat := '####';
      MaxValue := 9999;
      MinValue := 0;
      DecimalPlaces := 0;
    end;  

    lbValorTec.Caption := 'Quant.';
    lbValorCli.Caption := 'Quant.';
  end;
end;

procedure TFrmAprov.SetStatusC(const Value: Integer);
var B: TLMDSpeedButton;
begin
  if FStatusC=Value then Exit;
  
  if FStatusC<>-1 then begin
    B := GetBtn('bc', FStatusC);
    B.Color := clBtnFace;
    B.Font.Color  := clBlack;
    B.Font.Style := [];
  end;  
  
  FStatusC := Value;
  if Value=sfracNaoPaga then begin
    bc0.Visible := True;
    gbCli.Enabled := False;
  end;
  B := GetBtn('bc', StatusC);
  B.Color := CoresC[StatusC, 0];
  B.Font.Color  := CoresC[FStatusC, 1];
  B.Font.Style := [fsBold];

  case StatusC of 
    sfracNaoPaga, sfracPendente, sfracNaoCobrar : begin
      MTValorCli.Value := 0;
      lbValorCli.Enabled := False;
      edValorCli.Enabled := False;
    end;
    sfracAprovado    : begin
      MTValorCli.Value := MTValor.Value;
      lbValorCli.Enabled := False;
      edValorCli.Enabled := False;
    end;
    sfracAprovDiverg  : begin
      lbValorCli.Enabled := True;
      edValorCli.Enabled := True; 
      edValorCli.SetFocus;
    end;
  end;

  if (FStatusC<>-1) and (Value=sfracAprovDiverg) then begin
    MTValorCli.Value := 0;
    edValorCli.SetFocus;
  end;
end;

procedure TFrmAprov.SetStatusT(const Value: Integer);
var B : TLMDSpeedButton;
begin
  if FStatusT=Value then Exit;
  if FStatusT<>-1 then begin
    B := GetBtn('bt', FStatusT);
    B.Color := clBtnFace;
    B.Font.Color  := clBlack;
    B.Font.Style := [];
  end;  
    
  FStatusT := Value;
  B := GetBtn('bt', FStatusT);
  B.Color := CoresT[FStatusT, 0];
  B.Font.Color  := CoresT[FStatusT, 1];
  B.Font.Style := [fsBold];

  lbValorTec.Enabled := (StatusT = sfratAprovDiverg);
  edValorTec.Enabled := lbValorTec.Enabled;
  lbMotivo.Enabled   := (StatusT in [sfratAprovDiverg, sfratReprovado]);
  edMotivo.Enabled   := lbMotivo.Enabled;
  
  if StatusT=sfratAprovado then
    mtValorTec.Value := mtValor.Value
  else
  if StatusT in [sfratPendente, sfratReprovado] then
    mtValorTec.Value := 0;  

  if (FStatusT<>-1) and (Value=sfratAprovDiverg) then begin
    MTValorTec.Value := 0;
    edValorTec.SetFocus;
  end;
end;

function TFrmAprov.GetBtn(aNomeBase: String;
  aStatus: Integer): TLMDSpeedButton;
begin
  Result := FindComponent(aNomeBase+IntToStr(aStatus)) as TLMDSpeedButton;
end;

procedure TFrmAprov.FormCreate(Sender: TObject);
begin
  MT.Open;
  FStatusC := -1;
  FStatusT := -1;
end;

procedure TFrmAprov.bc1Click(Sender: TObject);
begin
  StatusC := TLMDSpeedButton(Sender).Tag;
end;

procedure TFrmAprov.bt0Click(Sender: TObject);
begin
  StatusT := TLMDSpeedButton(Sender).Tag;
end;

procedure TFrmAprov.FormShow(Sender: TObject);
begin
  StatusC := MTStatusCli.Value;
  StatusT := MTStatusTec.Value;
  lbValorDef.Caption := MTValorDef.AsString;
end;

end.
