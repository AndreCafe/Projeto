unit ncaFrmME;

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
  PngSpeedButton, LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  cxLabel, cxSpinEdit, cxLookAndFeels, cxLookAndFeelPainters,
  LMDCustomScrollBox, LMDScrollBox, cxPC, cxPCdxBarPopupMenu, ncaFrmTotal,
  cxLookupEdit, cxDBLookupEdit, Menus, StdCtrls, cxButtons, ncaFrmCli,
  ncClassesBase, cxNavigator;

type
  TFrmME = class(TForm)
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
    dxBarButtonConfig: TdxBarButton;
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
    procedure edDescrKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edQtdKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
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
    procedure dxBarButtonConfigClick(Sender: TObject);
  private
    FME       : TncMovEst;
    FDadosCli : TDadosCliente;
    FNovo     : Boolean;
    FRes      : Boolean;
    FProd     : Integer;
    FCliAnt   : Integer;
    FDebAnt   : Currency;
    FMsgDebito: Integer;
    FTipoCli  : Integer;
    FShowed   : Boolean;
    FTot      : TFrmTotal;
    FCli      : TFrmCli;
    FCanClose : Boolean;
    FMostrarUnit : Boolean;
    FLastCod     : Integer;
    FTamanho     : byte;
    { Private declarations }
    procedure LoadItem(aIndex: Integer);
    procedure LoadItens;
    function GetFidResgate: Boolean;

    procedure AtualizaDetalhes;

    procedure AjustaOrdem(aSalvaOrdem: Boolean = False);

    procedure OnTimerCanClose(Sender: TObject);
    procedure SetMostrarUnit(const Value: Boolean);
    procedure SetTamanho(Value: byte);

    property MostrarUnit: Boolean
      read FMostrarUnit write SetMostrarUnit;

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
  FrmME: TFrmME;

implementation

uses
  ncaDM,
  ncaFrmVendaProd,
  ncaFrmPri,
  ncIDRecursos,
  ncafbPesqFor,
  ncaFrmConfigQuickCad,
  ncaFrmQuickCadProduto;

{$R *.dfm}

{ TFrmME }

procedure TFrmME.AjustaOrdem(aSalvaOrdem: Boolean);
begin
  if rgCodigo.Checked then 
    slConfig.Values['OrdemProd'] := '1' else 
    slConfig.Values['OrdemProd'] := '0';
  if aSalvaOrdem then SaveConfig;
end;

procedure TFrmME.AtualizaDetalhes;
begin
  panDetalhes.Visible := btnLancar.Enabled;
  lbNomeProd.Caption := tProDescricao.Value;
  if FME.Tipo=trEstEntrada then 
    edUnit.Value := tProCustoUnitario.Value;
  lbQuant.Caption := FloatToStr(Int(tProEstoqueAtual.Value*1000)/1000);
  lbPreco.Caption := FloatToStrF(tProPreco.Value, ffCurrency, 10, 2);
  lbNomeProd.Left := 0;
  lbNomeProd.Visible := (pgProd.ActivePageIndex=0);
end;

procedure TFrmME.cmApagarItemClick(Sender: TObject);
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

procedure TFrmME.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmME.cmGravarClick(Sender: TObject);
var Debitar: Currency;
begin
  {$ifdef LOJA}
  if not PremiumOk then Exit;
  {$endif}
  
  if FidResgate then begin
    FME.Total := 0;
    FME.Desconto := 0;
    FME.Pago := 0;
  end else begin
    FME.Total    := FTot.SubTotal;
    FME.Desconto := FTot.Desconto;
    FME.Pago     := FTot.Pago;
  end;
  FME.Obs      := FTot.edObs.Lines.Text;
  FME.Recibo   := cbRecibo.Checked;
  FME.NomeCliente := FCli.Nome;
  FME.Cliente := FCli.Codigo;
  
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
    if FCli.Codigo=0 then 
      raise ENexCafe.Create('É necessário informar o cliente');
      
    if FTot.PontosNec>FCli.FidPontos then 
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
    
  FRes := True;

  Close;
end;

procedure TFrmME.btnLancarClick(Sender: TObject);
var IM: TncItemMovEst;
begin
  IM := TncItemMovEst.Create;
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
    edUnit.Value := 0;
    edQtd.Value := 1;
    FProd := 0;
    btnLancar.Enabled := False;
    MostrarUnit := (FME.Tipo=trEstCompra);
  finally
    IM.Free;
  end;
