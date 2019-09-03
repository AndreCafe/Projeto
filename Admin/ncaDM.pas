unit ncaDM;
{
    ResourceString: Dario 10/03/13
    João: TODO List!
}

interface 

{$I nex.inc}


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, nxdb, nxllConst, nxllTypes, nxdbBase, kbmMemTable, LMDCustomComponent,
  uWinPopup,
  LMDOneInstance, 
  ncErros,
  ncEspecie,
  ncClassesBase, 
  ncSessao,
  ncMovEst,
  ncCredTempo,
  ncImpressao,
  ncListaID,
  ncIDRecursos,
  dxBar,
  cxVGrid,
  cxDBVGrid,
  cxGrid,
  ncCompCliente, ExtCtrls, nxsdServerEngine, nxreRemoteServerEngine,
  nxllComponent, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxCurrencyEdit,
  cxCalendar, cxMaskEdit, cxTextEdit, cxDBLookupComboBox,
  cxGridCustomTableView, 
  cxGridTableView, 
  cxGridDBTableView, 
  cxGridDBCardView,
  cxGridCardView,
  cxClasses, cxColorComboBox,
  cxControls, cxGridCustomView, LMDIniCtrl, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdDayTime, LMDWaveComp,
  cxEditRepositoryItems, ImgList, nxllSimpleCommandHandler,
  ncNXServRemoto, nxllSimpleSession, nxllPluginBase, 
  rtcpDesktopControl, rtcPortalMod, rtcpFileTrans, rtcPortalCli,
  rtcPortalHttpCli, LMDBaseController, LMDCustomContainer, LMDGenericList,
  cxExtEditRepositoryItems, cxImageComboBox, ncPrintDoc, cxNavigator, frxRes;

const
  wm_Biometria = wm_user + 100;
  
