unit cmClassesBase;

interface 

uses
  Classes,
  CacheProp,
  ClasseCS,
  SysUtils,
  Messages,
  Windows,
  
  cmMsgCom,
  cmErros;

const
  NomeArqLicenca = 'cybermanager.lic';
  NomeArqLicencaAntigo = 'cmservidor.ini';
  
  mdDemo     = -1;
  mdLiberado = 0;
  MinCreditoLoginMS = 5000;

  // Tipos de Acesso
  taInternet          = 0;
  taVendaPacote       = 1;
  taCreditoTempo      = 2;
  taImpressao         = 3;
  taInternetImpressao = 4;
  taDebitoTempo       = 5;
  taSinal             = 6;

  // Modos de Pagamento
  mpgTelaPagtoAutomatica = 0;
  mpgDuploCliqueMaq      = 1;
  mpgSomenteTransacoes   = 2;

  StTipoAcesso : Array[0..6] of String = (
    'Internet', 
    'Pacote', 
    'Credito Tempo', 
    'Impressao', 
    'Internet + Impressao',
    'Debito Tempo',
    'Sinal');

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

type
  EErroCyberMgr = class(Exception)
  public
    CodigoErro: Integer;
    ErroSocket: Integer;
    constructor Create(CE: Integer);
  end;
  
  TCMServidorBase = class;
  
  TCMClasse       = class;
  TCMMaquina      = class;
  TCMCliente      = class;
  TCMUsuario      = class;
  TCMGrupo        = class;
  TCMTipoAcesso   = class;
  TCMCorPreco     = class;

  TCMListaCorPreco= class;
  TLicencaStr     = String[40];
  

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
    FPausarFimPacote       : Boolean;
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
    
  protected 
    function GetChave: Variant; override;
  public  
    function TipoClasse: Integer; override;
  
    constructor Create;
    function ChecaCores: Boolean;
  published
    property PermiteLoginSemCred: Boolean
      read FPermiteLoginSemCred write FPermiteLoginSemCred;
      
    property ProgramasPermitidos: String
      read FProgramasPermitidos write FProgramasPermitidos;
      
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

    property PausarFimPacote: Boolean
      read FPausarFimPacote write FPausarFimPacote;  

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
      
    property CorAguardaPagto: Integer
      read FCorAguardaPagto write FCorAguardaPagto;
      
    property CorFAguardaPagto: Integer
      read FCorFAguardaPagto write FCorFAguardaPagto;
      
    property CorManutencao: Integer
      read FCorManutencao write FCorManutencao;
      
    property CorFManutencao: Integer
      read FCorFManutencao write FCorFManutencao;
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
    procedure SetManutencao(const Value: Boolean);
    procedure SetCaixa(const Value: Integer);
    procedure SetUsuarioI(const Value: String);
  protected
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
    FManutencao       : Boolean;
    FUsuarioI         : String;
    FCaixa            : Integer;
    
    function GetChave: Variant; override;
    function ParadoAtual: Cardinal;
    function TotalParado: Cardinal;

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

    property Manutencao: Boolean
      read FManutencao write SetManutencao;  

    property UsuarioI: String
      read FUsuarioI write SetUsuarioI;

    property Caixa: Integer  
      read FCaixa write SetCaixa;
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
  protected 
    function GetCount: Integer; override;  
  public
    constructor Create;

    function NumConectados: Integer;

    property Itens[I: Integer]: TCMMaquina
      read GetMaquina; default;

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
    
    function SalvaStreamObj(Novo: Boolean; S: TStream): Integer; virtual; abstract;
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
                   
    procedure Logout(Cliente: Integer); virtual;
    procedure LogoutSocket(Socket: Integer); virtual;

    function EnviarEventos: Boolean;
  published
    property Ativo: Boolean
      read FAtivo write SetAtivo;  
  end; 

  TLicenca = object
  private
    function GetString: String;
    procedure SetString(const Value: String);
  public
    liDefinitiva : Boolean;
    liMaquinas   : Integer;
    liVencimento : TDateTime;
    liSenha      : String[8];
    liNumSerie   : Integer;

    procedure LeSerialHD;
    procedure AtualizaSenha;
    procedure SalvaArquivo(NomeArq: String);
    procedure SalvaArquivoPadrao;
    procedure LeArquivo(NomeArq: String);
    procedure LeArquivoPadrao;
    procedure Limpa;
    
    function SenhaCorreta: String;
    function SenhaAntiga: String;
    function SenhaOk: Boolean;

    function EmModoDemo: Boolean;
    function Expirou: Boolean;
    function Maquinas: Integer;

    property AsString: String
      read GetString write SetString;
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
                              var TempoCobrado: Cardinal; 
                              var CreditoUsado: Cardinal;
                              var Valor: Double);                         

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
                      Valor: Double): Cardinal;

  function ObtemCred(I: Integer): Cardinal;

  function DataBaseLic: TDateTime;
  function LimpaTraco(S: String): String;
  
                        
  var
    LicencaGlobal: TLicenca;
                
