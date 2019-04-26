unit ncClassesBase;
{
    ResourceString: Dario 12/03/13
}

interface 

uses
  Classes,
  CacheProp,
  ClasseCS,
  SysUtils,
  Messages,
  Windows,
  Dialogs,
  DB,
  uFaixaInteger,
  uLicEXECryptor,
  ncMsgCom,
  kbmUtils,
  SyncObjs,
  madKernel,
  Variants,
  ncErros, uNexTransResourceStrings_PT;

const
  wm_registrapag = wm_user;
  wm_processacotas = wm_user + 1;
  wm_processaplus = wm_user + 2;
  wm_abreserv = wm_user + 3;
  wm_alterouchorario = wm_user + 4;
  wm_vendaplus = wm_user + 5;
  wm_abreaba = wm_user + 6;
  wm_removesession = wm_user + 7;
  wm_salvatranpopup = wm_user + 8;
  wm_DownloadIntInfo = wm_user + 9;
  wm_autoprintpdf = wm_user + 10;
  wm_refreshurls = wm_user + 11;

// Posição da barra de login do NexGuard
  poslogin_centro = 0;
  poslogin_topo   = 1;
  poslogin_rodape = 2;  
  

const
  classid_TncMovEst          = 11;
  classid_TncCredTempo       = 12;
  classid_TncPagEspecie      = 13;
  classid_TncPagEspecies     = 14;
  classid_TncTransacao       = 15;
  classid_TncPassaporte      = 16;
  classid_TncCredTempos      = 17;
  classid_TncMsgCli          = 18;
  classid_TncMsgCliList      = 19;
  classid_TncItemMovEst      = 20;
  classid_TncItensMovEst     = 21;
  classid_TncImpressao       = 22;
  classid_TncImpressoes      = 23;
  classid_TncSessao          = 24;
  classid_TncTransacoes      = 25;
  classid_TncPassaportes     = 26;
  classid_TncPausas          = 27;
  classid_TncAppUrlLogItem   = 28;
  classid_TncAppUrlLog       = 29;
  classid_TncItemDebito      = 30;
  classid_TncItensDebito     = 31;
  classid_TncTempo           = 32;
  classid_TncTempos          = 33;
  classid_TncItemListaEspera = 34;
  classid_TncListaEspera     = 35;
  
  wm_biometria = wm_user + 100;
  wm_infocampanha = wm_user + 101;
  wm_atualizadireitosconfig = wm_user + 102;
  
  // Modo de exibir o cronômetro nas máquinas clientes quando o cliente possui créditos
  mecApenasCredValidos   = 0;
  mecMostrarTotal        = 1;

  prefixo_versao = 'X';
  nomeprog       = 'NexCafé';

  // tamanho tela
  tamTelaNormal = 0;
  tamTelaPDV1   = 1;
  
  // conteudo do caixa por e-amil
  cceResumoFin        = 0;
  cceMovEstoque       = 1;
  cceEstoqueAbaixoMin = 2;
  cceImpressoes       = 3;
  cceTransacoesCanc   = 4;
  cceTransacoesDesc   = 5;
  cceTransacoesObs    = 6;
  ccePagEsp           = 7;

  // opção de censura horário
  opchSemCensura  = 1;
  opchCHorario    = 2;
  opchCensuraEsp  = 3;
  

  TicksPorSegundo = 1000;
  TicksPorMinuto  = 60 * TicksPorSegundo;
  TicksPorHora    = 60 * TicksPorMinuto;
  TicksPorDia     = 24 * TicksPorHora;

  opcota_liberarauto = 0;
  opcota_confirmar   = 1;

  printeng_adobe    = 0;
  printeng_clprint  = 1;
  printeng_gnostice = 2;
  
  opexcesso_cancelarauto = 0;
  opexcesso_confirmar = 1;
  
// Opcao de repetição de tarifa
  rtUltima = 0;
  rtTodas  = 1;
  rtDesde  = 2;

// Direitos da Maquina
  dmNenhum  = 0;
  dmFree    = 1;
  dmPremium = 2;
  dmDef     = 3;  
  dmParcial = 4;

// Opcao de Tipo de Divisao de Tarifa por Minuto
  tdtPorTempo = 0;
  tdtPorValor = 1;  
  
  eppPausarAcesso   = 0;
  eppEncerrarAcesso = 1;

  SessionUser = 'admin';
  SessionPass = 'delphi9856';

  PortaKBMMW = 41592;

  Campos_Avisos : Array[0..5] of TkbmuFieldDef = (
    (fdName:'Minutos';          fdType: ftWord;      fdSize:0;    fdPrec:0),
    (fdName:'AvisoTexto';       fdType: ftString;    fdSize:50;   fdPrec:0),
    (fdName:'SegAvisoTexto';    fdType: ftSmallInt;  fdSize:0;    fdPrec:0),
    (fdName:'PiscarAvisoTexto'; fdType: ftBoolean;   fdSize:0;    fdPrec:0),
    (fdName:'Som';              fdType: ftBlob;      fdSize:0;    fdPrec:0),
    (fdName:'Tipo';             fdType: ftSmallInt;  fdSize:0;    fdPrec:0));

  BitsH : Array[0..23] of Cardinal = (
   $1,
   $2,
   $4,
   $8,
   $10,
   $20,
   $40,
   $80,
   $100,
   $200,
   $400,
   $800,
   $1000,
   $2000,
   $4000,
   $8000,
   $10000,
   $20000,
   $40000,
   $80000,
   $100000,
   $200000,
   $400000,
   $800000);

  // Opções de Bloqueio quando cair a rede
  obPermitePrePago = 0;
  obPermitePosPago = 1;
  obBloqueioTotal  = 2;
  obFecharCMGuard  = 3; 

  // Status de Impressão
  siPausado     = 0;
  siProcessando = 1;
  siRegistrou   = 2;

  BoolStr : Array[Boolean] of Char = ('0', '1');
  BoolString : Array[Boolean] of String = ('False', 'True');

  mdDemo     = -1;
  mdLiberado = 0;
  MinCreditoLoginMS = 5000;

  HorasSemana = 7 * 24;
  SegundosPorDia = 60 * 60 * 24;
  MSPorDia = SegundosPorDia * 1000;
  MSPorSemana = MSPorDia * 7;

  operLogoff    = 0;
  operShutdown  = 1;
  operReboot    = 2;
  operFecharNex = 3;

  // Controle de Impressoes
  ciDesativado = 0;
  ciMonitorar  = 1;
  ciRegistrar  = 2;
  
  // Tipos de Transação
{  ttAcesso            = 0;
  ttVendaPacote       = 1;
  ttCreditoTempo      = 2;
  ttManutencao        = 3;
  ttAcessoVenda       = 4;
  ttDebitoTempo       = 5;
  ttSinal             = 6;
  ttEstVenda          = 7;
  ttEstCompra         = 8;
  ttEstEntrada        = 9;
  ttEstSaida          = 10;
  ttPagtoDebito       = 11;
  ttSuprimentoCaixa   = 12;
  ttSangriaCaixa      = 13;
  ttVendaPassaporte   = 14;}

  trInicioSessao  = 0;
  trFimSessao     = 1;
  trCredTempo     = 2;
  trDebTempo      = 3;
  trEstVenda      = 4;
  trEstCompra     = 5;
  trEstEntrada    = 6;
  trEstSaida      = 7;
  trPagDebito     = 8;
  trCaixaEnt      = 9;
  trCaixaSai      = 10;
  trImpressao     = 11;
  trTransfMaq     = 12;
  trCorrDataCx    = 13;
  trAjustaFid     = 14;
  trEstVendaWeb   = 15;

  tipomaq_maqmesa = 0;
  tipomaq_comanda = 1;
  tipomaq_avulso  = 2;   // consumo de cliente que não está em uma mesa ou usando cartão de consumo/comanda

  itSessao    = 0;
  itMovEst    = 1;
  itTempo     = 2;
  itTran      = 3;
  itImpressao = 4;
  itAjustaFid = 5;

// Tipo de Operação Fidelidade
  tofNenhum   = 0;
  tofAcumulo  = 1;
  tofResgate  = 2;
  tofCorrecao = 3;

// Tipo Prêmio Automático
  tpaPac = 0;
  tpaPassaporte = 1;  

// Tipo Ponto Fidelidade
  tpfSessao = 0;
  tpfVenda  = 1;
  tpfImp    = 2;  

  // Tipo Cliente   
  tcNormal     = 0;
  tcCliGratis  = 1;
  tcManutencao = 2;

  // Tipos de Crédito de Tempo
  tctPrevisao   = 0;
  tctAvulso     = 1;
  tctPassaporte = 2;
  tctPacote     = 3;
  tctCartaoTempo= 4;
  tctLivre      = 5;
  tctDiv        = 6;
  tctDiv2       = 7;
  
  // Modos de Pagamento
  mpgTelaPagtoAutomatica = 0;
  mpgDuploCliqueMaq      = 1;
  mpgSomenteTransacoes   = 2;

  StTipoTransacao : Array[trInicioSessao..trAjustaFid] of String = (
    'Inicio de Sessão',
    'Fim de Sessão',
    'Crédito Tempo',
    'Débito Tempo',
    'Venda',
    'Compra',
    'Entrada Estoque',
    'Saida Estoque',
    'Pagamento Débito',
    'Suprimento Caixa',
    'Sangria Caixa',
    'Impressão',
    'Transf.Máquina',
    'Correção Data Caixa',
    'Correção Pontos Fid');

  AbrevTipoTransacao : Array[trInicioSessao..trAjustaFid] of String = (
    'Inicio',
    'Fim',
    'Cred.Tempo', 
    'Déb.Tempo',
    'Venda',
    'Compra',
    'Entrada Est',
    'Saida Est.',
    'Pg.Débito',
    'Suprimento',
    'Sangria',
    'Impressão',
    'Transf.Máq',
    'Corr.Data.Cx',
    'Corr.Pontos');
    

  // Tipos de Classes
  tcMaquina    = 1;
  tcCliente    = 2;
  tcUsuario    = 4;
  tcConfig     = 6;
  tcTipoAcesso = 7;
  tcTarifa     = 8;
  tcSessao     = 9;
  tcMovEst     = 10;
  tcJob        = 11;
  tcTipoImp    = 12;
  tcPrintDoc   = 13;
  tcEspecie    = 14;

  ProxyUsername = 'proxy';
  ProxySenha    = 'proxypass';

  // Tipo Expiração
  teNunca       = 0;
  teDias        = 1;
  teHoras       = 2;
  teAcessos     = 3;
  teDataMarcada = 4;

  // Operacao Salvar
  osNenhuma = 0;
  
  osIncluir = 1;
  osAlterar = 2;
  osExcluir = 3;
  osCancelar = 4;

  // Tipos de Tipos de Acesso
  ttaServico = 0;
  ttaCliente = 1;
  ttaMaquina = 2;

  // Opcoes para Chat
  ochJanelaVisivel   = 0;
  ochJanelaEscondida = 1;
  ochDesabilitar     = 2;

  // PM_CalcValorCli
  pm_cvc_Intervalo = 0;
  pm_cvc_Minimo    = 1;
  pm_cvc_Maximo    = 2;

  // JOb Control
  jc_pause  = 0;
  jc_resume = 1;
  jc_delete = 2;

  BoolToString : Array[Boolean] of String[5] = ('False', 'True');

  chFldDelim = #1'nexflddelim';
  chListaDelim = #2'nexlistdelim';

  recurso_vendadireta = 1;
  recurso_vendabalcao = 2;
  recurso_alimentacao = 3;

