{$I NEX.INC}

unit ncDMServ;

interface


uses
  ulogs,
  Graphics,
  SysUtils,     
  DateUtils,
  Windows,
  Classes, 
  ExtCtrls,
  DB, 
  Dialogs,
  Variants,
  nxDB, 
  nxllComponent, 
  ncClassesBase, 
  ncTarifador, 
  ncTran,
  ncCredTempo, 
  ncDebito,
  ncPassaportes,
  ncSessao, 
  ncErros,
  ncMovEst,
  ncImpressao,
  ncLancExtra,
  ncDebTempo,
  ncFrmProgress,
  ncAppUrlLog,
  ncAuxPassaporte, nxsdServerEngine, nxreRemoteServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport,
  ncJob,
  ncMsgCom,
  ncPrintMon,
  ncTipoImp,
  ncEspecie,
  ncPrintDoc,
  ncMsgCli, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type

  TDM = class;

  TFidCliente = record
    fdID : Integer;
    fdOld : Double;
    fdNew : Double;
  end;

  PFidCliente = ^TFidCliente;
  
  TFidControl = class
  private
    FList : TList;
    FPremiar : TList;
    FDM : TDM;
    FTimer : TTimer;

    function Get(aID: Integer; aCreate: Boolean; aOld: Double): PFidCliente;
    procedure OnTimer(Sender: TObject);
    
  public
    constructor Create(aDM: TDM);
    destructor Destroy;
    procedure Clear;

    procedure SaveChange(aID: Integer; vOld : Variant; aNew: Double);

    function CanCommit(DisableAutoPremiar: Boolean=False): Boolean;
  end;

  TDM = class(TDataModule)
    nxSession: TnxSession;
    nxDB: TnxDatabase;
    tTran: TnxTable;
    tITran: TnxTable;
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
    tITranID: TAutoIncField;
    tITranTran: TIntegerField;
    tITranCaixa: TIntegerField;
    tITranDataHora: TDateTimeField;
    tITranTipoTran: TWordField;
    tITranTipoItem: TWordField;
    tITranSubTipo: TWordField;
    tITranItemID: TIntegerField;
    tITranSubItemID: TIntegerField;
    tITranItemPos: TWordField;
    tITranTotal: TCurrencyField;
    tITranDesconto: TCurrencyField;
    tITranPago: TCurrencyField;
    tUsuario: TnxTable;
    tTarifa: TnxTable;
    tConfig: TnxTable;
    tImp: TnxTable;
    tMaq: TnxTable;
    tCli: TnxTable;
    tHTar: TnxTable;
    tTipoAcesso: TnxTable;
    tETar: TnxTable;
    tLog: TnxTable;
    tMovEst: TnxTable;
    tCaixa: TnxTable;
    tProduto: TnxTable;
    tHPass: TnxTable;
    tTempo: TnxTable;
    tSessao: TnxTable;
    tChat: TnxTable;
    tAvisos: TnxTable;
    tHCred: TnxTable;
    tPassaporte: TnxTable;
    tPacote: TnxTable;
    tTipoPass: TnxTable;
    tTipoImp: TnxTable;
    tProdutoID: TAutoIncField;
    tProdutoCodigo: TStringField;
    tProdutoDescricao: TStringField;
    tProdutoUnid: TStringField;
    tProdutoPreco: TCurrencyField;
    tProdutoObs: TMemoField;
    tProdutoImagem: TGraphicField;
    tProdutoCategoria: TStringField;
    tProdutoSubCateg: TStringField;
    tProdutoEstoqueAtual: TFloatField;
    tProdutoCustoUnitario: TCurrencyField;
    tProdutoEstoqueACE: TFloatField;
    tProdutoEstoqueACS: TFloatField;
    tProdutoPodeAlterarPreco: TBooleanField;
    tProdutoNaoControlaEstoque: TBooleanField;
    tMovEstID: TAutoIncField;
    tMovEstTran: TIntegerField;
    tMovEstProduto: TIntegerField;
    tMovEstQuant: TFloatField;
    tMovEstUnitario: TCurrencyField;
    tMovEstTotal: TCurrencyField;
    tMovEstCustoU: TCurrencyField;
    tMovEstItem: TWordField;
    tMovEstDesconto: TCurrencyField;
    tMovEstPago: TCurrencyField;
    tMovEstDataHora: TDateTimeField;
    tMovEstEntrada: TBooleanField;
    tMovEstCancelado: TBooleanField;
    tMovEstEstoqueAnt: TFloatField;
    tMovEstTipoTran: TWordField;
    tMovEstCliente: TIntegerField;
    tMovEstCaixa: TIntegerField;
    tMovEstCategoria: TStringField;
    tMovEstNaoControlaEstoque: TBooleanField;
    tUsuarioUsername: TStringField;
    tUsuarioNome: TStringField;
    tUsuarioAdmin: TBooleanField;
    tUsuarioSenha: TStringField;
    tUsuarioGrupos: TMemoField;
    tUsuarioDireitos: TMemoField;
    tUsuarioMaxTempoManut: TIntegerField;
    tUsuarioMaxMaqManut: TIntegerField;
    tMaqNumero: TWordField;
    tMaqNome: TStringField;
    tMaqMenu: TMemoField;
    tMaqRecursos: TMemoField;
    tMaqComputerName: TStringField;
    tHTarTipoAcesso: TWordField;
    tHTarDia: TWordField;
    tHTarHora: TWordField;
    tHTarCor: TIntegerField;
    tHPassID: TAutoIncField;
    tHPassPassaporte: TIntegerField;
    tHPassSessao: TIntegerField;
    tHPassDataHora: TDateTimeField;
    tTempoID: TAutoIncField;
    tTempoDataHora: TDateTimeField;
    tTempoFunc: TStringField;
    tTempoTipo: TWordField;
    tTempoMinutos: TFloatField;
    tTempoIDPacPass: TIntegerField;
    tTempoPassaporte: TIntegerField;
    tTempoDesconto: TCurrencyField;
    tTempoCliente: TIntegerField;
    tTempoMaq: TWordField;
    tTempoSessao: TIntegerField;
    tTempoCancelado: TBooleanField;
    tETarTipoAcesso: TWordField;
    tETarCor: TIntegerField;
    tETarPos: TWordField;
    tETarValor: TCurrencyField;
    tETarTempo: TDateTimeField;
    tETarValorMin: TCurrencyField;
    tETarTolerancia: TDateTimeField;
    tLogID: TAutoIncField;
    tLogDiaHora: TDateTimeField;
    tLogMaquina: TWordField;
    tLogUsuario: TStringField;
    tLogPrograma: TWordField;
    tLogOperacao: TStringField;
    tLogHoras: TDateTimeField;
    tLogDias: TWordField;
    tPassaporteID: TAutoIncField;
    tPassaporteTipoPass: TIntegerField;
    tPassaporteCliente: TIntegerField;
    tPassaporteExpirou: TBooleanField;
    tPassaporteSenha: TStringField;
    tPassaportePrimeiroUso: TDateTimeField;
    tPassaporteTipoAcesso: TIntegerField;
    tPassaporteTipoExp: TWordField;
    tPassaporteExpirarEm: TDateTimeField;
    tPassaporteMaxSegundos: TIntegerField;
    tPassaporteSegundos: TIntegerField;
    tPassaporteAcessos: TIntegerField;
    tPassaporteDia1: TIntegerField;
    tPassaporteDia2: TIntegerField;
    tPassaporteDia3: TIntegerField;
    tPassaporteDia4: TIntegerField;
    tPassaporteDia5: TIntegerField;
    tPassaporteDia6: TIntegerField;
    tPassaporteDia7: TIntegerField;
    tPassaporteTran: TIntegerField;
    tPassaporteDataCompra: TDateTimeField;
    tPassaporteValido: TBooleanField;
    tPassaporteValor: TCurrencyField;
    tPassaporteSessao: TIntegerField;
    tChatID: TAutoIncField;
    tChatDataHora: TDateTimeField;
    tChatTexto: TMemoField;
    tImpID: TAutoIncField;
    tImpCaixa: TIntegerField;
    tImpManual: TBooleanField;
    tImpDataHora: TDateTimeField;
    tImpComputador: TStringField;
    tImpMaquina: TWordField;
    tImpPaginas: TWordField;
    tImpImpressora: TStringField;
    tImpDocumento: TMemoField;
    tImpSessao: TIntegerField;
    tImpResultado: TWordField;
    tImpq1: TWordField;
    tImpq2: TWordField;
    tImpq3: TWordField;
    tImpq4: TWordField;
    tImpq5: TWordField;
    tImpq6: TWordField;
    tImpq7: TWordField;
    tImpq8: TWordField;
    tImpq9: TWordField;
    tImpq10: TWordField;
    tImpv1: TCurrencyField;
    tImpv2: TCurrencyField;
    tImpv3: TCurrencyField;
    tImpv4: TCurrencyField;
    tImpv5: TCurrencyField;
    tImpv6: TCurrencyField;
    tImpv7: TCurrencyField;
    tImpv8: TCurrencyField;
    tImpv9: TCurrencyField;
    tImpv10: TCurrencyField;
    tImpDesconto: TCurrencyField;
    tHCredID: TAutoIncField;
    tHCredDataHora: TDateTimeField;
    tHCredTipo: TWordField;
    tHCredCliente: TIntegerField;
    tHCredSessao: TIntegerField;
    tHCredTran: TIntegerField;
    tHCredSaldoAnt: TFloatField;
    tHCredQuant: TFloatField;
    tCaixaID: TAutoIncField;
    tCaixaAberto: TBooleanField;
    tCaixaUsuario: TStringField;
    tCaixaAbertura: TDateTimeField;
    tCaixaDescontos: TCurrencyField;
    tCaixaObs: TMemoField;
    tPacoteID: TAutoIncField;
    tPacoteMinutos: TIntegerField;
    tPacoteValor: TCurrencyField;
    tPacoteDescr: TStringField;
    tAvisosMinutos: TWordField;
    tAvisosAvisoTexto: TStringField;
    tAvisosSegAvisoTexto: TWordField;
    tAvisosPiscarAvisoTexto: TBooleanField;
    tAvisosSom: TBlobField;
    tTipoAcessoID: TWordField;
    tTipoAcessoNome: TStringField;
    tSessaoID: TAutoIncField;
    tSessaoInicio: TDateTimeField;
    tSessaoTermino: TDateTimeField;
    tSessaoMinutosR: TFloatField;
    tSessaoMinutosC: TFloatField;
    tSessaoMaq: TWordField;
    tSessaoCliente: TIntegerField;
    tSessaoTransfMaq: TBooleanField;
    tSessaoTipoCli: TWordField;
    tSessaoCancelado: TBooleanField;
    tSessaoTotal: TCurrencyField;
    tSessaoDesconto: TCurrencyField;
    tSessaoPago: TCurrencyField;
    tSessaoNomeCliente: TStringField;
    tSessaoFuncI: TStringField;
    tSessaoFuncF: TStringField;
    tSessaoObs: TMemoField;
    tSessaoTipoAcesso: TIntegerField;
    tSessaoCaixaI: TIntegerField;
    tSessaoCaixaF: TIntegerField;
    tSessaoTicksI: TIntegerField;
    tSessaoPausado: TBooleanField;
    tSessaoInicioPausa: TIntegerField;
    tSessaoMinTicksUsados: TIntegerField;
    tSessaoMinTicksTotal: TIntegerField;
    tSessaoFimTicksUsados: TIntegerField;
    tSessaoStrPausas: TMemoField;
    tSessaoMinutosCli: TFloatField;
    tSessaoMinutosPrev: TFloatField;
    tSessaoMinutosMax: TFloatField;
    tTipoImpID: TWordField;
    tTipoImpNome: TStringField;
    tTipoImpImpressora: TStringField;
    tTipoImpValor: TCurrencyField;
    tCliID: TAutoIncField;
    tCliNome: TStringField;
    tCliEndereco: TStringField;
    tCliBairro: TStringField;
    tCliCidade: TStringField;
    tCliUF: TStringField;
    tCliCEP: TStringField;
    tCliSexo: TStringField;
    tCliObs: TMemoField;
    tCliCpf: TStringField;
    tCliRg: TStringField;
    tCliTelefone: TStringField;
    tCliEmail: TMemoField;
    tCliMinutos: TFloatField;
    tCliMinutosUsados: TFloatField;
    tCliMinutosIniciais: TFloatField;
    tCliIsento: TBooleanField;
    tCliUsername: TStringField;
    tCliPai: TStringField;
    tCliMae: TStringField;
    tCliSenha: TStringField;
    tCliUltVisita: TDateTimeField;
    tCliDebito: TCurrencyField;
    tCliEscola: TStringField;
    tCliEscolaHI: TDateTimeField;
    tCliEscolaHF: TDateTimeField;
    tCliNickName: TStringField;
    tCliDataNasc: TDateTimeField;
    tCliCelular: TStringField;
    tCliTemDebito: TBooleanField;
    tCliLimiteDebito: TCurrencyField;
    tCliFoto: TGraphicField;
    tCliIncluidoEm: TDateTimeField;
    tCliAlteradoEm: TDateTimeField;
    tCliIncluidoPor: TStringField;
    tCliAlteradoPor: TStringField;
    tCliInativo: TBooleanField;
    tCliTipoAcessoPref: TIntegerField;
    tTipoPassID: TAutoIncField;
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
    tAuxITran: TnxTable;
    tAuxITranID: TAutoIncField;
    tAuxITranTran: TIntegerField;
    tAuxITranCaixa: TIntegerField;
    tAuxITranDataHora: TDateTimeField;
    tAuxITranTipoTran: TWordField;
    tAuxITranTipoItem: TWordField;
    tAuxITranSubTipo: TWordField;
    tAuxITranItemID: TIntegerField;
    tAuxITranSubItemID: TIntegerField;
    tAuxITranItemPos: TWordField;
    tAuxITranTotal: TCurrencyField;
    tAuxITranDesconto: TCurrencyField;
    tAuxITranPago: TCurrencyField;
    tAuxME: TnxTable;
    tMovEstFator: TIntegerField;
    tMovEstSaldoPost: TFloatField;
    tAuxMEID: TAutoIncField;
    tAuxMETran: TIntegerField;
    tAuxMEProduto: TIntegerField;
    tAuxMEQuant: TFloatField;
    tAuxMEUnitario: TCurrencyField;
    tAuxMETotal: TCurrencyField;
    tAuxMECustoU: TCurrencyField;
    tAuxMEItem: TWordField;
    tAuxMEDesconto: TCurrencyField;
    tAuxMEPago: TCurrencyField;
    tAuxMEDataHora: TDateTimeField;
    tAuxMEEntrada: TBooleanField;
    tAuxMECancelado: TBooleanField;
    tAuxMEEstoqueAnt: TFloatField;
    tAuxMETipoTran: TWordField;
    tAuxMECliente: TIntegerField;
    tAuxMECaixa: TIntegerField;
    tAuxMECategoria: TStringField;
    tAuxMENaoControlaEstoque: TBooleanField;
    tAuxMEFator: TIntegerField;
    tAuxMESaldoPost: TFloatField;
    tDebito: TnxTable;
    tDebitoData: TDateTimeField;
    tDebitoCliente: TIntegerField;
    tDebitoValor: TCurrencyField;
    tDebitoTipo: TWordField;
    tMovEstITran: TIntegerField;
    tAuxMEITran: TIntegerField;
    tAuxITranCancelado: TBooleanField;
    tITranCancelado: TBooleanField;
    tAuxITranSessao: TIntegerField;
    tITranSessao: TIntegerField;
    tTempoTotal: TCurrencyField;
    tTempoPago: TCurrencyField;
    tTempoCaixa: TIntegerField;
    tMovEstSessao: TIntegerField;
    tImpTotal: TCurrencyField;
    tImpTran: TIntegerField;
    tImpPago: TCurrencyField;
    tSessaoEncerrou: TBooleanField;
    tImpFunc: TStringField;
    tImpCliente: TIntegerField;
    tTempoTran: TIntegerField;
    tITranDebito: TCurrencyField;
    tImpCancelado: TBooleanField;
    tTranDebito: TCurrencyField;
    tCliValorCred: TCurrencyField;
    tSessaoMinutosCliU: TFloatField;
    tSessaoValorCli: TCurrencyField;
    tSessaoValorCliU: TFloatField;
    tSessaoTranI: TIntegerField;
    tSessaoTranF: TIntegerField;
    tHPassMinutosAnt: TFloatField;
    tHPassMinutosUsados: TFloatField;
    tAuxITranDebito: TCurrencyField;
    nxRSE: TnxRemoteServerEngine;
    nxTCPIP: TnxWinsockTransport;
    tSessaoPagoPost: TCurrencyField;
    tMovEstPagoPost: TCurrencyField;
    tTempoPagoPost: TCurrencyField;
    tSessaoDescPost: TCurrencyField;
    tMovEstDescPost: TCurrencyField;
    tTempoDescPost: TCurrencyField;
    tImpPagoPost: TCurrencyField;
    tImpDescPost: TCurrencyField;
    tSessaoMaqI: TWordField;
    tSessaoStrTransfMaq: TMemoField;
    tSessaoStrFechamentoCaixa: TMemoField;
    tOcupacao: TnxTable;
    tOcupacaoID: TAutoIncField;
    tOcupacaoSessao: TIntegerField;
    tOcupacaoMaq: TIntegerField;
    tOcupacaoData: TDateField;
    tOcupacaoHora: TWordField;
    tOcupacaoCliente: TIntegerField;
    tOcupacaoTipoCli: TWordField;
    tOcupacaoMinutosU: TFloatField;
    tOcupacaoMinutosP: TFloatField;
    tOcupacaoCaixa: TIntegerField;
    tSessaoFimTicksTotal: TIntegerField;
    tCaixaTotalFinal: TCurrencyField;
    tCaixaCancelamentos: TCurrencyField;
    tOcupacaoFunc: TStringField;
    tCaixaSaldoAnt: TCurrencyField;
    tRec: TnxTable;
    tRecID: TAutoIncField;
    tRecCliente: TIntegerField;
    tRecTran: TIntegerField;
    tEsp: TnxTable;
    tEspID: TAutoIncField;
    tEspPos: TIntegerField;
    tEspCliente: TIntegerField;
    tEspNomeCliente: TStringField;
    tEspDataHora: TDateTimeField;
    tEspPrevisao: TDateTimeField;
    tEspPrevMaq: TWordField;
    tEspPrevSessao: TIntegerField;
    tEspObs: TStringField;
    tEspCartao: TStringField;
    tProc: TnxTable;
    tProcClienteID: TIntegerField;
    tProcRequest: TIntegerField;
    tProcProcessID: TIntegerField;
    tProcExeName: TStringField;
    tFW: TnxTable;
    tFWID: TAutoIncField;
    tFWURL: TStringField;
    tSessaoPermitirDownload: TBooleanField;
    tTempoNome: TStringField;
    tTempoSenha: TStringField;
    tConfigNumSeq: TAutoIncField;
    tConfigFecharProgramas: TBooleanField;
    tConfigAutoExecutar: TStringField;
    tConfigLimiteTempoPadrao: TDateTimeField;
    tConfigPacoteTempoReal: TBooleanField;
    tConfigPermiteLoginSemCred: TBooleanField;
    tConfigEncerramentoPrePago: TWordField;
    tConfigPermiteCapturaTela: TBooleanField;
    tConfigVariosTiposAcesso: TBooleanField;
    tConfigModoPagtoAcesso: TWordField;
    tConfigMostraPrePagoDec: TBooleanField;
    tConfigTempoMaxAlerta: TDateTimeField;
    tConfigAbre1: TDateTimeField;
    tConfigAbre2: TDateTimeField;
    tConfigAbre3: TDateTimeField;
    tConfigAbre4: TDateTimeField;
    tConfigAbre5: TDateTimeField;
    tConfigAbre6: TDateTimeField;
    tConfigAbre7: TDateTimeField;
    tConfigFecha1: TDateTimeField;
    tConfigFecha2: TDateTimeField;
    tConfigFecha3: TDateTimeField;
    tConfigFecha4: TDateTimeField;
    tConfigFecha5: TDateTimeField;
    tConfigFecha6: TDateTimeField;
    tConfigFecha7: TDateTimeField;
    tConfigCorLivre: TIntegerField;
    tConfigCorFLivre: TIntegerField;
    tConfigCorUsoPrePago: TIntegerField;
    tConfigCorFUsoPrePago: TIntegerField;
    tConfigCorUsoPosPago: TIntegerField;
    tConfigCorFUsoPosPago: TIntegerField;
    tConfigCorAguardaPagto: TIntegerField;
    tConfigCorFAguardaPagto: TIntegerField;
    tConfigCorManutencao: TIntegerField;
    tConfigCorFManutencao: TIntegerField;
    tConfigCorPausado: TIntegerField;
    tConfigCorFPausado: TIntegerField;
    tConfigCorDesktop: TIntegerField;
    tConfigCorFDesktop: TIntegerField;
    tConfigCampoLocalizaCli: TWordField;
    tConfigManterSaldoCaixa: TBooleanField;
    tConfigNaoMostrarMsgDebito: TBooleanField;
    tConfigTolerancia: TDateTimeField;
    tConfigRegImp98: TBooleanField;
    tConfigLimitePadraoDebito: TCurrencyField;
    tConfigRecPorta: TStringField;
    tConfigRecSalto: TWordField;
    tConfigRecLargura: TWordField;
    tConfigRecRodape: TMemoField;
    tConfigRecImprimir: TWordField;
    tConfigRecMatricial: TBooleanField;
    tConfigRecNomeLoja: TStringField;
    tConfigMostraProgAtual: TBooleanField;
    tConfigMostraObs: TBooleanField;
    tConfigEscondeTextoBotoes: TBooleanField;
    tConfigEscondeTipoAcesso: TBooleanField;
    tConfigExigirRG: TBooleanField;
    tConfigTipoFDesktop: TStringField;
    tConfigTipoFLogin: TStringField;
    tConfigNumFDesktop: TIntegerField;
    tConfigNumFLogin: TIntegerField;
    tConfigMostrarApenasPIN: TBooleanField;
    tConfigTextoPIN: TStringField;
    tConfigAlterarSenhaCli: TBooleanField;
    tConfigVerSenhaCli: TBooleanField;
    tConfigCliCadPadrao: TBooleanField;
    tConfigControlaImp: TWordField;
    tConfigFiltrarWEB: TBooleanField;
    tConfigSiteRedirFiltro: TStringField;
    tConfigBloqDownload: TBooleanField;
    tConfigBloqMenuIniciar: TBooleanField;
    tConfigBloqPainelCtrl: TBooleanField;
    tConfigBloqCtrlAltDel: TBooleanField;
    tConfigBloqExecutar: TBooleanField;
    tConfigBloqMeusLocaisRede: TBooleanField;
    tConfigPaginaInicial: TStringField;
    tConfigEsconderCronometro: TBooleanField;
    tConfigAposEncerrar: TWordField;
    tConfigAlinhaBarraGuard: TWordField;
    tConfigNoNet: TWordField;
    tConfigTempoSumirLogin: TWordField;
    tConfigEmailMetodo: TWordField;
    tConfigEmailServ: TStringField;
    tConfigEmailUsername: TStringField;
    tConfigEmailSenha: TStringField;
    tConfigEmailDestino: TMemoField;
    tConfigEmailEnviarCaixa: TBooleanField;
    tConfigEsconderDrives: TStringField;
    tAvisosTipo: TWordField;
    tConfigBloqTray: TBooleanField;
    tConfigTempoB1: TWordField;
    tConfigTempoB2: TWordField;
    tConfigTempoB3: TWordField;
    tConfigTempoB4: TWordField;
    tConfigTempoB5: TWordField;
    tConfigTempoB6: TWordField;
    tConfigCredPadraoTipo: TWordField;
    tConfigCredPadraoCod: TIntegerField;
    tConfigPgVendas: TBooleanField;
    tConfigPgAcesso: TBooleanField;
    tConfigPgTempo: TBooleanField;
    tConfigPgImp: TBooleanField;
    tChatDe: TIntegerField;
    tChatPara: TIntegerField;
    tCaixaFechamento: TDateTimeField;
    tTempoTipoAcesso: TIntegerField;
    tTranQtdTempo: TFloatField;
    tConfigPgVendaAvulsa: TBooleanField;
    tConfigMostraNomeMaq: TBooleanField;
    tCaixaSangria: TCurrencyField;
    tCaixaSupr: TCurrencyField;
    tConfigBloqBotaoDir: TBooleanField;
    tConfigBloquearUsoEmHorarioNP: TBooleanField;
    tCliHP1: TIntegerField;
    tCliHP2: TIntegerField;
    tCliHP3: TIntegerField;
    tCliHP4: TIntegerField;
    tCliHP5: TIntegerField;
    tCliHP6: TIntegerField;
    tCliHP7: TIntegerField;
    tConfigMinutosDesligaMaq: TWordField;
    qAux: TnxQuery;
    tConfigOpcaoChat: TWordField;
    tConfigSalvarCodUsername: TBooleanField;
    tConfigCorMaqManut: TIntegerField;
    tConfigCorFMaqManut: TIntegerField;
    tMaqTipoAcesso: TIntegerField;
    tMaqEmManutencao: TBooleanField;
    tMaqObs: TMemoField;
    tMaqIP: TStringField;
    tMaqMacAddress: TStringField;
    tTempoObs: TStringField;
    tCliNaoGuardarCredito: TBooleanField;
    tConfigContinuarCredTempo: TBooleanField;
    tConfigNaoGuardarCreditoCli: TBooleanField;
    tConfigEncerramentoCartao: TWordField;
    tConfigTempoEPrePago: TWordField;
    tConfigTempoECartao: TWordField;
    tConfigCorPrevisao: TIntegerField;
    tConfigCorFPrevisao: TIntegerField;
    tConfigRelCaixaAuto: TBooleanField;
    tTipoImpContador: TIntegerField;
    tConfigAlteraLoginSemCred: TBooleanField;
    tCliPermiteLoginSemCred: TBooleanField;
    tConfigNaoCobrarImpFunc: TBooleanField;
    tPatro: TnxTable;
    tPatroNome: TStringField;
    tPatroURLArea1: TMemoField;
    tPatroURLArea2: TMemoField;
    tPatroDominiosPerm: TMemoField;
    tMaqPatrocinio: TStringField;
    tConfigSincronizarHorarios: TBooleanField;
    tConfigMostrarDebitoNoGuard: TBooleanField;
    tConfigBloquearLoginAlemMaxDeb: TBooleanField;
    tConfigClienteNaoAlteraSenha: TBooleanField;
    tConfigNaoObrigarSenhaCliente: TBooleanField;
    tConfigNaoVenderAlemEstoque: TBooleanField;
    tConfigCreditoComoValor: TBooleanField;
    tTempoCredValor: TBooleanField;
    tTranCredValor: TBooleanField;
    tConfigCliAvulsoNaoEncerra: TBooleanField;
    tConfigAutoSortGridCaixa: TBooleanField;
    tMaqAvisaFimTempo: TBooleanField;
    tConfigAvisoFimTempoAdminS: TWordField;
    tImpx75: TBooleanField;
    tConfigDetectarImpServ: TBooleanField;
    tPassaporteNome: TStringField;
    tConfigAvisoCreditos: TBooleanField;
    tConfigClientePodeVerCred: TBooleanField;
    tConfigChatAlertaSonoro: TBooleanField;
    tConfigChatMostraNotificacao: TBooleanField;
    tCliPassaportes: TFloatField;
    tSessaoCli: TnxTable;
    tSessaoCliID: TAutoIncField;
    tSessaoCliInicio: TDateTimeField;
    tSessaoCliTermino: TDateTimeField;
    tSessaoCliMinutosR: TFloatField;
    tSessaoCliMinutosC: TFloatField;
    tSessaoCliMaq: TWordField;
    tSessaoCliMaqI: TWordField;
    tSessaoCliEncerrou: TBooleanField;
    tSessaoCliCliente: TIntegerField;
    tSessaoCliTransfMaq: TBooleanField;
    tSessaoCliTipoCli: TWordField;
    tSessaoCliCancelado: TBooleanField;
    tSessaoCliTotal: TCurrencyField;
    tSessaoCliDesconto: TCurrencyField;
    tSessaoCliPagoPost: TCurrencyField;
    tSessaoCliDescPost: TCurrencyField;
    tSessaoCliPago: TCurrencyField;
    tSessaoCliNomeCliente: TStringField;
    tSessaoCliFuncI: TStringField;
    tSessaoCliFuncF: TStringField;
    tSessaoCliObs: TMemoField;
    tSessaoCliTipoAcesso: TIntegerField;
    tSessaoCliCaixaI: TIntegerField;
    tSessaoCliCaixaF: TIntegerField;
    tSessaoCliTicksI: TIntegerField;
    tSessaoCliPausado: TBooleanField;
    tSessaoCliInicioPausa: TIntegerField;
    tSessaoCliMinTicksUsados: TIntegerField;
    tSessaoCliMinTicksTotal: TIntegerField;
    tSessaoCliFimTicksUsados: TIntegerField;
    tSessaoCliFimTicksTotal: TIntegerField;
    tSessaoCliStrPausas: TMemoField;
    tSessaoCliStrTransfMaq: TMemoField;
    tSessaoCliStrFechamentoCaixa: TMemoField;
    tSessaoCliMinutosCli: TFloatField;
    tSessaoCliMinutosPrev: TFloatField;
    tSessaoCliMinutosMax: TFloatField;
    tSessaoCliMinutosCliU: TFloatField;
    tSessaoCliValorCli: TCurrencyField;
    tSessaoCliValorCliU: TFloatField;
    tSessaoCliTranI: TIntegerField;
    tSessaoCliTranF: TIntegerField;
    tSessaoCliPermitirDownload: TBooleanField;
    tSessaoCliCartaoTempo: TBooleanField;
    tSessaoCliHP1: TIntegerField;
    tSessaoCliHP2: TIntegerField;
    tSessaoCliHP3: TIntegerField;
    tSessaoCliHP4: TIntegerField;
    tSessaoCliHP5: TIntegerField;
    tSessaoCliHP6: TIntegerField;
    tSessaoCliHP7: TIntegerField;
    tConfigModoCredGuard: TWordField;
    tConfigMsgFimCred: TStringField;
    tConfigSemLogin: TBooleanField;
    tTranFidResgate: TBooleanField;
    tITranCliente: TIntegerField;
    tITranFidFator: TSmallintField;
    tITranFidPontos: TFloatField;
    tITranFidMov: TBooleanField;
    tConfigFidAtivo: TBooleanField;
    tConfigFidSessaoValor: TCurrencyField;
    tConfigFidSessaoPontos: TIntegerField;
    tConfigFidVendaValor: TCurrencyField;
    tConfigFidVendaPontos: TIntegerField;
    tConfigFidImpValor: TCurrencyField;
    tConfigFidImpPontos: TIntegerField;
    tConfigFidParcial: TBooleanField;
    tProdutoFidelidade: TBooleanField;
    tProdutoFidPontos: TIntegerField;
    tAuxITranCliente: TIntegerField;
    tAuxITranFidFator: TSmallintField;
    tAuxITranFidPontos: TFloatField;
    tAuxITranFidMov: TBooleanField;
    tPacoteFidelidade: TBooleanField;
    tPacoteFidPontos: TIntegerField;
    tTipoPassFidelidade: TBooleanField;
    tTipoPassFidPontos: TIntegerField;
    tCliTitEleitor: TStringField;
    tCliFidPontos: TFloatField;
    tCliFidTotal: TFloatField;
    tCliFidResg: TFloatField;
    tTempoFidResgate: TBooleanField;
    tMovEstFidResgate: TBooleanField;
    tMovEstFidPontos: TFloatField;
    tTempoFidPontos: TFloatField;
    tITranFidOpe: TWordField;
    tAuxITranFidOpe: TWordField;
    tConfigFidAutoPremiar: TBooleanField;
    tConfigFidTipoPremioAuto: TWordField;
    tConfigFidPremioAuto: TIntegerField;
    tConfigAutoObsAoCancelar: TBooleanField;
    tConfigFidMostrarSaldoGuard: TBooleanField;
    tConfigFidMostrarSaldoAdmin: TBooleanField;
    tConfigCliCadNaoEncerra: TBooleanField;
    tConfigImpedirPosPago: TBooleanField;
    tConfigAutoLigarMaqCli: TBooleanField;
    tLApp: TnxTable;
    tLUrl: TnxTable;
    tMaqProgramaAtual: TMemoField;
    tMaqSiteAtual: TMemoField;
    tLNom: TnxTable;
    tLAppID: TAutoIncField;
    tLAppSessao: TIntegerField;
    tLAppCliente: TIntegerField;
    tLAppInicio: TDateTimeField;
    tLAppFim: TDateTimeField;
    tLAppMinutos: TFloatField;
    tLAppExe: TStringField;
    tLAppCaminho: TStringField;
    tLAppTitulo: TStringField;
    tLAppURL: TIntegerField;
    tLAppMaq: TWordField;
    tLUrlID: TAutoIncField;
    tLUrlCliente: TIntegerField;
    tLUrlMaq: TWordField;
    tLUrlSessao: TIntegerField;
    tLUrlHost: TStringField;
    tLUrlDominio: TStringField;
    tLUrlPagina: TStringField;
    tLUrlSearchArg: TStringField;
    tLUrlSearchEng: TStringField;
    tLUrlViewTime: TFloatField;
    tLUrlFirstView: TDateTimeField;
    tLNomID: TStringField;
    tLNomType: TStringField;
    tLNomNome: TMemoField;
    tMaqDisplayH: TWordField;
    tMaqDisplayW: TWordField;
    tLAppCaixa: TIntegerField;
    tLUrlCaixa: TIntegerField;
    tCaixaReproc: TDateTimeField;
    tCaixaEstSessoesQtd: TIntegerField;
    tCaixaEstSessoesTempo: TFloatField;
    tCaixaEstUrls: TIntegerField;
    tCaixaEstSyncOk: TBooleanField;
    tCaixaEstBuscasEng: TMemoField;
    tCaixaEstRes: TMemoField;
    tConfigPastaDownload: TStringField;
    tConfigBiometria: TBooleanField;
    tSessaoDisableAD: TBooleanField;
    tConfigPMPausaAutomatica: TBooleanField;
    tConfigPMConfirmaImpCliente: TBooleanField;
    tConfigPMMostrarPaginasCli: TBooleanField;
    tConfigPMMostrarValorCli: TBooleanField;
    tConfigPMCalcValorCli: TWordField;
    tConfigPMPromptValorCli: TStringField;
    tConfigPMObsValorCli: TStringField;
    tSessaoJobID: TIntegerField;
    tSessaoJobPages: TWordField;
    tPM: TnxTable;
    tPMJobID: TIntegerField;
    tPMComputer: TStringField;
    tPMMaquina: TWordField;
    tPMPrinterName: TStringField;
    tPMPrinterShare: TStringField;
    tPMPrinterPort: TStringField;
    tPMPrinterServer: TStringField;
    tPMUser: TStringField;
    tPMDocument: TnxMemoField;
    tPMPages: TIntegerField;
    tPMTotalPages: TIntegerField;
    tPMCopies: TIntegerField;
    tPMClientPages: TIntegerField;
    tPMStatus: TWordField;
    tPMPrinterIndex: TIntegerField;
    tPMPausou: TBooleanField;
    tPMLiberacao: TWordField;
    tPMImpID: TIntegerField;
    tConfigPubHomePage: TBooleanField;
    tConfigPubAd: TBooleanField;
    tConfigPubToolbar: TBooleanField;
    tPMSpooling: TBooleanField;
    tConfigMaxTempoSessao: TWordField;
    tMaqRAM: TIntegerField;
    tMaqCPU: TStringField;
    tMaqOS: TStringField;
    tMaqPrinters: TnxMemoField;
    tMaqDrives: TStringField;
    tMaqHDTotal: TIntegerField;
    tMaqHDFree: TIntegerField;
    tMaqDisplayWH: TStringField;
    tMaqLastScan: TDateTimeField;
    tCliAniversario: TStringField;
    tTarifaTipoAcesso: TWordField;
    tTarifaCor: TIntegerField;
    tTarifaCorFonte: TIntegerField;
    tTarifaDescricao: TStringField;
    tTarifaReinicia: TBooleanField;
    tTarifaPrecosStr: TnxMemoField;
    tTarifaDivQtd: TIntegerField;
    tTarifaReiniciaDesde: TWordField;
    tTarifaDivTipo: TWordField;
    tTarifaArredondar: TWordField;
    tTipoAcessoTarifaPadrao: TIntegerField;
    tTipoAcessoHoraTarifaStr: TnxMemoField;
    tConfigTarifaPadrao: TIntegerField;
    tConfigTarifaPorHorario: TBooleanField;
    tMsgCli: TnxTable;
    tMsgCliID: TAutoIncField;
    tMsgCliCliente: TIntegerField;
    tMsgCliTitulo: TStringField;
    tMsgCliTexto: TnxMemoField;
    tMsgCliRef: TIntegerField;
    tConfigFidMsg: TBooleanField;
    tConfigFidMsgTitulo: TStringField;
    tConfigFidMsgTexto: TnxMemoField;
    tTarifaSemValorMin: TBooleanField;
    tConfigBloqMeuComputador: TBooleanField;
    tConfigBloqLixeira: TBooleanField;
    tConfigFiltrarDesktop: TBooleanField;
    tConfigFiltrarMenuIniciar: TBooleanField;
    tConfigBloqDownloadExe: TBooleanField;
    tConfigBloqMeusDocumentos: TBooleanField;
    tConfigClassicStartMenu: TBooleanField;
    tPMJobCliID: TIntegerField;
    tSessaoIPs: TMemoField;
    tConfigBloqueiaCliAvulso: TBooleanField;
    tConfigExigeDadosMinimos: TBooleanField;
    tConfigDadosMinimos: TStringField;
    tConfigCidadePadrao: TStringField;
    tConfigUFPadrao: TStringField;
    tMaqSessionID: TIntegerField;
    tMaqConnectTime: TDateTimeField;
    tConfigPedirSaldoI: TBooleanField;
    tConfigPedirSaldoF: TBooleanField;
    tCaixaSaldoF: TCurrencyField;
    tCaixaQuebra: TCurrencyField;
    tConfigPMPausarServ: TBooleanField;
    tConfigPMNaoPausar: TnxMemoField;
    tCliCotaImpEspecial: TBooleanField;
    tCliCotaImpDia: TIntegerField;
    tCliCotaImpMes: TIntegerField;
    tConfigPMCotas: TBooleanField;
    tConfigPMCotasMaxPagDia: TIntegerField;
    tConfigPMCotasMaxPagMes: TIntegerField;
    tConfigPMCotasOpCota: TWordField;
    tConfigPMCotasOpExcesso: TWordField;
    tConfigPMCotasMaxExcesso: TIntegerField;
    tCliSemFidelidade: TBooleanField;
    tConfigPMCotasPorCli: TBooleanField;
    tProdutoEstoqueMin: TFloatField;
    tProdutoEstoqueMax: TFloatField;
    tProdutoAbaixoMin: TBooleanField;
    tProdutoAbaixoMinDesde: TDateTimeField;
    tProdutoEstoqueRepor: TFloatField;
    tConfigEmailIdent: TStringField;
    tConfigEmailConteudo: TStringField;
    tCliCHorario: TIntegerField;
    tCHora: TnxTable;
    tCHoraID: TAutoIncField;
    tCHoraNome: TStringField;
    tCHoraHP1: TIntegerField;
    tCHoraHP2: TIntegerField;
    tCHoraHP3: TIntegerField;
    tCHoraHP4: TIntegerField;
    tCHoraHP5: TIntegerField;
    tCHoraHP6: TIntegerField;
    tCHoraHP7: TIntegerField;
    tCliOpCHorario: TWordField;
    tConfigAlertaAssinatura: TBooleanField;
    tFWCateg: TIntegerField;
    tCategFW: TnxTable;
    tCategFWID: TAutoIncField;
    tCategFWNome: TStringField;
    tCliFornecedor: TBooleanField;
    tSessaoCartaoTempo: TBooleanField;
    tSessaoHP1: TIntegerField;
    tSessaoHP2: TIntegerField;
    tSessaoHP3: TIntegerField;
    tSessaoHP4: TIntegerField;
    tSessaoHP5: TIntegerField;
    tSessaoHP6: TIntegerField;
    tSessaoHP7: TIntegerField;
    tSessaoFiltrarWEB: TBooleanField;
    tNomes: TnxTable;
    tNomesNome: TStringField;
    tNomesSexo: TStringField;
    tConfigCamposCliCC: TMemoField;
    tConfigBloqToolbars: TBooleanField;
    tConfigBloqPosPago: TBooleanField;
    tConfigCliCongelado: TBooleanField;
    tSessaoDesktopSinc: TBooleanField;
    tConfigMinutosDesligaMon: TWordField;
    tConfigBRT: TWordField;
    tConfigExCookie: TBooleanField;
    tConfigHPOpenBef: TBooleanField;
    tCaixaIDLivre: TStringField;
    tConfigQtdMaqOk: TBooleanField;
    tConfigSenhaAdminOk: TBooleanField;
    tSessaoCliFiltrarWEB: TBooleanField;
    tSessaoCliIPs: TnxMemoField;
    tSessaoCliDesktopSinc: TBooleanField;
    tSessaoCliDisableAD: TBooleanField;
    tSessaoCliJobID: TIntegerField;
    tSessaoCliJobPages: TWordField;
    tSessaoPermitirDownloadExe: TBooleanField;
    tSessaoCliPermitirDownloadExe: TBooleanField;
    tPT: TnxTable;
    tPTSeq: TAutoIncField;
    tPTID: TGuidField;
    tPTIDTranParceiro: TStringField;
    tPTOK: TBooleanField;
    tPTCaixa: TIntegerField;
    tPTDataHoraParceiro: TDateTimeField;
    tPTDataHoraNex: TDateTimeField;
    tPTIDProdutoParceiro: TStringField;
    tPTcodParceiro: TStringField;
    tPTIDProdutoNex: TIntegerField;
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
    tPTImg: TGraphicField;
    tMaqIPConfig: TnxMemoField;
    tPTNomeCliente: TStringField;
    tITranplusTran: TBooleanField;
    tMovEstplusTran: TBooleanField;
    tTranplusTran: TBooleanField;
    tMovEstplusID: TGuidField;
    tTranTotLiq: TCurrencyField;
    tITranTotLiq: TCurrencyField;
    tITranplusID: TGuidField;
    tTranplusID: TGuidField;
    tProdutoFornecedor: TIntegerField;
    tProdutoplus: TBooleanField;
    tProdutoplusURL: TnxMemoField;
    tProdutoplusCodParceiro: TStringField;
    tProdutoplusCodProduto: TStringField;
    tProdutoAtivo: TBooleanField;
    tTipoImpImgID: TIntegerField;
    tTipoImpPrinterDevMode: TBlobField;
    tConfigFundoWeb: TBooleanField;
    tConfigFundoWebURL: TnxMemoField;
    tConfigPMPDF: TBooleanField;
    tConfigPMReviewCli: TBooleanField;
    tConfigPMReviewAdmin: TBooleanField;
    tIC: TnxTable;
    tICIP: TStringField;
    tICcampanha: TStringField;
    tICutmccn: TStringField;
    tICutmctr: TStringField;
    tICutmcct: TStringField;
    tICutmcmd: TStringField;
    tICutmcsr: TStringField;
    H: TIdHTTP;
    tConfigPosLogin: TWordField;
    tFilaImp: TnxTable;
    tFilaImpID: TAutoIncField;
    tFilaImpInfo: TnxMemoField;
    tFilaImpIDImp: TIntegerField;
    tConfigPMPDFPrintEng: TWordField;
    tConfigHomePage_LastURL: TDateTimeField;
    tConfigHomePage_URL: TStringField;
    tConfigSky_Url: TStringField;
    tConfigHomePage_Tab: TBooleanField;
    tConfigPMConfirmaImpAdmin: TBooleanField;
    tConfigAutoCad: TBooleanField;
    tConfigQuickCad: TBooleanField;
    tConfigCodProdutoDuplicados: TBooleanField;
    tConfigToolbar_Url: TStringField;
    tDebitoID: TIntegerField;
    tConfigRecTipoImpressora: TStringField;
    tConfigRecCortaFolha: TBooleanField;
    tSessaoTipoMaq: TWordField;
    tSessaoCliTipoMaq: TWordField;
    tConfigRecursos: TStringField;
    tConfigComandaOff: TBooleanField;
    tConfigMesasOff: TBooleanField;
    tConfigConsumoAvulsoOff: TBooleanField;
    tConfigFaixaComanda: TStringField;
    tConfigPrecoAuto: TBooleanField;
    tConfigMargem: TFloatField;
    tEspecie: TnxTable;
    tEspecieID: TWordField;
    tEspecieTipo: TWordField;
    tEspecieNome: TStringField;
    tEspeciePermiteTroco: TBooleanField;
    tEspecieImg: TWordField;
    tPagEsp: TnxTable;
    tPagEspID: TAutoIncField;
    tPagEspCaixa: TIntegerField;
    tPagEspDataHora: TDateTimeField;
    tPagEspTran: TIntegerField;
    tPagEspEspecie: TWordField;
    tPagEspTipo: TWordField;
    tPagEspValor: TCurrencyField;
    tPagEspTroco: TCurrencyField;
    tPagEspDoc: TStringField;
    tEspeciePermiteVarios: TBooleanField;
    tPagEspCancelado: TBooleanField;
    tAuxTran: TnxTable;
    tAuxTranID: TAutoIncField;
    tAuxTranDataHora: TDateTimeField;
    tAuxTranCliente: TIntegerField;
    tAuxTranTipo: TWordField;
    tAuxTranFunc: TStringField;
    tAuxTranTotal: TCurrencyField;
    tAuxTranDesconto: TCurrencyField;
    tAuxTranTotLiq: TCurrencyField;
    tAuxTranPago: TCurrencyField;
    tAuxTranDebito: TCurrencyField;
    tAuxTranObs: TnxMemoField;
    tAuxTranCancelado: TBooleanField;
    tAuxTranCanceladoPor: TStringField;
    tAuxTranCanceladoEm: TDateTimeField;
    tAuxTranCaixa: TIntegerField;
    tAuxTranMaq: TWordField;
    tAuxTranNomeCliente: TStringField;
    tAuxTranSessao: TIntegerField;
    tAuxTranDescr: TStringField;
    tAuxTranQtdTempo: TFloatField;
    tAuxTranCredValor: TBooleanField;
    tAuxTranFidResgate: TBooleanField;
    tAuxTranplusID: TGuidField;
    tAuxTranplusTran: TBooleanField;
    tAuxTranRecVer: TIntegerField;
    tMovEstPermSemEstoque: TBooleanField;
    tAuxMEPagoPost: TCurrencyField;
    tAuxMEDescPost: TCurrencyField;
    tAuxMESessao: TIntegerField;
    tAuxMEplusID: TGuidField;
    tAuxMEplusTran: TBooleanField;
    tAuxMEFidResgate: TBooleanField;
    tAuxMEFidPontos: TFloatField;
    tAuxMEPermSemEstoque: TBooleanField;
    tAuxTranCredito: TCurrencyField;
    tAuxTranCreditoAnt: TCurrencyField;
    tAuxTranCreditoUsado: TCurrencyField;
    tAuxTranDebitoAnt: TCurrencyField;
    tAuxTranDebitoPago: TCurrencyField;
    tTranDebitoAnt: TCurrencyField;
    tTranDebitoPago: TCurrencyField;
    tTranCreditoAnt: TCurrencyField;
    tTranCredito: TCurrencyField;
    tTranCreditoUsado: TCurrencyField;
    tEspeciePermiteCred: TBooleanField;
    tTranPagFunc: TStringField;
    tTranPagPend: TBooleanField;
    tAuxTranPagFunc: TStringField;
    tAuxTranPagPend: TBooleanField;
    tITranPagPend: TBooleanField;
    tITranCaixaPag: TIntegerField;
    tTranTroco: TCurrencyField;
    tTranCaixaPag: TIntegerField;
    tAuxTranTroco: TCurrencyField;
    tAuxTranCaixaPag: TIntegerField;
    tAuxITranCaixaPag: TIntegerField;
    tAuxITranTotLiq: TCurrencyField;
    tAuxITranPagPend: TBooleanField;
    tAuxITranplusID: TGuidField;
    tAuxITranplusTran: TBooleanField;
    tConfigBanners: TnxMemoField;
    tConfigBotoes: TnxMemoField;
    tConfigConfirmarDebito: TBooleanField;
    tMaqURLLogin: TMemoField;
    tTranDescPorPerc: TBooleanField;
    tTranDescPerc: TFloatField;
    tUsuarioLimiteDesc: TFloatField;
    tConfigComissaoPerc: TFloatField;
    tConfigComissaoLucro: TBooleanField;
    tProdutoComissaoPerc: TFloatField;
    tProdutoComissaoLucro: TBooleanField;
    tMovEstComissao: TCurrencyField;
    tMovEstComissaoPerc: TFloatField;
    tMovEstComissaoLucro: TBooleanField;
    tAuxMEComissao: TCurrencyField;
    tAuxMEComissaoPerc: TFloatField;
    tAuxMEComissaoLucro: TBooleanField;
    tConfigCodBarBal: TBooleanField;
    tConfigCodBarBalTam: TWordField;
    tConfigCodBarBalIdent: TStringField;
    tConfigCodBarBalInicioCod: TWordField;
    tConfigCodBarBalTamCod: TWordField;
    tConfigCodBarBalValor: TBooleanField;
    tConfigCodBarBalPPInicio: TWordField;
    tConfigCodBarBalPPTam: TWordField;
    tConfigCodBarBalPPDig: TWordField;
    tConfigDTol: TWordField;
    tConfigDVA: TDateTimeField;
    tConfigProxAvisoAss: TDateTimeField;
    tConfigPreLib: TBooleanField;
    tConfigNaoTransferirMaq: TBooleanField;
    tConfigUrls: TnxMemoField;
    tSessaoCliVersaoRegistro: TIntegerField;
    tSessaoVersaoRegistro: TIntegerField;
    tMovEstRecVer: TIntegerField;
    tITranRecVer: TIntegerField;
    tTranRecVer: TIntegerField;
    tTranTipoPago: TWordField;
    tConfigVerBloqueioSites: TBooleanField;
    tConfigRecVer: TIntegerField;
    procedure tMovEstCalcFields(DataSet: TDataSet);
    procedure tAuxMECalcFields(DataSet: TDataSet);
    procedure tITranCalcFields(DataSet: TDataSet);
    procedure tTranCalcFields(DataSet: TDataSet);
    procedure tAuxITranCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure tITranBeforePost(DataSet: TDataSet);
    procedure tCliBeforePost(DataSet: TDataSet);
    procedure tITranBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    function IncluiIME(IM: TncItemMovEst; ME: TncMovEst): Integer;
    function AlteraIME(IM: TncItemMovEst; MEAnt, MEAtu: TncMovEst): Integer;
    function ExcluiIME(IM: TncItemMovEst; MEAnt, MEAtu: TncMovEst): Integer;
    function ObtemSaldoAnt(aProduto: Integer; aDH: TDateTime; aID: Integer): Double; 
    function CriaITranLogout(S: TncSessao; aFunc: String): Integer;

    function PassouLimiteDebito: Boolean;

    procedure PremiarCli(aCliente: Integer);
    procedure LoadCHorario(S: TncSessao);
    procedure ProcessaVendaPlus;

  public
    FPass : TncPassaportes;
    FidControl : TFidControl;
    FSessoes : TncSessoes;
    
    function LimiteDeb: Currency;
    procedure RefreshDebitoCliente;
    procedure ReprocessaEstoque;
    function AjustaSaldoPost(aProduto: Integer; aDH: TDateTime; aID: Integer; aSaldoInicial: Double): Double;
    procedure Open(aChecaFmtTabs: Boolean = False);
    procedure Close;
    { Public declarations }
    procedure RefreshTranSessao(aSessao: TncSessao);
    procedure RefreshPassSessao(aSessao: TncSessao);
    procedure RefreshImpSessao(aSessao: TncSessao);
    procedure RefreshTemposSessao(aSessao: TncSessao);
    procedure RefreshVendasSessao(aSessao: TncSessao);
    procedure RefreshSessao(aSessao: TncSessao);
    procedure RecalcPass;

    procedure RefreshPontosPremioAuto;

    function InitTran(const aTables : array of TnxTable;
                      aWith : Boolean): Boolean;

    procedure RefreshEspera(Sessoes: TncSessoes; Maquinas: TncListaMaquinas);

    procedure LoadIMEs(ME: TncMovEst);
    procedure LoadIDeb(Deb: TncDebito);
    procedure LoadIDebPagos(Deb: TncDebito);
    procedure LoadPagEsp(aTranID: Integer; aPagEsp: TncPagEspecies);
    procedure CancelarPagEsp(aTranID: Integer);
    procedure SavePagEsp(aTranID, aCaixa: Integer; aDataHora: TDateTime; aCancelado: Boolean; aPagEsp: TncPagEspecies);
    function TotalDeb(aCliente: Integer): Currency;
    
    procedure SalvaMsgChat(const aDe, aPara: Integer; const aTexto: String);
    procedure GravaLog(Programa, Maq: Integer; Operacao: String);
    procedure RefreshPrecos;
    procedure RefreshTarifas;
    procedure ImportarTarifas;
    procedure SalvaUsuario(U: TncUsuario);
    procedure SalvaConfig(C: TncConfig);
    procedure SalvaConfigPB(P : TmsgPubPar);
    procedure SalvaTipoAcesso(TA: TncTipoAcesso);
    procedure SalvaTipoImp(T: TncTipoImp);
    procedure SalvaEspecie(E: TncEspecie);
    procedure SalvaTarifa(T: TncTarifa);
    function SalvaSenhaCli(Codigo: Integer; Senha: String): Integer;
    procedure SalvaSessao(S: TncSessao);
    function AlteraSessao(S: TncSessao; aFunc: String; aSessoes: TncSessoes): Integer;
    procedure SalvaMaq(M: TncMaquina);
    procedure SalvaLogAppUrl(L: TncAppUrlLog; aMaquinas: TncListaMaquinas; aSessoes: TncSessoes);
    procedure AtualizaSiteProg(M: TncListaMaquinas; S: TncSessoes);

    function SalvaClientPages(J: TncJob; aMaq, aPaginas: Word): Boolean;
    procedure SalvaJobNotification(J: TncJob; aOper: Byte); //0=incluir, 1=atualizar, 2=excluir
    procedure SalvaJobControl(J : TncJob; aControl: Byte);

    procedure AddMsgCli(aCliente, aRef: Integer; aTitulo, aTexto: String);
    function RemoveMsgCliByID(aID: Integer; var aCliente: Integer): Boolean;
    function RemoveMsgCliByRef(aRef: Integer): Boolean;
    procedure LoadMsgCliList(aCliente: Integer; aList: TncMsgCliList);

    procedure SalvaArqFundo(aDesktop: Boolean; aNomeArq: String; aConfig: TncConfig);
    function NumCaixaAberto: Integer;
    function FuncCaixaAberto: String;
    procedure SalvaPaginasImpressas(J: TncJob; aMaq: Word; Maq: TncMaquina; Sessao: TncSessao; aPaginas: Integer; aImp, aDoc: String; aRegistrar: Integer);
    procedure ModoManutencao(aMaq: Word; aUsername, aNomeFunc: String; aEntrar: Boolean; aNumCx: Integer; aSessao: TncSessao);
    procedure TransferirMaq(aOrigem, aDestino: Word; Sessao: TncSessao; aFunc: String);
    procedure PausarSessao(S: TncSessao; aPausar: Boolean);
    function SalvaCredTempo(aCT: TncCredTempo; var AumentouDeb: Boolean; aSessoes: TncSessoes = nil): Integer;
    function SalvaLoginMaq(S: TncSessao; Sessoes: TncSessoes; aFunc: String; Config: TncConfig): integer;
    procedure SalvaIPSessao(S: TncSessao; aIP: String);
    function SalvaLogoutMaq(S: TncSessao; Config: TncConfig; aFunc: String): Integer;
    function SalvaMovEst(ME: TncMovEst; const aIgnoraCaixa: Boolean = False): Integer;
    function SalvaMovEstCustom(ME: TncMovEst; aPlus: Boolean; const aIgnoraCaixa: Boolean = False): Integer;

    function SalvaImpressao(Imp: TncImpressao; aPrintDocSL: TStrings; J: TncJob; aSessoes: TncSessoes = nil): Integer;
    procedure SalvaPosAtualSessoes(Sessoes: TncSessoes);
    function PodeAlterarTran(aID: Integer): Boolean;
    function CancelarTran(aID: Integer; aFunc: String; aSessoes: TncSessoes): Integer;
    function SalvaPagDebito(aDeb: TncDebito): Integer;
    function SalvaLancExtra(aLE: TncLancExtra): Integer;
    function SalvaDebTempo(aDT: TncDebTempo; aSessoes: TncSessoes): Integer;
    function CorrigeDataCaixa(aFunc: String; aID: Integer; aNovaAbertura, aNovoFechamento: TDateTime): integer; 
    function AjustaPontosFid(aFunc: String; aCliente: Integer; aFator: Smallint; aPontos: Double; aObs: String; aSessao: TncSessao): Integer; 

    function CriaMEPlusTran(aIDTran: String): TncMovEst;
    function FindTranPlus(aIDTran: String): Integer;

    procedure RefreshCHSessoes(aID: Integer);

    procedure ObtemDadosCotas(aCliente: Integer; J: TncJob);
    
    function ObtemPatrocinios(SL: TStrings): String;

    procedure ObtemValorMinMaxImp(var aMin, aMax: Currency);
    
    procedure ApagaRec(aCliHandle: Integer);
    procedure CorrigeTemposOcupacao;
    procedure AddRec(aCliHandle, aTran: Integer);
    procedure PermitirDownload(S: TncSessao; aExe, aPermitir: Boolean);
    procedure DesativarFWSessao(S: TncSessao; aDesativar: Boolean);
    procedure DesktopSincronizado(S: TncSessao);
    procedure SalvaProcessos(aCli, aReq: Integer; SL: TStrings);
    function ObtemSitesBloqueados: String;
    procedure ReprocessaDebitos;
    procedure RetotalizaPassaportes;
    procedure RecriaDebitos;
    function ProcessaPlus: Boolean;
    procedure SalvaInfoCampanha(IC : TInfoCampanha);
    
    
  end;

  
  TThreadInfoCampanha = class ( TThread )
  protected
    FHandle: HWND;
    procedure Execute; override;
  public
    constructor Create(aHandle: HWND);
  end;    

  function ObtemInfoCampanha: TInfoCampanha; 
   
