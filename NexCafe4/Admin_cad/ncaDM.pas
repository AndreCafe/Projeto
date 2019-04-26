unit ncaDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, nxdb, nxllConst, nxllTypes, nxdbBase, kbmMemTable, LMDCustomComponent,
  LMDOneInstance, 
  ncClassesBase, 
  ncServRemoto,
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
  cxClasses,
  cxControls, cxGridCustomView, LMDIniCtrl, LMDVersionInfo, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdDayTime;

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


  TDados = class(TDataModule)
    tbCli: TnxTable;
    tbPro: TnxTable;
    tbTran: TnxTable;
    tbProCodigo: TStringField;
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
    ServRem: TncServidorRemoto;
    CM: TClienteNexCafe;
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
    nxTCPIP: TnxWinsockTransport;
    tbCliNome: TStringField;
    tbCliEndereco: TStringField;
    tbCliBairro: TStringField;
    tbCliCidade: TStringField;
    tbCliUF: TStringField;
    tbCliCEP: TStringField;
    tbCliNasc: TDateTimeField;
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
    tbChatDe: TSmallintField;
    tbChatPara: TSmallintField;
    tbChatDataHora: TDateTimeField;
    tbChatTexto: TMemoField;
    tbChatDiz: TStringField;
    tbChatMaq: TIntegerField;
    Reg: TLMDIniCtrl;
    mtTT: TkbmMemTable;
    mtTTDescr: TStringField;
    mtTTTipo: TSmallintField;
    mtTTCodigo: TIntegerField;
    dsTT: TDataSource;
    mtTTMinutos: TIntegerField;
    mtTTValor: TCurrencyField;
    mtTTTipoAcesso: TIntegerField;
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
    VI: TLMDVersionInfo;
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
    tbTipoImp: TnxTable;
    dsTipoImp: TDataSource;
    tbTipoImpID: TWordField;
    tbTipoImpNome: TStringField;
    tbTipoImpImpressora: TStringField;
    tbTipoImpValor: TCurrencyField;
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
    mtTTID: TAutoIncField;
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
    tbTipoImpContador: TIntegerField;
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
  private
    { Private declarations }
    FUChat: Integer;
  public
    SessoesFinalizadas : TStringList;
    procedure AbreDB;
    procedure FecharDB;
    function ControlaSaldo(aProduto: String): Boolean;
    { Public declarations }
    procedure AbreCaixa;
    procedure TotalizaDebCli(Cli: Integer);
    procedure RefreshTipoCred;
    procedure RefreshCaixaAberto;
    function TotalCreditos: Integer;
    function TotalDebitos: Double;
    function LimiteDebito(F: TField): Double;
    procedure NovoMovEst(aTipoTran: Integer);
    procedure EditarMovEst(ME: TncMovEst);
    procedure ImprimeRecibo(aTran: Integer);

    procedure EditarSessao(S: TncSessao);

    procedure AjustaCampoLocalizaCli;

    property UChat: Integer
      read FUChat write SetUChat;
//    function ObtemAguardando: Double;
  end;

  function DateTimeToTempo(DT: TDateTime; Unid: String): Double;
  procedure GetInfoCor(Itens, Cores: TStrings; S: String; var IC: TInfoCor);
  
  procedure TransfDados(TF, TD: TDataset);
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
  
  

  procedure ChecaCaixa;
  
  
function InitTran(aDB: TnxDatabase;
                  const aTables : array of TnxTable;
                  aWith : Boolean): Boolean;
  
var
  Dados: TDados;
  NumAcessoPagto: Integer;
  MaisDeUm : Boolean = False;  
  ServidorRemoto : Boolean = False;
  Conectando: Boolean = False;
  
const
  DelimitaSt = #13#10;
  
  Fechando : Boolean = False;

var  
  DirUA : String;   // Direitos do usuário atual
  DiaAberto : TDateTime;
  NumAberto : Integer;

implementation

uses ncaFrmPri, ufmFormBase, ncafbMaquinas, ncDMServ, ncaFrmSessao, ncaFrmME,
  ncaFrmVendaProd, ncafbCaixa, ncaDMComp;

