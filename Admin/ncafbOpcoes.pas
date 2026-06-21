unit ncafbOpcoes;
{
    ResourceString: Dario 10/03/13
}

interface

{$I Nex.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems,
  ExtCtrls, cxStyles, cxGraphics, cxEdit, cxCheckBox, cxDBLookupComboBox,
  cxMaskEdit, cxTimeEdit, cxImageComboBox, cxColorComboBox, cxVGrid,
  cxClasses, cxDBVGrid, cxInplaceContainer, cxPC, cxControls,
  cxDropDownEdit, cxSpinEdit, cxMemo, cxTextEdit, cxContainer, cxGroupBox,
  cxRadioGroup, cxLabel, DB, kbmMemTable, cxCheckListBox, LMDCustomComponent,
  LMDCustomHint, LMDHint, cxCurrencyEdit, cxButtonEdit, ComCtrls, cxTreeView,
  cxDBEdit, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, LMDControl,
  LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, cxLookupEdit, cxDBLookupEdit, LMDCustomScrollBox, LMDScrollBox,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxPropertiesStore, nxdb, LMDNativeHint, LMDCustomShapeHint, 
  dxNavBarCollns, dxNavBarBase, dxNavBar,
  ncafbAvisos, ncafbPatrocinadores, cxCheckComboBox, cxDBCheckComboBox,
  cxDBCheckListBox, cxLookAndFeels, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  cxPCdxBarPopupMenu, dxPScxGridLnk, dxPScxGridLayoutViewLnk, LMDPNGImage, jpeg,
  cxImage, dxPScxPivotGridLnk, uNexTransResourceStrings_PT, ncaFrmConfigRec,
  ncafbEspecie, dxBarBuiltInMenu, uParentedPanel;

type
  TfbOpcoes = class(TFrmBase)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxVerticalGridStyleSheetUserFormat2: TcxVerticalGridStyleSheet;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cmSalvar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    MT: TkbmMemTable;
    DS: TDataSource;
    LMDHint1: TLMDHint;
    t: TcxGridPopupMenu;
    MTNumSeq: TAutoIncField;
    MTFecharProgramas: TBooleanField;
    MTAutoExecutar: TStringField;
    MTLimiteTempoPadrao: TDateTimeField;
    MTPacoteTempoReal: TBooleanField;
    MTPermiteLoginSemCred: TBooleanField;
    MTEncerramentoPrePago: TWordField;
    MTPermiteCapturaTela: TBooleanField;
    MTVariosTiposAcesso: TBooleanField;
    MTModoPagtoAcesso: TWordField;
    MTMostraPrePagoDec: TBooleanField;
    MTTempoMaxAlerta: TDateTimeField;
    MTAbre1: TDateTimeField;
    MTAbre2: TDateTimeField;
    MTAbre3: TDateTimeField;
    MTAbre4: TDateTimeField;
    MTAbre5: TDateTimeField;
    MTAbre6: TDateTimeField;
    MTAbre7: TDateTimeField;
    MTFecha1: TDateTimeField;
    MTFecha2: TDateTimeField;
    MTFecha3: TDateTimeField;
    MTFecha4: TDateTimeField;
    MTFecha5: TDateTimeField;
    MTFecha6: TDateTimeField;
    MTFecha7: TDateTimeField;
    MTCorLivre: TIntegerField;
    MTCorFLivre: TIntegerField;
    MTCorUsoPrePago: TIntegerField;
    MTCorFUsoPrePago: TIntegerField;
    MTCorUsoPosPago: TIntegerField;
    MTCorFUsoPosPago: TIntegerField;
    MTCorAguardaPagto: TIntegerField;
    MTCorFAguardaPagto: TIntegerField;
    MTCorManutencao: TIntegerField;
    MTCorFManutencao: TIntegerField;
    MTCorPausado: TIntegerField;
    MTCorFPausado: TIntegerField;
    MTCorDesktop: TIntegerField;
    MTCorFDesktop: TIntegerField;
    MTCampoLocalizaCli: TWordField;
    MTManterSaldoCaixa: TBooleanField;
    MTNaoMostrarMsgDebito: TBooleanField;
    MTTolerancia: TDateTimeField;
    MTRegImp98: TBooleanField;
    MTLimitePadraoDebito: TCurrencyField;
    MTRecPorta: TStringField;
    MTRecSalto: TWordField;
    MTRecLargura: TWordField;
    MTRecRodape: TMemoField;
    MTRecImprimir: TWordField;
    MTRecMatricial: TBooleanField;
    MTRecNomeLoja: TStringField;
    MTMostraProgAtual: TBooleanField;
    MTMostraObs: TBooleanField;
    MTEscondeTextoBotoes: TBooleanField;
    MTEscondeTipoAcesso: TBooleanField;
    MTExigirRG: TBooleanField;
    MTMostrarApenasPIN: TBooleanField;
    MTTextoPIN: TStringField;
    MTAlterarSenhaCli: TBooleanField;
    MTVerSenhaCli: TBooleanField;
    MTCliCadPadrao: TBooleanField;
    MTControlaImp: TWordField;
    MTFiltrarWEB: TBooleanField;
    MTSiteRedirFiltro: TStringField;
    MTBloqDownload: TBooleanField;
    MTBloqMenuIniciar: TBooleanField;
    MTBloqPainelCtrl: TBooleanField;
    MTBloqCtrlAltDel: TBooleanField;
    MTBloqExecutar: TBooleanField;
    s: TBooleanField;
    MTPaginaInicial: TStringField;
    sal: TBooleanField;
    MTAposEncerrar: TWordField;
    MTAlinhaBarraGuard: TWordField;
    MTNoNet: TWordField;
    MTTempoSumirLogin: TWordField;
    MTEmailMetodo: TWordField;
    MTEmailServ: TStringField;
    MTEmailUsername: TStringField;
    MTEmailSenha: TStringField;
    MTEmailDestino: TMemoField;
    MTEmailEnviarCaixa: TBooleanField;
    MTEsconderDrives: TStringField;
    FM: TFormManager;
    MTBloqTray: TBooleanField;
    MTTempoB1: TWordField;
    MTTempoB2: TWordField;
    MTTempoB3: TWordField;
    MTTempoB4: TWordField;
    MTTempoB5: TWordField;
    MTTempoB6: TWordField;
    MTCredPadraoTipo: TWordField;
    MTCredPadraoCod: TIntegerField;
    MTPgVendas: TBooleanField;
    MTPgAcesso: TBooleanField;
    MTPgTempo: TBooleanField;
    MTPgImp: TBooleanField;
    MTIDTipoCred: TIntegerField;
    MTNomeTipoCred: TStringField;
    tTT: TkbmMemTable;
    tTTDescr: TStringField;
    tTTTipo: TSmallintField;
    tTTCodigo: TIntegerField;
    tTTMinutos: TIntegerField;
    tTTValor: TCurrencyField;
    tTTTipoAcesso: TIntegerField;
    tTTID: TAutoIncField;
    MTPgVendaAvulsa: TBooleanField;
    MTMostraNomeMaq: TBooleanField;
    MTBloqBotaoDir: TBooleanField;
    MTBloquearUsoEmHorarioNP: TBooleanField;
    MTMinutosDesligaMaq: TWordField;
    MTOpcaoChat: TWordField;
    MTSalvarCodUsername: TBooleanField;
    MTCorMaqManut: TIntegerField;
    MTCorFMaqManut: TIntegerField;
    MTContinuarCredTempo: TBooleanField;
    MTNaoGuardarCreditoCli: TBooleanField;
    MTEncerramentoCartao: TWordField;
    MTTempoEPrePago: TWordField;
    MTTempoECartao: TWordField;
    MTCorPrevisao: TIntegerField;
    MTCorFPrevisao: TIntegerField;
    MTRelCaixaAuto: TBooleanField;
    MTAlteraLoginSemCred: TBooleanField;
    MTNaoCobrarImpFunc: TBooleanField;
    FM2: TFormManager;
    MTSincronizarHorarios: TBooleanField;
    MTMostrarDebitoNoGuard: TBooleanField;
    MTBloquearLoginAlemMaxDeb: TBooleanField;
    MTClienteNaoAlteraSenha: TBooleanField;
    MTNaoObrigarSenhaCliente: TBooleanField;
    MTNaoVenderAlemEstoque: TBooleanField;
    MTCreditoComoValor: TBooleanField;
    MTCliAvulsoNaoEncerra: TBooleanField;
    MTAutoSortGridCaixa: TBooleanField;
    MTAvisoFimTempoAdminS: TWordField;
    MTDetectarImpServ: TBooleanField;
    MTAvisoCreditos: TBooleanField;
    MTClientePodeVerCred: TBooleanField;
    MTChatAlertaSonoro: TBooleanField;
    MTChatMostraNotificacao: TBooleanField;
    MTModoCredGuard: TWordField;
    MTMsgFimCred: TStringField;
    MTSemLogin: TBooleanField;
    MTFidAtivo: TBooleanField;
    MTFidSessaoValor: TCurrencyField;
    MTFidSessaoPontos: TIntegerField;
    MTFidVendaValor: TCurrencyField;
    MTFidVendaPontos: TIntegerField;
    MTFidImpValor: TCurrencyField;
    MTFidImpPontos: TIntegerField;
    MTFidParcial: TBooleanField;
    cxPropertiesStore1: TcxPropertiesStore;
    MTFidAutoPremiar: TBooleanField;
    MTFidTipoPremioAuto: TWordField;
    MTFidPremioAuto: TIntegerField;
    MTNomePremioPass: TStringField;
    tPacote: TnxTable;
    tPacoteID: TAutoIncField;
    tPacoteMinutos: TIntegerField;
    tPacoteValor: TCurrencyField;
    tPacoteDescr: TStringField;
    tPacoteFidelidade: TBooleanField;
    tPacoteFidPontos: TIntegerField;
    tTipoPass: TnxTable;
    tTipoPassNome: TStringField;
    tTipoPassValor: TCurrencyField;
    tTipoPassTipoAcesso: TIntegerField;
    tTipoPassTipoExp: TWordField;
    tTipoPassExpirarEm: TDateTimeField;
    tTipoPassMaxSegundos: TIntegerField;
    tTipoPassObs: TMemoField;
    tTipoPassDia1: TIntegerField;
    tTipoPassDia2: TIntegerField;
    tTipoPassDia3: TIntegerField;
    tTipoPassDia4: TIntegerField;
    tTipoPassDia5: TIntegerField;
    tTipoPassDia6: TIntegerField;
    tTipoPassDia7: TIntegerField;
    tTipoPassMinutos: TIntegerField;
    tTipoPassID: TAutoIncField;
    tTipoPassFidelidade: TBooleanField;
    tTipoPassFidPontos: TIntegerField;
    tPacoteNome: TStringField;
    MTAutoObsAoCancelar: TBooleanField;
    MTFidMostrarSaldoGuard: TBooleanField;
    MTFidMostrarSaldoAdmin: TBooleanField;
    MTCliCadNaoEncerra: TBooleanField;
    MTImpedirPosPago: TBooleanField;
    MTAutoLigarMaqCli: TBooleanField;
    MTBiometria: TBooleanField;
    MTPMPausaAutomatica: TBooleanField;
    MTPMConfirmaImpCliente: TBooleanField;
    MTPMMostrarPaginasCli: TBooleanField;
    MTPMMostrarValorCli: TBooleanField;
    MTPMCalcValorCli: TWordField;
    MTPMPromptValorCli: TStringField;
    MTPMObsValorCli: TStringField;
    MTPubHomePage: TBooleanField;
    MTPubAd: TBooleanField;
    MTPubToolbar: TBooleanField;
    MTMaxTempoSessao: TWordField;
    MTFidMsg: TBooleanField;
    MTFidMsgTitulo: TStringField;
    MTFidMsgTexto: TMemoField;
    MTBloqMeuComputador: TBooleanField;
    MTBloqLixeira: TBooleanField;
    MTFiltrarDesktop: TBooleanField;
    MTFiltrarMenuIniciar: TBooleanField;
    MTBloqDownloadExe: TBooleanField;
    nbOpcoes: TdxNavBar;
    nbOpcoesGroup1: TdxNavBarGroup;
    nbOpcoesItem1: TdxNavBarItem;
    nbgGeralControl: TdxNavBarGroupControl;
    panGeral: TLMDSimplePanel;
    edCliCadPadrao: TcxDBImageComboBox;
    cxLabel16: TcxLabel;
    LabelLocalizarPor: TcxLabel;
    edCampoLocalizaCli: TcxDBImageComboBox;
    cxLabel17: TcxLabel;
    edLimiteDeb: TcxDBCurrencyEdit;
    cxDBCheckBox8: TcxDBCheckBox;
    edPermitirCaptura: TcxDBCheckBox;
    edNaoMostrarDeb: TcxDBCheckBox;
    edMonitorarSite: TcxDBCheckBox;
    edMostrarObs: TcxDBCheckBox;
    edExigirRG: TcxDBCheckBox;
    edAlteraSenhaCli: TcxDBCheckBox;
    edMostrarSenhaCli: TcxDBCheckBox;
    cxDBCheckBox4: TcxDBCheckBox;
    cbMostraNomeMaq: TcxDBCheckBox;
    cxDBCheckBox9: TcxDBCheckBox;
    edNaoVenderAlemEstoque: TcxDBCheckBox;
    cxDBCheckBox13: TcxDBCheckBox;
    edAvisoFimTempoS: TcxDBSpinEdit;
    cxLabel31: TcxLabel;
    cxLabel35: TcxLabel;
    cxDBCheckBox17: TcxDBCheckBox;
    cxDBCheckBox18: TcxDBCheckBox;
    edBiometria: TcxDBCheckBox;
    nbgMaqCli: TdxNavBarGroup;
    nbgRestrWindows: TdxNavBarGroup;
    nbgRecibos: TdxNavBarGroup;
    nbgTarifacao: TdxNavBarGroup;
    nbgAvisoFimTempo: TdxNavBarGroup;
    nbgCores: TdxNavBarGroup;
    nbgCaixa: TdxNavBarGroup;
    nbgFidelidade: TdxNavBarGroup;
    nbgPub: TdxNavBarGroup;
    nbgImp: TdxNavBarGroup;
    nbgPatro: TdxNavBarGroup;
    nbgMaqCliControl: TdxNavBarGroupControl;
    LMDScrollBox6: TLMDScrollBox;
    edAutoLigarMaqCli: TcxDBCheckBox;
    edSemLogin: TcxDBCheckBox;
    edCliCadNaoEncerra: TcxDBCheckBox;
    cxDBCheckBox12: TcxDBCheckBox;
    cxDBCheckBox11: TcxDBCheckBox;
    cxDBCheckBox10: TcxDBCheckBox;
    edChat: TcxDBImageComboBox;
    lbChat: TcxLabel;
    cxLabel34: TcxLabel;
    edMinutosDesligarMaq: TcxDBSpinEdit;
    cxLabel33: TcxLabel;
    edEsconderSenha: TcxDBCheckBox;
    edFecharProg: TcxDBCheckBox;
    edEsconderCrono: TcxDBCheckBox;
    edNomeUsuario: TcxDBTextEdit;
    cxLabel13: TcxLabel;
    edAutoExec: TcxDBTextEdit;
    cxLabel12: TcxLabel;
    edPaginaInicial: TcxDBTextEdit;
    cxLabel11: TcxLabel;
    edTempoEscondeLogin: TcxDBSpinEdit;
    cxLabel10: TcxLabel;
    edAposFinalizar: TcxDBImageComboBox;
    cxLabel9: TcxLabel;
    cxLabel8: TcxLabel;
    edNoNet: TcxDBImageComboBox;
    cxLabel1: TcxLabel;
    cxLabel14: TcxLabel;
    nbgRestrWindowsControl: TdxNavBarGroupControl;
    clbDrives: TcxCheckListBox;
    cxLabel6: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel4: TcxLabel;
    edBloqLixeira: TcxDBCheckBox;
    edBloqMeuComputador: TcxDBCheckBox;
    edBloqBotaoDir: TcxDBCheckBox;
    cbBloqDownloadExe: TcxDBCheckBox;
    edBloqDownloads: TcxDBCheckBox;
    edBloqMeusLocaisRede: TcxDBCheckBox;
    edBloqExecutar: TcxDBCheckBox;
    edBloqCtrlAltDel: TcxDBCheckBox;
    edBloqPainelCtrl: TcxDBCheckBox;
    cbFiltrarDesktop: TcxDBCheckBox;
    cbFiltrarMenuIniciar: TcxDBCheckBox;
    edBloqMenuIniciar: TcxDBCheckBox;
    nbgRecibosControl: TdxNavBarGroupControl;
    nbgTarifacaoControl: TdxNavBarGroupControl;
    LMDScrollBox1: TLMDScrollBox;
    edLoginSemCred: TcxDBCheckBox;
    edAlteraLoginSemCred: TcxDBCheckBox;
    edCronoDec: TcxDBCheckBox;
    edEscodeTipoAcesso: TcxDBCheckBox;
    cxLabel3: TcxLabel;
    edTolerancia: TcxDBTimeEdit;
    edFimPrePago: TcxDBImageComboBox;
    edTempoEPrePago: TcxDBSpinEdit;
    edEncerramentoCartao: TcxDBImageComboBox;
    edTempoECartao: TcxDBSpinEdit;
    lbTempoECartao: TcxLabel;
    cxLabel36: TcxLabel;
    lbTempoEPrePago: TcxLabel;
    cxLabel7: TcxLabel;
    cxDBCheckBox3: TcxDBCheckBox;
    cxDBCheckBox5: TcxDBCheckBox;
    cxDBCheckBox6: TcxDBCheckBox;
    cxGroupBox1: TcxGroupBox;
    edTempoB1: TcxDBSpinEdit;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    edTempoB2: TcxDBSpinEdit;
    edTempoB3: TcxDBSpinEdit;
    cxLabel22: TcxLabel;
    edTempoB4: TcxDBSpinEdit;
    edTempoB5: TcxDBSpinEdit;
    cxLabel23: TcxLabel;
    cxLabel24: TcxLabel;
    edTempoB6: TcxDBSpinEdit;
    cxLabel21: TcxLabel;
    cxLabel18: TcxLabel;
    cxLabel25: TcxLabel;
    edCredPadrao: TcxDBLookupComboBox;
    edCreditoComoValor: TcxDBCheckBox;
    cxDBCheckBox15: TcxDBCheckBox;
    edModoCredGuard: TcxDBImageComboBox;
    cxLabel37: TcxLabel;
    cxLabel38: TcxLabel;
    edMsgFimCred: TcxDBTextEdit;
    LMDSimplePanel1: TLMDSimplePanel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    cxLabel52: TcxLabel;
    cxLabel53: TcxLabel;
    cxDBCheckBox16: TcxDBCheckBox;
    nbgAvisoFimTempoControl: TdxNavBarGroupControl;
    nbgCoresControl: TdxNavBarGroupControl;
    LMDScrollBox5: TLMDScrollBox;
    vgCor: TcxDBVerticalGrid;
    vgCorCMaqLivre: TcxCategoryRow;
    vgCorMaqLivre: TcxDBEditorRow;
    vgCorFMaqLivre: TcxDBEditorRow;
    vgCorCUsoPre: TcxCategoryRow;
    vgCorMaqUsoPre: TcxDBEditorRow;
    vgCorFUsoPre: TcxDBEditorRow;
    vgCorCUsoPos: TcxCategoryRow;
    vgCorUsoPos: TcxDBEditorRow;
    vgCorFUsoPos: TcxDBEditorRow;
    vgCorCUsoManut: TcxCategoryRow;
    vgCorManut: TcxDBEditorRow;
    vgCorFManut: TcxDBEditorRow;
    vgCorCPausada: TcxCategoryRow;
    vgCorPausa: TcxDBEditorRow;
    vgCorFPausa: TcxDBEditorRow;
    vgCorCategoryRow4: TcxCategoryRow;
    vgCorDesktop: TcxDBEditorRow;
    vgCorFDesktop: TcxDBEditorRow;
    vgCorCategoryRow1: TcxCategoryRow;
    vgCorMaqManut: TcxDBEditorRow;
    vgCorFMaqManut: TcxDBEditorRow;
    vgCorCategoryRow2: TcxCategoryRow;
    vgCorPrevisao: TcxDBEditorRow;
    vgCorFPrevisao: TcxDBEditorRow;
    lbPrevisao: TcxLabel;
    lbMaqManut: TcxLabel;
    lbDesktop: TcxLabel;
    lbPausa: TcxLabel;
    lbManut: TcxLabel;
    lbPosPago: TcxLabel;
    lbPrePago: TcxLabel;
    cxLabel2: TcxLabel;
    lbLivre: TcxLabel;
    nbgCaixaControl: TdxNavBarGroupControl;
    LMDScrollBox4: TLMDScrollBox;
    edManterSaldoCaixa: TcxDBCheckBox;
    cxLabel15: TcxLabel;
    edModoPagtoAcesso: TcxDBImageComboBox;
    edRelCaixaAuto: TcxDBCheckBox;
    edAutoObsAoCancelar: TcxDBCheckBox;
    gbOpcaoPagto: TcxGroupBox;
    cxLabel26: TcxLabel;
    cxLabel27: TcxLabel;
    cxLabel28: TcxLabel;
    cxLabel29: TcxLabel;
    cbPgAcesso: TcxDBImageComboBox;
    cxLabel30: TcxLabel;
    cbPgVendaAvulsa: TcxDBImageComboBox;
    cbPgTempo: TcxDBImageComboBox;
    cbPgImpressao: TcxDBImageComboBox;
    cxLabel32: TcxLabel;
    cbPgVendas: TcxDBImageComboBox;
    nbgFidelidadeControl: TdxNavBarGroupControl;
    panSemFidelidade: TLMDSimplePanel;
    lbSemFidelidade: TcxLabel;
    panDadosFid: TLMDSimplePanel;
    LMDScrollBox3: TLMDScrollBox;
    cbFidAtivo: TcxDBCheckBox;
    cbComputador: TcxGroupBox;
    cxLabel39: TcxLabel;
    edFidSessaoPontos: TcxDBSpinEdit;
    cxLabel40: TcxLabel;
    cxLabel41: TcxLabel;
    edFidSessaoValor: TcxDBCurrencyEdit;
    cxLabel42: TcxLabel;
    cbProdutos: TcxGroupBox;
    cxLabel43: TcxLabel;
    edFidVendaPontos: TcxDBSpinEdit;
    cxLabel44: TcxLabel;
    cxLabel45: TcxLabel;
    edFidVendaValor: TcxDBCurrencyEdit;
    cxLabel46: TcxLabel;
    cbImpressoes: TcxGroupBox;
    cxLabel47: TcxLabel;
    edFidImpPontos: TcxDBSpinEdit;
    cxLabel48: TcxLabel;
    cxLabel49: TcxLabel;
    edFidImpValor: TcxDBCurrencyEdit;
    cxLabel50: TcxLabel;
    cbFidParcial: TcxDBCheckBox;
    edFidAutoPremiar: TcxDBCheckBox;
    lbFidPremio: TcxLabel;
    edFidPremio: TcxDBLookupComboBox;
    edFidMostrarSaldoAdmin: TcxDBCheckBox;
    edFidMostrarSaldoGuard: TcxDBCheckBox;
    LMDSimplePanel2: TLMDSimplePanel;
    gbFidMsg: TcxGroupBox;
    edFidMsg: TcxDBCheckBox;
    lbFidMsgTitulo: TcxLabel;
    lbFidMsgTexto: TcxLabel;
    edFidMsgTitulo: TcxDBTextEdit;
    edFidMsgTexto: TcxDBMemo;
    nbgPubControl: TdxNavBarGroupControl;
    LMDSimplePanel5: TLMDSimplePanel;
    cxLabel51: TcxLabel;
    cxDBCheckBox22: TcxDBCheckBox;
    cxDBCheckBox20: TcxDBCheckBox;
    cxDBCheckBox21: TcxDBCheckBox;
    nbgImpControl: TdxNavBarGroupControl;
    nbgPatroControl: TdxNavBarGroupControl;
    MTBloqMeusDocumentos: TBooleanField;
    MTClassicStartMenu: TBooleanField;
    edBloqMeusDocs: TcxDBCheckBox;
    edClassicStartMenu: TcxDBImageComboBox;
    cxLabel55: TcxLabel;
    MTBloqueiaCliAvulso: TBooleanField;
    MTExigeDadosMinimos: TBooleanField;
    MTDadosMinimos: TStringField;
    MTCidadePadrao: TStringField;
    MTUFPadrao: TStringField;
    cbBloqueiaCliAvulso: TcxDBCheckBox;
    edDadosMin: TcxDBCheckComboBox;
    cxLabel56: TcxLabel;
    cxLabel57: TcxLabel;
    edCidadePadrao: TcxDBTextEdit;
    edUFPadrao: TcxDBTextEdit;
    cbExigeDadosMin: TcxDBCheckBox;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBCheckBox2: TcxDBCheckBox;
    MTPedirSaldoI: TBooleanField;
    MTPedirSaldoF: TBooleanField;
    MTPMPausarServ: TBooleanField;
    MTPMNaoPausar: TMemoField;
    pgImp: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    tsCotas: TcxTabSheet;
    edDetectarImp: TcxCheckBox;
    edRegValorImp: TcxCheckBox;
    edNaoCobrarImpFunc: TcxDBCheckBox;
    cxDBCheckBox14: TcxDBCheckBox;
    cxLabel54: TcxLabel;
    edPMPausaAutomatica: TcxDBCheckBox;
    edPMPausarServ: TcxDBCheckBox;
    panPMNaoPausar: TLMDSimplePanel;
    lbPMNaoPausar: TcxLabel;
    edPMNaoPausar: TcxDBMemo;
    edPMConfirmaImpCli: TcxDBCheckBox;
    edPMMostrarPaginasCli: TcxDBCheckBox;
    edPMMostrarValorCli: TcxDBCheckBox;
    LMDSimplePanel3: TLMDSimplePanel;
    lbPMCalcValorCli: TcxLabel;
    edPMCalcValorCli: TcxDBImageComboBox;
    LMDSimplePanel4: TLMDSimplePanel;
    lbPMObs: TcxLabel;
    edPMObs: TcxDBMemo;
    edPMCotasPorCli: TcxDBCheckBox;
    edPMCotas: TcxDBCheckBox;
    cxLabel58: TcxLabel;
    MTPMCotas: TBooleanField;
    MTPMCotasMaxPagDia: TIntegerField;
    MTPMCotasMaxPagMes: TIntegerField;
    MTPMCotasOpCota: TWordField;
    MTPMCotasOpExcesso: TWordField;
    MTPMCotasMaxExcesso: TIntegerField;
    panPMCotasMaxPagDia: TLMDSimplePanel;
    lbPMCotasMaxPagDia: TcxLabel;
    edPMCotasMaxPagDia: TcxDBSpinEdit;
    lbPMCotasMaxPagDia2: TcxLabel;
    panPMCotasMaxPagMes: TLMDSimplePanel;
    lbPMCotasMaxPagMes: TcxLabel;
    edPMCotasMaxPagMes: TcxDBSpinEdit;
    lbPMCotasMaxPagMes2: TcxLabel;
    lbPausaDesativada: TcxLabel;
    MTPMCotasPorCli: TBooleanField;
    LMDSimplePanel6: TLMDSimplePanel;
    lbPMCotasOpCota: TcxLabel;
    edPMCotasOpCota: TcxDBImageComboBox;
    LMDSimplePanel7: TLMDSimplePanel;
    lbPMCotasOpExcesso: TcxLabel;
    edPMCotasOpExcesso: TcxDBImageComboBox;
    lbPMCotasMaxExcesso: TcxLabel;
    edPMCotasMaxExcesso: TcxDBSpinEdit;
    MTEmailIdent: TStringField;
    MTEmailConteudo: TStringField;
    MTCamposCliCC: TMemoField;
    edCamposCliCC: TcxPopupEdit;
    cxLabel61: TcxLabel;
    edBloqToolbars: TcxDBCheckBox;
    MTBloqToolbars: TBooleanField;
    MTBloqPosPago: TBooleanField;
    MTCliCongelado: TBooleanField;
    cxDBCheckBox7: TcxDBCheckBox;
    nbgFundo: TdxNavBarGroup;
    nbgFundoControl: TdxNavBarGroupControl;
    cxGroupBox2: TcxGroupBox;
    rbFundoImg: TcxRadioButton;
    btnFundoLogin2: TcxButton;
    rbFundoWeb: TcxRadioButton;
    cxLabel62: TcxLabel;
    btnFundoDesktop2: TcxButton;
    cxLabel63: TcxLabel;
    MTFundoWeb: TBooleanField;
    MTFundoWebURL: TMemoField;
    edFundoWebURL: TcxTextEdit;
    pan_poslogin: TLMDSimplePanel;
    im_poslogin_centro: TcxImage;
    im_poslogin_topo: TcxImage;
    im_poslogin_rodape: TcxImage;
    rb_poslogin_centro: TcxRadioButton;
    rb_poslogin_topo: TcxRadioButton;
    rb_poslogin_rodape: TcxRadioButton;
    cxLabel64: TcxLabel;
    MTPosLogin: TWordField;
    edPMPDF: TcxDBCheckBox;
    MTPMPDF: TBooleanField;
    MTPMReviewCli: TBooleanField;
    MTPMReviewAdmin: TBooleanField;
    MTPMPDFPrintEng: TWordField;
    edPMPDFPrintEng: TcxDBImageComboBox;
    lbPDFPrintEng: TcxLabel;
    edNaoTransferirMaq: TcxDBCheckBox;
    MTNaoTransferirMaq: TBooleanField;
    nbgMeiosPagamento: TdxNavBarGroup;
    nbgMeiosPagamentoControl: TdxNavBarGroupControl;
    MTVerBloqueioSites: TBooleanField;
    procedure vgMCFundoDesktopEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure cmSalvarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure rgQdoCairRedePropertiesEditValueChanged(Sender: TObject);
    procedure vgMCEditValueChanged(Sender: TObject;
      ARowProperties: TcxCustomEditorRowProperties);
    procedure vgGeralEditValueChanged(Sender: TObject;
      ARowProperties: TcxCustomEditorRowProperties);
    procedure vgCorEditValueChanged(Sender: TObject;
      ARowProperties: TcxCustomEditorRowProperties);
    procedure vgRecEditValueChanged(Sender: TObject;
      ARowProperties: TcxCustomEditorRowProperties);
    procedure cxLabel5Click(Sender: TObject);
    procedure cxLabel6Click(Sender: TObject);
    procedure edEmailEnviarCaixaPropertiesChange(Sender: TObject);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure btnFundoLoginClick(Sender: TObject);
    procedure btnFundoDesktopClick(Sender: TObject);
    procedure clbDrivesClickCheck(Sender: TObject; AIndex: Integer; APrevState,
      ANewState: TcxCheckBoxState);
    procedure edDetectarImpClick(Sender: TObject);
    procedure edRegValorImpClick(Sender: TObject);
    procedure edFimPrePagoPropertiesChange(Sender: TObject);
    procedure edEncerramentoCartaoPropertiesChange(Sender: TObject);
    procedure cbFidAtivoClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure tPacoteCalcFields(DataSet: TDataSet);
    procedure edFidPremioPropertiesInitPopup(Sender: TObject);
    procedure edPMMostrarValorCliClick(Sender: TObject);
    procedure edPMConfirmaImpCliClick(Sender: TObject);
    procedure edPMPausaAutomaticaClick(Sender: TObject);
    procedure cbExigeDadosMinPropertiesEditValueChanged(Sender: TObject);
    procedure edCliCadPadraoPropertiesEditValueChanged(Sender: TObject);
    procedure edCamposCliCCPropertiesInitPopup(Sender: TObject);
    procedure edCamposCliCCPropertiesCloseUp(Sender: TObject);
    procedure rbFundoWebClick(Sender: TObject);
    procedure rbFundoImgClick(Sender: TObject);
    procedure edFundoWebURLPropertiesEditValueChanged(Sender: TObject);
    procedure im_poslogin_centroClick(Sender: TObject);
    procedure im_poslogin_topoClick(Sender: TObject);
    procedure rb_poslogin_centroClick(Sender: TObject);
    procedure im_poslogin_rodapeClick(Sender: TObject);
  private
    FAlterou : Boolean;
    fbgAvisos : TfbAvisos;
    fbgPatro : TfbPatrocinadores;
    fbgEspecie : TfbEspecie;
    FCamposCliCC : String;
    procedure SetAlterou(const Value: Boolean);
    { Private declarations }
    { Private declarations }
  protected
    FConfigRec : TFrmConfigRec;

