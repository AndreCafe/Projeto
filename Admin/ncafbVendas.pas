unit ncafbVendas;

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
  cxLookupEdit, cxDBLookupEdit, Menus, StdCtrls, cxButtons, ncaFrmCli, ufmFormBase,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu, dxPScxPivotGridLnk,
  ufmFormSizedFonts, uParentedPanel, dxBarBuiltInMenu, cxNavigator;

type
  TfbVendas = class(TFrmSizedFonts)
    panCli: TLMDSimplePanel;
    panTot: TLMDSimplePanel;
    panLista: TLMDSimplePanel;
    panDivBuscaLista: TLMDSimplePanel;
    panBuscaProd: TLMDSimplePanel;
    panBuscaTop: TLMDSimplePanel;
    panProd: TLMDSimplePanel;
    panRB: TLMDSimplePanel;
    rgCodigo: TcxRadioButton;
    rgDescr: TcxRadioButton;
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
    cbRecibo: TcxCheckBox;
    cmSalvar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cmRecibo: TdxBarControlContainerItem;
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
    barLista: TdxBar;
    cmApagarItem: TdxBarButton;
    tPro: TnxTable;
    tProID: TAutoIncField;
    tProCodigo: TStringField;
    tProDescricao: TStringField;
    tProUnid: TStringField;
    tProPreco: TCurrencyField;
    tProPodeAlterarPreco: TBooleanField;
    tProEstoqueAtual: TFloatField;
    tProplus: TBooleanField;
    tProFidPontos: TIntegerField;
    tProCustoUnitario: TCurrencyField;
    DataSource1: TDataSource;
    Timer1: TTimer;
    Timer3: TTimer;
    pgProd: TcxPageControl;
    tsBuscarCod: TcxTabSheet;
    edCod: TcxTextEdit;
    tsDescr: TcxTabSheet;
    edDescr: TcxLookupComboBox;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    panQtdUnitAdd: TLMDSimplePanel;
    panAdd: TLMDSimplePanel;
    btnLancar: TcxButton;
    panQtdUnit: TLMDSimplePanel;
    panUnit: TLMDSimplePanel;
    lbUnit: TcxLabel;
    edUnit: TcxCurrencyEdit;
    panQtd: TLMDSimplePanel;
    lbQtd: TcxLabel;
    edQtd: TcxCurrencyEdit;
    procedure rgCodigoClick(Sender: TObject);
    procedure lbQtdClick(Sender: TObject);
    procedure edQtdKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnLancarClick(Sender: TObject);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure FrmBasePaiDestroy(Sender: TObject);
    procedure edQtdPropertiesChange(Sender: TObject);
    procedure edQtdPropertiesEditValueChanged(Sender: TObject);
    procedure edUnitKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TVDataControllerAfterDelete(
      ADataController: TcxCustomDataController);
    procedure TVDataControllerBeforeDelete(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
    procedure rgDescrClick(Sender: TObject);
    procedure edDescrPropertiesCloseUp(Sender: TObject);
    procedure edDescrPropertiesEditValueChanged(Sender: TObject);
    procedure TVQuantGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVvezesGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure edCodPropertiesChange(Sender: TObject);
    procedure edCodPropertiesEditValueChanged(Sender: TObject);
    procedure edDescrKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edDescrEnter(Sender: TObject);
    procedure edDescrPropertiesPopup(Sender: TObject);
    procedure cmSalvarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
  private
    { Private declarations }
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
    
    { Private declarations }
    procedure LoadItem(aIndex: Integer);
    //procedure LoadItens;
    function GetFidResgate: Boolean;

    procedure AtualizaDetalhes;

    //procedure Salvar;
    procedure Limpar;

    //procedure OnMudouCliente(Sender: TObject);

    procedure AjustaOrdem(aSalvaOrdem: Boolean = False);

    procedure OnTimerCanClose(Sender: TObject);
    procedure SetMostrarUnit(const Value: Boolean);

    property MostrarUnit: Boolean
      read FMostrarUnit write SetMostrarUnit;

    property FidResgate: Boolean
      read GetFidResgate;
  protected
    procedure doParentModified(AParent: TWinControl); override;
    procedure doResizeSimplePanel(aComponent:TComponent; var newWidth, newHeight:integer); override;
    procedure doResizeComponent(aComponent:TComponent; var newWidth, newHeight:integer); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ParentChanged; override;
    class function Descricao: String; override;
    { Public declarations }
  end;

var
  fbVendas: TfbVendas;

implementation

uses 
  ncaDM, 
  ncaFrmVendaProd, 
  ncClassesBase, 
  ncaFrmPri, 
  ncIDRecursos,
  ncafbPesqFor,
  math;

{$R *.dfm}

{ TfbVendas }

procedure TfbVendas.AjustaOrdem(aSalvaOrdem: Boolean);
begin
  if rgCodigo.Checked then 
    slConfig.Values['OrdemProd'] := '1' else 
    slConfig.Values['OrdemProd'] := '0';
  if aSalvaOrdem then SaveConfig;
end;

procedure TfbVendas.AtualizaDetalhes;
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

procedure TfbVendas.btnLancarClick(Sender: TObject);
var IM: TncItemMovEst;
begin
  IM := TncItemMovEst.Create;
  try
    IM.imTipoTran := FME.Tipo;
    IM.imFidResgate := FidResgate;
    IM.imProduto := tProID.Value;
    IM.imQuant := edQtd.Value;
    IM.imUnitario := edUnit.Value;
    IM.imTotal := edQtd.Value * edUnit.Value;
    IM.imFidPontos := 0;
    
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

procedure TfbVendas.cmCancelarClick(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfbVendas.cmSalvarClick(Sender: TObject);
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
    Raise ENexCafe.Create('É necessário haver itens para salvar a venda');

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

  Dados.CM.SalvaMovEst(FME);

  Limpar;
    
end;

constructor TfbVendas.Create(AOwner: TComponent);
begin
  inherited;
  FMostrarUnit := true;
end;

procedure TfbVendas.lbQtdClick(Sender: TObject);
begin
  inherited;
  edQtd.SetFocus;      
end;

class function TfbVendas.Descricao: String;
begin
  Result := 'Vendas';
end;

procedure TfbVendas.doParentModified(AParent: TWinControl);
begin
  ZoomFactor := 2.1;
  //MostrarUnit := false;
  inherited;
end;

procedure TfbVendas.doResizeComponent(aComponent: TComponent; var newWidth,
  newHeight: integer);
begin
  if sametext(aComponent.name,'edDescr') then begin
      //newWidth := trunc(min(newWidth, (self.Width/2)-TcxLookupComboBox(aComponent).left));
  end;
  inherited;
end;

procedure TfbVendas.doResizeSimplePanel(aComponent:TComponent; var newWidth, newHeight: integer);
begin
  if (sametext(aComponent.name,'panProd')) or
     (sametext(aComponent.name,'tsDescr')) then begin
      //newWidth := trunc(min(newWidth, (self.Width/2)-TLMDSimplePanel(aComponent).left));
  end; 
  if sametext(aComponent.name,'panCliente') then begin
      newHeight := 85;
  end;
  if sametext(aComponent.name,'panAdd') then begin
      //newWidth := trunc(min(newWidth, (self.Width/2)-TLMDSimplePanel(aComponent).left));
  end; 
  inherited;
end;

procedure TfbVendas.dxBarLargeButton4Click(Sender: TObject);
begin
    if isFullScreen then
       setNormalScreen
    else
       setFullScreen;
end;

procedure TfbVendas.edCodPropertiesChange(Sender: TObject);
begin
  inherited;
  edCod.PostEditValue;
end;

procedure TfbVendas.edCodPropertiesEditValueChanged(Sender: TObject);
//var V: Variant;
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
    btnLancar.Enabled := False;
    FProd := 0;
  end;

  AtualizaDetalhes;  
end;

procedure TfbVendas.edDescrEnter(Sender: TObject);
begin
  inherited;
  edDescr.EditValue := null;
  FProd := 0;
  btnLancar.Enabled := False;
end;

procedure TfbVendas.edDescrKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = Key_ENTER) and (FProd>0) then begin
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
end;

procedure TfbVendas.edDescrPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  with TTimer.Create(Self) do begin
    Enabled := True;
    Interval := 100;
    OnTimer := OnTimerCanClose;
  end;
  edDescrPropertiesEditValueChanged(nil);
end;

procedure TfbVendas.edDescrPropertiesEditValueChanged(Sender: TObject);
var aCod: Integer;
begin
  if (edDescr.EditValue=null) then
    aCod := 0
  else
  try
    aCod := edDescr.EditValue;
  except
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

procedure TfbVendas.edDescrPropertiesPopup(Sender: TObject);
begin
  inherited;
  FCanClose := False;
end;

procedure TfbVendas.edQtdKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = Key_ENTER) then
  if FME.Tipo=trEstCompra then
    edUnit.SetFocus 
  else
  if btnLancar.Enabled then
    btnLancarClick(nil);