type

  TInfoCampanha = class
    icCampanha : String;
    icutmccn   : String;
    icutmctr   : String;
    icutmcct   : String;
    icutmcmd   : String;
    icutmcsr   : String;
  end;
  
  TSessionSocket = record
    ssSession : Integer;
    ssSocket  : Integer;
    ssMaq     : Word;
  end;

  TFaixaIntItem = record
    fiDe, fiAte: Integer;
  end;  
    
  TArraySessionSocket = Array of TSessionSocket;
  TArrayTempo = Array[0..23] of Double;
  TArrayTipoTran = Array[trInicioSessao..trAjustaFid] of Boolean;
  PArrayTipoTran = ^TArrayTipoTran;
  ncPString = ^String;

  EErroNexCafe = class(Exception)
  public
    CodigoErro: Integer;
    ErroSocket: Integer;
    constructor Create(CE: Integer);
  end;

  TncDadosCliente = object
    dcCodigo: Integer;
    dcNome  : String;
  end;

  TncDadosTempo = object
  public  
    dtTipo      : Byte;
    dtMinutos   : Integer;
    dtValor     : Currency;
    dtCliente   : Integer;
    dtPago      : Currency;
    dtDesc      : Currency;
    dtIDPacPass : Integer;
    dtMaq       : Integer;
    
    function Igual(const aDT: TncDadosTempo): Boolean;
    function TotalFinal: Currency;
    procedure Limpa;
    procedure FromString(S: String);
    function ToString: String;
  end;


  TncServidorBase = class;
  
  TncClasse       = class;
  TncMaquina      = class;
  TncCliente      = class;
  TncUsuario      = class;
  TncTipoAcesso   = class;
  TncTarifa       = class;

  TncTarifas      = class;
  
  TTipoNotificacao = (tnCriacao, tnAlteracao, tnDestruicao);

  TProcNotificacao = procedure (Obj: TncClasse; TipoNot: TTipoNotificacao) of object;

  TncEtapa = object
    etTempo : Cardinal;
    etValor : Double;
    function etValorMin : Double;
    function etTolerancia : Cardinal;
  end;  

  TncTempo = object
  protected
    function GetDateTime: TDateTime;
    function GetHoras: Extended;
    function GetSegundos: Extended;
    function GetTicks: Int64;

    procedure SetDateTime(const Value: TDateTime);
    procedure SetHoras(const Value: Extended);
    procedure SetSegundos(const Value: Extended);
    procedure SetTicks(const Value: Int64);
  public
    Minutos: Extended;

    property DateTime: TDateTime
      read GetDateTime write SetDateTime;

    property Horas: Extended
      read GetHoras write SetHoras;

    property Segundos: Extended
      read GetSegundos write SetSegundos;

    property Ticks: Int64
      read GetTicks write SetTicks;      
  end;
  PncTempo = ^TncTempo;

  TncArrayEtapas = Array of TncEtapa;
  PncArrayEtapas = ^TncArrayEtapas;

  TncHoraTarifa = Array[1..7, 0..23] of Integer;
  PncHoraTarifa = ^TncHoraTarifa;
    
  TncClasse = class ( TClasseCS )
  private
    FProcNotificar: TProcNotificacao;
  protected
    property ProcNotificar: TProcNotificacao
      read FProcNotificar write FProcNotificar;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Notificar(TipoNot: TTipoNotificacao);
    function TipoClasse: Integer; virtual; abstract;
  end;

  TncTipoAcesso = class ( TncClasse )
  private
    FID          : Word;
    FNome        : String;
    FTarifaPadrao: Integer;
    FTipo        : Byte;
    FHoraTarifa  : TncHoraTarifa;
  protected
    function GetChave: Variant; override;

    function GetPHoraTarifa: PncHoraTarifa;
  public  
    function TipoClasse: Integer; override;
    constructor Create;

    property PHoraTarifa: PncHoraTarifa
      read GetPHoraTarifa;

    function GetHoraTarifaStr: String;
    procedure SetHoraTarifaStr(const Valor: String);

    procedure AssignTA(TA: TncTipoAcesso);
    
    function TarifaPadraoObj: TncTarifa;
    function TarifaHoraObj(D, H:  Byte): TncTarifa;
  published 
    property ID: Word
      read FID write FID;

    property Nome: String
      read FNome write FNome;

    property TarifaPadrao: Integer
      read FTarifaPadrao write FTarifaPadrao;

    property HoraTarifaStr: String
      read GetHoraTarifaStr write SetHoraTarifaStr;  
  end;

  TncTarifa = class ( TncClasse )
  private
    FTipoAcesso    : Word;
    FCor           : Integer;
    FCorFonte      : Integer;
    FDescricao     : String;
    
    FReinicia      : Boolean;
    FSemValorMin   : Boolean;
    FReiniciaDesde : Byte;
    FDivQtd        : Integer;
    FDivTipo       : Byte;
    FArredondar    : Byte;
    FPrecos        : TncArrayEtapas;

    function GetPPrecos: PncArrayEtapas;
    
  protected
    function GetChave: Variant; override;

    function GetTipoAcesso: Word; virtual;
    function GetCor: Integer; virtual;
    function GetCorFonte: Integer; virtual;
    function GetReinicia: Boolean; virtual;
    function GetDescricao: String; virtual;
    function GetPrecosStr: String; virtual;

    procedure SetTipoAcesso(Value : Word); virtual;
    procedure SetCor(Value : Integer); virtual;
    procedure SetCorFonte(Value : Integer); virtual;
    procedure SetReinicia(Value : Boolean); virtual;
    procedure SetDescricao(Value : String); virtual;
    procedure SetPrecosStr(Value: String); virtual;

  public
    constructor Create;

    property PPrecos: PncArrayEtapas
      read GetPPrecos;

    function TipoClasse: Integer; override;

    function ObtemIndProxPreco(TempoCorrido: Cardinal): Integer;
    function TicksTotal: Cardinal;

    function NumH: Byte;
    function ValorI: Currency;
    function TempoI: Cardinal;
    function ValorHora(H: Byte): Currency;
    function IndiceRepetir: Integer;
    function InicioHora(H: Byte): Integer;
    function TemValor: Boolean;
  published

    property TipoAcesso: Word
      read GetTipoAcesso write SetTipoAcesso;

    property SemValorMin: Boolean
      read FSemValorMin write FSemValorMin;  

    property Cor: Integer
      read GetCor write SetCor;
      
    property CorFonte: Integer
      read GetCorFonte write SetCorFonte;
      
    property Reinicia: Boolean
      read GetReinicia write SetReinicia;
      
    property Descricao: String
      read GetDescricao write SetDescricao;
  
    property PrecosStr: String
      read GetPrecosStr write SetPrecosStr;

    property ReiniciaDesde: Byte
      read FReiniciaDesde write FReiniciaDesde;  

    property DivQtd: Integer
      read FDivQtd write FDivQtd;
      
    property DivTipo: Byte
      read FDivTipo write FDivTipo;

    property Arredondar: Byte
      read FArredondar write FArredondar;
  end;

  TncCodBarBalInfo = object
    Codigo    : String;
    PesoValor : Double;
    BalValor  : Boolean;

    procedure Clear;
    function IsEmpty: Boolean;
  end;

  {$METHODINFO ON}
  TncConfig = class ( TncClasse )
  private
    FFecharProgramas       : Boolean;
    FAutoExecutar          : String;
    FAlertaFimTempo        : TDateTime;
    FTempoMaxAlerta        : TDateTime;
    FPermiteCapturaTela    : Boolean;
    FLimiteTempoPadrao     : TDateTime;
    FPermiteLoginSemCred   : Boolean;
    FAlteraLoginSemCred    : Boolean;                                                                 
    FPacoteTempoReal       : Boolean;
    FEncerramentoPrePago   : Byte;
    FEncerramentoCartao    : Byte;
    FTempoEPrePago         : Word;
    FTempoECartao          : Word;
    
    FVariosTiposAcesso     : Boolean;
    FModoPagtoAcesso       : Byte;
    FMostraPrePagoDec      : Boolean;
    FManterSaldoCaixa      : Boolean;
    FCliCadPadrao          : Boolean;
    FCorLivre              : Integer;
    FCorFLivre             : Integer;
    FCorUsoPrePago         : Integer;
    FCorFUsoPrePago        : Integer;
    FCorUsoPosPago         : Integer;
    FCorFUsoPosPago        : Integer;
    FCorPausado            : Integer;
    FCorFPausado           : Integer;
    FCorAguardaPagto       : Integer;
    FCorFAguardaPagto      : Integer;
    FCorManutencao         : Integer;
    FCorFManutencao        : Integer;
    FCorDesktop            : Integer;
    FCorFDesktop           : Integer;
    FCorMaqManut           : Integer;
    FCorFMaqManut          : Integer;
    FCorPrevisao           : Integer;
    FCorFPrevisao          : Integer;
    
    FTolerancia            : TDateTime;
    FRegImp98              : Boolean;

    FRecImprimir           : Byte; // 0=Nao Imprimir, 1=Imprimir Todos, 2=Imprimir Alguns
    FRecTipoImpressora     : String;
    FRecMatricial          : Boolean;
    FRecPorta              : String;
    FRecSalto              : Byte;
    FRecLargura            : Byte;
    FRecCortaFolha         : Boolean;
    FRecRodape             : String;
    FRecNomeLoja           : String;

    FMostraProgAtual       : Boolean;
    FMostraObs             : Boolean;
    FMostraNomeMaq         : Boolean;
    FEscondeTextoBotoes    : Boolean;
    FExigirRG              : Boolean;
    FControlaImp           : Byte;
    FCampoLocalizaCli      : Byte;
    FLimitePadraoDebito    : Double;
    FEscondeTipoAcesso     : Boolean;
    FNumFDesktop           : Integer;
    FNumFLogin             : Integer;
    FTipoFDesktop          : String;
    FTipoFLogin            : String;
    FFundoWeb              : Boolean;
    FFundoWebURL           : String;
    FMostrarApenasPIN      : Boolean;
    FTextoPIN              : String;
    FAlterarSenhaCli       : Boolean;
    FVerSenhaCli           : Boolean;
    FConta                 : String;
    FCodEquip              : String;
    FQtdLic                : Integer;
    FStatusConta           : TStatusConta;
    FVerPri                : Word;
    FFiltrarWEB            : Boolean;
    FSiteRedirFiltro       : String;
    FFreePremium           : Boolean;
    FDataLic               : TDateTime;
    FDVA                   : TDateTime;
    FProxAvisoAss          : TDatetime;
    FPreLib                : Boolean;
    FAssinaturaVenceEm     : TDateTime;
    FAlertaAssinatura      : Boolean;
    FJaFoiPremium          : Boolean;
    
    FEmailMetodo           : Byte;
    FEmailServ             : String;
    FEmailUsername         : String;
    FEmailSenha            : String;
    FEmailDestino          : String;
    FEmailIdent            : String;
    FEmailConteudo         : String;
    
    FEmailEnviarCaixa      : Boolean;
    FBloqDownload          : Boolean;
    FBloqDownloadExe       : Boolean;
    FBloqMenuIniciar       : Boolean;
    FBloqPainelCtrl        : Boolean;
    FBloqCtrlAltDel        : Boolean;
    FBloqExecutar          : Boolean;
    FBloqMeusLocaisRede    : Boolean;
    FBloqTray              : Boolean;
    FBloqBotaoDir          : Boolean;
    FBloqToolbars          : Boolean;

    FBloqPosPago           : Boolean;

    FFiltrarDesktop        : Boolean;
    FFiltrarMenuIniciar    : Boolean;
    
    FCredPadraoTipo        : Byte;
    FCredPadraoCod         : Integer;

    FPgVendas              : Boolean;
    FPgVendaAvulsa         : Boolean;
    FPgAcesso              : Boolean;
    FPgTempo               : Boolean;
    FPgImp                 : Boolean;
    FBloquearUsoEmHorarioNP: Boolean;
    FSalvarCodUsername     : Boolean;

    FPaginaInicial         : String;
    FEsconderCronometro    : Boolean;
    FAposEncerrar          : Byte;
    FAlinhaBarraGuard      : Byte;
    FNoNet                 : Byte;
    FTempoSumirLogin       : Word;

    FEsconderDrives        : String;
    FTempoB1               : Word;
    FTempoB2               : Word;
    FTempoB3               : Word;
    FTempoB4               : Word;
    FTempoB5               : Word;
    FTempoB6               : Word;
    FOpcaoChat             : Byte;

    FMinutosDesligaMaq     : Byte;
    FMinutosDesligaMon     : Byte;
    FContinuarCredTempo    : Boolean;
    FNaoGuardarCreditoCli  : Boolean;
    FRelCaixaAuto          : Boolean;
    FNaoMostrarMsgDebito   : Boolean;
    FNaoTransferirMaq      : Boolean;

    FNaoCobrarImpFunc      : Boolean;
    FSincronizarHorarios   : Boolean;

    FMostrarDebitoNoGuard   : Boolean;
    FBloquearLoginAlemMaxDeb: Boolean;
    FClienteNaoAlteraSenha  : Boolean;
    FNaoObrigarSenhaCliente : Boolean;
    FNaoVenderAlemEstoque   : Boolean;
    FCreditoComoValor       : Boolean;

    FCliAvulsoNaoEncerra    : Boolean;
    FAutoSortGridCaixa      : Boolean;
    FAvisoFimTempoAdminS    : Byte;
    FDetectarImpServ        : Boolean;

    FAvisoCreditos          : Boolean;
    FClientePodeVerCred     : Boolean;
    FChatAlertaSonoro       : Boolean;
    FChatMostraNotificacao  : Boolean;

    FModoCredGuard          : Byte;
    FMsgFimCred             : String;
    FSemLogin               : Boolean;
    
    FFidAtivo               : Boolean;
    FFidSessaoValor         : Currency;
    FFidSessaoPontos        : Integer;
    FFidVendaValor          : Currency;
    FFidVendaPontos         : Integer;
    FFidImpValor            : Currency;
    FFidImpPontos           : Integer;
    FFidParcial             : Boolean;
    FFidAutoPremiar         : Boolean;
    FFidTipoPremioAuto      : Byte;
    FFidPremioAuto          : Integer;
    FFidPontosPremioAuto    : Integer;
    FFidMostrarSaldoGuard   : Boolean;
    FFidMostrarSaldoAdmin   : Boolean;
    FFidMsg                 : Boolean;
    FFidMsgTitulo           : String;
    FFidMsgTexto            : String;
    
    FCliCadNaoEncerra       : Boolean;
    FImpedirPosPago         : Boolean;
    FAutoLigarMaqCli        : Boolean;
    
    FAutoObsAoCancelar      : Boolean;

    FPastaDownload          : String;
    FBiometria              : Boolean;
    
    FPMPausaAutomatica      : Boolean;
    FPMConfirmaImpCliente   : Boolean;
    FPMConfirmaImpAdmin     : Boolean;
    FPMAdminControlaImp     : Boolean;
    FPMMostrarPaginasCli    : Boolean;
    FPMMostrarValorCli      : Boolean;
    FPMCalcValorCli         : Byte; // 0=intervalo, 1=mínimo, 2=máximo 
    FPMPromptValorCli       : String;
    FPMObsValorCli          : String;
    FPMValorMin             : Currency;
    FPMValorMax             : Currency;
    FPMPausarServ           : Boolean;
    FPMNaoPausar            : String;
    
    FPMCotas                : Boolean;
    FPMCotasMaxPagDia       : Integer;
    FPMCotasMaxPagMes       : Integer;
    FPMCotasOpCota          : Byte;    // 0-confirmar impressao, 1-liberar automaticamente
    FPMCotasOpExcesso       : Byte;    // 0-atendente pode liberar, 1-cancelar imp, 2-cobrar
    FPMCotasMaxExcesso      : Integer;
    FPMCotasPorCli          : Boolean; 
    FPMPDF                  : Boolean;
    FPMReviewCli            : Boolean;
    FPMReviewAdmin          : Boolean;
    FPMPDFPrintEng          : Byte; // 0-Adobe, 1-CLPrint, 2-Gnostice
    
    FPubHomePage            : Boolean;
    FPubAd                  : Boolean;
    FPubToolbar             : Boolean;

    FMaxTempoSessao         : Word;

    FTarifaPadrao           : Integer;
    FTarifaPorHorario       : Boolean;

    FBloqMeuComputador      : Boolean;
    FBloqLixeira            : Boolean;
    FBloqMeusDocumentos     : Boolean;
    FClassicStartmenu       : Boolean;

    FBloqueiaCliAvulso     : Boolean;
    FExigeDadosMinimos     : Boolean;
    FCidadePadrao          : String;
    FUFPadrao              : String;
    FDadosMinimos          : String;
    FPedirSaldoI           : Boolean;
    FPedirSaldoF           : Boolean;
    FBRT                   : Word;
    FExCookie              : Boolean;
    FHPOpenBef             : Boolean;
    FCamposCliCC           : TStrings;
    FCliCongelado          : Boolean;
    FSenhaAdminOk          : Boolean;
    FQtdMaqOk              : Boolean;
    fAutoCad               : boolean;
    fQuickCad              : boolean;
    fCodProdutoDuplicados  : boolean;
    fMargem                : double;
    fPrecoAuto             : boolean;

    FPosLogin              : Byte; // 0 = centro, 1 = topo, 2 = rodapé

    FServerDir             : String;

    FHomePage_URL          : String;
    FHomePage_Tab          : Boolean;
    FHomePage_LastURL      : TDateTime;
    FSky_Url               : String;
    FToolbar_Url           : String;
    FBanners               : String;
    FBotoes                : String;

    FComandaOff            : Boolean;
    FMesasOff              : Boolean;
    FConsumoAvulsoOff      : Boolean;
    FRecursos              : String;

    FConfirmarDebito       : Boolean;

    FArrayComanda          : TArrayFaixaInteger;

    FComissaoPerc          : Double;
    FComissaoLucro         : Boolean;

    FCodBarBal             : Boolean;
    FCodBarBalTam          : Byte;
    FCodBarBalIdent        : String;
    FCodBarBalInicioCod    : Byte;
    FCodBarBalTamCod       : Byte;
    FCodBarBalValor        : Boolean; 
    FCodBarBalPPInicio     : Byte;
    FCodBarBalPPTam        : Byte;
    FCodBarBalPPDig        : Byte;
    
    procedure SetTextoPIN(const Value: String);

    function PastaFundo: String;
    function GetPausaAutomatica: Boolean;
    function GetCamposCliCCText: String;
    procedure SetCamposCliCCText(const Value: String);
    function GetServerDir: String;
    function GetRecursoOn(aIndex: Integer): Boolean;
    procedure SetRecursoOn(aIndex: Integer; const Value: Boolean);
    function GetFaixaComanda: String;
    procedure SetFaixaComanda(const Value: String);
    function GetRecBobina: Boolean;
    procedure SetRecBobina(const Value: Boolean);
    procedure SetConta(const Value: String);
    function GetDTol: Byte;
    procedure SetDTol(const Value: Byte);
    function GetUrls: String;
    procedure SetUrls(const Value: String);
  protected
    function GetChave: Variant; override;
    procedure SetVerPri(const Value: Word);
  public  
    function TipoClasse: Integer; override;

    function CalcPontos(aValor: Currency; aTipo: Byte): Double;

    constructor Create;
    destructor Destroy; override;

    function ComandaValida(const aNum: Integer): Boolean;
    
    function ChecaCores: Boolean;
    procedure AssignConfig(C : TncConfig);

    procedure LeStream(S: TStream); override;
    procedure LeDataset(Tab: TDataset); override;


    function cce(acce: Integer): Boolean;

    function CodLojaInt: Integer;

    function NomeArqDesktop: String;
    function NomeArqLogin: String;

    function GetPMValorCaption(aPages: Word): String;

    function GetFiltrarMenuIniciar: Boolean;

    function ConfigComandaOk: Boolean;

    function DadosMinOk(T: TDataset): Boolean;

    function NormBRT: Word;

    function NormPosLogin: Byte;

    function IsPremium: Boolean;

    function TolerandoPor: Integer;

    function TolDiasRestantes: Integer;

    function RevisarPDF: Boolean;

    function CalcPreco(aMargem: Variant; aCusto: Currency): Currency;

    function DecodeCodBarBalanca(aCodigo: String; var aInfo: TncCodBarBalInfo): Boolean;

    function RevisarPDFDisponivel: Boolean;

    function RevisarPDFAdmin: Boolean;

    function RevisarPDFCli: Boolean;

    function ConfirmarImpDisponivel: Boolean;

    function ConfirmarImpAdmin: Boolean;

    function ConfirmarImpCli: Boolean;

    function PausarJobs: Boolean;

    function ImprimirPDFDireto: Boolean;

    function RecPrinterGeneric: Boolean;

    function HomePageURL(aAnunciante: Boolean) : String;

    function ImpOutras: Boolean;

    function PodeFidelidade: Boolean;

    property RecursoOn[aIndex: Integer]: Boolean
      read GetRecursoOn write SetRecursoOn;

    property slCamposCliCC: TStrings
      read FCamposCliCC;

    property RecBobina: Boolean
      read GetRecBobina write SetRecBobina;  
    
  published
    property CodProdutoDuplicados: boolean
      read fCodProdutoDuplicados write fCodProdutoDuplicados;
    property AutoCad: boolean
      read fAutoCad write fAutoCad;
    property QuickCad: boolean
      read fQuickCad write fQuickCad;
    property Margem: double
      read fMargem write fMargem;
      
    property PrecoAuto: boolean
      read fPrecoAuto write fPrecoAuto;

    property ComissaoPerc: Double
      read FComissaoPerc write FComissaoPerc;
         
    property ComissaoLucro: Boolean
      read FComissaoLucro write FComissaoLucro;

    property CodBarBal: Boolean
      read FCodBarBal write FCodBarBal;
        
    property CodBarBalTam: Byte
      read FCodBarBalTam write FCodBarBalTam;
      
    property CodBarBalIdent: String
      read FCodBarBalIdent write FCodBarBalIdent;

    property CodBarBalInicioCod: Byte
      read FCodBarBalInicioCod write FCodBarBalInicioCod;
        
    property CodBarBalTamCod: Byte
      read FCodBarBalTamCod write FCodBarBalTamCod;

    property CodBarBalValor: Boolean
      read FCodBarBalValor write FCodBarBalValor;

    property CodBarBalPPInicio: Byte
      read FCodBarBalPPInicio write FCodBarBalPPInicio;

    property CodBarBalPPTam: Byte
      read FCodBarBalPPTam write FCodBarBalPPTam;
            
    property CodBarBalPPDig: Byte        
      read FCodBarBalPPDig write FCodBarBalPPDig;
      
    property PermiteLoginSemCred: Boolean
      read FPermiteLoginSemCred write FPermiteLoginSemCred;

    property AlteraLoginSemCred: Boolean
      read FAlteraLoginSemCred write FAlteraLoginSemCred;  
      
    property AutoExecutar: String
      read FAutoExecutar write FAutoExecutar;
      
    property AlertaFimTempo: TDateTime
      read FAlertaFimTempo write FAlertaFimTempo;

    property TempoMaxAlerta: TDateTime
      read FTempoMaxAlerta write FTempoMaxAlerta;

    property PermiteCapturaTela: Boolean
      read FPermiteCapturaTela write FPermiteCapturaTela;

    property LimiteTempoPadrao: TDateTime
      read FLimiteTempoPadrao write FLimiteTempoPadrao;  

    property PacoteTempoReal: Boolean
      read FPacoteTempoReal write FPacoteTempoReal;  

    property EncerramentoPrePago: Byte
      read FEncerramentoPrePago write FEncerramentoPrePago;

    property EncerramentoCartao: Byte
      read FEncerramentoCartao write FEncerramentoCartao;

    property TempoEPrePago: Word
      read FTempoEPrePago write FTempoEPrePago;

    property TempoECartao: Word
      read FTempoECartao write FTempoECartao;

    property VariosTiposAcesso: Boolean
      read FVariosTiposAcesso write FVariosTiposAcesso;  

    property ModoPagtoAcesso: Byte
      read FModoPagtoAcesso write FModoPagtoAcesso;

    property MostraPrePagoDec: Boolean
      read FMostraPrePagoDec write FMostraPrePagoDec;  

    property CliCadPadrao: Boolean
      read FCliCadPadrao write FCliCadPadrao;

    property RecImprimir: Byte
      read FRecImprimir write FRecImprimir;

    property RecTipoImpressora: String
      read FRecTipoImpressora write FRecTipoImpressora;

    property RecMatricial: Boolean
      read FRecMatricial write FRecMatricial;

    property RecPorta: String
      read FRecPorta write FRecPorta;
            
    property RecSalto: Byte
      read FRecSalto write FRecSalto;
      
    property RecLargura : Byte
      read FRecLargura write FRecLargura;

    property RecCortaFolha : Boolean
      read FRecCortaFolha write FRecCortaFolha;

    property RecRodape: String
      read FRecRodape write FRecRodape;

    property RecNomeLoja: String
      read FRecNomeLoja write FRecNomeLoja;   

    property CorLivre: Integer
      read FCorLivre write FCorLivre;
      
    property CorFLivre: Integer
      read FCorFLivre write FCorFLivre;
      
    property CorUsoPrePago: Integer
      read FCorUsoPrePago write FCorUsoPrePago;
      
    property CorFUsoPrePago: Integer
      read FCorFUsoPrePago write FCorFUsoPrePago;
      
    property CorUsoPosPago: Integer
      read FCorUsoPosPago write FCorUsoPosPago;
      
    property CorFUsoPosPago: Integer
      read FCorFUsoPosPago write FCorFUsoPosPago;
      
    property CorPausado: Integer
      read FCorPausado write FCorPausado;
      
    property CorFPausado: Integer
      read FCorFPausado write FCorFPausado;

    property CorDesktop: Integer
      read FCorDEsktop write FCorDesktop;   

    property CorFDesktop: Integer
      read FCorFDesktop write FCorFDesktop;   
      
    property CorAguardaPagto: Integer
      read FCorAguardaPagto write FCorAguardaPagto;
      
    property CorFAguardaPagto: Integer
      read FCorFAguardaPagto write FCorFAguardaPagto;
      
    property CorManutencao: Integer
      read FCorManutencao write FCorManutencao;

    property CorFManutencao: Integer
      read FCorFManutencao write FCorFManutencao;

    property CorMaqManut: Integer
      read FCorMaqManut write FCorMaqManut;

    property CorFMaqManut: Integer
      read FCorFMaqManut write FCorFMaqManut;

    property CorPrevisao: Integer
      read FCorPrevisao write FCorPrevisao;

    property CorFPrevisao: Integer
      read FCorFPrevisao write FCorFPrevisao;  

    property FecharProgramas: Boolean
      read FFecharProgramas write FFecharProgramas;  

    property Tolerancia: TDateTime
      read FTolerancia write FTolerancia;  

    property RegImp98: Boolean
      read FRegImp98 write FRegImp98;

    property ManterSaldoCaixa: Boolean
      read FManterSaldoCaixa write FManterSaldoCaixa;   

    property MostraProgAtual: Boolean
      read FMostraProgAtual write FMostraProgAtual;

    property MostraObs: Boolean
      read FMostraObs write FMostraObs;

    property MostraNomeMaq: Boolean
      read FMostraNomeMaq write FMostraNomeMaq;  
      
    property EscondeTextoBotoes: Boolean
      read FEscondeTextoBotoes write FEscondeTextoBotoes;

    property ExigirRG: Boolean
      read FExigirRG write FExigirRG;  

    property ControlaImp: Byte 
      read FControlaImp write FControlaImp;

    property CampoLocalizaCli: Byte
      read FCampoLocalizaCli write FCampoLocalizaCli;  

    property LimitePadraoDebito: Double
      read FLimitePadraoDebito write FLimitePadraoDebito;  

    property EscondeTipoAcesso: Boolean
      read FEscondeTipoAcesso write FEscondeTipoAcesso;  

    property MostrarApenasPIN: Boolean
      read FMostrarApenasPIN write FMostrarApenasPIN;

    property TextoPIN: String
      read FTextoPIN write SetTextoPIN;

    property NumFDesktop : Integer
      read FNumFDesktop write FNumFDesktop;

    property NumFLogin : Integer
      read FNumFLogin write FNumFLogin;
        
    property TipoFDesktop: String
      read FTipoFDesktop write FTipoFDesktop;
      
    property TipoFLogin : String 
      read FTipoFLogin write FTipoFLogin;

    property FundoWeb: Boolean
      read FFundoWeb write FFundoWeb;

    property FundoWebURL: String
      read FFundoWebURL write FFundoWebURL;  

    property AlterarSenhaCli: Boolean
      read FAlterarSenhaCli write FAlterarSenhaCli;

    property VerSenhaCli: Boolean
      read FVerSenhaCli write FVerSenhaCli;

    property Conta: String
      read FConta write SetConta;     

    property FreePremium: Boolean
      read FFreePremium write FFreePremium;

    property AssinaturaVenceEm: TDateTime
      read FAssinaturaVenceEm write FAssinaturaVenceEm;

    property DVA: TDateTime
      read FDVA write FDVA;

    property DTol: Byte
      read GetDTol write SetDTol;   

    property PreLib: Boolean
      read FPreLib write FPreLib;

    property ProxAvisoAss: TDateTime
      read FProxAvisoAss write FProxAvisoAss;  

    property DataLic: TDateTime
      read FDataLic write FDataLic;
        
    property AlertaAssinatura: Boolean
      read FAlertaAssinatura write FAlertaAssinatura;  

    property JaFoiPremium: Boolean
      read FJaFoiPremium write FJaFoiPremium;  

    property CodEquip: String
      read FCodEquip write FCodEquip;  

    property QtdLic: Integer
      read FQtdLic write FQtdLic; 

    property StatusConta: TStatusConta
      read FStatusConta write FStatusConta;   

    property VerPri: Word
      read FVerPri write SetVerPri;

    property EmailMetodo: Byte
      read FEmailMetodo write FEmailMetodo;
      
    property EmailServ: String
      read FEmailServ write FEmailServ;
      
    property EmailUsername: String
      read FEmailUsername write FEmailUsername;
      
    property EmailSenha: String
      read FEmailSenha write FEmailSenha;
      
    property EmailDestino: String
      read FEmailDestino write FEmailDestino;
      
    property EmailEnviarCaixa: Boolean
      read FEmailEnviarCaixa write FEmailEnviarCaixa;

    property EmailIdent: String
      read FEmailIdent write FEmailIdent;

    property EmailConteudo: String
      read FEmailConteudo write FEmailConteudo;    

    property FiltrarWeb: Boolean
      read FFiltrarWeb write FFiltrarWeb;  

    property SiteRedirFiltro: String
      read FSiteRedirFiltro write FSiteRedirFiltro;  

    property BloqDownload: Boolean
      read FBloqDownload write FBloqDownload;  

    property BloqDownloadExe: Boolean
      read FBloqDownloadExe write FBloqDownloadExe;  

    property BloqMenuIniciar: Boolean
      read FBloqMenuIniciar write FBloqMenuIniciar;
      
    property BloqPainelCtrl: Boolean
      read FBloqPainelCtrl write FBloqPainelCtrl;

    property BloqCtrlAltDel: Boolean
      read FBloqCtrlAltDel write FBloqCtrlAltDel;
      
    property BloqExecutar: Boolean
      read FBloqExecutar write FBloqExecutar;
      
    property BloqMeusLocaisRede: Boolean
      read FBloqMeusLocaisRede write FBloqMeusLocaisRede;

    property BloqTray: Boolean
      read FBloqTray write FBloqTray;

    property BloqBotaoDir: Boolean
      read FBloqBotaoDir write FBloqBotaoDir;  

    property BloqToolbars: Boolean
      read FBloqToolbars write FBloqToolbars;  

    property BloqPosPago: Boolean
      read FBloqPosPago write FBloqPosPago;  

    property FiltrarDesktop: Boolean
      read FFiltrarDesktop write FFiltrarDesktop;
      
    property FiltrarMenuIniciar: Boolean
      read FFiltrarMenuIniciar write FFiltrarMenuIniciar;

    property TempoB1: Word
      read FTempoB1 write FTempoB1;
      
    property TempoB2: Word
      read FTempoB2 write FTempoB2;    
      
    property TempoB3: Word
      read FTempoB3 write FTempoB3;    
      
    property TempoB4: Word
      read FTempoB4 write FTempoB4; 
         
    property TempoB5: Word
      read FTempoB5 write FTempoB5;    
      
    property TempoB6: Word
      read FTempoB6 write FTempoB6;  

    property CredPadraoTipo: Byte
      read FCredPadraoTipo write FCredPadraoTipo;

    property CredPadraoCod: Integer
     read FCredPadraoCod write FCredPadraoCod;

    property PgVendas: Boolean
      read FPgVendas write FPgVendas;

    property PgVendaAvulsa: Boolean
      read FPgVendaAvulsa write FPgVendaAvulsa;  
      
    property PgAcesso: Boolean
      read FPgAcesso write FPgAcesso;
      
    property PgTempo: Boolean
      read FPgTempo write FPgTempo;
      
    property PgImp: Boolean
      read FPgImp write FPgImp;
     
    property PaginaInicial: String
      read FPaginaInicial write FPaginaInicial;
      
    property EsconderCronometro: Boolean
      read FEsconderCronometro write FEsconderCronometro;
      
    property AposEncerrar: Byte
      read FAposEncerrar write FAposEncerrar;
      
    property AlinhaBarraGuard: Byte
      read FAlinhaBarraGuard write FAlinhaBarraGuard;
      
    property NoNet: Byte
      read FNoNet write FNoNet;
      
    property TempoSumirLogin: Word
      read FTempoSumirLogin write FTempoSumirLogin;

    property MinutosDesligaMaq: Byte
      read FMinutosDesligaMaq write FMinutosDesligaMaq;  

    property MinutosDesligaMon: Byte
      read FMinutosDesligaMon write FMinutosDesligaMon;  

    property OpcaoChat : Byte
      read FOpcaoChat write FOpcaoChat;

    property EsconderDrives: String
      read FEsconderDrives write FEsconderDrives;  

    property BloquearUsoEmHorarioNP: Boolean
      read FBloquearUsoEmHorarioNP write FBloquearUsoEmHorarioNP;  

    property SalvarCodUsername: Boolean
      read FSalvarCodUsername write FSalvarCodUsername;  

    property ContinuarCredTempo: Boolean
      read FContinuarCredTempo write FContinuarCredTempo;

    property NaoGuardarCreditoCli: Boolean
      read FNaoGuardarCreditoCli write FNaoGuardarCreditoCli;

    property RelCaixaAuto: Boolean
      read FRelCaixaAuto write FRelCaixaAuto;  

    property NaoMostrarMsgDebito: Boolean
      read FNaoMostrarMsgDebito write FNaoMostrarMsgDebito;

    property NaoTransferirMaq: Boolean
      read FNaoTransferirMaq write FNaoTransferirMaq;

    property NaoCobrarImpFunc: Boolean
      read FNaoCobrarImpFunc write FNaoCobrarImpFunc;  

    property SincronizarHorarios: Boolean
      read FSincronizarHorarios write FSincronizarHorarios;  

    property MostrarDebitoNoGuard   : Boolean 
      read FMostrarDebitoNoGuard write FMostrarDebitoNoGuard;
      
    property BloquearLoginAlemMaxDeb: Boolean 
      read FBloquearLoginAlemMaxDeb write FBloquearLoginAlemMaxDeb;
      
    property ClienteNaoAlteraSenha  : Boolean 
      read FClienteNaoAlteraSenha write FClienteNaoAlteraSenha;
      
    property NaoObrigarSenhaCliente : Boolean 
      read FNaoObrigarSenhaCliente write FNaoObrigarSenhaCliente;

    property NaoVenderAlemEstoque: Boolean
      read FNaoVenderAlemEstoque write FNaoVenderAlemEstoque;  

    property CreditoComoValor: Boolean
      read FCreditoComoValor write FCreditoComoValor;

    property CliAvulsoNaoEncerra: Boolean
      read FCliAvulsoNaoEncerra write FCliAvulsoNaoEncerra;

    property AutoSortGridCaixa : Boolean
      read FAutoSortGridCaixa write FAutoSortGridCaixa;

    property AvisoFimTempoAdminS: Byte
      read FAvisoFimTempoAdminS write FAvisoFimTempoAdminS;

    property DetectarImpServ: Boolean
      read FDetectarImpServ write FDetectarImpServ; 

    property AvisoCreditos: Boolean
      read FAvisoCreditos write FAvisoCreditos;

    property ClientePodeVerCred: Boolean
      read FClientePodeVerCred write FClientePodeVerCred;

    property ChatAlertaSonoro : Boolean
      read FChatAlertaSonoro write FChatAlertaSonoro;

    property ChatMostraNotificacao: Boolean
      read FChatMostraNotificacao write FChatMostraNotificacao;  

    property ModoCredGuard: Byte
      read FModoCredGuard write FModoCredGuard;
      
    property MsgFimCred: String
      read FMsgFimCred write FMsgFimCred;

    property SemLogin: Boolean
      read FSemLogin write FSemLogin;  

    property AutoObsAoCancelar: Boolean
      read FAutoObsAoCancelar write FAutoObsAoCancelar;

    property FidAtivo: Boolean 
      read FFidAtivo write FFidAtivo;
      
    property FidSessaoValor: Currency
      read FFidSessaoValor write FFidSessaoValor;
      
    property FidSessaoPontos: Integer
      read FFidSessaoPontos write FFidSessaoPontos;
      
    property FidVendaValor: Currency
      read FFidVendaValor write FFidVendaValor;
      
    property FidVendaPontos: Integer
      read FFidVendaPontos write FFidVendaPontos;
      
    property FidImpValor: Currency
      read FFidImpValor write FFidImpValor;
      
    property FidImpPontos: Integer
      read FFidImpPontos write FFidImpPontos;
      
    property FidParcial: Boolean
      read FFidParcial write FFidParcial;

    property FidAutoPremiar : Boolean
      read FFidAutoPremiar write FFidAutoPremiar;

    property FidTipoPremioAuto : Byte
      read FFidTipoPremioAuto write FFidTipoPremioAuto;

    property FidPremioAuto : Integer
      read FFidPremioAuto write FFidPremioAuto;

    property FidPontosPremioAuto: Integer        
      read FFidPontosPremioAuto write FFidPontosPremioAuto;

    property FidMostrarSaldoGuard: Boolean  
      read FFidMostrarSaldoGuard  write FFidMostrarSaldoGuard;
      
    property FidMostrarSaldoAdmin: Boolean
      read FFidMostrarSaldoAdmin write FFidMostrarSaldoAdmin;

    property FidMsg: Boolean
      read FFidMsg write FFidMsg;

    property FidMsgTitulo: String
      read FFidMsgTitulo write FFidMsgTitulo;

    property FidMsgTexto: String
      read FFidMsgTexto write FFidMsgTexto;  

    property CliCadNaoEncerra: Boolean
      read FCliCadNaoEncerra write FCliCadNaoEncerra;

    property ImpedirPosPago: Boolean
      read FImpedirPosPago write FImpedirPosPago;

    property AutoLigarMaqCli: Boolean
      read FAutoLigarMaqCli write FAutoLigarMaqCli;  

    property PastaDownload: String
      read FPastaDownload write FPastaDownload;

    property Biometria: Boolean
      read FBiometria write FBiometria;

    property PMPausaAutomatica: Boolean
      read GetPausaAutomatica write FPMPausaAutomatica;

    property PMConfirmaImpCliente: Boolean
      read FPMConfirmaImpCliente write FPMConfirmaImpCliente;

    property PMConfirmaImpAdmin: Boolean
      read FPMConfirmaImpAdmin write FPMConfirmaImpAdmin;

    property PMAdminControlaImp: Boolean
      read FPMAdminControlaImp write FPMAdminControlaImp;

    property PMMostrarPaginasCli : Boolean
      read FPMMostrarPaginasCli write FPMMostrarPaginasCli;

    property PMMostrarValorCli : Boolean
      read FPMMostrarValorCli write FPMMostrarValorCli;

    property PMCalcValorCli : Byte
      read FPMCalcValorCli write FPMCalcValorCli;

    property PMPromptValorCli: String
      read FPMPromptValorCli  write FPMPromptValorCli;
      
    property PMObsValorCli : String
      read FPMObsValorCli write FPMObsValorCli;

    property PMValorMin : Currency
      read FPMValorMin write FPMValorMin;

    property PMValorMax : Currency
      read FPMValorMax write FPMValorMax;  

    property PMPausarServ: Boolean
      read FPMPausarServ write FPMPausarServ;
        
    property PMNaoPausar: String
      read FPMNaoPausar write FPMNaoPausar;

    property PMCotas: Boolean
      read FPMCotas write FPMCotas;
      
    property PMCotasMaxPagDia : Integer
      read FPMCotasMaxPagDia write FPMCotasMaxPagDia;
      
    property PMCotasMaxPagMes : Integer
      read FPMCotasMaxPagMes write FPMCotasMaxPagMes;
      
    property PMCotasOpCota: Byte
      read FPMCotasOpCota write FPMcotasOpCota; // 0-confirmar impressao, 1-liberar automaticamente

    property PMCotasOpExcesso: Byte
      read  FPMCotasOpExcesso write FPMCotasOpExcesso; // 0-atendente pode liberar, 1-cancelar imp, 2-cobrar
      
    property PMCotasMaxExcesso: Integer
      read FPMCotasMaxExcesso write FPMCotasMaxExcesso; 

    property PMCotasPorCli: Boolean
      read FPMCotasPorCli write FPMCotasPorCli;

    property PMPDF: Boolean
      read FPMPDF write FPMPDF;  

    property PMPDFPrintEng: Byte
      read FPMPDFPrintEng write FPMPDFPrintEng;
      
    property PMReviewCli: Boolean
      read FPMReviewCli write FPMReviewCli;

    property PMReviewAdmin: Boolean
      read FPMReviewAdmin write FPMReviewAdmin;  

    property PubHomePage: Boolean
      read FPubHomePage write FPubHomePage;

    property PubAd: Boolean
      read FPubAd write FPubAd;
        
    property PubToolbar: Boolean
      read FPubToolbar write FPubToolbar;

    property MaxTempoSessao: Word
      read FMaxTempoSessao write FMaxTempoSessao;  

    property TarifaPadrao: Integer
      read FTarifaPadrao write FTarifaPadrao; 

    property TarifaPorHorario: Boolean
      read FTarifaPorHorario write FTarifaPorHorario;   

    property BloqMeuComputador: Boolean
      read FBloqMeuComputador write FBloqMeuComputador;

    property BloqLixeira: Boolean
      read FBloqLixeira write FBloqLixeira;    

    property BloqMeusDocumentos: Boolean
      read FBloqMeusDocumentos write FBloqMeusDocumentos;  

    property ClassicStartMenu: Boolean
      read FClassicStartMenu write FClassicStartMenu;  

    property BloqueiaCliAvulso: Boolean
      read FBloqueiaCliAvulso write FBloqueiaCliAvulso;
      
    property ExigeDadosMinimos: Boolean
      read FExigeDadosMinimos write FExigeDadosMinimos;

    property CidadePadrao: String
      read FCidadePadrao write FCidadePadrao;
      
    property UFPadrao: String
      read FUFPadrao write FUFPadrao;

    property DadosMinimos: String
      read FDadosMinimos write FDadosMinimos;  

    property PedirSaldoI: Boolean
      read FPedirSaldoI write FPedirSaldoI;

    property PedirSaldoF: Boolean
      read FPedirSaldoF write FPedirSaldoF;  

    property BRT: Word
      read FBRT write FBRT;  

    property ExCookie: Boolean
      read FExCookie write FExCookie;

    property HPOpenBef : Boolean
      read FHPOpenBef write FHPOpenBef;

    property CamposCliCC: String
      read GetCamposCliCCText write SetCamposCliCCText;

    property CliCongelado: Boolean
      read FCliCongelado write FCliCongelado;  

    property SenhaAdminOk: Boolean
      read FSenhaAdminOk write FSenhaAdminOk;

    property QtdMaqOk: Boolean
      read FQtdMaqOk write FQtdMaqOk;    

    property PosLogin: Byte
      read FPosLogin write FPosLogin;  

    property ServerDir: String
      read GetServerDir write FServerDir;  

    property HomePage_URL: String
      read FHomePage_URL write FHomePage_URL;

    property HomePage_Tab: Boolean
      read FHomePage_Tab write FHomePage_Tab;

    property HomePage_LastURL: TDateTime
      read FHomePage_LastURL write FHomePage_LastURL;

    property Sky_Url: String
      read FSky_Url write FSky_Url;   

    property Toolbar_Url: String
      read FToolbar_Url write FToolbar_Url;  

    property Banners: String
      read FBanners write FBanners;

    property Botoes: String
      read FBotoes write FBotoes;   

    property FaixaComanda: String
      read GetFaixaComanda write SetFaixaComanda;

    property ComandaOff: Boolean
      read FComandaOff write FComandaOff;
      
    property MesasOff: Boolean
      read FMesasOff write FMesasOff;
      
    property ConsumoAvulsoOff: Boolean
      read FConsumoAvulsoOff write FConsumoAvulsoOff;
      
    property Recursos: String
      read FRecursos write FRecursos;

    property ConfirmarDebito: Boolean
      read FConfirmarDebito write FConfirmarDebito;  

    property Urls: String
      read GetUrls write SetUrls;  
  end;
  {$METHODINFO OFF}
  
  
  TncCliente = class ( TncClasse )
  private
    FHandle     : Integer;
    FRemoto     : Boolean;
    FUsername   : String;
    FMaquina    : Word;
    FWndHandle  : HWND;
    FProxyHandle: Integer;
    FSocket     : Integer;
    FInicio     : TDateTime;
    FSessionID  : Integer;
  protected
    function GetChave: Variant; override;
  public
    constructor Create;
    
    function TipoClasse: Integer; override;
    function Proxy: Boolean;
  published
    property Handle: Integer
      read FHandle write FHandle;

    property Remoto: Boolean
      read FRemoto write FRemoto;

    property UserName: String
      read FUserName write FUserName;

    property WndHandle: HWND
      read FWndHandle write FWndHandle;

    property ProxyHandle: Integer
      read FProxyHandle write FProxyHandle;     

    property Maquina: Word
      read FMaquina write FMaquina;

    property Socket: Integer
      read FSocket write FSocket;

    property Inicio: TDateTime
      read FInicio Write FInicio;

    property SessionID: Integer
      read FSessionID write FSessionID;  
  end;

  TncMaquina = class ( TncClasse )
  protected
    FNumero           : Word;
    FNome             : String;
    FIDCliente        : Integer;
    FProgramaAtual    : String;
    FSiteAtual        : String;
    FExeAtual         : String;
    FAppLog           : Integer;
    FPediuTela        : Boolean;
    FUserObj          : TObject;
    FMenu             : String;
    FRecursos         : String;
    FComputerName     : String;
    FTipoAcesso       : Integer;
    FEmManutencao     : Boolean;
    FObs              : String;
    FMacAddress       : String;
    FIP               : String;
    FIPConfig         : String;
    FPatrocinio       : String;
    FDireito          : Byte;
    FAvisaFimTempo    : Boolean;
    FDisplayW         : Word;
    FDisplayH         : Word;

    FRAM              : Cardinal;
    FCPU              : String;
    FOS               : String;
    FPrinters         : String;
    FDrives           : String;
    FHDTotal          : Cardinal;
    FHDFree           : Cardinal;
    FLastScan         : TDateTime;

    FURLLogin         : String;

    function GetChave: Variant; override;
  public
    constructor Create;

    function DisplayRes: String;

    destructor Destroy; override;

    function TipoClasse: Integer; override;

    property PediuTela: Boolean
      read FPediuTela write FPediuTela;  

    property UserObj: TObject
      read FUserObj write FUserObj;

    property AppLog: Integer
      read FAppLog write FAppLog;  

  published
    property Numero: Word
      read FNumero write FNumero;
      
    property Nome: String
      read FNome write FNome;
      
    property ProgramaAtual: String
      read FProgramaAtual write FProgramaAtual;

    property Menu: String
      read FMenu write FMenu;
                                     
    property Recursos: String
      read FRecursos write FRecursos;  

    property ComputerName: String
      read FComputerName write FComputerName;

    property Direito: Byte
      read FDireito write FDireito;

    property IDCliente: Integer
      read FIDCliente write FIDCliente;

    property SiteAtual: String
      read FSiteAtual write FSiteAtual;  

    property ExeAtual: String
      read FExeAtual write FExeAtual;  

    property TipoAcesso: Integer
      read FTipoAcesso write FTipoAcesso;

    property EmManutencao: Boolean
      read FEmManutencao write FEmManutencao;    

    property Obs: String
      read FObs write FObs;
        
    property MacAddress: String
      read FMacAddress write FMacAddress;

    property IP: String
      read FIP write FIP;  

    property IPConfig: String
      read FIPConfig write FIPConfig;  

    property Patrocinio: String
      read FPatrocinio write FPatrocinio; 

    property AvisaFimTempo: Boolean
      read FAvisaFimTempo write FAvisaFimTempo;  

    property DisplayW: Word
      read FDisplayW write FDisplayW;

    property DisplayH: Word
      read FDisplayH write FDisplayH;   

    property RAM: Cardinal
      read FRAM write FRAM;
      
    property CPU: String
      read FCPU write FCPU;
      
    property OS: String
      read FOS write FOS;
      
    property Printers: String
      read FPrinters write FPrinters;
      
    property Drives: String
      read FDrives write FDrives;
      
    property HDTotal: Cardinal
      read FHDTotal write FHDTotal;
      
    property HDFree: Cardinal
      read FHDFree write FHDFree;

    property LastScan: TDateTime
      read FLastScan write FLastScan;  

    property URLLogin: String
      read FURLLogin write FURLLogin;  
  end;  

  TncUsuario = class ( TncClasse )
  private
    FNumClientes    : Integer;  // número de clientes atualmente conectados nesse usuário
    FUsername       : String;
    FAdmin          : Boolean;
    FSenha          : String;
    FDireitos       : String;
    FNome           : String;
    FMaxMaqManut    : Integer;
    FMaxTempoManut  : Integer;
    FLimiteDesc     : Double;
  protected
    function GetChave: Variant; override;
  
    procedure SetNumClientes(Valor: Integer); virtual;
    procedure SetUsername(Valor: String); virtual;
    procedure SetAdmin(Valor: Boolean); virtual;
    procedure SetSenha(Valor: String); virtual;
    procedure SetDireitos(Valor: String); virtual;
    procedure SetNome(Valor: String); virtual;
  public
    constructor Create;

    function TipoClasse: Integer; override;

    function PodeDesconto(aTotal, aDesc: Currency): Boolean;

  published
    property NumClientes: Integer
      read FNumClientes write SetNumClientes;
      
    property Username: String
      read FUsername write SetUsername;

    property Nome: String
      read FNome write SetNome;  
      
    property Admin: Boolean
      read FAdmin write SetAdmin;
      
    property Senha: String
      read FSenha write SetSenha;
      
    property Direitos: String
      read FDireitos write SetDireitos;

    property MaxMaqManut: Integer
      read FMaxMaqManut write FMaxMaqManut;

    property MaxTempoManut: Integer
      read FMaxTempoManut write FMaxTempoManut;  

    property LimiteDesc: Double
      read FLimiteDesc write FLimiteDesc;    

  end;

  TncListaMaquinas = class ( TListaClasseCS ) 
  private
    function GetMaquina(I: Integer): TncMaquina;
    function GetMaquinaPorNumero(N: Integer): TncMaquina;
    function GetMaquinaPorIDCliente(C: Integer): TncMaquina;
  protected 
    function GetCount: Integer; override;  
  public
    constructor Create;

    function PorComputerName(aComp: String; aUnico: Boolean): TncMaquina;

    function PorIP(aIP: String): TncMaquina;

    function NumConectados: Integer;

    property Itens[I: Integer]: TncMaquina
      read GetMaquina; default;

    property PorNumero[N: Integer]: TncMaquina
      read GetMaquinaPorNumero;  

    property PorIDCliente[C: Integer]: TncMaquina
      read GetMaquinaPorIDCliente; 
  end;

  TncTiposAcesso = class ( TListaClasseCS ) 
  private
    function GetTipoAcesso(I: Integer): TncTipoAcesso;
    function GetTipoAcessoPorCodigo(N: Integer): TncTipoAcesso;
  public
    constructor Create;

    function Existe(aID: integer): Boolean;

    property Itens[I: Integer]: TncTipoAcesso
      read GetTipoAcesso; default;

    property PorCodigo[N: Integer]: TncTipoAcesso
      read GetTipoAcessoPorCodigo;
  end;                                  

  TncTarifas   = class ( TListaClasseCS )
  private
    function GetTarifa(I: Integer): TncTarifa;
    function GetTarifaPorCor(aCor: Integer): TncTarifa;
  public
    constructor Create;

    property Itens[I: Integer]: TncTarifa 
      read GetTarifa; default;

    property PorCor[aCor: Integer]: TncTarifa
      read GetTarifaPorCor;
  end;

  TncListaUsuarios = class ( TListaClasseCS ) 
  private
    function GetUsuario(I: Integer): TncUsuario;
    function GetUsuarioPorUsername(N: String): TncUsuario;
  public
    constructor Create;

    property Itens[I: Integer]: TncUsuario
      read GetUsuario; default;

    property PorUsername[N: String]: TncUsuario
      read GetUsuarioPorUsername;
  end;

  TncEnviaEvento = procedure (aMsg: Integer; aDados: Pointer) of object;

  TncServidorBase = class ( TComponent )
  private
    FUltimoHandle : Integer;
    FOnEnviaEvento : TncEnviaEvento;
    
    function NumClientesLocais: Integer;
  protected
    FClientes: TThreadList;
    FAtivo : Boolean;

    procedure AoRemoverCliente(Cliente: TncCliente); virtual;
    function ObtemCliente(aHandle: Integer): TncCliente;
    
    procedure EnviaEvento(Mensagem: Integer; Dados: Pointer);
    
    procedure AddCliente(Obj: TncCliente);
    procedure RemoveCliente(Obj: TncCliente); 
    function ProximoHandle: Integer;
    procedure SetAtivo(Valor: Boolean); virtual;
    procedure DesativaClientes;
    procedure ChecaErro(Erro: Integer);
    
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    class procedure Lock;
    class procedure Unlock;


    procedure ObtemSessionSocketArray(aMaq: Integer; var SS: TArraySessionSocket);
    function ObtemUsernameHandlePorSessionID(aSessionID: Integer; var aUsername: String; var aHandle: Integer): Boolean;

    function ObtemLista(aTipoClasse: Integer): TListaClasseCS; virtual; abstract;
    
    function ObtemClientePorSocket(Socket: Integer): TncCliente;
    function ObtemClientePorSessionID(aSessionID: Integer): TncCliente;
    function ObtemHandleClientePorMaq(aMaq: Word): Integer;
    function ObtemPastaServ(var NomePastaServ: String): Integer; virtual; 
    function ArqFundoEnviado(NomeArq: String): Integer; virtual; abstract;
    function ObtemSenhaCli(Codigo: Integer; var Senha: String): Integer; virtual; abstract;
    function SalvaSenhaCli(Codigo: Integer; Senha: String): Integer; virtual; abstract;
    function LimpaFundo(Desktop: Boolean): Integer; virtual; abstract;
    function SalvaCredTempo(aObj: TObject): Integer; virtual; abstract;
    function SalvaMovEst(aObj: TObject): Integer; virtual; abstract;
    function SalvaDebito(aObj: TObject): Integer; virtual; abstract;
    function SalvaLancExtra(aObj: TObject): Integer; virtual; abstract;
    function SalvaDebTempo(aObj: TObject): Integer; virtual; abstract;
    function SalvaImpressao(aObj: TObject): Integer; virtual; abstract;
    function AbreCaixa(aFunc: String; aSaldo: Currency; var NovoCx: Integer): Integer; virtual; abstract;
    function FechaCaixa(aFunc: String; aSaldo: Currency; aID: Integer): Integer; virtual; abstract;
    function ReprocCaixa(aFunc: String; aID: Integer): Integer; virtual; abstract;
    function CorrigeDataCaixa(aFunc: String; aID: Integer; aNovaAbertura, aNovoFechamento: TDateTime): integer; virtual; abstract;
    function AjustaPontosFid(aFunc: String; aCliente: Integer; aFator: Smallint; aPontos: Double; aObs: String): Integer; virtual; abstract;

    function ObtemSitesBloqueados(var S: String): Integer; virtual; abstract;

    function ApagaMsgCli(aID: Integer): Integer; virtual; abstract;

    function Upload(aFonte, aDestino: String): Integer; virtual;
    function Download(aFonte, aDestino: String): Integer; virtual;
    function DownloadArqInterno(aArq: String; aVerCli: Integer; aDestino: String): Integer; virtual; abstract;

    function StartPrintTransfer(aArqInfo: TStrings; var aPos: Int64): Integer; virtual; abstract;
    function SendPTBlock(aArq: TGUID; aLast: Boolean; aTamanho: Integer; aPos: Int64; aBlock: Pointer): Integer; virtual; abstract;

    function GetPrintDocStream(aArq: TGUID; aPos: Integer; var aTamTotal, aTamBlock: Int64; var aLast: Boolean; aStream: TStream): integer; virtual; abstract;
    function PrintDoc(aArqInfo: TStrings): integer; virtual; abstract;

    function SalvaLogAppUrl(S: TStream): Integer; virtual; abstract;
    
    function SalvaStreamObj(Novo: Boolean; S: TStream): Integer; virtual; abstract;
    function ObtemStreamAvisos(S: TStream): integer; virtual; abstract;
    function ObtemStreamConfig(S: TStream): integer; virtual; abstract;
    function ObtemStreamListaObj(Cliente: Integer; TipoClasse: Integer; S: TStream): Integer; virtual; abstract;
    function ApagaObj(Cliente: Integer; TipoClasse: Integer; Chave: String): Integer; virtual; abstract;
    function Login(aUsername, 
                   aSenha: String; 
                   aMaq: Word;
                   aFuncAtual: Boolean;
                   aRemoto: Boolean; 
                   aWndHandle: HWND; 
                   aProxyHandle: Integer; 
                   aSocket: Integer;
                   aSessionID: Integer;
                   aIP: String;
                   var Handle: Integer): Integer; virtual;                                                                              

    function DisableAD(aSessao: Integer; aDisable: Boolean): Integer; virtual; abstract;
    function LoginMaq(aSessao: TObject): Integer; virtual; abstract;
    function AlteraSessao(aSessao: TObject): Integer; virtual; abstract;
    function CancelaTran(aID: Integer; aFunc: String): integer; virtual; abstract;
    function ObtemProcessos(aMaq: Word; aIDCliente, aIDReq: Integer): integer; virtual; 
    function FinalizaProcesso(aMaq: Word; aProcessID: Integer): Integer; virtual; 
    function SalvaProcessos(aIDCliente, aRequest: Integer; aSL: TStrings): Integer; virtual; abstract;
    function ForceRefreshSessao(aSessao: Integer): Integer; virtual; abstract;
    function SalvaLic(aLic: String): Integer; virtual; abstract;
    function ObtemPatrocinios(aSL: TStrings): Integer; virtual; abstract;

    function RefreshEspera: Integer; virtual; abstract;
    function PermitirDownload(aSessao: Integer; aExe, aPermitir: Boolean): Integer; virtual; abstract;

    function DesativarFWSessao(aSessao: Integer; aDesativar: Boolean): Integer; virtual; abstract;

    function MonitorOnOff(aMaq: Word; aOn: Boolean): Integer; virtual; abstract;

    function DesktopSincronizado(aSessao: Integer): Integer; virtual; abstract;
    
    function SalvaClientPages(aPrinter: String; aJobID: Cardinal; aMaquina, aPaginas: Word): integer; virtual; abstract;
    
    function JobControl(aPrinterIndex: Integer; aJobID: Cardinal; aControl: Byte): integer; virtual; abstract;

    function PrintDocControl(aInfo: TStrings): integer; virtual; abstract;

    function AdicionaPassaporte(aMaq: Word; aSenha: String): Integer; virtual; abstract;   
    function RegistraPaginasImpressas(aJobID: Cardinal; aMaq: Word; aPaginas: Integer; aImp, aDoc: String): Integer; virtual; abstract;
    
    function PararTempoMaq(aMaq: Word; aParar: Boolean): Integer; virtual; abstract;
    function TransferirMaq(aOrigem, aDestino: Word): Integer; virtual; abstract;
    function ModoManutencao(aMaq: Word; aUsername, aSenha: String; aEntrar: Boolean): Integer; virtual; abstract;

    function SuporteRem(aMaq, aTec: Word): Integer; virtual; abstract;

    function SalvaApp(aApp: String): Integer; virtual; abstract;
    
    function LogoutMaq(aMaq: Word): Integer; virtual; abstract;
    function PreLogoutMaq(aMaq: Word): Integer; virtual; abstract;
    function CancLogoutMaq(aMaq: Word): Integer; virtual; abstract;

    function BaixaNovaVersao(Programa, Versao, ArqDestino: String): Integer; virtual;
    function ObtemVersaoGuard(var Versao: Integer): Integer; virtual; abstract;
    
    function CapturaTelaMaq(aMaq: Word): integer; virtual; abstract;
    function SalvaTelaMaq(aSessionID: Integer; aMaq: Word; S: TMemoryStream): integer; virtual; abstract;
    function RefreshPrecos: integer; virtual; abstract;
    function ShutdownMaq(aMaq, aOper: Word): integer; virtual; abstract;

    function EnviarMsg(const aDe, aPara: Integer; const aTexto: String): Integer; virtual; abstract;
                   
    procedure Logout(Cliente: Integer); virtual;
    procedure LogoutSocket(Socket: Integer); virtual;
    procedure LogoutSession(aSessionID: Integer); virtual;

    function EnviarEventos: Boolean; virtual;

    function GetProxSocketLic(aUltimo: Integer; var aMaq: Integer): Integer;
  published
    property OnEnviaEvento: TncEnviaEvento
      read FOnEnviaEvento write FOnEnviaEvento;
      
    property Ativo: Boolean                              
      read FAtivo write SetAtivo;  
  end; 

  TThreadRename = class ( TThread )
  private
    FArqNovo: String;
    FArqVelho: String;
  public
    constructor Create(aArqNovo, aArqVelho: String);

    procedure Execute; override;
  end;

  TThreadDeleteFile = class ( TThread )
  private
    FArq: String;
    FTryForMS: Cardinal;
  public
    constructor Create(aArq: String; aTryForMS: Cardinal);

    procedure Execute; override;
  end;
  

  
  function TicksToHMSSt(Ticks: Cardinal): String;
  function TicksToDateTime(Ticks: Cardinal): TDateTime;
  function MinutosToDateTime(M: Double): TDateTime;
  function MinutosToHoraStr(aMinutos: Extended): String;
  function SegundosToHMSSt(Seg: Cardinal): String;
  function SegundosToDateTime(Seg: Cardinal): TDateTime;
  function DateTimeToTicks(D: TDateTime): Cardinal;
  function DateTimeToSegundos(D: TDateTime): Cardinal;
  function DateTimeToMinutos(D: TDateTime): Cardinal;
  function HMSToMinutos(S: String): Double;
  function HMToMinutos(S: String): Double;
  function MSToMinutos(S: String): Double;
  
  function MinutosToTicks(M: Double): Cardinal;
  function TicksToMinutos(Ticks: Cardinal): Double;

  function Senha(D: TDateTime; NS: Cardinal; NumMaq: Integer): String;
  function VolumeSerial(DriveChar: Char): string;

  function CalcAcesso(Acesso, Sinal, Desc: Double): Double;
  function FormataNumVersao(St: String): String;

  function DuasCasas(D: Double): Double;

  function TicksTotalArrayEtapas(AP: TncArrayEtapas): Cardinal;
  
  function ObtemCred(I: Integer): Cardinal;

  function StringToBool(S: String): Boolean;

  procedure MinutosPorHora(Inicio, Fim: TDateTime; var Tempos: TArrayTempo);

  function FloatParaStr(Valor: Extended): String;

  function StrParaFloat(S: String): Extended;
  
  function GetDTStr(D: TDateTime): String;

  function DTFromStr(S: String): TDateTime;

  function GetNextStrDelim(var S: String; aClassID: Byte): String;

  function GetNextListItem(var sItems, sItem: String; aClassID: Byte): Boolean;

  function GetNextStrDelimCustom(var S: String; aDelim: String): String;

