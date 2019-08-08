unit ncaFrmVenda;
{
    ResourceString: Dario 11/03/13
}

interface

{$I nex.inc}

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
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  cxLabel, cxSpinEdit, cxLookAndFeels, cxLookAndFeelPainters,
  LMDCustomScrollBox, LMDScrollBox, cxPC, cxPCdxBarPopupMenu, ncaFrmTotal,
  cxLookupEdit, cxDBLookupEdit, Menus, StdCtrls, cxButtons, ncaFrmCli,
  ncClassesBase, cxNavigator, dxBarBuiltInMenu;

type
  TFrmVenda = class(TForm)
    panCli: TLMDSimplePanel;
    BarMgr: TdxBarManager;
    cmApagarItem: TdxBarButton;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cmRecibo: TdxBarControlContainerItem;
    panTot: TLMDSimplePanel;
    cbRecibo: TcxCheckBox;
    tPro: TnxTable;
    tProID: TAutoIncField;
    tProCodigo: TStringField;
    tProDescricao: TStringField;
    tProUnid: TStringField;
    tProPreco: TCurrencyField;
    DataSource1: TDataSource;
    tProPodeAlterarPreco: TBooleanField;
    Timer1: TTimer;
    tProEstoqueAtual: TFloatField;
    tProplus: TBooleanField;
    tProFidPontos: TIntegerField;
    panLista: TLMDSimplePanel;
    Grid: TcxGrid;
    TV: TcxGridTableView;
    TVCodigo: TcxGridColumn;
    TVDescr: TcxGridColumn;
    TVQuant: TcxGridColumn;
    TVvezes: TcxGridColumn;
    TVUnitario: TcxGridColumn;
    TVFidPontos: TcxGridColumn;
    TVIgual: TcxGridColumn;
    TVTotal: TcxGridColumn;
    TVFidPontosTotal: TcxGridColumn;
    GL: TcxGridLevel;
    panDivBuscaLista: TLMDSimplePanel;
    panBuscaProd: TLMDSimplePanel;
    panBuscaTop: TLMDSimplePanel;
    panProd: TLMDSimplePanel;
    panRB: TLMDSimplePanel;
    rgCodigo: TcxRadioButton;
    rgDescr: TcxRadioButton;
    pgProd: TcxPageControl;
    tsBuscarCod: TcxTabSheet;
    edCod: TcxTextEdit;
    tsDescr: TcxTabSheet;
    edDescr: TcxLookupComboBox;
    panQtd: TLMDSimplePanel;
    edQtd: TcxCurrencyEdit;
    cxLabel1: TcxLabel;
    lbUnit: TcxLabel;
    edUnit: TcxCurrencyEdit;
    panAdd: TLMDSimplePanel;
    btnLancar: TcxButton;
    panDetalhes: TLMDSimplePanel;
    lbNomeProd: TcxLabel;
    panEstoque: TLMDSimplePanel;
    cxLabel2: TcxLabel;
    lbQuant: TcxLabel;
    panPreco: TLMDSimplePanel;
    cxLabel3: TcxLabel;
    lbPreco: TcxLabel;
    panRemover: TLMDSimplePanel;
    bdcLista: TdxBarDockControl;
    tProCustoUnitario: TCurrencyField;
    tProCadastroRapido: TBooleanField;
    tProCategoria: TStringField;
    dxBarLargeButton1: TdxBarLargeButton;
    tProObs: TnxMemoField;
    tProImagem: TGraphicField;
    tProFornecedor: TIntegerField;
    tProSubCateg: TStringField;
    tProEstoqueACE: TFloatField;
    tProEstoqueACS: TFloatField;
    tProNaoControlaEstoque: TBooleanField;
    tProEstoqueMin: TFloatField;
    tProEstoqueMax: TFloatField;
    tProAbaixoMin: TBooleanField;
    tProAbaixoMinDesde: TDateTimeField;
    tProEstoqueRepor: TFloatField;
    tProplusURL: TnxMemoField;
    tProplusCodParceiro: TStringField;
    tProplusCodProduto: TStringField;
    tProAtivo: TBooleanField;
    tProFidelidade: TBooleanField;
    tPromd5Imagem: TStringField;
    tProlastProdModif: TDateTimeField;
    tProuploadR: TWordField;
    tProuploadS: TWordField;
    tProfk_produ: TIntegerField;
    tProbatchUID: TGuidField;
    tProIncluidoEm: TDateTimeField;
    lbUnidade: TcxLabel;
    tProPermiteVendaFracionada: TBooleanField;
    cmConfig: TdxBarLargeButton;
    tCodR: TnxTable;
    dxBarStatic1: TdxBarStatic;
    dxBarSubItem1: TdxBarSubItem;
    cxStyle5: TcxStyle;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmCancelarClick(Sender: TObject);
    procedure cmGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmApagarItemClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edProdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgCodigoClick(Sender: TObject);
    procedure rgDescrClick(Sender: TObject);
    procedure edDescrPropertiesPopup(Sender: TObject);
    procedure edDescrPropertiesCloseUp(Sender: TObject);
    procedure edDescrEnter(Sender: TObject);
    procedure btnLancarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cxLabel1Click(Sender: TObject);
    procedure TVvezesGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVIgualGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edUnitKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridEnter(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure edCodPropertiesChange(Sender: TObject);
    procedure edCodPropertiesEditValueChanged(Sender: TObject);
    procedure edQtdPropertiesChange(Sender: TObject);
    procedure edQtdPropertiesEditValueChanged(Sender: TObject);
    procedure TVQuantGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVDataControllerBeforeDelete(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
    procedure TVDataControllerAfterDelete(
      ADataController: TcxCustomDataController);
    procedure edDescrPropertiesEditValueChanged(Sender: TObject);
    procedure TVCustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure edQtdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cmConfigClick(Sender: TObject);
    procedure edCodKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edDescrKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FME       : TncMovEst;
    FDadosCli : TDadosCliente;
    FNovo     : Boolean;
    FRes      : Boolean;
    FIDProd   : Integer;
    FCliAnt   : Integer;
    FDebAnt   : Currency;
    FMsgDebito: Integer;
    FTipoCli  : Integer;
    FShowed   : Boolean;
    FTot      : TFrmTotal;
    FCli      : TFrmCli;
    FCanClose : Boolean;
    FCodStr   : String;
    FCodRepetido : Boolean;
    //FMostrarUnit : Boolean;  agora sempre mostrará o preço unitário
    FLastCod     : Integer;
    FTamanho     : byte;
    { Private declarations }
    procedure _Lancar;
    procedure LoadItem(aIndex: Integer);
    procedure LoadItens;
    function GetFidResgate: Boolean;
    procedure SetIDProd(const Value: Integer);
    procedure SetCodStr(Value: String);

    property IDProd: Integer
      read FIDProd write SetIDProd;

    property CodStr: String
      read FCodStr write SetCodStr;  

    procedure AtualizaDetalhes;

    procedure AjustaOrdem(aSalvaOrdem: Boolean = False);

    procedure OnTimerCanClose(Sender: TObject);
    //procedure SetMostrarUnit(const Value: Boolean);
    procedure SetTamanho(Value: byte);

    //property MostrarUnit: Boolean
    //  read FMostrarUnit write SetMostrarUnit;

    property FidResgate: Boolean
      read GetFidResgate;
  public
    property Tamanho     : byte read FTamanho write SetTamanho;
    function Editar(aNovo: Boolean; aME: TncMovEst; aPodeSalvar: Boolean; aTamanho: Byte = tamTelaNormal): Boolean;
    { Public declarations }
  end;

  TMeuLookup = class ( TcxCustomLookupEdit );

  TMeuLookupData = class ( TcxCustomLookupEditLookupData );

var                          
  FrmVenda: TFrmVenda;

implementation

uses
  ncaDM,
  ncaFrmVendaProd,
  ncaFrmPri,
  ncIDRecursos,
  ncafbPesqFor,
  ncaFrmConfigChoiceME,
  ncaFrmQuickCadProduto,
  ncaFrmEscolhaProdDup, ncaFrmConfigVendaProdSemSaldo, ncaFrmOpcoes,
  ncaFrmConfigQuickCad, ufmImagens;

// START resource string wizard section
resourcestring
  SOpçõesParaVendas = 'Opções para Vendas';
  SÉNecessárioHaverItensParaSalvar = 'É necessário haver itens para salvar';
  SDescontoNãoPodeSerMaiorQueOValor = 'Desconto não pode ser maior que o valor total';
  SValorPagoNãoPodeSerMaiorQueOTota = 'Valor pago não pode ser maior que o total final';
  SÉNecessárioInformarOCliente = 'É necessário informar o cliente';
  SClienteNãoPossuiQuantidadeDePont = 'Cliente não possui quantidade de pontos suficiente';
  SParaFicarEmDébitoéNecessárioSele = 'Para ficar em débito é necessário selecionar um cliente';
  SOLimiteMáximoDeDébitoPermitidoPa = 'O limite máximo de débito permitido para esse cliente foi ultrapassado';
  SEsteProdutoNãoPermiteASuaVendaFr = 'Este produto não permite a sua venda fracionada!';
  SVenda = 'Venda';
  SResgateDeProdutoDoProgramaDePont = 'Resgate de produto do programa de pontos/fidelidade';
  SCompra = 'Compra';
  SAjusteDeEstoqueSAÍDA = 'Ajuste de Estoque - SAÍDA';
  SAjusteDeEstoqueENTRADA = 'Ajuste de Estoque - ENTRADA';

// END resource string wizard section


{$R *.dfm}

{ TFrmME }

procedure TFrmVenda.AjustaOrdem(aSalvaOrdem: Boolean);
begin
  if rgCodigo.Checked then 
    slConfig.Values['OrdemProd'] := '1' else  // do not localize
    slConfig.Values['OrdemProd'] := '0'; // do not localize
  if aSalvaOrdem then SaveConfig;
end;

procedure TFrmVenda.AtualizaDetalhes;
begin
  panDetalhes.Visible := (IDProd>0);
  if IDProd>0 then begin
    lbNomeProd.Caption := tProDescricao.Value;
    if FME.Tipo=trEstEntrada then 
      edUnit.Value := tProCustoUnitario.Value;
    lbUnidade.caption := tProUnid.value;
    lbQuant.Caption := FloatToStr(Int(tProEstoqueAtual.Value*1000)/1000);
    lbPreco.Caption := FloatToStrF(tProPreco.Value, ffCurrency, 10, 2);
    lbNomeProd.Left := 0;
    lbNomeProd.Visible := (pgProd.ActivePageIndex=0);
  end else begin
    edUnit.Value := 0;
    lbUnidade.Caption := '';
    btnLancar.Enabled := False;
  end;
end;

procedure TFrmVenda.cmApagarItemClick(Sender: TObject);
var aIndex: Integer;
begin
  aIndex := TV.DataController.FocusedRecordIndex;
  if aIndex=-1 then Exit;
  TV.DataController.DeleteRecord(aIndex);
  if FidResgate then
    FTot.PontosNec := FTot.PontosNec - FME.Itens[aIndex].imFidPontos else 
    FTot.SubTotal := FTot.SubTotal - FME.Itens[aIndex].imTotal;
    
  FME.Itens[aIndex].Free;
  FME.Itens.Delete(aIndex);
  with TV.DataController do 
  if RecordCount>0 then begin
    cmApagarItem.Enabled := True;
    if aIndex < RecordCount then
      FocusedRecordIndex := aIndex else
      FocusedRecordIndex := RecordCount-1;
  end else begin
    cmApagarItem.Enabled := False;
    if pgProd.ActivePageIndex=0 then
      edCod.SetFocus else
      edDescr.SetFocus;
  end;
end;

procedure TFrmVenda.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmVenda.cmConfigClick(Sender: TObject);
begin
  TFrmOpcoes.Create(Self).Editar(SOpçõesParaVendas, [{$ifdef Loja}TFrmConfigQuickCad,{$endif} TFrmConfigVendaProdSemSaldo]);
end;

procedure TFrmVenda.cmGravarClick(Sender: TObject);
var Debitar: Currency;
begin
  {$ifdef LOJA}
  if not PremiumOk then Exit;
  {$endif}

  Ftot.CheckEspecie;


  if FidResgate then begin
    FME.Total := 0;
    FME.Desconto := 0;
    FME.Pago := 0;
  end else begin
    FME.Total    := FTot.SubTotal;
    FME.Desconto := FTot.Desconto;
    FME.Pago     := FTot.Pago;
  end;

  FME.Obs      := FTot.Obs;
  FME.Recibo   := cbRecibo.Checked;
  FME.NomeCliente := FCli.Nome;
  FME.Cliente := FCli.Codigo;

  if FME.Itens.Count=0 then
    Raise ENexCafe.Create(SÉNecessárioHaverItensParaSalvar);

  if not FME.FidResgate then begin
    if FME.Desconto-FME.Total > 0.001 then
      Raise ENexCafe.Create(SDescontoNãoPodeSerMaiorQueOValor);

    if FME.Desconto-FME.Total > 0.001 then
      Raise ENexCafe.Create(SDescontoNãoPodeSerMaiorQueOValor);

    if (FME.Pago - (FME.Total - FME.Desconto)) > 0.001 then
      Raise ENexCafe.Create(SValorPagoNãoPodeSerMaiorQueOTota);
  end else begin
    if FCli.Codigo=0 then
      raise ENexCafe.Create(SÉNecessárioInformarOCliente);

    if FTot.PontosNec>FCli.FidPontos then
      raise ENexCafe.Create(SClienteNãoPossuiQuantidadeDePont);
  end;

  with Dados do
  if (FME.Tipo=trEstVenda) and (FME.ValorDebitado>0.009) then begin
    if FME.Cliente <> FCliAnt then FDebAnt := 0;
    Debitar := FME.ValorDebitado - FDebAnt;

    if (FME.ValorDebitado>0.009) then begin
      if (FME.Cliente=0) then
        Raise ENexCafe.Create(SParaFicarEmDébitoéNecessárioSele);
      if Debitar > 0.009 then begin
        tbCli.Locate('ID', FME.Cliente, []); // do not localize
        if LimiteDebito(tbCliLimiteDebito)<(Debitar+tbCliDebito.Value) then
          Raise ENexCafe.Create(SOLimiteMáximoDeDébitoPermitidoPa);
      end;
    end;
  end;

  if (FME.Tipo=trEstVenda) and (not FidResgate) then
    FME.SalvaDescPago;

  FME.SalvaTipoTran;

  FRes := True;

  Close;
end;

procedure TFrmVenda.btnLancarClick(Sender: TObject);
var IM: TncItemMovEst;
begin
  if not(tProPermiteVendaFracionada.value) and (frac(edQtd.Value)>0) then begin
      edQtd.Value := trunc(edQtd.Value);
      edQtd.SelectAll;
      edQtd.SetFocus;
      Raise ENexCafe.Create(SEsteProdutoNãoPermiteASuaVendaFr);
  end;

  IM := TncItemMovEst.Create(nil);
  try
    IM.imTipoTran := FME.Tipo;
    IM.imFidResgate := FidResgate;
    IM.imProduto := tProID.Value;
    IM.imQuant := edQtd.Value;
    if FidResgate then
      IM.imFidPontos := tProFidPontos.Value * IM.imQuant
    else begin
      if FME.Tipo in [trEstVenda, trEstCompra] then begin
        IM.imUnitario := edUnit.Value;
        IM.imTotal := edQtd.Value * edUnit.Value;
      end;
      IM.imFidPontos := 0;
    end;
    
    TV.DataController.AppendRecord;
    FME.Itens.NewItem.AssignFrom(IM);
    LoadItem(FME.Itens.Count-1);
    TV.DataController.GotoLast;
    if pgProd.ActivePageIndex=0 then begin
      edCod.Text := '';
      edCod.SetFocus;
    end else begin
      edDescr.EditValue := '';
      edDescr.SetFocus;
    end;
    IDProd := 0;
    edQtd.Value := 1;
    
    //MostrarUnit := (FME.Tipo=trEstCompra);
  finally
    IM.Free;
  end;
end;

procedure TFrmVenda.cxLabel1Click(Sender: TObject);
begin
  edQtd.SetFocus;
end;

procedure TFrmVenda.rgCodigoClick(Sender: TObject);
begin
  pgProd.ActivePageIndex := 0;
  edCod.Clear;
  panDetalhes.Visible := False;
  edCod.SetFocus;
  AjustaOrdem(True);
end;

procedure TFrmVenda.rgDescrClick(Sender: TObject);
begin
  pgProd.ActivePageIndex := 1;
  edDescr.Clear;
  panDetalhes.Visible := False;
  edDescr.SetFocus;
  AjustaOrdem(True);
end;

function TFrmVenda.Editar(aNovo: Boolean; aME: TncMovEst;
  aPodeSalvar: Boolean; aTamanho: Byte = tamTelaNormal): Boolean;
var
  Func : String;
  TC : Byte;
  U : TncUsuario;
begin
  FME := aME;
  FNovo := aNovo;
  Tamanho := aTamanho;

  if FidResgate then begin
    FTot.InitPontos(0, 0, aME.Obs, panTot);
    TVUnitario.Visible := False;
    TVTotal.Visible := False;
    TVIgual.Visible := False;
    TVvezes.Visible := False;
    TVFidPontos.Visible := True;
    TVFidPontosTotal.Visible := True;
    tPro.Filter := '(plus<>true) and (fidpontos>0)'; // do not localize
  end else
  if aME.Tipo=trEstVenda then
    FTot.InitVal(aME.PagEsp, 0, aME.Desconto, aME.Pago, 0, aME.Obs, panTot)
  else begin
    FTot.InitCusto(0, aME.Obs, panTot);
    FTot.pgValPontos.Visible := (aME.Tipo=trEstCompra);
  end;

  with Dados.CM.Config do begin
    if (RecImprimir>0) and (FME.Tipo=trEstVenda) then
      cmRecibo.Visible := ivAlways else
      cmRecibo.Visible := ivNever;

    cbRecibo.Checked := (RecImprimir=2) and (aNovo) and (FME.Tipo=trEstVenda);  
  end;

  if aNovo then begin
    TC := 1;
    Func := Dados.CM.UA.Nome;
    if Trim(Func)='' then
      Func := Dados.CM.UA.Username;
  end else begin
    if FME.Cliente>0 then
      TC := 0 else
      TC := 1;
    U := Dados.CM.Usuarios.PorUsername[FME.Func];
    if U=nil then 
      Func := '' 
    else begin
      Func := U.Nome;
      if Trim(Func)='' then
        Func := U.Username;
    end;
  end;

  cmGravar.Enabled := aPodeSalvar and (aNovo or Permitido(daTraAlterar));
  FCli.Init((FME.Tipo=trEstCompra), False, FME.Cliente, FME.NomeCliente, Func, TC, panCli);
  case FME.Tipo of
    trEstVenda   : 
      if not FidResgate then 
        Caption := SVenda else
        Caption := SResgateDeProdutoDoProgramaDePont;
    trEstCompra  : Caption := SCompra;
    trEstSaida   : Caption := SAjusteDeEstoqueSAÍDA;
    trEstEntrada : Caption := SAjusteDeEstoqueENTRADA;
  end;
  TVUnitario.Visible := (not FidResgate) and (FME.Tipo in [trEstVenda, trEstCompra]);
  TVTotal.Visible := (not FidResgate) and (FME.Tipo in [trEstVenda, trEstCompra]);
  panCli.Visible := FidResgate or TVUnitario.Visible;
  TVIgual.Visible := TVTotal.Visible;
  TVVezes.Visible := TVTotal.Visible;
  if aNovo then begin
    if gConfig.PgVendaAvulsa then
      FTot.OpPagto := 1 else
      FTot.OpPagto := 2;
  end else begin
    LoadItens;
    FTot.Recebido := FME.Pago;
    if Abs(((FME.Total - FME.Desconto) - FME.Pago)) < 0.01 then
      FTot.OpPagto := 1 else
      FTot.OpPagto := 0;
  end;
  
  FTot.Atualiza;
  ShowModal;
  Result := FRes;
end;

procedure TFrmVenda.edProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : begin
      if FCanClose then
        Close;
    end;
  end;
end;

procedure TFrmVenda.edQtdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key = Key_ENTER) then
  if FME.Tipo=trEstCompra then
    edUnit.SetFocus
  else
  if btnLancar.Enabled then
    btnLancarClick(nil);
end;

procedure TFrmVenda.edQtdPropertiesChange(Sender: TObject);
begin
  edQtd.PostEditValue;
end;

procedure TFrmVenda.edQtdPropertiesEditValueChanged(Sender: TObject);
begin
  btnLancar.Enabled := (IDProd>0) and (edQtd.EditValue>0);
end;

procedure TFrmVenda.edUnitKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Key_ENTER) and btnLancar.Enabled then 
    btnLancarClick(nil);