var
  DM: TDM;

implementation

uses ncTableDefs, ncVersoes, ncDebug, nexUrls;

{$R *.dfm}

function ObtemInfoCampanha: TInfoCampanha;
var 
  SL : TStrings;
  H : TidHttp;
begin
  Result := nil;
  try
    SL := TStringList.Create;
    H := TidHttp.Create(nil);
    try
      H.HandleRedirects := True;
      SL.Text := H.Get(gUrls.Url('contas_obteminfocampanha'));
      if SL.Values['erro']='0' then begin
        Result := tInfoCampanha.Create;
        Result.icCampanha := UTF8ToAnsi(sl.Values['campanha']);
        Result.icutmccn := UTF8ToAnsi(sl.Values['utmccn']);
        Result.icutmctr := UTF8ToAnsi(sl.Values['utmctr']);
        Result.icutmcct := UTF8ToAnsi(sl.Values['utmcct']);
        Result.icutmcmd := UTF8ToAnsi(sl.Values['utmcmd']);
        Result.icutmcsr := UTF8ToAnsi(sl.Values['utmcsr']);
      end;
    finally
      SL.Free;
      H.Free;
    end;
  except
    on E: Exception do
      DebugMsg('ObtemInfoCampanha - E.Message: '+E.Message);
  end;
end;

function ObtemIdade(DN: TDateTime): Integer;
var y, m, d, y2, m2, d2 : Word;
begin
  DecodeDate(Date, y, m , d);
  DecodeDate(DN, y2, m2, d2);
  Result := y-y2;
  if (m<m2) or ((m=m2) and (d<d2)) then Dec(Result);
  if Result < 5 then Result := 0;
end;

function SemAcento(S: String): String;
const
  Acentos =  'éêèýýúùûîiíìõôòóãáàñç';
  SAcentos = 'eeeyyuuuiiiiooooaaanc';
var
  I, P : Integer;  
begin
  S := lowercase(S);
  Result := '';
  for I := 1 to Length(S) do begin
    P := Pos(S[i], Acentos);
    if P>0 then
      Result := Result + SAcentos[P] else
      Result := Result + S[i];
  end;
end;

