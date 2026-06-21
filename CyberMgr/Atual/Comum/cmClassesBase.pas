unit cmClassesBase;

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
  uLicenca,       
  cmMsgCom,
  kbmUtils,
  cmErros;

const
  eppPausarAcesso = 0;
  eppContinuarEmPosPago = 1;
  eppEncerrarAcesso = 2;

  PortaKBMMW = 41592;

  Campos_Avisos : Array[0..5] of TkbmuFieldDef = (
    (fdName:'Minutos';          fdType: ftWord;      fdSize:0;    fdPrec:0),
    (fdName:'AvisoTexto';       fdType: ftString;    fdSize:50;   fdPrec:0),
    (fdName:'SegAvisoTexto';    fdType: ftSmallInt;  fdSize:0;    fdPrec:0),
    (fdName:'PiscarAvisoTexto'; fdType: ftBoolean;   fdSize:0;    fdPrec:0),
    (fdName:'Som';              fdType: ftBlob;      fdSize:0;    fdPrec:0),
    (fdName:'TocarSom';         fdType: ftBoolean;   fdSize:0;    fdPrec:0));

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

  BoolStr : Array[Boolean] of Char = ('0', '1');

  mdDemo     = -1;
  mdLiberado = 0;
  MinCreditoLoginMS = 5000;

  // Status Pagamento
  spEmAndamento    = 0;
  spAguardaPagto   = 1;
  spPago           = 2;
  spDebitado       = 3;
  
  HorasSemana = 7 * 24;
  SegundosPorDia = 60 * 60 * 24;
  MSPorDia = SegundosPorDia * 1000;
  MSPorSemana = MSPorDia * 7;

  spStrings : Array [spEmAndamento..spDebitado] of String[17] = (
    'Em Andamento',
    'Aguarda Pagamento',
    'Ok',
    'Debitado');

  // Tipos de Transação
  ttAcesso            = 0;
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
  ttVendaPassaporte   = 14;

  // Modos de Pagamento
  mpgTelaPagtoAutomatica = 0;
  mpgDuploCliqueMaq      = 1;
  mpgSomenteTransacoes   = 2;

  StTipoTransacao : Array[ttAcesso..ttVendaPassaporte] of String = (
    'Acesso',
    'Pacote',
    'Crédito Tempo',
    'Manutenção',
    'Acesso + Venda',
    'Débito Tempo',
    'Sinal',
    'Venda Avulsa',
    'Compra',
    'Entrada Estoque',
    'Saida Estoque',
    'Pagamento Débito',
    'Suprimento Caixa',
    'Sangria Caixa',
    'Venda Passaporte');

  // Tipos de Classes
  tcMaquina    = 1;
  tcCliente    = 2;
  tcUsuario    = 4;
  tcGrupo      = 5;
  tcConfig     = 6;
  tcTipoAcesso = 7;
  tcCorPreco   = 8;

  ProxyUsername = 'proxy';
  ProxySenha    = 'proxypass';

  // Tipo Expiração
  teNunca       = 0;
  teDias        = 1;
  teHoras       = 2;
  teAcessos     = 3;
  teDataMarcada = 4;

  BoolToString : Array[Boolean] of String[5] = ('False', 'True');