type

  TInfoCor = object
    icCorFundo : TColor;
    icCorFonte : TColor;
    icNegrito  : Boolean;
    procedure Limpa;
    procedure LeStr(S: String);
    function GetStr: String;
  end;

  TInfoModulo = object
    imID        : Byte;
    imPos       : Byte;
    imVisivel   : Boolean;
    imMostratab : Boolean;
    procedure Limpa;
    procedure LeStr(S: String);
    function GetStr: String;
  end;

  TOnAlterouSessao = procedure (Sessao: TncSessao; Destruiu: Boolean) of object;

  TDados = class(TDataModule)
    tbCli: TnxTable;
    tbPro: TnxTable;
    tbTran: TnxTable;
    tbProUnid: TStringField;
    tbProPreco: TCurrencyField;
    tbProObs: TMemoField;
    tbProImagem: TGraphicField;
    tbMovEst: TnxTable;
    Session: TnxSession;
    db: TnxDatabase;
    tbConfig: TnxTable;
    dsConfig: TDataSource;
    tbProEstoqueAtual: TFloatField;
    tbProCustoUnitario: TCurrencyField;
    RSE: TnxRemoteServerEngine;
    tbProEstoqueACE: TFloatField;
    tbProEstoqueACS: TFloatField;
    tbProEstoqueFinal: TFloatField;
    mtUsuario: TkbmMemTable;
    dsUsuario: TDataSource;
    mtUsuarioUsername: TStringField;
    mtUsuarioNome: TStringField;
    mtUsuarioAdmin: TBooleanField;
    mtUsuarioSenha: TStringField;
    mtUsuarioGrupos: TMemoField;
    mtUsuarioDireitos: TMemoField;
    mtUsuarioNumClientes: TIntegerField;
    tbLayout: TnxTable;
    tbLayoutUsuario: TStringField;
    tbLayoutGrid: TStringField;
    tbLayoutNome: TStringField;
    tbLayoutPublico: TBooleanField;
    tbLayoutLayout: TBlobField;
    tbLayoutFiltro: TBlobField;
    tbLayoutUsuarios: TMemoField;
    mtMaquina: TkbmMemTable;
    mtMaquinaNumero: TIntegerField;
    mtMaquinaNome: TStringField;
    dsMaquina: TDataSource;
    tbPacote: TnxTable;
    tbCaixa: TnxTable;
    mtMaquinaProgramaAtual: TStringField;
    mtMaquinaMenu: TMemoField;
    tbHoraCor: TnxTable;
    tbTipoAcesso: TnxTable;
    tbHoraCorTipoAcesso: TWordField;
    tbHoraCorDia: TWordField;
    tbHoraCorHora: TWordField;
    tbHoraCorCor: TIntegerField;
    tbTarifa: TnxTable;
    tbTarifaTipoAcesso: TWordField;
    tbTarifaCor: TIntegerField;
    tbTarifaCorFonte: TIntegerField;
    tbTarifaDescricao: TStringField;
    tbTarifaReinicia: TBooleanField;
    tbETar: TnxTable;
    tbETarTipoAcesso: TWordField;
    tbETarCor: TIntegerField;
    tbETarPos: TWordField;
    tbETarTempo: TDateTimeField;
    tbETarTolerancia: TDateTimeField;
    tbETarValor: TCurrencyField;
    tbETarValorMin: TCurrencyField;
    mtMaquinaComputerName: TStringField;
    tbTipoAcessoNome: TStringField;
    Timer2: TTimer;
    tbCliNome: TStringField;
    tbCliEndereco: TStringField;
    tbCliBairro: TStringField;
    tbCliCidade: TStringField;
    tbCliUF: TStringField;
    tbCliCEP: TStringField;
    tbCliSexo: TStringField;
    tbCliObs: TMemoField;
    tbCliCpf: TStringField;
    tbCliRg: TStringField;
    tbCliTelefone: TStringField;
    tbCliEmail: TMemoField;
    tbCliIsento: TBooleanField;
    tbCliUsername: TStringField;
    tbCliSenha: TStringField;
    tbCliUltVisita: TDateTimeField;
    tbCliDebito: TCurrencyField;
    tbCliEscola: TStringField;
    tbCliNickName: TStringField;
    tbCliDataNasc: TDateTimeField;
    tbCliCelular: TStringField;
    tbCliTemDebito: TBooleanField;
    Q: TnxQuery;
    tbTipoPass: TnxTable;
    tbPass: TnxTable;
    tbTipoPassNome: TStringField;
    tbTipoPassValor: TCurrencyField;
    tbTipoPassTipoAcesso: TIntegerField;
    tbTipoPassTipoExp: TWordField;
    tbTipoPassExpirarEm: TDateTimeField;
    tbTipoPassMaxSegundos: TIntegerField;
    tbTipoPassObs: TMemoField;
    tbTipoPassDia1: TIntegerField;
    tbTipoPassDia2: TIntegerField;
    tbTipoPassDia3: TIntegerField;
    tbTipoPassDia4: TIntegerField;
    tbTipoPassDia5: TIntegerField;
    tbTipoPassDia6: TIntegerField;
    tbTipoPassDia7: TIntegerField;
    tbTipoPassMinutos: TIntegerField;
    tbHPass: TnxTable;
    tbCliTipoAcessoPref: TIntegerField;
    gvRep: TcxGridViewRepository;
    TVL: TcxGridDBTableView;
    TVLCodigo: TcxGridDBColumn;
    TVLNome: TcxGridDBColumn;
    TVLUsername: TcxGridDBColumn;
    TVLDebito: TcxGridDBColumn;
    tbProDescricao: TStringField;
    tbProCategoria: TStringField;
    tbCliAlteradoEm: TDateTimeField;
    tbCliIncluidoPor: TStringField;
    tbCliAlteradoPor: TStringField;
    tbCliIncluidoEm: TDateTimeField;
    tbCliPai: TStringField;
    tbCliMae: TStringField;
    tbCliEscolaHI: TDateTimeField;
    tbCliEscolaHF: TDateTimeField;
    tbCliInativo: TBooleanField;
    tbCliLimiteDebito: TCurrencyField;
    tbCliFoto: TGraphicField;
    tbProSubCateg: TStringField;
    tbProPodeAlterarPreco: TBooleanField;
    tbProNaoControlaEstoque: TBooleanField;
    mtUsuarioMaxMaqManut: TIntegerField;
    mtUsuarioMaxTempoManut: TIntegerField;
    tbChat: TnxTable;
    tbChatDataHora: TDateTimeField;
    tbChatTexto: TMemoField;
    tbChatDiz: TStringField;
    tbChatMaq: TIntegerField;
    Reg: TLMDIniCtrl;
    tabTT: TkbmMemTable;
    tabTTDescr: TStringField;
    tabTTTipo: TSmallintField;
    tabTTCodigo: TIntegerField;
    tabTTMinutos: TIntegerField;
    tabTTValor: TCurrencyField;
    tabTTTipoAcesso: TIntegerField;
    tbProID: TAutoIncField;
    tbTranID: TAutoIncField;
    tbTranDataHora: TDateTimeField;
    tbTranCliente: TIntegerField;
    tbTranTipo: TWordField;
    tbTranFunc: TStringField;
    tbTranTotal: TCurrencyField;
    tbTranDesconto: TCurrencyField;
    tbTranPago: TCurrencyField;
    tbTranObs: TMemoField;
    tbTranCancelado: TBooleanField;
    tbTranCanceladoPor: TStringField;
    tbTranCanceladoEm: TDateTimeField;
    tbTranCaixa: TIntegerField;
    tbTranMaq: TWordField;
    tbTranNomeCliente: TStringField;
    tbTranSessao: TIntegerField;
    tbTranDescr: TStringField;
    tbMovEstID: TAutoIncField;
    tbMovEstTran: TIntegerField;
    tbMovEstProduto: TIntegerField;
    tbMovEstQuant: TFloatField;
    tbMovEstUnitario: TCurrencyField;
    tbMovEstTotal: TCurrencyField;
    tbMovEstCustoU: TCurrencyField;
    tbMovEstItem: TWordField;
    tbMovEstDesconto: TCurrencyField;
    tbMovEstPago: TCurrencyField;
    tbMovEstDataHora: TDateTimeField;
    tbMovEstEntrada: TBooleanField;
    tbMovEstCancelado: TBooleanField;
    tbMovEstEstoqueAnt: TFloatField;
    tbMovEstTipoTran: TWordField;
    tbMovEstCliente: TIntegerField;
    tbMovEstCaixa: TIntegerField;
    tbMovEstCategoria: TStringField;
    tbPacoteID: TAutoIncField;
    tbPacoteMinutos: TIntegerField;
    tbPacoteValor: TCurrencyField;
    tbPacoteDescr: TStringField;
    tbTipoPassID: TAutoIncField;
    tbTipoAcessoID: TWordField;
    tbMovEstNaoControlaEstoque: TBooleanField;
    tbCliID: TAutoIncField;
    tbCliMinutos: TFloatField;
    tbCliMinutosUsados: TFloatField;
    tbCliMinutosIniciais: TFloatField;
    tbCliValorCred: TCurrencyField;
    tbChatID: TAutoIncField;
    tbTempo: TnxTable;
    tbTempoID: TAutoIncField;
    tbTempoDataHora: TDateTimeField;
    tbTempoFunc: TStringField;
    tbTempoTipo: TWordField;
    tbTempoMinutos: TFloatField;
    tbTempoIDPacPass: TIntegerField;
    tbTempoPassaporte: TIntegerField;
    tbTempoTotal: TCurrencyField;
    tbTempoDesconto: TCurrencyField;
    tbTempoPago: TCurrencyField;
    tbTempoCliente: TIntegerField;
    tbTempoMaq: TWordField;
    tbTempoSessao: TIntegerField;
    tbTempoCancelado: TBooleanField;
    tbTempoTran: TIntegerField;
    tbTempoCaixa: TIntegerField;
    tbSessao: TnxTable;
    tbSessaoID: TAutoIncField;
    tbSessaoInicio: TDateTimeField;
    tbSessaoTermino: TDateTimeField;
    tbSessaoMinutosR: TFloatField;
    tbSessaoMinutosC: TFloatField;
    tbSessaoMaq: TWordField;
    tbSessaoEncerrou: TBooleanField;
    tbSessaoCliente: TIntegerField;
    tbSessaoTransfMaq: TBooleanField;
    tbSessaoTipoCli: TWordField;
    tbSessaoCancelado: TBooleanField;
    tbSessaoTotal: TCurrencyField;
    tbSessaoDesconto: TCurrencyField;
    tbSessaoPago: TCurrencyField;
    tbSessaoNomeCliente: TStringField;
    tbSessaoFuncI: TStringField;
    tbSessaoFuncF: TStringField;
    tbSessaoObs: TMemoField;
    tbSessaoTipoAcesso: TIntegerField;
    tbSessaoCaixaI: TIntegerField;
    tbSessaoCaixaF: TIntegerField;
    tbSessaoTicksI: TIntegerField;
    tbSessaoPausado: TBooleanField;
    tbSessaoInicioPausa: TIntegerField;
    tbSessaoMinTicksUsados: TIntegerField;
    tbSessaoMinTicksTotal: TIntegerField;
    tbSessaoFimTicksUsados: TIntegerField;
    tbSessaoStrPausas: TMemoField;
    tbSessaoMinutosCli: TFloatField;
    tbSessaoMinutosPrev: TFloatField;
    tbSessaoMinutosMax: TFloatField;
    tbSessaoMinutosCliU: TFloatField;
    tbSessaoValorCli: TCurrencyField;
    tbSessaoValorCliU: TFloatField;
    tbSessaoTranI: TIntegerField;
    tbSessaoTranF: TIntegerField;
    tbImp: TnxTable;
    tbImpID: TAutoIncField;
    tbImpTran: TIntegerField;
    tbImpCaixa: TIntegerField;
    tbImpManual: TBooleanField;
    tbImpDataHora: TDateTimeField;
    tbImpComputador: TStringField;
    tbImpMaquina: TWordField;
    tbImpPaginas: TWordField;
    tbImpImpressora: TStringField;
    tbImpDocumento: TMemoField;
    tbImpSessao: TIntegerField;
    tbImpResultado: TWordField;
    tbImpq1: TWordField;
    tbImpq2: TWordField;
    tbImpq3: TWordField;
    tbImpq4: TWordField;
    tbImpq5: TWordField;
    tbImpq6: TWordField;
    tbImpq7: TWordField;
    tbImpq8: TWordField;
    tbImpq9: TWordField;
    tbImpq10: TWordField;
    tbImpv1: TCurrencyField;
    tbImpv2: TCurrencyField;
    tbImpv3: TCurrencyField;
    tbImpv4: TCurrencyField;
    tbImpv5: TCurrencyField;
    tbImpv6: TCurrencyField;
    tbImpv7: TCurrencyField;
    tbImpv8: TCurrencyField;
    tbImpv9: TCurrencyField;
    tbImpv10: TCurrencyField;
    tbImpTotal: TCurrencyField;
    tbImpDesconto: TCurrencyField;
    tbImpPago: TCurrencyField;
    tbImpFunc: TStringField;
    tbImpCliente: TIntegerField;
    tbImpCancelado: TBooleanField;
    tbCaixaID: TAutoIncField;
    tbCaixaAberto: TBooleanField;
    tbCaixaUsuario: TStringField;
    tbCaixaAbertura: TDateTimeField;
    tbCaixaFechamento: TDateTimeField;
    tbCaixaTotalFinal: TCurrencyField;
    tbCaixaDescontos: TCurrencyField;
    tbCaixaCancelamentos: TCurrencyField;
    tbCaixaSaldoAnt: TCurrencyField;
    tbCaixaObs: TMemoField;
    mtMaquinaSiteAtual: TStringField;
    dsTipoPass: TDataSource;
    tbTempoPagoPost: TCurrencyField;
    tbTempoDescPost: TCurrencyField;
    tbTempoNome: TStringField;
    tbTempoSenha: TStringField;
    tbConfigNumSeq: TAutoIncField;
    tbConfigFecharProgramas: TBooleanField;
    tbConfigAutoExecutar: TStringField;
    tbConfigLimiteTempoPadrao: TDateTimeField;
    tbConfigPacoteTempoReal: TBooleanField;
    tbConfigPermiteLoginSemCred: TBooleanField;
    tbConfigEncerramentoPrePago: TWordField;
    tbConfigPermiteCapturaTela: TBooleanField;
    tbConfigVariosTiposAcesso: TBooleanField;
    tbConfigModoPagtoAcesso: TWordField;
    tbConfigMostraPrePagoDec: TBooleanField;
    tbConfigTempoMaxAlerta: TDateTimeField;
    tbConfigAbre1: TDateTimeField;
    tbConfigAbre2: TDateTimeField;
    tbConfigAbre3: TDateTimeField;
    tbConfigAbre4: TDateTimeField;
    tbConfigAbre5: TDateTimeField;
    tbConfigAbre6: TDateTimeField;
    tbConfigAbre7: TDateTimeField;
    tbConfigFecha1: TDateTimeField;
    tbConfigFecha2: TDateTimeField;
    tbConfigFecha3: TDateTimeField;
    tbConfigFecha4: TDateTimeField;
    tbConfigFecha5: TDateTimeField;
    tbConfigFecha6: TDateTimeField;
    tbConfigFecha7: TDateTimeField;
    tbConfigCorLivre: TIntegerField;
    tbConfigCorFLivre: TIntegerField;
    tbConfigCorUsoPrePago: TIntegerField;
    tbConfigCorFUsoPrePago: TIntegerField;
    tbConfigCorUsoPosPago: TIntegerField;
    tbConfigCorFUsoPosPago: TIntegerField;
    tbConfigCorAguardaPagto: TIntegerField;
    tbConfigCorFAguardaPagto: TIntegerField;
    tbConfigCorManutencao: TIntegerField;
    tbConfigCorFManutencao: TIntegerField;
    tbConfigCorPausado: TIntegerField;
    tbConfigCorFPausado: TIntegerField;
    tbConfigCorDesktop: TIntegerField;
    tbConfigCorFDesktop: TIntegerField;
    tbConfigCampoLocalizaCli: TWordField;
    tbConfigManterSaldoCaixa: TBooleanField;
    tbConfigNaoMostrarMsgDebito: TBooleanField;
    tbConfigTolerancia: TDateTimeField;
    tbConfigRegImp98: TBooleanField;
    tbConfigLimitePadraoDebito: TCurrencyField;
    tbConfigRecPorta: TStringField;
    tbConfigRecSalto: TWordField;
    tbConfigRecLargura: TWordField;
    tbConfigRecRodape: TMemoField;
    tbConfigRecImprimir: TWordField;
    tbConfigRecMatricial: TBooleanField;
    tbConfigRecNomeLoja: TStringField;
    tbConfigMostraProgAtual: TBooleanField;
    tbConfigMostraObs: TBooleanField;
    tbConfigEscondeTextoBotoes: TBooleanField;
    tbConfigEscondeTipoAcesso: TBooleanField;
    tbConfigExigirRG: TBooleanField;
    tbConfigTipoFDesktop: TStringField;
    tbConfigTipoFLogin: TStringField;
    tbConfigNumFDesktop: TIntegerField;
    tbConfigNumFLogin: TIntegerField;
    tbConfigMostrarApenasPIN: TBooleanField;
    tbConfigTextoPIN: TStringField;
    tbConfigAlterarSenhaCli: TBooleanField;
    tbConfigVerSenhaCli: TBooleanField;
    tbConfigCliCadPadrao: TBooleanField;
    tbConfigControlaImp: TWordField;
    tbConfigFiltrarWEB: TBooleanField;
    tbConfigSiteRedirFiltro: TStringField;
    tbConfigBloqDownload: TBooleanField;
    tbConfigBloqMenuIniciar: TBooleanField;
    tbConfigBloqPainelCtrl: TBooleanField;
    tbConfigBloqCtrlAltDel: TBooleanField;
    tbConfigBloqExecutar: TBooleanField;
    tbConfigBloqMeusLocaisRede: TBooleanField;
    tbConfigPaginaInicial: TStringField;
    tbConfigEsconderCronometro: TBooleanField;
    tbConfigAposEncerrar: TWordField;
    tbConfigAlinhaBarraGuard: TWordField;
    tbConfigNoNet: TWordField;
    tbConfigTempoSumirLogin: TWordField;
    tbConfigEmailMetodo: TWordField;
    tbConfigEmailServ: TStringField;
    tbConfigEmailUsername: TStringField;
    tbConfigEmailSenha: TStringField;
    tbConfigEmailDestino: TMemoField;
    tbConfigEmailEnviarCaixa: TBooleanField;
    tbConfigEsconderDrives: TStringField;
    tbConfigBloqTray: TBooleanField;
    tbConfigTempoB1: TWordField;
    tbConfigTempoB2: TWordField;
    tbConfigTempoB3: TWordField;
    tbConfigTempoB4: TWordField;
    tbConfigTempoB5: TWordField;
    tbConfigTempoB6: TWordField;
    tbConfigCredPadraoTipo: TWordField;
    tbConfigCredPadraoCod: TIntegerField;
    tbConfigPgVendas: TBooleanField;
    tbConfigPgAcesso: TBooleanField;
    tbConfigPgTempo: TBooleanField;
    tbConfigPgImp: TBooleanField;
    tabTTID: TAutoIncField;
    mtMaquinaIDCliente: TIntegerField;
    tbTempoTipoAcesso: TIntegerField;
    tbConfigPgVendaAvulsa: TBooleanField;
    tbCaixaSangria: TCurrencyField;
    tbCaixaSupr: TCurrencyField;
    tbConfigMostraNomeMaq: TBooleanField;
    tbConfigBloqBotaoDir: TBooleanField;
    tbConfigBloquearUsoEmHorarioNP: TBooleanField;
    tbCliHP1: TIntegerField;
    tbCliHP2: TIntegerField;
    tbCliHP3: TIntegerField;
    tbCliHP4: TIntegerField;
    tbCliHP5: TIntegerField;
    tbCliHP6: TIntegerField;
    tbCliHP7: TIntegerField;
    tbConfigMinutosDesligaMaq: TWordField;
    tbConfigOpcaoChat: TWordField;
    tbConfigSalvarCodUsername: TBooleanField;
    tbConfigCorMaqManut: TIntegerField;
    tbConfigCorFMaqManut: TIntegerField;
    mtMaquinaEmManutencao: TBooleanField;
    tbTempoObs: TStringField;
    tbConfigContinuarCredTempo: TBooleanField;
    tbConfigNaoGuardarCreditoCli: TBooleanField;
    tbCliNaoGuardarCredito: TBooleanField;
    tbConfigEncerramentoCartao: TWordField;
    tbConfigTempoEPrePago: TWordField;
    tbConfigTempoECartao: TWordField;
    tbConfigCorPrevisao: TIntegerField;
    tbConfigCorFPrevisao: TIntegerField;
    tbConfigRelCaixaAuto: TBooleanField;
    tbCliPermiteLoginSemCred: TBooleanField;
    tbConfigAlteraLoginSemCred: TBooleanField;
    tbConfigNaoCobrarImpFunc: TBooleanField;
    tbPatro: TnxTable;
    tbPatroNome: TStringField;
    tbPatroURLArea1: TMemoField;
    tbPatroURLArea2: TMemoField;
    tbPatroDominiosPerm: TMemoField;
    mtMaquinaPatrocinio: TStringField;
    tbConfigSincronizarHorarios: TBooleanField;
    tbConfigMostrarDebitoNoGuard: TBooleanField;
    tbConfigBloquearLoginAlemMaxDeb: TBooleanField;
    tbConfigClienteNaoAlteraSenha: TBooleanField;
    tbConfigNaoObrigarSenhaCliente: TBooleanField;
    tbConfigNaoVenderAlemEstoque: TBooleanField;
    tbConfigCreditoComoValor: TBooleanField;
    tbTempoCredValor: TBooleanField;
    tbConfigCliAvulsoNaoEncerra: TBooleanField;
    tbConfigAutoSortGridCaixa: TBooleanField;
    mtMaquinaAvisaFimTempo: TBooleanField;
    tbConfigAvisoFimTempoAdminS: TWordField;
    tbSessaoMaqI: TWordField;
    tbSessaoPagoPost: TCurrencyField;
    tbSessaoDescPost: TCurrencyField;
    tbSessaoFimTicksTotal: TIntegerField;
    tbSessaoStrTransfMaq: TMemoField;
    tbSessaoStrFechamentoCaixa: TMemoField;
    tbSessaoPermitirDownload: TBooleanField;
    tbSessaoVersaoRegistro: TIntegerField;
    tbSessaoCartaoTempo: TBooleanField;
    tbSessaoHP1: TIntegerField;
    tbSessaoHP2: TIntegerField;
    tbSessaoHP3: TIntegerField;
    tbSessaoHP4: TIntegerField;
    tbSessaoHP5: TIntegerField;
    tbSessaoHP6: TIntegerField;
    tbSessaoHP7: TIntegerField;
    tbConfigDetectarImpServ: TBooleanField;
    tbConfigAvisoCreditos: TBooleanField;
    tbConfigClientePodeVerCred: TBooleanField;
    Wav2: TLMDWaveComp;
    tbConfigChatAlertaSonoro: TBooleanField;
    tbConfigChatMostraNotificacao: TBooleanField;
    tbCliPassaportes: TFloatField;
    tbConfigModoCredGuard: TWordField;
    tbConfigMsgFimCred: TStringField;
    tbCliTitEleitor: TStringField;
    tbConfigSemLogin: TBooleanField;
    tbTranDebito: TCurrencyField;
    tbTranQtdTempo: TFloatField;
    tbCliFidPontos: TFloatField;
    tbProFidPontos: TIntegerField;
    tbCliFidTotal: TFloatField;
    tbCliFidResg: TFloatField;
    tbConfigFidAtivo: TBooleanField;
    tbConfigFidSessaoValor: TCurrencyField;
    tbConfigFidSessaoPontos: TIntegerField;
    tbConfigFidVendaValor: TCurrencyField;
    tbConfigFidVendaPontos: TIntegerField;
    tbConfigFidImpValor: TCurrencyField;
    tbConfigFidImpPontos: TIntegerField;
    tbConfigFidParcial: TBooleanField;
    tbProFidelidade: TBooleanField;
    tbTranFidResgate: TBooleanField;
    tbPacoteFidelidade: TBooleanField;
    tbPacoteFidPontos: TIntegerField;
    tbTipoPassFidelidade: TBooleanField;
    tbTipoPassFidPontos: TIntegerField;
    ER: TcxEditRepository;
    erSimNao: TcxEditRepositoryImageComboBoxItem;
    tbMovEstPagoPost: TCurrencyField;
    tbMovEstDescPost: TCurrencyField;
    tbMovEstITran: TIntegerField;
    tbMovEstSessao: TIntegerField;
    tbMovEstFidResgate: TBooleanField;
    tbMovEstFidPontos: TFloatField;
    erFidelidade: TcxEditRepositoryImageComboBoxItem;
    im16: TcxImageList;
    tabTTPontos: TIntegerField;
    tbTempoFidResgate: TBooleanField;
    tbTempoFidPontos: TFloatField;
    erTipoTran: TcxEditRepositoryImageComboBoxItem;
    erTipoItem: TcxEditRepositoryImageComboBoxItem;
    erFidOpe: TcxEditRepositoryImageComboBoxItem;
    tbConfigFidAutoPremiar: TBooleanField;
    tbConfigFidTipoPremioAuto: TWordField;
    tbConfigFidPremioAuto: TIntegerField;
    erTipoPremioAuto: TcxEditRepositoryImageComboBoxItem;
    tbConfigAutoObsAoCancelar: TBooleanField;
    tbConfigFidMostrarSaldoGuard: TBooleanField;
    tbConfigFidMostrarSaldoAdmin: TBooleanField;
    tbConfigCliCadNaoEncerra: TBooleanField;
    tbConfigImpedirPosPago: TBooleanField;
    tbConfigAutoLigarMaqCli: TBooleanField;
    mtMaquinaTemPontos: TBooleanField;
    mtMaquinaPontosCli: TFloatField;
    mtMaquinaDisplayW: TWordField;
    mtMaquinaDisplayH: TWordField;
    mtMaquinaDisplayWH: TStringField;
    mtMaquinaObjectInt: TIntegerField;
    tbConfigPastaDownload: TStringField;
    tbConfigBiometria: TBooleanField;
    SimpleCmdHandler: TnxSimpleCommandHandler;
    nxTCPIP: TnxWinsockTransport;
    Timer1: TTimer;
    tbSessaoDisableAD: TBooleanField;
    tbChatDe: TIntegerField;
    tbChatPara: TIntegerField;
    PClient: TRtcHttpPortalClient;
    PFileTrans: TRtcPFileTransfer;
    PDesktopControl: TRtcPDesktopControl;
    tbConfigPMPausaAutomatica: TBooleanField;
    tbConfigPMConfirmaImpCliente: TBooleanField;
    tbConfigPMMostrarPaginasCli: TBooleanField;
    tbConfigPMMostrarValorCli: TBooleanField;
    tbConfigPMCalcValorCli: TWordField;
    tbConfigPMPromptValorCli: TStringField;
    tbConfigPMObsValorCli: TStringField;
    mtImp: TkbmMemTable;
    mtImpJobID: TIntegerField;
    mtImpComputer: TStringField;
    mtImpMaquina: TWordField;
    mtImpPrinterName: TStringField;
    mtImpPrinterShare: TStringField;
    mtImpPrinterPort: TStringField;
    mtImpPrinterServer: TStringField;
    mtImpUser: TStringField;
    mtImpPages: TIntegerField;
    mtImpTotalPages: TIntegerField;
    mtImpCopies: TIntegerField;
    mtImpClientPages: TIntegerField;
    mtImpPrinterIndex: TIntegerField;
    mtImpPausou: TBooleanField;
    mtImpLiberacao: TWordField;
    mtImpImpID: TIntegerField;
    mtImpStatus: TWordField;
    mtImpPrtHandle: TIntegerField;
    mtImpDocument: TMemoField;
    mtImpPaginasReg: TIntegerField;
    tbConfigPubHomePage: TBooleanField;
    tbConfigPubAd: TBooleanField;
    tbConfigPubToolbar: TBooleanField;
    mtImpSpooling: TBooleanField;
    tbConfigMaxTempoSessao: TWordField;
    tMaqRAM: TIntegerField;
    tMaqCPU: TStringField;
    tMaqOS: TStringField;
    tMaqDrives: TStringField;
    tMaqHDTotal: TIntegerField;
    tMaqHDFree: TIntegerField;
    mtMaquinaIP: TStringField;
    mtMaquinaPrinters: TMemoField;
    GL: TLMDGenericList;
    tbCliAniversario: TStringField;
    erTarifa: TcxEditRepositoryColorComboBox;
    tbConfigFidMsg: TBooleanField;
    tbConfigFidMsgTitulo: TStringField;
    tbConfigFidMsgTexto: TnxMemoField;
    tbConfigTarifaPadrao: TIntegerField;
    tbConfigTarifaPorHorario: TBooleanField;
    tbTarifaPrecosStr: TnxMemoField;
    tbTarifaDivQtd: TIntegerField;
    tbTarifaSemValorMin: TBooleanField;
    tbTarifaReiniciaDesde: TWordField;
    tbTarifaDivTipo: TWordField;
    tbTarifaArredondar: TWordField;
    mtMaquinaMacAddress: TStringField;
    tbConfigBloqMeuComputador: TBooleanField;
    tbConfigBloqLixeira: TBooleanField;
    tbConfigFiltrarDesktop: TBooleanField;
    tbConfigFiltrarMenuIniciar: TBooleanField;
    tbConfigBloqDownloadExe: TBooleanField;
    tbConfigBloqMeusDocumentos: TBooleanField;
    tbConfigClassicStartMenu: TBooleanField;
    tbConfigBloqueiaCliAvulso: TBooleanField;
    tbConfigExigeDadosMinimos: TBooleanField;
    tbConfigDadosMinimos: TStringField;
    tbConfigCidadePadrao: TStringField;
    tbConfigUFPadrao: TStringField;
    tbConfigPedirSaldoI: TBooleanField;
    tbConfigPedirSaldoF: TBooleanField;
    tbCaixaReproc: TDateTimeField;
    tbCaixaEstSessoesQtd: TIntegerField;
    tbCaixaEstSessoesTempo: TFloatField;
    tbCaixaEstUrls: TIntegerField;
    tbCaixaEstSyncOk: TBooleanField;
    tbCaixaEstBuscasEng: TnxMemoField;
    tbCaixaEstRes: TnxMemoField;
    tbCaixaSaldoF: TCurrencyField;
    tbCaixaQuebra: TCurrencyField;
    tbConfigPMPausarServ: TBooleanField;
    tbConfigPMNaoPausar: TnxMemoField;
    tbCliCotaImpEspecial: TBooleanField;
    tbCliCotaImpDia: TIntegerField;
    tbCliCotaImpMes: TIntegerField;
    tbConfigPMCotas: TBooleanField;
    tbConfigPMCotasMaxPagDia: TIntegerField;
    tbConfigPMCotasMaxPagMes: TIntegerField;
    tbConfigPMCotasOpCota: TWordField;
    tbConfigPMCotasOpExcesso: TWordField;
    tbConfigPMCotasMaxExcesso: TIntegerField;
    tbConfigPMCotasPorCli: TBooleanField;
    tbCliSemFidelidade: TBooleanField;
    tbConfigEmailIdent: TStringField;
    tbConfigEmailConteudo: TStringField;
    tbCHora: TnxTable;
    tbCliCHorario: TIntegerField;
    tbCliOpCHorario: TWordField;
    tbConfigAlertaAssinatura: TBooleanField;
    mtPrev: TkbmMemTable;
    mtPrevMaq: TWordField;
    mtPrevStatus: TWordField;
    mtPrevSessaoObj: TIntegerField;
    mtPrevInicio: TDateTimeField;
    mtPrevFim: TDateTimeField;
    dsPrev: TDataSource;
    mtPrevFimPrev: TStringField;
    tbCliFornecedor: TBooleanField;
    tbSessaoFiltrarWEB: TBooleanField;
    tbSessaoIPs: TnxMemoField;
    tbSessaoJobID: TIntegerField;
    tbSessaoJobPages: TWordField;
    tbConfigCamposCliCC: TnxMemoField;
    tbConfigBloqToolbars: TBooleanField;
    tbConfigBloqPosPago: TBooleanField;
    tbConfigCliCongelado: TBooleanField;
    tbSessaoDesktopSinc: TBooleanField;
    tbConfigMinutosDesligaMon: TWordField;
    tbConfigQtdMaqOk: TBooleanField;
    tbConfigSenhaAdminOk: TBooleanField;
    tbCaixaIDLivre: TStringField;
    tbSessaoPermitirDownloadExe: TBooleanField;
    tbCriar: TnxTable;
    tbCriarID: TAutoIncField;
    tbCriarTipo: TIntegerField;
    tbCriarParametros: TMemoField;
    tbCriarDestino: TMemoField;
    mtMaquinaIPConfig: TMemoField;
    tbTranTotLiq: TCurrencyField;
    tbTranplusID: TGuidField;
    tbTranplusTran: TBooleanField;
    tbProFornecedor: TIntegerField;
    tbProEstoqueMin: TFloatField;
    tbProEstoqueMax: TFloatField;
    tbProAbaixoMin: TBooleanField;
    tbProAbaixoMinDesde: TDateTimeField;
    tbProEstoqueRepor: TFloatField;
    tbProplus: TBooleanField;
    tbProplusURL: TnxMemoField;
    tbProplusCodParceiro: TStringField;
    tbProplusCodProduto: TStringField;
    tbProAtivo: TBooleanField;
    mtTipoImp: TkbmMemTable;
    mtTipoImpID: TWordField;
    mtTipoImpNome: TStringField;
    mtTipoImpImpressora: TStringField;
    mtTipoImpValor: TCurrencyField;
    mtTipoImpImgID: TIntegerField;
    dsTipoImp: TDataSource;
    mtTipoImpShowImp: TBooleanField;
    tbConfigFundoWeb: TBooleanField;
    tbConfigFundoWebURL: TnxMemoField;
    tbConfigPMPDF: TBooleanField;
    tbConfigPMReviewCli: TBooleanField;
    tbConfigPMReviewAdmin: TBooleanField;
    tbIC: TnxTable;
    tbICIP: TStringField;
    tbICcampanha: TStringField;
    tbICutmccn: TStringField;
    tbICutmctr: TStringField;
    tbICutmcct: TStringField;
    tbICutmcmd: TStringField;
    tbICutmcsr: TStringField;
    tbConfigPosLogin: TWordField;
    mtPrintDoc: TkbmMemTable;
    mtPrintDocArq: TStringField;
    mtPrintDocDoc: TStringField;
    mtPrintDocPag: TIntegerField;
    mtPrintDocSessao: TIntegerField;
    mtPrintDocTipoImp: TIntegerField;
    mtPrintDocMaq: TIntegerField;
    mtPrintDocNomeTipoImp: TStringField;
    tbConfigPMPDFPrintEng: TWordField;
    tbConfigPMConfirmaImpAdmin: TBooleanField;
    mtPausadas: TkbmMemTable;
    mtPausadasPDF: TBooleanField;
    mtPausadasID: TStringField;
    mtPausadasDoc: TStringField;
    mtPausadasMaq: TIntegerField;
    mtPausadasComputador: TStringField;
    mtPausadasImpTipo: TStringField;
    mtPausadasPrinterIndex: TIntegerField;
    mtPausadasJobID: TIntegerField;
    mtPausadasPag: TIntegerField;
    tbProdD: TnxTable;
    tbProdDcodbar: TStringField;
    tbProdDfk_user: TIntegerField;
    tbProdDdescricao: TStringField;
    tbProdDunid: TStringField;
    tbProdDimagem: TGraphicField;
    tbProdDmd5: TStringField;
    tbProdDcategoria: TStringField;
    tbProdDid_upd: TIntegerField;
    tbPromd5Imagem: TStringField;
    tbProlastProdModif: TDateTimeField;
    tbProCadastroRapido: TBooleanField;
    tbProIncluidoEm: TDateTimeField;
    tbConfigAutoCad: TBooleanField;
    tbConfigQuickCad: TBooleanField;
    tbProPermiteVendaFracionada: TBooleanField;
    tbConfigCodProdutoDuplicados: TBooleanField;
    tbConfigRecTipoImpressora: TStringField;
    tbConfigRecCortaFolha: TBooleanField;
    tbConfigBRT: TWordField;
    tbConfigExCookie: TBooleanField;
    tbConfigHPOpenBef: TBooleanField;
    tbConfigHomePage_Tab: TBooleanField;
    tbConfigHomePage_LastURL: TDateTimeField;
    tbConfigHomePage_URL: TStringField;
    tbSessaoTipoMaq: TWordField;
    tbConfigRecursos: TStringField;
    tbConfigComandaOff: TBooleanField;
    tbConfigMesasOff: TBooleanField;
    tbConfigConsumoAvulsoOff: TBooleanField;
    tbConfigFaixaComanda: TStringField;
    tbConfigPrecoAuto: TBooleanField;
    tbConfigMargem: TFloatField;
    tbProPrecoAuto: TBooleanField;
    tbProMargem: TFloatField;
    tbMovEstplusID: TGuidField;
    tbMovEstplusTran: TBooleanField;
    tbMovEstPermSemEstoque: TBooleanField;
    tbMovEstRecVer: TIntegerField;
    tbProCodigo: TStringField;
    tbTranDebitoAnt: TCurrencyField;
    tbTranDebitoPago: TCurrencyField;
    tbTranCreditoAnt: TCurrencyField;
    tbTranCredito: TCurrencyField;
    tbTranCreditoUsado: TCurrencyField;
    tbTranCredValor: TBooleanField;
    tbEspecie: TnxTable;
    tbEspecieID: TWordField;
    tbEspecieTipo: TWordField;
    tbEspecieNome: TStringField;
    tbEspeciePermiteTroco: TBooleanField;
    tbEspeciePermiteVarios: TBooleanField;
    tbEspeciePermiteCred: TBooleanField;
    tbEspecieImg: TWordField;
    tbTranTroco: TCurrencyField;
    tbTranPagFunc: TStringField;
    tbTranPagPend: TBooleanField;
    tbTranCaixaPag: TIntegerField;
    mtMaquinaURLLogin: TMemoField;
    tbTranDescPerc: TFloatField;
    tbTranDescPorPerc: TBooleanField;
    mtUsuarioLimiteDesc: TFloatField;
    mtUsuarioImg: TSmallintField;
    tbProComissaoPerc: TFloatField;
    tbProComissaoLucro: TBooleanField;
    tbConfigBanners: TnxMemoField;
    tbConfigBotoes: TnxMemoField;
    tbConfigComissaoPerc: TFloatField;
    tbConfigComissaoLucro: TBooleanField;
    tbConfigCodBarBal: TBooleanField;
    tbConfigCodBarBalTam: TWordField;
    tbConfigCodBarBalIdent: TStringField;
    tbConfigCodBarBalInicioCod: TWordField;
    tbConfigCodBarBalTamCod: TWordField;
    tbConfigCodBarBalValor: TBooleanField;
    tbConfigCodBarBalPPInicio: TWordField;
    tbConfigCodBarBalPPTam: TWordField;
    tbConfigCodBarBalPPDig: TWordField;
    tbConfigConfirmarDebito: TBooleanField;
    tbConfigDTol: TWordField;
    tbConfigDVA: TDateTimeField;
    tbConfigProxAvisoAss: TDateTimeField;
    tbConfigPreLib: TBooleanField;
    tbConfigSky_URL: TStringField;
    tbConfigToolbar_URL: TStringField;
    tbConfigNaoTransferirMaq: TBooleanField;
    tbTranTipoPag: TWordField;
    tbTranRecVer: TIntegerField;
    tbMovEstComissao: TCurrencyField;
    tbMovEstComissaoPerc: TFloatField;
    tbMovEstComissaoLucro: TBooleanField;
    tbConfigVerBloqueioSites: TBooleanField;
    tbConfigUrls: TnxMemoField;
    tbConfigRecVer: TIntegerField;
    tbProRecVer: TIntegerField;
    tbProuploadVer: TWordField;
    procedure DataModuleCreate(Sender: TObject);
    procedure FFTblMgrPause;
    procedure SoUmProgCustom(Sender: TObject);
    procedure CMAoDesativar(Sender: TObject);
    procedure tbProCalcFields(DataSet: TDataSet);
    procedure ffClientConnectionLost(aSource: TObject; aStarting: Boolean;
      var aRetry: Boolean);
    procedure CMAoAtualizarUsuario(Sender: TObject);
    procedure CMAoDestruirUsuario(Sender: TObject);
    procedure CMAoAtualizarMaquina(Sender: TObject);
    procedure CMAoDestruirMaquina(Sender: TObject);
    procedure mtMaquinaCalcFields(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure tbTipoPassCalcFields(DataSet: TDataSet);
    procedure CMAoAtualizarConfig(Sender: TObject);
    procedure tbChatCalcFields(DataSet: TDataSet);
    procedure CMAoReceberChat(Sender: TObject; MsgID, De, Para: Integer;
      DataHora: TDateTime; Texto: string);
    procedure SetUChat(const Value: Integer);
    procedure CMAoAtualizarTarifa(Sender: TObject);
    procedure CMAoAtualizarSessao(Sender: TObject);
    procedure CMAoAbrirFecharCx(Sender: TObject);
    procedure CMAoDestruirSessao(Sender: TObject);
    procedure nxTCPIPConnectionLost(aSender: TnxBaseTransport;
      aSessionID: TnxSessionID);
    procedure Timer1Timer(Sender: TObject);
    procedure PDesktopControlNewUI(Sender: TRtcPDesktopControl;
      const user: string);
    procedure PClientLogIn(Sender: TAbsPortalClient);
    procedure PClientUserLoggedIn(Sender: TAbsPortalClient; const User: string);
    procedure PClientUserLoggedOut(Sender: TAbsPortalClient;
      const User: string);
    procedure CMAoAtualizarJob(Sender: TObject);
    procedure mtImpAfterDelete(DataSet: TDataSet);
    procedure CMAoDestruirJob(Sender: TObject);
    procedure mtImpCalcFields(DataSet: TDataSet);
    procedure erTarifaPropertiesInitPopup(Sender: TObject);
    procedure CMAoAtualizarTipoAcesso(Sender: TObject);
    procedure CMAoAtualizarTipoImp(Sender: TObject);
    procedure CMAoDestruirTipoImp(Sender: TObject);
    procedure mtTipoImpCalcFields(DataSet: TDataSet);
    procedure mtPrintDocCalcFields(DataSet: TDataSet);
    procedure CMAoAtualizarPrintDoc(Sender: TObject);
    procedure CMAoDestruirPrintDoc(Sender: TObject);
  private
    { Private declarations }
    FUChat: Integer;
    FOnAlterouSessao: TOnAlterouSessao;

    procedure CreateCM;
  public
    ServRem: TncNXServRemoto;
    CM: TClienteNexCafe;
    SessoesFinalizadas : TStringList;
    WinPop : TFormWinPopup;

    procedure AcessoRemoto(aMaquina: String);

    procedure NovaMaq;
    
    procedure AbreDB;
    procedure FecharDB;
    function ControlaSaldo(aProduto: String): Boolean;
    { Public declarations }
    procedure AbreCaixa;
    procedure TotalizaDebCli(Cli: Integer);
    procedure RefreshTipoCred(NoDiv: Boolean; AddLivre: Boolean = False; AddPos: Boolean = True);
    procedure RefreshCaixaAberto;
    function TotalCreditos: Double;
    function TotalCredValor: Double;
    function TotalPassCli: Double;
    function TotalDebitos: Double;
    function LimiteDebito(F: TField): Double;
    function NovoMovEst(aTipoTran: Integer; aCliente: Integer; aPagPend: Boolean = False; aFidResgate: Boolean = False; aTamanho: Byte = tamTelaNormal):boolean;
    function NovaVenda(aCliente: Integer; aPagPend, aFidResgate: Boolean; aTamanho: Byte = tamTelaNormal): Boolean;
    procedure EditarMovEst(ME: TncMovEst; aPodeAlterarCli: Boolean = False);
    procedure ImprimeRecibo(aTran: Integer);
    procedure EditarTran(aTran: Integer; aPodeAlterarCli: Boolean = False);
    procedure EditarPagamento(aTran: Integer);
    procedure ClearSessaoMaq(S: TncSessao);
    procedure PrevSessaoMaq(S: TncSessao);

    procedure OnRefreshUrls(Sender: TObject);

    function TarifasOk: Boolean;

    function CorrigeEstoque(aProduto: Integer; aAnt, aNovo: Double): Boolean;

    function SaldoInicialCx: Currency;

    procedure EditarSessao(S: TncSessao);
    procedure LoadEditSessao(aID: Integer);

    property OnAlterouSessao: TOnAlterouSessao
      read FOnAlterouSessao write FOnAlterouSessao;

    procedure AjustaCampoLocalizaCli;

    property UChat: Integer
      read FUChat write SetUChat;
//    function ObtemAguardando: Double;
  end;

  function DateTimeToTempo(DT: TDateTime; Unid: String): Double;
  procedure GetInfoCor(Itens, Cores: TStrings; S: String; var IC: TInfoCor);
  
  procedure TransfDados(TF, TD: TDataset);
  procedure TransfRecords(TF, TD: TDataset);
  procedure TransfDadosEsp(TF, TD: TDataset; ExceptFields: String);
  
  function Permitido(TipoAcesso: Integer): Boolean;

  function BarV(B: Boolean): TdxBarItemVisible;

  procedure PostInspectors(F: TForm);
  function PodeEditarTran(T: TDataset): Boolean;

  function ValorStr(E: Extended): String;
  function Pad(S: String; T: Integer): String;
  function LPad(S: String; T: Integer): String;
  function CharStr(C: Char; T: Integer): String;
  function TempoSt(S: String): String;

  procedure SalvaLayout(AGrid: TcxGrid; ALayout: String);
  procedure LeLayout(AGrid: TcxGrid; ALayout: String);

  function configname: String;

  procedure LoadConfig;
  procedure SaveConfig;
  

  function CaixaFechado: Boolean;

  function ForceForegroundWindow(hwnd: THandle): boolean;

  procedure OpenPremium(aRecurso: String);
  procedure OpenTrack(aTarget, aOrigin: String);

  function PortaRec: String;

  procedure LoadGrupoTar(aImg: TcxImageComboBox);

  function InitTran(aDB: TnxDatabase;
                    const aTables : array of TnxTable;
                    aWith : Boolean): Boolean;

  function PodeVenderPlus: Boolean;

  
var
  Dados: TDados;
  NumAcessoPagto: Integer;
  MaisDeUm : Boolean = False;  
  ServidorRemoto : Boolean = False;
  Conectando: Boolean = False;
  AR_Users : TStringList;
  AR_Desktops : TList;
  slConfig : TStringList;
  SimulaGuardOn : Boolean = False;
  
const
  DelimitaSt = #13#10;

  stprev_livre   = 0;
  stprev_emuso   = 1;
  stprev_semprev = 2;
  stprev_manut   = 3;
  
  Fechando : Boolean = False;

var  
  DirUA : String;   // Direitos do usuário atual
  DiaAberto : TDateTime;
  NumAberto : Integer;
  BioActive : Boolean = False;

resourcestring
  SSomenteAdmin = 'Somente usuário administrador do sistema pode realizar essa operação';  

implementation

uses 
  ncVersionInfo, 
  ncaFrmPri, ufmFormBase,
  {$IFNDEF LOJA}
  ncafbMaquinas, ncafbImp, ncTipoImp,
  {$ENDIF}
   ncDMServ, ncaFrmSessao, ncaFrmME,
  ncaFrmVendaProd, ncafbCaixa, ncaDMComp, ncaFrmTempo, ncDebito, ncLancExtra,
  ncDebTempo, ncaFrmDebito, ncaFrmDebTempo, ncaFrmImp, ncaFrmLancExtra,
  rdDesktopView, rtcpDesktopControlUI, ncJob, ncDebug, ncaFrmAddMaq,
  ncaFrmAbrirCx, ncaFrmVendaPlus, ncaFrmPanTopo, ncaFrmVenda{$ifdef LOJA}, ncafbMesas, ncaFrmME2{$endif},
  ncaFrmPagEspecie, ncDebCredValidator, ncShellStart, ncaFrmTarifa, nexUrls;

// START resource string wizard section
const
  SNexAdminIni = 'NexAdmin.ini';
  SNcadminExe = 'ncadmin.exe';
  SUChat = 'UChat';

// END resource string wizard section


// START resource string wizard section
resourcestring
  SSuaContaNexCaféNãoEstáAtivadaEmS = 'Sua conta NexCafé não está ativada em seu computador servidor. Para vender um produto PLUS sua conta NexCafé deve estar ativada.';
  SOCaixaEstáFechadoÉNecessárioAbri = 'O caixa está fechado. É necessário abrir o caixa para executar essa operação.';
  SHoras = 'Horas';
  SMinutos = 'Minutos';
  SSegundos = 'Segundos';
  SAjuda = 'Ajuda';
  SAConexãoComOServidorNexCaféFoiPe = 'A conexão com o servidor NexCafé foi perdida. Clique em OK e inicie novamente o NexAdmin.';
  SErroCriandoJanelaDeAcessoRemoto = 'Erro criando janela de acesso remoto';
  SSemPrevisão = 'Sem previsão';
  SJáExisteUmCMAdminSendoExecutado = 'Já existe um CM-Admin sendo executado!';
  SAConexãoComOServidorNexCaféFoiPe_1 = 'A conexão com o servidor NexCafé foi perdida. O NexAdmin será fechado.';
  SChatNexCaféMáq = 'Chat NexCafé - Máq.';
  SAtendenteDiz = 'Atendente diz';
  SMáquinaDiz = 'Máquina diz';
  SPósPago = 'Pós-Pago';
  SPósPagoTempoLivre = 'Pós-pago: Tempo Livre';
  STempoLivre = 'Tempo Livre';
  SPósPagoLimiteDeTempo = 'Pós-pago: Limite de Tempo';
  SLimiteDeTempo = 'Limite de Tempo';
  SPréPago = 'Pré-Pago';
  SDigitarTempoOuValor = 'Digitar Tempo ou Valor';
  SCartãoDeTempo = 'Cartão de Tempo';
  SRegistroNãoEncontrado = 'Registro não encontrado';
  SEmManutenção = 'Em manutenção';
  SLivre = 'Livre';

// END resource string wizard section


{$R *.DFM}

procedure OpenTrack(aTarget, aOrigin: String);
const 
{$ifdef LOJA}
   prog = '1';
{$else}
   prog = '0';
{$endif}
begin
  ShellStart(gUrls.Url('track', 'conta='+gConfig.Conta+'&target='+aTarget+'&origin='+aOrigin+'&prog='+prog+'&ver='+SelfShortVer));
end;

procedure OpenPremium(aRecurso: String);
begin
  OpenTrack('premium', aRecurso);
end;

function PodeVenderPlus: Boolean;
var 
  H : HWND;
  I : Integer;
begin
  I := gConfig.QtdLic;
  if (I<1) then begin
    Result := False;
    H := FindWindow('TncServBaseClassName', nil); // do not localize
    if H<>0 then 
      PostMessage(H, wm_abreserv, 1, 0) else
      ShowMessage(SSuaContaNexCaféNãoEstáAtivadaEmS);
  end else
    Result := True;
end;

function PortaRec: String;
begin
  if slConfig.Values['PortaRec'] > '' then // do not localize
    Result := slConfig.Values['PortaRec'] else // do not localize
    Result := gConfig.RecPorta;
end;

procedure LoadGrupoTar(aImg: TcxImageComboBox);
var I : Integer;
begin
  aImg.Properties.Items.Clear;
  if gTiposAcesso.Count<1 then Exit;
  for I := 0 to gTiposAcesso.Count-1 do 
    with aImg.Properties.Items.Add do begin
      Description := gTiposAcesso[I].Nome;
      Value := gTiposAcesso[I].ID;
    end;
  aImg.EditValue := gTiposAcesso[0].ID;  
end;

function configname: String;
begin
  Result := ExtractFilePath(ParamStr(0))+SNexAdminIni;
end;

function ForceForegroundWindow(hwnd: THandle): boolean;
const
  SPI_GETFOREGROUNDLOCKTIMEOUT = $2000;
  SPI_SETFOREGROUNDLOCKTIMEOUT = $2001;
var
  ForegroundThreadID: DWORD;
  ThisThreadID : DWORD;
  timeout : DWORD;
begin
  if IsIconic(hwnd) then ShowWindow(hwnd, SW_RESTORE);
  if GetForegroundWindow = hwnd then 
    Result := true
  else begin

  // Windows 98/2000 doesn't want to foreground a window when some other
  // window has keyboard focus
  
    if ((Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion > 4)) or
        ((Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and
        ((Win32MajorVersion > 4) or ((Win32MajorVersion = 4) and
        (Win32MinorVersion > 0)))) then
    begin
  
  // Code from Karl E. Peterson, www.mvps.org/vb/sample.htm
  // Converted to Delphi by Ray Lischner
  // Published in The Delphi Magazine 55, page 16
  
      Result := false;
      ForegroundThreadID := GetWindowThreadProcessID(GetForegroundWindow,nil);
      ThisThreadID := GetWindowThreadPRocessId(hwnd,nil);
      if AttachThreadInput(ThisThreadID, ForegroundThreadID, true) then
      begin
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hwnd);
        AttachThreadInput(ThisThreadID, ForegroundThreadID, false);
        Result := (GetForegroundWindow = hwnd);
      end;
      if not Result then begin
  // Code by Daniel P. Stasinski
        SystemParametersInfo(SPI_GETFOREGROUNDLOCKTIMEOUT, 0, @timeout, 0);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(0),  SPIF_SENDCHANGE);
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hWnd);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0,
        TObject(timeout), SPIF_SENDCHANGE);
      end;
    end
    else begin
      BringWindowToTop(hwnd); // IE 5.5 related hack
      SetForegroundWindow(hwnd);
    end;
  
    Result := (GetForegroundWindow = hwnd);
  end;
