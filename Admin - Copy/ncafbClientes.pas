unit ncafbClientes;
{
    ResourceString: Dario 10/03/13
}

interface

{$I NEX.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxBar, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxMaskEdit, cxCurrencyEdit, cxTextEdit, cxCalendar, cxMemo, cxCheckBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, 
  nxdb, ncPassaportes, ncAuxPassaporte,
  dxBarExtItems, 
  cxGridCustomPopupMenu, cxGridPopupMenu, cxInplaceContainer,
  cxVGrid, cxDBVGrid, cxImageComboBox, cxTimeEdit, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, cxDropDownEdit,
  cxContainer, cxLabel, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  frxClass, frxDBSet, frxDesgn, kbmMemTable, frxExportMail, frxExportPDF,
  frxExportRTF, frxDCtrl, frxCross, frxChBox, frxBarcode, frxRich,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxProgressBar, cxRadioGroup, Buttons, LMDControl, 
  cxGroupBox, cxBarEditItem,
  cxDBLookupComboBox, cxLookAndFeels, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, uParentedPanel, cxNavigator,
  dxPScxPivotGridLnk;

type
  TfbClientes = class(TFrmBase)
    Tab: TnxTable;
    TabNome: TStringField;
    TabEndereco: TStringField;
    TabBairro: TStringField;
    TabCidade: TStringField;
    TabUF: TStringField;
    TabCEP: TStringField;
    TabSexo: TStringField;
    TabObs: TMemoField;
    TabCpf: TStringField;
    TabRg: TStringField;
    Tabemail: TMemoField;
    TabUltVisita: TDateTimeField;
    TabIsento: TBooleanField;
    TabUsername: TStringField;
    TabSenha: TStringField;
    TabTelefone: TStringField;
    TabDebito: TCurrencyField;
    TabEscola: TStringField;
    TabNickName: TStringField;
    TabDataNasc: TDateTimeField;
    TabCelular: TStringField;
    TabTemDebito: TBooleanField;
    dsCli: TDataSource;
    cmTempo: TdxBarSubItem;
    cmPagarDebito: TdxBarLargeButton;
    cmVenderCred: TdxBarLargeButton;
    pmTempo: TdxBarPopupMenu;
    cmDebTempo: TdxBarLargeButton;
    TabAlteradoEm: TDateTimeField;
    TabIncluidoPor: TStringField;
    TabAlteradoPor: TStringField;
    TabTipoAcessoPref: TIntegerField;
    TabIncluidoEm: TDateTimeField;
    cmZerarTempo: TdxBarLargeButton;
    cmSubTempo: TdxBarLargeButton;
    cmSenha: TdxBarLargeButton;
    pmSenha: TdxBarPopupMenu;
    cmAlterarSenha: TdxBarButton;
    cmApagarSenha: TdxBarButton;
    TabPai: TStringField;
    TabMae: TStringField;
    TabEscolaHI: TDateTimeField;
    TabEscolaHF: TDateTimeField;
    TabLimiteDebito: TCurrencyField;
    TabInativo: TBooleanField;
    TabFoto: TGraphicField;
    TabID: TAutoIncField;
    TabMinutos: TFloatField;
    TabMinutosUsados: TFloatField;
    TabMinutosIniciais: TFloatField;
    TabValorCred: TCurrencyField;
    TabHP1: TIntegerField;
    TabHP2: TIntegerField;
    TabHP3: TIntegerField;
    TabHP4: TIntegerField;
    TabHP5: TIntegerField;
    TabHP6: TIntegerField;
    TabHP7: TIntegerField;
    TabNaoGuardarCredito: TBooleanField;
    TabPermiteLoginSemCred: TBooleanField;
    rpDesigner: TfrxDesigner;
    dbClientes: TfrxDBDataset;
    cmEtq: TdxBarLargeButton;
    TabIDCodBar: TStringField;
    mtEtq: TkbmMemTable;
    frxRichObject1: TfrxRichObject;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    frxCrossObject1: TfrxCrossObject;
    frxDialogControls1: TfrxDialogControls;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    frxMailExport1: TfrxMailExport;
    mtEtqNome: TStringField;
    mtEtqEndereco: TStringField;
    mtEtqBairro: TStringField;
    mtEtqCidade: TStringField;
    mtEtqUF: TStringField;
    mtEtqCEP: TStringField;
    mtEtqNasc: TDateTimeField;
    mtEtqSexo: TStringField;
    mtEtqObs: TMemoField;
    mtEtqCpf: TStringField;
    mtEtqRg: TStringField;
    mtEtqemail: TMemoField;
    mtEtqUltVisita: TDateTimeField;
    mtEtqIsento: TBooleanField;
    mtEtqUsername: TStringField;
    mtEtqSenha: TStringField;
    mtEtqTelefone: TStringField;
    mtEtqDebito: TCurrencyField;
    mtEtqEscola: TStringField;
    mtEtqNickName: TStringField;
    mtEtqDataNasc: TDateTimeField;
    mtEtqCelular: TStringField;
    mtEtqIncluidoEm: TDateTimeField;
    mtEtqPai: TStringField;
    mtEtqMae: TStringField;
    mtEtqEscolaHI: TDateTimeField;
    mtEtqEscolaHF: TDateTimeField;
    mtEtqInativo: TBooleanField;
    mtEtqFoto: TGraphicField;
    mtEtqID: TAutoIncField;
    mtEtqMinutos: TFloatField;
    mtEtqMinutosUsados: TFloatField;
    mtEtqValorCred: TCurrencyField;
    mtEtqCodigo: TStringField;
    frEtq: TfrxReport;
    TabPassaportes: TFloatField;
    TabTitEleitor: TStringField;
    cmListaEmail: TdxBarLargeButton;
    PB: TcxProgressBar;
    TabFidPontos: TFloatField;
    TabFidTotal: TFloatField;
    TabFidResg: TFloatField;
    cmFidelidade: TdxBarLargeButton;
    pmFidelidade: TdxBarPopupMenu;
    cmResgTempo: TdxBarButton;
    cmResgProduto: TdxBarButton;
    cmCorrigirFid: TdxBarButton;
    Timer1: TTimer;
    Timer2: TTimer;
    cmZerarTudo: TdxBarButton;
    cmExibir: TdxBarLargeButton;
    pmExibir: TdxBarPopupMenu;
    cmFiltroCli: TdxBarListItem;
    cmObs: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    LMDSimplePanel1: TLMDSimplePanel;
    dxBarDockControl2: TdxBarDockControl;
    BarMgrBar2: TdxBar;
    cmSubBusca: TdxBarSubItem;
    btnAchar: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    cmSubExibir: TdxBarSubItem;
    cmTodos: TdxBarButton;
    cmComDebito: TdxBarButton;
    cmComCredito: TdxBarButton;
    cmSubAniver: TdxBarSubItem;
    cmAniverHoje: TdxBarButton;
    cmAniverSemana: TdxBarButton;
    cmAniverProxSemana: TdxBarButton;
    cmAniverMes: TdxBarButton;
    cmAniverProxMes: TdxBarButton;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVNome: TcxGridDBColumn;
    TVInativo: TcxGridDBColumn;
    TVIsento: TcxGridDBColumn;
    TVDebito: TcxGridDBColumn;
    TVCredito: TcxGridDBColumn;
    TVValorCred: TcxGridDBColumn;
    TVPassaportes: TcxGridDBColumn;
    TVDataNasc: TcxGridDBColumn;
    TVTempoUsado: TcxGridDBColumn;
    TVSenha: TcxGridDBColumn;
    TVRg: TcxGridDBColumn;
    TVEndereco: TcxGridDBColumn;
    TVBairro: TcxGridDBColumn;
    TVCidade: TcxGridDBColumn;
    TVUVisita: TcxGridDBColumn;
    TVUF: TcxGridDBColumn;
    TVCEP: TcxGridDBColumn;
    TVSexo: TcxGridDBColumn;
    TVObs: TcxGridDBColumn;
    TVemail: TcxGridDBColumn;
    TVUsername: TcxGridDBColumn;
    TVTelefone: TcxGridDBColumn;
    TVCodigo: TcxGridDBColumn;
    TVEscola: TcxGridDBColumn;
    TVNickName: TcxGridDBColumn;
    TVCelular: TcxGridDBColumn;
    TVTemDebito: TcxGridDBColumn;
    TVIncluidoEm: TcxGridDBColumn;
    TVLimDebito: TcxGridDBColumn;
    TVIncluidoPor: TcxGridDBColumn;
    TVAlteradoEm: TcxGridDBColumn;
    TVAlteradoPor: TcxGridDBColumn;
    TitEleitor: TcxGridDBColumn;
    TVPai: TcxGridDBColumn;
    TVFidPontos: TcxGridDBColumn;
    TVFidTotal: TcxGridDBColumn;
    TVFidResg: TcxGridDBColumn;
    TVMae: TcxGridDBColumn;
    GL: TcxGridLevel;
    cmPorNome: TdxBarButton;
    cmPorUsername: TdxBarButton;
    cmPorCodigo: TdxBarButton;
    cmAniverAmanha: TdxBarButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    edBusca: TcxMaskEdit;
    cmBusca: TdxBarControlContainerItem;
    TabAniversario: TStringField;
    TabCotaImpEspecial: TBooleanField;
    TabCotaImpDia: TIntegerField;
    TabCotaImpMes: TIntegerField;
    TabSemFidelidade: TBooleanField;
    cmAtivo: TdxBarButton;
    cmInativo: TdxBarButton;
    TabCHorario: TIntegerField;
    TabNomeCHorario: TStringField;
    TVCHorario: TcxGridDBColumn;
    TabOpCHorario: TWordField;
    TVCPF: TcxGridDBColumn;
    TabFornecedor: TBooleanField;
    TVFornecedor: TcxGridDBColumn;
    TabTemCredito: TBooleanField;
    procedure TVDebitoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVIsentoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVInativoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cmApagarSenhaClick(Sender: TObject);
    procedure cmAlterarSenhaClick(Sender: TObject);
    procedure cmSenhaClick(Sender: TObject);
    procedure cmSubTempoClick(Sender: TObject);
    procedure cmZerarTempoClick(Sender: TObject);
    procedure cmVenderCredClick(Sender: TObject);
    procedure cmDebTempoClick(Sender: TObject);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure cmPagarDebitoClick(Sender: TObject);
    procedure TVTempoUsadoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVCreditoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure lbDebTotalDblClick(Sender: TObject);
    procedure btnRecriaDebitosClick(Sender: TObject);
    procedure cmEtqClick(Sender: TObject);
    procedure mtEtqCalcFields(DataSet: TDataSet);
    procedure FrmBasePaiDestroy(Sender: TObject);
    procedure TVPassaportesGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems0GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure TVTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems1GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure TVTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems2GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure TVTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems3GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure TVTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems4GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure cmListaEmailClick(Sender: TObject);
    procedure cmFidelidadeClick(Sender: TObject);
    procedure cmResgProdutoClick(Sender: TObject);
    procedure cmResgTempoClick(Sender: TObject);
    procedure cmCorrigirFidClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cbObsClick(Sender: TObject);
    procedure btnAcharClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure edBuscaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cmZerarTudoClick(Sender: TObject);
    procedure cmExibirClick(Sender: TObject);
    procedure edBuscaPropertiesChange(Sender: TObject);
    procedure cmPorNomeClick(Sender: TObject);
    procedure cmAniverHojeClick(Sender: TObject);
    procedure TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cmAtivoClick(Sender: TObject);
    procedure cmInativoClick(Sender: TObject);
    procedure TabFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure TVDataControllerFilterRecord(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var Accept: Boolean);
    procedure TVDataControllerFilterChanged(Sender: TObject);
  private
    { Private declarations }
    FPass : TncPassaportes;
    STotDeb,
    STotPass,
    STotValor,
    STotCred,
    SQuant : String;
    FTipoFiltro : Byte;
    FTipoBusca  : Byte;
    FDataFiltro : TDateTime;