type
  TArrayTempo = Array[0..23] of Double;
  TArrayTipoTran = Array[ttAcesso..ttVendaPassaporte] of Boolean;
  PArrayTipoTran = ^TArrayTipoTran;

  EErroCyberMgr = class(Exception)
  public
    CodigoErro: Integer;
    ErroSocket: Integer;
    constructor Create(CE: Integer);
  end;

  TPassaporte = object
  private
    function GetHoraValida(D, H: Integer): Boolean;
    procedure SetHoraValida(D, H: Integer; const Value: Boolean);
    function TempoRestante(Agora: TDateTime): Cardinal;
  public
    pcCodigo        : Integer;
    pcNumero        : Integer;
    pcNome          : String[50];
    pcCliente       : Integer;
    pcSenha         : String;
    pcValor         : Double;
    pcTipoExp       : Byte;
    pcTipoAcesso    : Integer;
    pcExpirou       : Boolean;
    pcValido        : Boolean;
    pcExpirarEm     : TDateTime;
    pcPrimeiroUso   : TDateTime;
    pcMaxSegundos   : Cardinal;
    pcSegundos      : Cardinal;
    pcAcessos       : Cardinal;
    pcHorasValidas  : Array[1..7] of Cardinal;

    pctUsadoMS      : Cardinal;
    pctExpirou      : Boolean;
    pctInicio       : TDateTime;
    pctExpirar      : TDateTime;
    pctInicioUso    : TDateTime;

    pctTempoRes     : Cardinal;

    procedure AjustaInicioExpirar(Inicio: TDateTime);
    procedure ZeraInicioUso;
    procedure LeStr(S: String);
    function ObtemStr: String;
    procedure HorasValidasFromStr(S: String);
    function HorasValidasToStr: String;
    function ObtemTempo(Agora: TDateTime; Dia, H : Integer; DuracaoMS: Cardinal; Ordenando: Boolean): Cardinal;
    procedure LoadFromDataset(D: TDataset);
    procedure SaveToDataset(D: TDataset);
    function PrimeiroUso: TDateTime;
    procedure TotalizaUso;
    function Igual(P: TPassaporte): Boolean;
    function GeraSenha: String;
    procedure AtualizaExpirou;

    property HoraValida[D, H: Integer]: Boolean
      read GetHoraValida write SetHoraValida;
  end;

  PPassaporte = ^TPassaporte;

  TArrayPassaporte = Array of TPassaporte;

  TPassaportes = object
  public
    Itens : TArrayPassaporte;
    SData : TDateTime;
    function Igual(P: TPassaportes): Boolean;

    procedure Limpa;
    procedure ZeraInicioUso;
    procedure Ordenar(Data: TDateTime; H: Byte);
    procedure LeStr(S: String);
    procedure AjustaInicioExpirar(Inicio: TDateTime);
    function ObtemStr: String;
    function Count: Integer;
    function AbateCreditos(Agora: TDateTime; Tempo: Cardinal): Cardinal;
    procedure AddPassaporte(P: TPassaporte);
    procedure TotalizaUso;
    function TempoUsadoTotal: Cardinal;
    function ContemPassaporte(aNumero: Integer): Boolean;
  end;

  PPassaportes = ^TPassaportes;

  TCMServidorBase = class;
  
  TCMClasse       = class;
  TCMMaquina      = class;
  TCMCliente      = class;
  TCMUsuario      = class;
  TCMGrupo        = class;
  TCMTipoAcesso   = class;
  TCMCorPreco     = class;

  TCMListaCorPreco= class;
  TLicencaStr     = String[90];
  
  
  TTipoNotificacao = (tnCriacao, tnAlteracao, tnDestruicao);

  TProcNotificacao = procedure (Obj: TCMClasse; TipoNot: TTipoNotificacao) of object;

  TCMPreco = record
    prTempo : Cardinal;
    prValor : Double;
    prValorMin : Double;
    prTolerancia : Cardinal;
  end;  

  TCMArrayPrecos = Array of TCMPreco;
  PCMArrayPrecos = ^TCMArrayPrecos;

  TCMHoraCor = Array[1..7, 0..23] of Integer;
  PCMHoraCor = ^TCMHoraCor;
    
  TCMClasse = class ( TClasseCS )
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

  TCMTipoAcesso = class ( TCMClasse )
  private
    FCodigo    : Word;
    FNome      : String;
    FHoraCor   : TCMHoraCor;
  protected   
    function GetChave: Variant; override;

    function GetPHoraCor: PCMHoraCor;
  public  
    function TipoClasse: Integer; override;
    constructor Create;

    property PHoraCor: PCMHoraCor
      read GetPHoraCor;

    function GetHoraCorStr: String;
    procedure SetHoraCorStr(const Valor: String);

    procedure AssignTA(TA: TCMTipoAcesso);
    
  published 
    property Codigo: Word
      read FCodigo write FCodigo;

    property Nome: String
      read FNome write FNome;

    property HoraCorStr: String
      read GetHoraCorStr write SetHoraCorStr;  
  end;

  TCMCorPreco = class ( TCMClasse )
  private
    FTipoAcesso : Word;
    FCor        : Integer;
    FCorFonte   : Integer;
    FReinicia   : Boolean;
    FDescricao  : String;
    FPrecos     : TCMArrayPrecos;

    function GetPPrecos: PCMArrayPrecos;
    
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

    property PPrecos: PCMArrayPrecos
      read GetPPrecos;

    function TipoClasse: Integer; override;

    function ObtemIndProxPreco(TempoCorrido: Cardinal): Integer;
    function TempoTotal: Cardinal;
  published

    property TipoAcesso: Word
      read GetTipoAcesso write SetTipoAcesso;

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
  end;
  
  TCMConfig = class ( TCMClasse )
  private
    FProgramasPermitidos   : String;
    FJanelasExplorer       : String;
    FAutoExecutar          : String;
    FModulos               : String;
    FTiposLancExtra        : String;
    FFecharProgramas       : Boolean;
    FAlertaFimTempo        : TDateTime;
    FTempoMaxAlerta        : TDateTime;
    FPermiteCapturaTela    : Boolean;
    FLimiteTempoPadrao     : TDateTime;
    FPermiteLoginSemCred   : Boolean;
    FPacoteTempoReal       : Boolean;
    FEncerramentoPrePago   : Byte;
    FProdutoImpressao      : String;
    FVariosTiposAcesso     : Boolean;
    FModoPagtoAcesso       : Byte;
    FMostraPrePagoDec      : Boolean;
    FMostraCliCadAntesAvulso: Boolean;
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
    FCMGuard               : String;
    FTolerancia            : TDateTime;
    FRegImp98              : Boolean;
    FPortaImpRec           : String;
    FSaltoImpRec           : Word;
    FLargImpRec            : Word;
    FCabecalhoImpRec       : String;
    FRodapeImpRec          : String;
    FImprimirImpRec        : Boolean;
    FMostraProgAtual       : Boolean;
    FMostraObs             : Boolean;
    FEscondeTextoBotoes    : Boolean;
    FExigirRG              : Boolean;
    FDesativaRegAutImp     : Boolean;
    FLimitePadraoDebito    : Double;
    FEscondeTipoAcesso     : Boolean;
    FNumFDesktop           : Integer;
    FNumFLogin             : Integer;
    FTipoFDesktop          : String;
    FTipoFLogin            : String;
    FMostrarApenasPIN      : Boolean;
    FTextoPIN              : String;
    FAlterarSenhaCli       : Boolean;
    FVerSenhaCli           : Boolean;
    FCodLoja               : String;
    
    procedure SetTextoPIN(const Value: String);

    function PastaFundo: String;
  protected
    function GetChave: Variant; override;
  public  
    function TipoClasse: Integer; override;
  
    constructor Create;
    function ChecaCores: Boolean;
    procedure AssignConfig(C : TCMConfig);

    procedure LeStream(S: TStream); override;
    procedure LeDataset(Tab: TDataset); override;

    function NomeArqDesktop: String;
    function NomeArqLogin: String;
    
  published
    property PermiteLoginSemCred: Boolean
      read FPermiteLoginSemCred write FPermiteLoginSemCred;
      
    property ProgramasPermitidos: String
      read FProgramasPermitidos write FProgramasPermitidos;

    property CMGuard: String
      read FCMGuard write FCMGuard;

    property JanelasExplorer: String
      read FJanelasExplorer write FJanelasExplorer;
      
    property AutoExecutar: String
      read FAutoExecutar write FAutoExecutar;
      
    property FecharProgramas: Boolean
      read FFecharProgramas write FFecharProgramas;

    property TiposLancExtra: String
      read FTiposLancExtra write FTiposLancExtra;

    property Modulos: String
      read FModulos write FModulos;  

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

    property ProdutoImpressao: String
      read FProdutoImpressao write FProdutoImpressao; 

    property VariosTiposAcesso: Boolean
      read FVariosTiposAcesso write FVariosTiposAcesso;  

    property ModoPagtoAcesso: Byte
      read FModoPagtoAcesso write FModoPagtoAcesso;

    property MostraPrePagoDec: Boolean
      read FMostraPrePagoDec write FMostraPrePagoDec;  

    property MostraCliCadAntesAvulso: Boolean
      read FMostraCliCadAntesAvulso write FMostraCliCadAntesAvulso;  

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

    property Tolerancia: TDateTime
      read FTolerancia write FTolerancia;  

    property RegImp98: Boolean
      read FRegImp98 write FRegImp98;

    property PortaImpRec: String
      read FPortaImpRec write FPortaImpRec;
      
    property SaltoImpRec: Word
      read FSaltoImpRec write FSaltoImpRec;
      
    property LargImpRec: Word
      read FLargImpRec write FLargImpRec;
      
    property CabecalhoImpRec: String
      read FCabecalhoImpRec write FCabecalhoImpRec;
      
    property RodapeImpRec: String
      read FRodapeImpRec write FRodapeImpRec;
      
    property ImprimirImpRec: Boolean
      read FImprimirImpRec write FImprimirImpRec;

    property MostraProgAtual: Boolean
      read FMostraProgAtual write FMostraProgAtual;

    property MostraObs: Boolean
      read FMostraObs write FMostraObs;
      
    property EscondeTextoBotoes: Boolean
      read FEscondeTextoBotoes write FEscondeTextoBotoes;

    property ExigirRG: Boolean
      read FExigirRG write FExigirRG;  

    property DesativaRegAutImp: Boolean
      read FDesativaRegAutImp write FDesativaRegAutImp;  

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

    property AlterarSenhaCli: Boolean
      read FAlterarSenhaCli write FAlterarSenhaCli;

    property VerSenhaCli: Boolean
      read FVerSenhaCli write FVerSenhaCli;

    property CodLoja: String
      read FCodLoja write FCodLoja;   
  end;
  
  TCMCliente = class ( TCMClasse )
  private
    FHandle     : Integer;
    FRemoto     : Boolean;
    FUsername   : String;
    FMaquina    : Byte;
    FWndHandle  : HWND;
    FProxyHandle: Integer;
    FSocket     : Integer;
    FInicio     : TDateTime;
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

    property Maquina: Byte
      read FMaquina write FMaquina;

    property Socket: Integer
      read FSocket write FSocket;

    property Inicio: TDateTime
      read FInicio Write FInicio;
  end;

  TCMMaquina = class ( TCMClasse )
  private
    procedure SetAguardaPagto(const Value: Boolean);
    procedure SetCaixa(const Value: Integer);
    procedure SetUsuarioI(const Value: String);
    function GetStrPassaportes: String;
    procedure SetStrPassaportes(const Value: String);
    function GetPPassaportes: PPassaportes;
  protected
    FCreditoTotal     : Cardinal;

    FLadoCli          : Boolean;
    FNumero           : Byte;
    FNome             : String;
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
    FPassaportes      : TPassaportes;
    FPrePago          : Boolean;
    FLevel            : Byte;

    function GetChave: Variant; override;
    function ParadoAtual: Cardinal;
    function TotalParado: Cardinal;

    function GetManutencao: Boolean;
    procedure SetManutencao(const Valor: Boolean); virtual;

    procedure SetTipoTran(const Valor: Byte); virtual;

    procedure SetNumero(Valor: Byte); virtual;
    procedure SetNome(Valor: String); virtual;
    procedure SetInicio(Valor: TDateTime); virtual;
    procedure SetContato(Valor: Integer); virtual;
    procedure SetNomeContato(Valor: String); virtual;
    procedure SetInicioTicks(Valor: Cardinal); virtual;
    
    procedure SetParadoInicio(Valor: Cardinal); virtual;
    procedure SetParado(Valor: Boolean); virtual;
    procedure SetParadoTicks(Valor: Cardinal); virtual;
    
    procedure SetTempoTicks(Valor: Cardinal); virtual;
    procedure SetCliente(Valor: Integer); virtual;
    procedure SetAcesso(Valor: Integer); virtual;
    procedure SetIsento(Valor: Boolean); virtual;
    procedure SetCreditoCli(Valor: Cardinal); virtual;
    procedure SetFimTicks(Valor: Cardinal); virtual;
    procedure SetProgramaAtual(Valor: String); virtual;
    procedure SetLimiteTempo(Valor: Cardinal); virtual;
    procedure SetParadoTicksAtual(Valor: Cardinal); virtual;

    procedure SetTipoAcesso(Valor: Word); virtual;
    procedure SetMenu(Valor: String); virtual;
    procedure SetVendas(Valor: Double); virtual;
    procedure SetSinal(Valor: Double); virtual;
    procedure SetLiberaAlemPacote(Valor: Boolean); virtual;
    procedure SetTicksParadoPac(Valor: Cardinal); virtual;

    procedure SetComputerName(Valor: String); virtual;
    

    procedure SetObsAcesso(Valor: String); virtual;

    function GetTempoTicks: Cardinal; virtual;
    function GetParadoTicksAtual: Cardinal; virtual;

  public
    constructor Create(aLadoCli: Boolean);

    procedure AssignMaq(M: TCMMaquina);

    destructor Destroy; override;

    procedure TransfereMaq(D: TCMMaquina);

    procedure LimpaInfoParado;

    function TipoClasse: Integer; override;

    function NomeMostrar: String;

    function NumTicks: Cardinal; 
    
    function ParadoPacote: Boolean;

    function ParadoLimite: Boolean;

    procedure ZeraInfoAcesso;

    procedure Calculo(var Tempo, TempoCobrado, CredUsado: Cardinal;
                      var Valor: Double;
                      HoraCor: TCMHoraCor;
                      Cores: TCMListaCorPreco;
                      PacTempoReal: Boolean);
                      
    property PediuTela: Boolean
      read FPediuTela write FPediuTela;  

    property UserObj: TObject
      read FUserObj write FUserObj;

    property Manutencao: Boolean
      read GetManutencao write SetManutencao;

    property Passaportes : PPassaportes
      read GetPPassaportes;

    property CreditoTotal: Cardinal
      read FCreditoTotal;

    property PrePago: Boolean
      read FPrePago;  

  published
    property Numero: Byte
      read FNumero write SetNumero;
      
    property Nome: String
      read FNome write SetNome;
      
    property Inicio: TDateTime
      read FInicio write SetInicio;
      
    property Contato: Integer
      read FContato write SetContato;
      
    property NomeContato: String
      read FNomeContato write SetNomeContato;

    property InicioTicks: Cardinal
      read FInicioTicks write SetInicioTicks;
      
    property TempoTicks: Cardinal
      read GetTempoTicks write SetTempoTicks;

    property Cliente: Integer
      read FCliente write SetCliente;

    property Acesso: Integer
      read FAcesso write SetAcesso;  

    property Isento: Boolean
      read FIsento write SetIsento;    

    property CreditoCli: Cardinal
      read FCreditoCli write SetCreditoCli;  

    property FimTicks: Cardinal
      read FFimTicks write SetFimTicks;  

    property ProgramaAtual: String
      read FProgramaAtual write SetProgramaAtual;

    property LimiteTempo: Cardinal
      read FLimiteTempo write SetLimiteTempo;  

    property ParadoTicks: Cardinal
      read FParadoTicks write SetParadoTicks;

    property ParadoTicksAtual: Cardinal
      read GetParadoTicksAtual write SetParadoTicksAtual;

    property Parado: Boolean
      read FParado write SetParado;

    property ParadoInicio: Cardinal
      read FParadoInicio write SetParadoInicio;

    property Menu: String
      read FMenu write SetMenu;

    property Recursos: String
      read FRecursos write FRecursos;  

    property TipoAcesso: Word
      read FTipoAcesso write SetTipoAcesso;  

    property Sinal: Double
      read FSinal write SetSinal;

    property Vendas: Double
      read FVendas write SetVendas;    

    property LiberaAlemPacote: Boolean
      read FLiberaAlemPacote write SetLiberaAlemPacote;  

    property ObsAcesso: String
      read FObsAcesso write SetObsAcesso;  

    property TicksParadoPac: Cardinal
      read FTicksParadoPac write SetTicksParadoPac;

    property ComputerName: String
      read FComputerName write SetComputerName;

    property AguardaPagto: Boolean
      read FAguardaPagto  write SetAguardaPagto;

    property UsuarioI: String
      read FUsuarioI write SetUsuarioI;

    property Caixa: Integer  
      read FCaixa write SetCaixa;

    property TipoTran: Byte
      read FTipoTran write SetTipoTran;

    property StrPassaportes: String
      read GetStrPassaportes write SetStrPassaportes;  

    property Level: Byte
      read FLevel write FLevel;
  end;  

  TCMUsuario = class ( TCMClasse )
  private
    FNumClientes    : Integer;  // número de clientes atualmente conectados nesse usuário
    FUsername       : String;
    FAdmin          : Boolean;
    FSenha          : String;
    FGrupos         : String;
    FDireitos       : String;
    FNome           : String;
    FMaxMaqManut    : Integer;
    FMaxTempoManut  : Integer;
  protected
    function GetChave: Variant; override;
  
    procedure SetNumClientes(Valor: Integer); virtual;
    procedure SetUsername(Valor: String); virtual;
    procedure SetAdmin(Valor: Boolean); virtual;
    procedure SetSenha(Valor: String); virtual;
    procedure SetGrupos(Valor: String); virtual;
    procedure SetDireitos(Valor: String); virtual;
    procedure SetNome(Valor: String); virtual;
  public
    constructor Create;

    function TipoClasse: Integer; override;

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
      
    property Grupos: String
      read FGrupos write SetGrupos;
      
    property Direitos: String
      read FDireitos write SetDireitos;

    property MaxMaqManut: Integer
      read FMaxMaqManut write FMaxMaqManut;

    property MaxTempoManut: Integer
      read FMaxTempoManut write FMaxTempoManut;    

  end;

  TCMGrupo = class ( TCMClasse )
  private
    FNome : String;
    FUsuarios : String;
    FDireitos : String;
  protected
    function GetChave: Variant; override;
  
    procedure SetNome(Valor : String);
    procedure SetUsuarios(Valor : String);
    procedure SetDireitos(Valor : String);
  public
    constructor Create;

    function TipoClasse: Integer; override;
  published
    property Nome : String
      read FNome write SetNome; 
      
    property Usuarios : String
      read FUsuarios write SetUsuarios; 
      
    property Direitos : String
      read FDireitos write SetDireitos; 
  end;

  TCMListaMaquinas = class ( TListaClasseCS ) 
  private
    function GetMaquina(I: Integer): TCMMaquina;
    function GetMaquinaPorNumero(N: Integer): TCMMaquina;
    function GetMaquinaPorCliente(C: Integer): TCMMaquina;
    function GetMaquinaPorContato(C: Integer): TCMMaquina;
    function GetMaquinaPorAcesso(A: Integer): TCMMaquina;
    function GetMaquinaPorPassaporte(N: Integer): TCMMaquina;
  protected 
    function GetCount: Integer; override;  
  public
    constructor Create;

    function NumConectados: Integer;

    function PassaporteEmUso(aNumPass: Integer): Boolean;

    property Itens[I: Integer]: TCMMaquina
      read GetMaquina; default;

    property PorPassaporte[N: Integer]: TCMMaquina
      read GetMaquinaPorPassaporte;  

    property PorNumero[N: Integer]: TCMMaquina
      read GetMaquinaPorNumero;  

    property PorCliente[C: Integer]: TCMMaquina
      read GetMaquinaPorCliente; 

    property PorContato[C: Integer]: TCMMaquina
      read GetMaquinaPorContato;  
       
    property PorAcesso[A: Integer]: TCMMaquina
      read GetMaquinaPorAcesso;  
  end;

  TCMListaTipoAcesso = class ( TListaClasseCS ) 
  private
    function GetTipoAcesso(I: Integer): TCMTipoAcesso;
    function GetTipoAcessoPorCodigo(N: Integer): TCMTipoAcesso;
  public
    constructor Create;

    property Itens[I: Integer]: TCMTipoAcesso
      read GetTipoAcesso; default;

    property PorCodigo[N: Integer]: TCMTipoAcesso
      read GetTipoAcessoPorCodigo;
  end;

  TCMListaCorPreco   = class ( TListaClasseCS )
  private
    function GetCorPreco(I: Integer): TCMCorPreco;
    function GetCorPrecoPorCor(aTipoAcesso: Word; aCor: Integer): TCMCorPreco;
  public
    constructor Create;

    property Itens[I: Integer]: TCMCorPreco 
      read GetCorPreco; default;

    property PorCor[aTipoAcesso: Word; aCor: Integer]: TCMCorPreco
      read GetCorPrecoPorCor;
  end;

  TCMListaUsuarios = class ( TListaClasseCS ) 
  private
    function GetUsuario(I: Integer): TCMUsuario;
    function GetUsuarioPorUsername(N: String): TCMUsuario;
  public
    constructor Create;

    property Itens[I: Integer]: TCMUsuario
      read GetUsuario; default;

    property PorUsername[N: String]: TCMUsuario
      read GetUsuarioPorUsername;
  end;

  TCMListaGrupos = class ( TListaClasseCS ) 
  private
    function GetGrupo(I: Integer): TCMGrupo;
    function GetGrupoPorNome(N: String): TCMGrupo;
  public
    constructor Create;

    property Itens[I: Integer]: TCMGrupo
      read GetGrupo; default;

    property PorNome[N: String]: TCMGrupo
      read GetGrupoPorNome;
  end;
  
  TCMServidorBase = class ( TComponent )
  private
    FUltimoHandle : Integer;
    
    function NumClientesLocais: Integer; 
  protected
    FClientes: TThreadList;
    FAtivo : Boolean;

    procedure AoRemoverCliente(Cliente: TCMCliente); virtual;
    function ObtemCliente(aHandle: Integer): TCMCliente;
    function ObtemClientePorSocket(Socket: Integer): TCMCliente;
    
    procedure EnviaEvento(Mensagem, Dados1, Dados2: Integer);
    
    procedure AddCliente(Obj: TCMCliente);
    procedure RemoveCliente(Obj: TCMCliente); 
    function ProximoHandle: Integer;
    procedure SetAtivo(Valor: Boolean); virtual;
    procedure DesativaClientes;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function ObtemLicenca(var LicencaStr: TLicencaStr): Integer; virtual; abstract;
    function SalvaLicenca(LicencaStr: String): Integer; virtual; abstract;
    
    function ObtemPastaServ(var NomePastaServ: String): Integer; virtual; 
    function ArqFundoEnviado(NomeArq: String): Integer; virtual; abstract;
    function ObtemSenhaCli(Codigo: Integer; var Senha: String): Integer; virtual; abstract;
    function SalvaSenhaCli(Codigo: Integer; Senha: String): Integer; virtual; abstract;
    function LimpaFundo(Desktop: Boolean): Integer; virtual; abstract;

    function Upload(aFonte, aDestino: String): Integer; virtual;
    function Download(aFonte, aDestino: String): Integer; virtual;

    function SalvaStreamObj(Novo: Boolean; S: TStream): Integer; virtual; abstract;
    function ObtemStreamAvisos(S: TStream): integer; virtual; abstract;
    function ObtemStreamConfig(S: TStream): integer; virtual; abstract;
    function ObtemStreamListaObj(Cliente: Integer; TipoClasse: Integer; S: TStream): Integer; virtual; abstract;
    function ApagaObj(Cliente: Integer; TipoClasse: Integer; Chave: String): Integer; virtual; abstract;
    function Login(aUsername, 
                   aSenha: String; 
                   aMaq: Byte;
                   aFuncAtual: Boolean;
                   aRemoto: Boolean; 
                   aWndHandle: HWND; 
                   aProxyHandle: Integer; 
                   aSocket: Integer;
                   var Handle: Integer): Integer; virtual; 

    function LoginMaq(aMaq: Byte; 
                      aContato: Integer;
                      aUserName, aSenha, aNome, aObsAcesso: String; 
                      aLimiteTempo: Cardinal; 
                      aSinal: Double; 
                      aTipoAcesso: Word): Integer; virtual; abstract;

    function AdicionaPassaporte(aMaq: Byte; aSenha: String): Integer; virtual; abstract;   
    function RegistraPaginasImpressas(aMaq: Byte; aPaginas: Integer; aImp, aDoc: String): Integer; virtual; abstract;
    
    function PararTempoMaq(aMaq: Byte; aParar: Boolean): Integer; virtual; abstract;
    function LiberarAlemPacote(aMaq: Byte): Integer; virtual; abstract;
    function TransferirMaq(aOrigem, aDestino: Byte): Integer; virtual; abstract;
    function ModoManutencao(aMaq: Byte; aUsername, aSenha: String; aEntrar: Boolean): Integer; virtual; abstract;
    
    
    function LogoutMaq(aMaq: Byte): Integer; virtual; abstract;
    function PreLogoutMaq(aMaq: Byte): Integer; virtual; abstract;
    function CancLogoutMaq(aMaq: Byte): Integer; virtual; abstract;

    function BaixaNovaVersao(Programa, Versao, ArqDestino: String): Integer; virtual;
    
    function CapturaTelaMaq(aMaq: Byte; S: TMemoryStream): integer; virtual; abstract;
    function SalvaTelaMaq(aMaq: Byte; S: TMemoryStream): integer; virtual; abstract;
    function RefreshPrecos: integer; virtual; abstract;
    function ShutdownMaq(aMaq, aOper: Byte): integer; virtual; abstract;

    function EnviarMsg(const aDe, aPara: Integer; const aTexto: String): Integer; virtual; abstract;
                   
    procedure Logout(Cliente: Integer); virtual;
    procedure LogoutSocket(Socket: Integer); virtual;

    function EnviarEventos: Boolean;
  published
    property Ativo: Boolean
      read FAtivo write SetAtivo;  
  end; 

  procedure ChecaErro(Erro: Integer);
  
  function TicksToHMSSt(Ticks: Cardinal): String;
  function TicksToDateTime(Ticks: Cardinal): TDateTime;
  function SegundosToHMSSt(Seg: Cardinal): String;
  function SegundosToDateTime(Seg: Cardinal): TDateTime;
  function DateTimeToTicks(D: TDateTime): Cardinal;
  function DateTimeToSegundos(D: TDateTime): Cardinal;

  procedure CalculaTempoValor(Inicio: TDateTime;
                              NumTicks, Credito: Cardinal;
                              TipoAcesso: Word;
                              HoraCor: TCMHoraCor;
                              Cores: TCMListaCorPreco;
                              PacTempoReal: Boolean;
                              Passaportes: PPassaportes;
                              var TempoCobrado: Cardinal;
                              var CreditoUsado: Cardinal;
                              var Valor: Double);

  procedure CalculaMaxTempo(Inicio: TDateTime;
                            Credito: Cardinal;
                            TipoAcesso: Word;
                            HoraCor: TCMHoraCor;
                            Cores: TCMListaCorPreco;
                            Passaportes: PPassaportes;
                            var MaxTempo: Cardinal);

  function Senha(D: TDateTime; NS: Cardinal; NumMaq: Integer): String;
  function VolumeSerial(DriveChar: Char): string;

  function CalcAcesso(Acesso, Sinal, Desc: Double): Double;
  function FormataNumVersao(St: String): String;

  function DuasCasas(D: Double): Double;

  function TempoTotalArrayPrecos(AP: TCMArrayPrecos): Cardinal;
  
  function ObtemTempo(Inicio: TDateTime;
                      TipoAcesso: Word;
                      HoraCor: TCMHoraCor;
                      Cores: TCMListaCorPreco;
                      MaxValor: Double): Cardinal;

  function ObtemCred(I: Integer): Cardinal;

  function StringToBool(S: String): Boolean;

  procedure MinutosPorHora(Inicio, Fim: TDateTime; var Tempos: TArrayTempo);
  
  procedure ObtemPassUsernameSenha(var Username, Senha: String);
  
  