end;

procedure TFrmME.cxLabel1Click(Sender: TObject);
begin
  edQtd.SetFocus;
end;

procedure TFrmME.dxBarButtonConfigClick(Sender: TObject);
begin
  TFrmConfigQuickCad.Create(Self).ShowModal;
end;

procedure TFrmME.rgCodigoClick(Sender: TObject);
begin
  pgProd.ActivePageIndex := 0;
  edCod.Clear;
  panDetalhes.Visible := False;
  edCod.SetFocus;
  AjustaOrdem(True);
end;

procedure TFrmME.rgDescrClick(Sender: TObject);
begin
  pgProd.ActivePageIndex := 1;
  edDescr.Clear;
  panDetalhes.Visible := False;
  edDescr.SetFocus;
  AjustaOrdem(True);
end;

function TFrmME.Editar(aNovo: Boolean; aME: TncMovEst;
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
    tPro.Filter := '(plus<>true) and (fidpontos>0)';
  end else
  if aME.Tipo=trEstVenda then
    FTot.InitVal(0, aME.Desconto, aME.Pago, 0, aME.Obs, panTot)
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
        Caption := 'Venda' else
        Caption := 'Resgate de produto do programa de pontos/fidelidade';
    trEstCompra  : Caption := 'Compra';
    trEstSaida   : Caption := 'Ajuste de Estoque - SAÍDA';
    trEstEntrada : Caption := 'Ajuste de Estoque - ENTRADA';
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

procedure TFrmME.edProdKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmME.edQtdKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = Key_ENTER) then
  if FME.Tipo=trEstCompra then
    edUnit.SetFocus 
  else
  if btnLancar.Enabled then
    btnLancarClick(nil);
end;

procedure TFrmME.edQtdPropertiesChange(Sender: TObject);
begin
  edQtd.PostEditValue;
end;

procedure TFrmME.edQtdPropertiesEditValueChanged(Sender: TObject);
begin
  btnLancar.Enabled := (FProd>0) and (edQtd.EditValue>0);
end;

procedure TFrmME.edUnitKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Key_ENTER) and btnLancar.Enabled then 
    btnLancarClick(nil);
end;

procedure TFrmME.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmME.FormCreate(Sender: TObject);
begin
  FLastCod := -1;
  rgDescr.TabStop := False;
    
  MostrarUnit := False;
  FProd := 0;
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
end;

procedure TFrmME.FormDestroy(Sender: TObject);
begin
  FTot.Free;
  gCliList.ReleaseFrm(FCli);
end;

procedure TFrmME.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TFrmME.FormShow(Sender: TObject);
begin
  MostrarUnit := (FME.Tipo=trEstCompra);
  dxBarButtonConfig.enabled := Dados.CM.UA.Admin;

  if not FShowed and FNovo then
    Timer1.Enabled := True;

  rgCodigo.Checked := (slConfig.Values['OrdemProd']='1');

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

function TFrmME.GetFidResgate: Boolean;
begin
  Result := FME.FidResgate;
end;

procedure TFrmME.GridEnter(Sender: TObject);
begin
//  bdcLista.Visible := (TV.DataController.RecordCount>0);
end;

procedure TFrmME.GridExit(Sender: TObject);
begin
//  bdcLista.Visible := False;
end;

procedure TFrmME.LoadItem(aIndex: Integer);
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
    FTot.Recebido := FME.Pago;
  end;
end;

procedure TFrmME.OnTimerCanClose(Sender: TObject);
begin
  Sender.Free;
  FCanClose := True;
end;

procedure TFrmME.SetMostrarUnit(const Value: Boolean);
begin
  FMostrarUnit := Value;
  if Value then begin
    panQtd.Width := 221;
    edUnit.Enabled := True;
  end else begin
    panQtd.Width := 80;
    edUnit.Enabled := False;
  end;
  panAdd.Left := 2000;
end;

procedure TFrmME.SetTamanho(Value: byte);
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

procedure TFrmME.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if pgProd.ActivePageIndex=0 then
    edCod.SetFocus else
    edDescr.SetFocus;
end;

