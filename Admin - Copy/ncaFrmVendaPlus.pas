unit ncaFrmVendaPlus;
{
    ResourceString: Dario 11/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaPlusAPI, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCurrencyEdit,
  cxRadioGroup, cxMaskEdit, dxBarExtItems, dxBar, cxClasses, cxVGrid,
  cxInplaceContainer, cxCheckBox, ExtCtrls, LMDCustomScrollBox, LMDScrollBox,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, jpeg,
  LMDSimplePanel, OleCtrls, SHDocVw_EWB, EwbCore, EmbeddedWB, cxPC, cxLabel, DB,
  nxdb, cxMemo, cxDBEdit, dxLayoutControl, cxTextEdit, ncMovEst, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, LMDPNGImage, Menus,
  StdCtrls, cxButtons, ncafbPesqCli, cxPCdxBarPopupMenu, dxLayoutcxEditAdapters,
  dxLayoutContainer,
  Buttons,
  LMDBaseControl, LMDBaseGraphicControl,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton, cxDBVGrid,
  kbmMemTable, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid, cxGridCardView, cxGridDBCardView,
  cxGridCustomLayoutView, ComCtrls, cxListView, cxImageComboBox, ncaFrmCli, ncaFrmTotal,
  cxNavigator;

type
  TFrmVendaPlus = class(TFrmPlus)
    BarMgr: TdxBarManager;
    barTopo: TdxBar;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    tPT: TnxTable;
    tPTSeq: TAutoIncField;
    tPTID: TGuidField;
    tPTIDTranParceiro: TStringField;
    tPTOK: TBooleanField;
    tPTCaixa: TIntegerField;
    tPTDataHoraParceiro: TDateTimeField;
    tPTDataHoraNex: TDateTimeField;
    tPTcodParceiro: TStringField;
    tPTDescr: TnxMemoField;
    tPTObs: TnxMemoField;
    tPTFunc: TStringField;
    tPTValor: TCurrencyField;
    tPTCusto: TCurrencyField;
    tPTSessao: TIntegerField;
    tPTCliente: TIntegerField;
    tPTTranID: TIntegerField;
    tPTMaq: TWordField;
    tPTQuant: TFloatField;
    tPTPIN: TnxMemoField;
    tPTEmailCliente: TStringField;
    tPTIDProdutoParceiro: TStringField;
    tPTIDProdutoNex: TIntegerField;
    tPTImg: TGraphicField;
    tPTNomeCliente: TStringField;
    tTran: TnxTable;
    tTranID: TAutoIncField;
    tTranDataHora: TDateTimeField;
    tTranCliente: TIntegerField;
    tTranTipo: TWordField;
    tTranFunc: TStringField;
    tTranTotal: TCurrencyField;
    tTranDesconto: TCurrencyField;
    tTranPago: TCurrencyField;
    tTranObs: TMemoField;
    tTranCancelado: TBooleanField;
    tTranCanceladoPor: TStringField;
    tTranCanceladoEm: TDateTimeField;
    tTranCaixa: TIntegerField;
    tTranMaq: TWordField;
    tTranNomeCliente: TStringField;
    tTranSessao: TIntegerField;
    tTranDescr: TStringField;
    tTranDebito: TCurrencyField;
    tTranQtdTempo: TFloatField;
    tTranCredValor: TBooleanField;
    tTranFidResgate: TBooleanField;
    tTranTotLiq: TCurrencyField;
    tTranplusTran: TBooleanField;
    dsPT: TDataSource;
    tPTHoraParceiro: TDateTimeField;
    tPTHoraNex: TDateTimeField;
    tPlusP: TnxTable;
    tPlusPCodParceiro: TStringField;
    tPlusPNomeParceiro: TStringField;
    tPTNomeParceiro: TStringField;
    tTranplusID: TGuidField;
    tsVenda: TcxTabSheet;
    tProd: TnxTable;
    tProdCodigo: TStringField;
    tProdUnid: TStringField;
    tProdPreco: TCurrencyField;
    tProdObs: TMemoField;
    tProdImagem: TGraphicField;
    tProdEstoqueAtual: TFloatField;
    tProdCustoUnitario: TCurrencyField;
    tProdEstoqueACE: TFloatField;
    tProdEstoqueACS: TFloatField;
    tProdEstoqueFinal: TFloatField;
    tProdDescricao: TStringField;
    tProdCategoria: TStringField;
    tProdSubCateg: TStringField;
    tProdPodeAlterarPreco: TBooleanField;
    tProdNaoControlaEstoque: TBooleanField;
    tProdID: TAutoIncField;
    tProdFidPontos: TIntegerField;
    tProdFidelidade: TBooleanField;
    tProdFornecedor: TIntegerField;
    tProdEstoqueMin: TFloatField;
    tProdEstoqueMax: TFloatField;
    tProdAbaixoMin: TBooleanField;
    tProdAbaixoMinDesde: TDateTimeField;
    tProdEstoqueRepor: TFloatField;
    dsProd: TDataSource;
    tProdplus: TBooleanField;
    tProdplusURL: TnxMemoField;
    tProdplusCodParceiro: TStringField;
    tProdplusCodProduto: TStringField;
    tProdAtivo: TBooleanField;
    tPlusPurlTimeout: TStringField;
    tPlusPKeyIndex: TWordField;
    tPlusPAdesao: TBooleanField;
    tPTSincronizado: TBooleanField;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    mtProd: TkbmMemTable;
    mtProdImg: TIntegerField;
    mtProdDescr: TStringField;
    mtProdID: TIntegerField;
    tParceiro: TnxTable;
    tParceiroCodParceiro: TStringField;
    tParceiroNomeParceiro: TStringField;
    tParceirourlTimeout: TStringField;
    tParceiroKeyIndex: TWordField;
    tParceiroAdesao: TBooleanField;
    cmRealizarVenda: TdxBarLargeButton;
    panCli: TLMDSimplePanel;
    cmMaq: TdxBarStatic;
    panProd: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    pgProd: TcxPageControl;
    tsProd: TcxTabSheet;
    gridProd: TcxGrid;
    tvProd: TcxGridDBTableView;
    tvProdImg: TcxGridDBColumn;
    tvProdDescr: TcxGridDBColumn;
    tvProdID: TcxGridDBColumn;
    glProd: TcxGridLevel;
    tsNaoAderiu: TcxTabSheet;
    LMDSimplePanel3: TLMDSimplePanel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    tsDone: TcxTabSheet;
    panDone: TLMDSimplePanel;
    LMDSimplePanel1: TLMDSimplePanel;
    panImg: TLMDSimplePanel;
    cxLabel2: TcxLabel;
    imgParceiro: TImage;
    panDetalhes: TLMDSimplePanel;
    lbObs: TcxLabel;
    cxLabel7: TcxLabel;
    LMDSimplePanel6: TLMDSimplePanel;
    lbIDTran: TcxLabel;
    cxLabel11: TcxLabel;
    LMDSimplePanel8: TLMDSimplePanel;
    lbDataHora: TcxLabel;
    cxLabel13: TcxLabel;
    LMDSimplePanel9: TLMDSimplePanel;
    lbParceiro: TcxLabel;
    cxLabel15: TcxLabel;
    LMDSimplePanel7: TLMDSimplePanel;
    lbDescr: TcxLabel;
    cxLabel16: TcxLabel;
    LMDSimplePanel10: TLMDSimplePanel;
    lbPIN: TcxLabel;
    cxLabel18: TcxLabel;
    cbRecibo: TcxCheckBox;
    tPTImgParceiro: TIntegerField;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    panTot: TLMDSimplePanel;
    mtProdIDProd: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tPTCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lvProdClick(Sender: TObject);
    procedure tvProdCanFocusRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure cmRealizarVendaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure WBNavigateError(ASender: TObject; const pDisp: IDispatch; var URL,
      Frame, StatusCode: OleVariant; var Cancel: WordBool);
    procedure cxLabel4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FME : TncMovEst;
    FNovo : Boolean;
    FRes  : Boolean;
    FDebAnt : Currency;
    FVisivel : Boolean;
    FVendaMaq : Boolean;
    FVender: Boolean;
    FCli   : TFrmCli;
    FTot   : TFrmTotal;
    FEtapa : Integer; 
    FMaq   : Integer;  
    FPodeAlterarCli : Boolean;
    
    procedure SetEtapa(const Value: Integer);
    procedure OnMudouCliente(Sender: TObject);
  protected
    procedure SalvouTran(J: TjpegImage); override;
    procedure LeTran(aID: String);

    procedure OnTimerVendaMaq(Sender: TObject);

    function GetCli: TFrmCli; override;

    procedure AjustaVisCliMaq;

    property Etapa: Integer
      read FEtapa write SetEtapa;

    procedure wmCriaMovEst(var Msg: TMessage);
      message wm_user + 1; 
  public
    function Editar(aME: TncMovEst; aPodeSalvar: Boolean; aPodeAlterarCli: Boolean = False): Boolean;
    
    procedure Vender(aMaq: Integer; aVendaMaq: Boolean; const aCodParceiro: String = '');
    
    { Public declarations }
  end;

var
  FrmVendaPlus: TFrmVendaPlus;

const 
  evSelParceiro = 0;
  evWebParceiro = 1;
  evDone        = 2;

implementation

uses ncaDM, ncClassesBase, ncaFrmPri, ncIDRecursos, ncErros, ncSessao,
  ncaFrmSombra, ncShellStart, ncDebug, ufmImagens;

// START resource string wizard section
const
  SHttpWwwNexcafeComBr = 'http://www.nexcafe.com.br';

// END resource string wizard section


// START resource string wizard section
resourcestring
  SMaq = 'Maq.';
  SDdMmYyyyHhMmSs = 'dd/mm/yyyy  hh:mm:ss';
  SParaFicarEmDébitoéNecessárioSele = 'Para ficar em débito é necessário selecionar um cliente';
  SOLimiteMáximoDeDébitoPermitidoPa = 'O limite máximo de débito permitido para esse cliente foi ultrapassado';
  SÉNecessárioSelecionarUmCliente = 'É necessário selecionar um cliente';
  SVendaWeb = 'Venda Web ';
  SNãoEncontrada = 'não encontrada.';

// END resource string wizard section


{$R *.dfm}

procedure TFrmVendaPlus.SetEtapa(const Value: Integer);
var I : TIcon; n : Integer;
begin
  FEtapa := Value;
  if FMaq>0 then begin
    cmMaq.Caption := SMaq+IntToStr(FMaq);
    cmMaq.Visible := ivAlways;
  end else 
    cmMaq.Visible := ivNever;
    
  case FEtapa of
    evSelParceiro : begin
      panTot.Visible := False;
      panCli.Enabled := (FMaq=0) and FVender;
      cmRealizarVenda.Visible := ivAlways;
      Paginas.ActivePage := tsVenda;
      cmGravar.Visible := ivNever;
    end;
    evWebParceiro : begin
      panTot.Visible := False;
      panCli.Visible := True;
      panCli.Enabled := False;
      cmRealizarVenda.Visible := ivNever;
      Paginas.ActivePage := tsWB;
      cmGravar.Visible := ivAlways;
      cmGravar.Enabled := False;
    end; 
    evDone : begin
      panTot.Visible := True;
      panCli.Enabled := FPodeAlterarCli;
      panCli.Visible := True;
      cmRealizarVenda.Visible := ivNever;
      Paginas.ActivePage := tsDone;
      cmGravar.Visible := ivAlways;
      if FNovo then
        cmCancelar.Visible := ivNever else
        cmCancelar.Visible := ivAlways;
      cmGravar.Enabled := FVender or Permitido(daTraAlterar);
      lbParceiro.Caption := tPTNomeParceiro.Value;
      lbDataHora.Caption := FormatDateTime(SDdMmYyyyHhMmSs, tPTDataHoraParceiro.Value);
      lbIDTran.Caption := tPTIDTranParceiro.Value;
      lbDescr.Caption := tPTDescr.Value;
      lbPIN.Caption := tPTPIN.Value;
      lbPIN.Visible := (Trim(tPTPIN.Value)>'');
      lbObs.Caption := tPTObs.Value;
      n := tPTImgParceiro.Value - 1;
      if (n>0) and (FrmPri.logos_plus.Count>n) then begin
        I := TIcon.Create;
        FrmPri.logos_plus.GetIcon(n, I);
        imgParceiro.Picture.Icon := I;
      end else
        panImg.Visible := False;
      
    end;
  end;
end;


function GetTempDirectory: String;
var
  tempFolder: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  result := StrPas(tempFolder);
end;

function TempImgName: String;
begin
  Result := IncludeTrailingBackslash(GetTempDirectory)+'tempimgnex.jpg'; // do not localize
end;

procedure TFrmVendaPlus.AjustaVisCliMaq;
begin
{  edMaq.Visible := rgMaq.Checked;
  edCliCad.Visible := rgCliCad.Checked;
  edCliAvulso.Visible := rgCliAvulso.Checked;

  if rgMaq.Checked then
  lbEditar.Caption := 'Máquina:' else
  lbEditar.Caption := 'Cliente:';}
end;

procedure TFrmVendaPlus.cmCancelarClick(Sender: TObject);
begin
  inherited;
  Fechar;
end;

procedure TFrmVendaPlus.cmGravarClick(Sender: TObject);
var Debitar: Currency;
begin
  FME.Total    := FTot.SubTotal;
  FME.Desconto := FTot.Desconto;
  FME.Pago     := FTot.Pago;
  FME.Tipo     := trEstVenda;
  FME.plusID   := tPTID.Value;
  FME.Obs   := FTot.edObs.Lines.Text;
  
  if FNovo then begin
    FME.NomeCliente := tPTNomeCliente.Value;
    FME.Cliente := tPTCliente.Value;
    FME.Descr := tPTDescr.Value;
    FME.Maq := tPTMaq.Value;
    FME.Sessao := tPTSessao.Value;
    FME.Operacao := osIncluir;
  end else begin
    FME.Itens[0]._Operacao := osAlterar;
    if FPodeAlterarCli then begin
      FME.NomeCliente := FCli.Nome;
      FME.Cliente := FCli.Codigo;
    end;
  end;

  with FME.Itens[0] do begin
    imProduto := tPTIDProdutoNex.Value;
    imTipoTran := trEstVendaWeb;
    imUnitario := FME.Total;
    imDesconto := FME.Desconto;
    imPago := FME.Pago;
    imQuant := 1;
    imTotal := FME.Total;
    imSessao := tPTSessao.Value;
    imCliente := tPTCliente.Value;
    imNaoControlaEstoque := True;
    _Recibo := cbRecibo.Checked;
  end;  
  FME.Recibo   := cbRecibo.Checked;

  with Dados do
  if (FME.ValorDebitado>0.009) then begin
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

  FME.SalvaTipoTran;

  Dados.CM.SalvaMovEst(FME);
    
  Fechar;
  FRes := True;
end;

procedure TFrmVendaPlus.cmRealizarVendaClick(Sender: TObject);
var 
  S: TncSessao;
  str: String; 
begin
  inherited;
  
  if (FCli.Tipo=0) then begin
    if FCli.Codigo=0 then
      Raise Exception.Create(SÉNecessárioSelecionarUmCliente);
    S := Dados.CM.Sessoes.PorCliente[FCli.Codigo];
    if (S=nil) or S.Encerrou then begin  
      FSessao := 0;
      FMaq := 0;
    end else begin
      FSessao := S.ID;
      FMaq := S.Maq;
    end;
  end;

  Etapa := evWebParceiro;  

  if tProd.Locate('ID', mtProdIDProd.Value, []) then begin // do not localize
    Paginas.ActivePageIndex := 0;
    FUrl := tProdplusURl.Value;
    FIDProdutoParceiro := tProdplusCodProduto.Value;
    FIDProdutoNex      := tProdID.Value;
    NavegaURL;
    MostraSombraMsg(1);
  end else
    Close;
end;

procedure TFrmVendaPlus.cxLabel4Click(Sender: TObject);
begin
  inherited;
  ShellStart(SHttpWwwNexcafeComBr+'/nexcafe-plus.html'); // do not localize
end;
      
function TFrmVendaPlus.Editar(aME: TncMovEst; aPodeSalvar: Boolean; aPodeAlterarCli : Boolean = False): Boolean;
var TC: Byte;
begin
  FME := aME;
  FRes := False;

  if FME.Cliente>0 then 
    TC := 0 else
    TC := 1;

  FCli.Init(False, False, FME.Cliente, FME.NomeCliente, '', TC, panCli);

  if aME.Sessao>0 then FTot.PagarFimAcesso;

  FPodeAlterarCli := aPodeAlterarCli;
  
  FDebAnt := FME.ValorDebitado;
  cmGravar.Visible := ivAlways;
  cmGravar.Enabled := aPodeSalvar;
  FNovo := False;
  LeTran(aME.plusID);
  ShowModal;
  Result := FRes;
end;

procedure TFrmVendaPlus.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFrmVendaPlus.FormCreate(Sender: TObject);
var I: Integer;
begin
  inherited;
  FMaq := 0;
  FPodeAlterarCli := False;
  FCli := gCliList.GetFrm;
  FCli.OnMudouCliente := OnMudouCliente;
  FTot := TFrmTotal.Create(Self);

  FVender := False;
  FVendaMaq := False;
  tProd.Active := True;
  tProd.SetRange([true], [true]);
  tProd.Filter := 'Ativo = True'; // do not localize
  tProd.Filtered := True;

  FVisivel := False;

{  Width := 469;
  Height := 347;}

  FDebAnt := 0;
  FNovo := False;
  FME := nil;
  Paginas.HideTabs := True;
  Paginas.ActivePageIndex := 0;
  tPT.Open;
  tTran.Open;
  tPlusP.Open;
end;

procedure TFrmVendaPlus.FormDestroy(Sender: TObject);
begin
  inherited;
  if FVender and (FME<>nil) then FME.Free;
  gCliList.ReleaseFrm(FCli);
  FTot.Free;
end;

procedure TFrmVendaPlus.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    Key_Enter : 
      if (FEtapa=evDone) and (cmGravar.Enabled) then
      if ((ssCtrl in Shift) or (FTot.edRec.Focused)) then 
        cmGravarClick(nil);
        
    Key_Esc   : 
      if FPodeFechar then 
        Close;

    $7B {F12} : if FEtapa=evDone then FTot.edRec.SetFocus;
  end;

end;

procedure TFrmVendaPlus.FormShow(Sender: TObject);
begin
  inherited;
  if FVendaMaq then begin
    with TTimer.Create(Self) do begin
      Interval := 100;
      OnTimer := OnTimerVendaMaq;
      Enabled := True;
    end;
  end else
  if FVender and (FMaq=0) then 
    FCli.Timer3.Enabled := True;
  
  FVisivel := True;
  Center;
end;

function TFrmVendaPlus.GetCli: TFrmCli;
begin
  Result := FCli;
end;

procedure TFrmVendaPlus.LeTran(aID: String);
var Pg: Boolean;
begin
  if Pos('{', aID)=0 then aID := GuidStringFmt(aID);
  if not tPT.FindKey([aID]) then 
    Raise Exception.Create(SVendaWeb+aID+SNãoEncontrada);

  if FVender then begin
    FME.Total := tPTValor.Value;
    FPodeFechar := False;
  end;

  FTot.InitVal(FME.Total, FME.Desconto, FME.Pago, 0, FME.Obs, panTot);
  Width := 546;
  Height := 550;  

  if tPTSessao.Value=0 then
    Pg := gConfig.PgVendaAvulsa else
    Pg := gConfig.PgVendas;

  if FNovo then begin
    if Pg then begin
      FTot.OpPagto := 1;
      FTot.Recebido := FTot.Total;
    end else
      FTot.OpPagto := 0;
  end else begin
    if Abs(((FME.Total - FME.Desconto) - FME.Pago)) < 0.01 then
      FTot.OpPagto := 1 else
      FTot.OpPagto := 2;
  end;

  Etapa := evDone;
end;

procedure TFrmVendaPlus.lvProdClick(Sender: TObject);
begin
  inherited;
//  lvProd.Items[lvProd.ItemIndex].Checked := True;
end;

procedure TFrmVendaPlus.OnMudouCliente(Sender: TObject);
begin
  if (FCli.Codigo>0) then
    FEmailCliente := FCli.Pesq.Tabemail.Value else
    FEmailCliente := '';
end;

procedure TFrmVendaPlus.OnTimerVendaMaq(Sender: TObject);
begin
  Sender.Free;
  if mtProd.RecordCount<3 then 
    cmRealizarVenda.Click;
end;

procedure TFrmVendaPlus.SalvouTran(J: TjpegImage);
begin
  DebugMsg('TFrmVendaPlus.SalvouTran'); // do not localize
  PostMessage(Handle, wm_user + 1, 0, 0);
end;

procedure TFrmVendaPlus.tPTCalcFields(DataSet: TDataSet);
begin
  inherited;
  tPTHoraNex.Value := tPTDataHoraNex.Value;
  tPTHoraParceiro.Value := tPTDataHoraParceiro.Value;
end;

procedure TFrmVendaPlus.tvProdCanFocusRecord(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; var AAllow: Boolean);
var V : Variant;  
begin
  inherited;
  V := ARecord.Values[tvProdID.Index];
  AAllow := (V<>null) and (V<High(Integer));
end;

procedure TFrmVendaPlus.Vender(aMaq: Integer; aVendaMaq: Boolean; const aCodParceiro: String = '');
var 
  I, aCli : Integer;
  S : TncSessao;
  TC: Byte;
begin
  FRes := False;
  if aMaq>0 then 
    S := Dados.CM.Sessoes.PorMaq[aMaq] else
    S := nil;

  if S<>nil then begin
    FSessao := S.ID;
    FTot.PagarFimAcesso;
  end;
    
  if (S<>nil) and (S.Cliente>0) then begin
    TC := 0;
    aCli := S.Cliente;
  end else begin
    TC := 1;
    aCli := 0;
  end;
  
  FCli.Init(False, False, aCli, '', '', TC, panCli);
  FVender := True;
  FNovo := False;
  FMaq := aMaq;
  mtProd.Active := True;
  tProd.First;
  tParceiro.Open;
  dsProd.Dataset := nil;
  while not tProd.Eof do begin
    if tProdAtivo.Value then begin
      mtProd.Append;
      mtProdID.AsVariant := tParceiro.Lookup('CodParceiro', tProdplusCodParceiro.Value, 'KeyIndex'); // do not localize
      mtProdIDProd.Value := tProdID.Value;
      mtProdDescr.Value := tProdDescricao.Value;
      I := mtProdID.Value;
      mtProdImg.Value := I-1;
      mtProd.Post;
    end;

    tProd.Next;
  end;

  with TcxImageComboBoxProperties(tvProdImg.Properties) do begin
    Items.Clear;
    for I := 0 to FrmPri.logos_plus.Count-1 do
      with items.Add do begin
        ImageIndex := I;
        Value := I;
      end;
  end;

  mtProd.Append;
  mtProdID.Value := High(Integer);
  mtProdDescr.Value := '';
  mtProdImg.Value := 0;
  mtProd.Post;
  dsProd.Dataset := mtProd;

  mtProd.First;

  Width := 450;
  Height := 450;
  
  FVendaMaq := aVendaMaq;
  FPodeFechar := True;

  Etapa := evSelParceiro;
  
  if tProd.RecordCount=0 then begin
    pgProd.ActivePage := tsNaoAderiu;
    cmRealizarVenda.Enabled := False;
  end else 
    pgProd.ActivePage := tsProd;
    
  AjustaVisCliMaq;

  if (aCodParceiro>'') and  tParceiro.Locate('CodParceiro', aCodParceiro, []) then  // do not localize
    mtProd.Locate('ID', tParceiroKeyIndex.Value, []); // do not localize
  
  ShowModal;
end;

procedure TFrmVendaPlus.WBNavigateError(ASender: TObject;
  const pDisp: IDispatch; var URL, Frame, StatusCode: OleVariant;
  var Cancel: WordBool);
begin
  inherited;
  if Assigned(FFrmSombra) then begin    
    FFrmSombra.Tag := 2;
    FechaSombraMsg;
  end else
  with TTimer.Create(Self) do begin
    Tag := 2;
    Interval := 100;
    OnTimer := OnTimerErroNav;
    Enabled := True;
  end;
end;

procedure TFrmVendaPlus.wmCriaMovEst(var Msg: TMessage);
begin
  DebugMsg('TFrmVendaPlus - wmCriaMovEst 1'); // do not localize
  FNovo := True;
  FME := TncMovEst.Create;
  FME.Operacao := osIncluir;
  FME.plusID := tPTID.Value;
  FME.Tipo := trEstVenda;
  FME.NewIME._Operacao := osIncluir;
  DebugMsg('TFrmVendaPlus - wmCriaMovEst 2'); // do not localize
  LeTran(FIDTranNex);
  DebugMsg('TFrmVendaPlus - wmCriaMovEst 3'); // do not localize
end;

end.