{ TdmServ }
function DBInitTran(aDB: TnxDatabase;
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

procedure TDM.AddMsgCli(aCliente, aRef: Integer; aTitulo, aTexto: String);
begin
  tMsgCli.Insert;
  tMsgCliCliente.Value := aCliente;
  tMsgCliRef.Value := aRef;
  tMsgCliTitulo.Value := aTitulo;
  tMsgCliTexto.Value := aTexto;
  tMsgCli.Post;
end;

procedure TDM.AddRec(aCliHandle, aTran: Integer);
begin
  tRec.Insert;
  tRecCliente.Value := aCliHandle;
  tRecTran.Value := aTran;
  tRec.Post;
end;

function TDM.AjustaPontosFid(aFunc: String; aCliente: Integer; aFator: Smallint;
  aPontos: Double; aObs: String; aSessao: TncSessao): Integer;
var 
  NumCx: Integer;  
  S: String;

procedure CancelAndRollback;
begin
  if not nxDB.InTransaction then Exit;
  tCli.Cancel;
  tCaixa.Cancel;
  tITran.Cancel;
  tTran.Cancel;
  nxDB.Rollback;
end;

begin
  InitTran([tCaixa, tTran, tITran, tCli], True);
  try
    NumCx := NumCaixaAberto;
    if NumCx<1 then begin
      Result := ncerros.ncerrCaixaFechado;
      Exit;
    end;

    if (aCliente=0) and (aFator=0) then begin
      tTran.Insert;
      tTranCliente.Clear;
      tTranDescr.Value := 'Zerou pontos de todos clientes';
      tTranNomeCliente.Value := 'Todos';
    end else begin
      if not tCli.FindKey([aCliente]) then begin
        Result := ncerros.ncerrItemInexistente;
        Exit;
      end;
      tTran.Insert;
      S := FloatToStr(aPontos);
      if aFator=1 then
        S := S + ' pontos adicionados' else
        S := S + ' pontos removidos';
      tTranCliente.Value := aCliente;
      tTranNomeCliente.Value := tCliNome.Value;
      tTranDescr.Value := S;
      tTranObs.Value := aObs;
    end;

    tTranFunc.Value := aFunc;
    tTranDataHora.Value := Now;
    tTranTipo.Value := trAjustaFid;
    tTranCaixa.Value := NumCx;
    tTran.Post;

    if (aCliente=0) and (aFator=0) then begin
      tITran.BeforePost := nil;
      tCli.BeforePost := nil;
      try
        tCli.First;
        while not tCli.Eof do begin
          if Abs(tCliFidPontos.Value)>0.0001 then begin
            aPontos := tCliFidPontos.Value;
              
            tITran.Insert;
            if aPontos<0 then begin
              aPontos := -1 * aPontos;
              tITranFidFator.Value := 1;
            end else 
              tITranFidFator.Value := -1;
            tITranCaixa.Value := NumCx;
            tITranTran.Value := tTranID.Value;
            tITranTipoTran.Value := trAjustaFid;
            tITranTipoItem.Value := itAjustaFid;
            tITranDataHora.Value := tTranDataHora.Value;
            tITranItemPos.Value := 1;
            tITranFidMov.Value := True;
            tITranFidPontos.Value := aPontos;
            tITranCliente.Value := tCliID.Value;
            tITran.Post;
  
            tCli.Edit;
            tCliFidPontos.Value := 0;
            tCli.Post;
          end;
          tCli.Next;
        end;
      finally
        tITran.BeforePost := tITranBeforePost;
        tCli.BeforePost := tCliBeforePost;
      end;
      FidControl.Clear;
    end else begin
      tITran.Insert;
      tITranCaixa.Value := NumCx;
      tITranTran.Value := tTranID.Value;
      tITranTipoTran.Value := trAjustaFid;
      tITranTipoItem.Value := itAjustaFid;
      tITranDataHora.Value := tTranDataHora.Value;
      tITranItemPos.Value := 1;
      tITranFidFator.Value := aFator;
      tITranFidMov.Value := True;
      tITranFidPontos.Value := aPontos;
      tITranCliente.Value := tCliID.Value;
      tITran.Post;
      FidControl.CanCommit;
    end;

    nxDB.Commit;

    if aSessao<>nil then aSessao.PontosCli := tCliFidPontos.Value;
    
    Result := 0;
  finally
    CancelAndRollback;
  end;  
end;

function TDM.AjustaSaldoPost(aProduto: Integer; aDH: TDateTime; aID: Integer;
  aSaldoInicial: Double): Double;
var AchouProd: Boolean;  
begin
  Result := 0;

  AchouProd := tProduto.FindKey([aProduto]);
  
  tAuxME.IndexName := 'IProduto';
  try
    tAuxME.SetRange([aProduto, aDH, Succ(aID)], [aProduto, MaxDateTime]);
    while not tAuxME.Eof do begin
      tAuxME.Edit;
      
      if AchouProd and tProdutoNaoControlaEstoque.Value then 
        tAuxMENaoControlaEstoque.Value := True;
        
      tAuxMEEstoqueAnt.Value := aSaldoInicial;
        
      tAuxME.Post;

      if AchouProd and tProdutoNaoControlaEstoque.Value then
        aSaldoInicial := 0 else
        aSaldoInicial := tAuxMESaldoPost.Value;
        
      tAuxME.Next;
    end;

     if AchouProd then begin
       tProduto.Edit;
       if tProdutoNaoControlaEstoque.Value then
         tProdutoEstoqueAtual.Clear else
         tProdutoEstoqueAtual.Value := aSaldoInicial;
       tProduto.Post;
       Result := aSaldoInicial;
     end;
  finally
    tAuxME.CancelRange;
  end;
end;

function TDM.AlteraIME(IM: TncItemMovEst; MEAnt, MEAtu: TncMovEst): Integer;
var 
  Achou: Boolean;
  Ant : TncItemMovEst;
begin
  Result := 0;
  Ant := TncItemMovEst.Create(MEAnt);
  try
    tMovEst.IndexName := 'IID';
    tITran.IndexName := 'IID';
    Achou := tMovEst.FindKey([IM.imID]);
    if Achou then 
      Ant.LoadFromDataset(tMovEst);
    
    if IM._Operacao=osAlterar then begin
      if Achou then begin
        tDebito.IndexName := 'ITipoID';
        if tDebito.FindKey([itMovEst, Ant.imID]) then
          tDebito.Delete;
          
        AjustaSaldoPost(Ant.imProduto, Ant.imDataHora, Ant.imID, Ant.imEstoqueAnt);

        IM.imTran := MEAtu.ID;
        tMovEst.Edit;
        IM.imEstoqueAnt := ObtemSaldoAnt(IM.imProduto, IM.imDataHora, IM.imID);
        IM.SaveToDataset(tMovEst);

        if tITran.FindKey([IM.imITran]) then 
          tITran.Edit else
          Raise ENexCafe.Create('Item não encontrado');
          
        IM.SaveToITranDataset(tITran);
        tITran.Post;
        tMovEstITran.Value := tITranID.Value;
        tMovEst.Post;

        if tProduto.FindKey([IM.imProduto]) then begin

          if (MEAtu.Tipo=trEstCompra) and (IM.UnitarioLiq>0.001) then begin
            tProduto.Edit;
            tProdutoCustoUnitario.Value := IM.UnitarioLiq;
            tProduto.Post;
          end;
        
          if not tProdutoNaoControlaEstoque.Value then
          if (AjustaSaldoPost(IM.imProduto, IM.imDataHora, IM.imID, IM.SaldoPost)<0) and
             (MEAtu.Tipo=trEstVenda) and gConfig.NaoVenderAlemEstoque and (not IM.imPermSemEstoque) then 
          begin
            Result := ncerrProdutoSemSaldo;
            Exit;
          end;
        
        end;

        if (IM.Debito>0.00001) and (MEAtu.ValorDebitado>0.00001) then begin
          tDebito.Insert;
          tDebitoData.Value := IM.imDataHora;
          tDebitoCliente.Value := IM.imCliente;
          tDebitoTipo.Value := itMovEst;
          tDebitoID.Value := IM.imID;
          tDebitoValor.Value := IM.Debito;
          tDebito.Post;
        end;
        
      end else
        Result := IncluiIME(IM, MEAtu);
    end else
      if Achou then begin
        tDebito.IndexName := 'ITipoID';
        if tDebito.FindKey([itMovEst, Ant.imID]) then
          tDebito.Delete;

        if tITran.FindKey([Ant.imITran]) then
          tITran.Delete; 
          
        tMovEst.Delete;
        AjustaSaldoPost(Ant.imProduto, Ant.imDataHora, Ant.imID, Ant.imEstoqueAnt);
      end;
  finally
    Ant.Free;
  end;
end;

function FirstWord(S: String): String;
var I : Integer;
begin
  S := Trim(S);
  Result := '';
  for I := 1 to Length(S) do
    if Copy(S, i, 1) = ' ' then
      Exit else
      Result := Result + S[i];
end; 

function TDM.AlteraSessao(S: TncSessao; aFunc: String; aSessoes: TncSessoes): Integer;
var Debitar: Currency;

procedure CancelAndRollback;
begin
  if nxDB.InTransaction then begin
    nxDB.Rollback;
    tTran.Cancel;
    tTempo.Cancel;
    tCli.Cancel;
    tITran.Cancel;
    tSessao.Cancel;
    tPassaporte.Cancel;
    tHPass.Cancel;
    tProduto.Cancel;
    tMovEst.Cancel;
    tDebito.Cancel;
    tCaixa.Cancel;
    tRec.Cancel;
  end;  
end;

procedure _ApagaITranAnterior;
begin
  tITran.IndexName := 'ITranID';
  tITran.SetRange([tTranID.Value], [tTranID.Value]);
  try
    tMovEst.IndexName := 'IID';
    tImp.IndexName := 'IID';
    tTempo.IndexName := 'IID';
    while not tITran.IsEmpty do begin
      if tITranDebito.Value>0.0001 then
      if tDebito.FindKey([tITranTipoItem.Value, tITranItemID.Value]) then
        tDebito.Delete;
      case tITranTipoItem.Value of
        itMovEst : if tMovEst.FindKey([tITranItemID.Value]) then
        begin
          tMovEst.Edit;
          tMovEstPagoPost.Value := tMovEstPagoPost.Value - tITranPago.Value;
          tMovEstDescPost.Value := tMovEstDescPost.Value - tITranDesconto.Value;
          tMovEst.Post;
        end;
        
        itImpressao : if tImp.FindKey([tITranItemID.Value]) then
        begin
          tImp.Edit;
          tImpPagoPost.Value := tImpPagoPost.Value - tITranPago.Value;
          tImpDescPost.Value := tImpDescPost.Value - tITranDesconto.Value;
          tImp.Post;
        end;
  
        itTempo : if tTempo.FindKey([tITranItemID.Value]) then
        begin
          tTempo.Edit;
          tTempoPagoPost.Value := tTempoPagoPost.Value - tITranPago.Value;
          tTempoDescPost.Value := tTempoDescPost.Value - tITranDesconto.Value;
          tTempo.Post;
        end;          
      end;    
      tITran.Delete;
    end;
  finally
    tITran.CancelRange;
  end;  
end;

procedure _AlteraTempos;
var 
  k: Integer;
  AumentouDeb: Boolean;
begin
  for k := 0 to S.Tempos.Count - 1 do
  case S.Tempos[k]._Operacao of
    osIncluir,
    osAlterar  : begin
      Result := SalvaCredTempo(S.Tempos[k], AumentouDeb);
      if Result<>0 then Exit;
    end;
      
    osCancelar : begin
      Result := CancelarTran(S.Tempos[k].teTran, aFunc, nil);
      if Result<>0 then Exit;
    end;
  end;
end;

procedure _AlteraVendas;
var 
  k: Integer;
  ME : TncMovEst;
begin
  ME := TncMovEst.Create;
  try
    for k := 0 to S.Vendas.Count- 1 do
    case S.Vendas[k]._Operacao of
      osIncluir,
      osAlterar  : begin
        ME.Limpa;
        ME.Operacao := S.Vendas[k]._Operacao;
        ME.Tipo := trEstVenda;
        ME.Cliente := S.Cliente;
        ME.Sessao := S.ID;   
        if S.Vendas[k]._Operacao=osIncluir then
          ME.DataHora := Now else
          ME.DataHora := S.Vendas[k].imDataHora;
        if ME.Func='' then   
          ME.Func := aFunc;
        ME.Total := S.Vendas[k].imTotal;
        ME.Desconto := S.Vendas[k].imDesconto;
        ME.Pago := S.Vendas[k].imPago;
        ME.Obs := S.Vendas[k].imObs;
        if S.Vendas[k]._Operacao=osAlterar then begin
          ME.ID := S.Vendas[k].imTran;
          ME.Caixa := S.Vendas[k].imCaixa;
        end;
        ME.Maq := S.Maq;
        ME.NomeCliente := S.NomeCliente;
        with ME.NewIME do begin
          AssignFrom(S.Vendas[k]);
          imCliente := ME.Cliente;
        end;
        ME.Recibo := S.Vendas[k]._Recibo;
        Result := SalvaMovEst(ME);
        if Result<>0 then Exit;
      end;
      osCancelar : begin
        Result := CancelarTran(S.Vendas[k].imTran, aFunc, nil);
        if Result<>0 then Exit;
      end;
    end;
  finally
    ME.Free;
  end;  
end;

procedure _AlteraImpressoes;
var k: Integer;
begin
  for k := 0 to S.Impressoes.Count - 1 do
  case S.Impressoes[k]._Operacao of
    osIncluir,
    osAlterar  : begin
      S.Impressoes[k].impCliente := S.Cliente;
      if S.Impressoes[k]._Operacao=osIncluir then
        S.Impressoes[k].impMaquina := S.Maq;
        
      Result := SalvaImpressao(S.Impressoes[k], nil, nil);
      if Result<>0 then Exit;
    end;
      
    osCancelar : begin
      Result := CancelarTran(S.Impressoes[k].impTran, aFunc, nil);
      if Result<>0 then Exit;
    end;
  end;
end;

begin
  Result := 0;
  InitTran([tTran, tTempo, tCli, tRec, tITran, tSessao, tOcupacao, tPassaporte, tHPass, tDebito, tProduto, tMovEst, tCaixa, tPagEsp], True);
  try
    Debitar := 0;
  
    try
      if not tSessao.FindKey([S.ID]) then begin
        Result := ncerrItemInexistente;
        Exit;
      end;

      if S.VersaoRegistro <> tSessaoVersaoRegistro.Value then begin
        Result := ncerrAcessoAlteradoPorOutroUsuario;
        Exit;
      end;

      if (S.Cliente>0) and ((not S.Encerrou) or (S.TranF=0)) and (tSessaoCLiente.Value<>S.Cliente) then begin  
         if (aSessoes.PorCliente[S.Cliente]<>nil) then 
         begin
           Result := ncerrClienteJaAtivo;
           Exit;
         end;
         
         if tCli.FindKey([S.Cliente]) and gConfig.BloquearLoginAlemMaxDeb and PassouLimiteDebito then begin
           Result := ncerrLoginNaoPermitidoLimDeb;
           Exit;
        end;
      end;

      if not S.Encerrou then begin
        tSessao.Edit;
        S.SalvaDataset(tSessao);
        tSessao.Post;
      end else 
      if tSessaoCliente.Value <> S.Cliente then begin
        Result := ncerrSessaoJaEncerrou;
        Exit;
      end;
      
      if S.TranF>0 then begin
        if not PodeAlterarTran(S.TranF) then begin
          Result := ncerrExisteTranPosterior;
          Exit;
        end;
        tTran.IndexName := 'IID';
        if not tTran.FindKey([S.TranF]) then begin
          Result := ncerrItemInexistente;
          Exit;
        end;

        if (tTranCliente.Value>0) and (tTranDebito.Value>0) and tCli.FindKey([tTranCliente.Value]) then 
        begin
          tCli.Edit;
          tCliDebito.Value := tCliDebito.Value - tTranDebito.Value;
          tCli.Post;
        end;

        if (S.Cliente>0) and (tTranCliente.Value=S.Cliente) and (tTranDebito.Value>0) then
          Debitar := -1 * tTranDebito.Value;

        SavePagEsp(S.TranF, tTranCaixa.Value, tTranDataHora.Value, False, S.PagEsp);
      
        _ApagaITranAnterior;
      end;

      if (not S.Encerrou) or (S.CaixaF>0) then
        S.PausaFimTempo(True);

      _AlteraTempos;
      if Result <> 0  then Exit;

      _AlteraVendas;
      if Result <> 0  then Exit;

      _AlteraImpressoes;
      if Result <> 0 then Exit;
      
      if S.Encerrou then begin
        Result := CriaITranLogout(S, aFunc);
        if Result<>0 then Exit;
      end;

      if (S.Cliente>0) and tCli.Locate('ID', S.Cliente, []) then begin
        tCli.Edit;
        tCliUltVisita.Value := S.Inicio;
        tCli.Post;

        S.Sexo := tCliSexo.Value;
        if tCliDataNasc.IsNull then
          S.DataNasc := 0 else
          S.DataNasc := tCliDataNasc.Value;
      end else begin
        S.DataNasc := 0;
        S.Sexo := '';
      end;

    
      if (S.NomeCliente > '') and (not tNomes.IsEmpty) then begin
        tNomes.FindNearest([SemAcento(FirstWord(S.NomeCliente))]);
        S.Sexo := tNomesSexo.Value;
      end;
      if not FidControl.CanCommit then begin
        Result := ncerrSaldoFidInsuficiente;
        Exit;
      end;
           
      tSessao.Edit;
      S.IncVersaoRegistro;
      S.SalvaDataset(tSessao);
      tSessao.Post;

      if (S.TranF>0) and S.Recibo then
        AddRec(HandleCliAtual, S.TranF);
      
      
      RefreshSessao(S);
    
      nxDB.Commit;
      Result := 0;
    except
      CancelAndRollback;
      Raise;
    end;
  finally
    CancelAndRollback;
  end;
end;

procedure TDM.ApagaRec(aCliHandle: Integer);
begin
  try
    tRec.SetRange([aCliHandle], [aCliHandle]);
    tRec.DeleteRecords;
  except
    try
      tRec.CancelRange;
    except
    end;
  end; 
end;

procedure TDM.AtualizaSiteProg(M: TncListaMaquinas; S: TncSessoes);
var 
  i: integer;
  Sessao: TncSessao;

function ObtemNom(aID: String): String;
begin
  if (aID>'') and tLNom.Locate('ID', aID, []) then
    Result := tLNomNome.Value else
    Result := '';
end;

function GetUrl(aHost, aPagina: String): String;
begin
  if (aHost>'') and (aHost[Length(aHost)]<>'/') then 
    Result := aHost + '/' + aPagina else
    Result := aHost + aPagina;
end;

begin
  tLUrl.IndexName := 'IID';
  for i := 0 to M.Count - 1 do begin
    Sessao := S.PorMaq[M[I].Numero];
    if Sessao=nil then begin
      M[I].SiteAtual := '';
      M[I].ProgramaAtual := '';
    end else begin
      tLApp.IndexName := 'ISessaoID';
      tLApp.SetRange([Sessao.ID], [Sessao.ID]);
      try
        tLApp.Last;
        if tLApp.IsEmpty or (not tLAppFim.IsNull) then begin
          M[I].SiteAtual := '';
          M[I].ProgramaAtual := '';
        end else begin
          if tLAppExe.Value>'' then
          
          M[I].ExeAtual := ObtemNom(tLAppExe.Value);
          M[I].ProgramaAtual := ObtemNom(tLAppTitulo.Value);
          M[I].AppLog := tLAppID.Value;
          tLUrl.IndexName := 'IID';
          if (tLAppUrl.Value>0) and tLUrl.FindKey([tLAppUrl.Value]) then
            M[I].SiteAtual := GetUrl(ObtemNom(tLUrlHost.Value), ObtemNom(tLUrlPagina.Value)) else
            M[I].SiteAtual := '';
        end;
      finally
        tLApp.CancelRange;
      end;
    end;
  end;  
end;

function TDM.CancelarTran(aID: Integer; aFunc: String; aSessoes: TncSessoes): integer;
var 
  NumCx: Integer;
  NewTran: Boolean;
  S : TncSessao;

procedure CancelAndRollback;
begin
  if not nxDB.InTransaction then Exit;

  tCaixa.Cancel;
  tCli.Cancel;
  tDebito.Cancel;
  tTran.Cancel;
  tITran.Cancel;
  tImp.Cancel;
  tMovEst.Cancel;
  tTempo.Cancel;
  tProduto.Cancel;
  tPassaporte.Cancel;
  tHPass.Cancel;
  tSessao.Cancel;
    
  if NewTran then nxDB.Rollback;
end;
  
begin
  Result := 0;
  NewTran := InitTran([tCaixa, tCli, tDebito, tTran, tITran, tImp, tMovEst, tTempo, tProduto, tHPass, tPassaporte, tSessao, tPagEsp], True);
  try
    try
      NumCx := NumCaixaAberto;
      if not PodeAlterarTran(aID) then begin
        Result := ncerrExisteTranPosterior;
        Exit;
      end;
      tTran.IndexName := 'IID';
      if not tTran.FindKey([aID]) then begin
        Result := ncerrItemInexistente;
        Exit;
      end;

      if tTranCancelado.Value then Exit;
      
      if (tTranCaixa.Value<>0) and (tTranCaixa.Value<>NumCx) then begin
        Result := ncerrCaixaDiferente;
        Exit;
      end;

      if tTranTipo.Value=trFimSessao then begin
        Result := ncerrImpossivelCancFimSessao;
        Exit;
      end;

      S := nil;
      if (aSessoes<>nil) then begin
        if (tTranSessao.Value>0) then 
          S := aSessoes.PorID[tTranSessao.Value];
          
        if (S=nil) and (tTranCliente.Value>0) then
          S := aSessoes.PorCliente[tTranCliente.Value];
      end;

      if S<>nil then begin
        S.PausaFimTempo(False);
        S.MinTicksUsados := S.TempoUsado.Ticks;
        S.MinTicksTotal  := S.TicksTotal;
      end else
        S := nil;
      
      tTran.Edit;
      tTranCancelado.Value := True;
      tTranCanceladoPor.Value := aFunc;
      tTranCanceladoEm.Value := Now;
      tTran.Post;

      CancelarPagEsp(tTranID.Value);

      tDebito.IndexName := 'ITipoID';

      tITran.IndexName := 'ITranID';
      tITran.SetRange([aID], [aID]);

      tMovEst.IndexName := 'IID';
      tImp.IndexName := 'IID';
      tSessao.IndexName := 'IID';
      tTempo.IndexName := 'IID';

      if (tTranTipo.Value = trDebTempo) and tCli.FindKey([tTranCliente.Value]) then begin
        tCli.Edit;
        if tTranCredValor.Value then
          tCliValorCred.Value := tCliValorCred.Value +  tTranQtdTempo.Value else
          tCliMinutos.Value := tCliMinutos.Value + tTranQtdTempo.Value;
        tCli.Post;
      end;
      
      while not tITran.Eof do begin
        tITran.Edit;
        Result := ncerrItemInexistente;
        case tITranTipoItem.Value of
          itMovEst    : begin
            if not tMovEst.FindKey([tITranItemID.Value]) then Exit;
            tMovEst.Edit;
          end;
            
          itImpressao : begin
            if not tImp.FindKey([tITranItemID.Value]) then Exit;
            tImp.Edit;
          end;
            
          itSessao    : begin
            if not tSessao.FindKey([tITranItemID.Value]) then Exit;
            tSessao.Edit;
          end;
            
          itTempo     : begin
            if not tTempo.FindKey([tITranItemID.Value]) then Exit;
            tTempo.Edit;
          end;  
        end;
        
        if (tITranDebito.Value>0.0001) then begin
          if tDebito.FindKey([tITranTipoItem.Value, tITranItemID.Value]) then begin
            tDebito.Edit;
            tDebitoValor.Value := tDebitoValor.Value - tITranDebito.Value;
            tDebito.Post;
            if tDebitoValor.Value<0.01 then
              tDebito.Delete;
          end;
        end else
        if tTranTipo.Value=trPagDebito then begin
          
          if tDebito.FindKey([tITranTipoItem.Value, tITranItemID.Value]) then
            tDebito.Edit else
            tDebito.Insert;
            
          tDebitoTipo.Value := tITranTipoItem.Value;
          tDebitoID.Value := tITranItemID.Value;
          tDebitoCliente.Value := tTranCliente.Value;
          tDebitoData.Value := tTranDataHora.Value;
          tDebitoValor.Value := tDebitoValor.Value + tITranPago.Value + tITranDesconto.Value;
          tDebito.Post;

          case tITranTipoItem.Value of
            itSessao    : begin
              tSessaoPagoPost.Value := tSessaoPagoPost.Value - tITranPago.Value;
              tSessaoDescPost.Value := tSessaoDescPost.Value - tITranDesconto.Value;
            end;
            itMovEst    : begin
              tMovEstPagoPost.Value := tMovEstPagoPost.Value - tITranPago.Value;
              tMovEstDescPost.Value := tMovEstDescPost.Value - tITranDesconto.Value;
            end;
            itTempo     : begin
              tTempoPagoPost.Value  := tTempoPagoPost.Value - tITranPago.Value;
              tTempoDescPost.Value  := tTempoDescPost.Value - tITranDesconto.Value;
            end;
            itImpressao : begin
              tImpPagoPost.Value    := tImpPagoPost.Value   - tITranPago.Value;
              tImpDescPost.Value    := tImpDescPost.Value   - tITranDesconto.Value;
            end;
          end; 
        end;
        tITranCancelado.Value := True;
        tITran.Post;

        if tTranTipo.Value<>trPagDebito then 
        case tITranTipoItem.Value of
          itMovEst    : begin
            tMovEstCancelado.Value := True;
            tMovEst.Post;

            if tTranTipo.Value in [trEstVenda, trEstCompra, trEstEntrada, trEstSaida] then
              AjustaSaldoPost(tMovEstProduto.Value, tMovEstDataHora.Value, tMovEstID.Value, tMovEstEstoqueAnt.Value);
          end;  
          
          itImpressao : tImpCancelado.Value := True;
          itTempo     : begin
            tTempoCancelado.Value := True;
            tPassaporte.IndexName := 'IID';
            case tTempoTipo.Value of 
              tctPassaporte, tctCartaoTempo : 
              if tPassaporte.FindKey([tTempoPassaporte.Value]) then begin
                if tPassaporteAcessos.Value>0 then begin
                  Result := ncerrImpossivelCancPassaporteUsado;
                  Exit;
                end;

                tPassaporte.Edit;
                tPassaporteExpirou.Value := True;
                tPassaporte.Post;
              end;
              
              tctPacote:
              if tTranCliente.Value>0 then
              if not tCli.FindKey([tTranCliente.Value]) then begin
                Result := ncerrItemInexistente;
                Exit;
              end else 
              if tCliMinutos.Value<tTempoMinutos.Value then begin
                Result := ncerrSemCreditoDispCanc;
                Exit;
              end else begin
                tCli.Edit;
                tCliMinutos.Value := tCliMinutos.Value - tTempoMinutos.Value;
                tCli.Post;
              end;

              tctAvulso: 
              if tTranCliente.Value>0 then
              if not tCli.FindKey([tTranCliente.Value]) then begin
                Result := ncerrItemInexistente;
                Exit;
              end else begin
                if tTempoCredValor.Value then begin
                  if tCliValorCred.Value<tTempoTotal.Value then begin
                    Result := ncerrSemCreditoDispCanc;
                    Exit;
                  end else begin
                    tCli.Edit;
                    tCliValorCred.Value := tCliValorCred.Value - tTempoTotal.Value;
                    tCli.Post;
                  end;
                end else begin
                  if tCliMinutos.Value<tTempoMinutos.Value then begin
                    Result := ncerrSemCreditoDispCanc;
                    Exit;
                  end else begin
                    tCli.Edit;
                    tCliMinutos.Value := tCliMinutos.Value - tTempoMinutos.Value;
                    tCli.Post;
                  end;
                end;
              end;

              
            end;
          end;
        
          itSessao : begin 
            tSessaoCancelado.Value := True;
            tSessaoEncerrou.Value := True;
            tSessaoTermino.Value := Now;
            tSessaoFuncF.Value := aFunc;
            tSessaoCaixaF.Value := NumCx;
            tSessaoMinutosR.Value := 0;
            tSessaoMinutosC.Value := 0;
          end;
        end;

        case tITranTipoItem.Value of
          itMovEst    : if tMovEst.State=dsEdit then tMovEst.Post;
          itImpressao : if tImp.State=dsEdit then tImp.Post;
          itSessao    : if tSessao.State=dsEdit then tSessao.Post;
          itTempo     : if tTempo.State=dsEdit then tTempo.Post;
        end;
        
        tITran.Next;
      end;

      if NewTran and (not FidControl.CanCommit(True)) then begin
        Result := ncerrSaldoFidInsuficiente;
        Exit;
      end;
      
      Result := 0;

      if S<>nil then begin
        RefreshSessao(S);
        if not tSessao.FindKey([S.ID]) then begin
          Result := ncerrItemInexistente;
          Exit;
        end;
        tSessao.Edit;
        S.SalvaDataset(tSessao);
        tSessao.Post;
        S.LimpaCache;
        S.Notificar(tnAlteracao);
      end;

      if tTranCliente.Value>0 then 
      if tCli.Locate('ID', tTranCliente.Value, []) then begin
        RefreshDebitoCliente;
        RecalcPass;
      end;
      if NewTran then nxDB.Commit;
    except
      CancelAndRollback;
      Raise;
    end;
  finally
    try
      tITran.CancelRange;
    except
    end;
    CancelAndRollback;
  end;
end;


procedure TDM.Close;
begin
  nxDB.Close;
  nxSession.Close;
end;

function TDM.CorrigeDataCaixa(aFunc: String; aID: Integer; aNovaAbertura,
  aNovoFechamento: TDateTime): integer;
var 
  NewTran: Boolean;
  NumCx: Integer;  
  S: String;

procedure CancelAndRollback;
begin
  if not nxDB.InTransaction then Exit;
  tCaixa.Cancel;
  tTran.Cancel;
  if NewTran then nxDB.Rollback;
end;

begin
  NewTran := InitTran([tCaixa, tTran], True);
  try
    if not tCaixa.Locate('ID', aID, []) then begin
      Result := ncerrItemInexistente;
      Exit;
    end;
    tTran.Insert;
    tCaixa.Edit;
    S := 'Caixa n.' + IntToStr(aID);
    tTranDescr.Value := S;
    if (aNovaAbertura>(EncodeDate(2000, 1, 1))) and (aNovaAbertura<>tCaixaAbertura.Value) then 
    begin
      S := S + sLineBreak + 'Abertura alterada de  ' + tCaixaAbertura.AsString;
      tCaixaAbertura.Value := aNovaAbertura;
      S := S + '  para  ' + tCaixaAbertura.AsString
    end;
    
    if (aNovoFechamento>(EncodeDate(2000, 1, 1))) and (aNovoFechamento<>tCaixaFechamento.Value) then 
    begin
      S := S + sLineBreak + 'Fechamento alterado de  ' + tCaixaFechamento.AsString;
      tCaixaFechamento.Value := aNovoFechamento;
      S := S + '  para  ' + tCaixaFechamento.AsString;
    end;
    tCaixa.Post;

    tTranObs.Value := S;
    tTranFunc.Value := aFunc;
    tTranDataHora.Value := Now;
    tTranTipo.Value := trCorrDataCx;
    tTranCaixa.Value := NumCx;
    tTran.Post;
    nxDB.Commit;
    Result := 0;
  finally
    CancelAndRollback;
  end;  
end;

procedure TDM.CorrigeTemposOcupacao;
var 
  S : TncSessao;
  I : Integer;
begin
  InitTran([], False);
  S := TncSessao.Create(not LadoServidor);
  try
    try
     qAux.Active := False;
     qAux.SQL.Text := 'select distinct(sessao) as sessao from ocupacao where minutosu > 60';
     qAux.Open;
     qAux.First;
     while not qAux.Eof do begin
       if tSessao.FindKey([qAux.FieldByName('Sessao').AsInteger]) then begin
         S.Limpa;
         S.LeDataset(tSessao);
         tOcupacao.SetRange([S.ID], [S.ID]);
         tOcupacao.DeleteRecords;
         S.GeraOcupacao;
         for I := 0 to High(S.ArrOcupacao^) do 
         with S.ArrOcupacao^[I] do begin
           tOcupacao.Insert;
           tOcupacaoCliente.Value := S.Cliente;
           tOcupacaoFunc.Value := S.FuncI;
           tOcupacaoSessao.Value := S.ID;
           tOcupacaoData.Value := eoData;
           tOcupacaoTipoCli.Value := S.TipoCli;
           tOcupacaoHora.Value := eoHora;
           tOcupacaoMinutosU.Value := TicksToMinutos(eoTicksU);
           tOcupacaoMinutosP.Value := TicksToMinutos(eoTicksP);
           tOcupacaoMaq.Value := eoMaq;
           tOcupacaoCaixa.Value := eoCaixa;
           tOcupacao.Post;
         end;
       end;
       qAux.Next;
     end;
     nxDB.Commit;
    except
      nxDB.Rollback;
      Raise;
    end;
  finally
    try tOcupacao.CancelRange; except end;
    S.Free;
  end;
end;

function DuasCasas(Value: Currency): Currency;
begin
  Result := Trunc(Value * 100) / 100;                          
end;

function TDM.CriaITranLogout(S: TncSessao; aFunc: String): Integer;
var 
  nItem, I: Integer;
  PercDesc : Extended;
  Pago, Desc : Currency;
  PgTotal : Boolean;
  str: String;
begin
  Result := 0;

  if S.CaixaF=0 then begin
    S.CaixaF := NumCaixaAberto;
    if S.CaixaF=0 then begin
      Result := ncerrCaixaFechado;
      Exit;
    end;
  end else
  if S.CaixaF<>NumCaixaAberto then begin
    Result := ncerrCaixaDiferente;
    Exit;
  end;

  tOcupacao.SetRange([S.ID], [S.ID]); 
  tOcupacao.DeleteRecords;
  S.GeraOcupacao;

  for I := 0 to High(S.ArrOcupacao^) do 
  with S.ArrOcupacao^[I] do begin
    tOcupacao.Insert;
    tOcupacaoCliente.Value := S.Cliente;
    tOcupacaoFunc.Value := S.FuncI;
    tOcupacaoSessao.Value := S.ID;
    tOcupacaoData.Value := eoData;
    tOcupacaoTipoCli.Value := S.TipoCli;
    tOcupacaoHora.Value := eoHora;
    tOcupacaoMinutosU.Value := TicksToMinutos(eoTicksU);
    tOcupacaoMinutosP.Value := TicksToMinutos(eoTicksP);
    tOcupacaoMaq.Value := eoMaq;
    tOcupacaoCaixa.Value := eoCaixa;
    tOcupacao.Post;
  end;

  if S.TranF=0 then begin
    tTran.Insert;
    tTranDataHora.Value := Now;
  end else begin
    tTran.FindKey([S.TranF]);
    tTran.Edit;
  end;

  tTranTipo.Value        := trFimSessao;
  tTranDescr.Value       := 'Duração: ' + MinutosToHMSStr(S.TempoUsado.Minutos);
  if DateTimeToSegundos(Abs(Now-S.Termino))<10 then
    tTranDataHora.Value    := S.Termino
  else begin  
    tTranDataHora.Value    := Now;
    tTranDescr.Value := tTranDescr.Value + ' Término: ' + FormatDateTime('hh:mm:ss', S.Termino);
  end;
    
  tTranCaixa.Value       := S.CaixaF;
  tTranSessao.Value      := S.ID;
  tTranTotal.Value       := S.TotalGeral;
  tTranDesconto.Value    := S.DescTran;
  tTranPago.Value        := S.PagoTran;
  tTranCliente.Value     := S.Cliente;
  tTranFunc.Value        := aFunc;
  if SameText(tTranFunc.Value, 'Proxy') then
    tTranFunc.Clear;
  tTranNomeCliente.Value := S.NomeCliente;
  tTranMaq.Value         := S.Maq;
  tTranObs.Value         := S.ObsFim;
  try
    tTran.Post;
  except
    on E: Exception do begin
      str := E.Message;
      if str = 'teste' then tTran.Cancel;
    end;
  end;

  S.TranF                := tTranID.Value;

  if (tTranCliente.Value>0) and (tTranDebito.Value>0) and tCli.FindKey([tTranCliente.Value]) then 
  begin
    tCli.Edit;
    tCliDebito.Value := tCliDebito.Value + tTranDebito.Value;
    tCli.Post;
  end;
      
  if S.DescTran > 0.00001 then
    PercDesc := S.DescTran / S.TotalGeral
  else
    PercDesc := 0;

  Desc := S.DescTran;
  Pago := S.PagoTran;

  PgTotal := Abs(S.TotalGeral - S.DescTran - S.PagoTran) < 0.01;

  nItem := 0;
  tTran.IndexName := 'ISessao';
  tAuxITran.IndexName := 'ITranID';
  tMovEst.IndexName := 'IID';
  try
    tTran.SetRange([S.ID], [S.ID]);
    while not tTran.Eof do begin
      if (not tTranCancelado.Value) and (tTranTipo.Value in [trEstVenda, trImpressao, trCredTempo]) then
      begin
        tAuxITran.SetRange([tTranID.Value], [tTranID.Value]);
        while not tAuxITran.Eof do begin
          Inc(nItem);
          tITran.Insert;
          tITranTran.Value     := S.TranF;
          tITranTipoItem.Value := tAuxITranTipoItem.Value;
          tITranTipoTran.Value := trFimSessao;
          tITranDataHora.Value := tTranDataHora.Value;
          tITranCaixa.Value    := S.CaixaF;
          tITranCliente.Value  := S.Cliente;
          tITranSessao.Value   := S.ID;
          tITranItemID.Value   := tAuxITranItemID.Value;
          tITranTotal.Value    := tAuxITranTotal.Value -
                                  tAuxITranDesconto.Value - 
                                  tAuxITranPago.Value;
          tITranDesconto.Value := DuasCasas(tITranTotal.Value * PercDesc);
          Desc := Desc - tITranDesconto.Value;
          tITranPago.Value := tITranTotal.Value - tITranDesconto.Value;
          if not PgTotal then
          if Pago >= tITranPago.Value then 
            Pago := Pago - tITranPago.Value
          else begin
            tITranPago.Value := Pago;
            Pago := 0;
          end;
          tITranItemPos.Value := nItem;
          tITran.Post;

          if tITranDebito.Value>0 then begin
            tDebito.Insert;
            tDebitoTipo.Value := tITranTipoItem.Value;
            tDebitoID.Value := tITranItemID.Value;
            tDebitoValor.Value := tITranDebito.Value;
            tDebitoData.Value := tITranDataHora.Value;
            tDebitoCliente.Value := S.Cliente;
            tDebito.Post;
          end;

          if tITranPago.Value>0 then
          case tITranTipoItem.Value of
            itTempo     : 
            if tTempo.FindKey([tITranItemID.Value]) then begin
              tTempo.Edit;
              tTempoPagoPost.Value := tTempoPagoPost.Value + tITranPago.Value;
              tTempoDescPost.Value := tTempoDescPost.Value + tITranDesconto.Value;
              tTempo.Post;
            end;
            
            itImpressao : 
            if tImp.FindKey([tITranItemID.Value]) then begin
              tImp.Edit;
              tImpPagoPost.Value := tImpPagoPost.Value + tITranPago.Value;
              tImpDescPost.Value := tImpDescPost.Value + tITranDesconto.Value;
              tImp.Post;
            end;
            
            itMovEst    :  
            if tMovEst.FindKey([tITranItemID.Value]) then begin
              tMovEst.Edit;
              tMovEstPagoPost.Value := tMovEstPagoPost.Value + tITranPago.Value;
              tMovEstDescPost.Value := tMovEstDescPost.Value + tITranDesconto.Value;
              tMovEst.Post;
            end;

{            itSessao :
            if tSessao.FindKey([S.ID]) then begin
              tSessao.Edit;
              tSessaoPago.Value := tITranPago.Value;
              tSessaoDesconto.Value := tITranDesconto.Value;
              tSessao.Post;
            end;}

          end;
          
          tAuxITran.Next;
        end;
      end;
      tTran.Next;
    end;
  finally
    tTran.CancelRange;
    tITran.CancelRange;
    tTran.IndexName := 'IID';
    tITran.IndexName := 'IID';
  end;

  Inc(nItem);
  tITran.Insert;
  tITranTran.Value     := tTranID.Value;
  tITranTipoItem.Value := itSessao;
  tITranTipoTran.Value := trFimSessao;
  tITranDataHora.Value := tTranDataHora.Value;
  tITranCaixa.Value    := S.CaixaF;
  tITranItemID.Value   := S.ID;
  tITranTotal.Value    := S.Total;
  tITranDesconto.Value := Desc;
  if pgTotal then
    tITranPago.Value := tITranTotal.Value - tITranDesconto.Value else
    tITranPago.Value := Pago;
  tITranItemPos.Value  := nItem;
  tITranSessao.Value   := S.ID;
  tITran.Post;

  S.Pago := Pago;
  S.Desconto := Desc;
  
  if tITranDebito.Value>0 then begin
    tDebito.Insert;
    tDebitoTipo.Value := tITranTipoItem.Value;
    tDebitoID.Value := tITranItemID.Value;
    tDebitoValor.Value := tITranDebito.Value;
    tDebitoData.Value := tITranDataHora.Value;
    tDebitoCliente.Value := S.Cliente;
    tDebito.Post;
  end;
    
end;

function TDM.CriaMEPlusTran(aIDTran: String): TncMovEst;
begin
  if Pos('{', aIDTran)=0 then aIDTran := GuidStringFmt(aIDTran);

  if not tPT.FindKey([aIDTran]) then
    raise exception.Create('Transação Plus não encontrada - IDTran: '+aIDTran);

  Result := TncMovEst.Create;
  with Result do begin
    Operacao := osIncluir;
    plusID := tPTID.Value;
    Tipo := trEstVenda;
    NewIME._Operacao := osIncluir;
    Total    := tPTValor.Value;
    Pago     := tPTValor.Value;
    Descr := tPTDescr.Value;
    NomeCliente := tPTNomeCliente.Value;
    Cliente := tPTCliente.Value;
    Maq := tPTMaq.Value;
    Sessao := tPTSessao.Value;
    Operacao := osIncluir;
    with Itens[0] do begin
      imProduto := tPTIDProdutoNex.Value;
      imTipoTran := trEstVendaWeb;
      imUnitario := Total;
      imDesconto := Desconto;
      imPago := Pago;
      imQuant := 1;
      imTotal := Total;
      imSessao := tPTSessao.Value;
      imCliente := tPTCliente.Value;
      imNaoControlaEstoque := True;
    end;  
    SalvaTipoTran;
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  FidControl := TFidControl.Create(Self);
  FPass := TncPassaportes.Create;
  FSessoes := nil;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  FPass.Free;
end;

procedure TDM.DesativarFWSessao(S: TncSessao; aDesativar: Boolean);
begin
  InitTran([tSessao], True);
  try
    S.AtualizaCache;
    tSessao.Edit;
    tSessaoFiltrarWeb.Value := (not aDesativar);
    tSessaoMinTicksTotal.Value := S.TicksTotal;
    tSessaoMinTicksUsados.Value := S.TempoUsado.Ticks;
    tSessao.Post;
    nxDB.Commit;
    S.MinTicksUsados := tSessaoMinTicksUsados.Value;
    S.MinTicksTotal  := tSessaoMinTicksTotal.Value;
    S.FiltrarWeb := (not aDesativar);
    S.Notificar(tnAlteracao);
  except
    nxDB.Rollback;
    Raise;
  end;
end;

procedure TDM.DesktopSincronizado(S: TncSessao);
begin
  InitTran([tSessao], True);
  try
    S.AtualizaCache;
    tSessao.Edit;
    tSessaoDesktopSinc.Value := True;
    tSessaoMinTicksTotal.Value := S.TicksTotal;
    tSessaoMinTicksUsados.Value := S.TempoUsado.Ticks;
    tSessao.Post;
    nxDB.Commit;
    S.MinTicksUsados := tSessaoMinTicksUsados.Value;
    S.MinTicksTotal  := tSessaoMinTicksTotal.Value;
    S.DesktopSinc := True;
    S.Notificar(tnAlteracao);
  except
    nxDB.Rollback;
    Raise;
  end;
end;

function TDM.ExcluiIME(IM: TncItemMovEst; MEAnt, MEAtu: TncMovEst): Integer;
begin
  Result := 0;
  tMovEst.IndexName := 'IID';
  tITran.IndexName := 'IID';
  try
    if not tMovEst.FindKey([IM.imID]) then Exit;
    tDebito.IndexName := 'ITipoID';
    if tDebito.FindKey([itMovEst, IM.imID]) then
      tDebito.Delete;
    AjustaSaldoPost(IM.imProduto, IM.imDataHora, IM.imID, IM.imEstoqueAnt);
    tMovEst.Delete;
    if tITran.FindKey([IM.imITran]) then
      tITran.Delete;
  except
    on E: ENexCafe do begin
       DebugMsg('ExcluiIME ENexCafe: '+E.Message);
       Result := ncerrExcecaoNaoTratada_TDM_ExcluiIME;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TDM.FindTranPlus(aIDTran: String): Integer;
begin
  if Pos('{', aIDTran)=0 then aIDTran := GuidStringFmt(aIDTran);

  if not tPT.FindKey([aIDTran]) then
    raise exception.Create('Transação Plus não encontrada - IDTran: '+aIDTran);

  Result := tPTTranID.Value;  
end;

function TDM.FuncCaixaAberto: String;
begin
  tCaixa.Refresh;
  if tCaixa.FindKey([True]) then 
    Result := tCaixaUsuario.Value
  else
    Result := '';
end;

procedure TDM.GravaLog(Programa, Maq: Integer; Operacao: String);
var 
  Dif,
  HoraAnt, 
  HoraAtu : TDateTime;
  Dias : Integer;
  H, M, S, MS : Word;
  NewTran: Boolean;
begin
  if not Assigned(DM) then Exit;
  if not tLog.Active then Exit;
  
  NewTran := InitTran([tLog], True);
  try  
    tLog.SetRange([Programa, Maq], [Programa, Maq]);
    if tLog.Eof and tLog.Bof then 
      HoraAnt := 0
    else begin  
      tLog.Last;
      HoraAnt := tLogDiaHora.Value;
    end;
    
    HoraAtu := Now;

    tLog.Insert;
    tLogDiaHora.Value := HoraAtu;
    tLogMaquina.Value := Maq;
    tLogPrograma.Value := Programa;
    tLogOperacao.Value := Operacao;
  
    if (HoraAnt > 0) and (HoraAtu>HoraAnt) then 
      Dif := HoraAtu - HoraAnt
    else
      Dif := 0;
  
    Dias := Trunc(Dif);
    DecodeTime(Dif, H, M, S, MS);
       
    tLogHoras.Value := EncodeTime(H, M, S, MS);
    tLogDias.Value := Dias;
      
    tLog.Post;
    tLog.CancelRange;

    if NewTran then
      nxDB.Commit;
  except
    if NewTran then begin
      tLog.Cancel;
      nxDB.Rollback;
    end;  
  end;
end;  

function TDM.IncluiIME(IM: TncItemMovEst; ME: TncMovEst): Integer;
begin
  Result := 0;

  IM.imEstoqueAnt := ObtemSaldoAnt(IM.imProduto, IM.imDataHora, IM.imID);
  tMovEst.Insert;
  IM.imTran := ME.ID;
  IM.SaveToDataset(tMovEst);
  tMovEst.Post;
  IM.imID := tMovEstID.Value;

  tITran.Insert;
  IM.SaveToITranDataset(tITran);
  if ME.plusID>'' then
    tITranplusID.Value := ME.plusID else
    tITranplusID.Clear;
  tITran.Post;
  
  IM.imITran := tITranID.Value;
  tMovEst.Edit;
  tMovEstITran.Value := tITranID.Value;
  if ME.plusID>'' then
    tMovEstplusID.Value := ME.plusID else
    tMovEstplusID.Clear;
  tMovEst.Post;

  if (IM.Debito>0.00001) and (ME.ValorDebitado>0.00001) then begin
    tDebito.Insert;
    tDebitoData.Value := IM.imDataHora;
    tDebitoCliente.Value := IM.imCliente;
    tDebitoTipo.Value := itMovEst;
    tDebitoID.Value := IM.imID;
    tDebitoValor.Value := IM.Debito;
    tDebito.Post;
  end;
  
  if Trim(ME.plusID)='' then
  if tProduto.FindKey([IM.imProduto]) then begin

    if (ME.Tipo=trEstCompra) and (IM.UnitarioLiq>0) then begin
      tProduto.Edit;
      tProdutoCustoUnitario.Value := IM.UnitarioLiq;
      tProduto.Post;
    end;
    
    if (not tProdutoNaoControlaEstoque.Value) then
    if (AjustaSaldoPost(IM.imProduto, IM.imDataHora, IM.imID, IM.SaldoPost)<0) and
       gConfig.NaoVenderAlemEstoque and (IM.imTipoTran=trEstVenda) and (not IM.imPermSemEstoque) then 
    begin
      Result := ncerrProdutoSemSaldo;
      Exit;
    end;

  end;
end;

function TDM.InitTran(const aTables: array of TnxTable;
  aWith: Boolean): Boolean;
begin
  Result := DBInitTran(nxDB, aTables, aWith);
  if Result then
    FidControl.Clear;
end;

function TDM.LimiteDeb: Currency;
begin
  if tCliDebito.IsNull then
    Result := tConfigLimitePadraoDebito.Value else
    Result := tCliDebito.Value;
end;

function TDM.PassouLimiteDebito: Boolean;
begin
  if tCliLimiteDebito.IsNull then
    Result := (tCliDebito.Value>0.009) and (tCliDebito.Value >= gConfig.LimitePadraoDebito) else
    Result := (tCliDebito.Value>0.009) and (tCliDebito.Value >= tCliLimiteDebito.Value);
end;

procedure TDM.LoadCHorario(S: TncSessao);

procedure PodeTodos;
begin
  S.HP1 := High(Integer);
  S.HP2 := High(Integer);
  S.HP3 := High(Integer);
  S.HP4 := High(Integer);
  S.HP5 := High(Integer);
  S.HP6 := High(Integer);
  S.HP7 := High(Integer);
end;

begin
  case tCliOpCHorario.Value of
    opchCHorario : 
      if tCHora.FindKey([tCliCHorario.Value]) then begin
        S.HP1 := tCHoraHp1.Value;
        S.HP2 := tCHoraHp2.Value;
        S.HP3 := tCHoraHp3.Value;
        S.HP4 := tCHoraHp4.Value;
        S.HP5 := tCHoraHp5.Value;
        S.HP6 := tCHoraHp6.Value;
        S.HP7 := tCHoraHp7.Value;
      end else 
        PodeTodos;
        
    opchCensuraEsp : begin
      S.HP1 := tCliHP1.Value;
      S.HP2 := tCliHP2.Value;
      S.HP3 := tCliHP3.Value;
      S.HP4 := tCliHP4.Value;
      S.HP5 := tCliHP5.Value;
      S.HP6 := tCliHP6.Value;
      S.HP7 := tCliHP7.Value;
    end;    
    
  else
    PodeTodos;
  end;
end;

procedure TDM.LoadIDeb(Deb: TncDebito);
var SIndex: String;
begin
  Deb.Itens.Limpa;
  SIndex := tDebito.IndexName;
  try
    tDebito.IndexName := 'ICliData';
    tDebito.SetRange([Deb.Cliente], [Deb.Cliente]);
    while not tDebito.Eof do begin
      Deb.Itens.NewItem.LoadFromDebito(tDebito);
      tDebito.Next;
    end;
  finally
    tDebito.IndexName := SIndex;
    tDebito.CancelRange;
  end;
end;

procedure TDM.LoadIDebPagos(Deb: TncDebito);
var SIndex: String;
begin
  Deb.Itens.Limpa;
  SIndex := tITran.IndexName;
  try
    tITran.IndexName := 'ITranID';
    tITran.SetRange([Deb.ID], [Deb.ID]);
    
    while not tITran.Eof do begin
      Deb.Itens.NewItem.LoadFromITran(tITran);
      tITran.Next;
    end;
  finally
    tITran.IndexName := SIndex;
    tITran.CancelRange;
  end;
end;

procedure TDM.LoadIMEs(ME: TncMovEst);
var SIndex: String;
begin
  SIndex := tMovEst.IndexName;
  try
    tMovEst.IndexName := 'ITranItem';
    tMovEst.SetRange([ME.ID], [ME.ID]);
    ME.Itens.Limpa;
    while not tMovEst.Eof do begin
      with ME.Itens.NewItem do begin 
        LoadFromDataset(tMovEst);
        imObs := ME.Obs;
      end;
      tMovEst.Next;
    end;
  finally
    tMovEst.IndexName := SIndex;
    tMovEst.CancelRange;
  end;
end;

procedure TDM.LoadMsgCliList(aCliente: Integer; aList: TncMsgCliList);
begin
  aList.Clear;
  tMsgCli.IndexName := 'IClienteID';
  tMsgCli.SetRange([aCliente], [aCliente]);
  try
    while not tMsgCli.Eof do begin
      with aList.Add do begin
        ID := tMsgCliID.Value;
        Cliente := aCliente;
        Titulo := tMsgCliTitulo.Value;
        Texto := tMsgCliTexto.Value;
      end;
      tMsgCli.Next;
    end;
  
  finally
    tMsgCli.CancelRange;
  end;
end;

procedure TDM.CancelarPagEsp(aTranID: Integer);
begin
  try
    tPagEsp.SetRange([aTranID], [aTranID]);
    tPagEsp.First;
    while not tPagEsp.Eof do begin
      tPagEsp.Edit;
      tPagEspCancelado.Value := True;
      tPagEsp.Post;
      tPagEsp.Next;
    end;
  finally
    tPagEsp.CancelRange;
  end;
end;

procedure TDM.LoadPagEsp(aTranID: Integer; aPagEsp: TncPagEspecies);
begin
  try
    aPagEsp.Clear;
    tAuxTran.IndexName := 'IID';
    if tAuxTran.FindKey([aTranID]) then begin
      aPagEsp.CreditoAnt := tAuxTranCreditoAnt.Value;
      aPagEsp.DebitoAnt := tAuxTranDebitoAnt.Value;
      aPagEsp.Credito    := tAuxTranCredito.Value;
      aPagEsp.Debito    := tAuxTranDebito.Value;
      aPagEsp.CreditoUsado := tAuxTranCreditoUsado.Value;
      aPagEsp.DebitoPago := tAuxTranDebitoPago.Value;
    end;
    tPagEsp.IndexName := 'ITranID';
    tPagEsp.SetRange([aTranID], [aTranID]);
    tPagEsp.First;
    while not tPagEsp.Eof do begin
      with aPagEsp.NewItem do begin
        peEspecie := tPagEspEspecie.Value;
        peID := tPagEspID.Value;
        peTipo := tPagEspTipo.Value;
        peValor := tPagEspValor.Value;
        peTroco := tPagEspTroco.Value;
        peDoc := tPagEspDoc.Value;
      end;
      tPagEsp.Next;
    end;
  finally
    tPagEsp.CancelRange;
  end;
end;

procedure TDM.ModoManutencao(aMaq: Word; aUsername, aNomeFunc: String;
  aEntrar: Boolean; aNumCx: Integer; aSessao: TncSessao);
var I: Integer;  
begin
  InitTran([tTran, tITran, tCli, tSessao, tOcupacao], True);
  try
    if aEntrar then begin
      tSessao.Insert;
      tSessaoInicio.Value   := Now;
      tSessaoMaq.Value      := aMaq;
      tSessaoMaqI.Value     := aMaq;
      tSessaoEncerrou.Value := False;
      tSessaoTipoCli.Value  := tcManutencao;
      tSessaoFuncI.Value    := aUsername;
      tSessaoCaixaI.Value   := aNumCx;
      tSessaoTicksI.Value   := GetTickCount;
      tSessaoPermitirDownload.Value := True;
      tSessaoPermitirDownloadExe.Value := True;
      if aNomeFunc>'' then
        tSessaoNomeCliente.Value := aUsername else
        tSessaoNomeCliente.Value := aNomeFunc;
      tSessao.Post;

      tTran.Insert;
      tTranDataHora.Value    := tSessaoInicio.Value;
      tTranTipo.Value        := trInicioSessao;
      tTranFunc.Value        := aUsername;
      tTranCaixa.Value       := tSessaoCaixaI.Value;
      tTranMaq.Value         := aMaq;
      tTranSessao.Value      := tSessaoID.Value;
      tTranNomeCliente.Value := 'Funcionário';
      tTran.Post;

      tITran.Insert;
      tITranDataHora.Value := tSessaoInicio.Value;
      tITranTran.Value     := tTranID.Value;
      tITranCaixa.Value    := tSessaoCaixaI.Value;
      tITranTipoTran.Value := trInicioSessao;
      tITranTipoItem.Value := itSessao;
      tITranItemID.Value   := tSessaoID.Value;
      tITranItemPos.Value  := 1;
      tITran.Post;
    end else begin
      if not tSessao.FindKey([aSessao.ID]) then begin
        nxDB.Rollback;
        Exit;
      end;
      
      aSessao.CaixaF := aNumCx;
      aSessao.FinalizaSessao;
      aSessao.GeraOcupacao;

      for I := 0 to High(aSessao.ArrOcupacao^) do 
      with aSessao.ArrOcupacao^[I] do begin
        tOcupacao.Insert;
        tOcupacaoCliente.Value := aSessao.Cliente;
        tOcupacaoFunc.Value := aSessao.FuncI;
        tOcupacaoSessao.Value := aSessao.ID;
        tOcupacaoData.Value := eoData;
        tOcupacaoTipoCli.Value := tcManutencao;
        tOcupacaoHora.Value := eoHora;
        tOcupacaoMinutosU.Value := TicksToMinutos(eoTicksU);
        tOcupacaoMinutosP.Value := TicksToMinutos(eoTicksP);
        tOcupacaoMaq.Value := eoMaq;
        tOcupacaoCaixa.Value := eoCaixa;
        tOcupacao.Post;
      end;
  
      tSessao.Edit;
      tSessaoMinutosR.Value := TicksToMinutos(aSessao.TicksTotal);
      tSessaoTermino.Value  := Now;
      tSessaoCaixaF.Value   := aNumCx;
      tSessaoFuncF.Value    := aUsername;
      tSessaoEncerrou.Value := True;
      tSessao.Post;
      
      tTran.Insert;
      tTranDataHora.Value    := tSessaoTermino.Value;
      tTranTipo.Value        := trFimSessao;
      tTranFunc.Value        := tSessaoFuncI.Value;
      tTranCaixa.Value       := aNumCx;
      tTranMaq.Value         := aMaq;
      tTranSessao.Value      := aSessao.ID;
      tTranNomeCliente.Value := 'Funcionário';
      tTranDescr.Value       := MinutosToHMSStr(tSessaoMinutosR.Value);
      tTran.Post;

      tITran.Insert;
      tITranDataHora.Value := tSessaoTermino.Value;
      tITranTran.Value     := tTranID.Value;
      tITranCaixa.Value    := aNumCx;
      tITranTipoTran.Value := trFimSessao;
      tITranTipoItem.Value := itSessao;
      tITranItemID.Value   := tSessaoID.Value;
      tITranItemPos.Value  := 1;
      tITran.Post;

      aSessao.Free;
    end;
        
    nxDB.Commit;
  except
    tSessao.Cancel;
    tTran.Cancel;
    tITran.Cancel;
    nxDB.Rollback;
    Raise;
  end;    
end;

function TDM.NumCaixaAberto: Integer;
begin
  tCaixa.Refresh;
  if tCaixa.FindKey([True]) then 
    Result := tCaixaID.Value
  else
    Result := 0;  
end;

procedure TDM.ObtemDadosCotas(aCliente: Integer; J: TncJob);
var 
  D, M, A, aDia : Word;
  Q : Integer;
  sIndex: String;
  MaxData : TDateTime;
begin
  tCli.IndexName := 'IID';
  if gConfig.PMCotasPorCli and tCli.FindKey([aCliente]) and tCliCotaImpEspecial.Value then begin
    J.MaxImpDia := tCliCotaImpDia.Value;
    J.MaxImpMes := tCliCotaImpMes.Value;
  end else begin
    J.MaxImpDia := gConfig.PMCotasMaxPagDia;
    J.MaxImpMes := gConfig.PMCotasMaxPagMes;
  end;
  
  sIndex := tImp.IndexName;
  try
    tImp.IndexName := 'IClienteDataHora';
    DecodeDate(J.DataHora, A, M, aDia);
    MaxData := EncodeDate(A, M, DaysInAMonth(A, M))+1;
    
    tImp.SetRange([aCliente, EncodeDate(A, M, 1)], [aCliente, MaxData]);
    tImp.First;
    J.ImpMes := 0;
    J.ImpDia := 0;
    while not tImp.Eof do begin
      if tImpDataHora.Value<MaxData then begin
        Q := tImpQ1.Value +
             tImpQ2.Value +
             tImpQ3.Value +
             tImpQ4.Value +
             tImpQ5.Value +
             tImpQ6.Value +
             tImpQ7.Value +
             tImpQ8.Value +
             tImpQ9.Value;
        J.ImpMes := J.ImpMes + Q;
        DecodeDate(tImpDataHora.Value, A, M, D);
        if D=aDia then
          J.ImpDia := J.ImpDia + Q;
      end;
      tImp.Next;
    end;
  finally
    tImp.CancelRange;
    tImp.IndexName := sIndex;
  end;

end;

function TDM.ObtemPatrocinios(SL : TStrings): String;
begin
  Result := '';
  tPatro.First;
  while not tPatro.Eof do begin
    SL.Add(
      tPatroNome.Value+chFldDelim+
      tPatroURLArea1.Value+chFldDelim+
      tPatroURLArea2.Value+chFldDelim+
      ListaToStr(tPatroDominiosPerm.Value));
    tPatro.Next;
  end;
end;

function TDM.ObtemSaldoAnt(aProduto: Integer; aDH: TDateTime;
  aID: Integer): Double;
begin
  tAuxME.IndexName := 'IProduto';
  try
    tAuxME.SetRange([aProduto], [aProduto, aDH, pred(aID)]);
    if tAuxME.IsEmpty then
      Result := 0
    else begin
      tAuxME.Last;
      Result := tAuxMESaldoPost.Value;
    end;
  finally
    tAuxME.CancelRange;
  end;
end;

function TDM.ObtemSitesBloqueados: String;
begin
  Result := '';
  tFW.First;
  while not tFW.Eof do begin
    if Result>'' then
      Result := Result + sLineBreak;
    Result := Result + '127.0.0.1       ' + tFWURL.Value;
    tFW.Next;
  end;
end;

procedure TDM.ObtemValorMinMaxImp(var aMin, aMax: Currency);
begin
  aMin := 0;
  aMax := 0;
  tTipoImp.First;
  while not tTipoImp.Eof do begin
    if (aMin=0) or (tTipoImpValor.Value<aMin) then aMin := tTipoImpValor.Value;
    if (aMax=0) or (tTipoImpValor.Value>aMax) then aMax := tTipoImpValor.Value;
    tTipoImp.Next;
  end;
end;

procedure TDM.Open(aChecaFmtTabs: Boolean = False);
var I : Integer;
begin
  nxDB.AliasPath := '';
  nxDB.AliasName := 'NexCafe';
  nxSession.Username := SessionUser;
  nxSession.Password := SessionPass;
  nxSession.Active := True;
  nxDB.Active := True;
  if aChecaFmtTabs then
    ncTableDefs.BuildAndEvolveDatabase(nxDB);
  for I := 0 to nxDB.DataSetCount-1 do 
    if nxDB.Datasets[I]<>qAux then
      nxDB.DataSets[I].Active := True;
end;

procedure TDM.PausarSessao(S: TncSessao; aPausar: Boolean);
begin
  debugmsg('Pausar 1');
  InitTran([tSessao], True);
  try
    DebugMsg('Pausar 2');
    S.AtualizaCache;
    DebugMsg('Pausar 3');
    tSessao.Edit;
    DebugMsg('Pausar 4');
    tSessaoMinTicksUsados.Value := S.TempoUsado.Ticks;
    DebugMsg('Pausar 5');
    tSessaoMinTicksTotal.Value := S.TicksTotal;
    DebugMsg('Pausar 6');
    if aPausar then 
      S.Pausar else
      S.Despausar;
    DebugMsg('Pausar 7');
    tSessaoPausado.Value := S.Pausado;  
    DebugMsg('Pausar 8');
    tSessaoInicioPausa.Value := S.InicioPausa;
    DebugMsg('Pausar 9');
    tSessaoStrPausas.Value := S.Pausas.AsString;
    DebugMsg('Pausar 10');
    tSessao.Post;
    DebugMsg('Pausar 11');
    nxDB.Commit;
    DebugMsg('Pausar 12');
    S.MinTicksUsados := tSessaoMinTicksUsados.Value;
    DebugMsg('Pausar 13');
    S.MinTicksTotal  := tSessaoMinTicksTotal.Value;
    DebugMsg('Pausar 14');
    S.Notificar(tnAlteracao);
    DebugMsg('Pausar 15');
  except
    on E: Exception do begin
      DebugMsg('PausarSessao - Exception: ' + E.Message);
      nxDB.Rollback;
      Raise;
    end;
  end;
end;

procedure TDM.PermitirDownload(S: TncSessao; aExe, aPermitir: Boolean);
begin
  InitTran([tSessao], True);
  try
    S.AtualizaCache;
    tSessao.Edit;
    if aExe then 
      tSessaoPermitirDownloadExe.Value := aPermitir else
      tSessaoPermitirDownload.Value := aPermitir;
    tSessaoMinTicksTotal.Value := S.TicksTotal;
    tSessaoMinTicksUsados.Value := S.TempoUsado.Ticks;
    tSessao.Post;
    nxDB.Commit;
    S.MinTicksUsados := tSessaoMinTicksUsados.Value;
    S.MinTicksTotal  := tSessaoMinTicksTotal.Value;
    if aExe then
      S.PermitirDownloadExe := aPermitir else
      S.PermitirDownload := aPermitir;
    S.Notificar(tnAlteracao);
  except
    nxDB.Rollback;
    Raise;
  end;
end;

function TDM.PodeAlterarTran(aID: Integer): Boolean;
var SIndex: String;
begin
  Result := False;
  tTran.IndexName := 'IID';
  if not tTran.FindKey([aID]) then Exit;
  if tTranCancelado.Value then Exit;
  SIndex := tITran.IndexName;
  tITran.IndexName := 'ITranID';
  tITran.SetRange([aID], [aID]);
  try
    tAuxITran.IndexName := 'ITipoItemTran';
    while not tITran.Eof do begin
      tAuxITran.SetRange([tITranTipoItem.Value, tITranItemID.Value, aID+1],
                         [tITranTipoItem.Value, tITranItemID.Value, High(Integer)]);
      while not tAuxITran.Eof do begin
        if not tAuxITranCancelado.Value then Exit;
        tAuxITran.Next;
      end;                        
      tITran.Next;
    end;
  finally
    tITran.CancelRange;
    tITran.IndexName := SIndex;
    tAuxITran.IndexName := 'IID';
    tAuxITran.CancelRange;
  end;
  
  Result := True;  
end;

procedure TDM.PremiarCli(aCliente: Integer);
var 
  CT : TncCredTempo;
  NumCx : Integer;
  AumentouDeb : Boolean;
  S: TncSessao;

begin
  try
    if not tCli.FindKey([aCliente]) then Exit;

    while gConfig.FidAtivo and 
          gConfig.FidAutoPremiar and
          (not tCliSemFidelidade.Value) and
          (tCliFidPontos.Value>=gConfig.FidPontosPremioAuto) do
    begin
      InitTran([tConfig, tCaixa, tMsgCli, tCli, tTempo, tTipoPass, tPacote, tPassaporte, tTran, tSessao, tITran, tEsp], False);
      try
        NumCX := NumCaixaAberto;
        if NumCx<1 then Exit;

        CT := TncCredTempo.Create;
        try
          CT.teDataHora := Now;
          CT.teFunc      := '_auto_';
{          case gConfig.FidTipoPremioAuto of
            tpaPacote : begin
              CT.teTipo := tctPacote;
              if not tPacote.FindKey([gConfig.FidPremioAuto]) then Exit;
              CT.teMinutos := tPacoteMinutos.Value;
              CT.teIDPacPass := tPacoteID.Value;
              CT.teNome := tPacoteDescr.Value;
              CT.teTipoAcesso := -1;
            end;  
            tpaPassaporte: begin  }
              CT.teTipo := tctPassaporte;
              if not tTipoPass.FindKey([gConfig.FidPremioAuto]) then Exit;
              CT.teMinutos := (tTipoPassMaxSegundos.Value/60);
              CT.teIDPacPass := tTipoPassID.Value;
              CT.teNome := tTipoPassNome.Value;
              CT.teTipoAcesso := tTipoPassTipoAcesso.Value;
 //           end;  
//          else
//            Exit;  
//          end;
          
          CT.teCliente   := tCliID.Value;
          CT.teCancelado := False;
          CT.teObs       := 'Prêmio concedido automaticamente';
          CT.teFidResgate := True;
          CT.teFidPontos  := gConfig.FidPontosPremioAuto;
          CT._Operacao := osIncluir;

          SalvaCredTempo(CT, AumentouDeb);

          if gConfig.FidMsg and ((Trim(gConfig.FidMsgTitulo)>'') or (Trim(gConfig.FidMsgTexto)>'')) then
            AddMsgCli(CT.teCliente, CT.teTran, gConfig.FidMsgTitulo, gConfig.FidMsgTexto);

        finally
          CT.Free;
        end;
        nxDB.Commit;
      finally
        if nxDB.InTransaction then nxDB.Rollback;
      end;
    end;      

    if FSessoes<>nil then begin
      S := FSessoes.PorCliente[aCliente];
      if S<>nil then begin
        S.AtualizaCache;
        RefreshSessao(S);
        S.Notificar(tnAlteracao);
      end;
    end;
  except
  end;
end;

function TDM.ProcessaPlus: Boolean;
var 
  SL : TStringList;
  I : Integer;
begin
  Result := False;
  
  SL := TStringList.Create;
  try
    tPT.IndexName := 'ITranIDOK';
    tPT.SetRange([null], [null]);
    try
      tPT.First;
      while not tPT.Eof do begin
        SL.Add(tPTID.Value);
        tPT.Next;  
      end;
    finally
      tPT.CancelRange;
    end;

    tPT.IndexName := 'IID';

    for I := 0 to SL.Count-1 do
    if tPT.FindKey([SL[I]]) then begin
      if tPTOK.Value then
        ProcessaVendaPlus 
      else begin
        tPT.Edit;
        tPTTranID.Value := 0;
        tPT.Post;
      end;
    end;

    tPT.IndexName := 'ITranIDOK';

    Result := not tPT.FindKey([null]);
    
  finally
    SL.Free;
  end;
  Result := True;
end;

procedure TDM.ProcessaVendaPlus;
var 
  ME : TncMovEst;
  S  : TncSessao;
begin
  ME := TncMovEst.Create;
  try
    ME.DataHora := tPTDataHoraNex.Value;
    ME.Operacao := osIncluir;
    ME.Cliente := tPTCliente.Value;
    ME.Total := tPTValor.Value;
    ME.Obs := tPTObs.Value;
    ME.Maq := tPTMaq.Value;
    ME.Sessao := tPTSessao.Value;
    ME.Tipo := trEstVenda;
    ME.Pago := ME.Total;
    ME.Func := tPTFunc.Value;
    ME.Descr := tPTDescr.Value;
    ME.Operacao := osIncluir;
    with ME.NewIME do begin
      imSessao := ME.Sessao;
      imTipoTran := trEstVenda;
      imProduto := tPTIDProdutoNex.Value;
      imQuant := 1;
      imUnitario := tPTValor.value;
      imTotal := tPTValor.Value;
      imPago := imTotal;
      imDataHora := tPTDataHoraNex.Value;
      imCliente := ME.Cliente;
      imSessao := ME.Sessao;
      imNaoControlaEstoque := True;
      imFidResgate := False;
      imFidPontos := 0;
      _Operacao := osIncluir;
    end;
    if (SalvaMovEstCustom(ME, True, False)=0) and (ME.Sessao>0) then begin
      S := FSessoes.PorID[ME.Sessao];
      if S<>nil then RefreshSessao(S);
    end;
  finally
    ME.Free;
  end;    
end;

type
  TTerminoSessao = record
    tsTermino : TDateTime;
    tsSessao  : Integer;
    tsMaq     : Integer;
  end;


procedure TDM.RecalcPass;
var 
  M: Double;
  I: integer;
  Hora : TDateTime;
begin
  inherited;
  ncAuxPassaporte.LePassaportesCliSessao(tPassaporte, nil, tTipoPass, -1, tCliID.Value, 0, FPass);
  M := 0;
  if tSessaoCli.FindKey([False, tCliID.Value]) then
    Hora := tSessaoCliInicio.Value else
    Hora := Now;

  for I := 0 to FPass.Count - 1 do with FPass[I] do 
  if ExpirarEm(Hora)>=Hora then 
    M := M + ObtemMinutosRestantes;
    
  tCli.Edit;
  tCliPassaportes.Value := M;  
  tCli.Post;
end;

procedure TDM.RecriaDebitos;
var 
  CodProd: Integer;
  ME : TncMovEst;

procedure ObtemProd;
begin
  if CodProd<>-1 then Exit;
  ME := TncMovEst.Create;
  ME.Tipo := trEstVenda;
  ME.DataHora := Now;
  if not tProduto.Locate('Descricao', 'Debito Antigo', [loCaseInsensitive]) then begin
    tProduto.Insert;
    tProdutoDescricao.Value := 'Debito Antigo';
    tProdutoCodigo.Value := 'debito';
    tProdutoPodeAlterarPreco.Value := True;
    tProdutoNaoControlaEstoque.Value := True;
    tProduto.Post;
  end;
  CodProd := tProdutoID.Value;
end;

begin
  ME := nil;
  CodProd := -1;

  tCli.First;
  while not tCli.Eof do begin
    if tCliDebito.Value>0.009 then begin
      ObtemProd;
      ME.Itens.Limpa;
      ME.Cliente := tCliID.Value;
      with Me.Itens.NewItem do begin
        imQuant := 1;
        imUnitario := tCliDebito.Value;
        imProduto := CodProd;
        imTotal := imUnitario;
        imItem := 1;
        imDataHora := Now;
        imTipoTran := trEstVenda;
        imCliente := tCliID.Value;
        imCaixa := -2;
        imNaoControlaEstoque := True;
        _Operacao := osIncluir;
      end;
      ME.Total := tCliDebito.Value;
      ME.Caixa := -2;
      ME.Tipo := trEstVenda;
      ME.ID := -1;
      ME.Operacao := osIncluir;
      ME.Obs := 'Lançados automaticamente na conversão de programa';
      Self.SalvaMovEst(ME, True);
    end;
    tCli.Next;
  end;
  if ME<>nil then ME.Free;
end;

procedure TDM.RefreshCHSessoes(aID: Integer);
var 
  S : TncSessao;
  I : Integer;
begin
  if not tCHora.FindKey([aID]) then Exit;
  for I := 0 to FSessoes.Count-1 do begin
    S := FSessoes.Itens[I];
    if (S.Cliente>0) and tCli.FindKey([S.Cliente]) and (tCliCHorario.Value=aID) and (tCliOpCHorario.Value=opchCHorario) then
    begin
      if tSessao.FindKey([aID]) then begin
        tSessao.Edit;
        tSessaoHP1.Value := tCHoraHP1.Value;
        tSessaoHP2.Value := tCHoraHP2.Value;
        tSessaoHP3.Value := tCHoraHP3.Value;
        tSessaoHP4.Value := tCHoraHP4.Value;
        tSessaoHP5.Value := tCHoraHP5.Value;
        tSessaoHP6.Value := tCHoraHP6.Value;
        tSessaoHP7.Value := tCHoraHP7.Value;
        tSessao.Post;
      end;
      S.AtualizaCache;
      S.HP1 := tCHoraHP1.Value;
      S.HP2 := tCHoraHP2.Value;
      S.HP3 := tCHoraHP3.Value;
      S.HP4 := tCHoraHP4.Value;
      S.HP5 := tCHoraHP5.Value;
      S.HP6 := tCHoraHP6.Value;
      S.HP7 := tCHoraHP7.Value;
      S.Notificar(tnAlteracao);
    end;
  end;
  
end;

procedure TDM.RefreshDebitoCliente;
var 
  SIndex: String;
  T : Currency;
begin
  SIndex := tDebito.IndexName;
  try
    tDebito.IndexName := 'ICliData';
    tDebito.SetRange([tCliID.Value], [tCliID.Value]);
    try
      T := 0;
      while not tDebito.Eof do begin
        T := T + tDebitoValor.Value;
        tDebito.Next;
      end;
      tCli.Edit;
      tCliDebito.Value := T;
      tCli.Post;
    finally
      tDebito.CancelRange;
    end;
  finally
    tDebito.IndexName := SIndex;
  end;

end;

procedure TDM.RefreshEspera(Sessoes: TncSessoes; Maquinas: TncListaMaquinas);
var 
  A : Array of TTerminoSessao;
  aTerm : TDateTime;
  I, T, k, m: Integer;
  NewTran: Boolean;
  ML : Array of Word;
  ProxM: Word;
  S: String;
  
function AMenorQueB(DataA, DataB: TDateTime): Boolean;
var SA, SB: String;
begin
  SA := FormatDateTime('yyyymmdd hh:mm:ss', DataA);
  SB := FormatDateTime('yyyymmdd hh:mm:ss', DataB);
  Result := (SA < SB);
end;

procedure _MoveUp(aPos: Integer);
var j: Integer;
begin
  for j := T-1 downto aPos+1 do A[j] := A[j-1];
end;


function AddPos: Integer;
var ii: Integer;
begin
  for ii := 0 to T-2 do
  if aTerm < A[ii].tsTermino then begin
    Result := ii;
    Exit;
  end;
  Result := T-1;
end;

procedure DeleteML(Index: Integer);
var i: integer;
begin
  for i := Index to High(ML)-1 do 
    ML[i] := ML[i+1];
  SetLength(ML, Length(ML)-1);  
end;

function GetNextML(Pref: Word): Word;
var I: Integer;
begin
  Result := 0;
  if Pref>0 then
  for I := 0 to High(ML) do
  if ML[I]=Pref then begin
    Result := Pref;
    DeleteML(I);
    Exit;
  end;

  if Length(ML)>0 then begin
    Result := ML[0];
    DeleteML(0);
  end;   
end;
    
begin
  tEsp.Refresh;
  if tEsp.IsEmpty then Exit;
  
  SetLength(A, 0);
  T := 0;
  for I := 0 to Sessoes.Count - 1 do with Sessoes[I], Tarifador do
  if CreditoTotal.Ticks>0 then begin
    aTerm := Inicio + TicksToDateTime(Pausas.TicksTotal + TempoMaximo.Ticks);
    S := 'Inicio = ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Inicio);
    S := S + ' Term = ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', aTerm);
    if S = 'dlkdd' then 
      ShowMessage(S);
    
    Inc(T);
    SetLength(A, T);
    k := AddPos;
    if k<(T-1) then 
      _MoveUp(k);
    A[k].tsTermino := aTerm;
    A[k].tsSessao := ID;
    A[k].tsMaq := Maq;
  end;
  
  NewTran := InitTran([tEsp], True);
  try
    tEsp.First;
    k := 0;
    SetLength(ML, 0);
    for m := 0 to Maquinas.Count - 1 do
    if not Maquinas[m].EmManutencao then
    if (Sessoes.PorMaq[Maquinas[m].Numero]=nil) then begin
      Inc(k);
      SetLength(ML, k);
      ML[k-1] := Maquinas[m].Numero;
    end;
    k := 0;
      
    if not tEsp.Eof then
    repeat
      ProxM := GetNextML(tEspPrevMaq.Value);
      if ProxM>0 then begin
        Inc(k);
        tEsp.Edit;
        tEspPos.Value := k;
        tEspPrevisao.Value := Now;
        tEspPrevMaq.Value := ProxM;
        tEspPrevSessao.Value := 0;
        tEsp.Post;
        tEsp.Next;
      end;
    until (ProxM=0) or tEsp.Eof;
    
    I := 0;
    while (T>0) and (not tEsp.Eof) do begin
      Inc(k);
      tEsp.Edit;
      tEspPos.Value := k;
      tEspPrevisao.Value := A[I].tsTermino;
      tEspPrevMaq.Value := A[I].tsMaq;
      tEspPrevSessao.Value := A[I].tsSessao;
      tEsp.Post;
      Inc(I);
      Dec(T);
      tEsp.Next;
    end;

    while not tEsp.Eof do begin
      Inc(k);
      tEsp.Edit;
      tEspPos.Value := k;
      tEspPrevisao.Clear;
      tEspPrevMaq.Clear;
      tEspPrevSessao.Clear;
      tEsp.Post;
      tEsp.Next;
    end;

    if NewTran then nxDB.Commit;
    
  except
    if NewTran then nxDB.Rollback;
    Raise;
  end;