{  function StringListToListDelim(aSL: String; aClassID: Byte): String;
  function StringListFromListDelim(aListDelim: String; aClassID: Byte): String;}
  
  procedure StrToLista(S: String; SL: TStrings);
  function ListaToStr(S: String): String;
  
  
  function MenorCardinal(C1, C2: Cardinal): Cardinal;
  function MaiorCardinal(C1, C2: Cardinal): Cardinal;

  function MinutosToHMSStr(aMinutos: Extended): String;
  function MinutosToHMSAbrev(aMinutos: Extended): String;

  function CurrencyToStr(C: Currency): String;
  function PontosFidToStr(D: Double): String;
  function PercToStr(P: Double): String;
  
  function FormataSiteStr(S: String): String;
  function DomainAndSubdomain(S: String): String;

  function SetBit(Valor, Bit: Integer; Lig: Boolean): Integer;
  
  function BitIsSet(Valor, Bit: Integer): Boolean;

  function GetVersionBuild(S: String): Integer;

  function MesmoComputerName(aComp1, aComp2: String): Boolean;

  function IsWOW64: Boolean;

  function GuidStringClean(S: String): String;
  function GuidStringFmt(S: String): String;

  procedure DeleteFromArraySessionSocket(var SS: TArraySessionSocket; aIndex: Integer);

  function IsPDFFromNexCafe(aArq: String): Boolean;

  procedure BroadcastAtualizaDireitosConfig;

  function LimitaCasasDec(C: Currency): Currency;

  function SemAcento(S: String): String;

  function SameTextSemAcento(A, B: String): Boolean;

  function sFldDelim(aClassID: Byte): String;
  function sListaDelim(aClassID: Byte): String;
  
  function SplitParams(S: String): TStrings;
  function RemoveAspas(S: String): String;