    procedure AlterouConfigRec(Sender: TObject);
    
    property Alterou: Boolean
      read FAlterou write SetAlterou; 

    procedure AjustaVisEncerramento;
    procedure AjustaVisTipoCli;
    procedure AjustaVisDadosMin;
    procedure AjustaVisPM;

  public
    class function Descricao: String; override;
  
    procedure Ler;
    procedure Salvar;
    procedure AtualizaCores;
    procedure AtualizaDireitos; override;

    procedure RefreshPosLogin;
    { Public declarations }
  end;

var
  fbOpcoes: TfbOpcoes;
  TicksOp : Cardinal;

implementation

uses 
  ncaDM, 
  ncaFrmPri, 
  ncaFrmFundo, ncClassesBase, ncVersoes, ncafbCXLetra, ncaFrmCadCli,
  ufmImagens, Printers;

// START resource string wizard section
// MMX resource string wizard section REMOVIDA - 08/04/13 12:30


{$R *.dfm}

procedure TfbOpcoes.FrmBasePaiCreate(Sender: TObject);
var
    i : integer;
begin
  inherited;
  FConfigRec := TFrmConfigRec.Create(Self);
  FConfigRec.panPri.Parent := nbgRecibosControl;
  FConfigRec.OnAlterou := AlterouConfigRec;
  