end;

procedure TFrmVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmVenda.FormCreate(Sender: TObject);
begin
  cmConfig.Enabled := Dados.CM.UA.Admin;
  FLastCod := -1;
  FCodRepetido := False;
  FCodStr := '';
  rgDescr.TabStop := False;
    
  //MostrarUnit := False;
  FIDProd := 0;
  edDescr.EditValue := null;

  FCanClose := True;
  FTot := TFrmTotal.Create(Self);

  FCli := gCliList.GetFrm;
  FShowed := False;
  FTipoCli := -1;
  FMsgDebito := -1;
  
  FCliAnt:= 0;
  FDebAnt:= 0;

  FRes := False;
  FDadosCli.dcCodigo := 0;
  FDadosCli.dcNome := '';

  lbUnidade.caption := '';
end;

procedure TFrmVenda.FormDestroy(Sender: TObject);
begin
  FTot.Free;
  gCliList.ReleaseFrm(FCli);
end;

procedure TFrmVenda.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    Key_Enter : 
      if (not (ssCtrl in Shift)) and (FCli.edCad.Focused or FCli.edAvulso.Focused) then begin
        if pgProd.ActivePage = tsDescr then
          edDescr.SetFocus else
          edCod.SetFocus;
      end else
      if (cmGravar.Enabled) then
      if ((ssCtrl in Shift) or (FTot.edRec.Focused)) then 
        cmGravarClick(nil);
        
    Key_Esc   : if FCanClose then Close;

    Key_F2    : cmGravar.Click;
    Key_F12   : FTot.edRec.SetFocus;
  end;