{$R *.DFM}

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
    if Copy(S, 7, 2)='00' then
      S := Copy(S, 1, 6);
    if Copy(S, 4, 2)='00' then
      S := Copy(S, 1, 3) + Copy(S, 7, 3);
    if Copy(S, 1, 2)='00' then
      S := Copy(S, 4, 10);
    while (S>'') and (S[1]='0') do Delete(S, 1, 1);
  end;
  Result := S;
end;


procedure ChecaCaixa;
begin
  if NumAberto<1 then 
    Raise Exception.Create('O caixa está fechado');
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
  if (ALayout<>'padrao') and (ALayout<>'especial') then
    Result := Result + '.' + MasterParentName(C);
end;

procedure LeLayout(AGrid: TcxGrid; ALayout: String);
var 
  M: TStream;
  GV : TcxCustomGridView;
begin
  if not Dados.tbLayout.Active then Exit;
  with Dados do 
  if tbLayout.FindKey([True, GridClassName(AGrid, ALayout), 'todos', ALayout]) then begin
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
  
    if tbLayout.FindKey([True, GridClassName(AGrid, ALayout), 'todos', ALayout]) then
      tbLayout.Edit
    else
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
      tbLayoutUsuario.Value := 'todos';
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
  Result := (T.FieldByName('Caixa').AsInteger<=0) or
            ((NumAberto>0) and
             (T.FieldByName('Caixa').AsInteger=NumAberto));
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
  if Unid = 'Horas' then
    Result := Frac(DT) * 24
  else
  if Unid = 'Minutos' then
    Result := Frac(DT) * (24 * 60)
  else
  if Unid = 'Segundos' then
    Result := Frac(DT) * (24 * 60 * 60)
  else
    Result := 0;
end;

procedure TDados.AbreDB;
begin
  nxTCPIP.Enabled := False;
  nxTCPIP.ServerName := ServRem.Host;
  nxTCPIP.Port := 16200;
  nxTCPIP.Enabled := True;
  session.Active:= true;
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
  tbTipoImp.Open;
  tbPatro.Open;

  RefreshCaixaAberto;

  mtUsuario.DisableControls;
  try
    mtUsuario.Active := True;
    mtUsuario.EmptyTable;
    CM.Usuarios.SalvaDataset(mtUsuario);
    mtUsuario.First;
  finally
    mtUsuario.EnableControls;
  end;

  mtMaquina.DisableControls;
  try
    mtMaquina.Active := True;
    mtMaquina.EmptyTable;
    CM.Maquinas.SalvaDataset(mtMaquina);
    mtMaquina.First;
  finally
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

procedure TDados.DataModuleCreate(Sender: TObject);
var S: String;
begin
  S := ExtractFilePath(ParamStr(0))+'ncadmin.exe';
  if FileExists(S) then
    DeleteFile(S);
    
  mtMaquina.Active := True;
  S := ExtractFilePath(ParamStr(0))+'Ajuda';
  if not DirectoryExists(S) then
    mkDir(S);
    
  LeLayoutProc := @LeLayout;
  SalvaLayoutProc := @SalvaLayout;
  nxTCPIP.Enabled := False;
  nxTCPIP.Port := 16100;
  nxTCPIP.Enabled := True;
  SessoesFinalizadas := TStringList.Create;
  DiaAberto := 0;
  NumAberto := -1;
  DirUA := '';
  if MaisDeUm then Exit;
  FUChat := Reg.ReadInteger('', 'UChat', 0);
end;

procedure TDados.FFTblMgrPause;
begin
  Application.ProcessMessages;
end;

procedure TDados.NovoMovEst(aTipoTran: Integer);
var ME: TncMovEst;
begin
  ChecaCaixa;
  ME := TncMovEst.Create;
  try
    ME.Tipo := aTipoTran;
    ME.Operacao := osIncluir;
    if TFrmME.Create(nil).Editar(True, ME, True) then 
      CM.SalvaMovEst(ME);
  finally
    ME.Free;
  end;
end;

function TDados.LimiteDebito(F: TField): Double;
begin
  if F.IsNull then
    Result := tbConfigLimitePadraoDebito.Value
  else
    Result := F.AsFloat;  
end;

procedure TDados.SoUmProgCustom(Sender: TObject);
begin
  MaisDeUm := True;
  ShowMessage('Já existe um CM-Admin sendo executado!');