  {$ifndef PDF}
  edPMPDF.Visible := False;
  lbPDFPrintEng.Visible := False;
  edPMPDFPrintEng.Visible := False;
  {$endif}
  for i := 0 to nbOpcoes.Groups.Count-1 do 
    nbOpcoes.Groups[i].Expanded := False;
  
  edCamposCliCC.Properties.PopupControl := fbCXLetra.panPri;
  pgImp.ActivePageIndex := 0;
  fbgPatro := TfbPatrocinadores.Create(Self);
  fbgPatro.panPri.Parent := nbgPatroControl;
  fbgPatro.FiltraDados;

  fbgAvisos := TfbAvisos.Create(Self);
  fbgAvisos.panPri.Parent := nbgAvisoFimTempoControl;
  fbgAvisos.FiltraDados;

  fbgEspecie := TfbEspecie.Create(self);
  fbgEspecie.panPri.Parent := nbgMeiosPagamentoControl;
  fbgEspecie.FiltraDados;

  tPacote.Open;
  tTipoPass.Open;
  MT.Active := True;
  Ler;
  nbgPatro.Visible := sametext('P', ParamStr(1));

  edPMCotasPorCli.Properties.Alignment := taLeftJustify;

  edDadosMin.Properties.Items.BeginUpdate;
  try
    edDadosMin.Properties.Items.Clear;
    for I := 0 to slDadosMin.Count - 1 do
      edDadosMin.Properties.Items.Add.Description := slDadosMin.Names[I];
  finally
    edDadosMin.Properties.Items.EndUpdate;
  end;


end;

procedure TfbOpcoes.im_poslogin_centroClick(Sender: TObject);
begin
  inherited;
  if rb_poslogin_centro.Enabled then
    rb_poslogin_centro.Checked := True;

