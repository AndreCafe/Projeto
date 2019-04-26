unit ncaFrmME;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
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
  cxLabel;

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

uses ncaDM, ncaFrmVendaProd, ncClassesBase, ncaFrmPri, ncIDRecursos;

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
  vgTTotal.Properties.Value := vgTTotal.Properties.Value - 
                               FME.Itens[aIndex].imTotal;
  vgTTotalF.Properties.Value := vgTTotal.Properties.Value - vgTDesconto.Properties.Value;
  vgTPagTotalEditPropertiesEditValueChanged(nil);
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
      vgTTotalF.Properties.Value := vgTTotal.Properties.Value - vgTDesconto.Properties.Value;
      vgTPagTotalEditPropertiesEditValueChanged(nil);
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
  FME.Total    := vgTTotal.Properties.Value;
  FME.Desconto := vgTDesconto.Properties.Value;
  FME.Pago     := vgTPago.Properties.Value;
  FME.Obs      := MTObs.Value;
  FME.Recibo   := cbRecibo.Checked;
  if TipoCli=cliAvulso then begin
    FME.NomeCliente := MTNomeAvulso.Value;
    FME.Cliente := 0;
  end;
  
  if FME.Itens.Count=0 then
    Raise Exception.Create('É necessário haver itens para salvar');

  if FME.Desconto-FME.Total > 0.001 then
    Raise Exception.Create('Desconto não pode ser maior que o valor total');

  if FME.Desconto-FME.Total > 0.001 then
    Raise Exception.Create('Desconto não pode ser maior que o valor total');

  if (FME.Pago - (FME.Total - FME.Desconto)) > 0.001 then
    Raise Exception.Create('Valor pago não pode ser maior que o total final');
    
  with Dados do   
  if (FME.Tipo=trEstVenda) and (FME.ValorDebitado>0.009) then begin
    if FME.Cliente <> FCliAnt then FDebAnt := 0;
    Debitar := FME.ValorDebitado - FDebAnt;
  
    if (FME.ValorDebitado>0.009) then begin
      if (FME.Cliente=0) then
        Raise Exception.Create('Para ficar em débito é necessário selecionar um cliente');
      if Debitar > 0.009 then begin
        tbCli.Locate('ID', FME.Cliente, []);
        if LimiteDebito(tbCliLimiteDebito)<(Debitar+tbCliDebito.Value) then
          Raise Exception.Create('O limite máximo de débito permitido para esse cliente foi ultrapassado');
      end;
    end;
  end;

  
  if FME.Tipo=trEstVenda then
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

  with Dados.CM.Config do begin
    if (RecImprimir>0) and (FME.Tipo=trEstVenda) then
      cmRecibo.Visible := ivAlways else
      cmRecibo.Visible := ivNever;

    cbRecibo.Checked := (RecImprimir=2) and (aNovo) and (FME.Tipo=trEstVenda);  
  end;
  
  cmGravar.Enabled := aPodeSalvar;
  panH1.Visible := (FME.Tipo  in [trEstVenda, trEstCompra]);
  panHsep.Visible := panH1.Visible;
  case FME.Tipo of
    trEstVenda   : Caption := 'Venda Avulsa';
    trEstCompra  : begin
      Caption := 'Compra';
      lbTipo.Caption := 'Tipo Fornecedor:';
      vgHCliCad.Properties.Caption := 'Fornecedor';
      vgHAvulso.Properties.Caption := 'Fornecedor';
    end;
    trEstSaida   : Caption := 'Ajuste de Estoque - SAIDA';
    trEstEntrada : Caption := 'Ajuste de Estoque - ENTRADA';   
  end;
  panTotais.Visible := (FME.Tipo in [trEstVenda, trEstCompra]);
  if FME.Tipo=trEstCompra then begin
    vgTTotal.Visible := False;
    vgTDesconto.Visible := False;
    vgTPagTotal.Visible := False;
    vgTPago.Visible := False;
    panTotais.Height := 34;
  end;
  vgHCliCad.Visible := (FME.Tipo = trEstVenda);
  TVUnitario.Visible := panTotais.Visible;
  TVTotal.Visible := panTotais.Visible;
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

procedure TFrmME.FormShow(Sender: TObject);
begin
  if not FNovo then
  FCliAnt := FME.Cliente;
  FDebAnt := FME.ValorDebitado;
  MTCliente.Value := FME.Cliente;
  MTNomeAvulso.Value := FME.NomeCliente;
  MTObs.Value := FME.Obs;
  
  if MTCliente.Value>0 then
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

procedure TFrmME.LoadItem(aIndex: Integer);
var V: Variant;
begin
  with TV.DataController, Dados, FME.Itens[aIndex] do begin
    V := Values[aIndex, 4];
    if not (MT.State in [dsEdit, dsInsert]) then MT.Edit;
    if V<>null then
      vgTTotal.Properties.Value := vgTTotal.Properties.Value - V;
    vgTTotal.Properties.Value := vgTTotal.Properties.Value + imTotal;
    Values[aIndex, 0] := tbPro.Lookup('ID', imProduto, 'Codigo');
    Values[aIndex, 1] := tbPro.Lookup('ID', imProduto, 'Descricao');
    Values[aIndex, 2] := imUnitario;       
    Values[aIndex, 3] := imQuant;
    Values[aIndex, 4] := imTotal;
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
  fbPesqCli.PreparaBusca(@FDadosCli, TcxCustomDropDownEdit(Sender));
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
    vgTPago.Properties.Value := vgTTotalF.Properties.Value else
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