var
  glTolerancia: Cardinal = 0;

implementation

uses Graphics, md5;

function StringToBool(S: String): Boolean;
begin
  S := UpperCase(S);
  Result := (S='T') or (S='TRUE') OR (S='S') or (S='SIM');
end;

function MenorCardinal(C1, C2: Cardinal): Cardinal;
begin
  if C1<C2 then
    Result := C1
  else
    Result := C2;  
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

function ObtemCred(I: Integer): Cardinal;
begin
  if I>0 then 
    Result := I
  else
    Result := 0;  
end;

function TempoTotalArrayPrecos(AP: TCMArrayPrecos): Cardinal;
var I : Integer;
begin
  Result := 0;
  for I := 0 to High(AP) do 
    Result := Result + AP[I].prTempo;
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

function ZeroPad(St: String; Len: Integer): String;
begin
  Result := St;
  while Length(Result)<Len do Result := '0'+Result;
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
   Result := 'Kznq098s';
  end;  
end;

{ TCMClasse }
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
  H := Ticks div (1000 * 60 * 60);
  Ticks := Ticks mod (1000 * 60 * 60);
  M := Ticks div (1000 * 60);
  Ticks := Ticks mod (1000 * 60);
  S := Ticks div 1000;
  
  if (H>23) then H := 23;
  
  Result := EncodeTime(H, M, S, 0);
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

function DateTimeToTicks(D: TDateTime): Cardinal;
var H, M, S, MS : Word;
begin
  DecodeTime(D, H, M, S, MS);
  Result := (Trunc(Int(D)) * 24 * 60 * 60 * 1000) +
            (H * 60 * 60 * 1000) +
            (M * 60 * 1000) +
            (S * 1000) + MS;
end;  

function DateTimeToSegundos(D: TDateTime): Cardinal;
var H, M, S, MS : Word;
begin
  DecodeTime(D, H, M, S, MS);
  Result := (H * 60 * 60) + (M * 60) + S;
end;  


constructor TCMClasse.Create;
begin
  inherited;
  FProcNotificar := nil;
end;

destructor TCMClasse.Destroy;
begin
  Notificar(tnDestruicao);
  inherited;
end;

procedure TCMClasse.Notificar(TipoNot: TTipoNotificacao);
begin
  if Assigned(FProcNotificar) then
    FProcNotificar(Self, TipoNot);
end;

{ TCMMaquina }

constructor TCMMaquina.Create(aLadoCli: Boolean);
begin
  inherited Create;
  FPassaportes.Limpa;
  FPrePago      := False;
  FFimTicks     := 0;
  FLadoCli      := aLadoCli;
  FNumero       := 0;
  FNome         := '';
  FInicio       := 0;
  FContato      := 0;
  FNomeContato  := '';
  FInicioTicks  := 0;
  FTempoTicks   := 0;
  FCliente      := 0;
  FAcesso       := 0;
  FIsento       := False;
  FCreditoCli   := 0;   
  FProgramaAtual := '';
  FPediuTela     := False;
  FUserObj       := nil;
  FParadoTicks      := 0;
  FParadoTicksAtual := 0;
  FParado           := False;
  FParadoInicio     := 0;
  FTipoAcesso       := 0;
  FSinal            := 0;
  FVendas           := 0;
  FLiberaAlemPacote := False;
  FTicksParadoPac   := 0;
  FTipoTran         := ttAcesso;
  
  FMenu             := '';
  FObsAcesso        := '';
  FRecursos         := '';
  FComputerName     := '';
  FAguardaPagto     := False;
  FUsuarioI         := '';
  FCaixa            := 0;
  FLevel            := 0;

  AtualizaCache;
end;

destructor TCMMaquina.Destroy;
begin
  if FUserObj <> nil then FUserObj.Free;
  inherited;
end;


function TCMMaquina.GetChave: Variant;
begin
  Result := Numero;
end;

procedure TCMMaquina.SetNumero(Valor: Byte);
begin
  FNumero := Valor;
end;

procedure TCMMaquina.SetNome(Valor: String);
begin
  FNome := Valor;
end;

procedure TCMMaquina.SetInicio(Valor: TDateTime);
begin
  FInicio := Valor;
end;

procedure TCMMaquina.SetContato(Valor: Integer);
begin
  FContato := Valor;
end;

procedure TCMMaquina.SetNomeContato(Valor: String);
begin
  FNomeContato := Valor;
end;

procedure TCMMaquina.SetInicioTicks(Valor: Cardinal);
begin
  if not FLadoCli then 
    FInicioTicks := Valor;
end;

procedure TCMMaquina.SetTempoTicks(Valor: Cardinal);
begin
  if FLadoCli then begin
    FInicioTicks := GetTickCount - Valor;  
    FTempoTicks  := Valor;
  end;  
end;

procedure TCMMaquina.SetParadoTicksAtual(Valor: Cardinal);
begin
  if FLadoCli then begin
    if Valor>0 then
      FParadoInicio := GetTickCount - Valor
    else
      FParadoInicio := 0;  
    FParadoTicksAtual := Valor;
  end;  
end;

procedure TCMMaquina.SetCliente(Valor: Integer);
begin
  FCliente := Valor;
end;

procedure TCMMaquina.SetAcesso(Valor: Integer);
begin
  FAcesso := Valor;
end;  

function TCMMaquina.TipoClasse: Integer;
begin
  Result := tcMaquina;
end;

function TCMMaquina.GetTempoTicks: Cardinal;
begin
  if FLadoCli then
    Result := FTempoTicks
  else  
    Result := GetTickCount - InicioTicks;
end;

function TCMMaquina.GetParadoTicksAtual: Cardinal;
begin
  if FLadoCli then
    Result := FParadoTicksAtual
  else
    Result := ParadoAtual;  
end;

procedure TCMMaquina.SetIsento(Valor: Boolean);
begin
  FIsento := Valor;
end;

procedure TCMMaquina.SetCreditoCli(Valor: Cardinal);
begin
  FCreditoCli := Valor;
end;

procedure TCMMaquina.Calculo(var Tempo, TempoCobrado, CredUsado: Cardinal;
                             var Valor: Double;
                             HoraCor: TCMHoraCor;
                             Cores: TCMListaCorPreco;
                             PacTempoReal: Boolean);
var P: TPassaportes;
begin
  P := FPassaportes;
  CalculaMaxTempo(FInicio, FCreditoCli, TipoAcesso, HoraCor, Cores, @P, FCreditoTotal);
  Tempo  := NumTicks;

  CalculaTempoValor(FInicio, Tempo, FCreditoCli, TipoAcesso, HoraCor, Cores, PacTempoReal,
                    @FPassaportes, TempoCobrado, CredUsado, Valor);

  FPrePago := False;
  if Isento then
    Valor := 0
  else
  if CreditoTotal > Tempo then begin
    Tempo := CreditoTotal - Tempo;
    FPrePago := True;
  end else
    Tempo := Tempo - CreditoTotal;

  FPrePago := FPrePago or (Valor=0) or (Valor <= Sinal);
end;

function TCMMaquina.NumTicks: Cardinal;
var TP, TPP, IT : Cardinal;
begin
  TP := TotalParado;
  TPP := FTicksParadoPac;
  IT := FInicioTicks;
  if (TPP+TP+IT) > GetTickCount then begin
    TPP := 0;
    TP := 0;
  end;
    
  if FimTicks>0 then
    Result := FimTicks
  else  
    Result := GetTickCount - (TP + TPP + IT); {FInicioTicks+TotalParado+FTicksParadoPac);}

  if (FCreditoTotal > MinCreditoLoginMS) and
     (not FLiberaAlemPacote) and
     (Result > FCreditoTotal)
  then
    Result := FCreditoTotal;

  if (FLimiteTempo>500)  and ((Result>FLimiteTempo) and (not FLiberaAlemPacote)) then
    Result := FLimiteTempo;
end;

procedure TCMMaquina.SetFimTicks(Valor: Cardinal);
begin
  FFimTicks := Valor;