  alterou := true;   

  RefreshPosLogin;
end;

procedure TfbOpcoes.im_poslogin_rodapeClick(Sender: TObject);
begin
  inherited;
  rb_poslogin_rodape.Checked := True;
  alterou := true;
  RefreshPosLogin;
end;

procedure TfbOpcoes.im_poslogin_topoClick(Sender: TObject);
begin
  inherited;
  rb_poslogin_topo.Checked := True;
  alterou := true;
  RefreshPosLogin;
end;

function StrToBoolean(S: String): Boolean;
begin
  S := UpperCase(S);
  if (S='TRUE') or (S='S') or (S='Y') then // do not localize
    Result := True
  else
    Result := False;  
end;

procedure TfbOpcoes.Ler;
var
  S: String;
  C: Char;
begin
  FConfigRec.Ler;
  
  cbFidAtivoClick(nil);

  FCamposCliCC := gConfig.CamposCliCC;

  panSemFidelidade.Visible := not Versoes.PodeUsar(idre_fidelidade);
  panDadosFid.Enabled := not panSemFidelidade.Visible;
  if panDadosFid.Enabled then
    panDadosFid.Font.Color := clBlack else
    panDadosFid.Font.Color := clGray;

  if MTFundoWeb.Value then
    rbFundoWeb.Checked := True else
    rbFundoImg.Checked := True;