implementation

uses Graphics;

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

function DataBaseLic: TDateTime;
begin
  Result := EncodeDate(2003, 1, 1);
end;

function DateToDateLic(D: TDateTime): String;
begin
  if D<=DataBaseLic then
    Result := '0000'
  else
    Result := NumStr(Trunc(D-DataBaseLic), 4);  
end;

function TLicenca.GetString: String;
const DefinitivaSt : Array[Boolean] of Char = ('1', '2');
begin
  Result := DefinitivaSt[liDefinitiva] +
            NumStr(liMaquinas, 3) + '-' +
            DateToDateLic(liVencimento) + '-' +
            ZeroPad(Copy(liSenha, 1, 4), 4) + '-' +
            ZeroPad(Copy(liSenha, 5, 4), 4) + '-' +
            IntToHex(liNumSerie, 8);
end;

procedure TLicenca.SetString(const Value: String);
var S: String;
begin
  S := LimpaTraco(Value);
  liDefinitiva := (Copy(S, 1, 1)='2');
  liMaquinas   := StrToIntDef(Copy(S, 2, 3), 0);
  liVencimento := StrToIntDef(Copy(S, 5, 4), 0);
  if liVencimento>0 then liVencimento := liVencimento + DataBaseLic;
  liSenha      := Copy(S, 9, 8);
  S := Trim(Copy(S, 17, 50));
  if S>'' then
    liNumSerie   := StrToIntDef('$'+S, 0);
    
  if liNumSerie=0 then
    LeSerialHD;
end;

function TLicenca.SenhaAntiga: String;
begin
  if liDefinitiva then
    Result := Senha(0, liNumSerie, liMaquinas)
  else  
    Result := Senha(liVencimento, liNumSerie, liMaquinas);
end;

function TLicenca.SenhaCorreta: String;
begin
  if liDefinitiva then
    Result := Senha(liVencimento*2, liNumSerie, liMaquinas)
  else  
    Result := Senha(liVencimento, liNumSerie, liMaquinas);
end;

function TLicenca.SenhaOk: Boolean;
begin
  Result := (liNumSerie<>0) and (liSenha>'') and (SenhaCorreta=liSenha);
end;

procedure TLicenca.SalvaArquivo(NomeArq: String);
var SL: TStrings;
begin
  SL := TStringList.Create;
  try
    SL.Values['Licenca'] := AsString;
    SL.SaveToFile(NomeArq);
  except
  end;  
  SL.Free;
end;

procedure TLicenca.SalvaArquivoPadrao;
begin
  SalvaArquivo(ExtractFilePath(ParamStr(0))+NomeArqLicenca);
end;

procedure TLicenca.LeArquivo(NomeArq: String);
var SL: TStrings;
begin
  Limpa;
  SL := TStringList.Create;
  try
    SL.LoadFromFile(NomeArq);
  except
  end;  
  if SL.Values['Licenca']>'' then
    AsString := SL.Values['Licenca']
  else begin  
    liVencimento := StrToIntDef(SL.Values['Data'], 0);
    liDefinitiva := (Trunc(liVencimento)=0);
    liSenha      := SL.Values['Chave'];
    liMaquinas   := StrToIntDef(SL.Values['NumMaq'], 0);
  end;
  SL.Free;
end;

procedure TLicenca.Limpa;
begin
  liDefinitiva := False;
  liSenha := '';
  liMaquinas := 2;
  liVencimento := 0;
  LeSerialHD;
end;

procedure TLicenca.LeArquivoPadrao;
begin
  if FileExists(ExtractFilePath(ParamStr(0))+NomeArqLicenca) then
    LeArquivo(ExtractFilePath(ParamStr(0))+NomeArqLicenca)
  else 
  if FileExists(ExtractFilePath(ParamStr(0))+NomeArqLicencaAntigo) then
  begin
    LeArquivo(ExtractFilePath(ParamStr(0))+NomeArqLicencaAntigo);
    SalvaArquivoPadrao;
  end;  
end;

procedure TLicenca.LeSerialHD;
begin
  liNumSerie := StrToIntDef('$'+VolumeSerial(ParamStr(0)[1]), 0);
end;