end;

procedure TDM.RefreshImpSessao(aSessao: TncSessao);
var SIndex : String;
begin
  try
    SIndex := tImp.IndexName;
    tImp.IndexName := 'ISessaoID';
    try
      aSessao.Impressoes.Limpa;
      tImp.SetRange([aSessao.ID], [aSessao.ID]);
      tImp.First;
      while not tImp.Eof do begin
        with aSessao.Impressoes.NewItem do begin
          LoadFromDataset(tImp);
          LoadPagEsp(tImpTran.Value, impPagEsp);
        end;
        tImp.Next;
      end;
    finally
      tImp.IndexName := SIndex;
      tImp.CancelRange;
    end;
  except
    on E: ENexCafe do begin
      DebugMsgEsp('TDM.RefreshImpSessao - E.Message = ' + E.Message, False, True);
      raise;
    end;

  end;
end;

procedure TDM.RefreshPassSessao(aSessao: TncSessao);
begin
  try
    LePassaportesCliSessao(tPassaporte, tHPass, tTipoPass, aSessao.TipoAcesso, aSessao.Cliente, aSessao.ID, aSessao.Passaportes);
    if aSessao.Cliente>0 then
      LoadMsgCliList(aSessao.Cliente, aSessao.MsgCliList);
  except
    on E: ENexCafe do begin
      DebugMsgEsp('TDM.RefreshPassSessao - E.Message = ' + E.Message, False, True);
      Raise;
    end;
  end;