  case MTPosLogin.Value of
    poslogin_centro : rb_poslogin_centro.Checked := True;
    poslogin_topo : rb_poslogin_topo.Checked := True;
    poslogin_rodape : rb_poslogin_rodape.Checked := True;
  end;  
  RefreshPosLogin;

  edFundoWebURL.Text := MTFundoWebURL.Value;  
    
  edChat.Enabled := Versoes.PodeUsar(idre_Chat);
  lbChat.Enabled := edChat.Enabled;

  tTT.Active := True;
  tTT.EmptyTable;
  Dados.RefreshTipoCred(True);
  tTT.LoadFromDataSet(Dados.tabTT,[]);
  Alterou := False;
  MT.Active := True;
  MT.EmptyTable;
  MT.Insert;
  TransfDados(Dados.tbConfig, MT);
  with Dados do 
  MTIDTipoCred.AsVariant := tTT.Lookup('Tipo;Codigo', VarArrayOf([tbConfigCredPadraoTipo.Value, tbConfigCredPadraoCod.Value]), 'ID'); // do not localize
  if MTEmailMetodo.IsNull then
    MTEmailMetodo.Value := 0;
  MT.Post;

  edAutoLigarMaqCli.Enabled := Versoes.PodeUsar(idre_ligarmaq);