    function TextoBusca: String;
    procedure SetTipoFiltro(aTipo: Byte);
    procedure SetTipoBusca(aTipo: Byte);
  public
    function ToolbarIsRibbonGroup(aBar: TdxBar): Boolean; override;

    procedure CalcTotais;

    procedure RefreshBotoes;
  
    procedure FiltraDados; override;
    class function Descricao: String; override;
    procedure AtualizaDireitos; override;

    procedure SetFocusBusca;
    
    { Public declarations }
  end;

var
  fbClientes: TfbClientes;

implementation

uses 
  ncaDM, 
  ufmImagens, 
  ncaFrmPri, 
  ncClassesBase,
  ncaFrmPass, 
  ncIDRecursos, 
  ncaFrmZerarTempo,
  ncaFrmSenha, ncDebito, ncaFrmDebito, ncDMServ, ncCredTempo, ncaFrmTempo,
  ncSessao, ncDebTempo, ncaFrmDebTempo, ncaFrmImpEtqCli, ncaFrmEmails,
  ncVersoes, ncaFrmAjustaFid, ncaFrmCadCli, ncaFrmDataAtivo;

// START resource string wizard section
resourcestring
  STodosClientes = 'Todos Clientes';
  SClientesComDébito = 'Clientes com Débito';
  SClientesComCrédito = 'Clientes com Crédito';
  SClientesAtivos = 'Clientes Ativos';
  SClientesInativos = 'Clientes Inativos';
  SAniversariantes = 'Aniversariantes';
  SBuscaPorNome = 'Busca por Nome';
  SBuscaPorUsername = 'Busca por Username';
  SBuscaPorCódigo = 'Busca por Código';
  SEXibir = 'E&xibir: ';
  S1Cliente = '1 Cliente';
  SClientes = ' Clientes';
  STempoAcumuladoDeTodosClientesFoi = 'Tempo acumulado de todos clientes foi zerado com sucesso!';
  SDesejaZerarOsPontosFidelidadeDeT = 'Deseja zerar os pontos fidelidade de TODOS os clientes?';
  SEssaOperaçãoVaiZerarOsPontosFide = 'Essa operação vai zerar os pontos fidelidade de TODOS os clientes da loja. Deseja continuar ?';
  SZerouPontosDeTodosClientes = 'Zerou pontos de todos clientes';
  SClientes_1 = 'Clientes';
  SDébitosReprocessados = 'Débitos Reprocessados!';
  SBarMgrBar1 = 'BarMgrBar1';
  SClientesINATIVOS_1 = 'Clientes INATIVOS';
  SQueNãoVieramNaLojaNosUltimos = 'Que não vieram na loja nos ultimos:';
  SDesejaGerarUmaListaDeEMailsDosCl = 'Deseja gerar uma lista de e-mails dos clientes? Você poderá copiar e colar os endereços para enviar e-mail para todos seus clientes usando sua conta de e-mail.';
  SNãoéPossívelApagarUmClienteQueEs = 'Não é possível apagar um cliente que está com acesso em andamento!';
  SEsseClientePossuiItensEmDébitoÉN = 'Esse cliente possui itens em débito. É necessário fazer o pagamento primeiramente, para depois excluir';
  SConfirmaAExclusãoDe = 'Confirma a exclusão de ';
  SVocêNãoTemPermissãoParaApagarASe = 'Você não tem permissão para apagar a senha de clientes que tem acesso gratuito';
  SEssaOpçãoDeveSerUtilizadaQuandoO = 'Essa opção deve ser utilizada quando o cliente esquece a senha. ';
  SDessaFormaElePoderáCriarUmaNovaS = 'Dessa forma ele poderá criar uma nova senha. Deseja realmente apagar a senha atual?';
  SClientesATIVOS_1 = 'Clientes ATIVOS';
  SQueVieramNaLojaNosUltimos = 'Que vieram na loja nos ultimos:';
  SFidelidade = 'Fidelidade';
  SÉNecessárioAtivarOSistemaDeFidel = 'É necessário ativar o sistema de fidelização de clientes em "Opções"';

// END resource string wizard section


{$R *.dfm}

const
  fltNenhum           = 0;
  fltDebito           = 1;
  fltCredito          = 2;
  fltAniverHoje       = 3;
  fltAniverAmanha     = 4;
  fltAniverSemana     = 5;
  fltAniverProxSemana = 6;
  fltAniverMes        = 7;
  fltAniverProxMes    = 8;
  fltAtivos           = 9;
  fltInativos         = 10;