end;

procedure TfbVendas.edQtdPropertiesChange(Sender: TObject);
begin
  inherited;
  edQtd.PostEditValue;
end;

procedure TfbVendas.edQtdPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  btnLancar.Enabled := (FProd>0) and (edQtd.EditValue>0);
end;

procedure TfbVendas.edUnitKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = Key_ENTER) and btnLancar.Enabled then
    btnLancarClick(nil);
end;

procedure TfbVendas.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  FTot := TFrmTotal.Create(Self); 
  FCli := gCliList.GetFrm;
  FME := TncMovEst.Create;
end;

procedure TfbVendas.FrmBasePaiDestroy(Sender: TObject);
begin
  inherited;
  FTot.Free;
  gCliList.ReleaseFrm(FCli);
  FME.Free;
end;

function TfbVendas.GetFidResgate: Boolean;
begin
  Result := FME.FidResgate;
end;

procedure TfbVendas.Limpar;
var Func: String;
begin
  TV.DataController.RecordCount := 0;
  FME.Limpa;
  FME.Operacao := osIncluir;
  FME.Tipo := trEstVenda;
  FTot.Limpa;
  FLastCod := -1;
  rgDescr.TabStop := False;
    
  MostrarUnit := False;
  FProd := 0;
  edDescr.EditValue := null;
  
  FCanClose := True;
  FShowed := False;
  FTipoCli := -1;
  FMsgDebito := -1;

  FCliAnt:= 0;
  FDebAnt:= 0;

  FRes := False;
  FDadosCli.dcCodigo := 0;
  FDadosCli.dcNome := '';
  FNovo := True;

  if FCli.pmCli.PopupFocus then
    FCli.pmCli.ClosePopup(False);
    
  FCli.CliCad := 0; 
  FCli.Reset;

  FTot.InitVal(0, 0, 0, 0, '', panTot);
  resizeFormControls(FTot);

  with Dados.CM.Config do begin
    if (RecImprimir>0) and (FME.Tipo=trEstVenda) then
      cmRecibo.Visible := ivAlways else
      cmRecibo.Visible := ivNever;

    cbRecibo.Checked := (RecImprimir=2);
  end;

  Func := Dados.CM.UA.Nome;
  if Trim(Func)='' then
    Func := Dados.CM.UA.Username;

  FCli.Init(False, False, 0, '', Func, 0, panCli);
  resizeFormControls(FCli);
  Caption := 'Venda';
  TVUnitario.Visible := True;
  TVTotal.Visible := True;
  panCli.Visible := True;
  TVIgual.Visible := True;
  TVVezes.Visible := True;
  if gConfig.PgVendaAvulsa then
    FTot.OpPagto := 1 else
    FTot.OpPagto := 2;
  FTot.Atualiza;
