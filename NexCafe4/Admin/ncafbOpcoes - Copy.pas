unit ncafbOpcoes;

interface

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
  cxPropertiesStore, nxdb, LMDNativeHint, LMDCustomShapeHint, dxSkinsCore,
  dxSkinsdxBarPainter, dxNavBarCollns, dxNavBarBase, dxNavBar;

type
  TfbOpcoes = class(TFrmBase)
    Paginas: TcxPageControl;
    tsRec: TcxTabSheet;
    tsCores: TcxTabSheet;
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
    cxTabSheet1: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    t: TcxGridPopupMenu;
    cxTabSheet4: TcxTabSheet;
    tvOpcoes: TcxTreeView;
    clbDrives: TcxCheckListBox;
    edBloqPainelCtrl: TcxDBCheckBox;
    edBloqMenuIniciar: TcxDBCheckBox;
    edBloqCtrlAltDel: TcxDBCheckBox;
    edBloqExecutar: TcxDBCheckBox;
    edBloqMeusLocaisRede: TcxDBCheckBox;
    edBloqDownloads: TcxDBCheckBox;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    tsCaixa: TcxTabSheet;
    lbRecImprimir: TcxLabel;
    edRecImprimir: TcxDBImageComboBox;
    lbRecMatricial: TcxLabel;
    edRecMatricial: TcxDBImageComboBox;
    lbRecPorta: TcxLabel;
    edRecPorta: TcxDBComboBox;
    lbRecLargura: TcxLabel;
    edRecLargura: TcxDBSpinEdit;
    edRecSalto: TcxDBSpinEdit;
    lbRecSalto: TcxLabel;
    lbRecNomeLoja: TcxLabel;
    edRecNomeLoja: TcxDBTextEdit;
    lbRecRodape: TcxLabel;
    edRecRodape: TcxDBMemo;
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
    MTTipoFDesktop: TStringField;
    MTTipoFLogin: TStringField;
    MTNumFDesktop: TIntegerField;
    MTNumFLogin: TIntegerField;
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
    PagAviso: TcxPageControl;
    FM: TFormManager;
    cxDBCheckBox1: TcxDBCheckBox;
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
    cxDBCheckBox2: TcxDBCheckBox;
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
    tsPatro: TcxTabSheet;
    FM2: TFormManager;
    pagPatro: TcxPageControl;
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
    MTChatAlertaSonoro: TBooleanField;
    MTChatMostraNotificacao: TBooleanField;
    edModoCredGuard: TcxDBImageComboBox;
    cxLabel37: TcxLabel;
    cxLabel38: TcxLabel;
    edMsgFimCred: TcxDBTextEdit;
    MTModoCredGuard: TWordField;
    MTMsgFimCred: TStringField;
    LMDSimplePanel1: TLMDSimplePanel;
    MTSemLogin: TBooleanField;
    MTFidAtivo: TBooleanField;
    MTFidSessaoValor: TCurrencyField;
    MTFidSessaoPontos: TIntegerField;
    MTFidVendaValor: TCurrencyField;
    MTFidVendaPontos: TIntegerField;
    MTFidImpValor: TCurrencyField;
    MTFidImpPontos: TIntegerField;
    MTFidParcial: TBooleanField;
    tsFidelidade: TcxTabSheet;
    cxPropertiesStore1: TcxPropertiesStore;
    panSemFidelidade: TLMDSimplePanel;
    panDadosFid: TLMDSimplePanel;
    lbSemFidelidade: TcxLabel;
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
    edEmailEnviarCaixa: TcxDBCheckBox;
    gbCaixaEmail: TcxGroupBox;
    lbEmailDestino: TcxLabel;
    edEmailDestino: TcxDBMemo;
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
    LMDSimplePanel2: TLMDSimplePanel;
    MTBiometria: TBooleanField;
    tsYahoo: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    edDetectarImp: TcxCheckBox;
    edRegValorImp: TcxCheckBox;
    edNaoCobrarImpFunc: TcxDBCheckBox;
    cxDBCheckBox14: TcxDBCheckBox;
    cxGroupBox3: TcxGroupBox;
    edPMPausaAutomatica: TcxDBCheckBox;
    MTPMPausaAutomatica: TBooleanField;
    MTPMConfirmaImpCliente: TBooleanField;
    MTPMMostrarPaginasCli: TBooleanField;
    MTPMMostrarValorCli: TBooleanField;
    MTPMCalcValorCli: TWordField;
    MTPMPromptValorCli: TStringField;
    MTPMObsValorCli: TStringField;
    edPMConfirmaImpCli: TcxDBCheckBox;
    edPMMostrarPaginasCli: TcxDBCheckBox;
    edPMMostrarValorCli: TcxDBCheckBox;
    LMDSimplePanel4: TLMDSimplePanel;
    lbPMObs: TcxLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    lbPMCalcValorCli: TcxLabel;
    edPMCalcValorCli: TcxDBImageComboBox;
    edPMObs: TcxDBMemo;
    cxDBCheckBox20: TcxDBCheckBox;
    MTPubHomePage: TBooleanField;
    MTPubAd: TBooleanField;
    MTPubToolbar: TBooleanField;
    cxDBCheckBox21: TcxDBCheckBox;
    cxDBCheckBox22: TcxDBCheckBox;
    LMDSimplePanel5: TLMDSimplePanel;
    cxLabel51: TcxLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    cxLabel52: TcxLabel;
    MTMaxTempoSessao: TWordField;
    cxLabel53: TcxLabel;
    cxDBCheckBox16: TcxDBCheckBox;
    MTFidMsg: TBooleanField;
    MTFidMsgTitulo: TStringField;
    gbFidMsg: TcxGroupBox;
    edFidMsg: TcxDBCheckBox;
    lbFidMsgTitulo: TcxLabel;
    lbFidMsgTexto: TcxLabel;
    edFidMsgTitulo: TcxDBTextEdit;
    edFidMsgTexto: TcxDBMemo;
    MTFidMsgTexto: TMemoField;
    cxLabel54: TcxLabel;
    MTBloqMeuComputador: TBooleanField;
    MTBloqLixeira: TBooleanField;
    cxDBCheckBox7: TcxDBCheckBox;
    cxDBCheckBox19: TcxDBCheckBox;
    MTFiltrarDesktop: TBooleanField;
    MTFiltrarMenuIniciar: TBooleanField;
    cbFiltrarMenuIniciar: TcxDBCheckBox;
    cbFiltrarDesktop: TcxDBCheckBox;
    MTBloqDownloadExe: TBooleanField;
    cbBloqDownloadExe: TcxDBCheckBox;
    nbOpcoes: TdxNavBar;
    nbOpcoesGroup1: TdxNavBarGroup;
    nbOpcoesItem1: TdxNavBarItem;
    nbgGeralControl: TdxNavBarGroupControl;
    LMDScrollBox2: TLMDScrollBox;
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
    edSincHora: TcxDBCheckBox;
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
    nbOpcoesGroup3: TdxNavBarGroup;
    nbOpcoesGroup4: TdxNavBarGroup;
    nbOpcoesGroup5: TdxNavBarGroup;
    nbOpcoesGroup6: TdxNavBarGroup;
    nbOpcoesGroup7: TdxNavBarGroup;
    nbOpcoesGroup8: TdxNavBarGroup;
    nbOpcoesGroup9: TdxNavBarGroup;
    nbOpcoesGroup10: TdxNavBarGroup;
    nbOpcoesGroup11: TdxNavBarGroup;
    nbOpcoesGroup12: TdxNavBarGroup;
    nbgMaqCliControl: TdxNavBarGroupControl;
    LMDScrollBox6: TLMDScrollBox;
    btnFundoLogin: TcxButton;
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
    btnFundoDesktop: TcxButton;
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
    edAlinhaBarra: TcxDBImageComboBox;
    cxLabel8: TcxLabel;
    edNoNet: TcxDBImageComboBox;
    cxLabel1: TcxLabel;
    cxLabel14: TcxLabel;
    procedure vgMCFundoDesktopEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure cmSalvarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FrmBasePaiDestroy(Sender: TObject);
    procedure rgQdoCairRedePropertiesEditValueChanged(Sender: TObject);
    procedure vgMCEditValueChanged(Sender: TObject;
      ARowProperties: TcxCustomEditorRowProperties);
    procedure vgGeralEditValueChanged(Sender: TObject;
      ARowProperties: TcxCustomEditorRowProperties);
    procedure vgCorEditValueChanged(Sender: TObject;
      ARowProperties: TcxCustomEditorRowProperties);
    procedure vgRecEditValueChanged(Sender: TObject;
      ARowProperties: TcxCustomEditorRowProperties);
    procedure tvOpcoesChange(Sender: TObject; Node: TTreeNode);
    procedure cxLabel5Click(Sender: TObject);
    procedure cxLabel6Click(Sender: TObject);
    procedure edEmailEnviarCaixaPropertiesChange(Sender: TObject);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure edRecImprimirPropertiesChange(Sender: TObject);
    procedure edRecMatricialPropertiesChange(Sender: TObject);
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
  private
    FAlterou : Boolean;
    procedure SetAlterou(const Value: Boolean);
    procedure AjustaVisPM;
    { Private declarations }
  protected
    property Alterou: Boolean
      read FAlterou write SetAlterou; 

    procedure AjustaVisRecibos;   
    procedure AjustaVisEncerramento;
  public
    class function Descricao: String; override;
  
    procedure Ler;
    procedure Salvar;
    procedure AtualizaCores;
    procedure AtualizaDireitos; override;
    { Public declarations }
  end;