end; { ForceForegroundWindow }

function InitTran(aDB: TnxDatabase;
                  const aTables : array of TnxTable;
                  aWith : Boolean): Boolean;
var I : Integer;
begin
  Result := False;
  if aDB.InTransaction then Exit;
  I := 10;
  while I > 0 do begin
    try
      if aWith then
        aDB.StartTransactionWith(aTables)
      else
        aDB.StartTransaction;
      I := 0;
    except
      Dec(I);
      Random(500);
    end
  end;
  Result := True;
end;

function TempoSt(S: String): String;
begin
  if S>'' then begin
    S[3] :='h';
    S[6] :='m';
    S := S + 's';
    if Copy(S, 7, 2)='00' then // do not localize
      S := Copy(S, 1, 6);
    if Copy(S, 4, 2)='00' then // do not localize
      S := Copy(S, 1, 3) + Copy(S, 7, 3);
    if Copy(S, 1, 2)='00' then // do not localize
      S := Copy(S, 4, 10);
    while (S>'') and (S[1]='0') do Delete(S, 1, 1);
  end;
  Result := S;
end;


function CaixaFechado: Boolean;
begin
  if NumAberto<1 then begin
    Beep;
    ShowMessage(SOCaixaEstáFechadoÉNecessárioAbri);
    Dados.AbreCaixa;
  end;
  Result := (NumAberto < 1);