  busNome = 0;
  busUsername = 1;
  busCodigo = 2;

function CaptionFiltro(aTipo: Byte): String;
begin
  case aTipo of
    fltNenhum           : Result := STodosClientes;
    fltDebito           : Result := SClientesComDébito;
    fltCredito          : Result := SClientesComCrédito;
    fltAtivos           : Result := SClientesAtivos;
    fltInativos         : Result := SClientesInativos;
  else
    Result := SAniversariantes;
  end;
end;

function DatePad(W: Word): String;
begin
  if W<10 then
    Result := '0'+IntToStr(W) else
    Result := IntToStr(W);
end;

procedure TfbClientes.FiltraDados;
var 
  FiltroBas, KI, KF : String;
  Ano, Mes, Dia : Word;

procedure AjustaBusca;
begin
  case FTipoBusca of
    busNome : begin
      cmSubBusca.Caption := SBuscaPorNome;
      Tab.IndexName := 'IFornecedorNome'; // do not localize
      TVNome.Index := 0;
      TVUsername.Index := 1;
      TVCodigo.Index := 2;
      TV.OptionsBehavior.IncSearchItem := TVNome;
    end;

    busUsername : begin
      cmSubBusca.Caption := SBuscaPorUsername;
      Tab.IndexName := 'IFornecedorUsername'; // do not localize
      TVUsername.Index := 0;
      TVNome.Index := 1;
      TVCodigo.Index := 2;
      TV.OptionsBehavior.IncSearchItem := TVUsername;
    end;