procedure TFrmME.TVCustomDrawFooterCell(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
begin
   ACanvas.Font.Color := clRed;
   ACanvas.Font.Size := trunc(Grid.Font.size*1.4);
   //AViewInfo.Height := 100;
end;

procedure TFrmME.TVDataControllerAfterDelete(
  ADataController: TcxCustomDataController);
begin
  cmApagarItem.Enabled := (TV.DataController.RecordCount>0);
end;

procedure TFrmME.TVDataControllerBeforeDelete(
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

procedure TFrmME.TVIgualGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  AText := '=';
end;

procedure TFrmME.TVQuantGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  if FME.Tipo = trEstEntrada then 
    AText := '+'+AText 
  else
  if FME.Tipo = trEstSaida then
    AText := '-'+AText;
end;

procedure TFrmME.TVvezesGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  AText := 'X';
end;

procedure TFrmME.edCodPropertiesChange(Sender: TObject);
begin
  edCod.PostEditValue;
end;

procedure TFrmME.edCodPropertiesEditValueChanged(Sender: TObject);
begin
  if (Trim(edCod.Text)>'') and tPro.Locate('Codigo', edCod.Text, []) then begin
    FProd := tProID.Value;
    MostrarUnit := ((FME.Tipo=trEstVenda) and tProPodeAlterarPreco.Value) or (FME.Tipo=trEstCompra);
    case FME.Tipo of
      trEstVenda : edUnit.Value := tProPreco.Value;
      trEstCompra : edUnit.Value := tProCustoUnitario.Value;
    else
      edUnit.Value := 0;
    end;
    btnLancar.Enabled := (edQtd.EditValue>0);
  end else begin
    // NAO achou prod para este código seta FProd := 0;
    btnLancar.Enabled := False;
    FProd := 0;
  end;

  AtualizaDetalhes;  
end;

procedure TFrmME.edDescrEnter(Sender: TObject);
begin
  edDescr.EditValue := '';
  FProd := 0;
  btnLancar.Enabled := False;
end;

procedure TFrmME.edDescrKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  procedure Lancar;
  begin
          if btnLancar.Enabled then begin
            if FME.Tipo=trEstCompra then
              edQtd.SetFocus
            else
            if MostrarUnit and tProPodeAlterarPreco.Value then begin
              if Sender=edDescr then
                edDescrPropertiesCloseUp(nil);
              edUnit.SetFocus;
            end else
              btnLancarClick(nil);
          end else
          if edQtd.EditValue<0.001 then
            edQtd.SetFocus;
  end;
begin
  if (Key = Key_ENTER) then begin
      if FProd>0 then begin
          // Achou algum produto para este código
          Lancar;

      end else begin
          // NAO achou prod para este código
          {$ifdef LAN}
          Exit;
          {$endif}
          Dados.tbProdD.Open;
          if trim(edCod.Text)<>'' then begin
              beep;
              Fprod := TFrmQuickCadProduto.Create(Self).Incluir(edCod.Text, tPro);
              if (FProd>0) then begin
                  edUnit.Value := tProPreco.Value;
                  btnLancar.Enabled :=  (edQtd.EditValue>0);
                  Lancar;
              end;
          end;
      end;
  end;
end;

procedure TFrmME.edDescrPropertiesCloseUp(Sender: TObject);
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

procedure TFrmME.edDescrPropertiesEditValueChanged(Sender: TObject);
var aCod: Integer;
begin
  try
    aCod := edDescr.EditValue;
  except
    edDescr.EditValue := null;;
    aCod := 0;
  end;
  if aCod=FLastCod then Exit;
  FLastCod := aCod;
  
  if (edDescr.EditValue<>null) and (aCod>0) then begin
    FProd := tProID.Value;
    MostrarUnit := ((FME.Tipo=trEstVenda) and tProPodeAlterarPreco.Value) or (FME.Tipo=trEstCompra);
    case FME.Tipo of
      trEstVenda : edUnit.Value := tProPreco.Value;
      trEstCompra : edUnit.Value := tProCustoUnitario.Value;
    else
      edUnit.Value := 0;
    end;
  end else
    FProd := 0;

//  tPro.SetRange([edDescr.EditingText], [edDescr.EditingText+'zzzzzzzzz']);

  btnLancar.Enabled := (FProd>0) and (edQtd.EditValue>0);
  AtualizaDetalhes;
end;

procedure TFrmME.edDescrPropertiesPopup(Sender: TObject);
begin
  FCanClose := False;
end;

end.