end;

procedure TCMMaquina.SetLimiteTempo(Valor: Cardinal);
begin
  FLimiteTempo := Valor;
end;

procedure TCMMaquina.SetProgramaAtual(Valor: String);
begin
  FProgramaAtual := Valor;
end;

procedure TCMMaquina.SetParado(Valor: Boolean);
begin
  if FParado=Valor then Exit;
  FParado := Valor;
  
  if not FLadoCli then
  if FParado then
    FParadoInicio := GetTickCount
  else begin
    FParadoTicks := TotalParado;      
    FParadoInicio := 0;
  end;  
end;

procedure TCMMaquina.SetParadoInicio(Valor: Cardinal);
begin
  // no cliente esse valor é ajustado via SetParadoTicksAtual e no Servidor via SetParado
end;

procedure TCMMaquina.SetParadoTicks(Valor: Cardinal);
begin
  // esse valor só é ajustado diretamente no lado cliente, no servido ele é ajustado via SetParado
  if FLadoCli then
  if Valor > 0 then
    FParadoTicks := Valor
  else
    FParadoTicks := 0;  
end;

function TCMMaquina.TotalParado: Cardinal;
begin
  Result := FParadoTicks + ParadoAtual;
end;

function TCMMaquina.ParadoPacote: Boolean;
var NT: Cardinal;
begin
  if (not FLiberaAlemPacote) and ((CreditoTotal>500) or (FLimiteTempo>500)) then begin
    NT := NumTicks;
    Result := (CreditoTotal>500) and (CreditoTotal<=NT);
    Result := Result or ((FLimiteTempo>500) and (FLimiteTempo<=NT));  
  end else
    Result := False;  
end;

function TCMMaquina.ParadoLimite: Boolean;
begin
  Result := (LimiteTempo>999) and (NumTicks>=LimiteTempo);
end;

function TCMMaquina.ParadoAtual: Cardinal;
begin
  if FParadoInicio > 0 then
    Result := GetTickCount - FParadoInicio
  else
    Result := 0;  
end;

procedure TCMMaquina.LimpaInfoParado;
begin
  if not FLadoCli then begin
    FParadoTicks      := 0;
    FParado           := False;
    FParadoTicksAtual := 0;
    FParadoInicio     := 0;
  end;  
end;

procedure TCMMaquina.TransfereMaq(D: TCMMaquina);
begin
  D.FInicio := FInicio;
  D.FContato := FContato;
  D.FNome := FNome;
  D.FNomeContato := FNomeContato;
  D.FInicioTicks := FInicioTicks;
  D.FTempoTicks := FTempoTicks;
  D.FAcesso := FAcesso;
  D.FIsento := FIsento;
  D.FCreditoCli := FCreditoCli;
  D.FFimTicks := FFimTicks;
  D.FLimiteTempo := FLimiteTempo;
  D.FParadoTicks := FParadoTicks;
  D.FParadoTicksAtual := FParadoTicksAtual;
  D.FParado := FParado;
  D.FParadoInicio := FParadoInicio;
  D.FTipoAcesso := FTipoAcesso;
  D.Sinal := FSinal;
  D.Vendas := FVendas;
  D.FObsAcesso := FObsAcesso;
  D.FLiberaAlemPacote := FLiberaAlemPacote;
  D.FTicksParadoPac := FTicksParadoPac;
  D.FTipoTran := FTipoTran;
  D.FPassaportes := FPassaportes;
  D.FCreditoTotal := FCreditoTotal;

  FInicio           := 0;
  FTipoAcesso       := 0;
  FCreditoTotal     := 0;
  FContato          := 0;
  FNome             := '';
  FNomeContato      := '';
  FInicioTicks      := 0;
  FTempoTicks       := 0;
  FAcesso           := 0;
  FIsento           := False;
  FCreditoCli       := 0;
  FFimTicks         := 0;
  FLimiteTempo      := 0;
  FProgramaAtual    := '';
  FParadoTicks      := 0;
  FParadoTicksAtual := 0;
  FParado           := False;
  FParadoInicio     := 0;
  FSinal            := 0;
  FVendas           := 0;
  FObsAcesso        := '';
  FTipoAcesso       := High(Word);
  FLiberaAlemPacote := False;
  FTicksParadoPac   := 0;
  FAguardaPagto     := False;
  FTipoTran         := ttAcesso;
  FPassaportes.Limpa;

  D.LimpaCache;
  Sleep(10);
  D.Notificar(tnAlteracao);
  LimpaCache;
  Notificar(tnAlteracao);
end;

procedure TCMMaquina.SetMenu(Valor: String);
begin
  FMenu := Valor;
end;

procedure TCMMaquina.SetTipoAcesso(Valor: Word);
begin
  FTipoAcesso := Valor;
end;

function TCMMaquina.NomeMostrar: String;
begin
  if Contato>0 then
    Result := NomeContato
  else
    Result := Nome;  
end;

procedure TCMMaquina.SetSinal(Valor: Double);
begin
  FSinal := Valor;
end;

procedure TCMMaquina.SetVendas(Valor: Double);
begin
  FVendas := Valor;
end;

procedure TCMMaquina.SetObsAcesso(Valor: String);
begin
  FObsAcesso := Valor;
end;

procedure TCMMaquina.SetLiberaAlemPacote(Valor: Boolean);
begin
  FLiberaAlemPacote := Valor;
end;

procedure TCMMaquina.SetTicksParadoPac(Valor: Cardinal);
begin
  FTicksParadoPac := Valor;
end;

procedure TCMMaquina.SetComputerName(Valor: String);
begin
  FComputerName := Valor;
end;

procedure TCMMaquina.SetAguardaPagto(const Value: Boolean);
begin
  FAguardaPagto := Value;
end;

procedure TCMMaquina.SetManutencao(const Valor: Boolean);
begin
  if Valor then
    TipoTran := ttManutencao
  else
    TipoTran := ttAcesso;  
end;

procedure TCMMaquina.SetTipoTran(const Valor: Byte);
begin
  FTipoTran := Valor;
end;

procedure TCMMaquina.ZeraInfoAcesso;
begin
  Acesso := 0;
  Nome   := '';
  FPrePago := False;
  InicioTicks := 0;
  CreditoCli := 0;
  FCreditoTotal := 0;
  FPassaportes.Limpa;
  Contato := 0;
  Isento := False;
  Inicio := 0;
  NomeContato := '';
  ProgramaAtual := '';
  LimpaInfoParado;
  TicksParadoPac := 0;
  TipoAcesso := High(Word);
  Sinal := 0;
  Vendas := 0;
  ObsAcesso := '';
  AguardaPagto := False;
  FimTicks := 0;
  Caixa := 0;
  UsuarioI := '';
  TipoTran := ttAcesso;
end;

procedure TCMMaquina.SetCaixa(const Value: Integer);
begin
  FCaixa := Value;
end;

procedure TCMMaquina.SetUsuarioI(const Value: String);
begin
  FUsuarioI := Value;
end;

function TCMMaquina.GetManutencao: Boolean;
begin
  Result := (TipoTran=ttManutencao);
end;

function TCMMaquina.GetStrPassaportes: String;
begin
  Result := FPassaportes.ObtemStr;
end;

procedure TCMMaquina.SetStrPassaportes(const Value: String);
begin
  FPassaportes.LeStr(Value);
end;

function TCMMaquina.GetPPassaportes: PPassaportes;
begin
  Result := @FPassaportes;
end;

procedure TCMMaquina.AssignMaq(M: TCMMaquina);
begin
  FCreditoTotal     := M.FCreditoTotal;
  FLadoCli          := M.FLadoCli;
  FNumero           := M.FNumero;
  FNome             := M.FNome;
  FInicio           := M.FInicio;
  FContato          := M.FContato;
  FObsAcesso        := M.FObsAcesso;
  FNomeContato      := M.FNomeContato;
  FInicioTicks      := M.FInicioTicks;
  FTempoTicks       := M.FTempoTicks;
  FCliente          := M.FCliente;
  FAcesso           := M.FAcesso;
  FIsento           := M.FIsento;
  FCreditoCli       := M.FCreditoCli;
  FFimTicks         := M.FFimTicks;
  FLimiteTempo      := M.FLimiteTempo;
  FProgramaAtual    := M.FProgramaAtual;
  FPediuTela        := M.FPediuTela;
  FUserObj          := M.FUserObj;
  FParadoTicks      := M.FParadoTicks;
  FParadoTicksAtual := M.FParadoTicksAtual;
  FParado           := M.FParado;
  FParadoInicio     := M.FParadoInicio;
  FMenu             := M.FMenu;
  FRecursos         := M.FRecursos;
  FTipoAcesso       := M.FTipoAcesso;
  FSinal            := M.FSinal;
  FVendas           := M.FVendas;
  FLiberaAlemPacote := M.FLiberaAlemPacote;
  FTicksParadoPac   := M.FTicksParadoPac;
  FComputerName     := M.FComputerName;
  FAguardaPagto     := M.FAguardaPagto;
  FUsuarioI         := M.FUsuarioI;
  FCaixa            := M.FCaixa;
  FTipoTran         := M.FTipoTran;
  FPassaportes      := M.FPassaportes;
end;

{ TCMServidorBase }

constructor TCMServidorBase.Create(AOwner: TComponent);
begin
  inherited;
  FClientes := TThreadList.Create;
  FUltimoHandle := 0;
  FAtivo := False;
end;

destructor TCMServidorBase.Destroy;
begin
  FreeAndNil(FClientes);
  inherited;
end;

function TCMServidorBase.Download(aFonte, aDestino: String): Integer;
begin
  Result := 0;
end;

procedure TCMServidorBase.EnviaEvento(Mensagem, Dados1, Dados2: Integer);
var 
  I, Faltam : Integer;  
  CopiaLParam: LParam;
  C : TCMCliente;
begin
  with FClientes.LockList do
  try
    Faltam := NumClientesLocais;
    if Faltam = 0 then begin
      FreeLParam(Mensagem, Dados2);
      Exit;
    end;
    
    for I := 0 to pred(Count) do begin
      C := Items[I];
      if (C.WndHandle>0) and (not C.Remoto) then begin
        if (Faltam>1) then
          CopiaLParam := ClonaLParam(Mensagem, Dados2);
        EnviaMsg(C.WndHandle, Mensagem, Dados1, Dados2);  
        Dados2 := CopiaLParam;  
        Dec(Faltam);
      end;
    end;  
  finally
    FClientes.UnlockList;
  end;  
end;

function TCMServidorBase.EnviarEventos: Boolean;
begin
  Result := (NumClientesLocais>0);
end;

procedure TCMServidorBase.AddCliente(Obj: TCMCliente);
begin
  with FClientes.LockList do
  try
    Add(Obj);
  finally
    FClientes.UnlockList;
  end;
end;

function TCMServidorBase.ProximoHandle: Integer;
begin
  Inc(FUltimoHandle);
  Result := FUltimoHandle;
end;

procedure TCMServidorBase.RemoveCliente(Obj: TCMCliente);
var 
  I : Integer;
  C : TCMCliente;
begin
  with FClientes.LockList do
  try
    I := 0;
    if Obj.Proxy then begin
      while I < Count do begin
        C := TCMCliente(Items[I]);
        if (C.ProxyHandle=Obj.Handle) then begin
          if C.Proxy then I := 0;
          RemoveCliente(C);
        end else
          Inc(I);
      end;
    end;     
    AoRemoverCliente(Obj);   
    Remove(Obj);
    Obj.Free;
  finally
    FClientes.UnlockList;
  end;
end;

function TCMServidorBase.NumClientesLocais: Integer;
var 
  I : Integer;
  C : TCMCliente;
begin
  with FClientes.LockList do
  try
    Result := 0;
    for I := 0 to pred(Count) do begin
      C := TCMCliente(Items[I]);
      if (not C.Remoto) and (C.WndHandle>0) then
        Inc(Result);
    end;    
  finally
    FClientes.UnlockList;
  end;
end;

function TCMServidorBase.Login(aUsername, aSenha: String; aMaq: Byte; aFuncAtual: Boolean; aRemoto: Boolean;
  aWndHandle: HWND; aProxyHandle: Integer; aSocket: Integer;
  var Handle: Integer): Integer;
var
  C : TCMCliente;  
begin
  Result := 0;
  C := TCMCliente.Create;
  C.UserName := aUserName;
  C.Handle := Handle;
  C.Remoto := aRemoto;
  C.WndHandle := aWndHandle;
  C.ProxyHandle := aProxyHandle;
  C.Maquina := aMaq;
  C.Socket := aSocket;
  C.Inicio := Now;
  AddCliente(C);
end;

procedure TCMServidorBase.Logout(Cliente: Integer);
var C : TCMCliente;
begin
  C := ObtemCliente(Cliente);
  if C <> nil then 
    RemoveCliente(C);
end;

procedure TCMServidorBase.LogoutSocket(Socket: Integer);
var C : TCMCliente;
begin
  C := ObtemClientePorSocket(Socket);
  while (C<>nil) do begin
    RemoveCliente(C);
    C := ObtemClientePorSocket(Socket);
  end;  
end;