end;

procedure TDM.RefreshPontosPremioAuto;
begin
  gConfig.FidPontosPremioAuto := 0;
  if not gConfig.FidAutoPremiar then Exit;
  if gConfig.FidPremioAuto=0 then Exit;
//  case gConfig.FidTipoPremioAuto of
{   tpaProduto : 
      if tProduto.FindKey([gConfig.FidPremioAuto]) and tProdutoFidelidade.Value then
        gConfig.FidPontosPremioAuto := tProdutoFidPontos.Value;}

{    tpaPacote :
      if tPacote.FindKey([gConfig.FidPremioAuto]) and tPacoteFidelidade.Value then
        gConfig.FidPontosPremioAuto := tPacoteFidPontos.Value;}

//    tpaPassaporte :
      if tTipoPass.FindKey([gConfig.FidPremioAuto]) and tTipoPassFidelidade.Value then
        gConfig.FidPontosPremioAuto := tTipoPassFidPontos.Value;
//  end;
end;

type
  TCorQuant = record
    cqCor : Integer;
    cqQuant : Integer;
  end;
  
function CorMaisUsada(HC: TncHoraTarifa): Integer;
var
  A : Array of TCorQuant;
  Ind, H, Dia : Integer;
  
function IndiceCor(C: Integer): Integer;
var I: Integer;
begin
  for I := 0 to High(A) do 
    if A[I].cqCor=C then begin
      Result := I;
      Exit;
    end;
  I := Length(A);  
  SetLength(A, I+1);
  A[I].cqCor := C;
  A[I].cqQuant := 0;
end;

begin
  SetLength(A, 0);
  for Dia := 1 to 7 do
    for H := 0 to 23 do begin
      if (HC[Dia, H]<>0) and (HC[Dia, H]<>clWhite) and (HC[Dia, H]<>clSilver) then begin
        Ind := IndiceCor(HC[Dia, H]);
        A[Ind].cqQuant := A[Ind].cqQuant + 1;
      end;
    end;
    
  Result := -1;
  for Ind := 0 to High(A) do 
    if (Result=-1) or (A[Ind].cqQuant>A[Result].cqQuant) then
      Result := Ind;
  if Result=-1 then
    Result := 0 else
    Result := A[Result].cqCor;
end;

procedure TDM.RefreshPrecos;
var 
  H, Dia, I : Integer;
  HC : TncHoraTarifa;
  S: String;
  CorPadrao : Integer;
begin
  InitTran([tTipoAcesso, tHTar, tTarifa, tETar, tConfig, tTipoPass], True);
  try
    
    tHTar.Refresh;
    tTarifa.Refresh;
    tETar.Refresh;

    RefreshTarifas;

{    while not tPacote.IsEmpty do begin
      tTipoPass.Append;
      tTipoPassNome.Value := tPacoteDescr.Value;
      tTipoPassTipoExp.Value := teNunca;
      tTipoPassValor.Value := tPacoteValor.Value;
      tTipoPassMaxSegundos.Value := tPacoteMinutos.Value * 60;
      tTipoPassDia1.Value := High(Integer);
      tTipoPassDia2.Value := High(Integer);
      tTipoPassDia3.Value := High(Integer);
      tTipoPassDia4.Value := High(Integer);
      tTipoPassDia5.Value := High(Integer);
      tTipoPassDia6.Value := High(Integer);
      tTipoPassDia7.Value := High(Integer);
      tTipoPassFidelidade.Value := tPacoteFidelidade.Value;
      tTipoPassFidPontos.Value := tPacoteFidPontos.Value;
      tTipoPass.Post;

      if tPacoteFidelidade.Value and 
         (gConfig.FidTipoPremioAuto=tpaPac) and
         (gConfig.FidPremioAuto=tPacoteID.Value) then 
      begin
        gConfig.AtualizaCache;
        gConfig.FidTipoPremioAuto := tpaPassaporte;
        gConfig.FidPremioAuto := tTipoPassID.Value;
        tConfig.Edit;
        gConfig.SalvaDataset(tConfig);
        tConfig.Post;
        gConfig.Notificar(tnAlteracao);
      end;
      
      tPacote.Delete;
    end;    }

    if tTipoAcesso.IsEmpty then begin
      tTipoAcesso.Append;
      tTipoAcessoNome.Value := 'Internet e Jogos';
      tTipoAcessoID.Value := 0;
      tTipoAcesso.Post;
    end;

    tTarifa.IndexName := 'IPrim';
    tTipoAcesso.First;
    while not tTipoAcesso.Eof do begin
      if tTipoAcessoTarifaPadrao.IsNull then begin
        FillChar(HC, SizeOf(HC), 0);
        for Dia := 1 to 7 do
        for H := 0 to 23 do begin
          if tHTar.FindKey([tTipoAcessoID.Value, Dia, H]) and  tTarifa.FindKey([tTipoAcessoID.Value, tHTarCor.Value]) 
          then 
            HC[Dia, H] := tHTarCor.Value else
            HC[Dia, H] := 0;  
        end;  
        SetLength(S, SizeOf(HC));
        Move(HC, S[1], SizeOf(HC));
        tTipoAcesso.Edit;
        tTipoAcessoHoraTarifaStr.Value := S;
        tTipoAcessoTarifaPadrao.Value := CorMaisUsada(HC);
        tTipoAcesso.Post;
      end;
      tTipoAcesso.Next;
    end;

    tTarifa.IndexName := 'ICor';

    if gTarifas.PorCor[gConfig.TarifaPadrao]=nil then begin
      tTipoAcesso.First;
      while not tTipoAcesso.Eof do begin
        if gTarifas.PorCor[tTipoAcessoTarifaPadrao.Value]<>nil then begin
          gConfig.AtualizaCache;
          gConfig.TarifaPadrao := tTipoAcessoTarifaPadrao.Value;
          tConfig.Edit;
          gConfig.SalvaDataset(tConfig);
          tConfig.Post;
          gConfig.Notificar(tnAlteracao);
          Break;
        end;
        tTipoAcesso.Next;
      end;
    end;
    
    tTipoAcesso.First;
    gTiposAcesso.Limpa;
    gTiposAcesso.LeDataset(tTipoAcesso);

    nxDB.Commit;
  except
    nxDB.Rollback;
    Raise;
  end;  
end;

procedure TDM.RefreshSessao(aSessao: TncSessao);
begin
  RefreshTranSessao(aSessao);
  RefreshPassSessao(aSessao);
  RefreshImpSessao(aSessao);
  RefreshVendasSessao(aSessao);
  RefreshTemposSessao(aSessao);

  tCli.IndexName := 'IID';
  tTran.IndexName := 'IID';

  if (aSessao.TranF>0) then 
    LoadPagEsp(aSessao.TranF, aSessao.PagEsp);

  if (aSessao.Cliente>0) then begin
    if tCli.FindKey([aSessao.Cliente]) then begin
      tCli.Refresh;
      if tCliMinutos.Value>0 then
        aSessao.MinutosCli := tCliMinutos.Value else
        aSessao.MinutosCli := 0;
          
      if tCliValorCred.Value>0 then
        aSessao.ValorCli := tCliValorCred.Value else
        aSessao.ValorCli := 0;
      aSessao.Sexo := tCliSexo.Value;
      aSessao.DataNasc := tCliDataNasc.Value;  
         
      aSessao.SenhaLogin := tCliSenha.Value;
      aSessao.UsernameLogin := tCliUsername.Value;
      LoadCHorario(aSessao);
      aSessao.DebitoCli := tCliDebito.Value;
      if tCliSemFidelidade.Value then
        aSessao.PontosCli := 0 else
        aSessao.PontosCli := tCliFidPontos.Value;
        
      if aSessao.Encerrou then
        aSessao.MinutosCli := aSessao.MinutosCli + 
                              aSessao.Tempos.TotCredTempoValido.Minutos;
    end else begin
      DebugMsg('TDM.RefreshSessao - Falha localizando cliente ID: ' + IntToStr(aSessao.Cliente));
      raise ENexCafe.Create('Falha localizando cliente ID: ' + IntToStr(aSessao.Cliente));
    end;
  end else begin
    aSessao.CalcMinutosCli;
    aSessao.DataNasc := 0;
    aSessao.Sexo := '';
  end;

  if (aSessao.NomeCliente > '') and (not tNomes.IsEmpty) then begin
    tNomes.FindNearest([SemAcento(FirstWord(aSessao.NomeCliente))]);
    aSessao.Sexo := tNomesSexo.Value;
  end;
    
    
  if not aSessao.Encerrou then
    aSessao.Tarifador.Reset;
end;

procedure TDM.ImportarTarifas;
var 
  I, N : Integer;
  A : TncArrayEtapas;
  SubEtapa : Cardinal;
  T, TA, T2 : Cardinal;
  S : String;
  MenorValor, V: Currency;
begin
  tTarifa.First;
  while not tTarifa.Eof do begin
    if tTarifaPrecosStr.Value='' then
    begin
      tETar.SetRange([tTarifaTipoAcesso.Value, tTarifaCor.Value], 
                     [tTarifaTipoAcesso.Value, tTarifaCor.Value]);
      try               
        tETar.First;
        SetLength(A, 0);
        N := 0;
        MenorValor := 0;
        while not tETar.Eof do begin
          if (MenorValor=0) or (tETarValorMin.Value<MenorValor) then
            MenorValor := tETarValorMin.Value;
            
          TA := 0;
            
          T := DateTimeToTicks(tETarTempo.Value);
          if tEtarValor.Value<0.00001 then begin
            Inc(N);
            SetLength(A, N);
            A[N-1].etTempo := T-TA;
            A[N-1].etValor := 0;
            TA := TA + A[N-1].etTempo;
          end else begin
            SubEtapa := Trunc ( (tETarValorMin.Value / tETarValor.Value ) * T);

            V := 0;
            while (tETarValor.Value - V)>0.000001 do begin
              V := V + tETarValorMin.Value;
              Inc(N);
              SetLength(A, N);
              A[N-1].etTempo := Trunc( Int((V/tETarValor.Value) * T)) - TA;
              T2 := A[N-1].etTempo mod 1000;
              
              if (T2>0) and (T2<=10) then 
                A[N-1].etTempo := A[N-1].etTempo - T2 
              else
              if T2>990 then
                A[N-1].etTempo := A[N-1].etTempo + (1000-T2);
              
              A[N-1].etValor := tETarValorMin.Value;
              TA := TA + A[N-1].etTempo;
            end;
          end;
          tETar.Next;
        end;
//        tETar.DeleteRecords;
        if N>0 then begin
          N := Length(A) * SizeOf(TncEtapa);
          SetLength(S, N);
          Move(A[0], S[1], N);
        end;  
        
        tTarifa.Edit;
        tTarifaDivTipo.Value := tdtPorValor;
        tTarifaPrecosStr.Value := S;
        if (MenorValor>0) and (Abs(Frac(MenorValor / 0.05))<0.0000001) then begin
          tTarifaDivQtd.Value := Trunc(MenorValor / 0.05) ;
          tTarifaArredondar.Value := 5;
        end else begin
          tTarifaDivQtd.Value := 0;
          tTarifaDivQtd.Value := 1;
        end;
        tTarifa.Post;

      finally
        tETar.CancelRange;
      end;
    end;
    
    tTarifa.Next;
  end;
  gTarifas.Limpa;
  gTarifas.LeDataset(tTarifa);
end;