var
  glTolerancia: Cardinal = 0;
  gTarifas : TncTarifas = nil;
  gTiposAcesso : TncTiposAcesso = nil;
  gConfig : TncConfig = nil;
  EncerrarThreads : Boolean = False;
  LadoServidor : Boolean = False;
  NomeCompServ : String = '';
  csServ : TCriticalSection;
  slDadosMin : TStrings;
  ServidorAtivo : Boolean = False;
  VerProg : String = '';
  MaxMaquinas : Integer = 0; 
  gGuardSide : Boolean = True;
  handleFrmPri : HWND;

threadvar  
  HandleCliAtual : Integer;
  UsernameAtual: String;
  
implementation

uses Graphics, md5, ncVersoes, ncDebug, ncTipoImp, forms, ulogs, math, nexUrls;

function SplitParams(S: String): TStrings;
var 
  P: Integer;
  s2: String;
begin
  Result := TStringList.Create;
  repeat
    P := Pos(',', S);
    if P>0 then begin
      s2 := Trim(Copy(S, 1, P-1));
      Delete(S, 1, P);
    end else begin
      s2 := Trim(S);
      S := '';
    end;
    if s2>'' then Result.Add(s2);
  until S='';
end;

function RemoveAspas(S: String): String;
begin
  S := Trim(S);
  if Copy(S, 1, 1)='"' then Delete(S, 1, 1);
  if Copy(S, Length(S), 1)='"' then Delete(S, Length(S), 1);
  Result := S;
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

function SameTextSemAcento(A, B: String): Boolean;
begin
  Result := SameText(SemAcento(A), SemAcento(B));
end;


function LimitaCasasDec(C: Currency): Currency;
begin
  if SysUtils.CurrencyDecimals>0 then
    Result := Int(C*Power(10, SysUtils.CurrencyDecimals)) / Power(10, SysUtils.CurrencyDecimals) else
    Result := C;
end;

function CurrencyToStr(C: Currency): String;
begin
  Result := FloatToStrF(C, ffCurrency, 15, SysUtils.CurrencyDecimals);
end;

function PercToStr(P: Double): String;
var lastCH: char;
begin
  Result := FloatToStrF(P, ffFixed, 15, 2);
  while (Length(Result)>0) and (Result[Length(Result)] in ['0', '.', ',']) do begin
    lastCH := Result[Length(Result)];
    Delete(Result, Length(Result), 1);
    if lastCH in [',', '.'] then  Break;
  end;
  if Result='' then Result := '0';
  Result := Result + '%';
end;

function PontosFidToStr(D: Double): String;
begin
  Str(D:0:1, Result);
  Result := Copy(Result, 1, Pos('.', Result)+1);
  if (Result>'') and (Result[Length(Result)]='0') then
    Delete(Result, Pos('.', Result), 10);
end;

procedure BroadcastAtualizaDireitosConfig;
var I: Integer;
begin
  for I := 0 to screen.FormCount-1 do 
    PostMessage(Screen.Forms[I].Handle, wm_AtualizaDireitosConfig, 0, 0);
end;

function IsPDFFromNexCafe(aArq: String): Boolean;
{5184B62F-3BD3-4C6F-BB56-1892185A1EA6}
begin
  aArq := ExtractFileName(aArq);
  if Length(aArq)=42 then
    Result :=
      SameText(Copy(aArq, 38, 5), '}.pdf') and // do not localize
      SameText(aArq[1], '{') and
      SameText(aArq[10], '-') and
      SameText(aArq[15], '-') and
      SameText(aArq[20], '-') and
      SameText(aArq[25], '-')
  else
    Result := False;
  DebugMsg('IsPDFFromNexCafe: Result: '+BoolStr[result]+' - aArq: ' + aArq); // do not localize
end;


procedure DeleteFromArraySessionSocket(var SS: TArraySessionSocket; aIndex: Integer);
var I: Integer;
begin
  if Length(SS)=0 then Exit;
  
  for I := aIndex to High(SS)-1 do
    SS[I] := SS[I+1];
    
  SetLength(SS, Length(SS)-1);
end;


function GuidStringClean(S: String): String;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do 
    if not (S[i] in ['{', '}', '-']) then
      Result := Result + S[i];
end;

function GuidStringFmt(S: String): String;
begin
  Result := '{' + Copy(S, 1, 8)+
            '-' + Copy(S, 9, 4)+
            '-' + Copy(S, 13, 4)+
            '-' + Copy(S, 17, 4)+
            '-' + Copy(S, 21, 12) + '}';
end;

function IsWOW64: Boolean;
type
  TIsWow64Process = function( // Type of IsWow64Process API fn
    Handle: THandle;
    var Res: BOOL
  ): BOOL; stdcall;
var
  IsWow64Result: BOOL;              // result from IsWow64Process
  IsWow64Process: TIsWow64Process;  // IsWow64Process fn reference
begin
  // Try to load required function from kernel32
  IsWow64Process := GetProcAddress(
    GetModuleHandle('kernel32'), 'IsWow64Process' // do not localize
  );
  if Assigned(IsWow64Process) then
  begin
    // Function is implemented: call it
    if not IsWow64Process(GetCurrentProcess, IsWow64Result) then
      raise Exception.Create('Bad process handle'); // do not localize
    // Return result of function
    Result := IsWow64Result;
  end
  else
    // Function not implemented: can't be running on Wow64
    Result := False;
end;

function GetVersionBuild(S: String): Integer;
var I : integer;
begin
  I := Length(S);
  while (I>0) and (S[I]<>'.') do Dec(I);
  if I>0 then begin
    Delete(S, 1, I);
    Result := StrToIntDef(S, 0);
  end else
    Result := 0;
end;

function ZeroPad(St: String; Len: Integer): String;
begin
  Result := St;
  while Length(Result)<Len do Result := '0'+Result;
end;

function SetBit(Valor, Bit: Integer; Lig: Boolean): Integer;
begin
  if Lig then
    Result := (Valor or Bit) else
    Result := Valor and (not Bit);  
end;

function BitIsSet(Valor, Bit: Integer): Boolean;
var R: Boolean;
begin
  Result := ((Valor and Bit)=Bit);
end;