function TCMServidorBase.ObtemCliente(aHandle: Integer): TCMCliente;
var I : Integer;
begin
  with FClientes.LockList do
  try
    for I := 0 to pred(Count) do 
    if TCMCliente(Items[I]).Handle = aHandle then begin
      Result := Items[I];
      Exit;
    end;
    Result := nil;  
  finally
    FClientes.UnlockList;
  end;  
end;

function TCMServidorBase.ObtemClientePorSocket(Socket: Integer): TCMCliente;
var I : Integer;
begin
  with FClientes.LockList do
  try
    if Socket > 0 then
    for I := 0 to pred(Count) do 
    if TCMCliente(Items[I]).Socket = Socket then begin
      Result := Items[I];
      Exit;
    end;
    Result := nil;  
  finally
    FClientes.UnlockList;
  end;  
end;

function TCMServidorBase.ObtemPastaServ(var NomePastaServ: String): Integer;
begin
  Result := 0;
  NomePastaServ := ExtractFilePath(ParamStr(0));
end;

procedure TCMServidorBase.SetAtivo(Valor: Boolean);
begin
  if not Valor then DesativaClientes;
  FAtivo := Valor;
end;

function TCMServidorBase.Upload(aFonte, aDestino: String): Integer;
begin
  Result := 0;
end;

procedure TCMServidorBase.DesativaClientes;
begin
  EnviaEvento(cmmc_ServidorDesativado, 0, 0);
  with FClientes.LockList do 
  try
    while Count > 0 do begin
      TCMCliente(Items[0]).Free;
      Delete(0);
    end;  
  finally
    FClientes.UnlockList;
  end;  
end;

procedure TCMServidorBase.AoRemoverCliente(Cliente: TCMCliente);
begin

end;

function TCMServidorBase.BaixaNovaVersao(Programa, Versao,
  ArqDestino: String): Integer;
begin
  Result := cmerrSemNovaVersao;
end;

{ TCMCliente }

constructor TCMCliente.Create;
begin
  inherited;
  FHandle   := 0;
  FRemoto   := False;
  FUsername := '';
  FWndHandle:= 0;
  FSocket   := 0;
  FInicio   := 0;
end;

function TCMCliente.TipoClasse: Integer;
begin
  Result := tcCliente;
end;

function TCMCliente.Proxy: Boolean;
begin
  Result := (Username = ProxyUsername);
end;


function TCMCliente.GetChave: Variant;
begin
  Result := FHandle;
end;

{ TCMListaMaquinas }

constructor TCMListaMaquinas.Create;
begin
  inherited Create(tcMaquina);
end;

function TCMListaMaquinas.GetCount: Integer; 
begin
  Result := inherited GetCount;
  if (Result>2) and LicencaGlobal.EmModoDemo then
    Result := 2;
end;

function TCMListaMaquinas.GetMaquina(I: Integer): TCMMaquina;
begin
  Result := TCMMaquina(GetItem(I));
end;

function TCMListaMaquinas.NumConectados: Integer;
var I : Integer;
begin
  Result := 0;
  for I := 0 to Pred(GetCount) do 
  if (GetMaquina(I).Cliente>0) then Inc(Result);
end;


function TCMListaMaquinas.GetMaquinaPorNumero(N: Integer): TCMMaquina;
begin
  Result := TCMMaquina(ItemPorChave[N]);
end;

function TCMListaMaquinas.GetMaquinaPorCliente(C: Integer): TCMMaquina;
begin
  Result := nil;
end;

constructor EErroCyberMgr.Create(CE: Integer);
begin
  inherited Create('Erro Cyber-Manager ('+IntToStr(CE)+'): '+StringErro(CE));
  CodigoErro := CE;
end;

procedure ChecaErro(Erro: Integer);
begin
  if Erro <> 0 then
    Raise EErroCyberMgr.Create(Erro);
end;

function TCMListaMaquinas.GetMaquinaPorAcesso(A: Integer): TCMMaquina;
var I : Integer;
begin
  Result := nil;
  for I := 0 to Pred(GetCount) do 
  if (GetMaquina(I).Acesso=A) then begin
    Result := GetMaquina(I);
    Exit;
  end;
end;

function TCMListaMaquinas.GetMaquinaPorContato(C: Integer): TCMMaquina;
var I : Integer;
begin
  Result := nil;
  for I := 0 to Pred(GetCount) do 
  if (GetMaquina(I).Contato=C) then begin
    Result := GetMaquina(I);
    Exit;
  end;
end;

function TCMListaMaquinas.PassaporteEmUso(aNumPass: Integer): Boolean;
begin
  Result := (PorPassaporte[aNumPass]<>nil);
end;

function TCMListaMaquinas.GetMaquinaPorPassaporte(N: Integer): TCMMaquina;
var I : Integer;
begin
  for I := 0 to Pred(Count) do 
  if Itens[I].Passaportes^.ContemPassaporte(N) then begin
    Result := Itens[I];
    Exit;
  end;
    
  Result := nil;
end;

{ TCMListaGrupos }

constructor TCMListaGrupos.Create;
begin
  inherited Create(tcGrupo);
end;

function TCMListaGrupos.GetGrupo(I: Integer): TCMGrupo;
begin
  Result := TCMGrupo(GetItem(I));
end;

function TCMListaGrupos.GetGrupoPorNome(N: String): TCMGrupo;
var I: Integer;
begin
  Lock;
  try
    for I := 0 to pred(Count) do with Itens[I] do
    if (Nome = N) then begin
      Result := Itens[I];
      Exit;
    end;
    Result := nil;
  finally
    Unlock;
  end;
end;

{ TCMListaUsuarios }

constructor TCMListaUsuarios.Create;
begin
  inherited Create(tcUsuario);
end;

function TCMListaUsuarios.GetUsuario(I: Integer): TCMUsuario;
begin
  Result := TCMUsuario(GetItem(I));
end;

function TCMListaUsuarios.GetUsuarioPorUsername(N: String): TCMUsuario;
begin
  Result := TCMUsuario(GetItemPorChave(N));
end;

{ TCMUsuario }

constructor TCMUsuario.Create;
begin
  inherited;
  FNumClientes := 0;
  FUsername    := '';
  FAdmin       := False;
  FSenha       := '';
  FGrupos      := '';
  FDireitos    := '';
  FMaxMaqManut := 0;
  FMaxTempoManut := 0;
end;

function TCMUsuario.GetChave: Variant;
begin
  Result := FUsername;
end;

procedure TCMUsuario.SetAdmin(Valor: Boolean);
begin
  FAdmin := Valor;
end;

procedure TCMUsuario.SetDireitos(Valor: String);
begin
  FDireitos := Valor;
end;

procedure TCMUsuario.SetGrupos(Valor: String);
begin
  FGrupos := Valor;
end;

procedure TCMUsuario.SetNome(Valor: String);
begin
  FNome := Valor;
end;

procedure TCMUsuario.SetNumClientes(Valor: Integer);
begin
  FNumClientes := Valor;
end;

procedure TCMUsuario.SetSenha(Valor: String);
begin
  FSenha := Valor;
end;

procedure TCMUsuario.SetUsername(Valor: String);
begin
  FUsername := Valor;
end;

function TCMUsuario.TipoClasse: Integer;
begin
  Result := tcUsuario;
end;

{ TCMGrupo }

constructor TCMGrupo.Create;
begin
  inherited;
  FNome := '';
  FDireitos := '';
  FUsuarios := '';
end;

function TCMGrupo.GetChave: Variant;
begin
  Result := FNome;
end;

procedure TCMGrupo.SetDireitos(Valor: String);
begin
  FDireitos := Valor;
end;

procedure TCMGrupo.SetNome(Valor: String);
begin
  FNome := Valor;
end;

procedure TCMGrupo.SetUsuarios(Valor: String);
begin
  FUsuarios := Valor;
end;

function TCMGrupo.TipoClasse: Integer;
begin
  Result := tcGrupo;
end;

{ TCMConfig }

constructor TCMConfig.Create;
begin
  inherited;
  FPermiteLoginSemCred := False;
  FPacoteTempoReal     := True;
  FEncerramentoPrePago := eppPausarAcesso;
  FVariosTiposAcesso   := False; 
  FModoPagtoAcesso     := 0;
  FMostraPrePagoDec    := True;
  FMostraCliCadAntesAvulso := False;
  FProdutoImpressao    := '';
  FProgramasPermitidos := '';
  FJanelasExplorer     := '';
  FAutoExecutar        := '';
  FFecharProgramas     := False;
  FAutoExecutar        := '';
  FModulos             := '';
  FTiposLancExtra      := '';
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
  FTolerancia          := EncodeTime(0, 2, 0, 0);
  FRegImp98            := False;
  FPortaImpRec         := 'LPT1';
  FSaltoImpRec         := 9;
  FLargImpRec          := 45;
  FCabecalhoImpRec     := 'NOME DA SUA LOJA';
  FRodapeImpRec        := '';
  FImprimirImpRec      := False;
  FMostraProgAtual     := True;
  FMostraObs           := False;
  FEscondeTextoBotoes  := False;
  FEscondeTipoAcesso   := False;
  FExigirRG            := False;
  FDesativaRegAutImp   := False;
  FMostrarApenasPIN    := False;
  FTextoPIN            := '&Nome de Usuário';
  FNumFDesktop         := 0;
  FNumFLogin           := 0;
  FTipoFDesktop        := '';
  FTipoFLogin          := '';
  FAlterarSenhaCli     := False;
  FVerSenhaCli         := False;
  FLimitePadraoDebito  := 0;
  FCMGuard             := 'NoNet=1';
  FCodLoja             := '';
end;

function TCMConfig.ChecaCores: Boolean;
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

function TCMConfig.GetChave: Variant;
begin
  Result := 0;
end;

function TCMConfig.TipoClasse: Integer;
begin
  Result := tcConfig;
end;

function Arredonda(D: Double): Double;
var 
  I, R : Integer;
begin
  I := Trunc(D * 100);
  R := I mod 10;
  if (R>0) and (R<>5) then 
  if R < 5  then
    I := I - R
  else  
    I := I + (10-R);
  Result := I / 100;  
end;

procedure CalcRestoTempo(Preco, Valor: Double; Tempo: Cardinal; var Resto: Extended; var T: Cardinal);
begin
  if Preco > 0.00001 then begin
    Resto := (Valor / Preco) * Tempo;
    T := Trunc(Resto);
    Resto := Frac(Resto);
  end else begin
    Resto := 0;
    T := Tempo;
  end;  
end;

function TCMCorPreco.ObtemIndProxPreco(TempoCorrido: Cardinal): Integer;
var T : Cardinal;
begin
  if (Length(FPrecos)=0) or (TempoCorrido<0) then
    Result := -1
  else
  if Length(FPrecos)=1 then
    Result := 0 
  else begin
    if Reinicia then 
      TempoCorrido := TempoCorrido mod TempoTotal;
    Result := 0;
    T := FPrecos[0].prTempo;
    while (TempoCorrido>T) and (Result<High(FPrecos)) do begin
      Result := Result + 1;
      T := T + FPrecos[Result].prTempo;
    end;  
  end;    
end;

function ObtemTempo(Inicio: TDateTime;
                    TipoAcesso: Word;
                    HoraCor: TCMHoraCor;
                    Cores: TCMListaCorPreco;
                    MaxValor: Double): Cardinal;
var
  D, H  : Byte;
  T, InicioCor, InicioPreco, TempoCorrido : Cardinal;
  I, CorAI, HP : Integer;
  RestoT : Extended;
  Resto  : Extended;
  Valor : Double;
  Avancou : Byte;
  Cor, CorA : TCMCorPreco;

procedure AtualizaDiaH;
var Hour, Min, Sec, MSec : Word;
begin
  D := DayOfWeek(Inicio);
  DecodeTime(Inicio, Hour, Min, Sec, MSec);
  H := Hour;
end;

procedure AvancaProxHora;
var Hour, Min, Sec, MSec : Word;
begin
  DecodeTime(Inicio, Hour, Min, Sec, MSec);
  if Hour=23 then begin
    Inicio := Inicio + 1;
    H := 0;
  end else
    H := Hour+1;
  Inicio := Trunc(Int(Inicio)) + EncodeTime(H, 0, 0, 0);
  D := DayOfWeek(Inicio);
end;


procedure SomaValorCred(aTempo: Cardinal; aPreco: Double);
var RestoI: Integer;
begin
  if (aTempo=0) then begin
    Valor := MaxValor + 1;
    Exit;
  end;

  RestoT := RestoT + Resto;
  RestoI := Trunc(RestoT);
  if RestoI > 0 then begin                         
    aTempo := aTempo + RestoI;
    RestoT := RestoT - RestoI;
  end;  

  if ((Valor + aPreco) - MaxValor) >= 0.00001 then
    Valor := MaxValor + 1
  else begin
    Result := Result + aTempo;
    Valor := Valor + aPreco;
  end;

  Inicio := Inicio + TicksToDateTime(aTempo);
  AtualizaDiaH;
end;
  