end;  

function MasterParentName(C: TControl): String;
begin
  Result := '';
  while C.Parent<>nil do begin
    Result := C.Parent.Name;
    C := C.Parent;
  end;   
end;

function GridClassName(C: TControl; ALayout: String): String;
begin
  Result := C.Owner.Name;
  if (ALayout<>'padrao') and (ALayout<>'especial') then // do not localize
    Result := Result + '.' + MasterParentName(C);
    
  if GridClassName_IncludeGridName then  
    Result := C.Name + '.' + Result;
end;

procedure LeLayout(AGrid: TcxGrid; ALayout: String);
var 
  M: TStream;
  GV : TcxCustomGridView;
begin
  if not Dados.tbLayout.Active then Exit;
  with Dados do 
  if tbLayout.FindKey([True, GridClassName(AGrid, ALayout), 'todos', ALayout]) then begin // do not localize
    M := TMemoryStream.Create;
    try 
      tbLayoutLayout.SaveToStream(M);
      M.Position := 0;
      GV := AGrid.Views[0];
      GV.RestoreFromStream(M);
      if GV is TcxGridDBTableView then
        with TcxGridDBTableView(GV) do
          OptionsView.DataRowHeight := StrToIntDef(tbLayoutUsuarios.Value, OptionsView.DataRowHeight)
      else   
      if GV is TcxGridDBCardView then
        with TcxGridDBCardView(GV) do
          OptionsView.CaptionWidth := StrToIntDef(tbLayoutUsuarios.Value, OptionsView.CardWidth);
    finally
      M.Free;
    end;    
  end;
end;

procedure SalvaLayout(AGrid: TcxGrid; ALayout: String);
var 
  M: TStream;
  GV : TcxCustomGridView;