end;

procedure TFrmVenda.FormShow(Sender: TObject);
begin
  //MostrarUnit := (FME.Tipo=trEstCompra);
  if not FShowed and FNovo then
    Timer1.Enabled := True;

  rgCodigo.Checked := (slConfig.Values['OrdemProd']='1'); // do not localize

  if rgCodigo.Checked then 
    pgProd.ActivePageIndex := 0 else
    pgProd.ActivePageIndex := 1;
    
  if not FNovo then
  FCliAnt := FME.Cliente;
  FDebAnt := FME.ValorDebitado;

  FTot.PontosDisp := FCli.FidPontos;
  
  FShowed := True;

  FTot.Atualiza;
    
{  vgT.HideEdit;
  vgT.ShowEdit;}
  if (Screen.Width=640) then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
end;

function TFrmVenda.GetFidResgate: Boolean;
begin
  Result := FME.FidResgate;
end;

procedure TFrmVenda.GridEnter(Sender: TObject);
begin
//  bdcLista.Visible := (TV.DataController.RecordCount>0);
end;

procedure TFrmVenda.GridExit(Sender: TObject);
begin
//  bdcLista.Visible := False;
end;

procedure TFrmVenda.LoadItem(aIndex: Integer);
var V: Variant;
begin
  cmApagarItem.Enabled := True;
  with TV.DataController, Dados, FME.Itens[aIndex] do begin
    if not FidResgate then begin
      V := Values[aIndex, TVTotal.Index]; if V=null then V := 0;
      FTot.SubTotal := (FTot.SubTotal - V) + imTotal;
    end else begin
      V := Values[aIndex, TVFidPontosTotal.Index];
      if V=null then V:=0;
      FTot.PontosNec := FTot.PontosNec - V + imFidPontos;
    end;      
    Values[aIndex, 0] := tbPro.Lookup('ID', imProduto, 'Codigo'); // do not localize
    Values[aIndex, 1] := tbPro.Lookup('ID', imProduto, 'Descricao'); // do not localize
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