var
  fbOpcoes: TfbOpcoes;

implementation

uses 
  ncaDM, 
  ncaFrmPri, 
  ncaFrmFundo, ncafbAvisos, ncafbPatrocinadores, uDMEmail, ncClassesBase, ncVersoes;

{$R *.dfm}

procedure TfbOpcoes.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  tPacote.Open;
  tTipoPass.Open;
  MT.Active := True;
  Ler;
  Paginas.HideTabs := True;
  Paginas.ActivePageIndex := 0;
  tvOpcoes.Selected := tvOpcoes.Items[0];

  if (not sametext('P', ParamStr(1))) then
    tvOpcoes.Items[tvOpcoes.Items.Count-1].Free;
end;

function StrToBoolean(S: String): Boolean;
begin
  S := UpperCase(S);
  if (S='TRUE') or (S='S') or (S='Y') then
    Result := True
  else
    Result := False;  
end;

procedure TfbOpcoes.Ler;
var
  S: String;
  C: Char;
begin
  cbFidAtivoClick(nil);

  panSemFidelidade.Visible := not Versoes.PodeUsar(idre_fidelidade);
  panDadosFid.Enabled := not panSemFidelidade.Visible;
  if panDadosFid.Enabled then
    panDadosFid.Font.Color := clBlack else
    panDadosFid.Font.Color := clGray;

  edEmailEnviarCaixa.Visible := Versoes.PodeUsar(idre_CaixaEmail);
  gbCaixaEmail.Visible := edEmailEnviarCaixa.Visible;

  edChat.Enabled := Versoes.PodeUsar(idre_Chat);
  lbChat.Enabled := edChat.Enabled;

  tTT.Active := True;
  tTT.EmptyTable;
  Dados.RefreshTipoCred;
  tTT.LoadFromDataSet(Dados.mtTT,[]);
  Alterou := False;
  MT.Active := True;
  MT.EmptyTable;
  MT.Insert;
  TransfDados(Dados.tbConfig, MT);
  with Dados do 
  MTIDTipoCred.AsVariant := tTT.Lookup('Tipo;Codigo', VarArrayOf([tbConfigCredPadraoTipo.Value, tbConfigCredPadraoCod.Value]), 'ID');
  if MTEmailMetodo.IsNull then
    MTEmailMetodo.Value := 0;
  MT.Post;

  edAutoLigarMaqCli.Enabled := Versoes.PodeUsar(idre_ligarmaq);

  edDetectarImp.Checked := (MTControlaImp.Value>0);
  edRegValorImp.Checked := (MTControlaImp.Value=ciRegistrar);
  edRegValorImp.Enabled := edDetectarImp.Checked;

  AjustaVisRecibos;
  AjustaVisEncerramento;
  AjustaVisPM;
  
  if Trim(MTTextoPIN.Value)='' then
    MTTextoPIN.Value := 'Nome de Usuário';
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
begin
  if not (MT.State in [dsEdit, dsInsert]) then MT.Edit;
  S := '';
  for I := 0 to clbDrives.Items.Count-1 do
  if clbDrives.Items[I].Checked then 
    S := S + Char(Ord('A') + I);
  MTEsconderDrives.Value := S;  
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
    if tTT.Locate('ID', MTIDTipoCred.Value, []) then begin
      tbConfigCredPadraoCod.Value := tTTCodigo.Value;
      tbConfigCredPadraoTipo.Value := tTTTipo.Value;
    end;
    tbConfig.Post;
    CM.Config.LeDataset(tbConfig);
    CM.SalvaAlteracoesObj(CM.Config, False);
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