    busCodigo : begin
      cmSubBusca.Caption := SBuscaPorCódigo;
      Tab.IndexName := 'IFornecedorID'; // do not localize
      TVCodigo.Index := 0;
      TVNome.Index := 1;
      TVUsername.Index := 2;
      TV.OptionsBehavior.IncSearchItem := TVCodigo;
    end;
  end;
end;

begin
  if not Tab.Active then Tab.Active := True;

  //Tab.Filter := 'Fornecedor=False';
  //Tab.Filtered := True;
  Tab.Filtered := False;
  FiltroBas := '';

  CalcTotais;

  cmSubExibir.Caption := SEXibir + CaptionFiltro(FTipoFiltro);

  edBusca.Enabled := (FTipoFiltro in [fltNenhum]);
  cmSubBusca.Enabled := edBusca.Enabled;

  case FTipoFiltro of
    
    fltDebito : begin
      Tab.IndexName := 'IDebito'; // do not localize
      Tab.SetRange([True], [True]);
    end;

    fltCredito : begin
      Tab.IndexName := 'ICredito'; // do not localize
      Tab.SetRange([True], [True]);
    end; 

    fltAniverHoje : begin
      Tab.IndexName := 'IAniversario'; // do not localize
      Tab.SetRange([FormatDateTime('mmdd', Date)], [FormatDateTime('mmdd', Date)]); // do not localize
    end;

    fltAniverAmanha : begin
      Tab.IndexName := 'IAniversario'; // do not localize
      Tab.SetRange([FormatDateTime('mmdd', Date+1)], [FormatDateTime('mmdd', Date+1)]); // do not localize
    end;

    fltAniverSemana : begin
      Tab.IndexName := 'IAniversario'; // do not localize
      Dia := DayOfWeek(Date);
      KI := FormatDateTime('mmdd', Date-Dia+1); // do not localize
      KF := FormatDateTime('mmdd', Date-Dia+7); // do not localize
      Tab.SetRange([KI], [KF]);
    end; 

    fltAniverProxSemana : begin
      Tab.IndexName := 'IAniversario'; // do not localize
      Dia := DayOfWeek(Date);
      KI := FormatDateTime('mmdd', Date+8-Dia); // do not localize
      KF := FormatDateTime('mmdd', Date+8-Dia+6); // do not localize
      Tab.SetRange([KI], [KF]);
    end; 

    fltAniverMes : begin
      Tab.IndexName := 'IAniversario'; // do not localize
      DecodeDate(Date, Ano, Mes, Dia);
      KI := DatePad(Mes)+'01'; // do not localize
      KF := DatePad(Mes)+'31'; // do not localize
      Tab.SetRange([KI], [KF]);
    end;

    fltAtivos : begin
      Tab.IndexName := 'IUltVisita'; // do not localize
      Tab.SetRange([FDataFiltro], [Date+30]);
    end;

    fltInativos : begin
      Tab.IndexName := 'IUltVisita'; // do not localize
      Tab.SetRange([], [FDataFiltro-1]);
    end;
    
    fltAniverProxMes : begin
      Tab.IndexName := 'IAniversario'; // do not localize
      DecodeDate(Date, Ano, Mes, Dia);
      Inc(Mes); if Mes>12 then Mes := 1;
      KI := DatePad(Mes)+'01'; // do not localize
      KF := DatePad(Mes)+'31'; // do not localize
      Tab.SetRange([KI], [KF]);
    end
  else 
    AjustaBusca;  
  end;

  RefreshBotoes;  
    
  TV.DataController.Summary.Recalculate;
  
  if edBusca.Enabled then
  if TextoBusca>'' then begin
    if (FTipoBusca=busCodigo) then
      Tab.SetRange([False, StrToIntDef(TextoBusca, 0)], [False, StrToIntDef(TextoBusca, 0)]) else
      Tab.SetRange([False, TextoBusca], [False, TextoBusca+'zzzzzzzzzzzzzzzzzzzzzzzzzzz']); // do not localize
  end else
    Tab.SetRange([False], [False]);
      