end;

procedure TfbVendas.LoadItem(aIndex: Integer);
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

{procedure TfbVendas.LoadItens;
var I : Integer;
begin
  for I := 0 to FME.Itens.Count - 1 do begin
    TV.DataController.AppendRecord;
    LoadItem(I);
    FTot.Recebido := FME.Pago;
  end;
end;
}
{procedure TfbVendas.OnMudouCliente(Sender: TObject);
begin
  FTot.PontosDisp := FCli.FidPontos;
end; }

procedure TfbVendas.OnTimerCanClose(Sender: TObject);
begin
  Sender.Free;
  FCanClose := True;
end;

procedure TfbVendas.ParentChanged;
begin
  inherited;
  FShowed := True;
  Limpar;
end;

procedure TfbVendas.rgCodigoClick(Sender: TObject);
begin
  inherited;
  pgProd.ActivePageIndex := 0;
  edCod.Clear;
  panDetalhes.Visible := False;
  edCod.SetFocus;
  AjustaOrdem(True);
end;

procedure TfbVendas.rgDescrClick(Sender: TObject);
begin
  inherited;

//aqui
MostrarUnit := not MostrarUnit;


  pgProd.ActivePageIndex := 1;
  edDescr.Clear;
  panDetalhes.Visible := False;
  edDescr.SetFocus;
  AjustaOrdem(True);
end;

{procedure TfbVendas.Salvar;
begin

end;}

procedure TfbVendas.SetMostrarUnit(const Value: Boolean);
begin
  if FMostrarUnit <> Value then begin
      FMostrarUnit := Value;

      if Value then begin
        panUnit.visible := True;
        edUnit.Enabled := True;
        panQtdUnit.width := panQtd.width + panUnit.width;
        panQtdUnitAdd.width := panQtdUnitAdd.width + panUnit.width;
      end else begin
        panUnit.visible := False;
        edUnit.Enabled := False;
        panQtdUnit.width := panQtd.width;
        panQtdUnitAdd.width := panQtdUnitAdd.width - panUnit.width;
      end;
  end;
end;

procedure TfbVendas.TVDataControllerAfterDelete(
  ADataController: TcxCustomDataController);
begin
  inherited;
  cmApagarItem.Enabled := (TV.DataController.RecordCount>0);
end;

procedure TfbVendas.TVDataControllerBeforeDelete(
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

procedure TfbVendas.TVQuantGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if FME.Tipo = trEstEntrada then 
    AText := '+'+AText 
  else
  if FME.Tipo = trEstSaida then
    AText := '-'+AText;
end;

procedure TfbVendas.TVvezesGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  AText := 'X';
end;

end.