procedure TfbOpcoes.tvOpcoesChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  if not (csDestroying in tvOpcoes.ComponentState) then 
    Paginas.ActivePageIndex := tvOpcoes.Selected.Index;
end;

procedure TfbOpcoes.cmSalvarClick(Sender: TObject);
begin
  inherited;
  Salvar;
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

procedure TfbOpcoes.FrmBasePaiDestroy(Sender: TObject);
begin
  tvOpcoes.OnChange := nil;
  Paginas.OnChange := nil;
  inherited;
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
  Result := 'Opções';
end;

procedure TfbOpcoes.DSDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  Alterou := True;
  AjustaVisEncerramento;
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

procedure TfbOpcoes.edRecImprimirPropertiesChange(Sender: TObject);
begin
  inherited;
  AjustaVisRecibos;
end;

procedure TfbOpcoes.edRecMatricialPropertiesChange(Sender: TObject);
begin
  inherited;
  AjustaVisRecibos;
end;

procedure TfbOpcoes.edRegValorImpClick(Sender: TObject);
begin
  inherited;
  Alterou := True;
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
  edPMObs.Enabled := lbPMObs.Enabled
end;

procedure TfbOpcoes.AjustaVisRecibos;
begin
  edRecMatricial.Enabled := (MTRecImprimir.Value>0);
  edRecPorta.Enabled     := MTRecMatricial.Value and edRecMatricial.Enabled;
  edRecLargura.Enabled   := edRecPorta.Enabled;
  edRecSalto.Enabled     := edRecLargura.Enabled;
  edRecNomeLoja.Enabled  := edRecMatricial.Enabled;
  edRecRodape.Enabled    := edRecMatricial.Enabled;

  lbRecMatricial.Enabled := edRecMatricial.Enabled;
  lbRecPorta.Enabled     :=edRecMatricial.Enabled;
  lbRecLargura.Enabled   :=edRecMatricial.Enabled;
  lbRecSalto.Enabled     :=edRecMatricial.Enabled;
  lbRecNomeLoja.Enabled  :=edRecMatricial.Enabled;
  lbRecRodape.Enabled    :=edRecMatricial.Enabled;
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
  edBiometria.Visible := BioActive;
  FM.RegistraForm(TfbAvisos);
  FM.Mostrar(TfbAvisos, 0, 0);

  FM2.RegistraForm(TfbPatrocinadores);
  FM2.Mostrar(TfbPatrocinadores, 0, 0);
end;

procedure TfbOpcoes.btnFundoDesktopClick(Sender: TObject);
begin
  inherited;
  TFrmFundo.Create(nil).Mostrar(True);
end;

procedure TfbOpcoes.btnFundoLoginClick(Sender: TObject);
begin
  inherited;
  TFrmFundo.Create(nil).Mostrar(False);
end;

end.