end;

procedure TDados.CMAoDesativar(Sender: TObject);
begin
  if not Conectando then begin
    Session.Active := False;
    Application.Terminate;
  end;  
end;

procedure TDados.SetUChat(const Value: Integer);   
begin
  if Value=FUChat then Exit;
  FUChat := Value;
  Reg.WriteInteger('', 'UChat', FUChat);
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
  if mtUsuario.Locate('Username', U.Username, []) then 
    mtUsuario.Edit
  else
    mtUsuario.Append;  
  U.SalvaDataset(mtUsuario);
  mtUsuario.Post;
end;

procedure TDados.CMAoDestruirUsuario(Sender: TObject);
begin
  if not mtUsuario.Active then Exit;
  with TncUsuario(Sender) do
  if mtUsuario.Locate('Username', Username, []) then
    mtUsuario.Delete;
end;

procedure TDados.CMAoReceberChat(Sender: TObject; MsgID, De, Para: Integer;
  DataHora: TDateTime; Texto: string);
begin
  UChat := MsgID;
  FrmPri.FrmChat.MsgEnv(DataHora, De, Para, Texto);
end;

function TDados.ControlaSaldo(aProduto: String): Boolean;
var SIndex: String;
begin
  Result := True;
  SIndex := tbPro.IndexName;
  tbPro.IndexName := 'ICodigo';
  try
    Result := (not tbPro.FindKey([aProduto])) or (not tbProNaoControlaEstoque.Value);
  finally
    tbPro.IndexName := SIndex;
  end;
end;

procedure TDados.CMAoAtualizarMaquina(Sender: TObject);
var 
  AguardaAnt: Boolean;
  S: String;
  FI : PfmFormInfo;
  M: TncMaquina;
  N: Integer;
begin
  if not mtMaquina.Active then Exit;
  N := mtMaquinaNumero.Value;
  mtMaquina.DisableControls;
  try
    M := TncMaquina(Sender);
    if mtMaquina.Locate('Numero', M.Numero, []) then
      mtMaquina.Edit
    else begin
      FI  := FrmPri.FM.FormByClass(TfbMaquinas);
      if (FI<>nil) and (FI^.fiInstance<>nil) then
        TfbMaquinas(FI^.fiInstance).RefreshCacheMaq;
      mtMaquina.Append;
    end;
    M.SalvaDataset(mtMaquina);
    mtMaquina.Post;
  finally
    mtMaquina.Locate('Numero', N, []);
    mtMaquina.EnableControls;
  end;
  mtMaquina.Refresh;   
end;

procedure TDados.CMAoAtualizarSessao(Sender: TObject);
var 
  FI: PfmFormInfo;
  I : Integer;
  S : TncSessao;
begin
  S := TncSessao(Sender);
  FI  := FrmPri.FM.FormByClass(TfbMaquinas);
  if (FI<>nil) and (FI^.fiInstance<>nil) then begin
    if S.Maq = mtMaquinaNumero.Value then
      TfbMaquinas(FI^.fiInstance).RefreshBotoes;
    TfbMaquinas(FI^.fiInstance).Timer2.Enabled := True;
  end;

  FrmPri.ListaEspera.FiltraDados;

  if S.Encerrou then begin
    I := SessoesFinalizadas.IndexOf(IntToStr(S.ID));
    if I >= 0 then begin
      SessoesFinalizadas.Delete(I);
      if Application.ActiveFormHandle = FrmPri.Handle then
        EditarSessao(S);
    end;
  end;
  
end;

procedure TDados.CMAoAtualizarTarifa(Sender: TObject);
var I : Integer;
begin
  for I := 0 to CM.Sessoes.Count-1 do 
    CM.Sessoes[I].Tarifador.Reset;
end;

procedure TDados.CMAoDestruirMaquina(Sender: TObject);
var 
  M : TncMaquina;
  FI: PfmFormInfo;
begin
  if not mtMaquina.Active then Exit;
  M := TncMaquina(Sender);
  
  if mtMaquina.Locate('Numero', M.Numero, []) then begin
    FI  := FrmPri.FM.FormByClass(TfbMaquinas);
    if (FI<>nil) and (FI^.fiInstance<>nil) then
      TfbMaquinas(FI^.fiInstance).RefreshCacheMaq;
    mtMaquina.Delete;
  end; 