  edDetectarImp.Checked := (MTControlaImp.Value>0);
  edRegValorImp.Checked := (MTControlaImp.Value=ciRegistrar);
  edRegValorImp.Enabled := edDetectarImp.Checked;

  AjustaVisEncerramento;
  AjustaVisPM;
  
  if Trim(MTTextoPIN.Value)='' then
    MTTextoPIN.Value := SncafbOpcoes_NomeDeUsuario;
  S := MTEsconderDrives.Value;
  for C := 'A' to 'Z' do
    clbDrives.Items.Items[Ord(C) - Ord('A')].Checked := (Pos(C, S)>0);
  Alterou := False;
end;

procedure TfbOpcoes.PaginasChange(Sender: TObject);
begin
  inherited;
  cbFidAtivoClick(nil);
  tPacote.Refresh;
  tTipoPass.Refresh;
end;

procedure TfbOpcoes.Salvar;
var
  I: Integer;
  S: String;
  //B : Boolean;
begin
  if not (MT.State in [dsEdit, dsInsert]) then MT.Edit;
  
  S := '';
  if rb_poslogin_centro.checked then
    MTPosLogin.value := poslogin_centro
  else
  if rb_poslogin_topo.checked then
    MTPosLogin.value := poslogin_topo 
  else
    MTPosLogin.value := poslogin_rodape;
  
  MTCamposCliCC.Value := FCamposCliCC;
  for I := 0 to clbDrives.Items.Count-1 do
  if clbDrives.Items[I].Checked then 
    S := S + Char(Ord('A') + I);
  MTEsconderDrives.Value := S;  
  MTFundoWeb.Value := rbFundoWeb.Checked;
  MTFundoWebUrl.Value := edFundoWebUrl.Text;
  if not edDetectarImp.Checked then
    MTControlaImp.Value := ciDesativado
  else
  if edRegValorImp.Checked then
    MTControlaImp.Value := ciRegistrar else
    MTControlaImp.Value := ciMonitorar;
  MT.Post;
  
  with Dados do begin
    tbConfig.Edit;
    TransfDados(MT, tbConfig);
    if tTT.Locate('ID', MTIDTipoCred.Value, []) then begin // do not localize
      tbConfigCredPadraoCod.Value := tTTCodigo.Value;
      tbConfigCredPadraoTipo.Value := tTTTipo.Value;
    end;
    tbConfig.Post;
    gConfig.AtualizaCache;
    gConfig.LeDataset(tbConfig);
    FConfigRec.Salvar;
    CM.SalvaAlteracoesObj(gConfig, False);
    AjustaCampoLocalizaCli;
  end;
  Alterou := False;
  FrmPri.AtualizaDireitos;
end;

procedure TfbOpcoes.SetAlterou(const Value: Boolean);
begin
  FAlterou := Value;
  cmSalvar.Enabled := FAlterou;
  cmCancelar.Enabled := FAlterou;
  AtualizaCores;
end;

procedure TfbOpcoes.tPacoteCalcFields(DataSet: TDataSet);
begin
  inherited;
  tPacoteNome.Value := tPacoteDescr.Value;
end;

procedure TfbOpcoes.cmSalvarClick(Sender: TObject);
begin
  inherited;
  Salvar;

  