function FormataSiteStr(S: String): String;
var I: Integer;
begin
  if Copy(S, 1, 1)='"' then begin
    Delete(S, 1, 1);
    I := Pos('"', S);
    if I>0 then
      S := Copy(S, 1, I-1);
  end;
  
  if (copy(lowercase(S), 1, 5)='http:') or // do not localize
     (copy(lowercase(S), 1, 4)='ftp:') then  // do not localize
  begin
    Delete(S, 1, Pos(':', S));
    while (S>'') and (S[1] in ['/', ':', '\']) do Delete(S, 1, 1);
    while (S>'') and (S[Length(S)] in ['/', ':', '\']) do
      Delete(S, Length(S), 1);
    Result := S;
  end else
    Result := S;
end;

function DomainAndSubdomain(S: String): String;
var p: integer;
begin
  p := pos('/', S);
  if p>0 then
    Result := copy(S, 1, P-1) else
    Result := S;
end;

function MinutosToHoraStr(aMinutos: Extended): String;
var 
  H, M, S: Integer;
  aNeg: Boolean;
begin
  aNeg := (aMinutos<0);
  if aNeg then
    aMinutos := -1 * aMinutos;
  if aMinutos>0.000001 then begin
    H := Trunc(aMinutos / 60);
    M := Trunc(aMinutos) Mod 60;
    S := Trunc(aMinutos * 60) mod 60;
    if (H>0) or (M>0) or (S>0) then
      Result := ZeroPad(IntToStr(H), 2)+':'+
                ZeroPad(IntToStr(M), 2)+':'+
                ZeroPad(IntToStr(S), 2);
  end else
    Result := '00:00:00'; // do not localize
  if aNeg then Result := '-' + Result;
end;
  
function HMSToMinutos(S: String): Double;
begin
  if Length(S)=8 then
    Result := 
      StrToIntDef(Copy(S, 1, 2), 0) * 60 +
      StrToIntDef(Copy(S, 4, 2), 0) +
      StrToIntDef(Copy(S, 7, 2), 0) / 60
  else
    Result := 0;
end;

function MSToMinutos(S: String): Double;
begin
  Result := 
    StrToIntDef(Copy(S, 1, Pos(':', S)-1), 0) +
    StrToIntDef(Copy(S, Pos(':', S)+1, 2), 0) / 60;
end;

function HMToMinutos(S: String): Double;
var 
  H, M : Integer;
  St: String;
begin
  St := Copy(S, 1, Pos(':', S)-1);
  H := StrToIntDef(St, 0);
  St := Copy(S, Pos(':', S)+1, 2);
  M := StrToIntDef(St, 0);
  Result := (H*60) + M;
end;

function MinutosToHMSStr(aMinutos: Extended): String;
var 
  H, M, S: Integer;
  aNeg: Boolean;
begin
  Result := '';
  aNeg := (aMinutos<0);
  if aNeg then
    aMinutos := -1 * aMinutos;
  
  if aMinutos>0.000001 then begin
    H := Trunc(aMinutos / 60);
    M := Trunc(aMinutos) Mod 60;
    S := Trunc(aMinutos * 60) mod 60;
    if H>0 then
      Result := IntToStr(H)+'h';
    if M>0 then
      Result := Result + IntToStr(M)+'m';
    if S>0 then
      Result := Result + IntToStr(S)+'s';  
  end;
  if aNeg then Result := '-' + Result;
end;

function MinutosToHMSAbrev(aMinutos: Extended): String;
var 
  H, M, S: Integer;
  aNeg: Boolean;
begin
  Result := '';
  aNeg := (aMinutos<0);
  if aNeg then
    aMinutos := -1 * aMinutos;
  
  if aMinutos>0.000001 then begin
    H := Trunc(aMinutos) div 60;
    M := Trunc(aMinutos) Mod 60;
    S := Trunc(aMinutos * 60) mod 60;
    if H>0 then
      Result := IntToStr(H)+'h';
    if M>0 then
      Result := Result + IntToStr(M)+'m';
    if H<1 then
    if S>0 then
      Result := Result + IntToStr(S)+'s';  
  end;
  if aNeg then Result := '-' + Result;
end;

function DateTimeToMinutos(D: TDateTime): Cardinal;
begin
  Result := DateTimeToSegundos(D) div 60;
end;

constructor TThreadRename.Create(aArqNovo, aArqVelho: String);
begin
  FreeOnTerminate := True;
  FArqNovo := aArqNovo;
  FArqVelho := aArqVelho;
  inherited Create(False);
end;

procedure TThreadRename.Execute;
var 
  Ok: Boolean;
begin
  Ok := False;
  if FileExists(FArqNovo) then
  while (not Ok) and (not Terminated) and (not EncerrarThreads) do begin
    Ok := DeleteFile(PChar(FArqNovo));
    if not OK then 
      Sleep(100) else
      DebugMsg('TThreadRename.Execute - FArqNovo: '+FArqNovo+' - DELETED.'); // do not localize
  end;

  Ok := False;
  if (FArqVelho<>'') then
  while (not Ok) and (not Terminated) and (not EncerrarThreads) do begin
    Ok := RenameFile(FArqVelho, FArqNovo);
    if not OK then 
      Sleep(100) else
      DebugMsg('TThreadRename.Execute - FArqVelho: '+FArqVelho+' RENOMEADO PARA: ' + FArqNovo); // do not localize
  end;
end;

function MenorCardinal(C1, C2: Cardinal): Cardinal;
begin
  if C1<C2 then
    Result := C1
  else
    Result := C2;  
end;

function MaiorCardinal(C1, C2: Cardinal): Cardinal;
begin
  if C2>C1 then
    Result := C2
  else
    Result := C1;  
end;

function GetNextStrDelimCustom(var S: String; aDelim: String): String;
var 
  P : Integer;
begin
  P := Pos(aDelim, S);
  if P>0 then begin
    Result := Copy(S, 1, P-1);
    Delete(S, 1, P+Length(aDelim)-1);
  end else begin
    Result := S;
    S := '';
  end;  
end;


function sFldDelim(aClassID: Byte): String;
begin
  Result := chFldDelim + Char(aClassID);
end;

function sListaDelim(aClassID: Byte): String;
begin
  Result := chListaDelim + Char(aClassID);
end;

function GetNextListItem(var sItems, sItem: String; aClassID: Byte): Boolean;
var 
  P : Integer;
  aDelim: String;
begin
  aDelim := sListaDelim(aClassID);
  P := Pos(aDelim, sItems);
  if P>0 then begin
    Result := True;
    sItem := Copy(sItems, 1, P-1);
    Delete(sItems, 1, P+Length(aDelim)-1);
  end else begin
    Result := False;
    sItems := '';
  end;
end;


function GetNextStrDelim(var S: String; aClassID: Byte): String;
begin
  Result := GetNextStrDelimCustom(S, sFldDelim(aClassID));
end;

{function StringListToListDelim(aSL: String; aClassID: Byte): String;
var 
  sl: TStrings;
  I: Integer;
begin
  Result := '';
  sl := TStringList.Create;
  try
    sl.Text := aSL;
    for I := 0 to sl.Count - 1 do 
      Result := Result + sl[i] + sListaDelim(aClassID);
  finally
    sl.Free;
  end;
end;

function StringListFromListDelim(aListDelim: String; aClassID: Byte): String;
var 
  aDelim: String;
  sl: TStrings;
begin
  Result := '';
  aDelim := sListaDelim(aClassID);
  sl := TStringList.Create;
  try
    while Pos(aDelim, aListDelim)>0 do 
      sl.Add(GetNextStrDelimCustom(aListDelim, aDelim));
    Result := sl.Text;  
  finally
    sl.Free;
  end;
end; }

procedure StrToLista(S: String; SL: TStrings);
begin
  SL.Clear;
  while S>'' do SL.Add(GetNextStrDelimCustom(S, chFldDelim));
end;

function ListaToStr(S: String): String;
var I : Integer;
begin
  Result := '';
  with TStringList.Create do
  try
    Text := S;
    for I := 0 to Count-1 do 
      Result := Result + Strings[I] + chListaDelim;
  finally
    Free;
  end;
end;

function GetDTStr(D: TDateTime): String;
begin
  Str(D, Result);
end;

function DTFromStr(S: String): TDateTime;
var Code: Integer;
begin
  Val(S, Result, Code);
  if Code<>0 then Result := 0;
end;

function FloatParaStr(Valor: Extended): String;
begin
  Str(Valor, Result);
end;

function StrParaFloat(S: String): Extended;
var Code: Integer;
begin
  Val(S, Result, Code);
  if Code<>0 then
    Result := 0;
end;


function StringToBool(S: String): Boolean;
begin
  S := UpperCase(S);
  Result := (S='T') or (S='TRUE') OR (S='S') or (S='SIM') or (S='1') or (S='Y') or (S='YES'); // do not localize
end;

procedure MinutosPorHora(Inicio, Fim: TDateTime; var Tempos: TArrayTempo);
var
  I : Integer;
  Hora, H, M, S, MS : Word;
  Agora, T, PH : TDateTime;
begin
  for I := 0 to 23 do Tempos[I] := 0;
  if Fim<=Inicio then Exit;
  DecodeTime(Inicio, H, M, S, MS);
  Agora := Inicio;
  Hora := H;
  I := Trunc(Inicio);
  while Agora < Fim do begin
    if H<23 then
      Inc(H)
    else begin
      H := 0;
      Inc(I);
    end;
    PH := I + EncodeTime(H, 0, 0, 0);
    if PH>Fim then PH := Fim;
    T := PH - Agora;
    Tempos[Hora] := Tempos[Hora] + (T*24*60);
    Hora := H;
    Agora := PH;
  end;
end;

function TncTempo.GetDateTime: TDateTime;
begin
  Result := Minutos / 60 / 24;
end;

function TncTempo.GetHoras: Extended;
begin
  Result := Minutos / 60;
end;

function TncTempo.GetSegundos: Extended;
begin
  Result := Minutos * 60;
end;

function TncTempo.GetTicks: Int64;
begin
  Result := Trunc(Minutos * 60000);
end;

procedure TncTempo.SetDateTime(const Value: TDateTime);
begin
  Minutos := Value * 24 * 60;
end;

procedure TncTempo.SetHoras(const Value: Extended);
begin
  Minutos := Value * 60;
end;

procedure TncTempo.SetSegundos(const Value: Extended);
begin
  Minutos := Value / 60;
end;

procedure TncTempo.SetTicks(const Value: Int64);
begin
  Minutos := Value / 60000;
end;

function ObtemCred(I: Integer): Cardinal;
begin
  if I>0 then 
    Result := I
  else
    Result := 0;  
end;

function TicksTotalArrayEtapas(AP: TncArrayEtapas): Cardinal;
var I : Integer;
begin
  Result := 0;
  for I := 0 to High(AP) do 
    Result := Result + AP[I].etTempo;
end;

function DuasCasas(D: Double): Double;
begin
  Result := Int(D*100) / 100;
end;

function LimpaTraco(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do 
  if S[I] <> '-' then 
    Result := Result + S[I];
end;

function NumStr(I, Tam: Integer): String;
begin
  Result := ZeroPad(IntToStr(I), Tam);
end;

function FormataNumVersao(St: String): String;
var I : Integer;
begin
  Result := St;
  I := Length(Result);
  while (I>0) and (Result[I]<>'.') do Dec(I);
  
  if (I>0) and (Result[I]='.') then 
    Result := Copy(Result, 1, I)+ZeroPad(Copy(Result, I+1, Length(Result)), 4);
end;

function CalcAcesso(Acesso, Sinal, Desc: Double): Double;
begin
  if Sinal > Acesso then
    Result := 0 - Desc
  else
    Result := Acesso - Sinal - Desc;  
end;

function VolumeSerial(DriveChar: Char): string;
var
  OldErrorMode: Integer;
  Serial, NotUsed, VolFlags: DWORD;
  Buf: array [0..MAX_PATH] of Char;
begin
  OldErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
  try
    Buf[0] := #$00;
    if GetVolumeInformation(PChar(DriveChar + ':\'), nil, 0, @Serial,
      NotUsed, VolFlags, nil, 0) then
      Result := IntToHex(Integer(Serial), 0)
    else Result := '';
  finally
    SetErrorMode(OldErrorMode);
  end;
end;

function Senha(D: TDateTime; NS: Cardinal; NumMaq: Integer): String;
var
  E : Extended;
  S : String;
begin
  try
    E := NS + (Int(D)*1000) +  (NumMaq * 1000) - 3;
    E := Ln(E);
    Str(E:0:30, S);
    S := Copy(S, Pos('.', S)+4, 8);
    Result := S[2] + S[8] + S[7] + S[3] + S[1] + S[4] + S[6] + S[5];
  except
   Result := 'Kznq098s'; // do not localize
  end;  
end;

{ TncClasse }
function Z2(I: Integer): String;
begin
  Result := IntToStr(I);
  if Length(Result)=1 then
    Result := '0' + Result;
end;

function TicksToHMSSt(Ticks: Cardinal): String;
var H, M, S : Integer;
begin
  H := Ticks div (1000 * 60 * 60);
  Ticks := Ticks mod (1000 * 60 * 60);
  M := Ticks div (1000 * 60);
  Ticks := Ticks mod (1000 * 60);
  S := Ticks div 1000;
  Result := Z2(H) + ':' + Z2(M) + ':' + Z2(S);  
end;

function TicksToDateTime(Ticks: Cardinal): TDateTime;
var H, M, S : Integer;
begin
//  Result := Ticks / 1000 / 60 / 60 / 24;
  
  H := Ticks div (1000 * 60 * 60);
  Ticks := Ticks mod (1000 * 60 * 60);
  M := Ticks div (1000 * 60);
  Ticks := Ticks mod (1000 * 60);
  S := Ticks div 1000;
  
  if (H>23) then H := 23;
  
  Result := EncodeTime(H, M, S, 0);
end;  

function MinutosToDateTime(M: Double): TDateTime;
begin
  Result := M / 24 / 60;
end;

function SegundosToHMSSt(Seg: Cardinal): String;
begin
  Result := IntToStr(Seg div (60 * 60));
  Seg := Seg mod (60 * 60);
  Result := Result + ':' + Z2(Seg div 60);
  Seg := Seg mod 60;
  Result := Result + ':' + Z2(Seg);
end;  

function SegundosToDateTime(Seg: Cardinal): TDateTime;
var H, M: Integer;
begin
  H := Seg div (60 * 60);
  Seg := Seg mod (60 * 60);
  M := Seg div 60;
  Seg := Seg mod 60;
  
  Result := EncodeTime(H, M, Seg, 0);
end;  

function MinutosToTicks(M: Double): Cardinal;
begin
  Result := Trunc(M * 60 * 1000);  
end;

function TicksToMinutos(Ticks: Cardinal): Double;
begin
  Result := Ticks / 1000 / 60;
end;

function DateTimeToTicks(D: TDateTime): Cardinal;
var 
  H, M, S, MS : Word;
  Dia : Int64;
  I : Int64;
begin
  I := Trunc(D * (24*60*60*1000));
{  Dia := Trunc(Int(D));
  I := (Dia * 24 * 60 * 60 * 1000) +
       (H * 60 * 60 * 1000) +
       (M * 60 * 1000) +
       (S * 1000) + MS;}
  if I>High(Cardinal) then
    I := High(Cardinal);
  Result := I;
end;  

function DateTimeToSegundos(D: TDateTime): Cardinal;
var H, M, S, MS : Word;
begin
  DecodeTime(D, H, M, S, MS);
  Result := (H * 60 * 60) + (M * 60) + S;
end;  

constructor TncClasse.Create;
begin
  inherited;
  FProcNotificar := nil;
end;

destructor TncClasse.Destroy;
begin
  try
    Notificar(tnDestruicao);
  except
    on E: Exception do 
      DebugMsg('TncClasse.Destroy - TipoClasse: ' + IntToStr(TipoClasse) + ' - Chave: ' + Chave + ' - Erro: ' + E.Message); // do not localize
  end;
  inherited;
end;

procedure TncClasse.Notificar(TipoNot: TTipoNotificacao);
begin
  if Assigned(FProcNotificar) then
    FProcNotificar(Self, TipoNot);
end;

{ TncMaquina }

constructor TncMaquina.Create;
begin
  inherited Create;
  FNumero        := 0;
  FNome          := '';
  FIDCliente     := 0;
  FProgramaAtual := '';
  FSiteAtual     := '';
  FExeAtual      := '';
  FPediuTela     := False;
  FUserObj       := nil;
  FMenu          := '';
  FRecursos      := '';
  FComputerName  := '';
  FTipoAcesso    := -1;
  FEmManutencao  := False;
  FDireito       := dmNenhum;
  FObs           := '';
  FMacAddress    := '';
  FIP            := '';
  FIPConfig      := '';
  FPatrocinio    := '';
  FAvisaFimTempo := False;
  FDisplayW := 0;
  FDisplayH := 0;

  FRAM              := 0;
  FCPU              := '';
  FOS               := '';
  FPrinters         := '';
  FDrives           := '';
  FHDTotal          := 0;
  FHDFree           := 0;
  FLastScan         := 0;
  
  AtualizaCache;
end;

destructor TncMaquina.Destroy;
begin
  if FUserObj <> nil then FUserObj.Free;
  inherited;
end;

function TncMaquina.DisplayRes: String;
begin
  if (FDisplayW>0) and (FDisplayH>0) then
    Result := IntToStr(FDisplayW) + 'x' + IntToStr(FDisplayH) else
    Result := '';
end;

function TncMaquina.TipoClasse;
begin
  Result := tcMaquina;
end;

function TncMaquina.GetChave: Variant;
begin
  Result := Numero;
end;

{ TncServidorBase }

procedure TncServidorBase.ChecaErro(Erro: Integer);
begin
    try
        if Erro > 0 then
            if Erro > ncErrUltimo then begin
              try
                Ativo := False;
              except
              end;
              raise EErroNexCafe.Create(ncerrConexaoPerdida);
            end else
              raise EErroNexCafe.Create(Erro);
  except
    on e: exception do begin
        glog.LogCriticalException(self,Erro, e);
        raise e;
    end;
  end;
end;

constructor TncServidorBase.Create(AOwner: TComponent);
begin
  inherited;
  FClientes := TThreadList.Create;
  FUltimoHandle := 0;
  FAtivo := False;
  FOnEnviaEvento := nil;
end;

destructor TncServidorBase.Destroy;
begin
  FreeAndNil(FClientes);
  inherited;
end;

function TncServidorBase.Download(aFonte, aDestino: String): Integer;
begin
  Result := 0;
end;

procedure TncServidorBase.EnviaEvento(Mensagem: Integer; Dados: Pointer);
var 
  I, Faltam : Integer;  
  CopiaDados: Pointer;
  C         : TncCliente;
begin
  if Assigned(FOnEnviaEvento) then begin
    DebugMsg('TncServidorBase.EnviaEvento 1 - Não Enviou Mensagem: ' + GetMsgIDString(Mensagem)); // do not localize
    FOnEnviaEvento(Mensagem, Dados);
    Exit;
  end;
  with FClientes.LockList do
  try
    Faltam := NumClientesLocais;
    if Faltam = 0 then begin
      DebugMsg('TncServidorBase.EnviaEvento 2 - Não há clients. Não Enviou Mensagem: ' + GetMsgIDString(Mensagem)); // do not localize
      FreeDados(Mensagem, Dados);
      Exit;
    end;
    
    for I := 0 to pred(Count) do begin
      C := Items[I];
      if (C.WndHandle>0) and (not C.Remoto) then begin
        DebugMsg('TncServidorBase.EnviaEvento 3 - C.WndHandle: ' + IntToStr(C.WndHandle) + ' - Mensagem: ' + GetMsgIDString(Mensagem)); // do not localize
      
        if (Faltam>1) then
          CopiaDados := ClonaDados(Mensagem, Dados);
        EnviaMsg(C.WndHandle, Mensagem, 0, Integer(Dados));
        Dados := CopiaDados;  
        Dec(Faltam);
      end else
        DebugMsg('TncServidorBase.EnviaEvento 4 - Não Enviou Mensagem: ' + GetMsgIDString(Mensagem)); // do not localize
    end;  
  finally
    FClientes.UnlockList;
  end;  
end;

function TncServidorBase.EnviarEventos: Boolean;
begin
  Result := (NumClientesLocais>0);
end;

function TncServidorBase.FinalizaProcesso(aMaq: Word;
  aProcessID: Integer): Integer;
var
  msgFinalizaProc : PmsgFinalizaProcesso;  
begin
  Result := 0;
  New(msgFinalizaProc);
  msgFinalizaProc^.msgProcessID := aProcessID;
  msgFinalizaProc^.msgMaq := aMaq;
  EnviaEvento(ncmc_FinalizaProcesso, msgFinalizaProc);
end;

function TncServidorBase.GetProxSocketLic(aUltimo: Integer; var aMaq: Integer): Integer;
var 
  p, q, h: integer;
  cli: TncCliente;

procedure IncP;
begin
  if p<h then
    Inc(p) else
    p := 0;
end;

begin
  Result := -1; 
  aMaq := -1;
  with FClientes.LockList do
  try
    if count=0 then Exit;
    
    if (count=1) then begin 
      if TncCliente(Items[0]).FMaquina>0 then begin
        Result := TncCliente(Items[0]).FSocket;
        aMaq := TncCliente(Items[0]).FMaquina;
      end;
      Exit;
    end;
    p := 0;
    h := count-1;
    
    if aUltimo<>-1 then begin
      while (p<h) and (TncCliente(Items[p]).FSocket<>aUltimo) do Inc(p);
      IncP;
    end;

    q := 1;
    while (q<count) and (TncCliente(Items[p]).FMaquina<1) do begin
      IncP;
      Inc(q);
    end; 
    
    if TncCliente(Items[p]).FMaquina>0 then begin
      Result := TncCliente(Items[p]).FSocket;
      aMaq := TncCliente(Items[p]).FMaquina;
    end;
      
  finally
    FClientes.UnlockList;
  end;
end;

procedure TncServidorBase.AddCliente(Obj: TncCliente);
begin
  with FClientes.LockList do
  try
    Add(Obj);
  finally
    FClientes.UnlockList;
  end;
end;

function TncServidorBase.ProximoHandle: Integer;
begin
  Inc(FUltimoHandle);
  Result := FUltimoHandle;
end;

procedure TncServidorBase.RemoveCliente(Obj: TncCliente);
var 
  I : Integer;
  C : TncCliente;
begin
  with FClientes.LockList do
  try
    I := 0;
    if Obj.Proxy then begin
      while I < Count do begin
        C := TncCliente(Items[I]);
        if (C.ProxyHandle=Obj.Handle) then begin
          if C.Proxy then I := 0;
          RemoveCliente(C);
        end else
          Inc(I);
      end;
    end;     
    Remove(Obj);
    AoRemoverCliente(Obj);   
    Obj.Free;
  finally
    FClientes.UnlockList;
  end;
end;

function TncServidorBase.NumClientesLocais: Integer;
var 
  I : Integer;
  C : TncCliente;
begin
  with FClientes.LockList do
  try
    Result := 0;
    for I := 0 to pred(Count) do begin
      C := TncCliente(Items[I]);
      if (not C.Remoto) and (C.WndHandle>0) then
        Inc(Result);
    end;    
  finally
    FClientes.UnlockList;
  end;
end;

class procedure TncServidorBase.Lock;
begin
  DebugMsg('TncServidorBase.Lock - ThreadID: '+IntToStr(GetCurrentThreadID)); // do not localize
  csServ.Enter;
  DebugMsg('TncServidorBase.Lock OK - ThreadID: '+IntToStr(GetCurrentThreadID)); // do not localize
end;

function TncServidorBase.Login(aUsername, aSenha: String; aMaq: Word; aFuncAtual: Boolean; aRemoto: Boolean;
  aWndHandle: HWND; aProxyHandle: Integer; aSocket: Integer; aSessionID: Integer; aIP: String;
  var Handle: Integer): Integer;
var
  C : TncCliente;  
begin
  Result := 0;
  C := TncCliente.Create;
  C.UserName := aUserName;
  C.Handle := Handle;
  C.Remoto := aRemoto;
  C.WndHandle := aWndHandle;
  C.ProxyHandle := aProxyHandle;
  C.Maquina := aMaq;
  C.Socket := aSocket;
  C.Inicio := Now;
  C.SessionID := aSessionID;
  AddCliente(C);
end;

procedure TncServidorBase.Logout(Cliente: Integer);
var C : TncCliente;
begin
  C := ObtemCliente(Cliente);
  if C <> nil then 
    RemoveCliente(C);
end;

procedure TncServidorBase.LogoutSession(aSessionID: Integer);
var I : Integer;
begin
  with FClientes.LockList do
  try
    for I := 0 to pred(Count) do 
    if TncCliente(Items[I]).SessionID = aSessionID then begin
      RemoveCliente(TncCliente(Items[I]));
      Exit;
    end;
  finally
    FClientes.UnlockList;
  end;  
end;

procedure TncServidorBase.LogoutSocket(Socket: Integer);
var C : TncCliente;
begin
  C := ObtemClientePorSocket(Socket);
  while (C<>nil) do begin
    RemoveCliente(C);
    C := ObtemClientePorSocket(Socket);
  end;  
end;


function TncServidorBase.ObtemCliente(aHandle: Integer): TncCliente;
var I : Integer;
begin
  Result := nil;
  if FClientes=nil then Exit;
  
  with FClientes.LockList do
  try
    for I := 0 to pred(Count) do 
    if TncCliente(Items[I]).Handle = aHandle then begin
      Result := Items[I];
      Exit;
    end;
  finally
    FClientes.UnlockList;
  end;  
end;

function TncServidorBase.ObtemClientePorSessionID(aSessionID: Integer): TncCliente;
var I : Integer;
begin
  with FClientes.LockList do
  try
    if aSessionID > 0 then
    for I := 0 to pred(Count) do 
    if TncCliente(Items[I]).SessionID = aSessionID then begin
      Result := Items[I];
      Exit;
    end;
    Result := nil;  
  finally
    FClientes.UnlockList;
  end;  
end;

function TncServidorBase.ObtemClientePorSocket(Socket: Integer): TncCliente;
var I : Integer;
begin
  with FClientes.LockList do
  try
    if Socket > 0 then
    for I := 0 to pred(Count) do 
    if TncCliente(Items[I]).Socket = Socket then begin
      Result := Items[I];
      Exit;
    end;
    Result := nil;  
  finally
    FClientes.UnlockList;
  end;  
end;

function TncServidorBase.ObtemHandleClientePorMaq(aMaq: Word): Integer;
var I : Integer;
begin
  Result := 0;
  if aMaq=0 then Exit;
  with FClientes.LockList do
  try
    for I := 0 to pred(Count) do 
    if TncCliente(Items[I]).Maquina = aMaq then begin
      Result := TncCliente(Items[I]).Handle;
      Exit;
    end;
  finally
    FClientes.UnlockList;
  end;  
end;

function TncServidorBase.ObtemPastaServ(var NomePastaServ: String): Integer;
begin
  Result := 0;
  NomePastaServ := ExtractFilePath(ParamStr(0));
end;

function TncServidorBase.ObtemProcessos(aMaq: Word; aIDCliente,
  aIDReq: Integer): integer;
var msgObtemProc : PmsgObtemProcessos;  
begin
  Result := 0;
  New(msgObtemProc);
  msgObtemProc^.msgIDCliente := aIDCliente;
  msgObtemProc^.msgIDRequest := aIDReq;
  msgObtemProc^.msgMaq := aMaq;
  EnviaEvento(ncmc_ObtemProcessos, msgObtemProc); 
end;

procedure TncServidorBase.ObtemSessionSocketArray(aMaq: Integer;
  var SS: TArraySessionSocket);
var I, C: Integer;  
begin
  SetLength(SS, 0);
  C := 0;
  with FClientes.LockList do 
  try
    for I := 0 to pred(count) do with TncCliente(Items[i]) do 
      if (SessionID>0) and ((aMaq=0) or (aMaq=High(Word)) or (aMaq=Maquina)) then begin
        Inc(C);
        SetLength(SS, C);
        SS[C-1].ssSession := SessionID;
        SS[C-1].ssSocket  := Socket;
        SS[C-1].ssMaq     := Maquina;
      end;  
  finally
    FClientes.UnlockList;
  end;  
  
end;

function TncServidorBase.ObtemUsernameHandlePorSessionID(aSessionID: Integer; var aUsername: String; var aHandle: Integer): Boolean;
var I: Integer;  
begin
  with FClientes.LockList do 
  try
    for I := 0 to pred(count) do with TncCliente(Items[i]) do 
      if aSessionID=SessionID then begin
        aUsername := Username;
        aHandle := Handle;
        Result := True;
        Exit;
      end;  
  finally
    FClientes.UnlockList;
  end; 
  aUsername := '';
  aHandle := -1;
  Result := False; 
end;

procedure TncServidorBase.SetAtivo(Valor: Boolean);
begin
  if not Valor then DesativaClientes;
  FAtivo := Valor;
end;

class procedure TncServidorBase.Unlock;
begin
  DebugMsg('TncServidorbase.Unlock'); // do not localize
  csServ.Leave;
end;

function TncServidorBase.Upload(aFonte, aDestino: String): Integer;
begin
  Result := 0;
end;

procedure TncServidorBase.DesativaClientes;
begin
  EnviaEvento(ncmc_ServidorDesativado, nil);
  with FClientes.LockList do 
  try
    while Count > 0 do begin
      TncCliente(Items[0]).Free;
      Delete(0);
    end;  
  finally
    FClientes.UnlockList;
  end;  
end;

procedure TncServidorBase.AoRemoverCliente(Cliente: TncCliente);
begin

end;

function TncServidorBase.BaixaNovaVersao(Programa, Versao,
  ArqDestino: String): Integer;
begin
  Result := ncerrSemNovaVersao;
end;

{ TncCliente }

constructor TncCliente.Create;
begin
  inherited;
  FHandle   := 0;
  FRemoto   := False;
  FUsername := '';
  FWndHandle:= 0;
  FSocket   := 0;
  FInicio   := 0;
end;

function TncCliente.TipoClasse: Integer;
begin
  Result := tcCliente;
end;

function TncCliente.Proxy: Boolean;
begin
  Result := (Username = ProxyUsername);
end;


function TncCliente.GetChave: Variant;
begin
  Result := FHandle;
end;

{ TncListaMaquinas }

constructor TncListaMaquinas.Create;
begin
  inherited Create(tcMaquina);
end;

function TncListaMaquinas.GetCount: Integer; 
begin
  Result := inherited GetCount;
{  if (Result>2) and RegistroLicencaGlobal.EmModoDemo then
    Result := 2;}
end;

function TncListaMaquinas.GetMaquina(I: Integer): TncMaquina;
begin
  Result := TncMaquina(GetItem(I));
end;

function TncListaMaquinas.NumConectados: Integer;
var I : Integer;
begin
{$I crypt_start.inc}
  Result := 0;
  for I := 0 to Pred(GetCount) do 
  if (GetMaquina(I).IDCliente>0) then Inc(Result);
{$I crypt_end.inc}
end;

function MesmoComputerName(aComp1, aComp2: String): Boolean;
begin
  Result := False;
  if Trim(aComp1)='' then Exit;
  if Trim(aComp2)='' then Exit;

  while Copy(aComp1, 1, 1)='\' do Delete(aComp1, 1, 1);
  while Copy(aComp2, 1, 1)='\' do Delete(aComp2, 1, 1);

  Result := SameText(aComp1, aComp2);
end;

function TncListaMaquinas.PorComputerName(aComp: String;
  aUnico: Boolean): TncMaquina;
  var I : Integer;
begin
  Result := nil;
  if Trim(aComp)='' then Exit;
  while Copy(aComp, 1, 1)='\' do Delete(aComp, 1, 1);
  for I := 0 to Count - 1 do
  if SameText(GetMaquina(I).ComputerName, aComp) then begin
    if (Result<>nil) and aUnico then begin
      Result := nil;
      Exit;
    end;
    Result := GetMaquina(I);
  end;
end;

function TncListaMaquinas.PorIP(aIP: String): TncMaquina;
  var I : Integer;
begin
  if Trim(aIP)='' then Exit;
  while Copy(aIP, 1, 1)='\' do Delete(aIP, 1, 1);
  for I := 0 to Count - 1 do begin
    Result := GetMaquina(I);
    if SameText(Result.IP, aIP) or ((aIP<>'127.0.0.1') and (Pos(':', aIP)>0) and (Pos(aIP, Result.IPConfig)>0)) then  // do not localize
      Exit;
  end;
  Result := nil;
end;

function TncListaMaquinas.GetMaquinaPorNumero(N: Integer): TncMaquina;
begin
  Result := TncMaquina(ItemPorChave[N]);
end;

function TncListaMaquinas.GetMaquinaPorIDCliente(C: Integer): TncMaquina;
var I : Integer;
begin
  for I := 0 to Count - 1 do
  if GetMaquina(I).IDCliente=C then begin
    Result := GetMaquina(I);
    Exit;
  end;
  Result := nil;
end;

constructor EErroNexCafe.Create(CE: Integer);
begin
  inherited Create(SncClassesBase_ErroNexCafé+IntToStr(CE)+'): '+StringErro(CE));
  CodigoErro := CE;
end;

{ TncListaUsuarios }

constructor TncListaUsuarios.Create;
begin
  inherited Create(tcUsuario);
end;

function TncListaUsuarios.GetUsuario(I: Integer): TncUsuario;
begin
  Result := TncUsuario(GetItem(I));
end;

function TncListaUsuarios.GetUsuarioPorUsername(N: String): TncUsuario;
begin
  Result := TncUsuario(GetItemPorChave(N));
end;

{ TncUsuario }

constructor TncUsuario.Create;
begin
  inherited;
  FNumClientes := 0;
  FUsername    := '';
  FAdmin       := False;
  FSenha       := '';
  FDireitos    := '';
  FMaxMaqManut := 0;
  FMaxTempoManut := 0;
  FLimiteDesc := 0;
end;

function TncUsuario.GetChave: Variant;
begin
  Result := FUsername;
end;

function TncUsuario.PodeDesconto(aTotal, aDesc: Currency): Boolean;
begin
  Result := (not gConfig.IsPremium) or Admin or (((aDesc/aTotal)*100)<=FLimiteDesc);
end;

procedure TncUsuario.SetAdmin(Valor: Boolean);
begin
  FAdmin := Valor;
end;

procedure TncUsuario.SetDireitos(Valor: String);
begin
  FDireitos := Valor;
end;

procedure TncUsuario.SetNome(Valor: String);
begin
  FNome := Valor;
end;

procedure TncUsuario.SetNumClientes(Valor: Integer);
begin
  FNumClientes := Valor;
end;

procedure TncUsuario.SetSenha(Valor: String);
begin
  FSenha := Valor;
end;

procedure TncUsuario.SetUsername(Valor: String);
begin
  FUsername := Valor;
end;

function TncUsuario.TipoClasse: Integer;
begin
  Result := tcUsuario;
end;

{ TncConfig }

constructor TncConfig.Create;
begin
  inherited;
  fCodProdutoDuplicados := false;
  fAutoCad             := true;
  fQuickCad            := true;
  FPermiteLoginSemCred := False;
  FAlteraLoginSemCred  := False;
  FPacoteTempoReal     := True;
  FEncerramentoPrePago := eppPausarAcesso;
  FEncerramentoCartao  := eppEncerrarAcesso;
  FTempoEPrePago       := 60;
  FTempoECartao        := 60;
  FBRT                 := 60;
  FExCookie            := False;
  FHPOpenBef           := False;
  FCliCongelado        := False;
  FCamposCliCC         := TStringList.Create;
  FSenhaAdminOk        := False;
  FQtdMaqOk            := False;
  fMargem              := 0;
  fPrecoAuto           := False;
  FComissaoPerc        := 0;
  FComissaoLucro       := False;

  FCodBarBal             := False;
  FCodBarBalTam          := 13;
  FCodBarBalIdent        := '2';
  FCodBarBalInicioCod    := 2;
  FCodBarBalTamCod       := 5;
  FCodBarBalValor        := True;
  FCodBarBalPPInicio     := 7;
  FCodBarBalPPTam        := 5;
  FCodBarBalPPDig        := 2;

  FVariosTiposAcesso   := False;
  FModoPagtoAcesso     := 0;
  FMostraPrePagoDec    := True;
  FCliCadPadrao        := False;
  FAutoExecutar        := '';
  FFecharProgramas     := True;
  FAutoExecutar        := '';
  FFecharProgramas     := True;
  FAlertaFimTempo      := 0;
  FTempoMaxAlerta      := 0;
  FPermiteCapturaTela  := True;
  FLimiteTempoPadrao   := 0;
  FCorLivre            := clGreen;
  FCorFLivre           := clWhite;
  FCorUsoPrePago       := clRed;
  FCorFUsoPrePago      := clWhite;
  FCorUsoPosPago       := clRed;
  FCorFUsoPosPago      := clWhite;
  FCorPausado          := clYellow;
  FCorFPausado         := clBlack;
  FCorAguardaPagto     := clGray;
  FCorFAguardaPagto    := clWhite;
  FCorManutencao       := clBlack;
  FCorFManutencao      := clWhite;
  FCorDesktop          := clBackground;
  FCorFDesktop         := clWhite;
  FCorMaqManut         := clSilver;
  FCorFMaqManut        := clBlack;
  FCorPrevisao      := clRed;
  FCorFPrevisao     := clWhite;
  FTolerancia          := EncodeTime(0, 2, 0, 0);
  FRegImp98            := False;
  
  FRecImprimir           := 0;
  FRecMatricial          := False;
  FRecTipoImpressora     := '';
  FRecPorta              := '1'; // do not localize
  FRecSalto              := 10;
  FRecLargura            := 40;
  FRecCortaFolha         := False;
  FRecRodape             := '';
  FRecNomeLoja           := SncClassesBase_NOMEDALOJA;
  
  FMostraProgAtual     := True;
  FManterSaldoCaixa    := False;
  FMostraObs           := False;
  FMostraNomeMaq       := False;
  FEscondeTextoBotoes  := False;
  FEscondeTipoAcesso   := False;
  FExigirRG            := False;
  FControlaImp         := ciDesativado;
  FCampoLocalizaCli    := 0;
  FMostrarApenasPIN    := False;
  FTextoPIN            := SncClassesBase_NomeDeUsuário;
  FNumFDesktop         := 0;
  FNumFLogin           := 0;
  FTipoFDesktop        := '';
  FTipoFLogin          := '';
  FFundoWeb            := False;
  FFundoWebURL         := '';
  FAlterarSenhaCli     := False;
  FVerSenhaCli         := False;
  FLimitePadraoDebito  := 0;
  FConta               := '';
  FCodEquip            := '';
  FQtdLic              := 0;
  FStatusConta         := scSemConta;
  
  FVerPri              := 0;
  FFreePremium         := False;

  FDataLic             := 0;
  FDVA                 := 0;                      
  FProxAvisoAss        := 0;
  FPreLib              := False;
  
  FAssinaturaVenceEm   := 0;
  FAlertaAssinatura    := True;
  FJaFoiPremium        := False;
  
  FEmailMetodo         := 0;
  FEmailServ           := '';
  FEmailUsername       := '';
  FEmailSenha          := '';
  FEmailDestino        := '';
  FEmailEnviarCaixa    := False;
  FEmailConteudo       := '11111111111111111111'; // do not localize
  FEmailIdent          := '';

  FFiltrarWeb := False;
  FSiteRedirFiltro       := '';
  FBloqDownload          := False;
  FBloqDownloadExe       := False;
  FBloqMenuIniciar       := True;
  FBloqPainelCtrl        := True;
  FBloqCtrlAltDel        := True;
  FBloqExecutar          := True;
  FBloqMeusLocaisRede    := True;
  FClassicStartMenu      := False;
  FBloqTray              := False;
  FBloqBotaoDir          := True;
  FFiltrarDesktop        := True;
  FFiltrarMenuIniciar    := False;
  FBloqToolbars          := True;

  FBloqPosPago           := False;

  FBloqueiaCliAvulso     := False;
  FExigeDadosMinimos     := False;
  FCidadePadrao          := '';
  FUFPadrao              := '';
  FDadosMinimos          := '';
  FPedirSaldoI           := True;
  FPedirSaldoF           := True;
  
  FTempoB1 := 10;
  FTempoB2 := 15;
  FTempoB3 := 30;
  FTempoB4 := 60;
  FTempoB5 := 120;
  FTempoB6 := 180;
  
  FCredPadraoTipo        := 1;
  FCredPadraoCod         := 0;

  FPaginaInicial         := '';
  FEsconderCronometro    := False;
  FAposEncerrar          := 0;
  FAlinhaBarraGuard      := 0;
  FNoNet                 := 1;
  FTempoSumirLogin       := 30;
  FEsconderDrives        := '';
  FMinutosDesligaMaq     := 0;
  FMinutosDesligaMon     := 0;
  FOpcaoChat             := ochJanelaVisivel;

  FPgVendas              := False;
  FPgVendaAvulsa         := True;
  FPgAcesso              := True;
  FPgTempo               := True;
  FPgImp                 := True;
  FBloquearUsoEmHorarioNP := True;
  FSalvarCodUsername := False;
  FContinuarCredTempo := False;
  FNaoGuardarCreditoCli := False;
  FRelCaixaAuto := True;
  FNaoMostrarMsgDebito   := False;
  FNaoTransferirMaq := False;
  FNaoCobrarImpFunc := False;
  FSincronizarHorarios := False;
  
  FMostrarDebitoNoGuard   := False;
  FBloquearLoginAlemMaxDeb:= False;
  FClienteNaoAlteraSenha  := False;
  FNaoObrigarSenhaCliente := False;
  FNaoVenderAlemEstoque   := False;
  FCreditoComoValor       := False;
  FCliAvulsoNaoEncerra    := False;
  FAutoSortGridCaixa      := False;
  FAvisoFimTempoAdminS    := 0;
  FDetectarImpServ        := False;
  FAvisoCreditos          := True;
  FClientePodeVerCred     := True;
  FChatAlertaSonoro       := True;
  FChatMostraNotificacao  := True;
  FModoCredGuard          := 0;
  FSemLogin := False;

  FMsgFimCred             :=
    SncClassesBase_VocêPossuiCréditosQueNãoPodemSer;

  FAutoObsAoCancelar      := False;
    
  FFidAtivo               := False;
  FFidSessaoValor         := 0;
  FFidSessaoPontos        := 0;
  FFidVendaValor          := 0;
  FFidVendaPontos         := 0;
  FFidImpValor            := 0;
  FFidImpPontos           := 0;
  FFidParcial             := False;
  FFidMsg                 := False;
  FFidMsgTitulo           := '';
  FFidMsgTexto            := '';

  FFidAutoPremiar         := False;
  FFidTipoPremioAuto      := tpaPassaporte;
  FFidPremioAuto          := 0;
  FFidPontosPremioAuto    := 0;

  FFidMostrarSaldoGuard   := False;
  FFidMostrarSaldoAdmin   := False;
  FCliCadNaoEncerra       := False;
  FImpedirPosPago         := False;
  FAutoLigarMaqCli        := True;
  FPastaDownload          := '';
  FBiometria              := False;
  
  FPMPausaAutomatica      := True;
  FPMConfirmaImpCliente   := True;
  FPMConfirmaImpAdmin     := False;
  FPMAdminControlaImp     := True;
  FPMMostrarPaginasCli    := True;
  FPMMostrarValorCli      := True;
  FPMCalcValorCli         := pm_cvc_intervalo;
  FPMPromptValorCli       := SncClassesBase_CustoDaImpressão;
  FPMObsValorCli          := SncClassesBase_OCustoPodeVariarDependendoDoTipo;
  FPMValorMin             := 0;
  FPMValorMax             := 0;

  FPMPausarServ           := False;
  FPMNaoPausar            := '';

  FPMCotas                := False;
  FPMCotasMaxPagDia       := 0;
  FPMCotasMaxPagMes       := 0;
  FPMCotasOpCota          := opcota_confirmar;
  FPMCotasOpExcesso       := opexcesso_confirmar;
  FPMCotasMaxExcesso      := 0;
  FPMCotasPorCli          := False;
  FPMPDF                  := True;
  FPMReviewCli            := True;
  FPMReviewAdmin          := True;
  FPMPDFPrintEng          := printeng_Adobe;

  FPubHomePage            := True;
  FPubAd                  := False;
  FPubToolbar             := True;

  FMaxTempoSessao         := 0;
  FTarifaPadrao           := clWhite;
  FTarifaPorHorario       := False;
  FBloqMeuComputador      := False;
  FBloqLixeira            := False;
  FBloqMeusDocumentos     := False;

  FPosLogin               := poslogin_centro;
  FServerDir              := '';

  FHomePage_URL          := '';
  FHomePage_Tab          := False;
  FHomePage_LastURL      := 0;
  FSky_Url               := '';
  FToolbar_Url           := '';
  FBotoes                := '';
  FBanners               := '';
  SetLength(FArrayComanda, 0);
  FComandaOff            := False;
  FMesasOff              := False;
  FConsumoAvulsoOff      := False;
  FRecursos              := '';
  FConfirmarDebito       := True;
end;

function SoDig(S: String): String;
var i: integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if S[I] in ['0'..'9'] then
      Result := Result + S[I];
end;

function TncConfig.DadosMinOk(T: TDataset): Boolean;
var 
  I, P, N : Integer;
  F : TField;
  S, sFld : String;

function NextFld: Integer;
var sNum: String;
begin
  P := Pos(',', S);
  if P=0 then begin
    sNum := S;
    S := '';
  end else begin
    sNum := Copy(S, 1, P-1);
    Delete(S, 1, P);
  end;
  Result := StrToIntDef(SoDig(sNum), -1);
end;  

begin
  if ExigeDadosMinimos and (Trim(DadosMinimos)>'') then begin
    Result := False;
    S := Trim(DadosMinimos);
    while S>'' do begin
      N := NextFld;
      if N>=0 then 
        sFld := slDadosMin.ValueFromIndex[N] else
        sFld := '';
        
      if sFld>'' then begin
        F := T.FindField(sFld);
        if F<>nil then begin
          if (F.DataType in [ftDate, ftDateTime]) then begin
            if F.IsNull then Exit;
          end else 
            if F.IsNull or (Trim(F.AsString)='') then Exit;
        end;
      end;
    end;                                     
  end;
  Result := True;
end;

function TncConfig.DecodeCodBarBalanca(aCodigo: String;
  var aInfo: TncCodBarBalInfo): Boolean;
begin
  aInfo.Codigo := '';
  Result := False;
  if not CodBarBal then Exit;
  if CodBarBalIdent = '' then Exit;
  if CodBarBalTam < 1 then Exit;
  if Length(aCodigo) <> CodBarBalTam then Exit;
  if Copy(aCodigo, 1, Length(CodBarBalIdent))<>CodBarBalIdent then Exit;
  Result := True;
  aInfo.Codigo := Copy(aCodigo, CodBarBalInicioCod, CodBarBalTamCod);
  aInfo.PesoValor := StrToIntDef(Copy(aCodigo, CodBarBalPPInicio, CodBarBalPPTam), 0) / Power(10, CodBarBalPPDig);
  aInfo.BalValor := CodBarBalValor;
end;

destructor TncConfig.Destroy;
begin
  FCamposCliCC.Free;
  inherited;
end;

procedure TncConfig.SetVerPri(const Value: Word);
begin
  FVerPri := Value;
  if not LadoServidor then
    Versoes.Versao := Value;
end;

function TncConfig.CalcPontos(aValor: Currency; aTipo: Byte): Double;
var 
  Valor: Currency;
  Pontos : Integer;
begin
  Result := 0;
  if not FFidAtivo then Exit;

  case aTipo of
    tpfVenda  : begin
      Valor := FFidVendaValor;
      Pontos := FFidVendaPontos;
    end;
    tpfSessao : begin
      Valor := FFidSessaoValor;
      Pontos := FFidSessaoPontos;
    end;
    tpfImp : begin
      Valor := FFidImpValor;
      Pontos := FFidImpPontos;
    end;
  else
    Valor := 0; Pontos := 0;  
  end;

  if (Valor=0) or (Pontos=0) then Exit;

  Result := aValor/Valor;
  if not FFidParcial then Result := Trunc(Int(Result));
  Result := Result * Pontos;
end;

function TncConfig.CalcPreco(aMargem: Variant; aCusto: Currency): Currency;
var M: Double;
begin
  if VarIsNull(aMargem) then
    M := gConfig.Margem else
    M := aMargem;

  if M>0.009 then begin
    Result := aCusto * (1 + (M/100));
    Result := LimitaCasasDec(Result);
  end else
    Result := 0;
end;

function TncConfig.cce(acce: Integer): Boolean;
begin
  Result := (Copy(FEmailConteudo, acce+1, 1)='1');
end;

function TncConfig.ChecaCores: Boolean;
begin
  Result := False;
  if FCorLivre = FCorFLivre then begin
    FCorLivre            := clGreen;
    FCorFLivre           := clWhite;
    Result := True;
  end;  
  
  if FCorUsoPrePago = FCorFUsoPrePago then begin
    FCorUsoPrePago       := clRed;
    FCorFUsoPrePago      := clWhite;
    Result := True;
  end;  
  
  if FCorUsoPosPago = FCorFUsoPosPago then begin
    FCorUsoPosPago       := clRed;
    FCorFUsoPosPago      := clWhite;
    Result := True;
  end;  
  
  if FCorPausado = FCorFPausado then begin
    FCorPausado          := clYellow;
    FCorFPausado         := clBlack;
    Result := True;
  end;  
  
  if FCorAguardaPagto = FCorFAguardaPagto then begin
    FCorAguardaPagto     := clGray;
    FCorFAguardaPagto    := clWhite;
    Result := True;
  end;  
  
  if FCorManutencao = FCorFManutencao then begin
    FCorManutencao       := clBlack;
    FCorFManutencao      := clWhite;
    Result := True;
  end;

  if FCorDesktop = FCorFDesktop then begin
    FCorDesktop          := clBackground;
    FCorFDesktop         := clWhite;
  end;
end;

function TncConfig.CodLojaInt: Integer;
begin
  Result := StrToCodLoja(FConta);
end;

function TncConfig.ComandaValida(const aNum: Integer): Boolean;
begin
  Result := (aNum>0) and IntegerDentroFaixa(FArrayComanda, aNum) and (not FComandaOff);
end;

function TncConfig.ConfigComandaOk: Boolean;
begin
  Result := FComandaOff or ((Length(FArrayComanda)>0) and ((FArrayComanda[0].fiDe>0) and (FArrayComanda[0].fiAte>=FArrayComanda[0].fiDe) ));
end;

function TncConfig.ConfirmarImpAdmin: Boolean;
begin
  if PMPDF then
    Result := ConfirmarImpDisponivel and ((PMPausaAutomatica and PMConfirmaImpAdmin) or RevisarPDFAdmin) else
    Result := ConfirmarImpDisponivel and (PMPausaAutomatica and (PMConfirmaImpAdmin or PMPausarServ));
end;

function TncConfig.ConfirmarImpCli: Boolean;
begin
  Result := ConfirmarImpDisponivel and PMPausaAutomatica and PMConfirmaImpCliente;
end;

function TncConfig.ConfirmarImpDisponivel: Boolean;
begin
  Result := (StatusConta <> scAnt) or
            Versoes.PodeUsar(idre_pausaimpressao);
end;

function TncConfig.ImpOutras: Boolean;
begin
  Result := SameText(Self.RecTipoImpressora, SncaFrmConfigRec_OutraSerial);
end;

function TncConfig.ImprimirPDFDireto: Boolean;
begin
  Result := (gTiposImp.Count<2) and (not PMConfirmaImpCliente) and (not RevisarPDF);
end;

function TncConfig.GetCamposCliCCText: String;
begin
  Result := FCamposCliCC.Text;
end;

function TncConfig.GetChave: Variant;
begin
  Result := 0;
end;

function TncConfig.GetDTol: Byte;
begin
  Result := gDTol;
end;

function TncConfig.GetFaixaComanda: String;
begin
  Result := ArrayFaixaIntegerToString(FArrayComanda);
end;

function TncConfig.GetFiltrarMenuIniciar: Boolean;
begin
  if LadoServidor or (Win32MajorVersion<6) then
    Result := FFiltrarMenuIniciar else
    Result := False;
end;

function TncConfig.GetPausaAutomatica: Boolean;
begin
  Result := FPMPausaAutomatica and Versoes.PodeUsar(idre_pausaimpressao);
end;

function TncConfig.GetPMValorCaption(aPages: Word): String;
begin
  if (FPMValorMin<0.00001) or (FPMValorMax<0.00001) then
    Result := ''
  else  
  if FPMValorMin=FPMValorMax then
    Result := FloatToStrF(FPMValorMin*aPages, ffCurrency, 10, 2)
  else  
    case PMCalcValorCli of
      pm_cvc_intervalo : 
        Result := FloatToStrF(FPMValorMin*aPages, ffCurrency, 10, 2) + ' a ' + 
                  FloatToStrF(FPMValorMax*aPages, ffCurrency, 10, 2);
                  
      pm_cvc_minimo    : 
        Result := FloatToStrF(FPMValorMin*aPages, ffCurrency, 10, 2);
      
      pm_cvc_maximo    : 
        Result := FloatToStrF(FPMValorMax*aPages, ffCurrency, 10, 2);
    end;
end;

function TncConfig.GetRecBobina: Boolean;
begin
  Result := RecMatricial;
end;

function TncConfig.GetRecursoOn(aIndex: Integer): Boolean;
begin
  Result := SameText(Copy(FRecursos, aIndex, 1), '1');
end;

function TncConfig.GetServerDir: String;
begin
  if LadoServidor then
    Result := ExtractFilePath(ParamStr(0)) else
    Result := FServerDir;
end;

function TncConfig.GetUrls: String;
begin
  Result := gUrls.AsString;
end;

function TncConfig.HomePageURL(aAnunciante: Boolean): String;
begin
  if not aAnunciante then begin
    Result := FPaginaInicial;
    Exit;
  end;
  DebugMsg('TncConfig.HomePageURL - aAnunciante: ' + BoolStr[aAnunciante] + 
           ' - FHomePage_Url: ' + FHomePage_Url);
           
  if (FHomePage_URL>'') and ((Now-FHomePage_LastURL) < 2.5) then 
    Result := FHomePage_Url else
    Result := gUrls.Url('ad_home');

  DebugMsg('TncConfig.HomePageURL - Result: ' + Result);
end;

function TncConfig.IsPremium: Boolean;
begin
//  Result := (gConfig.FreePremium and (gConfig.AssinaturaVenceEm>=Date));

  if gDTol>9 then gDTol := 9;
  Result := (gConfig.StatusConta=scPremium);
end;

function TncConfig.TipoClasse: Integer;
begin
  Result := tcConfig;
end;

function TncConfig.TolDiasRestantes: Integer;
begin
  Result := TolerandoPor;
  if Result>0 then Result := DTol - Result;
end;

function TncConfig.TolerandoPor: Integer;
begin
  if (StatusConta=scPremium) and (DVA>0) and (AssinaturaVenceEm>0) and (Date>DVA) and (not PreLib) and (DTol>0) then
    Result := (Trunc(Date)-Trunc(DVA)) else
    Result := 0;

  if Result>DTol then Result := 0;
end;

function TncTarifa.ObtemIndProxPreco(TempoCorrido: Cardinal): Integer;
var T : Cardinal;
begin
  if (Length(FPrecos)=0) or (TicksTotal=0) then
    Result := -1
  else
  if Length(FPrecos)=1 then
    Result := 0 
  else begin
    Result := 0;
    T := FPrecos[0].etTempo;
    while (TempoCorrido>T) and (Result<High(FPrecos)) do begin
      Result := Result + 1;
      if Result>High(FPrecos) then
        Result := IndiceRepetir;
      T := T + FPrecos[Result].etTempo;
    end;  
  end;    
end;

procedure TncConfig.AssignConfig(C: TncConfig);
begin
  FCodProdutoDuplicados  := C.FCodProdutoDuplicados  ;
  FAutoCad               := C.FAutoCad               ;
  FQuickCad              := C.FQuickCad              ;
  FFecharProgramas       := C.FFecharProgramas       ;
  FAutoExecutar          := C.FAutoExecutar          ;
  FAlertaFimTempo        := C.FAlertaFimTempo        ;
  FTempoMaxAlerta        := C.FTempoMaxAlerta        ;
  FPermiteCapturaTela    := C.FPermiteCapturaTela    ;
  FLimiteTempoPadrao     := C.FLimiteTempoPadrao     ;
  FPermiteLoginSemCred   := C.FPermiteLoginSemCred   ;
  FAlteraLoginSemCred    := C.FAlteraLoginSemCred    ;
  FPacoteTempoReal       := C.FPacoteTempoReal       ;
  FEncerramentoPrePago   := C.FEncerramentoPrePago   ;
  FEncerramentoCartao    := C.FEncerramentoCartao    ;
  FTempoEPrePago         := C.FTempoEPrePago         ;
  FTempoECartao          := C.FTempoECartao          ;
  FMargem                := C.FMargem                ;
  FPrecoAuto             := C.FPrecoAuto             ;

  FComissaoPerc          := C.FComissaoPerc;
  FComissaoLucro         := C.FComissaoLucro;

  FCodBarBal             := C.FCodBarBal;
  FCodBarBalTam          := C.FCodBarBalTam;
  FCodBarBalIdent        := C.FCodBarBalIdent;
  FCodBarBalInicioCod    := C.FCodBarBalInicioCod;
  FCodBarBalTamCod       := C.FCodBarBalTamCod;
  FCodBarBalValor        := C.FCodBarBalValor;
  FCodBarBalPPInicio     := C.FCodBarBalPPInicio;
  FCodBarBalPPTam        := C.FCodBarBalPPTam;
  FCodBarBalPPDig        := C.FCodBarBalPPDig;

  FVariosTiposAcesso     := C.FVariosTiposAcesso     ;
  FModoPagtoAcesso       := C.FModoPagtoAcesso       ;
  FMostraPrePagoDec      := C.FMostraPrePagoDec      ;
  FManterSaldoCaixa      := C.FManterSaldoCaixa      ;
  FCliCadPadrao          := C.FCliCadPadrao          ;
  FCorLivre              := C.FCorLivre              ;
  FCorFLivre             := C.FCorFLivre             ;
  FCorUsoPrePago         := C.FCorUsoPrePago         ;
  FCorFUsoPrePago        := C.FCorFUsoPrePago        ;
  FCorUsoPosPago         := C.FCorUsoPosPago         ;
  FCorFUsoPosPago        := C.FCorFUsoPosPago        ;
  FCorPausado            := C.FCorPausado            ;
  FCorFPausado           := C.FCorFPausado           ;
  FCorAguardaPagto       := C.FCorAguardaPagto       ;
  FCorFAguardaPagto      := C.FCorFAguardaPagto      ;
  FCorManutencao         := C.FCorManutencao         ;
  FCorFManutencao        := C.FCorFManutencao        ;
  FCorDesktop            := C.FCorDesktop            ;
  FCorFDesktop           := C.FCorFDesktop           ;
  FTolerancia            := C.FTolerancia            ;
  FRegImp98              := C.FRegImp98              ;

  FRecImprimir           := C.FRecImprimir           ;
  FRecMatricial          := C.FRecMatricial          ;
  FRecTipoImpressora     := C.FRecTipoImpressora     ;
  FRecPorta              := C.FRecPorta              ;
  FRecSalto              := C.FRecSalto              ;
  FRecLargura            := C.FRecLargura            ;
  FRecCortaFolha         := C.FRecCortaFolha         ;

  FRecRodape             := C.FRecRodape             ;
  FRecNomeLoja           := C.FRecNomeLoja           ;

  FMostraProgAtual       := C.FMostraProgAtual       ;
  FMostraObs             := C.FMostraObs             ;
  FMostraNomeMaq         := C.FMostraNomeMaq         ;
  FEscondeTextoBotoes    := C.FEscondeTextoBotoes    ;
  FExigirRG              := C.FExigirRG              ;
  FControlaImp           := C.FControlaImp           ;
  FCampoLocalizaCli      := C.FCampoLocalizaCli      ;
  FLimitePadraoDebito    := C.FLimitePadraoDebito    ;
  FEscondeTipoAcesso     := C.FEscondeTipoAcesso     ;
  FNumFDesktop           := C.FNumFDesktop           ;
  FNumFLogin             := C.FNumFLogin             ;
  FTipoFDesktop          := C.FTipoFDesktop          ;
  FTipoFLogin            := C.FTipoFLogin            ;
  FFundoWeb              := C.FFundoWeb;
  FFundoWebURL           := C.FFundoWebURL;
  FMostrarApenasPIN      := C.FMostrarApenasPIN      ;
  FTextoPIN              := C.FTextoPIN              ;
  FAlterarSenhaCli       := C.FAlterarSenhaCli       ;
  FVerSenhaCli           := C.FVerSenhaCli           ;
  FConta                 := C.FConta                 ;
  FCodEquip              := C.FCodEquip              ;
  FVerPri                := C.FVerPri                ;
  FFiltrarWEB            := C.FFiltrarWEB            ;
  FSiteRedirFiltro       := C.FSiteRedirFiltro       ;
  FFreePremium           := C.FFreePremium           ;

  FDataLic               := C.FDataLic;
  FPreLib                := C.FPreLib;
  FDVA                   := C.FDVA;
  FProxAvisoAss          := C.FProxAvisoAss;
  
  FAssinaturaVenceEm     := C.FAssinaturaVenceEm     ;
  FAlertaAssinatura      := C.FAlertaAssinatura      ;
  FJaFoiPremium          := C.FJaFoiPremium;
  
  FEmailMetodo           := C.FEmailMetodo           ;
  FEmailServ             := C.FEmailServ             ;
  FEmailUsername         := C.FEmailUsername         ;
  FEmailSenha            := C.FEmailSenha            ;
  FEmailDestino          := C.FEmailDestino          ;
  FEmailEnviarCaixa      := C.FEmailEnviarCaixa      ;
  FEmailIdent            := C.FEmailIdent            ;
  FEmailConteudo         := C.FEmailConteudo         ;
  
  FBloqDownload          := C.FBloqDownload          ;
  FBloqDownloadExe       := C.FBloqDownloadExe       ;
  FBloqMenuIniciar       := C.FBloqMenuIniciar       ;
  FBloqPainelCtrl        := C.FBloqPainelCtrl        ;
  FBloqCtrlAltDel        := C.FBloqCtrlAltDel        ;
  FBloqExecutar          := C.FBloqExecutar          ;
  FBloqMeusLocaisRede    := C.FBloqMeusLocaisRede    ;

  FPaginaInicial         := C.FPaginaInicial         ;
  FEsconderCronometro    := C.FEsconderCronometro    ;
  FAposEncerrar          := C.FAposEncerrar          ;
  FAlinhaBarraGuard      := C.FAlinhaBarraGuard      ;
  FNoNet                 := C.FNoNet                 ;
  FTempoSumirLogin       := C.FTempoSumirLogin       ;
  FMinutosDesligaMaq     := C.FMinutosDesligaMaq     ;
  FMinutosDesligaMon     := C.FMinutosDesligaMon     ;
  FOpcaoChat             := C.FOpcaoChat             ;

  FEsconderDrives        := C.EsconderDrives         ;

  FBloqTray := C.BloqTray;
  FBloqBotaoDir := C.FBloqBotaoDir;
  FBloqToolbars := C.FBloqToolbars;

  FBloqPosPago := C.FBloqPosPago;
  
  FFiltrarDesktop        := C.FFiltrarDesktop;
  FFiltrarMenuIniciar    := C.FFiltrarMenuIniciar;
  
  FTempoB1  := C.TempoB1; 
  FTempoB2  := C.TempoB2;
  FTempoB3  := C.TempoB3;
  FTempoB4  := C.TempoB4;
  FTempoB5  := C.TempoB5;
  FTempoB6  := C.TempoB6;

  FCredPadraoTipo := C.FCredPadraoTipo;
  FCredPadraoCod  := C.FCredPadraoCod;

  FPgVendas := C.FPgVendas;
  FPgVendaAvulsa := C.FPgVendaAvulsa;
  FPgAcesso := C.FPgAcesso;
  FPgTempo  := C.FPgTempo;
  FPgImp    := C.FPgImp;
  FBloquearUsoEmHorarioNP := C.FBloquearUsoEmHorarioNP;
  FSalvarCodUsername := C.FSalvarCodUsername;
  FContinuarCredTempo := C.FContinuarCredTempo;
  FNaoGuardarCreditoCli := C.FNaoGuardarCreditoCli;
  FNaoCobrarImpFunc := C.FNaoCobrarImpFunc;
  FNaoMostrarMsgDebito := C.FNaoMostrarMsgDebito;
  FNaoTransferirMaq := C.FNaoTransferirMaq;

  FMostrarDebitoNoGuard   := C.FMostrarDebitoNoGuard;
  FBloquearLoginAlemMaxDeb:= C.FBloquearLoginAlemMaxDeb;
  FClienteNaoAlteraSenha  := C.FClienteNaoAlteraSenha;
  FNaoObrigarSenhaCliente := C.FNaoObrigarSenhaCliente;
  FNaoVenderAlemEstoque   := C.FNaoVenderAlemEstoque;
  FCreditoComoValor       := C.FCreditoComoValor;
  FCliAvulsoNaoEncerra    := C.FCliAvulsoNaoEncerra;
  FAutoSortGridCaixa      := C.FAutoSortGridCaixa;
  FAvisoFimTempoAdminS    := C.FAvisoFimTempoAdminS;
  FDetectarImpServ        := C.FDetectarImpServ;
  FAvisoCreditos          := C.FAvisoCreditos;
  FClientePodeVerCred     := C.FClientePodeVerCred;
  FChatAlertaSonoro       := C.FChatAlertaSonoro;
  FChatMostraNotificacao  := C.FChatMostraNotificacao;
  FModoCredGuard := C.FModoCredGuard;
  FMsgFimCred := C.FMsgFimCred;
  FSemLogin := C.FSemLogin;

  FAutoObsAoCancelar      := C.FAutoObsAoCancelar;
  
  FFidAtivo               := C.FFidAtivo;
  FFidSessaoValor         := C.FFidSessaoValor;
  FFidSessaoPontos        := C.FFidSessaoPontos;
  FFidVendaValor          := C.FFidVendaValor;
  FFidVendaPontos         := C.FFidVendaPontos;
  FFidImpValor            := C.FFidImpValor;
  FFidImpPontos           := C.FFidImpPontos;
  FFidParcial             := C.FFidParcial;

  FFidAutoPremiar         := C.FFidAutoPremiar;
  FFidTipoPremioAuto      := C.FFidTipoPremioAuto;
  FFidPremioAuto          := C.FFidPremioAuto;
  FFidPontosPremioAuto    := C.FFidPontosPremioAuto;

  FFidMsg                 := C.FFidMsg;
  FFidMsgTitulo           := C.FFidMsgTitulo;
  FFidMsgTexto            := C.FFidMsgTexto;

  FFidMostrarSaldoGuard   := C.FFidMostrarSaldoGuard;
  FFidMostrarSaldoAdmin   := C.FFidMostrarSaldoAdmin;
  FCliCadNaoEncerra       := C.FCliCadNaoEncerra;
  FImpedirPosPago         := C.FImpedirPosPago;
  FAutoLigarMaqCli        := C.FAutoLigarMaqCli;
  FPastaDownload          := C.FPastaDownload;
  FBiometria              := C.FBiometria;

  FPMPausaAutomatica      := C.FPMPausaAutomatica;
  FPMConfirmaImpCliente   := C.PMConfirmaImpCliente;
  FPMConfirmaImpAdmin     := C.PMConfirmaImpAdmin;
  
  FPMAdminControlaImp     := C.FPMAdminControlaImp;
  FPMMostrarPaginasCli    := C.FPMMostrarPaginasCli;
  FPMMostrarValorCli      := C.FPMMostrarValorCli;
  FPMCalcValorCli         := C.FPMCalcValorCli;
  FPMPromptValorCli       := C.FPMPromptValorCli;
  FPMObsValorCli          := C.FPMObsValorCli;
  FPMValorMin             := C.FPMValorMin;
  FPMValorMax             := C.FPMValorMax;

  FPMPausarServ           := C.FPMPausarServ;
  FPMNaoPausar            := C.PMNaoPausar;

  FPMCotas                := C.FPMCotas;
  FPMCotasMaxPagDia       := C.FPMCotasMaxPagDia;
  FPMCotasMaxPagMes       := C.FPMCotasMaxPagMes;
  FPMCotasOpCota          := C.FPMCotasOpCota;
  FPMCotasOpExcesso       := C.FPMCotasOpExcesso;
  FPMCotasMaxExcesso      := C.FPMCotasMaxExcesso;
  FPMCotasPorCli          := C.FPMCotasPorCli;
  FPMPDF                  := C.FPMPDF;
  FPMPDFPrintEng          := C.FPMPDFPrintEng;
  FPMReviewCli            := C.FPMReviewCli;
  FPMReviewAdmin          := C.FPMReviewAdmin;

  FPubHomePage            := C.FPubHomePage;
  FPubAd                  := C.FPubAd;
  FPubToolbar             := C.FPubToolbar;

  FMaxTempoSessao         := C.FMaxTempoSessao;
  FTarifaPadrao           := C.FTarifaPadrao;
  FTarifaPorHorario       := C.FTarifaPorHorario;
  FBloqMeuComputador      := C.FBloqMeuComputador;
  FBloqLixeira            := C.FBloqLixeira;
  FBloqMeusDocumentos     := C.FBloqMeusDocumentos;
  FClassicStartMenu       := C.FClassicStartmenu;

  FBloqueiaCliAvulso      := C.FBloqueiaCliAvulso;
  FExigeDadosMinimos      := C.FExigeDadosMinimos;
  FCidadePadrao           := C.FCidadePadrao;
  FUFPadrao               := C.FUFPadrao;
  FDadosMinimos           := C.FDadosMinimos;

  FPedirSaldoI            := C.FPedirSaldoI;
  FPedirSaldoF            := C.FPedirSaldoF;

  FBRT                    := C.FBRT;
  FExCookie               := C.FEXCOOKIE;
  FHPOpenBef              := C.FHPOpenBef;
  FCamposCliCC.Text       := C.FCamposCliCC.Text;
  FCliCongelado           := C.FCliCongelado;

  FSenhaAdminOk          := C.FSenhaAdminOk;
  FQtdMaqOk              := C.FQtdMaqOk;

  FPosLogin              := C.FPosLogin;
  FServerDir             := C.FServerDir;

  FHomePage_URL          := C.FHomePage_URL;
  FHomePage_LastURL      := C.FHomePage_LastURL;
  FHomePage_Tab          := C.FHomePage_Tab;

  FSky_Url := C.FSky_Url;
  FToolbar_Url := C.FToolbar_Url;

  FBotoes := C.FBotoes;
  FBanners := C.FBanners;
  
  FComandaOff := C.FComandaOff;
  FMesasOff := C.FMesasOff;
  FConsumoAvulsoOff := C.FConsumoAvulsoOff;
  FRecursos := C.FRecursos;
  FaixaComanda := C.FaixaComanda;
  FConfirmarDebito := C.FConfirmarDebito;
end;

procedure TncConfig.LeStream(S: TStream);
begin
  inherited;
  glTolerancia := DateTimeToTicks(FTolerancia);
end;

function TncConfig.NomeArqDesktop: String;
begin
  if SameText(TipoFDesktop, 'JPG') then // do not localize
    Result := PastaFundo + 'DESKTOP' + IntToStr(NumFDesktop) + '.JPG' else // do not localize
    Result := '';  
end;

function TncConfig.NomeArqLogin: String;
begin
  if SameText(TipoFLogin, 'JPG') or SameText(TipoFLogin, 'GIF') then // do not localize
    Result := PastaFundo + 'LOGIN' + IntToStr(NumFLogin) + '.' + TipoFLogin else // do not localize
    Result := '';  
end;

function TncConfig.NormBRT: Word;
begin
  if (FBRT<15) or (FBRT>600) then 
    Result := 60 else
    Result := FBRT;
end;

function TncConfig.NormPosLogin: Byte;
begin
  if ((FPosLogin=poslogin_centro) and FFundoWeb) or (FPosLogin>poslogin_rodape) then
    Result := poslogin_topo else
    Result := FPosLogin;
end;

function TncConfig.PastaFundo: String;
begin
  if LadoServidor  then
    Result := ExtractFilePath(ParamStr(0)) + 'DADOS\' else // do not localize
    Result := ExtractFilePath(ParamStr(0));  
end;

function TncConfig.PausarJobs: Boolean;
begin
  Result := False;
  if DetectarImpServ and PMPausarServ then
    Result := True;

  if (not PMPDF) and (ControlaImp>0) then
  if PMConfirmaImpCliente or PMConfirmaImpAdmin then
    Result := True;
end;

function TncConfig.PodeFidelidade: Boolean;
begin
  Result := FidAtivo;
end;

function TncConfig.RecPrinterGeneric: Boolean;
begin
  Result := (Pos('Generic', RecTipoImpressora)>0);
end;

function TncConfig.RevisarPDF: Boolean;
begin
  Result := RevisarPDFDisponivel and PMPDF;
end;

function TncConfig.RevisarPDFAdmin: Boolean;
begin
  Result := RevisarPDF and PMReviewAdmin;
end;

function TncConfig.RevisarPDFCli: Boolean;
begin
  Result := RevisarPDF and PMReviewCli;
end;

function TncConfig.RevisarPDFDisponivel: Boolean;
begin
  Result := IsPremium or
            ((StatusConta=scAnt) and Versoes.PodeUsar(idre_revisaimpressao));
end;

procedure TncConfig.SetCamposCliCCText(const Value: String);
begin
  FCamposCliCC.Text := Value;
end;

procedure TncConfig.SetConta(const Value: String);
begin
  FConta := Value;
end;

procedure TncConfig.SetDTol(const Value: Byte);
begin
  gDTol := Value;
  if gDTol>9 then gDTol := 9;
end;

procedure TncConfig.SetFaixaComanda(const Value: String);
begin
  ArrayFaixaIntegerFromString(FArrayComanda, Value);
end;

procedure TncConfig.SetRecBobina(const Value: Boolean);
begin
  RecMatricial := Value;
end;

procedure TncConfig.SetRecursoOn(aIndex: Integer; const Value: Boolean);
begin
  while Length(FRecursos)<aIndex do FRecursos := FRecursos + '0';
  if Value then
    FRecursos[aIndex] := '1' else
    FRecursos[aIndex] := '0';
end;

procedure TncConfig.SetTextoPIN(const Value: String);
begin
  if Trim(Value)='' then
    FTextoPIN := SncClassesBase_NomeDeUsuário else
    FTextoPIN := Value;  
end;

procedure TncConfig.SetUrls(const Value: String);
begin
  gUrls.SetString(Value);
end;

procedure TncConfig.LeDataset(Tab: TDataset);
begin
  inherited;
  glTolerancia := DateTimeToTicks(FTolerancia);
end;

{ TncTipoAcesso }

constructor TncTipoAcesso.Create;
begin
  inherited;
  FNome := '';
  Fillchar(FHoraTarifa, SizeOf(FHoraTarifa), 0);
  FID := 0;
  FTarifaPadrao := 0;
end;

function TncTipoAcesso.GetChave: Variant;
begin
  Result := FID;
end;

function TncTipoAcesso.GetPHoraTarifa: PncHoraTarifa;
begin
  Result := @FHoraTarifa;
end;

function TncTipoAcesso.TarifaHoraObj(D, H: Byte): TncTarifa;
begin
  Result := gTarifas.PorCor[FHoraTarifa[D, H]];
  if Result=nil then 
    Result := TarifaPadraoObj;
end;

function TncTipoAcesso.TarifaPadraoObj: TncTarifa;
begin
  Result := gTarifas.PorCor[FTarifaPadrao];
  if Result=nil then
    Result := gTarifas.PorCor[gConfig.TarifaPadrao];
end;

function TncTipoAcesso.GetHoraTarifaStr: String;
begin
  SetLength(Result, SizeOf(FHoraTarifa));
  Move(FHoraTarifa, Result[1], SizeOf(FHoraTarifa));
end;

procedure TncTipoAcesso.SetHoraTarifaStr(const Valor: String);
begin
  Move(Valor[1], FHoraTarifa, Length(Valor));
end;

function TncTipoAcesso.TipoClasse: Integer;
begin
  Result := tcTipoAcesso;
end;

procedure TncTipoAcesso.AssignTA(TA: TncTipoAcesso);
begin
  FID        := TA.FID;
  FNome      := TA.FNome;
  FHoraTarifa   := TA.FHoraTarifa;
end;

{ TncTiposAcesso }

constructor TncTiposAcesso.Create;
begin
  inherited Create(tcTipoAcesso);
end;

function TncTiposAcesso.Existe(aID: integer): Boolean;
begin
  Result := (ItemPorChave[aID]<>nil);
end;

function TncTiposAcesso.GetTipoAcesso(I: Integer): TncTipoAcesso;
begin
  Result := TncTipoAcesso(GetItem(I));
end;

function TncTiposAcesso.GetTipoAcessoPorCodigo(
  N: Integer): TncTipoAcesso;
begin
  Result := TncTipoAcesso(ItemPorChave[N]);
  if (Result=nil) and (Count>0) then
    Result := Itens[0];
end;

function TncTarifas.GetTarifa(I: Integer): TncTarifa;
begin
  Result := TncTarifa(GetItem(I));
end;

function TncTarifas.GetTarifaPorCor(aCor: Integer): TncTarifa;
var I : Integer;
begin
  for I := 0 to pred(Count) do with Itens[I] do
  if (Cor=aCor) then begin
    Result := Itens[I];
    Exit;
  end;  
  Result := nil;
end;

constructor TncTarifas.Create;
begin
  inherited Create(tcTarifa);
end;


{ TncTarifa }

constructor TncTarifa.Create;
begin
  inherited;
  FTipoAcesso := 0;
  FCor        := 0;
  FCorFonte   := 0;
  FReinicia   := False;
  FDescricao  := '';
  PrecosStr := '';
  FReiniciaDesde := 1;
  FDivQtd        := 15;
  FDivTipo       := tdtPorTempo;
  FArredondar    := 5;
  FSemValorMin   := True;
end;

function TncTarifa.GetChave: Variant;
begin
  Result := IntToStr(Cor);
end;

function TncTarifa.GetCor: Integer;
begin
  Result := FCor;
end;

function TncTarifa.GetCorFonte: Integer;
begin
  Result := FCorFonte;
end;

function TncTarifa.GetDescricao: String;
begin
  Result := FDescricao;
end;

function TncTarifa.GetPPrecos: PncArrayEtapas;
begin
  Result := @FPrecos;
end;

function TncTarifa.GetPrecosStr: String;
var 
  S: String;
  P : TncArrayEtapas;
begin
  if Length(FPrecos)>0 then begin
    SetLength(Result, Length(FPrecos)*SizeOf(TncEtapa));
    Move(FPrecos[0], Result[1], Length(Result));
{    S := Result;
    SetLength(P, Length(S) div SizeOf(TncEtapa));
    Move(S[1], P, Length(S));
    Result := Result;}
  end else
    Result := '';  
end;

function TncTarifa.GetReinicia: Boolean;
begin
  Result := FReinicia;
end;

function TncTarifa.GetTipoAcesso: Word;
begin
  Result := FTipoAcesso;
end;

function TncTarifa.IndiceRepetir: Integer;
begin
  if not FReinicia then
    Result := InicioHora(0)
  else
  if (FReiniciaDesde<2) then 
    Result := 0  else
    Result := InicioHora(FReiniciaDesde);
end;

function TncTarifa.InicioHora(H: Byte): Integer;
var 
  I, HA: Integer;
  T: Cardinal;
begin
  Result := 0; T:= 0; HA := 1; I := 0;
  while (I<=High(FPrecos)) and (HA<>H) do begin
    if FPrecos[I].etTempo<=0 then Exit;
    
    T := T + FPrecos[I].etTempo;
    if T > (TicksPorHora*HA) then begin
      Result := I;
      HA := (T div TicksPorHora)+1;
    end;
    Inc(I);
  end;
end;

function TncTarifa.NumH: Byte;
var 
  I : Integer;
  T : Cardinal;
begin
  T := 0;
  for I := 0 to High(FPrecos) do 
    T := T + FPrecos[I].etTempo;

  if T>(23*TicksPorHora) then
    Result := 24
  else   
  if (T mod TicksPorHora)>0  then
    Result := (T div TicksPorHora) + 1 else
    Result := T div TicksPorHora;
end;

procedure TncTarifa.SetCor(Value: Integer);
begin
  FCor := Value;
end;

procedure TncTarifa.SetCorFonte(Value: Integer);
begin
  FCorFOnte := Value;
end;

procedure TncTarifa.SetDescricao(Value: String);
begin
  FDescricao := Value;
end;

procedure TncTarifa.SetPrecosStr(Value: String);
begin
  if Value > '' then begin
    SetLength(FPrecos, Length(Value) div SizeOf(TncEtapa));
    Move(Value[1], FPrecos[0], Length(Value));
    Value := '';
    if Length(FPrecos)=4949494 then {};
  end else
    SetLength(FPrecos, 0);
end;

procedure TncTarifa.SetReinicia(Value: Boolean);
begin
  FReinicia := Value;
end;

procedure TncTarifa.SetTipoAcesso(Value: Word);
begin
  FTipoAcesso := Value;
end;

function TncTarifa.TempoI: Cardinal;
begin
  if Length(FPrecos)>0 then
    Result := FPrecos[0].etTempo else
    Result := 0;
end;

function TncTarifa.TicksTotal: Cardinal;
begin
  Result := TicksTotalArrayEtapas(FPrecos);
end;

function TncTarifa.TemValor: Boolean;
var I: Integer;
begin
  Result := True;
  for I := 0 to High(FPrecos) do 
    if FPrecos[I].etValor>0 then Exit;
  Result := False;
end;

function TncTarifa.TipoClasse: Integer;
begin
  Result := tcTarifa;
end;

function TncTarifa.ValorHora(H: Byte): Currency;
var 
  T, TH: Cardinal;
  I: Integer;
begin
  Result := 0;
  T := 0; 
  I := 0;  
  TH := TicksPorHora;
  if Length(FPrecos)>0 then
  while T<(H*TH) do begin
    if I>High(FPrecos) then begin
      if Result=0 then Exit;
      I := IndiceRepetir;
    end;
    Result := Result + FPrecos[I].etValor;
    T := T + FPrecos[I].etTempo;
    if FPrecos[I].etTempo<=0 then Exit;
    
    Inc(I);
  end;
end;

function TncTarifa.ValorI: Currency;
begin
  if Length(FPrecos)>0 then
    Result := FPrecos[0].etValor else
    Result := 0;
end;

{ TncDadosTempo }

procedure TncDadosTempo.FromString(S: String);

function StrCurr(St: String): Double;
var 
  Code: Integer;
begin
  Val(St, Result, Code);
  if Code<>0 then 
    Result := 0;
end;

function ProxItem: String;
var P: Integer;
begin
  P := Pos('|', S);
  Result := Copy(S,  1, P-1);
  Delete(S, 1, P);
end;

begin
  dtTipo := StrToIntDef(ProxItem, 0);
  dtMinutos := StrToIntDef(ProxItem, 0);
  dtValor := StrCurr(ProxItem);
  dtCliente := StrToIntDef(ProxItem, 0);
  dtPago := StrCurr(ProxItem);
  dtDesc := StrCurr(ProxItem);
  dtIDPacPass := StrToIntDef(ProxItem, 0);
  dtMaq := StrToIntDef(ProxItem, 0);
end;

function TncDadosTempo.Igual(const aDT: TncDadosTempo): Boolean;
begin
  Result := False;
  if dtTipo <> aDT.dtTipo then Exit;
  if dtMinutos <> aDT.dtMinutos then Exit;
  if dtValor <> aDT.dtValor then Exit;
  if dtCliente <> aDT.dtCliente then Exit;
  if dtPago <> aDT.dtPago then Exit;
  if dtDesc <> aDT.dtDesc then Exit;
  if dtIDPacPass <> aDT.dtIDPacPass then Exit;
  if dtMaq <> aDT.dtMaq then Exit;
  Result := True;
end;

procedure TncDadosTempo.Limpa;
begin
  dtTipo      := 0;
  dtMinutos   := 0;
  dtValor     := 0;
  dtCliente   := 0;
  dtPago      := 0;
  dtDesc      := 0;
  dtIDPacPass := 0;
  dtMaq       := 0;
end;

function TncDadosTempo.ToString: String;

function CurrStr(C: Currency): String;
begin
  Str(C:15:2, Result);
end;

begin
  Result := IntToStr(dtTipo) + '|' +
            IntToStr(dtMinutos) + '|' +
            CurrStr(dtValor) + '|' +
            IntToStr(dtCliente) + '|' +
            CurrStr(dtPago) + '|' +
            CurrStr(dtDesc) + '|' +
            IntToStr(dtIDPacPass) + '|' +
            IntToStr(dtMaq) + '|';
end;

function TncDadosTempo.TotalFinal: Currency;
begin
  Result := dtValor - dtDesc;
end;

{ TncEtapa }

function TncEtapa.etTolerancia: Cardinal;
begin
  Result := 0;
end;

function TncEtapa.etValorMin: Double;
begin
  Result := etValor;
end;

{ TThreadDeleteFile }

constructor TThreadDeleteFile.Create(aArq: String; aTryForMS: Cardinal);
begin
  FArq := aArq;
  FTryForMS := aTryForMS;
  inherited Create(False);
end;

procedure TThreadDeleteFile.Execute;
var 
  C: Cardinal;
  Ok : Boolean;
begin
  try
    C := GetTickCount + FTryForMS;
    Ok := True;
    repeat
      Sleep(Random(100)+5);
      Ok := SysUtils.DeleteFile(FArq);
    until Ok or (GetTickCount>C) or EncerrarThreads;
  finally
    Free;
  end;
end;

{ TncCodBarBalInfo }

procedure TncCodBarBalInfo.Clear;
begin
  Codigo := '';
  PesoValor := 0;
  BalValor := False;
end;

function TncCodBarBalInfo.IsEmpty: Boolean;
begin
  Result := (Codigo='');
end;

initialization
  csServ := TCriticalSection.Create;
  gTiposAcesso := TncTiposAcesso.Create;
  gTarifas     := TncTarifas.Create;
  gConfig := TncConfig.Create;
  slDadosMin := TStringList.Create;
  slDadosMin.Add('Nome=Nome'); // do not localize
  slDadosMin.Add('Endereço=Endereco'); // do not localize
  slDadosMin.Add('Cidade=Cidade'); // do not localize
  slDadosMin.Add('Bairro=Bairro'); // do not localize
  slDadosMin.Add('CEP=CEP'); // do not localize
  slDadosMin.Add('Estado=UF'); // do not localize
  slDadosMin.Add('RG=RG'); // do not localize
  slDadosMin.Add('CPF=CPF'); // do not localize
  slDadosMin.Add('Data de Nascimento=DataNasc'); // do not localize
  slDadosMin.Add('Telefone=Telefone'); // do not localize
  slDadosMin.Add('Celular=Celular'); // do not localize
  slDadosMin.Add('Username=Username'); // do not localize
  slDadosMin.Add('Escola=Escola'); // do not localize
  slDadosMin.Add('Nome do Pai=Pai'); // do not localize
  slDadosMin.Add('Nome da Mãe=Mae'); // do not localize
  slDadosMin.Add('E-mail=Email'); // do not localize

finalization
  gTiposAcesso.Free;
  gTarifas.Free;  
  gConfig.Free;
  csServ.Free;
  slDadosMin.Free;
      
end.

TncPausa
  Inicio   Ticks
  Duracao  Ticks

TncArrayPausa : Array of TncPausa;  
  
Maquina
  Num           001
  IP            192.168.0.123
  ComputerName
  Grupo         XXXX
  Desktop       Programas Permitidos
  Status        Livre, Ocupada, Em Manutencao
  Sessao        Integer

Sessao
  Maquina      : 
  InicioTicks  : 
  Cliente      :
  Obs          :
  Passaportes  :
  Pausas       : TncArrayPausa;
  
  TempoTotal   :
  TempoPausado : 
  TempoPrePago :
  TempoPosPago :
  TempoGratis  : 

  ValorPosPago : $$$$

SessaoHorario
  Sessao : ID
  Isento : Boolean
  Data   : Date
  Hora   : Byte;
  Minutos: Double;

  
  FInicio           : TDateTime;
    FContato          : Integer;
    FObsAcesso        : String;
    FNomeContato      : String;
    FInicioTicks      : Cardinal;
    FTempoTicks       : Cardinal;
    FCliente          : Integer;
    FAcesso           : Integer;
    FIsento           : Boolean;
    FCreditoCli       : Cardinal;
    FFimTicks         : Cardinal;
    FLimiteTempo      : Cardinal;
    FProgramaAtual    : String;
    FPediuTela        : Boolean;
    FUserObj          : TObject;
    FParadoTicks      : Cardinal;
    FParadoTicksAtual : Cardinal;
    FParado           : Boolean;
    FParadoInicio     : Cardinal;
    FMenu             : String;
    FRecursos         : String;
    FTipoAcesso       : Word;
    FSinal            : Double;
    FVendas           : Double;
    FLiberaAlemPacote : Boolean;
    FTicksParadoPac   : Cardinal;
    FComputerName     : String;
    FAguardaPagto     : Boolean;
    FUsuarioI         : String;
    FCaixa            : Integer;
    FTipoTran         : Byte;
    FPassaportes      : TncPassaportes;
    FPrePago          : Boolean;
   


Ordem de uso de pré-pago
1. Usar primeiro pre-pagos que expiram

Tipo de Tarifa
0 - Crédito de Tempo Pré-Determinado
1 - Crédito de Valor Pré-Determinado
2 - Crédito de Valor Pós-Determinado