procedure TDM.RefreshTarifas;
var I, N : Integer;
begin
  ImportarTarifas;
  Exit;
  
  gTarifas.Limpa;
  gTarifas.LeDataset(tTarifa);

  for I := 0 to pred(gTarifas.Count) do 
  with tETar, gTarifas[I] do begin
    SetRange([TipoAcesso, Cor], [TipoAcesso, Cor]);
    SetLength(PPrecos^, tETar.RecordCount);
    try
      N := 0;
      First;
      while not Eof do with PPrecos^[N] do begin
        etTempo := DateTimeToTicks(tEtarTempo.Value);
        etValor := tETarValor.Value;
{        etValorMin := tETarValorMin.Value;
        etTolerancia := DateTimeToTicks(tETarTolerancia.Value);}
        Next;
        Inc(N);
      end;
      PrecosStr := PrecosStr;
      LimpaCache;
      Notificar(tnAlteracao);
    finally
      CancelRange;
    end;
  end;  
  if N=23423423 then
    gTarifas.Limpa;
end;

procedure TDM.RefreshTemposSessao(aSessao: TncSessao);
var SIndex : String;
begin
  try
    SIndex := tTempo.IndexName;
    tTempo.IndexName := 'ISessaoID';
    tTempo.SetRange([aSessao.ID], [aSessao.ID]);
    try
      aSessao.Tempos.Limpa;
      while not tTempo.Eof do begin
        aSessao.Tempos.NewItem.LoadFromDataset(tTempo);
        tTempo.Next;
      end;
      aSessao.CalcMinutosCli;
    finally
      tTempo.IndexName := SIndex;
      tTempo.CancelRange;
    end;
  except
    on E: ENexCafe do begin
      DebugMsgEsp('TDM.RefreshTemposSessao - E.Message: ' + E.Message, False, True);
      raise;
    end;
  end;
end;

procedure TDM.RefreshTranSessao(aSessao: TncSessao);
var SIndex : String;
begin
  try
    SIndex := tTran.IndexName;
    tTran.IndexName := 'ISessao';
    tTran.SetRange([aSessao.ID], [aSessao.ID]);
    try
      aSessao.Transacoes.Limpa;
      while not tTran.Eof do begin
        if tTranTipo.Value = trFimSessao then
          aSessao.ObsFim := tTranObs.Value;
        aSessao.Transacoes.NewTran.LoadFromDataset(tTran);
        tTran.Next;
      end;
    finally
      tTran.IndexName := SIndex;
      tTran.CancelRange;
    end;
  except  
    on E: ENexCafe do begin
      DebugMsgEsp('TDM.RefreshTranSessao - E.Message: ' + E.Message, False, True);
      raise;
    end;
  end;
end;

procedure TDM.RefreshVendasSessao(aSessao: TncSessao);
var 
  SIndex : String;
  IME : TncItemMovEst;
  V : Variant;
begin
  try
    SIndex := tMovEst.IndexName;
    tMovEst.IndexName := 'ISessaoID';
    try
      aSessao.Vendas.Limpa;
      tMovEst.SetRange([aSessao.ID], [aSessao.ID]);
      tMovEst.First;
      while not tMovEst.Eof do begin
        IME := aSessao.Vendas.NewItem;
        IME.LoadFromDataset(tMovEst);
        V := tTran.Lookup('ID', tMovEstTran.Value, 'Obs');
        if V<>null then IME.imObs := V;
        tMovEst.Next;
      end;
    finally
      tMovEst.IndexName := SIndex;
      tMovEst.CancelRange;
    end;
  except
    on E: ENexCafe do begin
      DebugMsgEsp('TDM.RefreshVendasSessao - E.Message: ' + E.Message, False, True);
      raise;
    end;
  end;
end;

function TDM.RemoveMsgCliByID(aID: Integer; var aCliente: Integer): Boolean;
begin
  tMsgCli.IndexName := 'IID';
  if tMsgCli.FindKey([aID]) then begin
    aCliente := tMsgCliCliente.Value;
    tMsgCli.Delete;
    Result := True;
  end else
    Result := False;
end;

function TDM.RemoveMsgCliByRef(aRef: Integer): Boolean;
begin
  tMsgCli.IndexName := 'IRef';
  if tMsgCli.FindKey([aRef]) then begin
    tMsgCli.Delete;
    Result := True;
  end else
    Result := False;
end;

procedure TDM.ReprocessaDebitos;
begin
  qAux.Active := False;
  qAux.SQL.Text := 'update cliente c set debito = (select sum(valor) from debito d where c.id = d.cliente)';
  qAux.ExecSQL;
  qAux.Active := False;
end;

procedure TDM.ReprocessaEstoque;
begin
  tProduto.First;
  while not tProduto.Eof do begin
    if tProdutoNaoControlaEstoque.Value then begin
      tProduto.Edit;
      tProdutoEstoqueAtual.Clear;
      tProduto.Post;
    end else
      AjustaSaldoPost(tProdutoID.Value, 0, 0, 0);
    tProduto.Next;
  end;
end;

procedure TDM.RetotalizaPassaportes;
begin
  tCli.First;
  while not tCli.Eof do begin
    RecalcPass;
    tCli.Next;
  end;
end;

procedure TDM.SalvaArqFundo(aDesktop: Boolean; aNomeArq: String; aConfig: TncConfig);
var S, SAnt: String;
const
  BoolStr : Array[Boolean] of String = ('False', 'True');
begin
  InitTran([tConfig], True);
  try
    DebugMsg('TDM.SalvaArqFundo - aDesktop: ' + BoolStr[aDesktop] + ' - aNomeArq: ' + aNomeArq);
    if aDesktop then begin
      SAnt := aConfig.NomeArqDesktop;
      aConfig.AtualizaCache;
      aConfig.NumFDesktop := aConfig.NumFDesktop + 1;
      aConfig.TipoFDesktop := 'JPG';
      tConfig.Edit;
      tConfigNumFDesktop.Value:= aConfig.NumFDesktop;
      tConfigTipoFDesktop.Value := 'JPG';
      tConfig.Post;
      S := aConfig.NomeArqDesktop;
      TThreadRename.Create(S, aNomeArq);
      if (SAnt<>'') and FileExists(SAnt) then begin
        DebugMsg('TDM.SalvaArqFundo - SAnt: ' + SAnt + ' - TThreadRename.Create');
        TThreadRename.Create(SAnt, '');
      end else
        DebugMsg('TDM.SalvaArqFundo - SAnt: ' + SAnt + ' - NAO EXISTE');
    end else begin
      SAnt := aConfig.NomeArqLogin;
      S := Copy(ExtractFileExt(aNomeArq), 2, 3);
      DebugMsg('TDM.SalvaArqFundo - LOGIN - Extensao: ' + S + ' - NomeArq: ' + aNomeArq);
      aConfig.AtualizaCache;
      aConfig.NumFLogin := aConfig.NumFLogin + 1;
      aConfig.TipoFLogin := S;
      tConfig.Edit;
      aConfig.FundoWeb := False;
      tConfigFundoWeb.Value := False;
      tConfigNumFLogin.Value := aConfig.NumFLogin;
      tConfigTipoFLogin.Value := S;
      tConfig.Post;

      DebugMsg('TDM.SalvaArqFundo - LOGIN - Extensao: ' + S + ' - NomeArq: ' + aNomeArq + ' - Novo Nome: ' + aConfig.NomeArqLogin);

      S := aConfig.NomeArqLogin;
      TThreadRename.Create(S, aNomeArq);
      if (SAnt<>'') and FileExists(SAnt) then begin
        DebugMsg('TDM.SalvaArqFundo - SAnt: ' + SAnt + ' - TThreadRename.Create');
        TThreadRename.Create(SAnt, '');
      end else
        DebugMsg('TDM.SalvaArqFundo - SAnt: ' + SAnt + ' - NAO EXISTE');
    end;
    nxDB.Commit;
    aConfig.Notificar(tnAlteracao);
  except
    on E: ENexCafe do begin
      DebugMsg('TDM.SalvaArqFundo - ENexCafe: ' + E.Message);
      tConfig.Cancel;
      nxDB.Rollback;
      raise;
    end;
  end;
end;

procedure TDM.SalvaConfig(C: TncConfig);
var NewTran: Boolean;
begin
  NewTran := InitTran([tConfig, tProduto, tPacote, tTipoPass], True);
  try
    if tConfig.RecordCount>0 then begin
      tConfig.First;
      tConfig.Edit;
    end else
      tConfig.Insert;  
    C.SalvaDataset(tConfig);
    tConfig.Post;
    RefreshPontosPremioAuto;
    if NewTran then nxDB.Commit;
  except
    tConfig.Cancel;
    if NewTran then nxDB.Rollback;
    Raise;
  end;    
end;

procedure TDM.SalvaConfigPB(P: TmsgPubPar);
var NewTran: Boolean;
begin
{$ifdef LOJA}
   if P.AllNull then Exit;
{$endif}

  NewTran := InitTran([tConfig], True);
  try
    if tConfig.RecordCount>0 then begin
      tConfig.First;
      tConfig.Edit;
    end else
      tConfig.Insert;  

    if P.pbBRT<>null then
      tConfigBRT.Value := P.pbBRT;

    if P.pbHPOpenBef <> null then
      tConfigHPOpenBef.Value := P.pbHPOpenBef;

    if P.pbExCookie <> null then
      tConfigExCookie.Value := P.pbExCookie;  

    if P.pbHPUrl <> null then 
      tConfigHomePage_URL.Value := P.pbHPUrl;

    if P.pbTbUrl <> null then
      tConfigToolbar_Url.Value := P.pbTbUrl;

    if P.pbHPTab <> null then 
      tConfigHomePage_Tab.Value := P.pbHPTab; 

    if P.pbSkyUrl<>null then
      tConfigSky_Url.Value := P.pbSkyUrl;  

    if P.pbBotoes<>null then
      tConfigBotoes.Value := P.pbBotoes;

    if P.pbBanners<>null then
      tConfigBanners.Value := P.pbBanners;

    if P.pbDTol<>null then
      tConfigDTol.Value := P.pbDTol; 

    if P.pbAlertaAss<>null then
      tConfigAlertaAssinatura.Value := P.pbAlertaAss;

    if P.pbDVA<>null then
      tConfigDVA.Value := P.pbDVA;

    if P.pbPreLib<>null then
      tConfigPreLib.Value := P.pbPreLib;

    tConfigHomePage_LastUrl.Value := gConfig.HomePage_LastURL;
      
    tConfig.Post;
    if NewTran then nxDB.Commit;
  except
    tConfig.Cancel;
    if NewTran then nxDB.Rollback;
    Raise;
  end;
end;