  if Tab.RecordCount = 1  then
    SQuant := S1Cliente else  
    SQuant := IntToStr(Tab.RecordCount) + SClientes;
end;

procedure TfbClientes.cmVenderCredClick(Sender: TObject);
var 
  DT: TDadosTempo;  
  CT: TncCredTempo;
  S: TncSessao;
begin
  inherited;
  DT.Limpa;
  with Dados do
  S := CM.Sessoes.PorCliente[TabID.Value];
  if S<>nil then begin
    DT.dtMaq := S.Maq;
    DT.dtDadosCli.dcCodigo := S.Cliente;
    if S.Cliente>0 then
      DT.dtDadosCli.dcNome := S.NomeCliente;
  end else begin
    DT.dtDadosCli.dcCodigo := TabID.Value;
    DT.dtDadosCli.dcNome   := TabNome.Value;
  end;
  if Sender=cmResgTempo then
    DT.dtFidResgate := True;
    
  if TFrmTempo.Create(Self).Editar(True, True, @DT, 0, True, 0, 0, True) then 
  begin 
    CT := TncCredTempo.Create;
    try
      DT.SaveToCredTempo(CT);
      if S<>nil then CT.teSessao := S.ID;
      CT._Operacao := osIncluir;
      Dados.CM.SalvaCredTempo(CT);
      CalcTotais;
      Tab.Refresh;
    finally
      CT.Free;
    end;
  end;
end;

procedure TfbClientes.cmZerarTempoClick(Sender: TObject);
begin
  inherited;
  case TFrmZeraTempo.Create(Self).Zerar(TabNome.Value) of
    0 : begin
      Tab.Edit;
      TabMinutosUsados.Value := 0;
      Tab.Post;
    end;
    1 : begin
      Tab.First;
      while not Tab.Eof do begin
        Tab.Edit;
        TabMinutosUsados.Value := 0;
        Tab.Post;
        Tab.Next;
        Application.ProcessMessages;
      end;
      ShowMessage(STempoAcumuladoDeTodosClientesFoi);
    end;
  end;
end;

procedure TfbClientes.cmZerarTudoClick(Sender: TObject);
begin
  inherited;
  if SimNao(SDesejaZerarOsPontosFidelidadeDeT) and
     SimNao(SEssaOperaçãoVaiZerarOsPontosFide) 
  then
    Dados.CM.AjustaPontosFid(0, 0, 0, SZerouPontosDeTodosClientes);
end;

procedure TfbClientes.btnAcharClick(Sender: TObject);
begin
  inherited;
  if (not btnAchar.Down) and (TextoBusca>'') then begin
    edBusca.Text := '';
    Tab.SetRange([False], [False]);
  end;
end;

procedure TfbClientes.btnRecriaDebitosClick(Sender: TObject);
begin
  inherited;
  DM.RecriaDebitos;
end;

procedure TfbClientes.CalcTotais;
begin
  STotDeb := FloatToStrF(Dados.TotalDebitos, ffCurrency, 10, 2);
  STotCred := MinutosToHMSAbrev(Dados.TotalCreditos);
  STotValor := FloatToStrF(Dados.TotalCredValor, ffCurrency, 10, 2);
  STotPass := MinutosToHMSAbrev(Dados.TotalPassCli);
end;

procedure TfbClientes.cmDebTempoClick(Sender: TObject);
var 
  T: TncDebTempo;
  Tempo: Double;
  Obs: String;
  CredValor : Boolean;
begin
  T := TncDebTempo.Create;
  try
    T.Func := Dados.CM.Username;
    T.Cliente := TabID.Value;
    Tempo := 0;
    Obs := '';
    CredValor := False;
    if TFrmDebTempo.Create(nil).Editar(True, True, TabNome.Value, Tempo, Obs, CredValor, TabMinutos.Value, TabValorCred.Value) then begin
      T.Obs := Obs;
      T.QtdTempo := Tempo;
      T.CredValor := CredValor;
      Dados.CM.SalvaDebTempo(T);
    end;
    CalcTotais;
    Tab.Refresh;  
  finally
    T.Free;
  end;
  Tab.Refresh;  
end;

class function TfbClientes.Descricao: String;
begin
  Result := SClientes_1;
end;

procedure TfbClientes.cmExibirClick(Sender: TObject);
var P : TPoint;
begin
  P := ItemLinkScreenPoint(cmExibir.ClickItemLink);
  pmExibir.Popup(P.X, P.Y);
end;

procedure TfbClientes.edBuscaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_UP : Tab.Prior;
    VK_Down : Tab.Next;
    VK_Return : cmEditarClick(nil);
    VK_Escape : btnAcharClick(nil);
  end;
end;

procedure TfbClientes.edBuscaPropertiesChange(Sender: TObject);
begin
  inherited;
  if TextoBusca>'' then begin
    if (FTipoBusca=busCodigo) then 
      Tab.SetRange([False, StrToIntDef(TextoBusca, 0)], [False, StrToIntDef(TextoBusca, 0)]) else
      Tab.SetRange([False, TextoBusca], [False, TextoBusca+'zzzzzzzzzzzzzzzzzzzzzzzzzzz']); // do not localize
    btnAchar.Down := True;
    btnAchar.Enabled := True;
  end else begin
    Tab.SetRange([False], [False]);
    btnAchar.Down := False;
    btnAchar.Enabled := False;
  end;
end;

procedure TfbClientes.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  {$ifdef LOJA}
  cmSenha.Visible := ivNever;
  cmSubTempo.Visible := ivNever;
  cmZerarTempo.Visible := ivNever;