  FrmPri.AtualizaBar;

end;

procedure TfbOpcoes.edPMPausaAutomaticaClick(Sender: TObject);
begin
  inherited;
  AjustaVisPM;
end;

procedure TfbOpcoes.cxLabel5Click(Sender: TObject);
var I : Integer;
begin
  with clbDrives do
  for I := 0 to Count - 1 do
    Items[I].Checked := True;
  Alterou := True;  
end;

procedure TfbOpcoes.cxLabel6Click(Sender: TObject);
var I : Integer;
begin
  with clbDrives do
  for I := 0 to Count - 1 do
    Items[I].Checked := False;
  Alterou := True;  
end;

procedure TfbOpcoes.cbExigeDadosMinPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  AjustaVisDadosMin;
end;

procedure TfbOpcoes.cbFidAtivoClick(Sender: TObject);
begin
  inherited;
  cbFidParcial.Enabled := cbFidAtivo.Checked;
  edFidSessaoPontos.Enabled := cbFidAtivo.Checked;
  edFidSessaoValor.Enabled := cbFidAtivo.Checked;
  edFidVendaPontos.Enabled := cbFidAtivo.Checked;
  edFidVendaValor.Enabled := cbFidAtivo.Checked;
  edFidImpPontos.Enabled := cbFidAtivo.Checked;
  edFidImpValor.Enabled := cbFidAtivo.Checked;

  gbFidMsg.Enabled := cbFidAtivo.Checked and edFidAutoPremiar.Checked;
  edFidMsg.Enabled := gbFidMsg.Enabled;
  lbFidMsgTitulo.Enabled := edFidMsg.Enabled and edFidMsg.Checked;
  edFidMsgTitulo.Enabled := lbFidMsgTitulo.Enabled;
  lbFidMsgTexto.Enabled := lbFidMsgTitulo.Enabled;
  edFidMsgTexto.Enabled := lbFidMsgTitulo.Enabled;

  edFidAutoPremiar.Enabled := cbFidAtivo.Checked;
  edFidPremio.Enabled := cbFidAtivo.Checked and edFidAutoPremiar.Checked;

  edFidMostrarSaldoAdmin.Enabled := cbFidAtivo.Checked;
  edFidMostrarSaldoGuard.Enabled := cbFidAtivo.Checked;
end;

procedure TfbOpcoes.clbDrivesClickCheck(Sender: TObject; AIndex: Integer;
  APrevState, ANewState: TcxCheckBoxState);
begin
  inherited;
  Alterou := True;
end;

procedure TfbOpcoes.cmCancelarClick(Sender: TObject);
begin
  inherited;
  Ler;
end;

procedure TfbOpcoes.rbFundoImgClick(Sender: TObject);
begin
  inherited;
  Alterou := True;
  RefreshPosLogin;
end;

procedure TfbOpcoes.rbFundoWebClick(Sender: TObject);
begin
  inherited;
  alterou := True;
  RefreshPosLogin;
end;

procedure TfbOpcoes.rb_poslogin_centroClick(Sender: TObject);
begin
  inherited;
  alterou := True;
  RefreshPosLogin;
end;

procedure TfbOpcoes.RefreshPosLogin;
begin
  rb_poslogin_centro.Enabled := not rbFundoWeb.Checked;

  if rbFundoWeb.Checked and rb_poslogin_centro.Checked then
    rb_poslogin_topo.Checked := True;

  if rb_poslogin_centro.Checked then begin
    im_poslogin_centro.Style.BorderStyle := ebsThick;
    im_poslogin_topo.Style.BorderStyle := ebsNone;
    im_poslogin_rodape.Style.BorderStyle := ebsNone;
    
    im_poslogin_centro.StyleFocused.BorderStyle := ebsThick;
    im_poslogin_topo.StyleFocused.BorderStyle := ebsNone;
    im_poslogin_rodape.StyleFocused.BorderStyle := ebsNone;
    
  end else 
  if rb_poslogin_topo.Checked then begin
    im_poslogin_centro.Style.BorderStyle := ebsNone;
    im_poslogin_topo.Style.BorderStyle := ebsThick;  
    im_poslogin_rodape.Style.BorderStyle := ebsNone;

    im_poslogin_centro.StyleFocused.BorderStyle := ebsNone;
    im_poslogin_topo.StyleFocused.BorderStyle := ebsThick;
    im_poslogin_rodape.StyleFocused.BorderStyle := ebsNone;

  end else 
  if rb_poslogin_rodape.Checked then begin
    im_poslogin_centro.Style.BorderStyle := ebsNone;
    im_poslogin_topo.Style.BorderStyle := ebsNone;  
    im_poslogin_rodape.Style.BorderStyle := ebsThick;

    im_poslogin_centro.StyleFocused.BorderStyle := ebsNone;
    im_poslogin_topo.StyleFocused.BorderStyle := ebsNone;  
    im_poslogin_rodape.StyleFocused.BorderStyle := ebsThick;
  end;
end;

procedure TfbOpcoes.rgQdoCairRedePropertiesEditValueChanged(
  Sender: TObject);
begin
  Alterou := True;
end;

procedure TfbOpcoes.vgMCEditValueChanged(Sender: TObject;
  ARowProperties: TcxCustomEditorRowProperties);
begin
  Alterou := True;
end;

procedure TfbOpcoes.vgMCFundoDesktopEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  TFrmFundo.Create(nil).Mostrar(True);
end;

procedure TfbOpcoes.vgGeralEditValueChanged(Sender: TObject;
  ARowProperties: TcxCustomEditorRowProperties);
begin
  Alterou := True;
end;

procedure TfbOpcoes.vgCorEditValueChanged(Sender: TObject;
  ARowProperties: TcxCustomEditorRowProperties);
begin
  Alterou := True;
end;

procedure TfbOpcoes.vgRecEditValueChanged(Sender: TObject;
  ARowProperties: TcxCustomEditorRowProperties);
begin
  Alterou := True;
end;

class function TfbOpcoes.Descricao: String;
begin
  Result := SncafbOpcoes_Opcoes;
end;

procedure TfbOpcoes.DSDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  Alterou := True;
  AjustaVisEncerramento;
end;

procedure TfbOpcoes.edCamposCliCCPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  if FCamposCliCC <> MTCamposCliCC.Value then begin
    if MT.State <> dsEdit then MT.Edit;
    MTCamposCliCC.Value := FCamposCliCC;
  end;
end;

procedure TfbOpcoes.edCamposCliCCPropertiesInitPopup(Sender: TObject);
begin
  inherited;
  fbCXLetra.PreparaBusca(@FCamposCliCC, slCamposCli, TcxCustomDropDownEdit(Sender));
end;

procedure TfbOpcoes.edCliCadPadraoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  AjustaVisTipoCli;
end;

procedure TfbOpcoes.edDetectarImpClick(Sender: TObject);
begin
  inherited;
  edRegValorImp.Enabled := edDetectarImp.Checked;
  Alterou := True;
end;

procedure TfbOpcoes.edEmailEnviarCaixaPropertiesChange(Sender: TObject);
begin
  inherited;
  Alterou := True;
end;

procedure TfbOpcoes.edEncerramentoCartaoPropertiesChange(Sender: TObject);
begin
  inherited;
  AjustaVisEncerramento;
end;

procedure TfbOpcoes.edFidPremioPropertiesInitPopup(Sender: TObject);
begin
  inherited;
  tPacote.Refresh;
  tTipoPass.Refresh;
end;

procedure TfbOpcoes.edFimPrePagoPropertiesChange(Sender: TObject);
begin
  inherited;
  AjustaVisEncerramento;
end;

procedure TfbOpcoes.edFundoWebURLPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  Alterou := True;
end;

procedure TfbOpcoes.edPMConfirmaImpCliClick(Sender: TObject);
begin
  inherited;
  AjustaVisPM;
end;

procedure TfbOpcoes.edPMMostrarValorCliClick(Sender: TObject);
begin
  inherited;
  AjustaVisPM;
end;

procedure TfbOpcoes.edRegValorImpClick(Sender: TObject);
begin
  inherited;
  Alterou := True;
end;

procedure TfbOpcoes.AjustaVisDadosMin;
begin
  edDadosMin.Enabled := cbExigeDadosMin.Checked;
end;

procedure TfbOpcoes.AjustaVisEncerramento;
begin
  lbTempoEPrePago.Enabled := (MTEncerramentoPrePago.Value=1);
  edTempoEPrePago.Enabled := lbTempoEPrePago.Enabled;