end;

procedure TDados.CMAoDestruirSessao(Sender: TObject);
var FI: PfmFormInfo;
begin
  FI  := FrmPri.FM.FormByClass(TfbMaquinas);
  if (FI<>nil) and (FI^.fiInstance<>nil) then 
    TfbMaquinas(FI^.fiInstance).Timer2.Enabled := True;
  FrmPri.ListaEspera.FiltraDados;
end;

procedure TDados.mtMaquinaCalcFields(DataSet: TDataSet);
begin
{  mtMaquinaConectado.Value := (mtMaquinaCliente.Value>0);
  if mtMaquinaAcesso.Value > 0 then 
    mtMaquinaLimiteTempoDT.Value := TicksToDateTime(mtMaquinaLimiteTempo.Value)
  else
    mtMaquinaLimiteTempoDT.Value := 0;
      
  if mtMaquinaContato.Value > 0 then
    mtMaquinaMostrar.Value := mtMaquinaNomeContato.Value
  else
    mtMaquinaMostrar.Value := mtMaquinaNome.Value;  
  mtMaquinaTotalFinal.Value := mtMaquinaAcesso.Value + mtMaquinaVendas.Value;
  mtMaquinaManutencao.Value := (mtMaquinaTipoTran.Value=ttManutencao); }
end;

function Permitido(TipoAcesso: Integer): Boolean;
begin
  if Dados.CM.UA.Admin then
    Result := True
  else        
    Result := ItemTrueStr(Dados.CM.UA.Direitos, TipoAcesso);
end;

procedure TDados.AbreCaixa;
begin
  if SimNao('Confirma abertura do caixa de '+FormatDateTime('dd/mm/yyyy hh:mm', Now)) then begin
    CM.AbrirCaixa;
    Self.RefreshCaixaAberto;
  end;
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
end;

procedure TDados.ImprimeRecibo(aTran: Integer);
begin

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
    S := 'Atendente diz';
    tbChatMaq.Value := tbChatPara.Value;
  end else begin
    S := 'Máquina diz';
    tbChatMaq.Value := tbChatDe.Value;
  end;
    
  tbChatDiz.Value := FormatDateTime('hh:mm:ss', tbChatDataHora.Value) + ' - ' + S;
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
end;

procedure TDados.RefreshTipoCred;
begin
  dsTT.Dataset := nil;
  try
    mtTT.Active := True;
    mtTT.EmptyTable;
    mtTT.Append;
    mtTTTipo.Value := tctPrevisao;
    mtTTDescr.Value := 'Previsão de Tempo';
    mtTTCodigo.Value := 0;
    mtTT.Post;

    mtTT.Append;
    mtTTTipo.Value := tctAvulso;
    mtTTDescr.Value := 'Crédito de Tempo';
    mtTTCodigo.Value := 0;
    mtTT.Post;
  
    tbTipoPass.First;
    while not tbTipoPass.Eof do begin
      mtTT.Append;
      mtTTTipo.Value := tctPassaporte;
      mtTTDescr.Value := tbTipoPassNome.Value;
      mtTTCodigo.Value := tbTipoPassiD.Value;
      mtTTMinutos.Value := tbTipoPassMinutos.Value;
      mtTTValor.Value := tbTipoPassValor.Value;
      mtTTTipoAcesso.Value := tbTipoPassTipoAcesso.Value;
      mtTT.Post;
      tbTipoPass.Next;
    end;
  
    tbPacote.First;
    while not tbPacote.Eof do begin
      mtTT.Append;
      mtTTTipo.Value := tctPacote;
      mtTTDescr.Value := tbPacoteDescr.Value;
      mtTTCodigo.Value := tbPacoteiD.Value;
      mtTTMinutos.Value := tbPacoteMinutos.Value;
      mtTTValor.Value := tbPacoteValor.Value;
      mtTT.Post;
      tbPacote.Next;
    end;

    mtTT.Append;
    mtTTTipo.Value := tctCartaoTempo;
    mtTTDescr.Value := 'Cartão de Tempo';
    mtTTCodigo.Value := 0;
    mtTT.Post;
  
    mtTT.First;
  finally
    dsTT.Dataset := mtTT;
  end;