  TVUsername.Visible := False;
  TVUsername.VisibleForCustomization := False;
  TVsenha.Visible := False;
  TVSenha.VisibleForCustomization := False;
  TVCredito.Visible := False;
  TVCredito.VisibleForCustomization := False;
  TVValorCred.Visible := False;
  TVValorCred.VisibleForCustomization := False;
  TVPassaportes.Visible := False;
  TVPassaportes.VisibleForCustomization := False;
  TVTempoUsado.Visible := False;
  TVTempoUsado.VisibleForCustomization := False;
  TVNickname.Visible := False;
  TVNickname.VisibleForCustomization := False;
  
  {$endif}
  STotDeb := '';
  STotValor := '';
  STotCred := '';
  SQuant := '';
  FTipoFiltro := fltNenhum;
  FTipoBusca := Dados.tbConfigCampoLocalizaCli.Value;
  case FTipoBusca of
    busNome : cmPorNome.Down := True;
    busUsername : cmPorUsername.Down := True;
  else
    cmPorCodigo.Down := True;  
  end;
  FPass := TncPassaportes.Create;
end;

procedure TfbClientes.FrmBasePaiDestroy(Sender: TObject);
begin
  inherited;
  FPass.Free;
end;

procedure TfbClientes.lbDebTotalDblClick(Sender: TObject);
begin
  inherited;
  DM.ReprocessaDebitos;
  ShowMessage(SDébitosReprocessados);
end;

procedure TfbClientes.mtEtqCalcFields(DataSet: TDataSet);
var S: String;
begin
  inherited;
  S := IntToStr(mtEtqID.Value);
  while Length(S)<6 do S := '0'+S;
  mtEtqCodigo.Value := S;
end;

procedure TfbClientes.RefreshBotoes;
begin
  cmFidelidade.Enabled := (not Tab.IsEmpty) and 
                          gConfig.FidAtivo and 
                          Versoes.PodeUsar(idre_fidelidade) and
                          Permitido(daAtenderClientes);
                          
  cmNovo.Enabled := Permitido(daCliCadastrar);
  cmApagar.Enabled := Permitido(daCliApagar);
  
  cmEditar.Enabled := (not Tab.IsEmpty);
  cmApagar.Enabled := cmEditar.Enabled and Permitido(daCliApagar);
  cmSenha.Enabled := cmEditar.Enabled;
  cmSubTempo.Enabled := cmEditar.Enabled and Permitido(daAtenderClientes);
  cmPagarDebito.Enabled := cmEditar.Enabled and (TabDebito.Value>0) and Permitido(daAtenderClientes);
end;

procedure TfbClientes.TabFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  Accept := not TabFornecedor.Value;
end;

function TfbClientes.TextoBusca: String;
begin
  Result := Trim(edBusca.Text);
end;

procedure TfbClientes.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;
  Tab.Refresh;
end;

procedure TfbClientes.Timer2Timer(Sender: TObject);
begin
  inherited;
  Timer2.Enabled := False;
  try
    if (FrmPri.FM.FormAtivo=Self) and edBusca.Enabled then 
      SetFocusBusca;
  except
  end;
end;

function TfbClientes.ToolbarIsRibbonGroup(aBar: TdxBar): Boolean;
begin
  Result := (aBar = BarMgr.BarByComponentName(SBarMgrBar1));
end;

procedure TfbClientes.TVCreditoGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  inherited;
  V := ARecord.Values[TVCredito.Index];
  if V<>null then
    AText := MinutosToHMSAbrev(V);
end;

procedure TfbClientes.TVDataControllerFilterChanged(Sender: TObject);
begin
  inherited;
  if not Tab.Filtered then FiltraDados;
end;

procedure TfbClientes.TVDataControllerFilterRecord(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var Accept: Boolean);
var V: Variant;  
begin
  inherited;
  V := ADataController.Values[ARecordIndex, TvFornecedor.Index];
  Accept := (V=null) or (V=False);
end;

procedure TfbClientes.TVDebitoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  with aviewinfo do
  if (Value<>Null) and (Value>0.009) then begin
    ACanvas.Canvas.Brush.Color := clRed;
    ACanvas.Canvas.Font.Color := clWhite;
  end;
end;

procedure TfbClientes.TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  RefreshBotoes;
end;

procedure TfbClientes.TVInativoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  with aviewinfo do 
  if (Value<>Null) and (Value=True) then begin
    ACanvas.Canvas.Brush.Color := clGray;
    ACanvas.Canvas.Font.Color := clWhite;
  end;
end;

procedure TfbClientes.TVIsentoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  with aviewinfo do 
  if (Value<>Null) and (Value=True) then begin
    ACanvas.Canvas.Brush.Color := clGreen;
    ACanvas.Canvas.Font.Color := clWhite;
  end;
end;

procedure TfbClientes.TVPassaportesGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
var V: Variant;
begin
  inherited;
  V := ARecord.Values[TVPassaportes.Index];
  if (V<>null) and (V>0) then
    AText := MinutosToHMSAbrev(V) else
    AText := '';
end;

procedure TfbClientes.TVTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems0GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  inherited;
  AText := STotDeb;
end;

procedure TfbClientes.TVTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems1GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  inherited;
  AText := STotCred;
end;

procedure TfbClientes.TVTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems2GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  inherited;
  AText := SQuant;
end;

procedure TfbClientes.TVTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems3GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  inherited;
  AText := STotValor;
end;

procedure TfbClientes.TVTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems4GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  inherited;
  AText := STotPass;
end;

procedure TfbClientes.TVTempoUsadoGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;
begin
  inherited;
  V := ARecord.Values[TVTempoUsado.Index];
  if V<>null then
    AText := MinutosToHMSAbrev(V);
end;

procedure TfbClientes.cmNovoClick(Sender: TObject);
var SIndex: String;
begin
  edBusca.EditValue := '';
  Tab.SetRange([False], [False]);
  btnAchar.Enabled := False;
  btnAchar.Down := False;