  lbTempoECartao.Enabled := (MTEncerramentoCartao.Value=1);
  edTempoECartao.Enabled := lbTempoECartao.Enabled;
end;

procedure TfbOpcoes.AjustaVisPM;
begin
  edPMConfirmaImpCli.Enabled := edPMPausaAutomatica.Checked;
  edPMMostrarPaginasCli.Enabled := edPMConfirmaImpCli.Checked and edPMPausaAutomatica.Checked;
  edPMMostrarValorCli.Enabled := edPMConfirmaImpCli.Checked and edPMPausaAutomatica.Checked;
  lbPMCalcValorCli.Enabled := edPMConfirmaImpCli.Checked and edPMMostrarValorCli.Checked and edPMPausaAutomatica.Checked;
  edPMCalcValorCli.Enabled := lbPMCalcValorCli.Enabled;
  lbPMObs.Enabled := edPMConfirmaImpCli.Checked and edPMPausaAutomatica.Checked;
  edPMObs.Enabled := lbPMObs.Enabled ;
  lbPMNaoPausar.Enabled := edPMPausaAutomatica.Checked;
  edPMNaoPausar.Enabled := edPMPausaAutomatica.Checked;
  edPMPausarServ.Enabled := edPMPausaAutomatica.Checked;
  tsCotas.Enabled := edPMPausaAutomatica.Checked;
  edPMCotas.Enabled := tsCotas.Enabled;
  lbPMCotasMaxPagDia.Enabled := edPMCotas.Enabled and edPMCotas.Checked;
  lbPMCotasMaxPagDia2.Enabled := edPMCotas.Enabled and edPMCotas.Checked;
  lbPMCotasMaxPagMes.Enabled := edPMCotas.Enabled and edPMCotas.Checked;
  lbPMCotasMaxPagMes2.Enabled := edPMCotas.Enabled and edPMCotas.Checked;
  edPMCotasMaxPagDia.Enabled := edPMCotas.Enabled and edPMCotas.Checked;
  edPMCotasMaxPagMes.Enabled := edPMCotas.Enabled and edPMCotas.Checked;
  edPMCotasPorCli.Enabled := edPMCotas.Enabled and edPMCotas.Checked;
  lbPMCotasOpCota.Enabled := edPMCotas.Enabled and edPMCotas.Checked;
  edPMCotasOpCota.Enabled := lbPMCotasOpCota.Enabled;
  lbPMCotasOpExcesso.Enabled := lbPMCotasOpCota.Enabled;
  edPMCotasOpExcesso.Enabled := lbPMCotasOpCota.Enabled;
  lbPMCotasMaxExcesso.Enabled := lbPMCotasOpCota.Enabled;
  edPMCotasMaxExcesso.Enabled := lbPMCotasOpCota.Enabled;
end;

procedure TfbOpcoes.AjustaVisTipoCli;
begin
  cbBloqueiaCliAvulso.Enabled := (edCliCadPadrao.ItemIndex>0);
  if (not cbBloqueiaCliAvulso.Enabled) and (MT.State=dsEdit) then begin
    cbBloqueiaCliAvulso.Checked := False;
    MTBloqueiaCliAvulso.Value := False;
  end;
end;

procedure TfbOpcoes.AlterouConfigRec(Sender: TObject);
begin
  if FConfigRec.Alterou then Alterou := True;
end;

procedure TfbOpcoes.AtualizaCores;
begin
  lbLivre.Style.Color := MTCorLivre.Value;
  lbPrePago.Style.Color := MTCorUsoPrePago.Value;
  lbPosPago.Style.Color := MTCorUsoPosPago.Value;
  lbManut.Style.Color := MTCorManutencao.Value;
  lbPausa.Style.Color := MTCorPausado.Value;
  lbDesktop.Style.Color := MTCorDesktop.Value;

  lbMaqManut.Style.Color := MTCorMaqManut.Value;
  lbMaqManut.Style.TextColor := MTCorFMaqManut.Value;

  lbPrevisao.Style.Color := MTCorPrevisao.Value;
  lbPrevisao.Style.TextColor := MTCorFPrevisao.Value;

  lbLivre.Style.TextColor := MTCorFLivre.Value;
  lbPrePago.Style.TextColor := MTCorFUsoPrePago.Value;
  lbPosPago.Style.TextColor := MTCorFUsoPosPago.Value;
  lbManut.Style.TextColor := MTCorFManutencao.Value;
  lbPausa.Style.TextColor := MTCorFPausado.Value;
  lbDesktop.Style.TextColor := MTCorFDesktop.Value;
end;

procedure TfbOpcoes.AtualizaDireitos;
begin
  lbPausaDesativada.Visible := not Versoes.PodeUsar(idre_pausaimpressao);
  edBiometria.Visible := BioActive;
  fbgAvisos.AtualizaDireitos;
  fbgPatro.AtualizaDireitos;
  fbgEspecie.AtualizaDireitos;
  AjustaVisEncerramento;
  AjustaVisTipoCli;
  AjustaVisDadosMin;
  AjustaVisPM;
  cbFidAtivoClick(nil);

  if not cmSalvar.Enabled then Ler;
  
{  FM.RegistraForm(TfbAvisos);
  FM.Mostrar(TfbAvisos, 0, 0);

  FM2.RegistraForm(TfbPatrocinadores);
  FM2.Mostrar(TfbPatrocinadores, 0, 0);}
end;

procedure TfbOpcoes.btnFundoDesktopClick(Sender: TObject);
begin
  inherited;
  TFrmFundo.Create(nil).Mostrar(True);
end;

procedure TfbOpcoes.btnFundoLoginClick(Sender: TObject);
begin
  inherited;
  rbFundoImg.Checked := True;
  Alterou := True;
  RefreshPosLogin;
  TFrmFundo.Create(nil).Mostrar(False);
end;

end.