begin
  with Dados do begin
    if not tbLayout.Active then Exit;
  
    if tbLayout.FindKey([True, GridClassName(AGrid, ALayout), 'todos', ALayout]) then // do not localize
      tbLayout.Edit else
      tbLayout.Insert;
      
    M := TMemoryStream.Create;
    try 
      GV := AGrid.Views[0];
      GV.StoreToStream(M);
      M.Position := 0;
      tbLayoutLayout.LoadFromStream(M);
      if GV is TcxGridDBTableView then
        tbLayoutUsuarios.Value := IntToStr(TcxGridDBTableView(GV).OptionsView.DataRowHeight)
      else   
      if GV is TcxGridDBCardView then
        tbLayoutUsuarios.Value := IntToStr(TcxGridDBCardView(GV).OptionsView.CardWidth);
      tbLayoutPublico.Value := True;
      tbLayoutGrid.Value := GridClassName(AGrid, ALayout);
      tbLayoutUsuario.Value := 'todos'; // do not localize
      tbLayoutNome.Value := ALayout;
      tbLayout.Post;
    finally
      M.Free;
    end;    
  end;
end;


function ValorStr(E: Extended): String;
begin
  Result := FloatToStrF(E, ffCurrency, 20, 2);
end;

function Pad(S: String; T: Integer): String;
begin
  Result := S;
  while Length(Result) < T do Result := Result + ' ';
end;

function LPad(S: String; T: Integer): String;
begin
  Result := S;
  while Length(Result) < T do Result := ' ' + Result;
end;

function CharStr(C: Char; T: Integer): String;
begin
  Result := '';
  while Length(Result) < T do Result := Result + C;
end;

function PodeEditarTran(T: TDataset): Boolean;
begin
  Result := (T.FieldByName('Caixa').AsInteger<=0) or // do not localize
            ((NumAberto>0) and
             (T.FieldByName('Caixa').AsInteger=NumAberto)); // do not localize
end;


procedure PostInspectors(F: TForm);
var I : Integer;
begin
  for I := 0 to F.ComponentCount-1 do
    if F.Components[I] is TcxDBVerticalGrid then 
      TcxDBVerticalGrid(F.Components[I]).DataController.PostEditingData;
end;


function BarV(B: Boolean): TdxBarItemVisible;
begin
  if B then
    Result := ivAlways
  else
    Result := ivNever;  
end;

procedure TransfDadosEsp(TF, TD: TDataset; ExceptFields: String);
var 
  I : Integer;
  F : TField;
begin
  ExceptFields := UpperCase(ExceptFields);
  with TD do
  for I := 0 to pred(Fields.Count) do with Fields[I] do 
  if (FieldKind=fkData) and (Pos('|'+UpperCase(FieldName)+'|', ExceptFields)=0) then begin
    F := TF.FindField(FieldName);
    if (F <> nil) and (F.FieldKind=fkData) then 
    if (TD is TkbmMemTable) or (TD.State<>dsInsert) or (F.DataType<>ftAutoInc) then
      Value := F.Value;
  end;
end;

procedure TransfRecords(TF, TD: TDataset);
begin
  TF.First;
  while not TF.Eof do begin
    TD.Append;
    TransfDados(TF, TD);
    TD.Post;
    TF.Next;
  end;
end;

procedure TransfDados(TF, TD: TDataset);
begin
  TransfDadosEsp(TF, TD, '');
end;

function LeftPadCh(S: String; C: Char; T: Integer): String;
begin
  Result := S;
  while Length(Result) < T do Result := C + Result;
end;

procedure TInfoCor.Limpa;
begin
  icCorFundo := clWhite;
  icCorFonte := clBlack;
  icNegrito  := False;
end;
  
procedure TInfoCor.LeStr(S: String);
begin
  if Length(S) <> 31 then
    Limpa
  else begin
    icCorFundo := TColor(StrToIntDef(Trim(Copy(S, 1, 15)), Integer(clWhite)));
    icCorFonte := TColor(StrToIntDef(Trim(Copy(S, 16, 15)), Integer(clBlack)));
    icNegrito  := (S[31] = 'T')
  end;
end;

function TInfoCor.GetStr: String;
const
  TFStr : Array[Boolean] of Char = ('F', 'T');
begin
  Result := 
    Pad(IntToStr(Integer(icCorFundo)), 15) +
    Pad(IntToStr(Integer(icCorFonte)), 15) +
    TFStr[icNegrito];
end;

procedure GetInfoCor(Itens, Cores: TStrings; S: String; var IC: TInfoCor);
var I : Integer;
begin
  I := Itens.IndexOf(S);
  if I = -1 then I := 0;
  if (Cores.Count>I) then
    IC.LeStr(Cores[I])
  else
    IC.Limpa;  
end;

procedure TInfoModulo.Limpa;
begin
  imID        := 0;
  imPos       := 0;
  imVisivel   := True;
  imMostraTab := True;
end;
  
procedure TInfoModulo.LeStr(S: String);
begin
  if Length(S) <> 6 then
    Limpa
  else begin
    imID := StrToIntDef(Copy(S, 1, 2), 0);
    imPos := StrToIntDef(Copy(S, 3, 2), 0);
    imVisivel := (S[5]='T');
    imMostraTab := (S[6]='T');
  end;  
end;

function TInfoModulo.GetStr: String;
const
  TFStr : Array[Boolean] of Char = ('F', 'T');
begin
  Result := 
    Pad(IntToStr(imID), 2) +
    Pad(IntToStr(imPos), 2) + 
    TFStr[imVisivel] +
    TFStr[imMostraTab];
end;

function DateTimeToTempo(DT: TDateTime; Unid: String): Double;
begin
  if Unid = SHoras then
    Result := Frac(DT) * 24
  else
  if Unid = SMinutos then
    Result := Frac(DT) * (24 * 60)
  else
  if Unid = SSegundos then
    Result := Frac(DT) * (24 * 60 * 60)
  else
    Result := 0;
end;

procedure TDados.AbreDB;
var I: Integer; S: TncSessao;
begin
  db.Connected:= true;
  tbCli.open;
  tbPro.open;
  tbTipoPass.Open;
  tbPass.Open;
  tbTran.open;
  tbMovEst.open;
  tbConfig.Open;
  tbLayout.Open;
  tbPacote.Open;
  tbCaixa.Open;
  tbTarifa.Open;
  tbEtar.Open;
  tbHoraCor.Open;
  tbTipoAcesso.Open;
  tbHPass.Open;
  tbChat.Open;
  tbTempo.Open;
  tbSessao.Open;
  tbImp.Open;
  tbPatro.Open;
  tbCHora.Open;
  tbIC.Open;

  RefreshCaixaAberto;

  mtPausadas.Open;
  
  mtImp.Active := False;
  mtImp.Active := True;
  for I := 0 to CM.Jobs.Count - 1 do
    CMAoAtualizarJob(CM.Jobs[I]);

  mtPrintDoc.Active := False;
  mtPrintDoc.Active := True;
  for I := 0 to CM.PrintDocs.Count - 1 do
    CMAoAtualizarPrintDoc(CM.PrintDocs[I]);

  mtUsuario.DisableControls;
  try
    mtUsuario.Active := True;
    mtUsuario.EmptyTable;
    CM.Usuarios.SalvaDataset(mtUsuario);
    mtUsuario.First;
  finally
    mtUsuario.EnableControls;
  end;

  mtTipoImp.DisableControls;
  try
    mtTipoImp.Active := True;
    mtTipoImp.EmptyTable;
    {$IFNDEF LOJA}
    gTiposImp.SalvaDataset(mtTipoImp);
    {$ENDIF}
    mtTipoImp.First;
  finally
    mtTipoImp.EnableControls;
  end;

  mtPrev.Active := True;

  mtMaquina.DisableControls;
  mtPrev.DisableControls;
  try
    mtMaquina.Active := True;
    mtMaquina.EmptyTable;
    CM.Maquinas.SalvaDataset(mtMaquina);

    mtMaquina.First;
    while not mtMaquina.Eof do begin
      mtPrev.Insert;
      mtPrevMaq.Value := mtMaquinaNumero.Value;
      mtPrev.Post;
      S := CM.Sessoes.PorMaq[mtMaquinaNumero.Value];
      if S<>nil then
        PrevSessaoMaq(S) else
        ClearSessaoMaq(nil);
      mtMaquina.Next;
    end;

    {$IFDEF LAN}
    if CM.UA.Admin then begin
      mtMaquina.Append;
      mtMaquinaNumero.Value := 9999;
      mtMaquina.Post;
      mtMaquina.First;
    end;
    {$ENDIF}
  finally
    mtPrev.EnableControls;
    mtMaquina.EnableControls;
  end;


  if tbConfig.RecordCount > 0 then 
    tbConfig.First;
    
  AjustaCampoLocalizaCli;
  Application.CreateForm(TDM, DM);
  DM.nxSession.ServerEngine := RSE;
  DM.Open;

  dmComp := TdmComp.Create(Self);
end;

procedure TDados.AcessoRemoto(aMaquina: String);
var I : Integer;
begin
  for I := 0 to ar_desktops.Count - 1 do
    if TrdDesktopViewer(ar_desktops[I]).UI.UserName = aMaquina then begin
      TrdDesktopViewer(ar_desktops[I]).Mostrar;
      Exit;
    end;

  PDesktopControl.Open(aMaquina);
end;

procedure TDados.DataModuleCreate(Sender: TObject);
var S: String;
begin
  CreateCM;
  gUrls.OnRefresh := OnRefreshUrls;
  FOnAlterouSessao := nil;
  frxResources.LoadFromStream(GL.Items[0].Data);
  WinPop := TFormWinPopup.Create(Self);
  S := ExtractFilePath(ParamStr(0))+SNcadminExe;
  if FileExists(S) then
    DeleteFile(S);
    
  mtMaquina.Active := True;
  S := ExtractFilePath(ParamStr(0))+SAjuda;
  if not DirectoryExists(S) then
    mkDir(S);
    
  LeLayoutProc := @LeLayout;
  SalvaLayoutProc := @SalvaLayout;
{  nxTCPIP.Enabled := False;
  nxTCPIP.Port := 16100;
  nxTCPIP.Enabled := True;}
  SessoesFinalizadas := TStringList.Create;
  DiaAberto := 0;
  NumAberto := -1;
  DirUA := '';
  if MaisDeUm then Exit;
  FUChat := Reg.ReadInteger('', SUChat, 0);
end;
 
procedure TDados.FFTblMgrPause;
begin
  Application.ProcessMessages;
end;

procedure TDados.NovaMaq;
var 
  I  : Integer;
  M : TncMaquina;
  sMenu : String;
begin
  if CM.Maquinas.Count > 0 then
    M := CM.Maquinas[pred(CM.Maquinas.Count)] else
    M := nil;

  if (M<>nil) then begin
    I := M.Numero+1;
    sMenu := M.Menu;
  end  else begin
    I := 1;
    sMenu := '';
  end;
      
  if TFrmAddMaq.Create(Self).AddMaq(I) then begin
    M := TncMaquina.Create;
    M.Numero := I;
    M.Menu := sMenu;
    try
      CM.SalvaAlteracoesObj(M, True);
    finally
      M.Free;
    end;    
  end;  
end;

function TDados.NovaVenda(aCliente: Integer; aPagPend, aFidResgate: Boolean;
  aTamanho: Byte = tamTelaNormal): Boolean;
var 
  ME: TncMovEst;
  S: String;
begin
  result := false;
  if CaixaFechado then Exit;
  ME := TncMovEst.Create;
  try
    ME.Tipo := trEstVenda;
    ME.Operacao := osIncluir;
    ME.FidResgate := aFidResgate;
    ME.PagPend := aPagPend;
    ME.Cliente := aCliente;
    S := CM.UA.Username;
    ME.Func := S;
    {$ifdef LOJA}
    result := TFrmME2.Create(nil).Editar(True, ME, True);
    {$else}
    result := TFrmME.Create(nil).Editar(True, ME, True);
    {$endif}
    if result then 
      CM.SalvaMovEst(ME);
  finally
    ME.Free;
  end;
end;

function TDados.NovoMovEst(aTipoTran: Integer; aCliente: Integer; aPagPend: Boolean = False; aFidResgate: Boolean = False; aTamanho: Byte = tamTelaNormal):boolean;
var 
  ME: TncMovEst;
  S: String;
begin
  result := false;
  if CaixaFechado then Exit;
  ME := TncMovEst.Create;
  try
    ME.Tipo := aTipoTran;
    ME.Operacao := osIncluir;
    ME.PagPend := aPagPend;
    ME.FidResgate := aFidResgate;
    ME.Cliente := aCliente;
    S := CM.UA.Username;
    ME.Func := S;
    {$ifdef LOJA}
    result := TFrmME2.Create(nil).Editar(True, ME, True);
    {$else}
    result := TFrmME.Create(nil).Editar(True, ME, True);
    {$endif}
    
    if result then 
      CM.SalvaMovEst(ME);
  finally
    ME.Free;
  end;
end;

procedure TDados.nxTCPIPConnectionLost(aSender: TnxBaseTransport;
  aSessionID: TnxSessionID);
begin
  ShowMessage(SAConexãoComOServidorNexCaféFoiPe);
  CM.Ativo := False;
end;

procedure TDados.OnRefreshUrls(Sender: TObject);
begin
  if Assigned(CM) and CM.Ativo then begin
    gConfig.AtualizaCache;
    gConfig.Urls := gUrls.AsString;
    CM.SalvaAlteracoesObj(gConfig, False);
  end;
end;

procedure TDados.PClientLogIn(Sender: TAbsPortalClient);
begin
  ar_users.Clear;
  ar_desktops.Clear;
end;

procedure TDados.PClientUserLoggedIn(Sender: TAbsPortalClient;
  const User: string);
begin
  if ar_users.IndexOf(User)=-1 then
    ar_users.Add(User);
end;

procedure TDados.PClientUserLoggedOut(Sender: TAbsPortalClient;
  const User: string);
var I: Integer;
begin
  I := ar_users.IndexOf(user);
  if I>=0 then 
    ar_users.Delete(I);
    
{$IFNDEF LOJA}
  if fbMaquinas<>nil then
    fbMaquinas.RefreshBotoes; 
{$ENDIF}
end;

procedure TDados.PDesktopControlNewUI(Sender: TRtcPDesktopControl;
  const user: string);
var
  CDesk:TrdDesktopViewer;
begin
  CDesk:=TrdDesktopViewer.Create(nil);
  if assigned(CDesk) then
    begin
    CDesk.PFileTrans:=PFileTrans;
    CDesk.UI.MapKeys:=True;
    CDesk.UI.SmoothScale:=True;
    CDesk.UI.ExactCursor:=False;
    CDesk.UI.ControlMode:=rtcpFullControl;
    CDesk.UI.UserName:=user;
    CDesk.UI.Module:=Sender;
    CDesk.Show;
    end
  else
    raise ENexCafe.Create(SErroCriandoJanelaDeAcessoRemoto);

  ar_desktops.Add(CDesk);  
  if CDesk.WindowState=wsNormal then
  begin
    CDesk.BringToFront;
    BringWindowToTop(CDesk.Handle);
  end;