  TFrmCadCli.Create(Self).Novo(Tab, nil);
  SIndex := Dados.tbCli.IndexName;
  Dados.tbCli.IndexName := 'IID'; // do not localize
  try
    Dados.tbCli.FindKey([TabID.Value]);
  finally
    Dados.tbCli.IndexName := SIndex;
  end;
end;

procedure TfbClientes.cmEditarClick(Sender: TObject);
var SIndex : String;
begin
  inherited;
  if Tab.IsEmpty then Exit;
  
  TFrmCadCli.Create(Self).Editar(Tab, nil);
  SIndex := Dados.tbCli.IndexName;
  Dados.tbCli.IndexName := 'IID'; // do not localize
  try
    Dados.tbCli.FindKey([TabID.Value]);
  finally
    Dados.tbCli.IndexName := SIndex;
  end;
end;

procedure TfbClientes.cmEtqClick(Sender: TObject);
var 
  AInicio : Integer;
  ATodos : Boolean;
  ARes : Integer;  
  S: String;
begin
  inherited;
  mtEtq.Active := False;
  AInicio := 1;
  ATodos := False;
  S := ExtractFilePath(ParamStr(0))+'EtiquetaCliente.fr3'; // do not localize
  
  repeat
    ARes := TFrmImpEtqCli.Create(Self).Editar(TabNome.Value, AInicio, ATodos);
    frEtq.FileName := S;
    rpDesigner.OpenDir := ExtractFilePath(ParamStr(0));
    rpDesigner.SaveDir := rpDesigner.OpenDir;
    if ARes=2 then begin
      if not FileExists(S) then 
        frEtq.SaveToFile(S);
      frEtq.DesignReport;
    end;
  until (ARes in [0..1]);

  if (Tab.RecordCount>0) and (ARes=1) then begin
    try
      mtEtq.Open;
      while AInicio>1 do begin
        mtEtq.Append;
        mtEtq.Post;
        Dec(AInicio);
      end;
      if ATodos then begin
        Tab.First;
        while not Tab.Eof do begin
          mtEtq.Append;
          TransfDados(Tab, mtEtq);
          mtEtq.Post;
          Tab.Next;
        end;
        mtEtq.First;
      end else begin
        mtEtq.Append;
        TransfDados(Tab, mtEtq);
        mtEtq.Post;
      end;
      if FileExists(S) then
        frEtq.LoadFromFile(S);
      frEtq.ShowReport;  
    finally
      mtEtq.Active := False;
    end;

  end;

end;

procedure TfbClientes.cmFidelidadeClick(Sender: TObject);
var P: TPoint;
begin
  inherited;
  P := ItemLinkScreenPoint(cmFidelidade.ClickItemLink);
  pmFidelidade.Popup(P.X, P.Y);
end;

procedure TfbClientes.cmInativoClick(Sender: TObject);
begin
  inherited;
  if TFrmDataAtivo.ObtemData(FDataFiltro, SClientesINATIVOS_1, SQueNãoVieramNaLojaNosUltimos, 1) then
    SetTipoFiltro(fltInativos);
end;

procedure TfbClientes.cmListaEmailClick(Sender: TObject);
var 
  SL: TStrings;
  Emails : String;
  I : Integer;

procedure AddEmail(S: String);
begin
  S := Trim(S);
  if S>'' then

  while (S>'') and (S[Length(S)] in [';', ',']) do Delete(S, Length(S), 1);
  if Emails>'' then Emails := Emails + '; ';
  Emails := Emails + S;
end;  

begin
  inherited;
  if not SimNao(SDesejaGerarUmaListaDeEMailsDosCl) then Exit;

  SL := TStringList.Create;
  Emails := '';
  PB.Properties.Max := Tab.RecordCount;
  PB.Position := 0;
  PB.Visible := True;
  Tab.DisableControls;
  try
    Tab.First;
    while not Tab.Eof do begin
      Pb.Position := PB.Position + 1;
      Application.ProcessMessages;
      SL.Text := Trim(TabEmail.Value);
      for I := 0 to SL.Count - 1 do AddEmail(SL[i]);
      Tab.Next;
    end;
  finally
    Tab.EnableControls;
    PB.Visible := False;
    SL.Free;
  end;
  TFrmEmails.Create(nil).Mostrar(Emails);
end;

procedure TfbClientes.cbObsClick(Sender: TObject);
begin
  inherited;
  TV.Preview.Visible := cmObs.Down;
end;

procedure TfbClientes.cmAlterarSenhaClick(Sender: TObject);
var S: String;
begin
  S := TFrmAlteraSenha.Create(Self).Editar(TabSenha.Value, TabNome.Value);
  if S <> TabSenha.Value then begin
    Tab.Edit;
    TabSenha.Value := S;
    Tab.Post;
  end;
end;

procedure TfbClientes.cmAniverHojeClick(Sender: TObject);
begin
  inherited;
  SetTipoFiltro(TdxBarButton(Sender).Tag);
end;

procedure TfbClientes.cmApagarClick(Sender: TObject);
begin
  inherited;
  if Dados.CM.Sessoes.PorCliente[TabID.Value] <> nil then 
  begin
    Beep;
    ShowMessage(SNãoéPossívelApagarUmClienteQueEs);
    Exit;
  end;