procedure TLicenca.AtualizaSenha;
begin
  liSenha := SenhaCorreta;
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
  Result := (H * 60 * 60 * 1000) +
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
  
  FMenu             := '';
  FObsAcesso        := '';
  FRecursos         := '';
  FComputerName     := '';
  FAguardaPagto     := False;
  FManutencao       := False;
  FUsuarioI         := '';
  FCaixa            := 0;
  
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
begin
  Tempo  := NumTicks;
  
  CalculaTempoValor(FInicio, Tempo, FCreditoCli, TipoAcesso, HoraCor, Cores, PacTempoReal, TempoCobrado, CredUsado, Valor);
  
  if Isento then 
    Valor := 0
  else begin
    if FCreditoCli > Tempo then
      Tempo := FCreditoCli - Tempo
    else
      Tempo := Tempo - FCreditoCli;
  end;  
end;

function TCMMaquina.NumTicks: Cardinal;
var TP, TPP, IT : Cardinal;
begin
  TP := TotalParado;
  TPP := FTicksParadoPac;
  IT := FInicioTicks;
  if FimTicks>0 then
    Result := FimTicks
  else  
    Result := GetTickCount - (TP + TPP + IT); {FInicioTicks+TotalParado+FTicksParadoPac);}
  
  if (FCreditoCli > MinCreditoLoginMS) and 
     (not FLiberaAlemPacote) and 
     (Result > FCreditoCli) 
  then
    Result := FCreditoCli;
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
begin
  Result := (FCreditoCli>0) and 
            (not FLiberaAlemPacote) and
            (FCreditoCli<=NumTicks);
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
  

  FInicio           := 0;
  FTipoAcesso       := 0;
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

procedure TCMMaquina.SetManutencao(const Value: Boolean);
begin
  FManutencao := Value;
end;

procedure TCMMaquina.ZeraInfoAcesso;
begin
  Acesso := 0;
  Nome   := '';
  InicioTicks := 0;
  CreditoCli := 0;
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
end;

procedure TCMMaquina.SetCaixa(const Value: Integer);
begin
  FCaixa := Value;
end;

procedure TCMMaquina.SetUsuarioI(const Value: String);
begin
  FUsuarioI := Value;
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

procedure TCMServidorBase.SetAtivo(Valor: Boolean);
begin
  if not Valor then DesativaClientes;
  FAtivo := Valor;
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
  FPausarFimPacote     := True;
  FVariosTiposAcesso   := False; 
  FModoPagtoAcesso     := 0;
  FMostraPrePagoDec    := False;
  FMostraCliCadAntesAvulso := False;
  FProdutoImpressao    := '';
  FProgramasPermitidos := '';
  FJanelasExplorer     := '';
  FAutoExecutar        := '';
  FFecharProgramas     := False;
  FAutoExecutar        := '';
  FModulos             := '';
  FTiposLancExtra      := '';
  FFecharProgramas     := False;
  FAlertaFimTempo      := 0;
  FTempoMaxAlerta      := 0;
  FPermiteCapturaTela  := True;
  FLimiteTempoPadrao   := 0;
  FCorLivre            := clGreen;
  FCorFLivre           := clBlack;
  FCorUsoPrePago       := clRed;
  FCorFUsoPrePago      := clBlack;
  FCorUsoPosPago       := clRed;
  FCorFUsoPosPago      := clBlack;
  FCorPausado          := clYellow;
  FCorFPausado         := clBlack;
  FCorAguardaPagto     := clGray;
  FCorFAguardaPagto    := clWhite;
  FCorManutencao       := clBlack;
  FCorFManutencao      := clWhite;
end;

function TCMConfig.ChecaCores: Boolean;
begin
  Result := False;
  if FCorLivre = FCorFLivre then begin
    FCorLivre            := clGreen;
    FCorFLivre           := clBlack;
    Result := True;
  end;  
  
  if FCorUsoPrePago = FCorFUsoPrePago then begin
    FCorUsoPrePago       := clRed;
    FCorFUsoPrePago      := clBlack;
    Result := True;
  end;  
  
  if FCorUsoPosPago = FCorFUsoPosPago then begin
    FCorUsoPosPago       := clRed;
    FCorFUsoPosPago      := clBlack;
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
                    Valor: Double): Cardinal;
var 
  D, H  : Byte;
  T, InicioCor, InicioPreco, TempoCorrido : Cardinal;
  I, CorAI : Integer;
  ValorI : Double;
  RestoT : Extended;
  Resto  : Extended;
  Cor, CorA : TCMCorPreco;
  

procedure AtualizaDiaH;
var Hour, Min, Sec, MSec : Word;
begin
  D := DayOfWeek(Inicio);
  DecodeTime(Inicio, Hour, Min, Sec, MSec);
  H := Hour;
end;