end;

procedure TDados.TotalizaDebCli(Cli: Integer);
var Debito: Double;
begin
  Q.Active := False;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT ' +
            '  Sum(Valor) as TotDeb ' +
            'FROM Debito ' +
            'WHERE '+
            '  Cliente='+IntToStr(Cli));
  Q.Open;
  Debito := Q.FieldByName('TotDeb').AsCurrency;
  tbCli.CancelRange;
  tbCli.IndexName := 'ICodigo';            
  if tbCli.FindKey([Cli]) then begin
    tbCli.Edit;
    tbCliDebito.Value := Debito;
    tbCliTemDebito.AsBoolean := (Debito>0.0009);
    tbCli.Post;
  end;
  Q.Active := False;
end;

function TDados.TotalDebitos: Double;
begin
  Q.Active := False;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT Sum(D.Valor) as TotDeb FROM Debito D, Cliente C where C.ID = D.Cliente');
  Q.Open;
  Result := Q.FieldByName('TotDeb').AsCurrency;
end;

function TDados.TotalCreditos: Integer;
begin
  Q.Active := False;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT SUM(Minutos) as Minutos From Cliente where (Minutos>0)');
  Q.Open;
  Result := Trunc(Q.FieldByName('Minutos').AsFloat);
end;

procedure TDados.EditarMovEst(ME: TncMovEst);
var 
  B: TncItensMovEst;
  Str: String;
  S: TncSessao;
  IME: TncItemMovEst;
begin
  B := TncItensMovEst.Create;
  try
    Str := ME.Itens.AsString;
    if ME.Sessao=0 then begin
      if TFrmME.Create(nil).Editar(False, ME, (not ME.Cancelado) and (NumAberto=ME.Caixa)) then begin
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
        ME.Desconto := ME.Itens[0].imDesconto;
        CM.SalvaMovEst(ME);
      end;
    end;
  finally
    B.Free;
  end;
end;

procedure TDados.EditarSessao(S: TncSessao);
var SA, SN: TncSessao;
begin
  if (S=nil) then Exit;
  SA := TncSessao.Create(True);
  SN := TncSessao.Create(True);
  try
    SA.Assign(S);
    SN.Assign(S);
    if TFrmSessao.Create(nil).Editar(SN) then begin
      SA.Assign(SN);
      SA.Vendas.AsString := S.Vendas.AsString;
      SA.Tempos.AsString := S.Tempos.AsString;
      SA.Impressoes.AsString := S.Impressoes.AsString;
      SA.Vendas.AjustaOperacao(SN.Vendas);
      SA.Tempos.AjustaOperacao(SN.Tempos);
      SA.Impressoes.AjustaOperacao(SN.Impressoes);
      Dados.CM.AlteraSessao(SA);
    end;
  finally
    SA.Free;
    SN.Free;
  end;
end;

procedure TDados.AjustaCampoLocalizaCli;
var Campo: String;
begin
  case tbConfigCampoLocalizaCli.Value of
    1 : begin
      TVLUsername.Index := 0;
      TVLNome.Index := 1;
      TVL.OptionsBehavior.IncSearchItem := TVLUsername;
      tbCli.IndexName := 'IUsername';
    end;
    2 : begin
      TVLCodigo.Index := 0;
      TVLNome.Index := 1;
      TVL.OptionsBehavior.IncSearchItem := TVLCodigo;
      tbCli.IndexName := 'IID';
    end;
  else
    TVL.OptionsBehavior.IncSearchItem := TVLNome;
    TVLUsername.Index := 1;
    TVLNome.Index := 0;
    tbCli.IndexName := 'INome';
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

procedure TDados.CMAoAbrirFecharCx(Sender: TObject);
var FI : PfmFormInfo;
begin
  RefreshCaixaAberto;
  FI := FrmPri.FM.FormByClass(TfbCaixa);
  if FI^.fiInstance<>nil then
    FI^.fiInstance.FiltraDados;
end;

procedure TDados.CMAoAtualizarConfig(Sender: TObject);
var I : Integer;
begin
  tbConfig.Refresh;
  for I := 0 to CM.Sessoes.Count-1 do 
    CM.Sessoes[I].Tarifador.Reset;
end;

end.