begin
  Result := 0;
  if MaxValor<0.01 then 
    Exit;

  Valor := 0;

  AtualizaDiaH;

  RestoT := 0;
  Resto := 0;
  
  CorA := nil;
  I := -1;
  InicioCor := 0;
  InicioPreco := 0;
  Valor := 0;

  while (Valor <= MaxValor+0.0001) do begin
    if Result > MSPorSemana then begin
      Result := 0;
      Break;
    end;
      
    if (CorA<>nil) and (CorAI=HoraCor[D, H]) then
      Cor := CorA
    else begin 
      CorAI := HoraCor[D, H];
      Cor := Cores.PorCor[TipoAcesso, CorAI];
      Avancou := 0;
      while (Cor=nil) and (Avancou<24) do begin
        AvancaProxHora;
        CorAI := HoraCor[D, H];
        Cor := Cores.PorCor[TipoAcesso, CorAI];
        Inc(Avancou);
      end;
      if Avancou>24 then
        Break;
    end;
    
    if Cor<>nil then begin
      if (Cor<>CorA) then begin
        {- Cor Mudou --}
        TempoCorrido := Result - InicioCor;
        if (TempoCorrido>0) and (CorA<>nil) and (CorA.Reinicia) then
          TempoCorrido := TempoCorrido mod CorA.TempoTotal;
        I := Cor.ObtemIndProxPreco(TempoCorrido);
        InicioCor := Result;
        InicioPreco := Result;
      end else begin
        {- Cor não mudou, checar preço}
        HP := Cor.FPrecos[I].prTempo;
        if ((Result-InicioPreco) >= HP) then begin
          HP := High(Cor.FPrecos);
          if (I < HP) then begin
            Inc(I);
            InicioPreco := Result;
          end else  
          if (Length(Cor.FPrecos)>0) and Cor.Reinicia then 
          begin
            I := 0;
            InicioPreco := Result;
          end;
        end;
      end;
    end;  
    
    if (Cor<>nil) and (I>=0) then 
    with Cor.FPrecos[I] do begin
      CalcRestoTempo(prValor, prValorMin, prTempo, Resto, T);
      SomaValorCred(T, prValorMin);
    end else
      Break;
      
    CorA := Cor;
  end;  
end;

procedure CalculaMaxTempo(Inicio: TDateTime;
                          Credito: Cardinal;
                          TipoAcesso: Word;
                          HoraCor: TCMHoraCor;
                          Cores: TCMListaCorPreco;
                          Passaportes: PPassaportes;
                          var MaxTempo: Cardinal);
var
  D, H  : Byte;

  T,
  NumTicks,
  NumTicksI,
  InicioCor,
  InicioPreco,
  TempoCorrido : Cardinal;

  Valor : Double;

  I, CorAI : Integer;
  Result : Double;
  RestoT  : Extended;
  Avancou : Byte;
  Resto   : Extended;
  Cor,
  CorA    : TCMCorPreco;

procedure AtualizaDiaH;
var Hour, Min, Sec, MSec : Word;
begin
  D := DayOfWeek(Inicio);
  DecodeTime(Inicio, Hour, Min, Sec, MSec);
  H := Hour;
end;

procedure AvancaProxHora;
var Hour, Min, Sec, MSec : Word;
begin
  DecodeTime(Inicio, Hour, Min, Sec, MSec);
  if Hour=23 then begin
    Inicio := Inicio + 1;
    H := 0;
  end else
    H := Hour+1;
  Inicio := Trunc(Int(Inicio)) + EncodeTime(H, 0, 0, 0);
  D := DayOfWeek(Inicio);
end;

procedure SomaValorCred(aTempo: Cardinal; aPreco: Double);
var
  RestoI: Integer;
  TempoP : Cardinal;
begin
  if (aTempo=0) then begin
    MaxTempo := 0;
    Exit;
  end;

  RestoT := RestoT + Resto;
  RestoI := Trunc(RestoT);
  if RestoI > 0 then begin
    aTempo := aTempo + RestoI;
    RestoT := RestoT - RestoI;
  end;

  if Passaportes<>nil then
    TempoP := Passaportes^.AbateCreditos(Inicio, aTempo)
  else
    TempoP := 0;

  if (Credito+TempoP) < aTempo then begin
    MaxTempo := MaxTempo + Credito + TempoP;
    Valor := 0.01;
    Credito := 0;
  end else begin
    MaxTempo := MaxTempo + aTempo;
    Credito := Credito - (aTempo - TempoP);
  end;

  NumTicks := NumTicks + aTempo;

  Inicio := Inicio + TicksToDateTime(aTempo);
  AtualizaDiaH;
end;

begin
  Valor := 0;
  if Passaportes<>nil then begin
    Passaportes^.ZeraInicioUso;
    Passaportes^.AjustaInicioExpirar(Inicio);
  end;

  MaxTempo := 0;

  AtualizaDiaH;
  NumTicksI := NumTicks;


  RestoT := 0;
  Resto := 0;

  CorA := nil;
  I := -1;
  InicioCor := 0;
  InicioPreco := 0;
  NumTicks := 0;
  MaxTempo := 0;

  if Passaportes<>nil then
    Passaportes^.Ordenar(Inicio, H);

  while (Valor<0.01) do begin
    if (CorA<>nil) and (CorAI=HoraCor[D, H]) then
      Cor := CorA
    else begin 
      CorAI := HoraCor[D, H];
      Cor := Cores.PorCor[TipoAcesso, CorAI];
      
      Avancou := 0;
      while (Cor=nil) and (Avancou<24) do begin
        AvancaProxHora;
        CorAI := HoraCor[D, H];
        Cor := Cores.PorCor[TipoAcesso, CorAI];
        Inc(Avancou);
      end;
      if Avancou>24 then
        Break;
    end;

    if Cor<>nil then begin
      if (Cor<>CorA) then begin
        TempoCorrido := NumTicks - InicioCor;
        if (TempoCorrido>0) and (CorA<>nil) and (CorA.Reinicia) then
          TempoCorrido := TempoCorrido mod CorA.TempoTotal;
        I := Cor.ObtemIndProxPreco(TempoCorrido);
        InicioCor := NumTicks;
        InicioPreco := NumTicks;
      end else
      if ((T-InicioPreco) >= Cor.FPrecos[I].prTempo) then begin
        if (I < High(Cor.FPrecos)) then begin
          Inc(I);
          InicioPreco := NumTicks;
        end else
        if (Length(Cor.FPrecos)>0) and Cor.Reinicia then
        begin
          I := 0;
          InicioPreco := NumTicks;
        end;
      end;
    end;
    
    if (Cor<>nil) and (I>=0) then 
    with Cor.FPrecos[I] do begin
      CalcRestoTempo(prValor, prValorMin, prTempo, Resto, T);
      SomaValorCred(T, prValorMin);
    end else begin
      Valor := 0.01;
      NumTicks := 0;
    end;   
      
    CorA := Cor;
  end;

end;


procedure CalculaTempoValor(Inicio: TDateTime;
                            NumTicks, Credito: Cardinal;
                            TipoAcesso: Word;
                            HoraCor: TCMHoraCor;
                            Cores: TCMListaCorPreco;
                            PacTempoReal: Boolean;
                            Passaportes: PPassaportes;
                            var TempoCobrado: Cardinal;
                            var CreditoUsado: Cardinal;
                            var Valor: Double);
var
  D, H  : Byte;

  T, 
  NumTicksI, 
  InicioCor, 
  InicioPreco, 
  tempTol,
  TempoCorrido : Cardinal;

  I, CorAI : Integer;
  Result : Double;
  RestoT  : Extended;
  Resto   : Extended;
  Avancou : Byte;
  Cor,
  CorA    : TCMCorPreco;

procedure AtualizaDiaH;
var Hour, Min, Sec, MSec : Word;
begin
  D := DayOfWeek(Inicio);
  DecodeTime(Inicio, Hour, Min, Sec, MSec);
  H := Hour;
end;

procedure AvancaProxHora;
var Hour, Min, Sec, MSec : Word;
begin
  DecodeTime(Inicio, Hour, Min, Sec, MSec);
  if Hour=23 then begin
    Inicio := Inicio + 1;
    H := 0;
  end else
    H := Hour+1;
  Inicio := Trunc(Int(Inicio)) + EncodeTime(H, 0, 0, 0);
  D := DayOfWeek(Inicio);
end;

procedure SomaValorCred(aTempo: Cardinal; aPreco: Double);
var
  RestoI: Integer;
  TempoR,
  TempoP : Cardinal;
begin
  if (aTempo=0) then begin
    NumTicks := 0;
    Exit;
  end;
  
  RestoT := RestoT + Resto;
  RestoI := Trunc(RestoT);
  if RestoI > 0 then begin
    aTempo := aTempo + RestoI;
    RestoT := RestoT - RestoI;
  end;  

  TempoCobrado := TempoCobrado + aTempo;

  if Passaportes<>nil then begin
    TempoP := Passaportes^.AbateCreditos(Inicio, MenorCardinal(aTempo, NumTicks));
    TempoR := MenorCardinal(aTempo, NumTicks) - TempoP;
  end else begin
    TempoP := 0;
    TempoR := aTempo;
  end;    

  if TempoR > 0 then begin
    if Credito >= TempoR then begin
      if PacTempoReal then
        Credito := Credito - TempoR
      else
      if (NumTicks<aTempo) then
        Credito := Credito - MenorCardinal(aTempo-TempoP, Credito)
      else
        Credito := Credito - TempoR;  
    end else begin
      Credito := 0;
      Valor := Valor + aPreco;
    end;
  end;

  tempTol := glTolerancia;
  if tempTol>(aTempo div 2) then
    TempTol := (aTempo div 2);

  if (NumTicks<=aTempo) or ((T>0) and (NumTicks<(aTempo+tempTol))) then
    NumTicks := 0
  else
    NumTicks := NumTicks - aTempo;


  Inicio := Inicio + TicksToDateTime(aTempo);
  AtualizaDiaH;
end;

begin
  Valor := 0;
  if Passaportes<>nil then begin
    Passaportes^.ZeraInicioUso;
    Passaportes^.AjustaInicioExpirar(Inicio);
  end;
{  if PacTempoReal then
    TempoCobrado := NumTicks
  else   }
  TempoCobrado := 0;

  CreditoUsado := 0;
  if NumTicks=0 then Exit;
  
  CreditoUsado := Credito;
  AtualizaDiaH;
  NumTicksI := NumTicks;
  

  RestoT := 0;
  Resto := 0;

  CorA := nil;
  I := -1;
  InicioCor := 0;
  InicioPreco := 0;

  if Passaportes<>nil then
    Passaportes^.Ordenar(Inicio, H);

  while NumTicks > 50 do begin
    T := NumTicksI - NumTicks;
    
    if (CorA<>nil) and (CorAI=HoraCor[D, H]) then
      Cor := CorA
    else begin 
      CorAI := HoraCor[D, H];
      Cor := Cores.PorCor[TipoAcesso, CorAI];

      Avancou := 0;
      while (Cor=nil) and (Avancou<24) do begin
        AvancaProxHora;
        CorAI := HoraCor[D, H];
        Cor := Cores.PorCor[TipoAcesso, CorAI];
        Inc(Avancou);
      end;
      if Avancou>24 then
        Break;

    end;  
    
    if Cor<>nil then begin
      if (Cor<>CorA) then begin
        TempoCorrido := T - InicioCor;
        if (TempoCorrido>0) and (CorA<>nil) and (CorA.Reinicia) then
          TempoCorrido := TempoCorrido mod CorA.TempoTotal;
        I := Cor.ObtemIndProxPreco(TempoCorrido);
        InicioCor := T;
        InicioPreco := T;
      end else
      if ((T-InicioPreco) >= Cor.FPrecos[I].prTempo) then begin
        if (I < High(Cor.FPrecos)) then begin
          Inc(I);
          InicioPreco := T;
        end else
        if (Length(Cor.FPrecos)>0) and Cor.Reinicia then
        begin
          I := 0;
          InicioPreco := T;
        end;
      end;
    end;  
    
    if (Cor<>nil) and (I>=0) then 
    with Cor.FPrecos[I] do begin
      CalcRestoTempo(prValor, prValorMin, prTempo, Resto, T);
      SomaValorCred(T, prValorMin);
    end else begin
      Valor := 0;
      NumTicks := 0;
    end;   
      
    CorA := Cor;
  end;  
  CreditoUsado := CreditoUsado - Credito;  
  Valor := Arredonda(Valor);
end;