procedure TFrmVenda.LoadItens;
var I : Integer;
begin
  for I := 0 to FME.Itens.Count - 1 do begin
    TV.DataController.AppendRecord;
    LoadItem(I);
    FTot.Recebido := FME.Pago;
  end;
end;

procedure TFrmVenda.OnTimerCanClose(Sender: TObject);
begin
  Sender.Free;
  FCanClose := True;
end;

{procedure TFrmME.SetMostrarUnit(const Value: Boolean);
begin
  FMostrarUnit := Value;
  if Value then begin
    panQtd.Width := 251;
    edUnit.Enabled := True;
  end else begin
    panQtd.Width := 120;
    edUnit.Enabled := False;
  end;
  panAdd.Left := 2000;
end;}

procedure TFrmVenda.SetCodStr(Value: String);
begin
  if FCodStr = Value then Exit;
  FCodStr := Value;
  if FCodStr>'' then begin
    tCodR.SetRange([FCodStr], [FCodStr]);
    FCodRepetido := (tCodR.RecordCount>1);
  end;
end;

procedure TFrmVenda.SetIDProd(const Value: Integer);
begin
  if Value=FIDProd then Exit;
  FIDProd := Value;
  if FIDProd>0 then begin
    tPro.Locate('ID', FIDProd, []);
    CodStr := tProCodigo.Value;
    //MostrarUnit := ((FME.Tipo=trEstVenda) and tProPodeAlterarPreco.Value) or (FME.Tipo=trEstCompra);
    case FME.Tipo of
      trEstVenda : begin
        edUnit.Value := tProPreco.Value;
        edUnit.Properties.ReadOnly := not tProPodeAlterarPreco.Value;
      end;
      trEstCompra : begin
        edUnit.Value := tProCustoUnitario.Value;
        edUnit.Properties.ReadOnly := False;
      end
    else
      edUnit.Value := 0;
    end;
  end else 
    CodStr := '';
  btnLancar.Enabled := (FIDProd>0) and(edQtd.EditValue>0);
  AtualizaDetalhes;  
