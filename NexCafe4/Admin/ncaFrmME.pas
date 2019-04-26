unit ncaFrmME;

interface

uses
  Windows, ncErros, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxCurrencyEdit, cxImageComboBox,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxTextEdit,
  cxDBLookupComboBox, cxMaskEdit, ExtCtrls, nxdb, kbmMemTable, dxBarExtItems,
  dxBar, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxContainer, cxMemo,
  cxDBEdit, cxVGrid, cxDBVGrid, cxInplaceContainer, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxDropDownEdit, cxRadioGroup, ncMovEst, ncafbPesqCli, cxCheckBox, Buttons,
  PngSpeedButton, LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  cxLabel, cxSpinEdit;

type
  TFrmME = class(TForm)
    panCab2: TLMDSimplePanel;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    dxBarDockControl2: TdxBarDockControl;
    LMDSimplePanel5: TLMDSimplePanel;
    BarMgr: TdxBarManager;
    cmNovoItem: TdxBarButton;
    cmApagarItem: TdxBarButton;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    vgH: TcxDBVerticalGrid;
    vgHCliCad: TcxDBEditorRow;
    vgHDebitoCli: TcxDBEditorRow;
    vgHObs: TcxDBEditorRow;
    cmEditar: TdxBarButton;
    panTotais: TLMDSimplePanel;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    TV: TcxGridTableView;
    TVCodigo: TcxGridColumn;
    TVDescr: TcxGridColumn;
    TVUnitario: TcxGridColumn;
    TVQuant: TcxGridColumn;
    TVTotal: TcxGridColumn;
    MT: TkbmMemTable;
    MTCliente: TIntegerField;
    MTNomeCliente: TStringField;
    MTObs: TStringField;
    MTDebito: TCurrencyField;
    dsMT: TDataSource;
    vgT: TcxVerticalGrid;
    vgTTotal: TcxEditorRow;
    vgTDesconto: TcxEditorRow;
    vgTTotalF: TcxEditorRow;
    vgTPagTotal: TcxEditorRow;
    vgTPago: TcxEditorRow;
    cmRecibo: TdxBarControlContainerItem;
    cbRecibo: TcxCheckBox;
    panHsep: TLMDSimplePanel;
    panH1: TLMDSimplePanel;
    lbTipo: TcxLabel;
    vgHAvulso: TcxDBEditorRow;
    MTNomeAvulso: TStringField;
    btnAvulso: TLMDSpeedButton;
    btnCad: TLMDSpeedButton;
    Timer2: TTimer;
    TVFidPontos: TcxGridColumn;
    TVFidPontosTotal: TcxGridColumn;
    vgTPontos: TcxEditorRow;
    vgTPontosCli: TcxEditorRow;
    MTFidPontos: TFloatField;
    procedure cmNovoItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmCancelarClick(Sender: TObject);
    procedure cmGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure vgHCliCadEditPropertiesInitPopup(Sender: TObject);
    procedure vgHCliCadEditPropertiesCloseUp(Sender: TObject);
    procedure vgTPagTotalEditPropertiesEditValueChanged(Sender: TObject);
    procedure cmApagarItemClick(Sender: TObject);
    procedure vgTDescontoEditPropertiesEditValueChanged(Sender: TObject);
    procedure vgTDescontoPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure Timer2Timer(Sender: TObject);
    procedure btnCadClick(Sender: TObject);
    procedure btnAvulsoClick(Sender: TObject);
    procedure vgHItemChanged(Sender: TObject; AOldRow: TcxCustomRow;
      AOldCellIndex: Integer);
    procedure vgHExit(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FME : TncMovEst;
    FDadosCli : TDadosCliente;
    FNovo : Boolean;
    FRes : Boolean;
    FCliAnt: Integer;
    FDebAnt: Currency;
    FMsgDebito: Integer;
    FTipoCli: Integer;
    FShowed: Boolean;
    { Private declarations }
    procedure LoadItem(aIndex: Integer);
    procedure LoadItens;
    procedure SetTipoCli(const Value: Integer);
    function GetFidResgate: Boolean;

    property FidResgate: Boolean
      read GetFidResgate;
  public
    property TipoCli: Integer
    
      read FTipoCli write SetTipoCli;
  
    procedure MostraDebito;
    function Editar(aNovo: Boolean; aME: TncMovEst; aPodeSalvar: Boolean): Boolean;
    { Public declarations }
  end;

var                          
  FrmME: TFrmME;

implementation

uses ncaDM, ncaFrmVendaProd, ncClassesBase, ncaFrmPri, ncIDRecursos,
  ncafbPesqFor;

{$R *.dfm}

{ TFrmME }

const
  clicad = 0;
  cliavulso = 1;
  cliNenhum = 2;


procedure TFrmME.btnAvulsoClick(Sender: TObject);
begin
  TipoCli := cliAvulso;
end;

procedure TFrmME.btnCadClick(Sender: TObject);
begin
  TipoCli := clicad;
end;

procedure TFrmME.cmApagarItemClick(Sender: TObject);
var aIndex: Integer;
begin
  aIndex := TV.DataController.FocusedRecordIndex;
  if aIndex=-1 then Exit;
  TV.DataController.DeleteRecord(aIndex);
  if FidResgate then
    vgTPontos.Properties.Value := vgTPontos.Properties.Value - FME.Itens[aIndex].imFidPontos
  else begin
    vgTTotal.Properties.Value := vgTTotal.Properties.Value - 
                                 FME.Itens[aIndex].imTotal;
    vgTTotalF.Properties.Value := vgTTotal.Properties.Value - vgTDesconto.Properties.Value;
    vgTPagTotalEditPropertiesEditValueChanged(nil);
  end;
  FME.Itens[aIndex].Free;
  FME.Itens.Delete(aIndex);
  with TV.DataController do 
  if RecordCount>0 then
    if aIndex < RecordCount then
      FocusedRecordIndex := aIndex else
      FocusedRecordIndex := RecordCount-1;
end;

procedure TFrmME.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmME.cmEditarClick(Sender: TObject);
var IM: TncItemMovEst;
begin
  if TV.DataController.RecordCount=0 then Exit;
  IM := TncItemMovEst.Create;
  with TV.DataController do 
  try
    IM.AssignFrom(FME.Itens[FocusedRecordIndex]);
    if TFrmVendaProd.Create(nil).Editar(IM, False, False, True) then begin
      FME.Itens[FocusedRecordIndex].AssignFrom(IM);
      LoadItem(FocusedRecordIndex);
      if not FidResgate then begin
        vgTTotalF.Properties.Value := vgTTotal.Properties.Value - vgTDesconto.Properties.Value;
        vgTPagTotalEditPropertiesEditValueChanged(nil);
      end else begin
        
      end;
    end;
  finally
    IM.Free;
  end;
end;

procedure TFrmME.cmGravarClick(Sender: TObject);
var Debitar: Currency;
begin
  vgH.DataController.PostEditingData;
  vgT.HideEdit;
  if FidResgate then begin
    FME.Total := 0;
    FME.Desconto := 0;
    FME.Pago := 0;
    if FME.Cliente>0 then
    
  end else begin
    FME.Total    := vgTTotal.Properties.Value;
    FME.Desconto := vgTDesconto.Properties.Value;
    FME.Pago     := vgTPago.Properties.Value;
  end;
  FME.Obs      := MTObs.Value;
  FME.Recibo   := cbRecibo.Checked;
  if TipoCli=cliAvulso then begin
    FME.NomeCliente := MTNomeAvulso.Value;
    FME.Cliente := 0;
  end;
  
  if FME.Itens.Count=0 then
    Raise ENexCafe.Create('É necessário haver itens para salvar');

  if not FME.FidResgate then begin
    if FME.Desconto-FME.Total > 0.001 then
      Raise ENexCafe.Create('Desconto não pode ser maior que o valor total');

    if FME.Desconto-FME.Total > 0.001 then
      Raise ENexCafe.Create('Desconto não pode ser maior que o valor total');

    if (FME.Pago - (FME.Total - FME.Desconto)) > 0.001 then
      Raise ENexCafe.Create('Valor pago não pode ser maior que o total final');
  end else begin
    if btnAvulso.Pressed then
      raise ENexCafe.Create('É necessário informar o cliente');
      
    if vgTPontos.Properties.Value>vgTPontosCli.Properties.Value then
      raise ENexCafe.Create('Cliente não possui quantidade de pontos suficiente');
  end;
    
  with Dados do   
  if (FME.Tipo=trEstVenda) and (FME.ValorDebitado>0.009) then begin
    if FME.Cliente <> FCliAnt then FDebAnt := 0;
    Debitar := FME.ValorDebitado - FDebAnt;
  
    if (FME.ValorDebitado>0.009) then begin
      if (FME.Cliente=0) then
        Raise ENexCafe.Create('Para ficar em débito é necessário selecionar um cliente');
      if Debitar > 0.009 then begin
        tbCli.Locate('ID', FME.Cliente, []);
        if LimiteDebito(tbCliLimiteDebito)<(Debitar+tbCliDebito.Value) then
          Raise ENexCafe.Create('O limite máximo de débito permitido para esse cliente foi ultrapassado');
      end;
    end;
  end;

  
  if (FME.Tipo=trEstVenda) and (not FidResgate) then
    FME.SalvaDescPago;

  FME.SalvaTipoTran;
    
  Close;
  FRes := True;
end;

procedure TFrmME.cmNovoItemClick(Sender: TObject);
var IM: TncItemMovEst;
begin
  IM := TncItemMovEst.Create;
  try
    IM.imTipoTran := FME.Tipo;
    IM.imFidResgate := FidResgate;
    if TFrmVendaProd.Create(nil).Editar(IM, True, False, True) then begin
      TV.DataController.AppendRecord;
      FME.Itens.NewItem.AssignFrom(IM);
      LoadItem(FME.Itens.Count-1);
      vgTTotalF.Properties.Value := vgTTotal.Properties.Value - vgTDesconto.Properties.Value;
      vgTPagTotalEditPropertiesEditValueChanged(nil);
      Grid.SetFocus;
      TV.DataController.FocusedRecordIndex := FME.Itens.Count-1;
      vgT.HideEdit;
    end;
  finally
    IM.Free;
  end;
end;

function TFrmME.Editar(aNovo: Boolean; aME: TncMovEst;
  aPodeSalvar: Boolean): Boolean;
begin
  FME := aME;
  FNovo := aNovo;

  if FidResgate then begin
    TVUnitario.Visible := False;
    TVTotal.Visible := False;
    TVFidPontos.Visible := True;
    TVFidPontosTotal.Visible := True;
        
    vgTTotal.Visible := False;
    vgTDesconto.Visible := False;
    vgTTotalF.Visible := False;
    vgTPagTotal.Visible := False;
    vgTPago.Visible := False;
    vgTPontos.Visible := True;
    vgTPontosCli.Visible := True;
  end;

  with Dados.CM.Config do begin
    if (RecImprimir>0) and (FME.Tipo=trEstVenda) then
      cmRecibo.Visible := ivAlways else
      cmRecibo.Visible := ivNever;

    cbRecibo.Checked := (RecImprimir=2) and (aNovo) and (FME.Tipo=trEstVenda);  
  end;
  
  cmGravar.Enabled := aPodeSalvar and (aNovo or Permitido(daTraAlterar));
  panH1.Visible := True;
  panHsep.Visible := panH1.Visible;
  case FME.Tipo of
    trEstVenda   : 
      if not FidResgate then 
        Caption := 'Venda Avulsa' else
        Caption := 'Resgate de produto do programa de pontos/fidelidade';
    trEstCompra  : begin
      Caption := 'Compra';
      lbTipo.Caption := 'Tipo Fornecedor:';
      vgHCliCad.Properties.Caption := 'Fornecedor';
      vgHAvulso.Properties.Caption := 'Fornecedor';
    end;
    trEstSaida   : begin
      Caption := 'Ajuste de Estoque - SAIDA';
      lbTipo.Caption := 'Tipo Fornecedor:';
      vgHCliCad.Properties.Caption := 'Fornecedor';
      vgHAvulso.Properties.Caption := 'Fornecedor';
    end;
    trEstEntrada : begin
      lbTipo.Caption := 'Tipo Fornecedor:';
      vgHCliCad.Properties.Caption := 'Fornecedor';
      vgHAvulso.Properties.Caption := 'Fornecedor';
      Caption := 'Ajuste de Estoque - ENTRADA';
    end;
  end;
  panTotais.Visible := (FME.Tipo in [trEstVenda, trEstCompra]);
  if FME.Tipo=trEstCompra then begin
    vgTTotal.Visible := False;
    vgTDesconto.Visible := False;
    vgTPagTotal.Visible := False;
    vgTPago.Visible := False;
    panTotais.Height := 34;
  end;
  vgHCliCad.Visible := True;
  TVUnitario.Visible := (not FidResgate) and panTotais.Visible;
  TVTotal.Visible := (not FidResgate) and panTotais.Visible;
  if aNovo then
    vgTPagTotal.Properties.Value := Dados.CM.Config.PgVendaAvulsa else
    vgTPagTotal.Properties.Value := (((FME.Total - FME.Desconto) - FME.Pago) < 0.01);
  vgTDesconto.Properties.Value := FME.Desconto;
  vgTPago.Properties.Value := FME.Pago;
  if not aNovo then LoadItens;
  ShowModal;
  Result := FRes;
end;

procedure TFrmME.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmME.FormCreate(Sender: TObject);
begin
  FShowed := False;
  FTipoCli := -1;
  FMsgDebito := -1;
  
  FCliAnt:= 0;
  FDebAnt:= 0;

  FRes := False;
  MT.Active := True;
  MT.Insert;
  FDadosCli.dcCodigo := 0;
  FDadosCli.dcNome := '';
end;

procedure TFrmME.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmME.FormShow(Sender: TObject);
begin
  if not FNovo then
  FCliAnt := FME.Cliente;
  FDebAnt := FME.ValorDebitado;
  MTCliente.Value := FME.Cliente;
  MTNomeAvulso.Value := FME.NomeCliente;
  MTObs.Value := FME.Obs;

  vgTPontosCli.Properties.Value := MTFidPontos.Value;
  
  if (FME.Tipo = trEstVenda) and (MTCliente.Value>0) then 
    TipoCli := clicad
  else
  if FME.Tipo in [trEstSaida, trEstEntrada] then
    TipoCli := cliNenhum else
    TipoCli := cliAvulso;

  FShowed := True;

  if FNovo then
  if MTCliente.Value>0 then
    TipoCli := clicad 
  else
  if FME.Tipo in [trEstSaida, trEstEntrada] then
    TipoCli := cliNenhum else
    TipoCli := cliAvulso;
    
  vgT.HideEdit;
  vgT.ShowEdit;
  if (Screen.Width=640) then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
end;

function TFrmME.GetFidResgate: Boolean;
begin
  Result := FME.FidResgate;
end;

procedure TFrmME.LoadItem(aIndex: Integer);
var V: Variant;
begin
  with TV.DataController, Dados, FME.Itens[aIndex] do begin
    if not (MT.State in [dsEdit, dsInsert]) then MT.Edit;
    if not FidResgate then begin
      V := Values[aIndex, TVTotal.Index];
      if V<>null then
        vgTTotal.Properties.Value := vgTTotal.Properties.Value - V;
      vgTTotal.Properties.Value := vgTTotal.Properties.Value + imTotal;
    end else begin
      V := Values[aIndex, TVFidPontosTotal.Index];
      if V<>null then
        vgTPontos.Properties.Value := vgTPontos.Properties.Value - V;
      vgTPontos.Properties.Value := vgTPontos.Properties.Value + imFidPontos;
    end;      
    Values[aIndex, 0] := tbPro.Lookup('ID', imProduto, 'Codigo');
    Values[aIndex, 1] := tbPro.Lookup('ID', imProduto, 'Descricao');
    if FidResgate then begin
      Values[aIndex, TVFidPontos.Index] := Trunc(imFidPontos / imQuant);
      Values[aIndex, TVFidPontosTotal.Index] := imFidPontos;
      Values[aIndex, TVUnitario.Index] := 0;
      Values[aIndex, TVTotal.Index] := 0;
    end else begin
      Values[aIndex, TVUnitario.Index] := imUnitario;
      Values[aIndex, TVTotal.Index] := imTotal;
      Values[aIndex, TVFidPontos.Index] := 0;
      Values[aIndex, TVFidPontosTotal.Index] := 0;
    end;
    Values[aIndex, TVQuant.Index] := imQuant;
  end;
end;

procedure TFrmME.LoadItens;
var I : Integer;
begin
  for I := 0 to FME.Itens.Count - 1 do begin
    TV.DataController.AppendRecord;
    LoadItem(I);
  end;
  vgTTotalF.Properties.Value := vgTTotal.Properties.Value - vgTDesconto.Properties.Value;
end;

procedure TFrmME.MostraDebito;
begin
  vgTPontosCli.Properties.Value := MTFidPontos.Value;
  if gConfig.NaoMostrarMsgDebito then Exit;
  vgHDebitoCli.Visible := (mtDebito.Value > 0.009) and (TipoCli=cliCad);
  if (FMsgDebito<>mtCliente.Value) and (mtDebito.Value > 0.009) and (TipoCli=cliCad) then begin
    Beep;
    ShowMessage('Cliente possui débito de ' + FloatToStrF(mtDebito.Value, ffCurrency, 10, 2));
  end;
  FMsgDebito := mtCliente.Value;
end;

procedure TFrmME.SetTipoCli(const Value: Integer);
begin
  if Value=FTipoCli then Exit;
  if MT.State<>dsEdit then
    MT.Edit;
  FTipoCli := Value;
  case FTipoCli of
    clicad : begin  
      btnCad.Down := True;
      if FShowed then vgHObs.Focused := True;
      vgHAvulso.Visible := False;
      vgHCliCad.Visible := True;
      if FShowed then vgHCliCad.Focused := True;  
      if FShowed and not vgH.Focused then vgH.SetFocus;
      if FShowed then Timer2.Enabled := True;
    end;
    cliAvulso : begin
      btnAvulso.Down := True;
      vgHCliCad.Visible := False;
      vgHAvulso.Visible := True;
      MTCliente.Clear;
      MTNomeCliente.Clear;
      FDadosCli.dcCodigo := 0;
      FDadosCli.dcNome := '';
      FME.Cliente := 0;
      vgH.FocusedRow := vgHObs;
      vgH.FocusedRow := vgHAvulso;
    end;
    cliNenhum : begin
      vgHCliCad.Visible := False;
      vgHAvulso.Visible := False;
      vgH.FocusedRow := vgHObs;
    end;
  end;
end;

procedure TFrmME.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  TcxCustomDropDownEdit(vgH.InplaceEditor).DroppedDown := True;
end;

procedure TFrmME.vgHCliCadEditPropertiesCloseUp(Sender: TObject);
begin
  if MT.State<>dsEdit then MT.Edit;
  mtCliente.Value := FDadosCli.dcCodigo;
  FME.Cliente := mtCliente.Value;
  TcxCustomDropDownEdit(Sender).Text := FDadosCli.dcNome;
  MostraDebito;
end;

procedure TFrmME.vgHCliCadEditPropertiesInitPopup(Sender: TObject);
begin
  FDadosCli.dcCodigo := mtCliente.Value;
  FDadosCli.dcNome   := mtNomeCliente.Value;
  if FME.Tipo=trEstVenda then begin
    TcxPopupEdit(Sender).Properties.PopupControl := fbPesqCli;
    fbPesqCli.PreparaBusca(@FDadosCli, TcxCustomDropDownEdit(Sender));
  end else begin
    TcxPopupEdit(Sender).Properties.PopupControl := fbPesqFor;
    fbPesqFor.PreparaBusca(@FDadosCli, TcxCustomDropDownEdit(Sender));
  end;
end;

procedure TFrmME.vgHExit(Sender: TObject);
begin
  MostraDebito;
end;

procedure TFrmME.vgHItemChanged(Sender: TObject; AOldRow: TcxCustomRow;
  AOldCellIndex: Integer);
begin
  MostraDebito;
end;

procedure TFrmME.vgTDescontoEditPropertiesEditValueChanged(Sender: TObject);
begin
  vgTTotalF.Properties.Value := vgTTotal.Properties.Value - vgTDesconto.Properties.Value;
  if vgTPagTotal.Properties.Value=True then
    vgTPago.Properties.Value := vgTTotalF.Properties.Value 
  else
  if vgTPago.Properties.Value > vgTTotalF.Properties.Value then
    vgTPago.Properties.Value := vgTTotalF.Properties.Value;
end;

procedure TFrmME.vgTDescontoPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daTraDesconto);
end;

procedure TFrmME.vgTPagTotalEditPropertiesEditValueChanged(Sender: TObject);
begin
  if vgTPagTotal.Properties.Value=True then
    vgTPago.Properties.Value := vgTTotalF.Properties.Value else
    vgTPago.Properties.Value := 0;
end;

end.