procedure TCMConfig.AssignConfig(C: TCMConfig);
begin
  FProgramasPermitidos    := C.FProgramasPermitidos;
  FJanelasExplorer        := C.FJanelasExplorer;
  FAutoExecutar           := C.FAutoExecutar;
  FModulos                := C.FModulos;
  FTiposLancExtra         := C.FTiposLancExtra;
  FFecharProgramas        := C.FFecharProgramas;
  FAlertaFimTempo         := C.FAlertaFimTempo;
  FTempoMaxAlerta         := C.FTempoMaxAlerta;
  FPermiteCapturaTela     := C.FPermiteCapturaTela;
  FLimiteTempoPadrao      := C.FLimiteTempoPadrao;
  FPermiteLoginSemCred    := C.FPermiteLoginSemCred;
  FPacoteTempoReal        := C.FPacoteTempoReal;
  FEncerramentoPrePago    := C.FEncerramentoPrePago;
  FProdutoImpressao       := C.FProdutoImpressao;
  FVariosTiposAcesso      := C.FVariosTiposAcesso;
  FModoPagtoAcesso        := C.FModoPagtoAcesso;
  FMostraPrePagoDec       := C.FMostraPrePagoDec;
  FMostraCliCadAntesAvulso:= C.FMostraCliCadAntesAvulso;
  FCorLivre               := C.FCorLivre;
  FCorFLivre              := C.FCorFLivre;
  FCorUsoPrePago          := C.FCorUsoPrePago;
  FCorFUsoPrePago         := C.FCorFUsoPrePago;
  FCorUsoPosPago          := C.FCorUsoPosPago;
  FCorFUsoPosPago         := C.FCorFUsoPosPago;
  FCorPausado             := C.FCorPausado;
  FCorFPausado            := C.FCorFPausado;
  FCorAguardaPagto        := C.FCorAguardaPagto;
  FCorFAguardaPagto       := C.FCorFAguardaPagto;
  FCorManutencao          := C.FCorManutencao;
  FCorFManutencao         := C.FCorFManutencao;
  FCMGuard                := C.FCMGuard;
  FTolerancia             := C.FTolerancia;
  FRegImp98               := C.FRegImp98;
  FPortaImpRec            := C.FPortaImpRec;
  FSaltoImpRec            := C.FSaltoImpRec;
  FLargImpRec             := C.FLargImpRec;
  FCabecalhoImpRec        := C.FCabecalhoImpRec;
  FRodapeImpRec           := C.FRodapeImpRec;
  FImprimirImpRec         := C.FImprimirImpRec;
  FMostraProgAtual        := C.FMostraProgAtual;
  FMostraObs              := C.FMostraObs;
  FEscondeTextoBotoes     := C.FEscondeTextoBotoes;
  FExigirRG               := C.FExigirRG;
  FDesativaRegAutImp      := C.FDesativaRegAutImp;
  FLimitePadraoDebito     := C.FLimitePadraoDebito;
  FEscondeTipoAcesso      := C.FEscondeTipoAcesso;
  FNumFDesktop            := C.FNumFDesktop;
  FNumFLogin              := C.FNumFLogin;
  FTipoFDesktop           := C.FTipoFDesktop;
  FTipoFLogin             := C.FTipoFLogin;
  FMostrarApenasPIN       := C.FMostrarApenasPIN;
  FTextoPIN               := C.FTextoPIN;
  FAlterarSenhaCli        := C.FAlterarSenhaCli;
  FVerSenhaCli            := C.VerSenhaCli;
  FCodLoja                := C.FCodLoja;
end;

procedure TCMConfig.LeStream(S: TStream);
begin
  inherited;
  glTolerancia := DateTimeToTicks(FTolerancia);
end;

function TCMConfig.NomeArqDesktop: String;
begin
  if SameText(TipoFDesktop, 'JPG') then
    Result := PastaFundo + 'DESKTOP' + IntToStr(NumFDesktop) + '.JPG'
  else
    Result := '';  
end;

function TCMConfig.NomeArqLogin: String;
begin
  if SameText(TipoFLogin, 'JPG') or SameText(TipoFLogin, 'GIF') then
    Result := PastaFundo + 'LOGIN' + IntToStr(NumFLogin) + '.' + TipoFLogin
  else
    Result := '';  
end;

function TCMConfig.PastaFundo: String;
begin
  if SameText(ExtractFileName(ParamStr(0)), 'CMSERVER.EXE') then
    Result := ExtractFilePath(ParamStr(0)) + 'DADOS\'
  else
    Result := ExtractFilePath(ParamStr(0));  
end;

procedure TCMConfig.SetTextoPIN(const Value: String);
begin
  if Trim(Value)='' then
    FTextoPIN := '&Nome de Usuário'
  else
    FTextoPIN := Value;  
end;

procedure TCMConfig.LeDataset(Tab: TDataset);
begin
  inherited;
  glTolerancia := DateTimeToTicks(FTolerancia);
end;

{ TCMTipoAcesso }

constructor TCMTipoAcesso.Create;
begin
  inherited;
  FNome := '';
  Fillchar(FHoraCor, SizeOf(FHoraCor), 0);
  FCodigo := 0;
end;

function TCMTipoAcesso.GetChave: Variant;
begin
  Result := FCodigo;
end;

function TCMTipoAcesso.GetPHoraCor: PCMHoraCor;
begin
  Result := @FHoraCor;
end;

function TCMTipoAcesso.GetHoraCorStr: String;
begin
  SetLength(Result, SizeOf(FHoraCor));
  Move(FHoraCor, Result[1], SizeOf(FHoraCor));
end;

procedure TCMTipoAcesso.SetHoraCorStr(const Valor: String);
begin
  Move(Valor[1], FHoraCor, Length(Valor));
end;

function TCMTipoAcesso.TipoClasse: Integer;
begin
  Result := tcTipoAcesso;
end;

procedure TCMTipoAcesso.AssignTA(TA: TCMTipoAcesso);
begin
  FCodigo    := TA.FCodigo;
  FNome      := TA.FNome;
  FHoraCor   := TA.FHoraCor;
end;

{ TCMListaTipoAcesso }

constructor TCMListaTipoAcesso.Create;
begin
  inherited Create(tcTipoAcesso);
end;

function TCMListaTipoAcesso.GetTipoAcesso(I: Integer): TCMTipoAcesso;
begin
  Result := TCMTipoAcesso(GetItem(I));
end;

function TCMListaTipoAcesso.GetTipoAcessoPorCodigo(
  N: Integer): TCMTipoAcesso;
begin
  Result := TCMTipoAcesso(ItemPorChave[N]);
  if (Result=nil) and (Count>0) then
    Result := Itens[0];
end;

function TCMListaCorPreco.GetCorPreco(I: Integer): TCMCorPreco;
begin
  Result := TCMCorPreco(GetItem(I));
end;

function TCMListaCorPreco.GetCorPrecoPorCor(aTipoAcesso: Word; aCor: Integer): TCMCorPreco;
var I : Integer;
begin
  for I := 0 to pred(Count) do with Itens[I] do
  if (TipoAcesso=aTipoAcesso) and (Cor=aCor) then begin
    Result := Itens[I];
    Exit;
  end;  
  Result := nil;
end;

constructor TCMListaCorPreco.Create;
begin
  inherited Create(tcCorPreco);
end;


{ TCMCorPreco }

constructor TCMCorPreco.Create;
begin
  inherited;
  FTipoAcesso := 0;
  FCor        := 0;
  FCorFonte   := 0;
  FReinicia   := False;
  FDescricao  := '';
  PrecosStr := '';
end;

function TCMCorPreco.GetChave: Variant;
begin
  Result := IntToStr(FTipoAcesso)+'|'+IntToStr(Cor);
end;

function TCMCorPreco.GetCor: Integer;
begin
  Result := FCor;
end;

function TCMCorPreco.GetCorFonte: Integer;
begin
  Result := FCorFonte;
end;

function TCMCorPreco.GetDescricao: String;
begin
  Result := FDescricao;
end;

function TCMCorPreco.GetPPrecos: PCMArrayPrecos;
begin
  Result := @FPrecos;
end;

function TCMCorPreco.GetPrecosStr: String;
var 
  S: String;
  P : TCMArrayPrecos;
begin
  if Length(FPrecos)>0 then begin
    SetLength(Result, Length(FPrecos)*SizeOf(TCMPreco));
    Move(FPrecos[0], Result[1], Length(Result));
{    S := Result;
    SetLength(P, Length(S) div SizeOf(TCMPreco));
    Move(S[1], P, Length(S));
    Result := Result;}
  end else
    Result := '';  
end;

function TCMCorPreco.GetReinicia: Boolean;
begin
  Result := FReinicia;
end;

function TCMCorPreco.GetTipoAcesso: Word;
begin
  Result := FTipoAcesso;
end;

procedure TCMCorPreco.SetCor(Value: Integer);
begin
  FCor := Value;
end;

procedure TCMCorPreco.SetCorFonte(Value: Integer);
begin
  FCorFOnte := Value;
end;

procedure TCMCorPreco.SetDescricao(Value: String);
begin
  FDescricao := Value;
end;

procedure TCMCorPreco.SetPrecosStr(Value: String);
begin
  if Value > '' then begin
    SetLength(FPrecos, Length(Value) div SizeOf(TCMPreco));
    Move(Value[1], FPrecos[0], Length(Value));
    Value := '';
    if Length(FPrecos)=4949494 then {};
  end else
    SetLength(FPrecos, 0);
end;

procedure TCMCorPreco.SetReinicia(Value: Boolean);
begin
  FReinicia := Value;
end;

procedure TCMCorPreco.SetTipoAcesso(Value: Word);
begin
  FTipoAcesso := Value;
end;

function TCMCorPreco.TempoTotal: Cardinal;
begin
  Result := TempoTotalArrayPrecos(FPrecos);
end;

function TCMCorPreco.TipoClasse: Integer;
begin
  Result := tcCorPreco;
end;

{ TPassaporte }

function StrParaData(S: String): TDateTime;
var
  Dia, Mes, Ano, Min, Seg, Hora : Integer;
begin
  Dia  := StrToIntDef(Copy(S, 1, 2), 0);
  Mes  := StrToIntDef(Copy(S, 3, 2), 0);
  Ano  := StrToIntDef(Copy(S, 5, 4), 0);
  Hora := StrToIntDef(Copy(S, 9, 2), 0);
  Min  := StrToIntDef(Copy(S, 11, 2), 0);
  Seg  := StrToIntDef(Copy(S, 13, 2), 0);
  Result := EncodeDate(Ano, Mes, Dia) + EncodeTime(Hora, Min, Seg, 0);
end;

function SetBit(I, Bits: Integer; Lig: Boolean): Integer;
begin
  if Lig then
    Result := I or Bits
  else
    Result := I and (not Bits);  
end;

function BitIsSet(I, Bits: Integer): Boolean;
begin
  Result := ((I and Bits)=Bits);
end;

procedure TPassaporte.AtualizaExpirou;
begin
  pctExpirou := pcExpirou or  (
                ((pcTipoExp=teAcessos) and (pcAcessos>=pcExpirarEm)) or 
                (TempoRestante(pctInicio)=0));
end;

procedure TPassaporte.AjustaInicioExpirar(Inicio: TDateTime);
begin
  pctExpirou := pcExpirou;
  pctInicio := Inicio;
  pctUsadoMS := 0;
  pctExpirar := 0;
  if pctExpirou then Exit;
  case pcTipoExp of
    teDias        : pctExpirar := PrimeiroUso + pcExpirarEm;
    teHoras       : pctExpirar := PrimeiroUso + (pcExpirarEm / 24);
    teDataMarcada : pctExpirar := pcExpirarEm;
    teAcessos,
    teNunca       : pctExpirar := High(Cardinal);
  end;
  pctExpirou := ((pcTipoExp=teAcessos) and (pcAcessos>=pcExpirarEm)) or (TempoRestante(pctInicio)=0);
end;

function TPassaporte.GetHoraValida(D, H: Integer): Boolean;
begin
  Result := BitIsSet(pcHorasValidas[D], BitsH[H]);
end;

function ValorParaStr(Valor: Double): String;
begin
  Str(Valor:0:10, Result);
  while (Length(Result)>0) and (Result[Length(Result)]='0') do 
    Delete(Result, Length(Result), 1);
end;

function StrParaValor(S: String): Double;
var Code: Integer;
begin
  Val(S, Result, Code);
end;

function TPassaporte.ObtemStr: String;
begin
  Result :=
    IntToStr(pcNumero) + '|' +
    IntToStr(pcCliente) + '|' +
    IntToStr(pcTipoExp)+ '|' +
    IntToStr(pcTipoAcesso) + '|' +
    FormatDateTime('ddmmyyyyhhmmss', pcExpirarEm) + '|' +
    FormatDateTime('ddmmyyyyhhmmss', pcPrimeiroUso) + '|' +
    BoolStr[pcExpirou] + '|' +
    IntToStr(pcMaxSegundos) + '|' +
    IntToStr(pcSegundos) + '|' +
    IntToStr(pcAcessos) + '|' +
    pcSenha + '|' +
    BoolStr[pcValido] + '|' +
    ValorParaStr(pcValor) + '|' +
    HorasValidasToStr;
end;

procedure TPassaporte.HorasValidasFromStr(S: String);
var I : Integer;

function GetNextStr: String;
var P : Integer;
begin
  P := Pos('|', S);
  if P>0 then begin
    Result := Copy(S, 1, P-1);
    Delete(S, 1, P);
  end else begin
    Result := S;
    S := '';
  end;  
end;

begin
  for I := 1 to 7 do
    pcHorasValidas[I] := StrToIntDef(GetNextStr, 0);
end;

function TPassaporte.HorasValidasToStr: String;
var S: Integer;
begin
  Result := '';
  for S := 1 to 7 do begin
    if S>1 then Result := Result + '|';
    Result := Result + IntToStr(pcHorasValidas[S]);
  end;
end;