end;

procedure TFrmVenda.SetTamanho(Value: byte);
begin
    if Value<>fTamanho then begin

       fTamanho := value;

       FTot.Tamanho := fTamanho;

       case fTamanho of
         tamTelaNormal : begin
             Grid.Font.size := 10;
             TV.optionsView.Footer := false;
         end;
         tamTelaPDV1   : begin
             borderstyle := bsNone;
             left := 0;
             top  := 0;
             width := screen.width;
             height := screen.height;
             windowstate := wsMaximized;
             Grid.Font.size := 20;
             TV.optionsView.Footer := False;
         end;
       end;
    end;

end;

procedure TFrmVenda.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if pgProd.ActivePageIndex=0 then
    edCod.SetFocus else
    edDescr.SetFocus;
end;

procedure TFrmVenda.TVCustomDrawFooterCell(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
begin
   ACanvas.Font.Color := clRed;
   ACanvas.Font.Size := trunc(Grid.Font.size*1.4);
   //AViewInfo.Height := 100;
end;

procedure TFrmVenda.TVDataControllerAfterDelete(
  ADataController: TcxCustomDataController);
begin
  cmApagarItem.Enabled := (TV.DataController.RecordCount>0);
end;

procedure TFrmVenda.TVDataControllerBeforeDelete(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
var aIndex : Integer;  
begin
  aIndex := aRecordIndex;
  if aIndex=-1 then Exit;
  if FidResgate then
    FTot.PontosNec := FTot.PontosNec - FME.Itens[aIndex].imFidPontos else 
    FTot.SubTotal := FTot.SubTotal - FME.Itens[aIndex].imTotal;

  FME.Itens[aIndex].Free;
  FME.Itens.Delete(aIndex);
end;

procedure TFrmVenda.TVIgualGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  AText := '=';
end;

procedure TFrmVenda.TVQuantGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  if FME.Tipo = trEstEntrada then 
    AText := '+'+AText 
  else
  if FME.Tipo = trEstSaida then
    AText := '-'+AText;
end;

procedure TFrmVenda.TVvezesGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  AText := 'X';
end;

procedure TFrmVenda._Lancar;
begin
  if btnLancar.Enabled then begin
    if FME.Tipo=trEstCompra then
      edQtd.SetFocus
    else
    if tProPodeAlterarPreco.Value then 
      edUnit.SetFocus else
      btnLancarClick(nil);
  end else
    if edQtd.EditValue<0.001 then
      edQtd.SetFocus;
end;

procedure TFrmVenda.edCodKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
   i : integer;
begin
  if (Key = Key_ENTER) then begin
      if IDProd>0 then begin
          if not FCodRepetido then
            _Lancar
          else begin
             // Achou mais de um produto para este código
             i := TFrmEscolhaProdDup.Create(self).Mostrar(edCod.EditingText);
             if (i>-1) and (tPro.Locate('ID', i, [])) then begin // do not localize
               IDProd := tProID.Value;
               _Lancar;
             end;
          end;
      end else begin
          // NAO achou prod para este código
          {$ifdef LAN}
          Exit;
          {$endif}
          Dados.tbProdD.Open;
          if (trim(edCod.Text)<>'') and (GConfig.QuickCad) then begin
            beep;
            IDProd := TFrmQuickCadProduto.Create(Self.Handle, Self).Incluir(edCod.Text, tPro);
            if (IDProd>0) then _Lancar;
          end;
      end;
  end;
end;


procedure TFrmVenda.edCodPropertiesChange(Sender: TObject);
begin
  edCod.PostEditValue;
end;

procedure TFrmVenda.edCodPropertiesEditValueChanged(Sender: TObject);
begin
  if (Trim(edCod.Text)>'') and tPro.Locate('Codigo', edCod.Text, []) then 
    IDProd := tProID.Value else
    IDProd := 0;
end;

procedure TFrmVenda.edDescrEnter(Sender: TObject);
begin
  edDescr.EditValue := '';
  IDProd := 0;
end;

procedure TFrmVenda.edDescrKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Key_ENTER) then begin
    edDescrPropertiesCloseUp(nil);
    if IDProd>0 then _Lancar;
  end;
end;

procedure TFrmVenda.edDescrPropertiesCloseUp(Sender: TObject);
{var
  V: Variant;
  aCod: Integer; }
begin
  with TTimer.Create(Self) do begin
    Enabled := True;
    Interval := 100;
    OnTimer := OnTimerCanClose;
  end;
  edDescrPropertiesEditValueChanged(nil);
  
{  V := edDescr.EditValue;
  if (V<>null) then begin
    MostrarUnit := ((FME.Tipo=trEstVenda) and tProPodeAlterarPreco.Value) or (FME.Tipo=trEstCompra);
    if FME.Tipo=trEstVenda then edUnit.Value := tProPreco.Value;
  end;
  AtualizaDetalhes;}
end;

procedure TFrmVenda.edDescrPropertiesEditValueChanged(Sender: TObject);
var aCod: Integer;
begin
  try
    aCod := edDescr.EditValue;
  except
    aCod := 0;
  end;
  if aCod=FLastCod then Exit;
  FLastCod := aCod;
  IDProd := aCod;
end;

procedure TFrmVenda.edDescrPropertiesPopup(Sender: TObject);
begin
  FCanClose := False;
end;

end.