end;

procedure TDados.PrevSessaoMaq(S: TncSessao);
var D: Double;
begin
  mtPrev.Edit;
  mtPrevSessaoObj.Value := Integer(S);
  mtPrevInicio.Value := S.Inicio;
  if S.TempoMaximo.Ticks>0 then begin
    mtPrevStatus.Value := stprev_emuso;
    mtPrevFim.Value := S.Inicio + S.TempoMaximo.DateTime + TicksToDateTime(S.Pausas.TicksTotal);  
    if FormatDateTime('ddmmyyyyy', mtPrevFim.Value) <> FormatDateTime('ddmmyyyy', S.Inicio) then // TODO : check string
      mtPrevFimPrev.Value := FormatDateTime('hh:nn:ss', mtPrevFim.Value)  + '   *' + FormatDateTime('dd/mm/yyyy', mtPrevFim.Value) else // TODO : check string
      mtPrevFimPrev.Value := FormatDateTime('hh:nn:ss', mtPrevFim.Value); // TODO : check string
  end
  else begin
    mtPrevFimPrev.Value := SSemPrevisão;
    mtPrevStatus.Value := stprev_semprev;
    mtPrevFim.Clear;
  end;
  mtPrev.Post;
end;

function TDados.LimiteDebito(F: TField): Double;
begin
  if F.IsNull then
    Result := tbConfigLimitePadraoDebito.Value else
    Result := F.AsFloat;  
end;

procedure TDados.LoadEditSessao(aID: Integer);
var S: TncSessao;
begin
  S := CM.Sessoes.PorID[aID];
  if S<>nil then 
    EditarSessao(S)
  else with DM do begin
    S := TncSessao.Create(True);
    try
      if not tSessao.FindKey([aID]) then Exit;
      S.LeDataset(tSessao);
      RefreshSessao(S);
      EditarSessao(S);
    finally
      S.Free;
    end;
  end;
end;

procedure TDados.SoUmProgCustom(Sender: TObject);
begin
  MaisDeUm := True;
  ShowMessage(SJáExisteUmCMAdminSendoExecutado);
end;

function TDados.TarifasOk: Boolean;
begin
  if gTarifas.Count=0 then begin
    ShowMessage('Para realizar essa operação é necessário que seja configurado uma tarifa de acesso');
    Result := TFrmTarifa.Create(Self).Novo;
  end else
    Result := True;
end;

procedure TDados.CMAoDesativar(Sender: TObject);
begin
  if not Conectando then begin
    Session.Active := False;
    ShowMessage(SAConexãoComOServidorNexCaféFoiPe_1);
    ClicouSair := True;
    Application.Terminate;
  end;  
end;

function TDados.SaldoInicialCx: Currency;
var S: String;
begin
  Result := 0;
  if gConfig.ManterSaldoCaixa and (not tbCaixa.IsEmpty) then begin
    S := tbCaixa.IndexName;
    try
      tbCaixa.IndexName := 'IID'; // do not localize
      tbCaixa.Last;
      Result := tbCaixaTotalFinal.Value + tbCaixaSaldoAnt.Value + tbCaixaSupr.Value - tbCaixaSangria.Value;
    finally
      tbCaixa.IndexName := 'IAberto'; // do not localize
    end;
  end;
end;

procedure TDados.SetUChat(const Value: Integer);   
begin
  if Value=FUChat then Exit;
  FUChat := Value;
  Reg.WriteInteger('', SUChat, FUChat);
end;

procedure TDados.tbProCalcFields(DataSet: TDataSet);
begin
  tbProEstoqueFinal.Value :=
    tbProEstoqueAtual.Value +
    tbProEstoqueACE.Value -
    tbProEstoqueACS.Value;
end;

procedure TDados.ffClientConnectionLost(aSource: TObject;
  aStarting: Boolean; var aRetry: Boolean);
begin
  aRetry := False;
  CM.Ativo := False;
  ServRem.Ativo := False;
  Application.Terminate;
end;

procedure TDados.CMAoAtualizarUsuario(Sender: TObject);
var U: TncUsuario;
begin
  if not mtUsuario.Active then Exit;
  U := TncUsuario(Sender);
  if mtUsuario.Locate('Username', U.Username, []) then  // do not localize
    mtUsuario.Edit else
    mtUsuario.Append;  
    
  U.SalvaDataset(mtUsuario);
  mtUsuario.Post;
  FrmPri.AjustaVisSenha;  
end;

procedure TDados.CMAoDestruirUsuario(Sender: TObject);
begin
  if not mtUsuario.Active then Exit;
  with TncUsuario(Sender) do
  if mtUsuario.Locate('Username', Username, []) then // do not localize
    mtUsuario.Delete;

end;

procedure TDados.CMAoReceberChat(Sender: TObject; MsgID, De, Para: Integer;
  DataHora: TDateTime; Texto: string);
begin
  UChat := MsgID;
  if De<>0 then begin
    if gConfig.ChatAlertaSonoro then 
      Wav2.Play;
    if gConfig.ChatMostraNotificacao then
      WinPop.WinPopUp(SChatNexCaféMáq+IntToStr(De), Texto, 0,0,3000,0);
  end;
  {$IFNDEF LOJA}
  FrmPri.FrmChat.MsgEnv(DataHora, De, Para, Texto);
  {$ENDIF}
end;

function TDados.ControlaSaldo(aProduto: String): Boolean;
var SIndex: String;
begin
  Result := True;
  SIndex := tbPro.IndexName;
  tbPro.IndexName := 'ICodigo'; // do not localize
  try
    Result := (not tbPro.FindKey([aProduto])) or (not tbProNaoControlaEstoque.Value);
  finally
    tbPro.IndexName := SIndex;
  end;
end;

function TDados.CorrigeEstoque(aProduto: Integer; aAnt, aNovo: Double): Boolean;
var ME: TncMovEst;
begin
  Result := False;
  if Int(aAnt*1000)=Int(aNovo*1000) then Exit;
  ME := TncMovEst.Create;
  try
    ME.Caixa := NumAberto;
    ME.DataHora := Now;
    ME.Func := CM.UA.Username;
    ME.Operacao := osIncluir;
    with ME.NewIME do begin
      if aNovo>aAnt then begin
        ME.Tipo := trEstEntrada;
        imQuant := aNovo - aAnt;
      end else begin
        ME.Tipo := trEstSaida;
        imQuant := aAnt - aNovo;
      end;
      imProduto := aProduto;
      imItem := 1;
//      imEstoqueAnt := aAnt;
      _Operacao := osIncluir;
    end;
    CM.SalvaMovEst(ME);
    Result := True;
  finally
    ME.Free;
  end;
end;

procedure TDados.CreateCM;
begin
  ServRem := TncNXServRemoto.Create(Self);
  ServRem.CmdHandler := SimpleCmdHandler;
  ServRem.Session := Session;
  ServRem.Transp := nxTCPIP;
  
  CM := TClienteNexCafe.Create(Self);
  CM.Servidor := ServRem;
  CM.FuncAtual := True;
  CM.Senha := 'proxypass';
  CM.Username := 'proxy';
  CM.AoAbrirFecharCx := CMAoAbrirFecharCx;
  CM.AoAtualizarConfig := CMAoAtualizarConfig;
  CM.AoAtualizarJob := CMAoAtualizarJob;
  CM.AoAtualizarMaquina := CMAoAtualizarMaquina;
  CM.AoAtualizarSessao := CMAoAtualizarSessao;
  CM.AoAtualizarTarifa := CMAoAtualizarTarifa;
  CM.AoAtualizarTipoAcesso := CMAoAtualizarTipoAcesso;
  CM.AoAtualizarTipoImp := CMAoAtualizarTipoImp;
  CM.AoAtualizarUsuario := CMAoAtualizarUsuario;
  CM.AoAtualizarPrintDoc := CmAoAtualizarPrintDoc;
  
  CM.AoDesativar := CMAoDesativar;
  CM.AoDestruirJob := CmAoDestruirJob;
  Cm.AoDestruirMaquina := CMAoDestruirMaquina;
  CM.AoDestruirPrintDoc := CMAoDestruirPrintDoc;
  CM.AoDestruirSessao := CMAoDestruirSessao;
  CM.AoDestruirTarifa := CMAoAtualizarTipoAcesso;
  CM.AoDestruirTipoAcesso := CMAoAtualizarTipoAcesso;
  CM.AoDestruirTipoImp := CMAoDestruirTipoImp;
  CM.AoDestruirUsuario := CMAoDestruirUsuario;
  CM.AoReceberChat := CMAoReceberChat;
end;

procedure TDados.CMAoAtualizarMaquina(Sender: TObject);
var
  M: TncMaquina;
  N: Integer;
  Str : String;
  S: TncSessao;
begin
  if not mtMaquina.Active then Exit;
  N := mtMaquinaNumero.Value;
  mtMaquina.DisableControls;
  try
    M := TncMaquina(Sender);
    if mtMaquina.Locate('Numero', M.Numero, []) then // do not localize
      mtMaquina.Edit
    else begin
      FrmPri.RefreshCacheMaq;
      mtMaquina.Append;
      mtPrev.Append;
      mtPrevMaq.Value := M.Numero;
      mtPrev.Post;
      S := CM.Sessoes.PorMaq[M.Numero];
      if S<>nil then
        PrevSessaoMaq(S) else
        ClearSessaoMaq(nil);
    end;
    Str := M.ProgramaAtual;
    if Str='sdfsdfsdfsdf' then Exit; // TODO : check string

    M.SalvaDataset(mtMaquina);
    mtMaquina.Post;
    Str := mtMaquinaProgramaAtual.Value;
    if Str='sdfsdfsdfsdf' then Exit; // TODO : check string
    
  finally
    mtMaquina.Locate('Numero', N, []); // do not localize
    mtMaquina.EnableControls;
  end;
  
  mtMaquina.Refresh;   
end;

procedure TDados.CMAoAtualizarPrintDoc(Sender: TObject);
var 
  P : TncPrintDoc;
  S, SP : String;
  {$IFNDEF LOJA}
  T : TncTipoImp;
  {$ENDIF}
  SS : TncSessao;
begin
  P := TncPrintDoc(Sender);
  if mtPrintDoc.RecordCount>0 then
    S := mtPrintDocArq.Value else
    S := '';

  if mtPausadas.RecordCount>0 then
    SP := mtPausadasID.Value else
    SP := ''; 
    
  mtPrintDoc.DisableControls;
  mtPausadas.DisableControls;
  try  
    if mtPrintDoc.FindKey([P.ArqStr]) then
      mtPrintDoc.Edit else
      mtPrintDoc.Insert;

    if mtPausadas.Findkey([P.ArqStr]) then
      mtPausadas.Edit else
      mtPausadas.Insert;

    mtPausadasID.Value := P.ArqStr;
    mtPausadasDoc.Value := P.DocInfo.Values['doctitle']; // do not localize
    mtPausadasPDF.Value := True;    

    SS := nil;
    if P.Sessao>0 then
      SS := CM.Sessoes.PorID[P.Sessao];

    if SS=nil then
      mtPausadasMaq.Clear else
      mtPausadasMaq.Value := SS.Maq; 

    mtPrintDocArq.Value := P.ArqStr;
    mtPrintDocPag.Value := P.CalcPages;
    mtPrintDocSessao.value := P.Sessao;
    mtPrintDocTipoImp.Value := P.Tipo;
    mtPausadasPag.Value := P.CalcPages;

    {$IFNDEF LOJA}
    T := gTiposImp.PorID[P.Tipo];
    if T<>nil then begin
      mtPrintDocNomeTipoImp.Value := T.Nome;
      mtPausadasImpTipo.Value := T.Impressora + ' / ' + T.Nome;
    end else begin
      mtPrintDocNomeTipoImp.Value := '';
      mtPausadasImpTipo.Clear;
    end;
    {$ENDIF}

    mtPrintDocDoc.Value := P.DocInfo.Values['doctitle']; // do not localize
    mtPrintDoc.Post;
    mtPausadas.Post;
    

    if S<>'' then mtPrintDoc.FindKey([S]);
    if SP<>'' then mtPausadas.FindKey([SP]);

  finally
    mtPrintDoc.EnableControls;
    mtPausadas.EnableControls;
  end;
  FrmPri.RefreshBotoesMaq;
end;

procedure TDados.CMAoAtualizarSessao(Sender: TObject);
var 
  I : Integer;
  S : TncSessao;
begin
  S := TncSessao(Sender);
  if Assigned(FOnAlterouSessao) then FOnAlterouSessao(S, False);
  
  {$IFDEF LAN}
  if (fbMaquinas<>nil) then begin
    if S.Maq = mtMaquinaNumero.Value then
      fbMaquinas.RefreshBotoes;
    fbMaquinas.Timer2.Enabled := True;
  end;

  FrmPri.ListaEspera.FiltraDados;
  {$ENDIF}

  {$IFDEF LOJA}
  if (fbMesas<>nil) and (S.Maq = mtMaquinaNumero.Value) then
    fbMesas.RefreshBotoes;
  {$ENDIF}

  I := mtPrevMaq.Value;

  mtPrev.DisableControls;

  try
    if not mtPrev.Locate('SessaoObj', Integer(S), []) then  // do not localize
      mtPrev.Locate('Maq', S.Maq, []); // do not localize
    
    if mtPrevMaq.Value <> S.Maq then begin
      ClearSessaoMaq(S);
      mtPrev.Locate('SessaoObj', Integer(S), []); // do not localize
    end;  

    if mtPrevMaq.Value = S.Maq then 
      PrevSessaoMaq(S);

  finally
    mtPrev.Locate('Maq', I, []); // do not localize
    mtPrev.EnableControls;
  end;

  if S.Encerrou then begin
    I := SessoesFinalizadas.IndexOf(IntToStr(S.ID));
    if I >= 0 then begin
      SessoesFinalizadas.Delete(I);
      if Application.ActiveFormHandle = FrmPri.Handle then begin
        EditarSessao(S);
      
      end;
    end;
  end;
  
end;

procedure TDados.CMAoAtualizarTarifa(Sender: TObject);
var I : Integer;
begin
  for I := 0 to CM.Sessoes.Count-1 do 
    CM.Sessoes[I].Tarifador.Reset;
  BroadcastAtualizaDireitosConfig;  
end;

procedure TDados.CMAoAtualizarTipoAcesso(Sender: TObject);
var I : Integer;
begin
  for I := 0 to CM.Sessoes.Count-1 do 
    CM.Sessoes[I].Tarifador.Reset;
  BroadcastAtualizaDireitosConfig;  
end;

procedure TDados.CMAoAtualizarTipoImp(Sender: TObject);
var SaveID: Integer;
begin
  if mtTipoImp.RecordCount>0 then
    SaveID := mtTipoImpID.Value else
    SaveID := -1;