procedure TPassaporte.LoadFromDataset(D: TDataset);
var F : TField;
begin
  with D do begin
    FillChar(Self, SizeOf(Self), 0);

    F := FindField('Codigo');
    if F<>nil then pcCodigo := F.AsInteger;

    F := FindField('TipoPass');
    if F<>nil then pcCodigo := F.AsInteger;

    F := FindField('Numero');
    if F<>nil then pcNumero := F.AsInteger;

    F := FindField('Nome');
    if F<>nil then pcNome := F.AsString;

    F := FindField('Valor');
    if F<>nil then 
      pcValor := F.AsCurrency;

    F := FindField('Cliente');
    if F<>nil then pcCliente := F.AsInteger;

    pcTipoExp := FieldByName('TipoExp').AsInteger;
    pcTipoAcesso := FieldByName('TipoAcesso').AsInteger;
    
    F := FindField('Senha');
    if F<>nil then pcSenha := F.AsString;

    F := FindField('Expirou');
    if F<>nil then pcExpirou := F.AsBoolean;

    F := FindField('Valido');
    pcValido := (F=nil) or F.AsBoolean;

    pcExpirarEm := FieldByName('ExpirarEm').AsDateTime;
    
    F := FindField('PrimeiroUso');
    if F<>nil then pcPrimeiroUso := F.AsDateTime;

    pcMaxSegundos := FieldByName('MaxSegundos').AsInteger;

    F := FindField('Segundos');
    if F<>nil then pcSegundos := F.AsInteger;

    F := FindField('Acessos');
    if F<>nil then pcAcessos := F.AsInteger;

    pcHorasValidas[1] := FieldByName('Dia1').AsInteger;
    pcHorasValidas[2] := FieldByName('Dia2').AsInteger;
    pcHorasValidas[3] := FieldByName('Dia3').AsInteger;
    pcHorasValidas[4] := FieldByName('Dia4').AsInteger;
    pcHorasValidas[5] := FieldByName('Dia5').AsInteger;
    pcHorasValidas[6] := FieldByName('Dia6').AsInteger;
    pcHorasValidas[7] := FieldByName('Dia7').AsInteger;
    
    pctExpirou := pcExpirou;
    pctUsadoMS := 0;
    pctInicio  := 0;
  end;
end;

function TPassaporte.ObtemTempo(Agora: TDateTime; Dia, H : Integer; DuracaoMS: Cardinal; Ordenando: Boolean): Cardinal;
var TempoRes : Cardinal;
begin
  Result := 0;
  if (not HoraValida[Dia, H]) or (not pcValido) then Exit;
  if (not Ordenando) and (pctInicioUso < 1)  then begin
    pctInicioUso := Agora;
    AjustaInicioExpirar(Agora);
  end;
  if pctExpirou then Exit;
  TempoRes := TempoRestante(Agora);
  pctExpirou := (TempoRes=0);
  if not pctExpirou then
    Result := MenorCardinal(DuracaoMS, TempoRes);
  pctUsadoMS := pctUsadoMS + Result;
end;

function TPassaporte.PrimeiroUso: TDateTime;
begin
  if (pcPrimeiroUso=0) then
    Result := pctInicio
  else
    Result := pcPrimeiroUso;  
end;

procedure TPassaporte.SaveToDataset(D: TDataset);
var F : TField;
begin
  with D do begin
    F := FindField('Cliente');
    if F<>nil then F.AsInteger := pcCliente;

    F := FindField('TipoPass');
    if F<>nil then F.AsInteger := pcCodigo;

    F := FindField('Nome');
    if F<>nil then F.AsString := pcNome;

    F := FindField('Valor');
    if F<>nil then 
      F.AsCurrency := pcValor;

    FieldByName('TipoExp').AsInteger := pcTipoExp;
    FieldByName('TipoAcesso').AsInteger := pcTipoAcesso;
    
    F := FindField('Senha');
    if F<>nil then F.AsString := pcSenha;

    F := FindField('Expirou');
    if F<>nil then F.AsBoolean := pcExpirou;

    F := FindField('Valido');
    if F<>nil then F.AsBoolean := pcValido;
    
    FieldByName('ExpirarEm').AsDateTime := pcExpirarEm;

    F := FindField('PrimeiroUso');
    if F<>nil then F.AsDateTime := PrimeiroUso;

    FieldByName('MaxSegundos').AsInteger := pcMaxSegundos;

    F := FindField('Segundos');
    if F<>nil then F.AsInteger := pcSegundos;
    
    F := FindField('Acessos');
    if F<>nil then F.AsInteger := pcAcessos;
    
    FieldByName('Dia1').AsInteger := pcHorasValidas[1];
    FieldByName('Dia2').AsInteger := pcHorasValidas[2];
    FieldByName('Dia3').AsInteger := pcHorasValidas[3];
    FieldByName('Dia4').AsInteger := pcHorasValidas[4];
    FieldByName('Dia5').AsInteger := pcHorasValidas[5];
    FieldByName('Dia6').AsInteger := pcHorasValidas[6];
    FieldByName('Dia7').AsInteger := pcHorasValidas[7];
  end;
end;

procedure TPassaporte.SetHoraValida(D, H: Integer;
  const Value: Boolean);
begin
  pcHorasValidas[D] := SetBit(pcHorasValidas[D], BitsH[H], Value);
end;

procedure TPassaporte.LeStr(S: String);
var
  I : Integer;

function GetNextStr: String;
var P : Integer;
begin
  P := Pos('|', S);
  if P>0 then begin
    Result := Copy(S, 1, P-1);
    Delete(S, 1, P);
  end else begin
    Result := S;
    S := '';
  end;  
end;

begin
  pcNumero        := StrToIntDef(GetNextStr, 0);
  pcCliente       := StrToIntDef(GetNextStr, 0);
  pcTipoExp       := StrToIntDef(GetNextStr, 0);
  pcTipoAcesso    := StrToIntDef(GetNextStr, 0);
  pcExpirarEm     := StrParaData(GetNextStr);
  pcPrimeiroUso   := StrParaData(GetNextStr);
  pcExpirou       := (GetNextStr=BoolStr[True]);
  pcMaxSegundos   := StrToIntDef(GetNextStr, 0);
  pcSegundos      := StrToIntDef(GetNextStr, 0);
  pcAcessos       := StrToIntDef(GetNextStr, 0);
  pcSenha         := GetNextStr;
  pcValido        := (GetNextStr=BoolStr[True]);
  pcValor         := StrParaValor(GetNextStr);
  pctExpirou      := pcExpirou;
  pctUsadoMS      := 0;
  pctInicio       := 0;
  HorasValidasFromStr(S);
end;

function TPassaporte.TempoRestante(Agora: TDateTime): Cardinal;
begin
  if ((pcMaxSegundos=0) or ((pcSegundos+(pctUsadoMS div 1000))<pcMaxSegundos)) then
  begin
    if (pcMaxSegundos=0) then
      Result := High(Cardinal)
    else
      Result := (pcMaxSegundos*1000) - (pcSegundos*1000) - pctUsadoMS
  end else
    Result := 0;

  if (Agora<pctExpirar) then
    Result := MenorCardinal(DateTimeToTicks(pctExpirar-Agora), Result)
  else
    Result := 0;
end;

procedure TPassaporte.TotalizaUso;
begin
  AtualizaExpirou;
  pcExpirou := pctExpirou;
  if pctUsadoMS>0 then begin
    pcSegundos := pcSegundos + (pctUsadoMS div 1000);
    pcAcessos := pcAcessos + 1;
    pcPrimeiroUso := PrimeiroUso;
  end;  
end;

procedure TPassaporte.ZeraInicioUso;
begin
  pctInicioUso := 0;
end;

function TPassaporte.Igual(P: TPassaporte): Boolean;
begin
  Result := CompareMem(@Self, @P, SizeOf(P))
end;

function TPassaporte.GeraSenha: String;
begin
  Result := IntToHex(pcNumero+1000, 0)+Copy(GetMD5Str(IntToStr(pcNumero+1000)+'cyber'), 1, 4);
end;

procedure ObtemPassUsernameSenha(var Username, Senha: String);
var 
  U, S: String;
  I : Integer;
begin
  if Length(Username)>4 then begin
    S := Copy(Username, Length(Username)-3, 4);
    U := Copy(Username, 1, Length(Username)-4);
    I := StrToIntDef('$'+U, 0);
    if (I>1000) and (UpperCase(S)=Copy(GetMd5Str(IntToStr(I)+'cyber'), 1, 4)) then begin
      Senha := UpperCase(Username);
      Username := 'PREPAGO';
    end;
  end;    
end;

{ TPassaportes }

function TPassaportes.AbateCreditos(Agora: TDateTime; Tempo: Cardinal): Cardinal;
var
  Dia, H, M, S, MS: Word;
  Falta, Abater, Abateu: Cardinal;
  I: Integer;
begin
  DecodeTime(Agora, H, M, S, MS);
  Dia := DayOfWeek(Agora);

  Falta := DateTimeToTicks(Agora - (Trunc(Agora) + EncodeTime(H, 0, 0, 0)));
  Falta := (1000 * 60 * 60) - Falta;
  Result := 0;
//  Ordenar(Agora, H);
  if Count=0 then Exit;
  while Tempo>0 do begin
    Falta := MenorCardinal(Falta, Tempo);
    Abater := Falta;
    for I := 0 to Count-1 do
    if Abater > 0 then begin
      Abateu := Itens[I].ObtemTempo(Agora, Dia, H, Abater, False);
      Result := Result + Abateu;
      Abater := Abater - Abateu;
    end;
    Tempo := Tempo - Falta;
    Inc(H);
    if H=24 then begin
      Agora := Trunc(Agora)+1;
      H := 0;
    end else
      Agora := Trunc(Agora) + EncodeTime(H, 0, 0, 0);  
    Dia := DayOfWeek(Agora);
    Falta := 1000 * 60 * 60;
  end;  
end;

procedure TPassaportes.AddPassaporte(P: TPassaporte);
begin
  SetLength(Itens, Count+1);
  Itens[Count-1] := P;
end;

procedure TPassaportes.AjustaInicioExpirar(Inicio: TDateTime);
var I : Integer;
begin
  for I := 0 to Count-1 do
    Itens[I].AjustaInicioExpirar(Inicio);
end;

function TPassaportes.ContemPassaporte(aNumero: Integer): Boolean;
var I : Integer;
begin
  Result := True;
  for I := 0 to pred(Count) do 
  if Itens[I].pcNumero = aNumero then
    Exit;
  Result := False;  
end;

function TPassaportes.Count: Integer;
begin
  Result := Length(Itens);
end;

function TPassaportes.Igual(P: TPassaportes): Boolean;
var I : Integer;
begin
  Result := False;
  if Count<>P.Count then Exit;
  for I := 0 to Count-1 do
  if not Itens[I].Igual(P.Itens[I]) then Exit;
  Result := True;
end;

procedure TPassaportes.LeStr(S: String);
var
  SL : TStrings;
  I  : Integer;
begin
  SL := TStringList.Create;
  try
    SL.Text := S;
    SetLength(Itens, SL.Count);
    for I := 0 to SL.Count-1 do
      Itens[I].LeStr(SL[I]);
  finally
    SL.Free;
  end;
end;

procedure TPassaportes.Limpa;
begin
  SetLength(Itens, 0);
end;

function TPassaportes.ObtemStr: String;
var
  SL : TStrings;
  I  : Integer;
begin
  SL := TStringList.Create;
  try
    for I := 0 to Count-1 do
      SL.Add(Itens[I].ObtemStr);
    Result := SL.Text;  
  finally
    SL.Free;
  end;
end;

procedure TPassaportes.Ordenar(Data: TDateTime; H: Byte);
var 
  P : TPassaporte;
  A : TArrayPassaporte;
  I, Prox, Qtd : Integer;
  DS : Byte;

function MenorTempoRes: Integer;
var 
  Restam: Cardinal;
  x : Integer;
begin
  Result := -1;
  Restam := High(Cardinal);
  for x := 0 to Qtd-1 do with A[x] do 
  if (pcNumero<>-1) and ((pctTempoRes<Restam) or (Result=-1)) then begin
    Result := x;
    Restam := pctTempoRes;
  end;  
end;

begin
  Data := Trunc(Data) + EncodeTime(H, 0, 0, 0);
  if SData=Data then Exit;
  SData := Data;
  DS := DayOfWeek(SData);
  Qtd := Count;
  SetLength(A, Qtd);
  for I := 0 to Qtd-1 do with A[I] do begin
    A[I] := Itens[I];
    pctTempoRes := ObtemTempo(SData, DS, H, High(Cardinal), True);
    pctUsadoMS  := pctUsadoMS - pctTempoRes;
  end;  
  for I := 0 to Qtd-1 do begin
    Prox := MenorTempoRes;
    Itens[I] := A[Prox];
    A[Prox].pcNumero := -1;
  end;
end;

function TPassaportes.TempoUsadoTotal: Cardinal;
var I : Integer;
begin
  Result := 0;
  for I := 0 to Count-1 do Result := Result + Itens[I].pctUsadoMS;
end;

procedure TPassaportes.TotalizaUso;
var I : Integer;
begin
  for I := 0 to Count-1 do Itens[I].TotalizaUso;
end;

procedure TPassaportes.ZeraInicioUso;
var I : Integer;
begin
  for I  := 0 to Count - 1 do Itens[I].ZeraInicioUso;
end;

end.

TCMPausa
  Inicio   Ticks
  Duracao  Ticks

TCMArrayPausa : Array of TCMPausa;  
  
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
  Pausas       : TCMArrayPausa;
  
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
    FPassaportes      : TPassaportes;
    FPrePago          : Boolean;
   


Ordem de uso de pré-pago
1. Usar primeiro pre-pagos que expiram

Tipo de Crédito:
0 - Crédito de Tempo Pré-Determinado
1 - Crédito de Valor Pré-Determinado
2 - Crédito de Valor Pós-Determinado