procedure SomaValorCred(aTempo, aTol: Cardinal; aPreco: Double);
var RestoI: Integer;
begin
  if (aTempo=0) then begin
    Valor := 0;
    Exit;
  end;

  RestoT := RestoT + Resto;
  RestoI := Trunc(RestoT);
  if RestoI > 0 then begin                         
    aTempo := aTempo + RestoI;
    RestoT := RestoT - RestoI;
  end;  
  
  if (Valor-aPreco)>(-0.00001) then begin
    Result := Result + aTempo;
    Valor := Valor - aPreco;
  end else 
    Valor := 0;  

  Inicio := Inicio + TicksToDateTime(aTempo);
  AtualizaDiaH;
end;
  
begin
  Result := 0;
  if Valor<0.01 then 
    Exit;
  
  AtualizaDiaH;

  RestoT := 0;
  Resto := 0;
  ValorI := Valor;
  
  CorA := nil;
  I := -1;
  InicioCor := 0;
  InicioPreco := 0;

  while Valor > 0.000009 do begin
    if (CorA<>nil) and (CorAI=HoraCor[D, H]) then
      Cor := CorA
    else begin 
      CorAI := HoraCor[D, H];
      Cor := Cores.PorCor[TipoAcesso, CorAI];
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
      end else 
      {- Cor não mudou, checar preço}
      if ((Result-InicioPreco) >= Cor.FPrecos[I].prTempo) then begin
        if (I < High(Cor.FPrecos)) then begin
          Inc(I);
          InicioPreco := Result;
        end else  
        if (Length(Cor.FPrecos)>0) and Cor.Reinicia then 
          I := 0;  
      end;    
    end;  
    
    if (Cor<>nil) and (I>=0) then 
    with Cor.FPrecos[I] do begin
      CalcRestoTempo(prValor, prValorMin, prTempo, Resto, T);
      SomaValorCred(T, prTolerancia, prValorMin);
    end else
      Valor := 0;  
      
    CorA := Cor;
  end;  
end;                            

procedure CalculaTempoValor(Inicio: TDateTime; 
                            NumTicks, Credito: Cardinal; 
                            TipoAcesso: Word;
                            HoraCor: TCMHoraCor;
                            Cores: TCMListaCorPreco;
                            PacTempoReal: Boolean;
                            var TempoCobrado: Cardinal; 
                            var CreditoUsado: Cardinal;
                            var Valor: Double);                         
var 
  D, H  : Byte;
  
  T, 
  NumTicksI, 
  InicioCor, 
  InicioPreco, 
  TempoCorrido : Cardinal;
  
  I, CorAI : Integer;
  ValorI : Double;
  RestoT : Extended;
  Resto  : Extended;
  Cor, 
  CorA : TCMCorPreco;
  

procedure AtualizaDiaH;
var Hour, Min, Sec, MSec : Word;
begin
  D := DayOfWeek(Inicio);
  DecodeTime(Inicio, Hour, Min, Sec, MSec);
  H := Hour;
end;

procedure SomaValorCred(aTempo, aTol: Cardinal; aPreco: Double);
var RestoI: Integer;
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
  
  if Credito >= aTempo then begin
    if PacTempoReal and (NumTicks<aTempo) then
      Credito := Credito - NumTicks
    else  
      Credito := Credito - aTempo;
  end else 
  if NumTicks > Credito then begin
    Valor := Valor + aPreco;
    Credito := 0;
  end else
    Credito := Credito - NumTicks;

  if (NumTicks<=aTempo) or ((T>0) and (NumTicks<(aTempo+aTol))) then 
    NumTicks := 0
  else 
    NumTicks := NumTicks - aTempo;
  

  Inicio := Inicio + TicksToDateTime(aTempo);
  AtualizaDiaH;
end;
  
begin
  Valor := 0;
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
  

  while NumTicks > 50 do begin
    T := NumTicksI - NumTicks;
    
    if (CorA<>nil) and (CorAI=HoraCor[D, H]) then
      Cor := CorA
    else begin 
      CorAI := HoraCor[D, H];
      Cor := Cores.PorCor[TipoAcesso, CorAI];
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
          I := 0;  
      end;
    end;  
    
    if (Cor<>nil) and (I>=0) then 
    with Cor.FPrecos[I] do begin
      CalcRestoTempo(prValor, prValorMin, prTempo, Resto, T);
      SomaValorCred(T, prTolerancia, prValorMin);
    end else begin
      Valor := 0; 
      NumTicks := 0;
    end;   
      
    CorA := Cor;
  end;  
  CreditoUsado := CreditoUsado - Credito;  
  Valor := Arredonda(Valor);
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

function TLicenca.EmModoDemo: Boolean;
begin
  Result := (not SenhaOk) or Expirou;
end;

function TLicenca.Expirou: Boolean;
begin
  Result := SenhaOk and ((not liDefinitiva) and (Date>liVencimento));
end;

function TLicenca.Maquinas: Integer;
begin
  if EmModoDemo or Expirou then
    Result := 2
  else
    Result := liMaquinas;  
end;

end.