{$IFNDEF LOJA}
  try

    if mtTipoImp.FindKey([TncTipoImp(Sender).ID]) then 
      mtTipoImp.Edit else
      mtTipoImp.Append;
  
    TncTipoImp(Sender).SalvaDataset(mtTipoImp);
  
    mtTipoImp.Post;
  
  finally
    if SaveID>-1 then 
      mtTipoImp.FindKey([SaveID]);
  end;
  {$ENDIF}
end;

procedure TDados.CMAoDestruirJob(Sender: TObject);
var 
  J : TncJob;
  aPrinterIndex, aJobID: Integer;
begin
  if mtImp.IsEmpty then begin
    aPrinterIndex := -1;
    aJobID := -1;
  end else begin
    aPrinterIndex := mtImpPrinterIndex.Value;
    aJobID := mtImpJobID.Value;
  end;
  try
    J := TncJob(Sender);
    mtImp.DisableControls;
    mtPausadas.DisableControls;
    try
      if mtImp.FindKey([J.PrinterIndex, J.JobID]) then 
        mtImp.Delete;

      if mtPausadas.FindKey([IntToStr(J.PrinterIndex)+'-'+IntToStr(J.JobId)]) then
        mtPausadas.Delete;
    finally
      mtImp.EnableControls;
      mtPausadas.EnableControls;
    end;
    FrmPri.RefreshBotoesMaq;
  finally
    if aJobID>=0 then begin
      mtImp.FindKey([aPrinterIndex, aJobID]);
      mtPausadas.FindKey([IntToStr(J.PrinterIndex)+'-'+IntToStr(J.JobId)]);
    end;
  end;
end;

procedure TDados.CMAoDestruirMaquina(Sender: TObject);
begin
{$IFNDEF LOJA}
  if not mtMaquina.Active then Exit;
  if mtMaquina.Locate('ObjectInt', Integer(Sender), []) then begin // do not localize
    if fbMaquinas<>nil then
      fbMaquinas.DeleteMaq(TncMaquina(Sender));
    mtMaquina.Delete;
  end;
  if mtPrev.Locate('Maq', TncMaquina(Sender).Numero, []) then // do not localize
    mtPrev.Delete;
{$ENDIF}
end;

procedure TDados.CMAoDestruirPrintDoc(Sender: TObject);
var P : TncPrintDoc; S, S2: String;
begin
  P := TncPrintDoc(Sender);
  if (mtPrintDoc.RecordCount>0) and (P.ArqStr<>mtPrintDocArq.Value) then
    S := mtPrintDocArq.Value else
    S := '';

  mtPrintDoc.DisableControls;
  mtPausadas.DisableControls;
  try
    S2 := P.ArqStr;
    if mtPrintDoc.FindKey([S2]) then mtPrintDoc.Delete;
    if mtPausadas.FindKey([S2]) then mtPausadas.Delete;

    if S<>'' then begin
      mtPrintDoc.FindKey([S]);
      mtPausadas.FindKey([S]);
    end;

  finally
    mtPrintDoc.EnableControls;
    mtPausadas.EnableControls;
  end;  

  FrmPri.RefreshBotoesMaq;
end;

procedure TDados.CMAoDestruirSessao(Sender: TObject);
var
  S : TncSessao;
{$IFDEF LAN}
  FI: PfmFormInfo;
  I: Integer;
{$ENDIF}
begin
  if Assigned(FOnAlterouSessao) then FOnAlterouSessao(TncSessao(Sender), True);

{$IFNDEF LOJA}
  if fbMaquinas<>nil then
    fbMaquinas.Timer2.Enabled := True;
  FrmPri.ListaEspera.FiltraDados;
  S := TncSessao(Sender);
  I := mtPrevMaq.Value;
  mtPrev.DisableControls;
  try
    ClearSessaoMaq(S);
  finally
    mtPrev.EnableControls;
  end;
{$ENDIF}
end;

procedure TDados.CMAoDestruirTipoImp(Sender: TObject);
var SaveID: Integer;
begin
{$IFNDEF LOJA}
  if mtTipoImp.RecordCount>0 then
    SaveID := mtTipoImpID.Value else
    SaveID := -1;

  try  

    if mtTipoImp.FindKey([TncTipoImp(Sender).ID]) then 
      mtTipoImp.Delete;
  
  finally
    if SaveID>-1 then 
      mtTipoImp.FindNearest([SaveID]);
  end;
{$ENDIF}
end;

procedure TDados.mtImpAfterDelete(DataSet: TDataSet);
begin
  {$IFNDEF LOJA}
  FrmPri.FrmImp.TemNovidade;
  {$ENDIF}
end;

procedure TDados.mtImpCalcFields(DataSet: TDataSet);
begin
  if mtImpClientPages.Value>0 then
    mtImpPaginasReg.Value := mtImpClientPages.Value
  else
  if mtImpPages.Value>0 then begin
    if mtImpCopies.Value>0 then
      mtImpPaginasReg.Value := mtImpPages.Value * mtImpCopies.Value else
      mtImpPaginasReg.Value := mtImpPages.Value;
  end else
    if mtImpCopies.Value>0 then
      mtImpPaginasReg.Value := mtImpTotalPages.Value * mtImpCopies.Value else
      mtImpPaginasReg.Value := mtImpTotalPages.Value;
end;

procedure TDados.mtMaquinaCalcFields(DataSet: TDataSet);
begin
  if (mtMaquinaDisplayW.Value>0) and (mtMaquinaDisplayH.Value>0) then
    mtMaquinaDisplayWH.Value := mtMaquinaDisplayW.AsString + 'x'+ mtMaquinaDisplayH.AsString else
    mtMaquinaDisplayWH.Value := '';    
end;

procedure TDados.mtPrintDocCalcFields(DataSet: TDataSet);
var S: TncSessao;
begin
  S := CM.Sessoes.PorID[mtPrintDocSessao.Value];
  if S<>nil then
    mtPrintDocMaq.Value := S.Maq;
end;

procedure TDados.mtTipoImpCalcFields(DataSet: TDataSet);
begin
  mtTipoImpShowImp.Value := (Trim(mtTipoImpImpressora.Value)>'');
end;

function Permitido(TipoAcesso: Integer): Boolean;
begin
  if Dados.CM.UA.Admin then
    Result := True else
    Result := ItemTrueStr(Dados.CM.UA.Direitos, TipoAcesso);
end;

procedure TDados.AbreCaixa;
var 
  aSaldo: Currency;
begin
  aSaldo := 0;
  if NumAberto>0 then Exit;
  if not TFrmAbrirCaixa.Create(Self).Abrir(aSaldo) then Exit;
  CM.AbrirCaixa(aSaldo);
  Self.RefreshCaixaAberto;
end;

{function TDados.ObtemAguardando: Double;
begin
  Q.Active := False;
  Q.Active := True;
  if Q.RecordCount > 0 then
    Result := Q.FieldByName('Acessos').AsFloat + Q.FieldByName('Vendas').AsFloat
  else
    Result := 0;
end;}

procedure TDados.DataModuleDestroy(Sender: TObject);
begin
  SessoesFinalizadas.Free;
  gUrls.OnRefresh := nil;
  try FreeAndNil(CM); except end;
  try FreeAndNil(ServRem); except end;
end;

procedure TDados.ImprimeRecibo(aTran: Integer);
begin

end;

procedure TDados.Timer1Timer(Sender: TObject);
var Res : Integer;
begin
  Res := 0;
  if CM.Ativo then 
  try
    Res := ServRem.KeepAlive;
  except
    Res := -1;
  end;
  if Res<>0 then begin
    mtMaquina.Active := False;
    CM.Ativo := False;
    nxTCPIP.Active := False;
    ServRem.Ativo := False;
    FrmPri.Close;
    ShowMessage(SAConexãoComOServidorNexCaféFoiPe_1);
  end;
end;

procedure TDados.Timer2Timer(Sender: TObject);
begin
{  Timer2.Enabled := False;
  if tbAcesso.FindKey([NumAcessoPagto]) then
    TFrmAcesso.Create(Self).Editar(tbAcesso, 2);}
end;

procedure TDados.tbChatCalcFields(DataSet: TDataSet);
var S: String;
begin
  if tbChatDe.Value=0 then begin
    S := SAtendenteDiz;
    tbChatMaq.Value := tbChatPara.Value;
  end else begin
    S := SMáquinaDiz;
    tbChatMaq.Value := tbChatDe.Value;
  end;
    
  tbChatDiz.Value := FormatDateTime('hh:nn:ss', tbChatDataHora.Value) + ' - ' + S; // TODO : check string
end;

procedure TDados.RefreshCaixaAberto;
begin
  if tbCaixa.FindKey([True]) then begin
    DiaAberto := tbCaixaAbertura.Value;
    NumAberto := tbCaixaID.Value;
  end else begin
    DiaAberto := 0;
    NumAberto := -1;
  end;  
  BroadcastAtualizaDireitosConfig;  
end;

procedure TDados.RefreshTipoCred(NoDiv: Boolean; AddLivre: Boolean = False; AddPos: Boolean = True);
begin
    tabTT.Active := True;
    tabTT.EmptyTable;
    
    if AddPos then begin
      if not NoDiv then begin
        tabTT.Append;
        tabTTTipo.Value := tctDiv;
        tabTTDescr.Value := SPósPago;
        tabTTCodigo.Value := 0;
        tabTT.Post;
      end;

      if AddLivre then begin
        tabTT.Append;
        tabTTTipo.Value := tctLivre;
        if NoDiv then
          tabTTDescr.Value := SPósPagoTempoLivre else
          tabTTDescr.Value := STempoLivre;
        tabTTCodigo.Value := 0;
        tabTT.Post;
      end;
    
      tabTT.Append;
      tabTTTipo.Value := tctPrevisao;
      if NoDiv then
        tabTTDescr.Value := SPósPagoLimiteDeTempo else
        tabTTDescr.Value := SLimiteDeTempo;
      tabTTCodigo.Value := 0;
      tabTT.Post;

      if not NoDiv then begin
        tabTT.Append;
        tabTTTipo.Value := tctDiv2;
        tabTTDescr.Value := SPréPago;
        tabTTCodigo.Value := 0;
        tabTT.Post;
      end;
    end;

    tabTT.Append;
    tabTTTipo.Value := tctAvulso;
    tabTTDescr.Value := SDigitarTempoOuValor;
    tabTTCodigo.Value := 0;
    tabTT.Post;
  
    tbTipoPass.First;
    while not tbTipoPass.Eof do begin
      tabTT.Append;
      tabTTTipo.Value := tctPassaporte;
      tabTTDescr.Value := tbTipoPassNome.Value;
        
      tabTTCodigo.Value := tbTipoPassiD.Value;
      tabTTMinutos.Value := tbTipoPassMinutos.Value;
      tabTTValor.Value := tbTipoPassValor.Value;
      tabTTTipoAcesso.Value := tbTipoPassTipoAcesso.Value;
      if tbTipoPassFidelidade.Value then
        tabTTPontos.Value := tbTipoPassFidPontos.Value;
      tabTT.Post;
      tbTipoPass.Next;
    end;
  
    tbPacote.First;
    while not tbPacote.Eof do begin
      tabTT.Append;
      tabTTTipo.Value := tctPacote;
      tabTTDescr.Value := tbPacoteDescr.Value;
      
      tabTTCodigo.Value := tbPacoteiD.Value;
      tabTTMinutos.Value := tbPacoteMinutos.Value;
      tabTTValor.Value := tbPacoteValor.Value;
      
      if tbPacoteFidelidade.Value then
        tabTTPontos.Value := tbPacoteFidPontos.Value;
        
      tabTT.Post;
      tbPacote.Next;
    end;

    tabTT.Append;
    tabTTTipo.Value := tctCartaoTempo;
    tabTTDescr.Value := SCartãoDeTempo;
    tabTTCodigo.Value := 0;
    tabTT.Post;
  
    tabTT.First;
end;

procedure TDados.TotalizaDebCli(Cli: Integer);
var Debito: Double;
begin
  Q.Active := False;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT ' + // do not localize
            '  Sum(Valor) as TotDeb ' + // do not localize
            'FROM Debito ' + // do not localize
            'WHERE '+ // do not localize
            '  Cliente='+IntToStr(Cli)); // do not localize
  Q.Open;
  Debito := Q.FieldByName('TotDeb').AsCurrency; // do not localize
  tbCli.CancelRange;
  tbCli.IndexName := 'ICodigo';             // do not localize
  if tbCli.FindKey([Cli]) then begin
    tbCli.Edit;
    tbCliDebito.Value := Debito;
    tbCliTemDebito.AsBoolean := (Debito>0.0009);
    tbCli.Post;
  end;
  Q.Active := False;
end;

function TDados.TotalPassCli: Double;
begin
  Q.Active := False;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT SUM(Passaportes) as Minutos From Cliente where (Passaportes>0)'); // do not localize
  Q.Open;
  Result := Q.FieldByName(SMinutos).AsFloat;
end;

function TDados.TotalDebitos: Double;
begin
  Q.Active := False;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT Sum(D.Valor) as TotDeb FROM Debito D, Cliente C where C.ID = D.Cliente'); // do not localize
  Q.Open;
  Result := Q.FieldByName('TotDeb').AsCurrency; // do not localize
end;

function TDados.TotalCreditos: Double;
begin
  Q.Active := False;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT SUM(Minutos) as Minutos From Cliente where (Minutos>0)'); // do not localize
  Q.Open;
  Result := Q.FieldByName(SMinutos).AsFloat;
end;

function TDados.TotalCredValor: Double;
begin
  Q.Active := False;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT SUM(ValorCred) as Valor From Cliente where (ValorCred>0)'); // do not localize
  Q.Open;
  Result := Q.FieldByName('Valor').AsCurrency; // do not localize
end;

procedure TDados.EditarMovEst(ME: TncMovEst; aPodeAlterarCli : Boolean = False);
var 
  B: TncItensMovEst;
  Str: String;
  S: TncSessao;
begin
  B := TncItensMovEst.Create(nil);
  try
    Str := ME.Itens.AsString;
    if Trim(ME.plusID)>'' then begin
      if TFrmVendaPlus.Create(nil).Editar(ME, (NumAberto=ME.Caixa), aPodeAlterarCli) then begin
        B.AsString := ME.Itens.AsString;
        ME.Itens.AsString := Str;
        ME.Itens.AjustaOperacao(B);
        CM.SalvaMovEst(ME);
      end;
    end else
    if ME.Sessao=0 then begin
      {$ifdef LOJA}
      if TFrmME2.Create(nil).Editar(False, ME, (not ME.Cancelado) and (NumAberto=ME.Caixa)) then begin
      {$else}
      if TFrmME.Create(nil).Editar(False, ME, (not ME.Cancelado) and (NumAberto=ME.Caixa)) then begin
      {$endif}
        B.AsString := ME.Itens.AsString;
        ME.Itens.AsString := Str;
        ME.Itens.AjustaOperacao(B);
        CM.SalvaMovEst(ME);
      end;
    end else begin
      S := Dados.CM.Sessoes.PorID[ME.Sessao];
      if TFrmVendaProd.Create(nil).Editar(ME.Itens[0], False, True, (S<>nil) and (not ME.Cancelado) and (NumAberto=ME.Caixa)) then
      begin
        ME.Itens[0]._Operacao := osAlterar;
        ME.Total := ME.Itens[0].imTotal;
        ME.Pago := ME.Itens[0].imPago;
        ME.Obs := ME.Itens[0].imObs;
        ME.Desconto := ME.Itens[0].imDesconto;
        CM.SalvaMovEst(ME);
      end;
    end;
  finally
    B.Free;
  end;