  if TabDebito.Value > 0.009 then begin
    Beep;
    ShowMessage(SEsseClientePossuiItensEmDébitoÉN);
    Exit;
  end;
  
  if SimNao(SConfirmaAExclusãoDe+TabNome.Value+' ?') then Tab.Delete;
end;

procedure TfbClientes.cmApagarSenhaClick(Sender: TObject);
begin
  if TabIsento.Value and (not Permitido(daApagarSenhaClienteGratis)) then begin
    ShowMessage(SVocêNãoTemPermissãoParaApagarASe);
    Exit;
  end;
  if SimNao(SEssaOpçãoDeveSerUtilizadaQuandoO+
            SDessaFormaElePoderáCriarUmaNovaS) then 
  begin
    Tab.Edit;
    TabSenha.Clear;
    Tab.Post;
  end;
end;

procedure TfbClientes.cmAtivoClick(Sender: TObject);
begin
  inherited;
  if TFrmDataAtivo.ObtemData(FDataFiltro, SClientesATIVOS_1, SQueVieramNaLojaNosUltimos, 2) then
    SetTipoFiltro(fltAtivos);
end;

procedure TfbClientes.cmCorrigirFidClick(Sender: TObject);
var
  Pontos: Double;
  Obs: String;
  Fator: Smallint;
begin
  inherited;
  if Tab.IsEmpty then Exit;

  Pontos := 0;
  Obs := '';
  Fator := 1;

  if TFrmAjustaFid.Create(Self).Editar(True, True, TabNome.Value, Pontos, Obs, Fator, TabFidPontos.Value) then
  begin
    Dados.CM.AjustaPontosFid(TabID.Value, Fator, Pontos, Obs);
    Tab.Refresh;
    Timer1.Enabled := True;
  end;
end;

procedure TfbClientes.cmPagarDebitoClick(Sender: TObject);
var Deb: TncDebito;
begin
  Deb := TncDebito.Create;
  try
    Deb.Cliente := TabID.Value;
    Deb.Operacao := osIncluir;
    DM.LoadIDeb(Deb);
    if TFrmDebito.Create(nil).Editar(True, Deb, TabNome.Value) then
    begin
      Dados.CM.SalvaDebito(Deb);
      Tab.Refresh;
    end;
  finally
    Deb.Free;
  end;
end;

procedure TfbClientes.cmPorNomeClick(Sender: TObject);
begin
  inherited;
  SetTipoBusca(TdxBarButton(Sender).Tag);
end;

procedure TfbClientes.cmResgProdutoClick(Sender: TObject);
begin
  inherited;
  Dados.NovoMovEst(trEstVenda, TabID.Value, True);
  Tab.Refresh;
end;

procedure TfbClientes.cmResgTempoClick(Sender: TObject);
begin
  inherited;
  cmVenderCredClick(cmResgTempo);
  Tab.Refresh;
end;

procedure TfbClientes.cmSenhaClick(Sender: TObject);
var P : TPoint;
begin
  P := ItemLinkScreenPoint(cmSenha.ClickItemLink);
  pmSenha.Popup(P.X, P.Y);
end;

procedure TfbClientes.cmSubTempoClick(Sender: TObject);
var P : TPoint;
begin
  P := ItemLinkScreenPoint(cmSubTempo.ClickItemLink);
  pmTempo.Popup(P.X, P.Y);
end;

procedure TfbClientes.AtualizaDireitos;
begin
  inherited;
  cmCorrigirFid.Enabled := Permitido(daCorrigirFidelidade);
  cmDebTempo.Enabled := Permitido(daCliDebitarTempo);
  cmZerarTempo.Enabled := Permitido(daZerarTempoAcumulado);
  cmApagarSenha.Enabled := Permitido(daApagarSenhaCliente);
  
  cmZerarTudo.Enabled := Dados.CM.UA.Admin;
  {$IFDEF LAN}
  TVSenha.Visible := Dados.CM.Config.VerSenhaCli;
  TVSenha.VisibleForCustomization := Dados.CM.Config.VerSenhaCli;
  {$ENDIF}
  if Tab.Active then Tab.Refresh;

  if gConfig.FidAtivo then
    cmFidelidade.Hint := SFidelidade else
    cmFidelidade.Hint := SÉNecessárioAtivarOSistemaDeFidel;
//  btnRecriaDebitos.Visible := SameText(ParamStr(1), 'imp');
  RefreshBotoes;
end;

type
  TdxBarControlAccess = class(TdxBarControl);
  
procedure TfbClientes.SetFocusBusca;
begin
  edBusca.SetFocus;
  with cmBusca.Links[0] do
  begin
    TdxBarControlAccess(BarControl).FocusItemControl(Control);
{    with TcxCustomMaskEdit(TcxBarEditItemControl(Control).Edit) do begin
      SetFocus;
      DoEnter;
    end;}
  end;
  edBusca.SetFocus;
end;

procedure TfbClientes.SetTipoBusca(aTipo: Byte);
begin
  if aTipo=FTipoBusca then Exit;
  FTipoBusca := aTipo;
  if (FrmPri.FM.FormAtivo=Self) and edBusca.Enabled then
    SetFocusBusca;
  FiltraDados;
end;

procedure TfbClientes.SetTipoFiltro(aTipo: Byte);
begin
  if aTipo=FTipoFiltro then Exit;
  FTipoFiltro := aTipo;
  FiltraDados;
end;

end.