function SemEspaco(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if S[I] <> #32 then
      Result := Result + S[I];
end;

function TDM.SalvaLancExtra(aLE: TncLancExtra): Integer;
var NumCx: Integer;

procedure _CancelAndRollback;
begin
  if nxDB.InTransaction then begin
    nxDB.Rollback;
    tTran.Cancel;
    tCaixa.Cancel;
  end;
end;

begin
  Result := 0;
  InitTran([tTran, tCaixa], True);
  try
    NumCx := NumCaixaAberto;
    if NumCx=0 then begin
      Result := ncerrCaixaFechado;
      Exit;
    end;

    if aLE.ID=-1 then begin
      aLE.Caixa := NumCx;
      aLE.DataHora := Now;
      tTran.Insert;
    end else begin
      if not tTran.Locate('ID', aLE.ID, []) then begin
        Result := ncerrItemInexistente;
        Exit;
      end;

      if (tTranCaixa.Value <> NumCx) or (aLE.Caixa <> NumCx) then begin 
        Result := ncErros.ncerrCaixaDiferente;
        Exit;
      end;
      tTran.Edit;
    end;
    aLE.SalvaDataset(tTran);
    if aLE.ID=-1 then tTranID.Clear;
    tTran.Post;
   nxDB.Commit;
  finally
    _CancelAndRollback;
  end;
end;

procedure TDM.SalvaLogAppUrl(L: TncAppUrlLog; aMaquinas: TncListaMaquinas;
  aSessoes: TncSessoes);
var 
  S: TncSessao;
  M: TncMaquina;
  I, numM: Integer;
  UrlID : Integer;
  Str : String;
  Atualizou : Boolean;

  AI : TncAppInfo;
  SI : TncSearchInfo;
  UI : TncURLInfo;
begin
  for I := 0 to L.Count - 1 do with L[I] do begin
    numM := logMaq;
    DebugMsg('TDM.SalvaLogAppUrl - Maq: '+IntToStr(numM));
    M := aMaquinas.PorNumero[numM];
    if M<>nil then begin
      M.AtualizaCache;
      ExtractAppInfo(L[I].logExe, L[I].logTit, AI);
      M.SiteAtual := logURL;
      M.ProgramaAtual := logTit;
      M.ExeAtual := logExe;
      M.Notificar(tnAlteracao);
      ExtractURLInfo(logURL, UI);
      Str := UI.uiHost;
      if pos('http://', Str) = 1 then
        Delete(Str, 1, 7);
      if pos('www.', Str) = 1 then
        Delete(Str, 1, 4);
      
      if tFW.FindKey([Str]) or tFW.FindKey(['www.'+Str])  then
      begin
        DebugMsg('TDM.SalvaLogAppUrl - Site Bloqueado - Str: ' + Str);
        EnviaSiteBloq(CliNotifyHandle, True, Str);
      end;
    end;
  end;  
end;

{

procedure TDM.SalvaLogAppUrl(L: TncAppUrlLog; aMaquinas: TncListaMaquinas;
  aSessoes: TncSessoes);
var 
  S: TncSessao;
  M: TncMaquina;
  I: Integer;
  UrlID : Integer;
  Str : String;
  Atualizou : Boolean;

  AI : TncAppInfo;
  SI : TncSearchInfo;
  UI : TncURLInfo;

procedure SalvaNom(aID, aNom, aType: String);
begin
  if (aID>'') and (aNom>'') then
  if not tLNom.FindKey([aID]) then begin
    tLNom.Insert;
    tLNomID.Value := aID;
    tLNomNome.Value := aNom;
    tLNomType.Value := aType;
    tLNom.Post;
  end;
end;

begin
  InitTran([tLApp, tLUrl, tLNom], True);
  try
    Atualizou := False;
    tLApp.IndexName := 'IID';
    for I := 0 to L.Count - 1 do with L[I] do begin
      M := aMaquinas.PorNumero[logMaq];
      S := aSessoes.PorID[logSessao];
      if (not Atualizou) and (I=0) and (M<>nil) then begin
        Atualizou := True;
        M.AtualizaCache;
      end;
      ExtractAppInfo(L[I].logExe, L[I].logTit, AI);

      if (M<>nil) and ((M.SiteAtual<>logUrl) or (M.ProgramaAtual<>logTit) or (M.ExeAtual<>logExe))  then begin
        if (M.AppLog>0) and tLApp.FindKey([M.AppLog]) then begin
          tLApp.Edit;
          tLAppFim.Value := logDH;
          tLAppMinutos.Value := (logDH - tLAppInicio.Value) * 24 * 60;
          tLApp.Post;
          
          tLUrl.IndexName := 'IID';
          if (tLAppUrl.Value>0) and tLUrl.FindKey([tLAppUrl.Value]) then begin
            tLUrl.Edit;
            tLUrlViewTime.Value := tLUrlViewTime.Value + tLAppMinutos.Value;
            tLUrl.Post;
          end;
        end;

        M.SiteAtual := logURL;
        M.ProgramaAtual := logTit;
        M.ExeAtual := logExe;

        if (S<>nil) and ((logExe>'') or (logUrl>'') or (logTit>'')) then begin
          tLApp.Insert;

          tLAppSessao.Value := S.ID;
          tLAppCliente.Value := S.Cliente;
          tLAppInicio.Value := logDH;
          tLAppExe.Value := AI.aiExeID;
          tLAppTitulo.Value := AI.aiTitID;
          tLAppCaminho.Value := AI.aiPathID;
          tLAppMaq.Value := logMaq;

          SalvaNom(AI.aiExeID, AI.aiExe, ntExe);
          SalvaNom(AI.aiPathID, AI.aiPath, ntCaminho);
          SalvaNom(AI.aiTitID, AI.aiTit, ntTitulo);

          if (logURL>'') then begin
            ExtractURLInfo(logUrl, UI);
            ExtractSearchInfo(UI.uiDominio, UI.uiPagina, SI);
            tLUrl.IndexName := 'ISessaoHostPagina';
            if not tLUrl.FindKey([S.ID, UI.uiHostID, UI.uiPaginaID]) then begin
              tLUrl.Insert;
              tLUrlSessao.Value := S.ID;
              tLUrlCliente.Value := S.Cliente;
              tLUrlMaq.Value := logMaq;
              tLUrlFirstView.Value := logDH;
              tLUrlHost.Value := UI.uiHostID;
              tLUrlPagina.Value := UI.uiPaginaID;
              tLUrlDominio.Value := UI.uiDominioID;
              tLUrlSearchArg.Value := SI.siArgID;
              tLUrlSearchEng.Value := SI.siEng;
              tLUrl.Post;
              SalvaNom(UI.uiHostID, UI.uiHost, ntHost);
              SalvaNom(UI.uiDominioID, UI.uiDominio, ntDominio);
              SalvaNom(UI.uiPaginaID, UI.uiPagina, ntPagina);
              SalvaNom(SI.siArgID, SI.siArg, ntSearchArg);
            end;
            tLAppUrl.Value := tLUrlID.Value;
          end;
          tLApp.Post;
          
          M.AppLog := tLAppID.Value;
        end else begin
          M.AppLog := 0;
          M.SiteAtual := '';
          M.ProgramaAtual := '';
          M.ExeAtual := '';
        end;
      end;
    end;
    nxDB.Commit;

    if M<>nil then begin
      M.LimpaCache;
      M.Notificar(tnAlteracao);
    end;
    
  finally
    if nxDB.InTransaction then nxDB.Rollback;
  end;  
end;
 }

function TDM.SalvaLoginMaq(S: TncSessao; Sessoes: TncSessoes; aFunc: String; Config: TncConfig): Integer;
var 
  I: Integer;
  AumentouDeb, PermiteLSC: Boolean;
  NumCx : Integer;
  str: String;

procedure CancelAndRollback;
begin
  if nxDB.InTransaction then begin
    tTran.Cancel;
    tTempo.Cancel;
    tCli.Cancel;
    tITran.Cancel;
    tSessao.Cancel;
    tPassaporte.Cancel;
    tHPass.Cancel;
    tProduto.Cancel;
    tMovEst.Cancel;
    tDebito.Cancel;
    tCaixa.Cancel;
    tEsp.Cancel;
    nxDB.Rollback;
  end;  
end;

begin
  Result := 0;
  InitTran([tTran, tTempo, tEsp, tCli, tITran, tTipoPass, tSessao, tPassaporte, tHPass, tDebito, tCaixa], True);
  try
    try
      NumCx := NumCaixaAberto;
      if NumCx=0 then begin
        Result := ncerrCaixaFechado;
        Exit;
      end;
      
      tSessao.Insert;
      tSessao.Post;
      S.ID := tSessaoID.Value;
      S.IniciaSessao;
      S.MaqI := S.Maq;
      S.FiltrarWEB := gConfig.FiltrarWeb;
      S.Sexo := '';
      S.DataNasc := 0;

      S.PermitirDownload := not Config.BloqDownload; 
      S.PermitirDownloadExe := not Config.BloqDownloadExe;

      if S.Cliente > 0 then begin
        if not tCli.Locate('ID', S.Cliente, []) then begin
          Result := ncerrInfoLoginInvalida;
          Exit;
        end;

        LoadCHorario(S);

        with tCliTipoAcessoPref do 
        if (Value>=0) and (gTiposAcesso.ItemPorChave[Value]<>nil) then
          S.TipoAcesso := Value;

        S.NomeCliente := tCliNome.Value;
        if tCliIsento.Value then
          S.TipoCli := tcCliGratis else
          S.TipoCli := tcNormal;

        S.DebitoCli := tCliDebito.Value;  
        if tCliSemFidelidade.Value then
          S.PontosCli := 0 else
          S.PontosCli := tCliFidPontos.Value;
          
        S.MinutosCli := tCliMinutos.Value;
        S.ValorCli := tCliValorCred.Value;
          
        LePassaportesCliSessao(tPassaporte, nil, tTipoPass, S.TipoAcesso, S.Cliente, S.ID, S.Passaportes);
      end else
      if S.UsernameLogin='nexanon' then begin
        if S.SenhaLogin <> ')(*&^!@#$%' then begin
          Result := ncerrInfoLoginInvalida;
          Exit;
        end;
      end else  
      if S.UsernameLogin='PREPAGO' then begin
        if (Trim(S.SenhaLogin)='') or (not tPassaporte.Locate('Senha', S.SenhaLogin, [loCaseInsensitive])) then begin
          Result := ncerrInfoLoginInvalida;
          Exit;
        end;
        if Sessoes.PassaporteEmUso(tPassaporteID.Value) then begin
          Result := ncerrPassaporteEmUso;
          Exit;
        end;

        
        S.Passaportes.NewPassaporte.LoadFromDataset(tPassaporte);

        tHPass.Insert;
        tHPassPassaporte.Value := tPassaporteID.Value;
        tHPassSessao.Value := tSessaoID.Value;
        tHPassDataHora.Value := Now;
        tHPass.Post;

        S.CartaoTempo := True;
        
        S.Tarifador.TipoCalc := tcTempoCred;
        if S.Tarifador.CreditoTotal.Ticks < MinCreditoLoginMS then begin
          Result := ncerrSemCreditoDisp;
          Exit;
        end;

        if (S.IDListaEspera=0) and tEsp.Locate('Cartao', S.SenhaLogin, []) then
          S.IDListaEspera := tEspID.Value;
          
      end else begin
        tCli.Refresh;
        if not tCli.Locate('Username', S.UsernameLogin, [loCaseInsensitive]) then begin
          Result := ncerrInfoLoginInvalida;
          Exit;
        end;

        tCli.IndexName := 'IID';

        if (tCliSenha.Value>'') and (not SameText(S.SenhaLogin, tCliSenha.Value)) then begin
          Result := ncerrSenhaInvalida;
          Exit;
        end;

        if (Copy(S.NomeCliente, 1, 4)='@RG@') and Config.ExigirRG then begin
          S.NomeCliente := Copy(S.NomeCliente, 5, 300);
          if SemEspaco(tCliRG.Value)='' then begin
            Result := ncerrRGNaoCadastrado;
            Exit;
          end;
              
          if UpperCase(SemEspaco(S.NomeCliente)) <> UpperCase(SemEspaco(tCliRG.Value)) then begin
            Result := ncerrRGErrado;
            Exit;
          end;
        end;    
            
        with tCliTipoAcessoPref do 
        if (Value>=0) and (gTiposAcesso.PorCodigo[Value]<>nil) then
          S.TipoAcesso := Value;

        if tCliIsento.Value then
          S.TipoCli := tcCliGratis else
          S.TipoCli := tcNormal;
          
        S.Cliente := tCliID.Value;
        S.DebitoCli := tCliDebito.Value;

        if tCliSemFidelidade.Value then
          S.PontosCli := 0 else
          S.PontosCli := tCliFidPontos.Value;

        if S.TipoCli=tcNormal then begin
          S.MinutosCli := tCliMInutos.Value;
          S.ValorCli := tCliValorCred.Value;
          LePassaportesCliSessao(tPassaporte, nil, tTipoPass, S.TipoAcesso, S.Cliente, 0, S.Passaportes);
          S.Tarifador.TipoCalc  := tcTempoCred;
          S.Tarifador.Reset;
          if gConfig.AlteraLoginSemCred then
            PermiteLSC := (gConfig.PermiteLoginSemCred and tCliPermiteLoginSemCred.IsNull) or tCliPermiteLoginSemCred.Value else
            PermiteLSC := gConfig.PermiteLoginSemCred;
          if (not PermiteLSC) and
             (S.Tarifador.CreditoTotal.Ticks < MinCreditoLoginMS) then 
          begin
            Result := ncerrSemCreditoDisp;
            Exit;
          end;
        end;

        LoadCHorario(S);

        S.NomeCliente := tCliNome.Value;
      end;
  
      if S.Cliente>0 then begin
        tCli.Edit;
        tCliUltVisita.Value := Now;
        tCli.Post;

        if not gConfig.DadosMinOk(tCli) then begin
          Result := ncErros.ncerrCliSemDadosMinimos;
          Exit;
        end;
        
        RecalcPass;
        S.Sexo := tCliSexo.Value;
        if tCliDataNasc.IsNull then
          S.Datanasc := 0 else
          S.DataNasc := tCliDataNasc.Value;
          
        if tCliInativo.Value then begin
          Result := ncerrClienteInativo;
          Exit;
        end;
      
        for I := 0 to pred(Sessoes.Count) do with Sessoes[I] do 
        if (ID<>S.ID) and (Cliente=S.Cliente) then begin
          Result := ncerrClienteJaAtivo;
          Exit;
        end;
        S.UsernameLogin := tCliUsername.Value;
        S.SenhaLogin := tCliSenha.Value;
        S.DebitoCli := tCliDebito.Value;

        if tCliSemFidelidade.Value then
          S.PontosCli := 0 else
          S.PontosCli := tCliFidPontos.Value;

        if S.LimiteHP.Ticks=0 then begin
          Result := ncerrHorarioNaoPermitido;
          Exit;
        end;

        if gConfig.BloquearLoginAlemMaxDeb and PassouLimiteDebito then begin
          Result := ncerrLoginNaoPermitidoLimDeb;
          Exit;
        end;
      end else
      if gConfig.BloqueiaCliAvulso then begin
        Result := ncerrLoginAvulsoNaoPerm;
        Exit;
      end;

      tEsp.CancelRange;
      tEsp.Refresh;
      
      
      if (S.Cliente>0) and (S.IDListaEspera<=0) and tEsp.Locate('Cliente', S.Cliente, []) then
        S.IDListaEspera := tEspID.Value;


      if (S.IDListaEspera<>-1) then 
      if tEsp.Locate('PrevMaq', S.Maq, []) then
      if (S.IDListaEspera <> tEspID.Value) then begin
        Result := ncerrMaqReservada;
        Exit;
      end;

      if (S.NomeCliente > '') and (not tNomes.IsEmpty) then begin
        tNomes.FindNearest([SemAcento(FirstWord(S.NomeCliente))]);
        S.Sexo := lowercase(tNomesSexo.Value);
      end;
      
      if Copy(S.NomeCliente, 1, 4)='@RG@' then
        S.NomeCliente := '';
          
      S.CaixaI := NumCx;
      tSessao.Edit;
      tTran.Insert;
      tTranMaq.Value := S.Maq;
      tTranDataHora.Value := S.Inicio;
      tTranCliente.Value := S.Cliente;
      tTranTipo.Value := trInicioSessao;
      tTranCaixa.Value := S.CaixaI;
      tTranFunc.Value := S.FuncI;
      tTranSessao.Value := S.ID;
      tTranNomeCliente.Value := S.NomeCliente;
      tTran.Post;
      S.TranI := tTranID.Value;
      S.SalvaDataset(tSessao);
      tSessao.Post;

      if (S.IDListaEspera>0) and tEsp.FindKey([S.IDListaEspera]) then
        tEsp.Delete;
      
      tITran.Insert;
      tITranDataHora.Value := S.Inicio;
      tITranTran.Value     := S.TranI;
      tITranCaixa.Value    := S.CaixaI;
      tITranTipoTran.Value := trInicioSessao;
      tITranTipoItem.Value := itSessao;
      tITranItemID.Value   := S.iD;
      tITranItemPos.Value  := 1;
      tITranSessao.Value   := S.ID;
      tITran.Post;

      for I := 0 to S.Tempos.Count-1 do begin
        S.Tempos[I].teSessao := S.ID;
        S.Tempos[I]._Operacao :=osIncluir;
        S.Tempos[I].teCliente := S.Cliente;
        SalvaCredTempo(S.Tempos[I], AumentouDeb);
      end;

      RefreshSessao(S);

      FidControl.CanCommit;
      nxDB.Commit;

      Result := 0;
    except
      CancelAndRollback;
      Raise;
    end;
  finally
    CancelAndRollback;
  end;
  
end;

function TDM.SalvaLogoutMaq(S: TncSessao; Config: TncConfig; aFunc: String): Integer;
var NC: Integer;

procedure CancelAndRollback;
begin
  if nxDB.InTransaction then begin
    tTran.Cancel;
    tTempo.Cancel;
    tCli.Cancel;
    tITran.Cancel;
    tSessao.Cancel;
    tPassaporte.Cancel;
    tHPass.Cancel;
    tProduto.Cancel;
    tMovEst.Cancel;
    tDebito.Cancel;
    tCaixa.Cancel;
    nxDB.Rollback;
  end;  
end;
  
begin
  Result := 0;
  InitTran([tTran, tTempo, tCli, tITran, tSessao, tOcupacao, tPassaporte, tHPass, tDebito, tCaixa, tLApp, tLUrl], True);
  try
    try
      S.FinalizaSessao;

      if S.Cliente>0 then RecalcPass;

      if (S.Cliente>0) and (S.TipoCli<>tcCliGratis) then begin
        tCli.Edit;
            
        with tCliMinutosUsados do 
        if Config.PacoteTempoReal then 
          Value := Value + S.TempoUsado.Minutos else
          Value := Value + S.TempoCobrado.Minutos;
              
        with tCliMinutos do 
        if S.MinutosCli>0 then 
          Value := Value - S.Tarifador.CredTempoUsado.Minutos;

        with tCliValorCred do
        if S.ValorCliU>0 then
          Value := Value - S.Tarifador.CredValorUsado; 

        if tCliNaoGuardarCredito.Value then begin
          tCliMinutos.Value := 0;
          tCliValorCred.Value := 0;
        end;
          
        tCli.Post;
      end;  

      NC := NumCaixaAberto;
      tLApp.IndexName := 'ISessaoID';
      tLApp.SetRange([S.ID], [S.ID]);
      try
        tLApp.First;
        while not tLApp.Eof do begin
          tLApp.Edit;
          tLAppCaixa.Value := NC;
          tLApp.Post;
          tLApp.Next;
        end;
      finally
        tLApp.CancelRange;
      end;

      tLUrl.IndexName := 'ISessaoHostPagina';
      tLUrl.SetRange([S.ID], [S.ID]);
      try
        tLUrl.First;
        while not tLUrl.Eof do begin
          tLUrl.Edit;
          tLUrlCaixa.Value := NC;
          tLUrl.Post;
          tLUrl.Next;
        end;
      finally
        tLUrl.CancelRange;
      end;
      
  
      if S.TotalGeral>0.0001 then 
        S.CaixaF := 0 else
        S.CaixaF := NC;
    
      tSessao.Edit;
      S.FuncF  := aFunc;
          
      if S.CaixaF>0 then begin 
        Result := CriaITranLogout(S, aFunc);
        if Result <> 0 then Exit;
      end;

      S.IncVersaoRegistro;
      S.LimpaCache;
      S.SalvaDataset(tSessao);
      tSessao.Post;

      SalvaPassaportesUsados(tPassaporte, tHPass, S.ID, S.Inicio, S.Passaportes, (S.Cliente>0) and tCliNaoGuardarCredito.Value);

      if S.Cliente>0 then RecalcPass;
    
      nxDB.Commit;
      
      if S.CaixaF>0 then
        S.Free
      else begin  
        S.LimpaCache;
        S.Notificar(tnAlteracao);
      end;
    except
      CancelAndRollback; 
      Raise;
    end;
  finally
    CancelAndRollback;
  end;
end;

procedure TDM.SalvaMaq(M: TncMaquina);
var 
  NewTran: Boolean;
begin
  NewTran := InitTran([tMaq], True);
  try
    tMaq.IndexName := 'INumero';
    if tMaq.FindKey([M.Numero]) then 
      tMaq.Edit else
      tMaq.Insert;
    M.SalvaDataset(tMaq);  
    DebugMsg('TDM.SalvaMaq - M.ComputerName: '+M.ComputerName);
    tMaqComputerName.Value := M.ComputerName;
    tMaqMacAddress.Value := M.MacAddress;
    tMaq.Post;
    if NewTran then nxDB.Commit;
  except
    tMaq.Cancel;
    if NewTran then nxDB.Rollback;
    Raise;
  end;
end;

function TDM.SalvaMovEst(ME: TncMovEst; const aIgnoraCaixa: Boolean = False): Integer;
begin
  Result := SalvaMovEstCustom(ME, False, aIgnoraCaixa);
end;

function TDM.SalvaMovEstCustom(ME: TncMovEst; aPlus: Boolean; const aIgnoraCaixa: Boolean = False): Integer;
var 
  NumCx, I: Integer;
  MEAnt : TncMovEst;
  NewTran : Boolean;
  Debitar : Currency;
  V: Variant;
  S: String;
begin
  Result := 0;
  Debitar := 0;
  MEAnt := nil;
  NewTran := InitTran([tTran, tPT, tDebito, tITran, tMovEst, tAuxME, tCli, tCaixa, tSessao, tProduto, tPagEsp], True);
  try
    try
      NumCx := NumCaixaAberto;
  
      if (NumCx=0) and (not aIgnoraCaixa) and (not ME.PodeSalvarSemCaixa) then begin
        Result := ncerrCaixaFechado;
        Exit;
      end;

      tTran.IndexName := 'IID';

      if (not ME.PagPend) and (ME.CaixaPag=0) then 
        ME.CaixaPag := NumCx;

      if ME.Operacao=osIncluir then begin
        if aIgnoraCaixa then
          ME.Caixa := -2 else
          ME.Caixa := NumCx;
        ME.DataHora := Now;
        ME.SalvaTipoTran;
        for I := 0 to ME.Itens.Count - 1 do begin
          ME.Itens[I]._Operacao := osIncluir;
          ME.Itens[I].imTipoTran := ME.Tipo;
        end;
        tTran.Insert;
      end else
      if not tTran.FindKey([ME.ID]) then  begin
        Result := ncerrItemInexistente;
        Exit;
      end else begin
        ME.plusID := tTranplusID.Value;
        
        MEAnt := TncMovEst.Create;
        MEAnt.LeDataset(tTran);
        if (tTranCaixa.Value<>NumCX) and ((ME.CaixaPag<>NumCx)) then begin
          Result := ncerrCaixaDiferente;
          Exit;
        end;

        tTran.Edit;
      end;

      if (ME.plusID>'') then begin
        tPT.IndexName := 'IID';
        if not tPT.FindKey([ME.plusID]) then begin
          Result := ncerrItemInexistente;
          Exit;
        end;
      end;
      
      if (ME.Cliente<>0) and tCli.FindKey([Me.Cliente]) then begin
        tCli.Edit;
        tCliUltVisita.Value := Now;
        tCli.Post;
      end;
  
      tTranDataHora.Value := ME.DataHora;
      tTranPagFunc.Value := ME.PagFunc;
      tTranPagPend.Value := ME.PagPend;
      tTranCliente.Value := ME.Cliente;
      tTranTipo.Value := ME.Tipo;
      S := ME.Func;
      tTranFunc.Value := S;
      tTranTotal.Value := ME.Total;
      tTranDesconto.Value := ME.Desconto;
      tTranPago.Value := ME.Pago;
      tTranObs.Value := ME.Obs;
      tTranCancelado.Value := ME.Cancelado;
      tTranCanceladoPor.Value := ME.CanceladoPor;
      tTranCanceladoEm.Value := ME.CanceladoEm;
      tTranFidResgate.Value := ME.FidResgate;
      tTranCaixa.Value := ME.Caixa;
      //tTranTipoPago.Value := ME.TipoPago;  // dario 06/09/2019

      tTranCaixaPag.Value := ME.CaixaPag;
      tTranCredito.Value := ME.PagEsp.Credito;
      tTranCreditoUsado.Value := ME.PagEsp.CreditoUsado;
      tTranMaq.Value := ME.Maq;
      if ME.Cliente>0 then
        tTranNomeCliente.AsVariant := tCli.Lookup('ID', ME.Cliente, 'Nome') else
        tTranNomeCliente.Value := ME.NomeCliente;
        
      tTranSessao.Value := ME.Sessao;
      S := '';
      if Trim(ME.plusID)>'' then begin
{

        for I := 0 to ME.Itens.Count - 1 do with ME.Itens[I] do 
        if (_Operacao<>osExcluir) then begin
          V := tProduto.Lookup('ID', imProduto, 'Descricao');
          if not VarIsNull(V) then begin
            if S>'' then S := S + ', ';
            S := S + FloatToStr(imQuant) + ' X ' + V;
          end;
        end;
        tTranDescr.Value := S;
      end else begin     }
        tTranplusID.Value := ME.plusID;
        tTranDescr.Value := tPTDescr.Value;
      end;

      tTran.Post;
      ME.ID := tTranID.Value;

      SavePagEsp(ME.ID, ME.CaixaPag, ME.DataHora, ME.Cancelado, ME.PagEsp);

      if Trim(ME.plusID)>'' then begin
        tPT.Edit;
        tPTTranID.Value := tTranID.Value;
        tPTCliente.Value := tTranCliente.Value;
        tPTNomeCliente.Value := tTranNomeCliente.Value;
        tPT.Post;
      end;
      

      if ME.Recibo then AddRec(HandleCliAtual, ME.ID);

      for I := 0 to ME.Itens.Count - 1 do 
        with ME.Itens[I] do begin
          imTipoTran := ME.Tipo;
          imSessao   := ME.Sessao;
          imDataHora := ME.DataHora;
          imCliente  := ME.Cliente;
          imCaixa    := ME.Caixa;
          case _Operacao of
            osIncluir : Result := IncluiIME(ME.Itens[I], ME);
            osAlterar : Result := AlteraIME(ME.Itens[I], MEAnt, ME);
            osExcluir : Result := ExcluiIME(ME.Itens[I], MEAnt, ME);
          end;
          if (Result<>0) then Exit;
        end;

      tCli.IndexName := 'IID';   

      if (MEAnt<>nil) and (MEAnt.Cliente>0) then
        if tCli.FindKey([MEAnt.Cliente]) then
          RefreshDebitoCliente;

      if (ME<>nil) and (ME.Cliente>0) and ((MEAnt=nil) or (MEAnt.Cliente<>ME.Cliente)) then
        if tCli.FindKey([ME.Cliente]) then
          RefreshDebitoCliente;

      if NewTran and (not FidControl.CanCommit) then begin
        Result := ncerrSaldoFidInsuficiente;
        Exit;
      end;

      tTran.Edit;
      tTran.Post;

      if NewTran then
        nxDB.Commit;
    except
      if NewTran then 
        nxDB.Rollback;
      tTran.Cancel;
      tMovEst.Cancel;
      tCaixa.Cancel;
      tSessao.Cancel;
      tProduto.Cancel;
      tITran.Cancel;
      tAuxME.Cancel;
      Raise;
    end;
  finally
    if NewTran then
      if nxDB.InTransaction then 
        nxDB.Rollback;
    
    if MEAnt<>nil then 
      MEAnt.Free;
  end;
end;

procedure TDM.SalvaMsgChat(const aDe, aPara: Integer; const aTexto: String);
var NewTran: Boolean;
begin
  NewTran := InitTran([tChat], True);
  try
    tChat.Insert;
    tChatDe.Value := aDe;
    tChatPara.Value := aPara;
    tChatDataHora.Value := Now;
    tChatTexto.Value := aTexto;
    tChat.Post;
    if NewTran then nxDB.Commit;
  except
    tChat.Cancel;
    if NewTran then nxDB.Rollback;
    Raise;
  end;
end;

function TDM.SalvaCredTempo(aCT: TncCredTempo; var AumentouDeb: Boolean; aSessoes: TncSessoes = nil): Integer;
var 
  P : TncPassaporte;
  Ant : TncCredTempo;
  S : TncSessao;
  Debitar : Currency;
  CorrigeID : Boolean;
begin
  Result := 0;
  AumentouDeb := False;
  Debitar := 0;
  if not (aCT._Operacao in [osIncluir, osAlterar]) then Exit;

  P := TncPassaporte.Create;
  Ant := nil;
  try
    if aCT._Operacao = osIncluir then begin
      tTempo.Insert;
      aCT.teDataHora := Now;
      aCT.teCaixa    := NumCaixaAberto;
      if aCT.teCaixa=0 then begin
        Result := ncerrCaixaFechado;
        Exit;
      end;
    end else begin
      if not tTempo.Locate('ID', aCT.teID, []) then begin
        tTempo.Insert;
        aCT.SaveToDataset(tTempo);
        tTempoID.Value := aCT.teID;
        tTempo.Post;
      end;
      Ant := TncCredTempo.Create;
      Ant.LoadFromDataset(tTempo);
      if (Ant.teCliente = aCT.teCliente) then
        Debitar := Ant.Debito;
      
      if (aSessoes<>nil) and (not PodeAlterarTran(Ant.teTran)) then begin
        Result := ncerrExisteTranPosterior;
        Exit;
      end;
      tTempo.Edit;
    end;  
         
    aCT.SaveToDataset(tTempo);
    tTempo.Post;
    aCT.teID := tTempoID.Value;

    tCli.IndexName := 'IID';

    if tCli.FindKey([aCT.teCliente]) then begin
      tCli.Edit;
      tCliUltVisita.Value := Now;
      tCli.Post;
    end;  
    
    if (Ant<>nil) and (Ant.teCliente>0) and (Ant.teCliente<>aCT.teCliente) then
    case Ant.teTipo of
      tctPacote : begin
        if not tCli.FindKey([Ant.teCliente]) then  begin
          Result := ncerrItemInexistente;
          Exit;
        end;
        if tCliMinutos.Value < Ant.teMinutos then begin
          Result := ncerrSemCreditoDispCanc;
          Exit;
        end;
        tCli.Edit;
        tCliMinutos.Value := tCliMinutos.Value - Ant.teMinutos;
        tCli.Post;
      end;
      
      tctAvulso : begin
        if not tCli.FindKey([Ant.teCliente]) then  begin
          Result := ncerrItemInexistente;
          Exit;
        end;
        
        if Ant.teCredValor then begin
          if tCliValorCred.Value < Ant.teTotal then begin
            Result := ncerrSemCreditoDispCanc;
            Exit;
          end;
          tCli.Edit;
          tCliValorCred.Value := tCliValorCred.Value - Ant.teTotal;
          tCli.Post;
        end else begin
          if tCliMinutos.Value < Ant.teMinutos then begin
            Result := ncerrSemCreditoDispCanc;
            Exit;
          end;
          tCli.Edit;
          tCliMinutos.Value := tCliMinutos.Value - Ant.teMinutos;
          tCli.Post;
        end;
      end;
    end;

    if (Ant<>nil) and (Ant.teCliente<>aCT.teCliente) and (Ant.teTipo in [tctPassaporte, tctCartaoTempo]) then begin
      if not tPassaporte.Locate('ID', Ant.tePassaporte, []) then begin
        Result := ncerrItemInexistente;
        Exit;
      end else begin
        tPassaporte.Edit;
        tPassaporteCliente.Value := aCT.teCliente;
        tPassaporte.Post;
      end;   
    end;
    
    if Ant=nil then begin
      if aCT.teTipo in [tctPassaporte, tctCartaoTempo] then begin
        if aCT.teTipo=tctPassaporte then begin
          tTipoPass.IndexName := 'IID';
          if not tTipoPass.FindKey([aCT.teIDPacPass]) then 
            Raise ENexCafe.Create('Passaporte não encontrado');
          P.LoadFromDataset(tTipoPass);
          tPassaporte.Insert;
        end else begin
          tPassaporte.IndexName := 'ISenha';
          try
            if not tPassaporte.FindKey([aCT.teSenha]) then
              Raise ENexCafe.Create('Cartão de Tempo não encontrado');
          finally
            tPassaporte.IndexName := 'IID';
          end;
          P.LoadFromDataset(tPassaporte);
          tPassaporte.Edit;
        end;
        tPassaporteDataCompra.Value := aCT.teDataHora;
        P.pcValido := True;  
        tPassaporteValido.Value := True;
        P.pcCliente := aCT.teCliente;
        P.SaveToDataset(tPassaporte);
        tPassaporteSessao.Value := aCT.teSessao;
        tPassaporte.Post;
        P.pcID := tPassaporteID.Value;
        aCT.tePassaporte := P.pcID;
  
        if aCT.teSessao>0 then begin
          tHPass.Insert;
          tHPassSessao.Value := aCT.teSessao;
          tHPassDataHora.Value := Now;
          tHPassPassaporte.Value := P.pcID;
          tHPass.Post;
        end;
  
        tTempo.Edit;
        tTempoPassaporte.AsInteger := P.pcID;
        tTempo.Post;
      end;
  
      tTran.Insert;
      with tTranDescr do
      case aCT.teTipo of 
        tctPrevisao   : Value := 'Tempo previsto = ' + IntToStr(Trunc(aCT.teMinutos)) + 'min.'; 
        
        tctAvulso     : 
          if aCT.teCredValor then
            Value := 'Valor do Crédito = ' + CurrToStr(aCT.teTotal) else
            Value := 'Tempo = ' + IntToStr(Trunc(aCT.teMinutos)) + 'min.';
            
        tctPassaporte : Value := tTipoPassNome.Value;
        tctCartaoTempo: Value := 'Cartão de Tempo: '+aCT.teNome;
        tctPacote     : AsVariant := tPacote.Lookup('ID', aCT.teIDPacPass, 'Descr');
      end;
    end else begin
      if tTran.Locate('ID', aCT.teTran, []) then 
        tTran.Edit 
      else begin
        tTran.Insert;
        tTranID.Value := aCT.teTran;
      end;
    end;
      
    aCT.SaveToTran(tTran);
    if aCT.teCliente>0 then
      tTranNomeCliente.AsVariant := tCli.Lookup('ID', aCT.teCliente, 'Nome') else
      tTranNomeCliente.Clear;
    tTran.Post;
    aCT.teTran := tTranID.Value;

    if aCT._Recibo then
      AddRec(HandleCliAtual, aCT.teTran);
    
    tTempo.Edit;
    tTempoTran.Value := tTranID.Value;
    tTempo.Post;

    if aCT.teTipo in [tctPassaporte, tctCartaoTempo] then begin
      tPassaporte.Edit;
      tPassaporteTran.Value := aCT.teTran;         
      tPassaporte.Post;
    end;
    if (Ant<>nil) then begin
      if tITran.Locate('Tran', aCT.teTran, []) then 
        tITran.Edit 
      else begin
        tITran.Insert;
        tITranTran.Value := aCT.teTran;
      end;
    end else
      tITran.Insert;  
    aCT.SaveToITranDataset(tITran);
    tITran.Post;

    tDebito.IndexName := 'ITipoID';

    if (Ant<>nil) and tDebito.FindKey([itTempo, Ant.teID]) then
      tDebito.Delete;    

    if aCT.Debito>0.0001 then begin
      tDebito.Insert;
      tDebitoData.AsDateTime := aCT.teDataHora;
      tDebitoCliente.Value := aCT.teCliente;
      tDebitoValor.Value := aCT.Debito;
      tDebitoID.Value := aCT.teID;
      tDebitoTipo.Value := itTempo;
      tDebito.Post;
      AumentouDeb := (aCT.Debito > Debitar);
    end;

    if (Ant<>nil) and (Ant.teCliente<>aCT.teCliente) and (Ant.teCliente>0) and tCli.FindKey([Ant.teCliente]) then
      RefreshDebitoCliente;

    if ((Ant=nil) or (Ant.teCliente <> aCT.teCliente)) and (aCT.teCliente>0) and
       (aCT.teTipo in [tctAvulso, tctPacote]) and tCli.FindKey([aCT.teCliente]) then
    begin
      if aCT.teCredValor and (aCT.teTipo=tctAvulso) then begin
        tCli.Edit;
        tCliValorCred.Value := tCliValorCred.Value + aCT.teTotal;
        tCli.Post;
      end else begin
        tCli.Edit;
        tCliMinutos.Value := tCliMinutos.Value + aCT.teMinutos;
        tCli.Post;
      end;
    end;

    if (aSessoes<>nil) and (Ant<>nil) and (Ant.teSessao>0) and (Ant.teSessao<>aCT.teSessao) then begin
      S := aSessoes.PorID[Ant.teSessao];
      if S=nil then Exit;
      if not tSessao.Locate('ID', S.ID, []) then begin
        Result := ncerrItemInexistente;
        Exit;
      end;
      S.PausaFimTempo(False);
      tSessao.Edit;
      tSessaoMinTicksUsados.Value := S.TempoUsado.Ticks;
      tSessaoMinTicksTotal.Value := S.TicksTotal;
      tSessaoStrPausas.Value := S.StrPausas;
      tSessao.Post;
      S.LimpaCache;
      S.MinTicksUSados := tSessaoMinTicksUsados.Value;
      S.MinTicksTotal  := tSessaoMinTicksTotal.Value;
      RefreshSessao(S);
      S.Notificar(tnAlteracao);
    end;

    if (aCT.teCliente>0) and tCli.FindKey([aCT.teCliente]) then
      RecalcPass;
      
    if (Ant<>nil) and (Ant.teCliente>0) and (Ant.teCliente<>aCT.teCliente) and tCli.FindKey([Ant.teCliente]) then
      RecalcPass;
  finally
    if Assigned(Ant) then Ant.Free;
    P.Free;
  end;
end;

function TDM.SalvaDebTempo(aDT: TncDebTempo; aSessoes: TncSessoes): Integer;
var 
  NumCx: Integer;
  Ant, Dif: Double;
  S: TncSessao;

procedure _CancelAndRollback;
begin
  if nxDB.InTransaction then begin
    nxDB.Rollback;
    tTran.Cancel;
    tCaixa.Cancel;
    tCli.Cancel;
    tSessao.Cancel;
  end;
end;

begin
  Result := 0;
  InitTran([tTran, tCaixa, tCli, tSessao], True);
  try
    NumCx := NumCaixaAberto;
    if NumCx=0 then begin
      Result := ncerrCaixaFechado;
      Exit;
    end;
    
    if not tCli.Locate('ID', aDT.Cliente, []) then begin
      Result := ncerrItemInexistente;
      Exit;
    end;

    if aDT.ID=-1 then begin
      aDT.Caixa := NumCx;
      aDT.DataHora := Now;
      tTran.Insert;
      Ant := 0;
    end else begin
      if not tTran.Locate('ID', aDT.ID, []) then begin
        Result := ncerrItemInexistente;
        Exit;
      end;

      if (tTranCaixa.Value <> NumCx) or (aDT.Caixa <> NumCx) then begin 
        Result := ncErros.ncerrCaixaDiferente;
        Exit;
      end;
      Ant := tTranQtdTempo.Value;
      tTran.Edit;
    end;

    Dif := Ant - aDT.QtdTempo;

    if aDT.CredValor then begin
      if tCliValorCred.Value + Dif < -0.000000001 then begin
        Result := ncErros.ncerrSaldoTempoInsuficiente;
        Exit;
      end;
    end else
    if tCliMinutos.Value + Dif < -0.00000001 then begin
      Result := ncErros.ncerrSaldoTempoInsuficiente;
      Exit;
    end;

    S := aSessoes.PorCliente[aDT.Cliente];
    if (S <> nil) and tSessao.Locate('ID', S.ID, []) then begin
      tSessao.Edit;
      tSessaoMinTicksUsados.Value := S.TempoUsado.Ticks;
      tSessaoMinTicksTotal.Value := S.TicksTotal;
      tSessao.Post;
    end;

    tCli.Edit;
    if aDT.CredValor then
      tCliValorCred.Value := tCliValorCred.Value + Dif else
      tCliMinutos.Value := tCliMinutos.Value + Dif;
    tCli.Post;
    
    aDT.SalvaDataset(tTran);
    if aDT.ID=-1 then tTranID.Clear;
    if aDT.CredValor then
      tTranDescr.Value := 'Crédito removido: '+Trim(FloatToStrF(aDT.QtdTempo, ffCurrency, 10, 2)) else
      tTranDescr.Value := 'Crédito removido: '+MinutosToHMSStr(aDT.QtdTempo);
    tTranNomeCliente.Value := tCliNome.Value;
    tTran.Post;
    
    nxDB.Commit;
    if S<>nil then begin
      S.MinTicksUsados := tSessaoMinTicksUsados.Value;
      S.MinTicksTotal := tSessaoMinTicksTotal.Value;
      RefreshSessao(S);
      S.Notificar(tnAlteracao);
    end;
  finally
    _CancelAndRollback;
  end;
end;

procedure TDM.SalvaEspecie(E: TncEspecie);
begin
  if E.ID=0 then begin
    if tEspecie.IsEmpty then
      E.ID := 1
    else begin
      tEspecie.Last;
      E.ID := tEspecieID.Value+1;
    end;
  end;
  if not tEspecie.FindKey([E.ID]) then
    tEspecie.Insert else
    tEspecie.Edit;
  tEspecieID.Value := E.ID;
  tEspecieNome.Value := E.Nome;
  tEspecieTipo.Value := E.Tipo;
  tEspeciePermiteVarios.Value := E.PermiteVarios;
  tEspeciePermiteTroco.Value := E.PermiteTroco;
  tEspeciePermiteCred.Value := E.PermiteCred;
  tEspecieImg.Value := E.Img;
  tEspecie.Post;
end;

function TDM.SalvaImpressao(Imp: TncImpressao; aPrintDocSL: TStrings; J: TncJob; aSessoes: TncSessoes = nil): Integer;
var 
  NewTran, Achou: Boolean;
  Ant : TncImpressao;
  S : TncSessao;
  Debito : Currency;

procedure CancelAndRollback;
begin
  if not nxDB.InTransaction then Exit;
  tImp.Cancel;
  tTipoImp.Cancel;
  tTran.Cancel;
  tITran.Cancel;
  tSessao.Cancel;
  tCli.Cancel;
  tDebito.Cancel;
  tCaixa.Cancel;
  if NewTran then
    nxDB.Rollback;
end;

procedure SalvaContador(Reg: TncImpressao; Fator: Integer);
var i: integer;
begin
  if Reg.impCancelado then Exit;

  for I := 1 to 10 do 
    if Reg.impQuant[I]>0 then
      if tTipoImp.Locate('ID', I, []) then begin
        tTipoImp.Edit;
        tTipoImpContador.Value := tTipoImpContador.Value + (Fator * Reg.impQuant[I]);
        tTipoImp.Post;
      end;
end;
  
begin
  Ant := nil;
  Result := 0;
  Debito := 0;
  try
    NewTran := InitTran([tImp, tPM, tTipoImp, tFilaImp, tDebito, tCli, tTran, tITran, tCaixa, tSessao], True);
    try
      if (aSessoes<>nil) and (Imp.impSessao>0) then 
        S := aSessoes.PorID[Imp.impSessao] else 
        S := nil;
        
      
      if Imp._Operacao=osIncluir then begin
        DebugMsg('TDM.SalvaImpressao - osIncluir');
        tImp.Insert;
        tImpx75.Value := True;
        Imp.impDataHora := Now;
        Imp.impCaixa := NumCaixaAberto;
        if S<>nil then
          Imp.impMaquina := S.Maq;
          
        if (not Imp.impManual) and ((S=nil) or S.Encerrou) then begin
          S := nil;
          Imp.impSessao := 0;
          Imp.impCliente := 0;
          Imp.impPago := Imp.Total;
          Imp.impFunc := FuncCaixaAberto;
        end else
          if S<>nil then
            Imp.impCliente := S.Cliente;
        
        tTran.Insert;
        tITran.Insert;
      end
      else begin
        tImp.IndexName := 'IID';

        if not tImp.FindKey([Imp.impID]) then begin
          Result := ncerrItemInexistente;
          Exit;
        end;

        if (aSessoes<>nil) and (not PodeAlterarTran(Imp.impTran)) then begin
          Result := ncerrExisteTranPosterior;
          Exit;
        end; 

        Ant := TncImpressao.Create;
        Ant.LoadFromDataset(tImp);

        if (Imp.impCliente>0) and (Ant.Debito>0.009) and (Ant.impCliente=Imp.impCliente) then
          Debito := Ant.Debito;

        if (Ant.impTran>0) then begin

          tTran.IndexName := 'IID';
          if not tTran.FindKey([Imp.impTran]) then
            tTran.Insert else
            tTran.Edit;

          tITran.IndexName := 'ITranID';
          try
            Achou := tITran.FindKey([Imp.impTran]);
          finally
            tITran.IndexName := 'IID';
          end;
          if Achou then
            tITran.Edit else
            tITran.Insert;
        end else 
        if Imp.Total>0.0001 then begin
          tTran.Insert;
          tITran.Insert;
        end;
        tImp.Edit;
      end;

      Imp.SaveToDataset(tImp);
      tImp.Post;

      if (Imp._Operacao=osIncluir) and (aPrintDocSL<>nil) then begin
        tFilaImp.Insert;
        tFilaImpIDImp.Value := tImpID.Value;
        tFilaImpInfo.Value := aPrintDocSL.Text;
        tFilaImp.Post;
      end;

      tPM.IndexName := 'IPrinterIndexJobID';
      if (J<>nil) and tPM.FindKey([J.PrinterIndex, J.JobID]) then
      begin
        tPM.Edit;
        tPMImpID.Value := tImpID.Value;
        tPMLiberacao.Value := jlImprimir;
        tPM.Post;
      end; 
      
      Imp.impID := tImpID.Value;

      if Ant<>nil then SalvaContador(Ant, -1);
      SalvaContador(Imp, 1);

      tCli.IndexName := 'IID';
      if (Ant<>nil) and tDebito.FindKey([itImpressao, Imp.impID]) then begin
        if tCli.FindKey([Ant.impCliente]) then begin
          tCli.Edit;
          tCliDebito.Value := tCliDebito.Value - tDebitoValor.Value;
          tCli.Post;
        end;
        tDebito.Delete;
      end;
    
      if tTran.State in [dsInsert, dsEdit] then begin
        Imp.SaveToTranDataset(tTran);
        if (Imp.impCliente>0) then 
          tTranNomeCliente.Value := tCli.Lookup('ID', Imp.impCliente, 'Nome');
        tTran.Post;

        SavePagEsp(tTranID.Value, Imp.impCaixa, tTranDataHora.Value, tTranCancelado.Value, Imp.impPagEsp);
      
        Imp.impTran := tTranID.Value;
        tImp.Edit;
        tImpTran.Value := tTranID.Value;
        tImp.Post;

        Imp.SaveToITranDataset(tITran);
        tITran.Post;

        if Imp._Recibo then
          AddRec(HandleCliAtual , Imp.impTran);

        if (Imp.Debito>0.0001) and (Imp.impCliente>0) then begin
          tDebito.Insert;
          tDebitoValor.Value := Imp.Debito;
          tDebitoCliente.Value := Imp.impCliente;
          tDebitoData.Value := Imp.impDataHora;
          tDebitoTipo.Value := itImpressao;
          tDebitoID.Value   := Imp.impID;
          tDebito.Post;
          if tCli.FindKey([Imp.impCliente]) then begin
            tCli.Edit;
            tCliDebito.Value := tCliDebito.Value + Imp.Debito;
            tCli.Post;
          end;
        end;
      end;

      if NewTran and (not FidControl.CanCommit) then begin
        Result := ncerrSaldoFidInsuficiente;
        Exit;
      end;
      
      if S<>nil then begin
        S := aSessoes.PorID[Imp.impSessao];
        DebugMsg('TDM.SalvaImpressao - S<>NIL - 1');
        if (S<>nil) and tSessao.Locate('ID', S.ID, []) then begin
          DebugMsg('TDM.SalvaImpressao - S<>NIL - 2');
          tSessao.Edit;
          tSessaoMinTicksUsados.Value := S.TempoUsado.Ticks;
          tSessaoMinTicksTotal.Value := S.TicksTotal;
          tSessao.Post;
          S.AtualizaCache;
          S.MinTicksUsados := tSessaoMinTicksUsados.Value;
          S.MinTicksTotal := tSessaoMinTicksTotal.Value;
          RefreshSessao(S);
          S.Notificar(tnAlteracao);
        end;
      end else
        DebugMsg('TDM.SalvaImpressao - S=NIL');
      
      if NewTran then nxDB.Commit;

    except
      on E: ENexCafe do begin
        DebugMsg('TDM.SalvaImpressao - ENexCafe: ' + E.Message);
        CancelAndRollback;
        Raise;
      end;
    end;
  finally
    if Ant<>nil then Ant.Free;
    CancelAndRollback;
  end;
end;

procedure TDM.SalvaInfoCampanha(IC: TInfoCampanha);
begin
  tIC.Active := True;
  tIC.Refresh;
  if tIC.IsEmpty then begin
    tIC.Insert;
    tICcampanha.Value := IC.icCampanha;
    tICutmccn.Value := IC.icutmccn;
    tICutmcct.Value := IC.icutmcct;
    tICutmctr.Value := IC.icutmctr;
    tICutmcmd.Value := IC.icutmcmd;
    tICutmcsr.Value := IC.icutmcsr;
    tIC.Post;
  end;
end;

procedure TDM.SalvaIPSessao(S: TncSessao; aIP: String);
begin
  if (Trim(aIP)='') or (Pos(aIP, S.IPs)>0) then Exit;
  
  InitTran([tSessao], True);
  try
    S.AtualizaCache;
    S.AddIP(aIP);
    if tSessao.FindKey([S.ID]) then begin
      tSessao.Edit;
      tSessaoIPs.Value := S.IPs;
      tSessao.Post;
    end;
    nxDB.Commit;
    S.Notificar(tnAlteracao);
  except
    nxDB.Rollback;
  end;
end;

procedure TDM.SalvaJobControl(J: TncJob; aControl: Byte);
var aSessao: TncSessao;
begin
  if J.Liberacao=jlPendente then begin
    if J.Maquina>0 then
      aSessao := FSessoes.PorMaq[J.Maquina] else
      aSessao := nil;

    if (aControl=jc_resume) and gConfig.PMPausaAutomatica and J.Registrar and (J.ImpID=0)  
    then 
      SalvaPaginasImpressas(J, 0, nil, aSessao, 0, '', '', gConfig.ControlaImp) 
    else begin
      InitTran([tPM], True);
      try
        tPM.IndexName := 'IPrinterIndexJobID';
        if tPM.FindKey([J.PrinterIndex, J.JobID]) then begin
          tPM.Edit;
          if aControl=jc_resume then
            tPMLiberacao.Value := jlImprimir else
            tPMLiberacao.Value := jlCancelar;
          tPM.Post;
        end;

        nxDB.Commit;
        
        J.AtualizaCache;
        if aControl=jc_resume then
          J.Liberacao := jlImprimir else
          J.Liberacao := jlCancelar;
        J.Notificar(tnAlteracao);
      except
        nxDB.Rollback;
      end;
    end;
  end;
end;

function TDM.SalvaClientPages(J: TncJob; aMaq, aPaginas: Word): Boolean;
begin
  DebugMsg('TDM.SalvaClientPages - aMaq: ' + IntToStr(aMaq) + '- aPaginas: ' + IntToStr(aPaginas));

  result := False;
  
  InitTran([tPM], True);
  try
    tPM.IndexName := 'IPrinterIndexJobID';
    if not tPM.FindKey([J.PrinterIndex, J.JobID]) then begin
      nxDB.Rollback;
      DebugMsg('TDM.SalvaClientPages - EXIT');
      Exit;
    end;

    if J.JobCliID=0 then J.JobCliID := J.JobID;
    
    tPM.Edit;
    tPMMaquina.Value := aMaq;
    tPMClientPages.Value := aPaginas;
    tPMJobCliID.Value := J.JobCliID;
    tPM.Post;
    
    nxDB.Commit;

    J.AtualizaCache;
    J.Maquina := aMaq;
    J.ClientPages := aPaginas;
    J.Notificar(tnAlteracao);
    Result := True;
    DebugMsg('TDM.SalvaClientPages - OK');
  except
    nxDB.Rollback;
  end;
end;

procedure TDM.SalvaJobNotification(J: TncJob; aOper: Byte);

function FiltraBar(S: String): String;
var i: Integer;
begin
  Result := '';
  for i := 1 to length(S) do
    if S[i]<>'\' then
      Result := Result + S[i];
end;

begin
  tPM.IndexName := 'IPrinterIndexJobID';
  InitTran([tPM], True);
  try
    if not tPM.FindKey([J.PrinterIndex, J.JobID]) then begin
      if aOper=2 then begin
        nxDB.Rollback;
        Exit;
      end;
      tPM.Insert;
    end else begin
      if (aOper=2) then 
      begin
        tPM.Delete;
        nxDB.Commit;
        if (J.Status<>jsCompleted) or J.Deleted then Exit;
        
        if (J.PaginasReg<1) then Exit; 
        
        if (not gConfig.DetectarImpServ) or J.Doc_NexCafe then begin
          DebugMsg('JOBNOTIFICATION: gConfig.DetectarImpServ = False');
          Exit;
        end;

        if gConfig.PMPausaAutomatica and gNaoPausar.Pausar(J.Computer) then exit;
  
        with J do
        if SameText(FiltraBar(Computer), NomeCompServ) then 
          SalvaPaginasImpressas(J, 0, nil, nil, J.PaginasReg, J.PrinterName, J.Document, gConfig.ControlaImp);

        Exit;
      end;
      tPM.Edit;
    end;
    J.SalvaDataset(tPM);
    tPM.Post;
    nxDB.Commit;
  except
    on E: ENexCafe do begin
      DebugMsg('TDM.SalvaJobNotification - E.Message = ' + E.Message);
      nxDB.Rollback;
    end;
  end;
end;

function TDM.SalvaPagDebito(aDeb: TncDebito): Integer;
var I, aTipoItem, aItemID : Integer;

procedure _CancelAndRollback;
begin
  if nxDB.InTransaction then begin
    nxDB.Rollback;
    tDebito.Cancel;
    tCli.Cancel;
    tCaixa.Cancel;
    tTran.Cancel;
    tITran.Cancel;
    tImp.Cancel;
    tMovEst.Cancel;
    tSessao.Cancel;
    tTempo.Cancel;
  end;
end;

begin
  Result := 0;
  InitTran([tDebito, tCli, tCaixa, tTran, tITran, tImp, tMovEst, tSessao, tTempo, tRec, tPagEsp], True);
  try
    tDebito.CancelRange;
    
    aDeb.DataHora := Now;
    aDeb.Caixa := NumCaixaAberto;
    if aDeb.Caixa=0 then begin
      Result := ncerrCaixaFechado;
      Exit;
    end;

    tCli.IndexName := 'IID';
    if not tCli.FindKey([aDeb.Cliente]) then begin
      Result := ncerrItemInexistente;
      Exit;
    end;

    tCli.Edit;
    tCliUltVisita.Value := Now;
    tCli.Post;

    aDeb.SalvaDescPago;
    tTran.Insert;
    aDeb.SalvaDataset(tTran);
    tTranTipo.Value := trPagDebito;
    tTranNomeCliente.Value := tCliNome.Value;
    tTranID.Clear;
    tTran.Post;
    aDeb.ID := tTranID.Value;

    if aDeb.Recibo then begin
      tRec.Insert;
      tRecTran.Value := tTranID.Value;
      tRecCliente.Value := HandleCliAtual;
      tRec.Post;
    end;

    if aDeb.Recibo then
      AddRec(aDeb.ID, HandleCliAtual);

    with aDeb do 
    for I := 0 to Itens.Count-1 do with Itens[I] do begin
      idItemPos := I+1;
      tITran.Insert;
      SaveToITran(tITran);
      tITran.Post;

      tDebito.IndexName := 'ITipoID';
      aTipoItem := idTipoItem;
      aItemID  := idItemID;

      if not tDebito.FindKey([aTipoItem, aItemID, aDeb.Cliente]) then begin
        if (aTipoItem=150) or (aItemID=-1) then Exit;
        
        Result := ncerrItemInexistente;
        Exit;
      end;

      tDebito.Edit;
      tDebitoValor.Value := tDebitoValor.Value - idPago - idDesconto;
      tDebito.Post;

      case idTipoItem of
        itSessao : 
        if tSessao.Locate('ID', idItemID, []) then begin
          tSessao.Edit;
          tSessaoPagoPost.Value := tSessaoPagoPost.Value + idPago;
          tSessaoDescPost.Value := tSessaoDescPost.Value + idDesconto;
          tSessao.Post;
        end; 

        itMovEst : 
        if tMovEst.Locate('ID', idItemID, []) then begin
          tMovEst.Edit;
          tMovEstPagoPost.Value := tMovEstPagoPost.Value + idPago;
          tMovEstDescPost.Value := tMovEstDescPost.Value + idDesconto;
          tMovEst.Post;
        end;

        itImpressao :
        if tImp.Locate('ID', idItemID, []) then begin
          tImp.Edit;
          tImpPagoPost.Value := tImpPagoPost.Value + idPago;
          tImpDescPost.Value := tImpDescPost.Value + idDesconto;
          tImp.Post;
        end;

        itTempo : 
        if tTempo.FindKey([idItemID]) then begin
          tTempo.Edit;
          tTempoPagoPost.Value := tTempoPagoPost.Value + idPago;
          tTempoDescPost.Value := tTempoDescPost.Value + idDesconto;
          tTempo.Post;
        end;
      end;

      SavePagEsp(tTranID.Value, tTranCaixa.Value, tTranDataHora.Value, tTranCancelado.Value, aDeb.PagEsp);

      if tDebitoValor.Value < 0.01 then 
        tDebito.Delete;
    end;

    RefreshDebitoCliente;

    if not FidControl.CanCommit then begin
      Result := ncerrSaldoFidInsuficiente;
      Exit;
    end;
    
    nxDB.Commit;
  finally
    _CancelAndRollback;
  end;
end;

procedure TDM.SalvaPaginasImpressas(J: TncJob; aMaq: Word; Maq: TncMaquina;
  Sessao: TncSessao; aPaginas: Integer; aImp, aDoc: String; aRegistrar: Integer);
var
  TipoImp : Integer;
  Imp: TncImpressao;

function GetTipoImp: Integer;
begin
  Result := 0;
  tTipoImp.IndexName := 'IID';
  tTipoImp.CancelRange;
  if tTipoImp.IsEmpty then Exit;
  
  tTipoImp.First;
  while (Result=0) and (not tTipoImp.Eof) do begin
    if (Pos(UpperCase(tTipoImpImpressora.Value), UpperCase(aImp))>0) or
       (Pos(UpperCase(aImp), UpperCase(tTipoImpImpressora.Value))>0) 
    then begin
      Result := tTipoImpID.Value;
      Exit;
    end;  
    tTipoImp.Next;
  end;

  tTipoImp.First;
  Result := tTipoImpID.Value;
end;
  
begin
  Imp := TncImpressao.Create;
  try
    InitTran([tPM, tImp, tTipoImp, tTran, tITran, tSessao, tCli, tDebito], True);
    try
      tPM.IndexName := 'IPrinterIndexJobID';

      Imp._Operacao := osIncluir;

      if (J<>nil) then begin
        aMaq := J.Maquina;
        aPaginas := J.PaginasReg;
        aImp := J.PrinterName;
        aDoc := J.Document;
      end;
      
      Imp.impDataHora := Now;
      if Maq<>nil then
        Imp.impComputador := Maq.ComputerName 
      else
      if J<>nil then
        Imp.impComputador := J.Computer
      else  
        Imp.impComputador := NomeCompServ;
      Imp.impImpressora := aImp;
      Imp.impDocumento := aDoc;
      Imp.impPaginas := aPaginas;
      Imp.impMaquina := aMaq;
      if Sessao <> nil then begin
        Imp.impSessao := Sessao.ID;
        Imp.impCliente := Sessao.Cliente;
      end;  
      Imp.impManual := False;
      Imp.impCaixa := NumCaixaAberto;
      Imp.impResultado := 0;
      TipoImp := GetTipoImp;
      if TipoImp in [1..10] then begin
        Imp.impQuant[TipoImp] := aPaginas;
//        if aRegistrar=ciRegistrar then 
        Imp.impValor[TipoImp] := tTipoImpValor.Value;
      end;
      
      if aMaq=0 then begin 
        Imp.impPago := Imp.Total;
        Imp.impFunc := FuncCaixaAberto;
      end;

      DebugMsg('TDM.SalvaPaginasImpressas');

//     if (aPaginas>0) or ((J<>nil) and (J.PaginasReg>0)) then 
       SalvaImpressao(Imp, nil, J, FSessoes);

      nxDB.Commit;

      if J<>nil then begin
        J.AtualizaCache;
        J.ImpID := Imp.impID;
        J.Liberacao := jlImprimir;
        J.Notificar(tnAlteracao);
      end;
      
      if Sessao<>nil then begin
        Sessao.MinTicksUsados := Sessao.TempoUsado.Ticks;
        Sessao.MinTicksTotal := Sessao.TicksTotal;
        Sessao.AtualizaCache;
        RefreshTranSessao(Sessao);
        RefreshImpSessao(Sessao);
        Sessao.Notificar(tnAlteracao);
      end;  
    except
      tImp.Cancel;
      tTran.Cancel;
      tITran.Cancel;
      tSessao.Cancel;
      tCli.Cancel;
      tDebito.Cancel;
      nxDB.Rollback;
      Raise;
    end;
  finally
    Imp.Free;
  end;
end;

procedure TDM.SalvaPosAtualSessoes(Sessoes: TncSessoes);
var I : Integer;
begin
  InitTran([tSessao], True);
  try
    tSessao.IndexName := 'IID';
    for I := 0 to Sessoes.Count-1 do with Sessoes[I] do 
    if tSessao.FindKey([ID]) then begin
      tSessao.Edit;
      tSessaoMinTicksUsados.Value := TempoUsado.Ticks;
      tSessaoMinTicksTotal.Value  := TicksTotal;
      tSessao.Post;
    end;
    nxDB.Commit;
  except
    nxDB.Rollback;
  end;
end;

procedure TDM.SalvaProcessos(aCli, aReq: Integer; SL: TStrings);
var I: Integer;
begin
  InitTran([tProc], True);
  try
    for i := 0 to Sl.Count-1 do begin
      tProc.Insert;
      tProcClienteID.Value := aCli;
      tProcRequest.Value := aReq;
      tProcProcessID.Value := StrToIntDef(SL.Names[I], 0);
      tProcExeName.Value := SL.ValueFromIndex[I];
      tProc.Post;
    end;
    nxDB.Commit;
  except
    nxDB.Rollback;
    tProc.Cancel;
    Raise;
  end;
end;

function TDM.SalvaSenhaCli(Codigo: Integer; Senha: String): Integer;
var NewTran: Boolean;
begin
  NewTran := InitTran([tCli], True);
  try
    if tCli.Locate('ID', Codigo, []) then begin
      tCli.Edit;
      tCliSenha.Value := Senha;
      tCli.Post;
      nxDB.Commit;
      Result := 0;
    end else begin
      Result := ncerrClienteNaoEncontrado;
      nxDB.Rollback;
    end;
      
  except
    tCli.Cancel;
    if NewTran then nxDB.Rollback;
    Raise;
  end;
end;

procedure TDM.SalvaSessao(S: TncSessao);
var NewTran: Boolean;
begin
  NewTran := InitTran([tSessao], True);
  try
    tSessao.IndexName := 'IID';
    if tSessao.FindKey([S.ID]) then 
      tSessao.Edit else
      tSessao.Insert;
    S.SalvaDataset(tSessao);  
    tSessao.Post;
    if NewTran then nxDB.Commit;
  except
    tSessao.Cancel;
    if NewTran then nxDB.Rollback;
    Raise;
  end;
end;

procedure TDM.SalvaTarifa(T: TncTarifa);
begin
  tTarifa.IndexName := 'ICor';
  if tTarifa.FindKey([T.Cor]) then
    tTarifa.Edit else
    tTarifa.Insert;
  T.SalvaDataset(tTarifa);
  tTarifa.Post;  
end;

procedure TDM.SalvaTipoAcesso(TA: TncTipoAcesso);
var NewTran: Boolean;
begin
  NewTran := InitTran([tTipoAcesso], True);
  try
    if tTipoAcesso.FindKey([TA.ID]) then 
      tTipoAcesso.Edit else
      tTipoAcesso.Insert;
        
    TA.SalvaDataset(tTipoAcesso);
    tTipoAcesso.Post;
    if NewTran then nxDB.Commit;
  except
    tTipoAcesso.Cancel;
    if NewTran then nxDB.Rollback;
    Raise;
  end;
end;

procedure TDM.SalvaTipoImp(T: TncTipoImp);
var NewTran: Boolean;
begin
  NewTran := InitTran([tTipoImp], True);
  try
    if tTipoImp.FindKey([T.ID]) then
      tTipoImp.Edit else
      tTipoImp.Insert;
        
    T.SalvaDataset(tTipoImp);
    tTipoImp.Post;
    if NewTran then nxDB.Commit;
  except
    tTipoImp.cancel;
    if NewTran then nxDB.Rollback;
    Raise;
  end;
end;

procedure TDM.SalvaUsuario(U: TncUsuario);
var NewTran: Boolean;
begin
  NewTran := InitTran([tUsuario], True);
  try
    if tUsuario.FindKey([U.Username]) then
      tUsuario.Edit
    else
      tUsuario.Insert;
        
    U.SalvaDataset(tUsuario);
    tUsuario.Post;
    if NewTran then nxDB.Commit;
  except
    tUsuario.cancel;
    if NewTran then nxDB.Rollback;
    Raise;
  end;
end;

procedure TDM.SavePagEsp(aTranID, aCaixa: Integer; aDataHora: TDateTime; aCancelado: Boolean; aPagEsp: TncPagEspecies);
var 
  I : Integer;
  SIndex : String;
begin
  tPagEsp.IndexName := 'ITranID';
  tPagEsp.SetRange([aTranID], [aTranID]);
  try
    tPagEsp.First;
    while not tPagEsp.Eof do begin
      if aPagEsp.PorID(tPagEspID.Value)=nil then
        tPagEsp.Delete else
        tPagEsp.Next;
    end;
  finally
    tPagEsp.CancelRange;
  end;

  tPagEsp.CancelRange;
  tPagEsp.IndexName := 'IID';
        
  with aPagEsp do   
  for I := 0 to Count - 1 do begin
    if (Items[i].peID>0) and tPagEsp.FindKey([Items[i].peID]) then
      tPagEsp.Edit else
      tPagEsp.Insert;

    tPagEspTran.Value := aTranID;
    tPagEspCaixa.Value := aCaixa;
    tPagEspCancelado.Value := aCancelado;
    tPagEspDataHora.Value := aDataHora;
    tPagEspEspecie.Value := Items[i].peEspecie;
    tPagEspTipo.Value := Items[i].peTipo;
    tPagEspTroco.Value := Items[i].peTroco;
    tPagEspValor.Value := Items[i].peValor;
    tPagEspDoc.Value := Items[i].peDoc;
    tPagEsp.Post;
    Items[i].peID := tPagEspID.Value;
  end;  
end;

procedure TDM.tAuxITranCalcFields(DataSet: TDataSet);
begin
  if tAuxITranCancelado.Value or 
    (tAuxITranCaixa.Value=0) or
    (tAuxITranTipoTran.Value in [trEstCompra, trEstEntrada, trEstSaida, trPagDebito]) or
    ((tAuxITranSessao.Value>0) and (tAuxITranTipoTran.Value<>trFimSessao)) 
  then
    tAuxITranDebito.Value := 0 else
    tAuxITranDebito.Value := tAuxITranTotal.Value - tAuxITranDesconto.Value - tAuxITranPago.Value;
end;

procedure TDM.tAuxMECalcFields(DataSet: TDataSet);
begin
  if tAUxMECancelado.Value or tAuxMENaoControlaEstoque.Value then
    tAuxMEFator.Value := 0 
  else
  if tAuxMEEntrada.Value then
    tAuxMEFator.Value := 1 else
    tAuxMEFator.Value := -1;
  tAuxMESaldoPost.Value := tAuxMEEstoqueAnt.Value + (tAuxMEFator.Value * tAuxMEQuant.Value);
end;

procedure TDM.tCliBeforePost(DataSet: TDataSet);
begin
  if tCliSemFidelidade.Value then
    tCliFidPontos.Value := 0;
    
  FidControl.SaveChange(tCliID.Value, tCliFidPontos.OldValue, tCliFidPontos.Value);
end;

function VarDef(V, Def: Variant): Variant;
begin
  if V=null then
    Result := Def else
    Result := V;
end;

procedure TDM.tITranBeforeDelete(DataSet: TDataSet);
var
  aClienteNew, aFatorNew : Integer;
  aPontosNew : Double;

  SaveEdit : Boolean;
  SaveID : Integer;
begin
  aClienteNew := tITranCliente.Value;
  aPontosNew := tITranFidPontos.Value;

  if tITranCancelado.Value then
    aFatorNew := 0 else
    aFatorNew := tITranFidFator.Value;

  if (aClienteNew=0) then Exit;
  if (aFatorNew=0) then Exit;
  if (aPontosNew=0) then Exit;

  SaveEdit := (tCli.State=dsEdit);
  SaveID := tCliID.Value;

  try
    if tCliID.Value<>aClienteNew then tCli.FindKey([aClienteNew]);
    if tCliID.Value=aClienteNew then begin
      if tCli.State<>dsEdit then tCli.Edit;
      
      tCliFidPontos.Value := tCliFidPontos.Value + (-1 * aFatorNew * aPontosNew);
      
      if aFatorNew=1 then
        tCliFidTotal.Value := tCliFidTotal.Value - aPontosNew
      else
        if (aFatorNew=-1) then
        if (tITranTipoTran.Value=trAjustaFid) then
          tCliFidTotal.Value := tCliFidTotal.Value + aPontosNew else
          tCliFidResg.Value := tCliFidResg.Value - aPontosNew;
            
      tCli.Post;
    end;
  finally
    if SaveID<>tCliID.Value then tCli.FindKey([SaveID]);
    if (SaveID=tCliID.Value) and SaveEdit and (tCli.State<>dsEdit) then tCli.Edit;
  end;
end;

procedure TDM.tITranBeforePost(DataSet: TDataSet);

procedure AjustaPontos;
var
  aClienteOld, aClienteNew, aFatorOld, aFatorNew : Integer;
  aPontosOld, aPontosNew : Double;
  
  SaveEdit : Boolean;
  SaveID : Integer;
begin

  if (tITranCancelado.OldValue<>null) and tITranCancelado.OldValue then
    aFatorOld := 0 else
    aFatorOld := VarDef(tITranFidFator.OldValue, 0);

  aPontosOld := VarDef(tITranFidPontos.OldValue, 0);
  aClienteOld := VarDef(tITranCliente.OldValue, 0);

  aClienteNew := tITranCliente.Value;
  aPontosNew := tITranFidPontos.Value;

  if tITranCancelado.Value then
    aFatorNew := 0 else
    aFatorNew := tITranFidFator.Value;

  if (aClienteOld=0) and (aClienteNew=0) then Exit;
  if (aFatorOld=0) and (aFatorNew=0) then Exit;
  if (aClienteOld=aClienteNew) and (aFatorOld=aFatorNew) and (aPontosOld=aPontosNew) then Exit;

  SaveEdit := (tCli.State=dsEdit);
  SaveID := tCliID.Value;

  try
    if (aClienteOld>0) then begin
      if tCliID.Value<>aClienteOld then tCli.FindKey([aClienteOld]);
      if tCliID.Value=aClienteOld then begin
        if tCli.State<>dsEdit then tCli.Edit;
        tCliFidPontos.Value := tCliFidPontos.Value + (-1 * aFatorOld * aPontosOld);
        if aFatorOld=1 then
          tCliFidTotal.Value := tCliFidTotal.Value - aPontosOld 
        else
        if (aFatorOld=-1) then
          if (tITranTipoTran.Value=trAjustaFid) then
            tCliFidTotal.Value := tCliFidTotal.Value + aPontosOld else
            tCliFidResg.Value := tCliFidResg.Value - aPontosOld;
        tCli.Post;
      end;
    end;

    if (aClienteNew>0) then begin
      if tCliID.Value<>aClienteNew then tCli.FindKey([aClienteNew]);
      if tCliID.Value=aClienteNew then begin
        if tCli.State<>dsEdit then tCli.Edit;
        tCliFidPontos.Value := tCliFidPontos.Value + (aFatorNew * aPontosNew);
        if aFatorNew=1 then
          tCliFidTotal.Value := tCliFidTotal.Value + aPontosNew
        else
        if (aFatorNew=-1) then
          if (tITranTipoTran.Value=trAjustaFid) then
            tCliFidTotal.Value := tCliFidTotal.Value - aPontosNew else
            tCliFidResg.Value := tCliFidResg.Value + aPontosNew;
            
        tCli.Post;
      end;
    end;
  finally
    if SaveID<>tCliID.Value then tCli.FindKey([SaveID]);
    if (SaveID=tCliID.Value) and SaveEdit and (tCli.State<>dsEdit) then tCli.Edit;
  end;
end;

begin
  if tITranFidFator.IsNull then begin
    tITranFidFator.Value := 0;
    if gConfig.FidAtivo and (tITranTipoItem.Value in [itSessao, itMovEst, itTempo, itImpressao]) then
    begin  
      tITranFidFator.Value := 1;
      if tITranPago.Value=0 then 
        tITranFidPontos.Value := 0
      else  
        case tITranTipoItem.Value of
          itSessao, itTempo : 
            tITranFidPontos.Value := gConfig.CalcPontos(tITranPago.Value, tpfSessao);
  
          itMovEst    : 
            tITranFidPontos.Value := gConfig.CalcPontos(tITranPago.Value, tpfVenda);
            
          itImpressao :
            tITranFidPontos.Value := gConfig.CalcPontos(tITranPago.Value, tpfImp);
        end;
    end;
  end;
  
  tITranFidMov.Value := (tITranFidPontos.Value<>0) and (tITranFidFator.Value<>0);
  if tTran.Active and (tTranID.Value=tITranTran.Value) then 
    tITranCliente.Value := tTranCliente.Value;

  AjustaPontos;  
end;

procedure TDM.tITranCalcFields(DataSet: TDataSet);
begin
  if tITranCancelado.Value or 
    (tITranCaixa.Value=0) or
    (tITranTipoTran.Value in [trEstCompra, trEstEntrada, trEstSaida, trPagDebito]) or
    ((tITranSessao.Value>0) and (tITranTipoTran.Value<>trFimSessao)) 
  then
    tITranDebito.Value := 0 else
    tITranDebito.Value := tITranTotal.Value - tITranDesconto.Value - tITranPago.Value;
end;

procedure TDM.tMovEstCalcFields(DataSet: TDataSet);
begin
  if tMovEstCancelado.Value or tMovEstNaoControlaEstoque.Value then
    tMovEstFator.Value := 0
  else
  if tMovEstEntrada.Value then
    tMovEstFator.Value := 1
  else
    tMovEstFator.Value := -1;
  tMovEstSaldoPost.Value := tMovEstEstoqueAnt.Value + (tMovEstFator.Value * tMovEstQuant.Value);
end;

function TDM.TotalDeb(aCliente: Integer): Currency;
var Q: TnxQuery;
begin
  Q := TnxQuery.Create(nil);
  try
    Q.Database := nxDB;
    Q.SQL.Text := 'select sum(valor) as debito from debito where cliente = '+IntToStr(aCliente);
    Q.Active := True;
    Result := Q.FieldByName('debito').AsCurrency;
  finally
    Q.Free;
  end;
end;

procedure TDM.TransferirMaq(aOrigem, aDestino: Word; Sessao: TncSessao; aFunc: String);
begin
  InitTran([tSessao, tTran, tITran, tCli, tCaixa], True);
  try
    if tSessao.FindKey([Sessao.ID]) then begin
      tSessao.Edit;
      tSessaoTransfMaq.Value := True;
      tSessaoMaq.Value := aDestino;
      tSessaoFimTicksUsados.Value := 0;
      tSessao.Post;

      tTran.Insert;
      tTranMaq.Value := aOrigem;
      tTranDataHora.Value := Now;
      tTranCliente.Value := Sessao.Cliente;
      tTranNomeCliente.Value := Sessao.NomeCliente;
      tTranTipo.Value := trTransfMaq;
      tTranCaixa.Value := NumCaixaAberto;
      tTranFunc.Value := aFunc;
      tTranSessao.Value := Sessao.ID;
      tTranDescr.Value := 'Máquina destino = '+IntToStr(aDestino);
      tTran.Post;

      tITran.Insert;
      tITranDataHora.Value := tTranDataHora.Value;
      tITranTran.Value     := tTranID.Value;
      tITranCaixa.Value    := tTranCaixa.Value;
      tITranTipoTran.Value := trTransfMaq;
      tITranTipoItem.Value := itSessao;
      tITranItemID.Value   := Sessao.ID;
      tITranItemPos.Value  := 1;
      tITranSessao.Value   := Sessao.ID;
      tITran.Post;
    end;  
    Sessao.AtualizaCache;
    Sessao.FimTicksUsados := 0;
    Sessao.MinTicksTotal := Sessao.TicksTotal;
    Sessao.MinTicksUsados := Sessao.TempoUsado.Ticks;
    Sessao.TransferiuMaq(Sessao.Maq, aDestino);
    tSessao.Edit;
    tSessaoMinTicksTotal.Value := Sessao.MinTicksTotal;
    tSessaoMinTicksUsados.Value := Sessao.MinTicksUsados;
    tSessaoStrTransfMaq.Value := Sessao.StrTransfMaq;
    tSessao.Post;

    RefreshSessao(Sessao);
    
    nxDB.Commit;

    Sessao.Maq := aDestino;
    Sessao.TransfMaq := True;
    Sessao.Notificar(tnAlteracao);
  except
    tSessao.Cancel;
    tTran.Cancel;
    tITran.Cancel;
    nxDB.Rollback;
    Raise;
  end;
end;

procedure TDM.tTranCalcFields(DataSet: TDataSet);
begin
  if tTranCancelado.Value or 
    (tTranCaixa.Value=0) or
    (tTranTipo.Value in [trEstCompra, trEstEntrada, trEstSaida, trPagDebito]) or
    ((tTranSessao.Value>0) and (tTranTipo.Value<>trFimSessao))
  then
    tTranDebito.Value := 0 else
    tTranDebito.Value := tTranTotal.Value - tTranDesconto.Value - tTranPago.Value;
end;


{ TFidControl }

function TFidControl.CanCommit(DisableAutoPremiar: Boolean=False): Boolean;
var i: integer;
  np : Double;
begin
  for i := 0 to FList.Count - 1 do with PFidCliente(FList[i])^ do
    if (fdNew<0) and (fdNew<fdOld) then begin
      Result := False;
      Exit;
    end;
    
  Result := True;

  if (not DisableAutoPremiar) and gConfig.FidAtivo and gConfig.FidAutoPremiar and (gConfig.FidPontosPremioAuto>0) then
  for i := 0 to FList.Count - 1 do with PFidCliente(FList[i])^ do begin
    np := fdNew;
    if ((np>=gConfig.FidPontosPremioAuto) or ((gConfig.FidPontosPremioAuto-fdNew)<0.0001)) and 
       (FPremiar.IndexOf(Pointer(fdID))=-1) 
    then
      FPremiar.Add(Pointer(fdID));
  end;

  FTimer.Enabled := False;
  FTimer.Enabled := (FPremiar.Count>0);    
end;

procedure TFidControl.Clear;
begin
  while FList.Count > 0 do begin
    Dispose(PFidCliente(FList[0]));
    FList.Delete(0);
  end;
end;

constructor TFidControl.Create(aDM: TDM);
begin
  FDM := aDM;
  FPremiar := TList.Create;
  FList := TList.Create;
  FTimer := TTimer.Create(nil);
  FTimer.Interval := 500;
  FTimer.Enabled := False;
  FTimer.OnTimer := OnTimer;
end;

destructor TFidControl.Destroy;
begin
  Clear;
  FList.Free;
  FPremiar.Free;
  FTimer.Free;
  inherited;
end;

function TFidControl.Get(aID: Integer; aCreate: Boolean; aOld: Double): PFidCliente;
var i : Integer;
begin
  Result := nil;
  for I := 0 to FList.Count - 1 do 
    if PFidCliente(FList[I])^.fdID=aID then begin
      Result := PFidCliente(FList[I]);
      Break;
    end;

  if (Result=nil) and aCreate then begin
    New(Result);
    FList.Add(Result);
    Result^.fdID := aID;
    Result^.fdOld := aOld;
    Result^.fdNew := 0;
  end; 
end;

procedure TFidControl.OnTimer(Sender: TObject);
begin
  FTimer.Enabled := False;
  while FPremiar.Count>0 do begin
    csServ.Enter;
    try
      DM.PremiarCli(Integer(FPremiar[0]));
    finally
      csServ.Leave;
    end;
    FPremiar.Delete(0);
  end;
end;

procedure TFidControl.SaveChange(aID: Integer; vOld: Variant; aNew: Double);
var 
  P : PFidCliente;
  aOld : Double;
begin
  if vOld=null then
    aOld := 0 else
    aOld := vOld;
    
  P := Get(aID, True, aOld);
  P^.fdNew := aNew;
end;

{ TThreadInfoCampanha }

constructor TThreadInfoCampanha.Create(aHandle: HWND);
begin
  FHandle := aHandle;
  inherited Create(False);
end;

procedure TThreadInfoCampanha.Execute;
var IC : TInfoCampanha;
begin
  IC := ObtemInfoCampanha;
  if IC <> nil then PostMessage(FHandle, wm_infocampanha, Integer(IC), 0); 
end;

initialization
  if SysUtils.NegCurrFormat=0 then
    SysUtils.NegCurrFormat := 1;

  DM := nil;

  
end.