end;

procedure TDados.EditarPagamento(aTran: Integer);
var 
  P: TncPagEspecies;
  M: TncMovEst;
  B: TncItensMovEst;
  V: TncDebCredValidator;
  D: Currency;
  aDescPerc: Double;
  aDescPorPerc: Boolean;
  aPodeSalvar : Boolean;
begin
  if tbTran.FindKey([aTran]) then begin
    P := TncPagEspecies.Create;
    M := TncMovEst.Create;
    V := TncDebCredValidator.Create;
    try
      DM.LoadPagEsp(aTran, P);
      tbCli.IndexName := 'IID';
      
      if (tbTranCliente.Value>0) and tbCli.FindKey([tbTranCliente.Value]) then
      begin 
        V.SetOldCli(tbTranCliente.Value, tbCliDebito.Value, tbCliValorCred.Value, tbTranCreditoUsado.Value, tbTranCredito.Value);
        V.SetNewCli(tbTranCliente.Value, tbCliDebito.Value, tbCliValorCred.Value, tbCliLimiteDebito.AsVariant);
      end;
      D := tbTranDesconto.Value;  
      aDescPerc := tbTranDescPerc.Value;
      aDescPorPerc := tbTranDescPorPerc.Value;
      P.Obs := tbTranObs.Value;
      M.PagEsp.Assign(P);
      aPodeSalvar := (tbTranCaixa.Value=NumAberto) or tbTranPagPend.Value or (tbTranCaixaPag.Value=NumAberto);
      if aPodeSalvar then
        if tbTranPagPend.Value then
          aPodeSalvar := Permitido(daVendaPagamento) else
          aPodeSalvar := Permitido(daAlterarPagamento);
      aPodeSalvar := aPodeSalvar and (not tbTranCancelado.Value);    
      if TFrmPagEspecie.Create(Self).Editar(tbTranPagPend.Value, P, V, tbTranTotal.Value, D, aDescPerc, aDescPorPerc, aPodeSalvar) then
      if ((not M.PagEsp.Igual(P)) or (D<>tbTranDesconto.Value)) then 
      begin
        B := TncItensMovEst.Create(M);
        try
          M.LeDataset(tbTran);
          DM.LoadIMEs(M);
          B.AsString := M.Itens.AsString;
          M.Pago := P.Pago;
          M.Cliente := V.NewCli;
          M.Obs := P.Obs;
          M.Desconto := D;
          m.DescPerc := aDescPerc;
          M.DescPorPerc := aDescPorPerc;
          M.PagFunc := Dados.CM.UA.Username;
          M.PagPend := False;
          M.PagEsp.Assign(P);
          M.SalvaDescPago;
          M.Itens.AjustaOperacao(B, False);
          CM.SalvaMovEst(M);
        finally
          B.Free;
        end;
      end;
    finally
      P.Free;
      M.Free;
      V.Free;
    end;
  end;
end;

procedure TDados.EditarSessao(S: TncSessao);
var 
  SA, 
  SB,
  SN: TncSessao;
begin
  if (S=nil) then Exit;
  SA := TncSessao.Create(True);
  SB := TncSessao.Create(True);
  SN := TncSessao.Create(True);
  try
    SA.Assign(S);
    SN.Assign(S);
    SB.Assign(S);
    if TFrmSessao.Create(nil).Editar(SN) then begin
      SA.Assign(SN);
      SA.Vendas.AsString := SB.Vendas.AsString;
      SA.Tempos.AsString := SB.Tempos.AsString;
      SA.Impressoes.AsString := SB.Impressoes.AsString;
      SA.Vendas.AjustaOperacao(SN.Vendas);
      SA.Tempos.AjustaOperacao(SN.Tempos);
      SA.Impressoes.AjustaOperacao(SN.Impressoes);
      Dados.CM.AlteraSessao(SA);
    end;
  finally
    SA.Free;
    SN.Free;
    SB.Free;
  end;
end;

procedure TDados.EditarTran(aTran: Integer; aPodeAlterarCli: Boolean = False);
var
  ME: TncMovEst;
  CT, CTb : TncCredTempo;
  DT : TDadosTempo;
  Deb : TncDebito;
  Imp, Ant : TncImpressao;
  LE : TncLancExtra;
  T : TncDebTempo;
  Tempo : Double;
  Obs: String; 
  CredValor: Boolean;
begin
  if not tbTran.FindKey([aTran]) then Exit;
  
  case tbTranTipo.Value of
    trDebTempo : begin
      T := TncDebTempo.Create;
      try
        T.LeDataset(tbTran);
        Tempo := T.QtdTempo;
        Obs := T.Obs;
        CredValor := T.CredValor;
        if TFrmDebTempo.Create(nil).Editar((tbTranCaixa.Value=NumAberto) and (not tbTranCancelado.Value), False, 
                                           tbTranNomeCliente.Value, Tempo, Obs, CredValor) then 
        begin
          T.QtdTempo := Tempo;
          T.Obs := Obs;
          T.CredValor := CredValor;
          Dados.CM.SalvaDebTempo(T);
        end;
      finally
        T.Free;
      end;
    end;
    
    trImpressao : with Dados do 
    if tbImp.Locate('Tran', tbTranID.Value, []) then begin // do not localize
      Imp := TncImpressao.Create;
      Ant := TncImpressao.Create;
      try
        Imp.LoadFromDataset(tbImp);
        DM.LoadPagEsp(Imp.impTran, Imp.impPagEsp);
        Ant.AssignFrom(Imp);
        if TFrmImp.Create(nil).Editar(False, (Imp.impCaixa=NumAberto), Imp) and (not Imp.Igual(Ant)) then
        begin
          Imp._Operacao := osAlterar;
          Dados.CM.SalvaImpressao(Imp);
        end;
      finally
        Imp.Free;
        Ant.Free;
      end;
    end;

    trCaixaEnt..trCaixaSai : 
    begin
      LE := TncLancExtra.Create;
      try
        LE.LeDataset(tbTran);
        if TFrmLancExtra.Create(nil).Editar(False, (LE.Caixa=NumAberto), LE) then
          Dados.CM.SalvaLancExtra(LE);
      finally
        LE.Free;
      end;
    end;
    
    trEstVenda..trEstSaida, trEstVendaWeb :
    begin
      ME := TncMovEst.Create;
      try
        ME.LeDataset(tbTran);
        DM.LoadIMEs(ME);
        DM.LoadPagEsp(ME.ID, ME.PagEsp);
        Dados.EditarMovEst(ME, aPodeAlterarCli);
      finally
        ME.Free;
      end;
    end;

    trInicioSessao,
    trFimSessao : Dados.LoadEditSessao(tbTranSessao.Value);

    trCredTempo : 
    if not Dados.tbTempo.Locate('Tran', tbTranID.Value, []) then // do not localize
      raise ENexCafe.Create(SRegistroNãoEncontrado) else
    begin  
      CT := TncCredTempo.Create;
      CTb := TncCredTempo.Create;
      try
        CT.LoadFromDataset(Dados.tbTempo);
        CTb.AssignFrom(CT);
        DT.LoadFromCredTempo(CT);
        if TFrmTempo.Create(nil).Editar(False, (NumAberto=CT.teCaixa), CT.tePagEsp, @DT, tbTranID.Value) then
        begin
          DT.SaveToCredTempo(CT);
          if not CT.Igual(CTb) then begin
            CT._Operacao := osAlterar;
            Dados.CM.SalvaCredTempo(CT);
          end;
        end;
      finally
        CT.Free;
        CTb.Free;
      end;
    end;

    trPagDebito : begin
      Deb := TncDebito.Create;
      try
        Deb.LeDataset(tbTran);
        DM.LoadIDebPagos(Deb);
        DM.LoadPagEsp(tbTranID.Value, Deb.PagEsp);
        TFrmDebito.Create(nil).Editar(False, Deb, tbTranNomeCliente.Value);
      finally
        Deb.Free;
      end;
    end;
  end;
end;

procedure TDados.erTarifaPropertiesInitPopup(Sender: TObject);
var I: Integer;
begin
  with TcxColorComboBox(Sender) do 
  with Properties do begin
    CustomColors.Clear;
    for I := 0 to gTarifas.Count - 1 do
      with CustomColors.Add do begin
        Color := gTarifas[I].Cor;
        Description := gTarifas[I].Descricao;
      end;
  end;
end;

procedure TDados.AjustaCampoLocalizaCli;
begin
  case tbConfigCampoLocalizaCli.Value of
    1 : begin
      TVLUsername.Index := 0;
      TVLNome.Index := 1;
      TVL.OptionsBehavior.IncSearchItem := TVLUsername;
      tbCli.IndexName := 'IUsername'; // do not localize
    end;
    2 : begin
      TVLCodigo.Index := 0;
      TVLNome.Index := 1;
      TVL.OptionsBehavior.IncSearchItem := TVLCodigo;
      tbCli.IndexName := 'IID'; // do not localize
    end;
  else
    TVL.OptionsBehavior.IncSearchItem := TVLNome;
    TVLUsername.Index := 1;
    TVLNome.Index := 0;
    tbCli.IndexName := 'INome'; // do not localize
  end;
end;

procedure TDados.tbTipoPassCalcFields(DataSet: TDataSet);
begin
  tbTipoPassMinutos.Value := tbTipoPassMaxSegundos.Value div 60;
end;

procedure TDados.FecharDB;
begin
  DB.Connected := False;
  Session.Active := False;
  nxTCPIP.Active := False;
  mtUsuario.EmptyTable;
  mtMaquina.EmptyTable;
  if Assigned(dmComp) then
    FreeAndNil(dmComp);
end;

procedure TDados.ClearSessaoMaq(S: TncSessao);
var M : TncMaquina;
begin
  if (S=nil) or (mtPrevSessaoObj.Value=Integer(S)) or mtPrev.Locate('SessaoObj', Integer(S), []) then  // do not localize
  begin
    mtPrev.Edit;
    mtPrevSessaoObj.Clear; 
    mtPrevInicio.Clear;
    mtPrevFim.Clear;
    M := CM.Maquinas.PorNumero[mtPrevMaq.Value];
    if (M<>nil) and M.EmManutencao then begin
      mtPrevFimPrev.Value := SEmManutenção;
      mtPrevStatus.Value := stprev_manut;
    end else begin
      mtPrevFimPrev.Value := SLivre;
      mtPrevStatus.Value := stprev_livre;
    end;
    mtPrev.Post;
  end;
end;

procedure TDados.CMAoAbrirFecharCx(Sender: TObject);
var FI : PfmFormInfo;
begin
  RefreshCaixaAberto;
  FI := FrmPri.FM.FormByClass(TfbCaixa);
  if FI^.fiInstance<>nil then
    TfbCaixa(FI^.fiInstance).AbriuFechouCx;
end;

procedure TDados.CMAoAtualizarConfig(Sender: TObject);
var I : Integer;
begin
  tbConfig.Refresh;
  FrmPanTopo.Verifica;
  for I := 0 to CM.Sessoes.Count-1 do 
    CM.Sessoes[I].Tarifador.Reset;
  BroadcastAtualizaDireitosConfig;  
  FrmPri.AjustaVersao; 
{$IFDEF LOJA}
  FrmPri.AtualizaConfig;
{$ENDIF}  
end;

procedure TDados.CMAoAtualizarJob(Sender: TObject);
var 
  J : TncJob;
  aPrinterIndex, aJobID: Integer;
  S, Chave: String;
begin
  if mtPausadas.IsEmpty then
    S := '' else
    S := mtPausadasID.Value;
        
  if mtImp.IsEmpty then begin
    aPrinterIndex := -1;
    aJobID := -1;
  end else begin
    aPrinterIndex := mtImpPrinterIndex.Value;
    aJobID := mtImpJobID.Value;
  end;
  
  mtImp.DisableControls;
  mtPausadas.DisableControls;
  try
    J := TncJob(Sender);
    Chave := IntToStr(J.PrinterIndex) + '-' + IntToStr(J.JobID);


    if mtPausadas.FindKey([Chave]) then begin
      if J.AguardaConf then 
        mtPausadas.Edit else
        mtPausadas.Delete;
    end else
    if J.AguardaConf then mtPausadas.Insert;

    if J.AguardaConf then begin
      mtPausadasID.Value := Chave;
      mtPausadasDoc.Value := J.Document;
      mtPausadasMaq.Value := J.Maquina;
      mtPausadasComputador.Value := J.Computer;
      mtPausadasPag.Value := J.PaginasReg;
      mtPausadasImpTipo.Value := J.PrinterName;
      mtPausadasPDF.Value := False;
      mtPausadasPrinterIndex.Value := J.PrinterIndex;
      mtPausadasJobId.Value := J.JobID;
      mtPausadas.Post;
    end;
      
    if mtImp.FindKey([J.PrinterIndex, J.JobID]) then begin
      if not J.AguardaConf then begin 
        mtImp.Delete;
        Exit;
      end;
      mtImp.Edit;
    end else begin
      if not J.AguardaConf then Exit;
      mtImp.Insert;
    end;
    J.SalvaDataset(mtImp);
    mtImp.Post;
    FrmPri.RefreshBotoesMaq;
  finally
    if aJobID>=0 then
      mtImp.FindKey([aPrinterIndex, aJobID]);
      
    if S>='' then
      mtPausadas.FindKey([S]); 

    mtImp.EnableControls;
    mtPausadas.EnableControls;
  end;
end;

procedure LoadConfig;
begin
  with slConfig do begin
    if FileExists(ConfigName) then
      LoadFromFile(ConfigName) 
    else begin
      Values['Servidor'] := '127.0.0.1'; // do not localize
      Values['Usuario'] := 'admin'; // do not localize
      SaveConfig;
    end;

    DebugAtivo := SameText(Values['Debug'], 'S'); // do not localize
  end;
end;

procedure SaveConfig;
begin
  slConfig.SaveToFile(ConfigName);
end;

initialization
  slConfig := TStringList.Create;
  LoadConfig;
  
  AR_Users := TStringList.Create;
  AR_Desktops := TList.Create;

  if SysUtils.NegCurrFormat=0 then
    SysUtils.NegCurrFormat := 1;

finalization
  slConfig.Free;
  AR_Users.Free;
  AR_Desktops.Free;


end.


{1F9C7BE5-772A-4E9E-90C9-3F6FB30D50C0}

