unit ncCompCliente;
{
    ResourceString: Dario 12/03/13
}

interface

uses
  Classes,
  WinProcs,
  Messages,
  Windows,
  ncErros,                                  
  ncMsgCom,
  ncPassaportes,
  ncTarifador, 
  ncTran,
  ncSessao,
  ncEspecie,
  ClasseCS,
  SysUtils,
  ExtCtrls,
  kbmMemTable,
  kbmUtils,
  ncAppUrlLog,
  ncDebug,
  ncDebito,
  ncJob,
//  ncNetMsg, 
  ncCredTempo,
  ncMovEst,
  ncImpressao,
  ncLancExtra,
  ncDebTempo,
  ncTipoImp,
  ncPrintDoc,
  ncClassesBase;

type
  TMudouFundoEv = procedure (Desktop: Boolean) of object;

  THackTMClasse = class ( TncClasse );
  TClienteNexCafe = class;
  TEventoDespachoMC = procedure (var Msg: TMessage) of object;
  TEventoShutdown = procedure (Sender: TObject; Operacao: Byte) of object;
  TEventoSuporteRem = procedure (Sender: TObject; Maq, Tec: Word) of object;
  TEventoMonitorOnOff = procedure (Sender: TObject; aMaq: Word; aOn: Boolean) of object;
  
  TEventoTransfArq = procedure (Sender: Tobject; 
                                Etapa: Byte; 
                                MsgID, TamArq, Posicao: Integer;
                                NomeArq: String; 
                                Enviando: Boolean) of object;

  TEventoChat = procedure (Sender: TObject;
                           MsgID, De, Para: Integer;
                           DataHora: TDateTime;
                           Texto: String) of object;

  TEventoFinalizaProcesso = 
    procedure (Sender: TObject; ProcessID: Integer) of object;
    
  TEventoObtemProcessos = 
    procedure (Sender: TObject; IDCliente, Request: Integer) of object;

  TEventoSiteBloqueado =
    procedure (Sender: TObject; Adicionou: Boolean; URL: String) of object;  

  TEventoPedeTela = procedure (Sender: TObject; SessionID: Integer) of object;  

  TClienteNexCafe = class ( TComponent )
  private
    FHandle            : Integer;
    FWndHandle         : HWND;
    FServidor          : TncServidorBase;
    FAtivo             : Boolean;
    
    FMaquinas          : TncListaMaquinas;
    FUsuarios          : TncListaUsuarios;
    FSessoes           : TncSessoes;
    FJobs              : TncJobs;
    FPrintDocs         : TncPrintDocs;
    
    FCacheConexao      : Boolean;
    FAvisos            : TkbmMemTable;
    
    FUsername          : String;
    FSenha             : String;
    FMaquina           : Word;
    FFuncAtual         : Boolean;

    FMesmoCompServ     : Boolean;

    FUsuarioAtual      : TncUsuario;
    
    FAoAtivar          : TNotifyEvent;
    FAoDesativar       : TNotifyEvent;
    
    FAoDestruirMaquina : TNotifyEvent;
    FAoAtualizarMaquina: TNotifyEvent;

    FAoDestruirJob : TNotifyEvent;
    FAoAtualizarJob : TNotifyEvent;

    FAoAtualizarPrintDoc : TNotifyEvent;
    FAoDestruirPrintDoc : TNotifyEvent;

    FAoAtualizarEspecie : TNotifyEvent;
    FAoDestruirEspecie : TNotifyEvent;

    FAoAtualizarTipoAcesso : TNotifyEvent;
    FAoDestruirTipoAcesso  : TNotifyEvent;

    FAoAtualizarSessao     : TNotifyEvent;
    FAoDestruirSessao      : TNotifyEvent;

    FAoAtualizarTarifa   : TNotifyEvent;
    FAoDestruirTarifa    : TNotifyEvent;

    FAoDestruirUsuario : TNotifyEvent;
    FAoAtualizarUsuario: TNotifyEvent;

    FAoAtualizarTipoImp : TNotifyEvent;
    FAoDestruirTipoImp : TNotifyEvent;

    FAoReceberChat     : TEventoChat;

    FAoAtualizarConfig : TNotifyEvent;

    FAoPedirTela       : TEventoPedeTela;

    FAoAbrirFecharCx   : TNotifyEvent;

    FAoChecaLic        : TNotifyEvent;

    FAoDespacharMC     : TEventoDespachoMC;
    FAoTransferirArq   : TEventoTransfArq;

    FAoObtemProcessos  : TEventoObtemProcessos;
    FAoFinalizaProcesso: TEventoFinalizaProcesso;
    FAoBloquearSite    : TEventoSiteBloqueado;
    
    FShutdown          : TEventoShutdown;
    FSuporteRem        : TEventoSuporteRem;
    FMonitorOnOff      : TEventoMonitorOnOff;
    FNumMaq            : Integer;
    FAutoAtualizar     : Boolean;
    FAtualizouAgora    : Boolean;
    FTransferindoArq   : Byte; // 0=nenhum, 1=atualizacao, 2=desktop, 3=login
    FPrograma          : String;
    FArqDestino        : String;
    FVersao            : String;
    FArqDesktop        : String;
    FArqLogin          : String;
    FNovoDesktop       : String;
    FNovoLogin         : String;
    FPastaServ         : String;
    FArqEnviando       : String;
    FMudouFundo        : TMudouFundoEv;
    FTimerFundo        : TTimer;
    FSitesBloq         : TStrings;

    FAppUrlLog         : TncAppUrlLog;
    
    FLastExe           : String;
    FLastTit           : String;
    FLastUrl           : String;
    FAtivando          : Boolean;

    procedure SetAtivo(Valor: Boolean);
    procedure CriaWndHandle;
    procedure Notificacao(Obj: TncClasse; TipoNot: TTipoNotificacao);
    procedure SetServidor(Valor: TncServidorBase);
    procedure ChecaArqFundo;
    procedure AtivaTimerFundo;
    procedure OnTimerFundo(Sender: Tobject);
    procedure LimpaArqsFundo;
    function GetConfig: TncConfig;

    procedure ChecaErro(Erro: Integer);

    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    
    
  protected
    procedure Desativou; virtual;
    procedure Ativou; virtual;

    function Lista(TipoClasse: Integer): TListaClasseCS;

    function AchaObj(TipoClasse: Integer; Chave: Variant): TncClasse;
  
    procedure DespachaMC(var Msg: TMessage); virtual;
    
    procedure tcAtualizaObj(var Msg: TMessage);
              message ncmc_AtualizaObj;
              
    procedure tcNovoObj(var Msg: TMessage);
              message ncmc_NovoObj;
              
    procedure tcDestroiObj(var Msg: TMessage);
              message ncmc_DestroiObj;

    procedure tcServidorDesativado(var Msg: TMessage);
              message ncmc_ServidorDesativado;

    procedure tcPedeTela(var Msg: TMessage);
              message ncmc_CapturaTela;

    procedure tcShutdown(var Msg: TMessage);
              message ncmc_Shutdown;

    procedure tcSuporteRemEv(var Msg: TMessage);
              message ncmc_SuporteRemEv;

    procedure tcChatEv(var Msg: TMessage);
              message ncmc_ChatEv;

    procedure tcAbriuFechouCaixaEv(var Msg: TMessage);
              message ncmc_AbriuFechouCaixa;

    procedure tcFinalizaProcessoEv(var Msg: TMessage);
              message ncmc_FinalizaProcesso;

    procedure tcObtemProcessosEv(var Msg: TMessage);
              message ncmc_ObtemProcessos; 

    procedure tcSiteBloqueadoEv(var Msg: TMessage);
              message ncmc_SiteBloqueado;  

    procedure tcChecaLicEv(var Msg: TMessage);
              message ncmc_ChecaLicEv;

    procedure tcHorarioEv(var Msg: TMessage);
              message ncmc_HorarioEv;   

    procedure tcMonitorOnOffEv(var Msg: TMessage);
              message ncmc_MonitorOnOffEv;       

    procedure SetEventsNil;                
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure ProcessaMensagens;

    procedure SalvaSiteProgAtual(aExe, aTit, aUrl: String);
    procedure SalvaAppUrlLog;

    function Permitido(Usuario: TncUsuario; TipoAcesso: Integer): Boolean;
    
    procedure SalvaAlteracoesObj(Obj: TncClasse; Novo: Boolean);
    procedure ApagaObj(Obj: TncClasse);
    procedure ApagaMsgCli(aID: Integer); 
    procedure SalvaTela(SessionID: Integer; S: TMemoryStream);
    procedure CapturaTela(aMaq: Word);
    procedure MonitorOnOff(aMaq: Word; aOn: Boolean);
    procedure RefreshPrecosServidor;
    procedure RefreshEspera;
    procedure ShutdownMaq(aMaq, aOper: Word);
    procedure SuporteRem(aMaq, aTec: Word);

    procedure SalvaApp(aApp: String);

    procedure PrintDocControl(aInfo: TStrings);

    procedure DisableAD(aSessao: Integer; aDisable: Boolean);
    
    procedure BaixaAtualizacao(Programa, Versao, ArqDestino: String);
    procedure EnviaArqFundo(aFonte: String; aDesktop: Boolean);
    procedure LimpaFundo(aDesktop: Boolean);
    procedure SalvaSenhaCli(aContato: Integer; aSenha: String);
    function ObtemSenhaCli(aContato: Integer): String;
    procedure EnviaChat(const aPara: Integer; const aTexto: String);

    function AbrirCaixa(aSaldo: Currency): Integer;
    procedure FecharCaixa(aID: Integer; aSaldo: Currency);
    procedure CorrigeDataCaixa(aID: Integer; aNovaAbertura, aNovoFechamento: TDateTime);
    procedure AjustaPontosFid(aCliente: Integer; aFator: Smallint; aPontos: Double; aObs: String);

    procedure LoginMaq(aSessao: TncSessao);
    procedure SalvaCredTempo(aCredTempo: TncCredTempo);
    procedure AlteraSessao(aSessao: TncSessao);
    procedure ForceRefreshSessao(aSessao: Integer);
    procedure SalvaMovEst(aMovEst: TncMovEst);
    procedure SalvaDebito(aDebito: TncDebito);
    procedure SalvaLancExtra(aLE: TncLancExtra);
    procedure SalvaImpressao(aImpressao: TncImpressao);
    procedure SalvaDebTempo(aDebTempo: TncDebTempo);
    procedure SalvaLic(aConta, aChaves: String);

    function ObtemProcessos(aMaq: Integer): Integer;
    procedure FinalizaProcesso(aMaq, aProcessID: Integer);
    procedure SalvaProcessos(aIDCliente, aReq: Integer; aSL: TStrings);
    procedure PermitirDownload(aSessao: Integer; aExe, aPermitir: Boolean);
    procedure DesativarFWSessao(aSessao: Integer; aDesativar: Boolean);
    procedure DesktopSincronizado(aSessao: Integer);

    procedure LogoutMaq(aMaq: Word);

    procedure AdicionaPassaporte(aMaq: Word; aSenha: String);
    procedure PaginasImpressas(aJobID: Cardinal; aMaq: Word; aPaginas: Integer; aImp, aDoc: String);
    procedure PararMaq(aMaq: Word; aParar: Boolean);
    procedure TransferirMaq(aOrigem, aDestino: Word);
    procedure PreLogoutMaq(aMaq: Word);
    procedure CancLogoutMaq(aMaq: Word);
    procedure ModoManutencao(aMaq: Word; aEntrar: Boolean);
    procedure CancelaTran(aID: Integer; aFunc: String);

    procedure JobControl(aPrinterIndex: Integer; aJobID: Cardinal; aControl: Byte);
    procedure SalvaClientPages(aPrinter: String; aJobID: Cardinal; aMaq, aPaginas: Word);

    procedure ObtemPatrocinios(SL: TStrings);
    

    function CriaClasseCS(TipoClasse: Integer): TClasseCS;
    function CriaTipoAcesso(InsereLista: Boolean): TncTipoAcesso; virtual;
    function CriaMaquina(InsereLista: Boolean): TncMaquina; virtual;
    function CriaUsuario(InsereLista: Boolean): TncUsuario; virtual;
    function CriaTarifa(InsereLista: Boolean): TncTarifa; virtual;
    function CriaSessao(InsereLista: Boolean): TncSessao; virtual;
    function CriaJob(InsereLista: Boolean): TncJob; virtual;
    function CriaPrintDoc(InsereLista: Boolean): TncPrintDoc; virtual;
    function CriaTipoImp(InsereLista: Boolean): TncTipoImp; virtual;
    function CriaEspecie(InsereLista: Boolean): TncEspecie; virtual;

    property MesmoCompServ: Boolean
      read FmesmoCompServ;

    function MaquinaObj: TncMaquina;

    function SessaoMaq: TncSessao;

    property AtualizouAgora: Boolean read FAtualizouAgora;

    property UA: TncUsuario
      read FUsuarioAtual;

    property WndHandle: HWND 
      read FWndHandle;

    property Avisos: TkbmMemtable
      read FAvisos;  

    property Maquinas: TncListaMaquinas
      read FMaquinas; 

    property Usuarios: TncListaUsuarios
      read FUsuarios;

    property Sessoes: TncSessoes
      read FSessoes;  

    property Jobs: TncJobs
      read FJobs;

    property PrintDocs: TncPrintDocs
      read FPrintDocs;    

    property Handle: Integer
      read FHandle;  

    property AoDespacharMC: TEventoDespachoMC
      read FAoDespacharMC write FAoDespacharMC;

    property Config: TncConfig
      read GetConfig;  

    property NumMaq: Integer
      read FNumMaq;  

    property TransferindoArq: Byte
      read FTransferindoArq;

    property NomeArqDesktop: String
      read FArqDesktop;

    property NomeArqLogin: String
      read FArqLogin;    

    property SitesBloq : TStrings
      read FSitesBloq;  

    property AppUrlLog: TncAppUrlLog
      read FAppUrlLog;  
  published
    property Servidor: TncServidorBase
      read FServidor write SetServidor;

    property Ativo: Boolean
      read FAtivo write SetAtivo;  

    property Username: String
      read FUsername write FUsername;

    property Senha: String
      read FSenha write FSenha;    

    property Maquina: Word
      read FMaquina write FMaquina; 

    property FuncAtual: Boolean
      read FFuncAtual write FFuncAtual; 

    property AutoAtualizar: Boolean
      read FAutoAtualizar write FAutoAtualizar;   

    property Programa: String
      read FPrograma write FPrograma;

    property Versao: String
      read FVersao write FVersao;

    property ArqDestino: String
      read FArqDestino write FArqDestino;

    property CacheConexao: Boolean
      read FCacheConexao write FCacheConexao;

    property AoAtivar: TNotifyEvent
      read FAoAtivar write FAoAtivar;

    property AoDesativar: TNotifyEvent
      read FAoDesativar write FAoDesativar;    

    property AoDestruirJob: TNotifyEvent
      read FAoDestruirJob write FAoDestruirJob;

    property AoAtualizarJob: TNotifyEvent
      read FAoAtualizarJob write FAoAtualizarJob; 

    property AoDestruirPrintDoc: TNotifyEvent
      read FAoDestruirPrintDoc write FAoDestruirPrintDoc;

    property AoAtualizarPrintDoc: TNotifyEvent
      read FAoAtualizarPrintDoc write FAoAtualizarPrintDoc;    

    property AoDestruirEspecie: TNotifyEvent
       read FAoDestruirEspecie write FAoDestruirEspecie;

    property AoAtualizarEspecie: TNotifyEvent
       read FAoAtualizarEspecie write FAoAtualizarEspecie;  

    property AoDestruirMaquina: TNotifyEvent
      read FAoDestruirMaquina write FAoDestruirMaquina;
      
    property AoAtualizarMaquina: TNotifyEvent
      read FAoAtualizarMaquina write FAoAtualizarMaquina;

    property AoAtualizarSessao: TNotifyEvent
      read FAoAtualizarSessao write FAoAtualizarSessao;

    property AoDestruirSessao: TNotifyEvent
      read FAoDestruirSessao write FAoDestruirSessao;
      
    property AoDestruirTipoAcesso : TNotifyEvent
      read FAoDestruirTipoAcesso write FAoDestruirTipoAcesso;
      
    property AoAtualizarTipoAcesso : TNotifyEvent
      read FAoAtualizarTipoAcesso write FAoAtualizarTipoAcesso;

    property AoAbrirFecharCx: TNotifyEvent
      read FAoAbrirFecharCx write FAoAbrirFecharCx;   

    property AoDestruirTarifa : TNotifyEvent
      read FAoDestruirTarifa write FAoDestruirTarifa;
      
    property AoAtualizarTarifa : TNotifyEvent
      read FAoAtualizarTarifa write FAoAtualizarTarifa;

    property AoAtualizarConfig : TNotifyEvent
      read FAoAtualizarConfig write FAoAtualizarConfig;  
      
    property AoDestruirUsuario: TNotifyEvent
      read FAoDestruirUsuario write FAoDestruirUsuario;
        
    property AoAtualizarUsuario: TNotifyEvent
      read FAoAtualizarUsuario write FAoAtualizarUsuario;

    property AoAtualizarTipoImp: TNotifyEvent
      read FAoAtualizarTipoImp write FAoAtualizarTipoImp;

    property AoDestruirTipoImp: TNotifyEvent
      read FAoDestruirTipoImp write FAoDestruirTipoImp;  

    property AoPedirTela: TEventoPedeTela
      read FAoPedirTela write FAoPedirTela;  

    property AoReceberChat: TEventoChat
      read FAoReceberChat write FAoReceberChat;  

    property AoTransferirArq: TEventoTransfArq
      read FAoTransferirArq write FAoTransferirArq;
      
    property Shutdown: TEventoShutdown
      read FShutdown write FShutdown;  

    property AoSuporteRem: TEventoSuporteRem
      read FSuporteRem write FSuporteRem;

    property AoMonitorOnOff: TEventoMonitorOnOff
      read FMonitorOnOff write FMonitorOnOff;  

    property AoMudarFundo: TMudouFundoEv
      read FMudouFundo write FMudouFundo;

    property AoObtemProcessos: TEventoObtemProcessos
      read FAoObtemProcessos write FAoObtemProcessos;

    property AoFinalizaProcesso: TEventoFinalizaProcesso
      read FAoFinalizaProcesso write FAoFinalizaProcesso;

    property AoBloquearSite: TEventoSiteBloqueado
      read FAoBloquearSite write FAoBloquearSite; 

    property AoChecaLic: TNotifyEvent
      read FAoChecaLic write FAoChecaLic;   
  end;

  function ClienteCMWndFunc(hWindow : Hwnd; Msg : UINT;
                            wParam : WPARAM;
                            lParam : LPARAM) : LRESULT; stdcall export;
  
const
  NomeClasseClienteNC = 'TClienteNexCafe';  

  // Transferindo arquivo
  taNenhum      = 0;
  taAtualizacao = 1;
  taDesktop     = 2;
  taLogin       = 3;

var 
  Destruindo : Boolean = False;  
  
implementation

uses
  ncListaID, ncIDRecursos, uLicEXECryptor;

// START resource string wizard section
resourcestring
  SJáExisteUmaTransfênciaDeArquivoE = 'Já existe uma transfência de arquivo em andamento';
  STClienteNexCafeÉPrecisoInformarO = 'TClienteNexCafe: É preciso informar o servidor do NexCafé';

// END resource string wizard section


{ TClienteNexCafe }

constructor TClienteNexCafe.Create(AOwner: TComponent);
begin
  inherited;    
  FAtivando := False;                 
  FAtualizouAgora := False;
  
  Destruindo := False;
  FNumMaq        := 2;
  FCacheConexao  := False;

  FSitesBloq := TStringList.Create;
  FAppUrlLog := TncAppUrlLog.Create;
  
  FUsuarioAtual  := TncUsuario.Create;
  FTimerFundo    := TTimer.Create(nil);
  FTimerFundo.Interval := Random(5000);
  if FTimerFundo.Interval < 500 then
    FTimerFundo.Interval := FTimerFundo.Interval + 500;
    
  FTimerFundo.Enabled := False;
  FTimerFundo.OnTimer := OnTimerFundo;

  FMaquinas      := TncListaMaquinas.Create;
  FUsuarios      := TncListaUsuarios.Create;
  FSessoes       := TncSessoes.Create(tcSessao);
  FAvisos        := CreateMemTableAndFields(nil, Campos_Avisos);
  FJobs := TncJobs.Create(tcJob);
  FPrintDocs := TncPrintDocs.Create(tcPrintDoc);
  
  if not LadoServidor then begin
    THackTMClasse(gConfig).ProcNotificar := Notificacao;
  
  end;

  FMaquinas.CriaClasse := CriaClasseCS;
  FUsuarios.CriaClasse := CriaClasseCS;
  FSessoes.CriaClasse  := CriaClasseCS;
  FJobs.CriaClasse := CriaClasseCS;
  FPrintDocs.CriaClasse := CriaClasseCS;
  gEspecies.CriaClasse := CriaClasseCS;
  
  if not LadoServidor then begin
    gTiposAcesso.CriaClasse := CriaClasseCS;
    gTarifas.CriaClasse := CriaClasseCS;
    gTiposImp.CriaClasse := CriaClasseCS;
  end;

  FHandle      := 0;
  
  CriaWndHandle;
  
  FServidor        := nil;
  FAtivo           := False;
  FUsername        := '';
  FMaquina         := 0;
  FFuncAtual       := False;
  FAoAtualizarJob := nil;
  FAoDestruirJob := nil;

  FAoAtualizarPrintDoc := nil;
  FAoDestruirPrintDoc := nil;

  FAoAtualizarEspecie := nil;
  FAoDestruirEspecie := nil;

  FAoAtualizarTipoImp := nil;
  FAoDestruirTipoImp := nil;

  FAutoAtualizar   := False;
  FTransferindoArq := taNenhum;
  FPrograma        := '';
  FArqDestino      := '';
  FVersao          := '';
  FArqDesktop      := '';
  FArqLogin        := '';
  FNovoDesktop     := '';
  FNovoLogin       := '';
  FPastaServ       := '';

  SetEventsNil;
end;

destructor TClienteNexCafe.Destroy;
var I : Integer;
begin
  FAppUrlLog.Free;
  Destruindo := True;
  SetEventsNil;
  Destroying;
  SetAtivo(False);
  with gTiposAcesso do for I := 0 to Count-1 do THackTMClasse(Itens[I]).ProcNotificar := nil;
  with gTarifas do for I := 0 to Count-1 do THackTMClasse(Itens[I]).ProcNotificar := nil;
  with gTiposImp do for I := 0 to Count-1 do THackTMClasse(Itens[I]).ProcNotificar := nil;
  
  gTiposAcesso.Limpa;
  gTarifas.Limpa;
  gTiposImp.Limpa;
  
  DestroyWindow(FWndHandle);
  
  with FJobs do for I := 0 to Count-1 do THackTMClasse(Itens[I]).ProcNotificar := nil;
  with FPrintDocs do for I := 0 to Count-1 do THackTMClasse(Itens[I]).ProcNotificar := nil;
  with FSessoes do for I := 0 to Count-1 do THackTMClasse(Itens[I]).ProcNotificar := nil;
  with FMaquinas do for I := 0 to Count-1 do THackTMClasse(Itens[I]).ProcNotificar := nil;
  with FUsuarios do for I := 0 to Count-1 do THackTMClasse(Itens[I]).ProcNotificar := nil;
  with gEspecies do for I := 0 to Count - 1 do THackTMClasse(Itens[I]).ProcNotificar := nil;
                      
  
  FJobs.Free;
  FPrintDocs.Free;
  FSessoes.Free;
  FMaquinas.Free;
  FUsuarios.Free;
  FUsuarioAtual.Free;
  FAvisos.Free;
  FTimerFundo.Free;
  FSitesBloq.Free;
  inherited;
end;

procedure TClienteNexCafe.DisableAD(aSessao: Integer; aDisable: Boolean);
begin
  ChecaErro(Servidor.DisableAD(aSessao, aDisable));
end;

procedure TClienteNexCafe.EnviaArqFundo(aFonte: String; aDesktop: Boolean);
var S: String;
begin
  if FTransferindoArq<>taNenhum then
    Raise ENexCafe.Create(SJáExisteUmaTransfênciaDeArquivoE);
  if aDesktop then
    S := 'desktop_cliente_' // do not localize
  else   
    S := 'login_cliente_'; // do not localize
  S:= 'Dados\'+S+IntToStr(Random(High(Integer)))+ExtractFileExt(aFonte); // do not localize
  FArqEnviando := S;
  if aDesktop then
    FTransferindoArq := taDesktop else
    FTransferindoArq := taLogin;
  try  
    ChecaErro(Servidor.Upload(aFonte, S));
  finally
    FTransferindoArq := taNenhum;
    FArqEnviando := '';
  end;
  ChecaErro(Servidor.ArqFundoEnviado(S));
end;

procedure TClienteNexCafe.EnviaChat(const aPara: Integer;
  const aTexto: String);
begin
  ChecaErro(Servidor.EnviarMsg(Maquina, aPara, aTexto));
end;

procedure TClienteNexCafe.FecharCaixa(aID: Integer; aSaldo: Currency);
begin
  ChecaErro(Servidor.FechaCaixa(Username, aSaldo, aID));
end;

procedure TClienteNexCafe.FinalizaProcesso(aMaq, aProcessID: Integer);
begin
  ChecaErro(Servidor.FinalizaProcesso(aMaq, aProcessID));
end;

procedure TClienteNexCafe.ForceRefreshSessao(aSessao: Integer);
begin
  ChecaErro(Servidor.ForceRefreshSessao(aSessao));
end;

function TClienteNexCafe.GetConfig: TncConfig;
begin
  Result := gConfig;
end;

procedure TClienteNexCafe.JobControl(aPrinterIndex: Integer; aJobID: Cardinal; aControl: Byte);
begin
  ChecaErro(Servidor.JobControl(aPrinterIndex, aJobID, aControl))
end;

procedure TClienteNexCafe.DesativarFWSessao(aSessao: Integer;
  aDesativar: Boolean);
begin
  ChecaErro(Servidor.DesativarFWSessao(aSessao, aDesativar));
end;

procedure TClienteNexCafe.Desativou;
begin
  FTransferindoArq := taNenhum;
  FTimerFundo.Enabled := False;
  if not FCacheConexao then begin
    gTiposAcesso.Limpa;
    gTarifas.Limpa;
    gEspecies.Limpa;
    FUsuarios.Limpa;
    FSessoes.Limpa;
    FMaquinas.Limpa;
    FJobs.Limpa;
    FPrintDocs.Limpa;
    gTiposImp.Limpa;
  end;  
  FHandle := 0;
  if FAtivo then begin
    FAtivo := False;
    if Assigned(FAoDesativar) then
      FAoDesativar(Self);
  end;
end;

procedure TClienteNexCafe.DesktopSincronizado(aSessao: Integer);
begin
  ChecaErro(Servidor.DesktopSincronizado(aSessao));
end;

procedure TClienteNexCafe.SetAtivo(Valor: Boolean);
var 
  S : TMemoryStream;
  U : TncUsuario;
  I : Integer;
  Ver: Integer;
  Str: String;
begin
  if (Valor = FAtivo) or (FServidor=nil) then Exit;

  FTransferindoArq := taNenhum;
  FMesmoCompServ := False;

  if Valor then begin
    FAtivando := True;
    try
      if FServidor=nil then 
        Raise ENexCafe.Create(STClienteNexCafeÉPrecisoInformarO);
        
      DebugMsg('Ativando COMPCLIENT'); // do not localize
      if (not FServidor.Ativo) then begin
        DebugMsg('Servidor inativo ... Ativar'); // do not localize
        FServidor.Ativo := True;
        if not FServidor.Ativo then 
          Raise EErroNexCafe.Create(ncerrConexaoPerdida);
        DebugMsg('Conexão realizada');   // do not localize
      end else
        DebugMsg('Servidor já estava ativo.'); // do not localize
        
  
      if FAutoAtualizar and (not LadoServidor) then begin
        DebugMsg('Obter versão do NexGuard disponível no servidor'); // do not localize
        ChecaErro(FServidor.ObtemVersaoGuard(Ver));
        DebugMsg('Versão disponível no servidor x'+IntToStr(Ver)+' versão atual no client ' + FVersao); // do not localize
        if (Ver>0) and (Ver<>GetVersionBuild(FVersao)) then begin
          DebugMsg('Baixando nova versão'); // do not localize
          FTransferindoArq := taAtualizacao;
          try
            FArqDestino := ExtractFilePath(ParamStr(0))+'nexguard_x'+IntToStr(Ver)+'.tmp'; // do not localize
            if FileExists(FArqDestino) then DeleteFile(FArqDestino);
            
            ChecaErro(FServidor.Download('Atualiza\NexGuard.exe', FArqDestino)); // do not localize
            FAtualizouAgora := True;
            if FAtualizouAgora then Exit;
          finally
            FTransferindoArq := taNenhum;
          end;
        end;
      end; 
      
      DebugMsg('Conectado ao servidor'); // do not localize
      ChecaErro(FServidor.Login(FUsername, FSenha, FMaquina, FFuncAtual, False, FWndHandle, 0, 0, 0, '', FHandle));  
      DebugMsg('Login da máquina OK'); // do not localize

      FMesmoCompServ := (FindWindow('TncServBaseClassName', nil)<>0); // do not localize
        
      try
        S := TMemoryStream.Create;
        try
          if not LadoServidor then begin
            DebugMsg('Obter config...'); // do not localize
            ChecaErro(FServidor.ObtemStreamConfig(S));
            DebugMsg('Config obtido com sucesso'); // do not localize
            gConfig.LeStream(S);
            gConfig.Conta := gConfig.Conta;
            S.Clear;
          end;
          
          DebugMsg('Obtem lista de máquinas ...'); // do not localize
          ChecaErro(FServidor.ObtemStreamListaObj(FHandle, tcMaquina, S));
          DebugMsg('Lista de máquinas OK'); // do not localize
          S.Position := 0;
          FMaquinas.LeStream(S);
          S.Clear;
  
          if not LadoServidor then begin
            DebugMsg('Tipos de Acesso ...'); // do not localize
            ChecaErro(FServidor.ObtemStreamListaObj(FHandle, tcTipoAcesso, S));
            DebugMsg('Tipos de Acesso OK - S.Size: '+IntToStr(S.Size)); // do not localize
            S.Position := 0;
            DebugMsg('S.Position := 0'); // do not localize
            try
              gTiposAcesso.LeStream(S);
            except 
              on E: Exception do 
                DebugMsg('gTiposAcesso.LeStream - Exception: ' + E.Message); // do not localize
            end;
            DebugMsg('S.LeStream'); // do not localize
            S.Clear;
            
            DebugMsg('Tarifas ...'); // do not localize
            ChecaErro(FServidor.ObtemStreamListaObj(FHandle, tcTarifa, S));
            DebugMsg('Tarifas OK'); // do not localize
            S.Position := 0;
            gTarifas.LeStream(S);
            S.Clear; 

            DebugMsg('TiposImp ...'); // do not localize
            ChecaErro(FServidor.ObtemStreamListaObj(FHandle, tcTipoImp, S));
            DebugMsg('TiposImp OK'); // do not localize
            S.Position := 0;
            gTiposImp.LeStream(S);
            S.Clear;
          end;
          
          DebugMsg('Usuarios ...'); // do not localize
          ChecaErro(FServidor.ObtemStreamListaObj(FHandle, tcUsuario, S));
          DebugMsg('Usuarios OK'); // do not localize
          S.Position := 0;
          FUsuarios.LeStream(S);
          S.Clear;
  
          DebugMsg('Sessoes ...'); // do not localize
          ChecaErro(FServidor.ObtemStreamListaObj(FHandle, tcSessao, S));
          DebugMsg('Sessoes OK'); // do not localize
          S.Position := 0;
          FSessoes.LeStream(S);
          S.Clear;

          DebugMsg('Jobs ...'); // do not localize
          ChecaErro(FServidor.ObtemStreamListaObj(FHandle, tcJob, S));
          DebugMsg('Jobs OK'); // do not localize
          S.Position := 0;
          FJobs.LeStream(S);
          S.Clear;

          DebugMsg('PrintDocs ...'); // do not localize
          ChecaErro(FServidor.ObtemStreamListaObj(FHandle, tcPrintDoc, S));
          DebugMsg('PrintDocs OK'); // do not localize
          S.Position := 0;
          FPrintDocs.LeStream(S);
          S.Clear;

          DebugMsg('Especies ...'); // do not localize
          ChecaErro(FServidor.ObtemStreamListaObj(FHandle, tcEspecie, S));
          DebugMsg('Especies OK'); // do not localize
          S.Position := 0;
          gEspecies.LeStream(S);
          S.Clear;
          
          DebugMsg('Avisos ...'); // do not localize
          ChecaErro(FServidor.ObtemStreamAvisos(S));
          DebugMsg('Avisos OK'); // do not localize
          S.Position := 0;
          FAvisos.LoadFromStreamViaFormat(S, FAvisos.AllDataFormat);
          FAvisos.First;
  
          DebugMsg('Obtem pasta servidor ...'); // do not localize
          ChecaErro(FServidor.ObtemPastaServ(FPastaServ));
          DebugMsg('Pasta servidor OK'); // do not localize
  
{          Str := '';
          DebugMsg('Sites bloqueados ...');
          ChecaErro(FServidor.ObtemSitesBloqueados(Str));
          DebugMsg('Sites bloqueados OK');
          FSitesBloq.Text := Str;}
  
          FNovoDesktop := gConfig.NomeArqDesktop;
          DebugMsg('TClienteNexCafe - SetAtivo - FNovoDesktop = ' + FNovoDesktop); // do not localize
          FNovoLogin := gConfig.NomeArqLogin;
          DebugMsg('TClienteNexCafe - SetAtivo - FNovoLogin = ' + FNovoLogin); // do not localize
          LimpaArqsFundo;
          ChecaArqFundo;
          DebugMsg('COMPCLIENTE ATIVADO com sucesso!'); // do not localize
        finally 
          S.Free;
        end;    
        FAtivo := True;
        Ativou;
      except
        on E: Exception do begin
          if FServidor.Ativo then       
            FServidor.Ativo := False;
          FHandle := 0;  
          Desativou;
          DebugMsg('TClienteNexCafe.SetAtivo(True) - Exception: ' + E.Message); // do not localize
          Raise;
        end;
      end
    finally
      FAtivando := False;
    end;
  end else begin
    if Assigned(FServidor) then 
      FServidor.Logout(FHandle); 
    Desativou;   
  end;
  U := FUsuarios.PorUsername[FUsername];
  
  if U <> nil then begin
    with U do begin
      FUsuarioAtual.Username := Username;
      FUsuarioAtual.Senha    := Senha;
      FUsuarioAtual.Admin    := Admin;
      FUsuarioAtual.Direitos := Direitos;
      FUsuarioAtual.Nome     := Nome;
    end;  
  end else begin
    FUsuarioAtual.Username := '';
    FUsuarioAtual.Senha    := '';
    FUsuarioAtual.Admin    := False;
    FUsuarioAtual.Direitos := '';
    FUsuarioAtual.Nome     := '';
  end;
end;

function TClienteNexCafe.CriaTipoAcesso(InsereLista: Boolean): TncTipoAcesso;
begin
  if not LadoServidor then begin
    Result := TncTipoAcesso.Create;
    THackTMClasse(Result).ProcNotificar := Notificacao;
    if InsereLista then 
      gTiposAcesso.Add(Result);
  end else
    Result := nil;
end;

function TClienteNexCafe.CriaTipoImp(InsereLista: Boolean): TncTipoImp;
begin
  Result := TncTipoImp.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then 
    gTiposImp.Add(Result);
end;

function TClienteNexCafe.CriaTarifa(InsereLista: Boolean): TncTarifa;
begin
  if not LadoServidor then begin
    Result := TncTarifa.Create;
    THackTMClasse(Result).ProcNotificar := Notificacao;
    if InsereLista then
      gTarifas.Add(Result);
  end else
    Result := nil;
end;

function TClienteNexCafe.CriaMaquina(InsereLista: Boolean): TncMaquina;
begin
  Result := TncMaquina.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then 
    FMaquinas.Add(Result);
end;

function TClienteNexCafe.CriaUsuario(InsereLista: Boolean): TncUsuario; 
begin
  Result := TncUsuario.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then 
    FUsuarios.Add(Result);
end;

function TClienteNexCafe.CriaSessao(InsereLista: Boolean): TncSessao;  
begin
  Result := TncSessao.Create(True);
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then 
    FSessoes.Add(Result);
end;

function TClienteNexCafe.CriaClasseCS(TipoClasse: Integer): TClasseCS;
begin
  case TipoClasse of
    tcMaquina : Result := CriaMaquina(False);
    tcUsuario : Result := CriaUsuario(False);
    tcSessao  : Result := CriaSessao(False);
    tcTipoAcesso : Result := CriaTipoAcesso(False);
    tcTarifa   : Result := CriaTarifa(False);
    tcJob : Result := CriaJob(False);
    tcPrintDoc : Result := CriaPrintDoc(False);
    tcTipoImp : Result := CriaTipoImp(False);
    tcEspecie : Result := CriaEspecie(False);
  else
    Result := nil;  
  end;
end;

function TClienteNexCafe.CriaEspecie(InsereLista: Boolean): TncEspecie;
begin
  Result := TncEspecie.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then
    gEspecies.Add(Result);
end;

function TClienteNexCafe.CriaJob(InsereLista: Boolean): TncJob;
begin
  Result := TncJob.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then 
    FJobs.Add(Result);
end;

function TClienteNexCafe.CriaPrintDoc(InsereLista: Boolean): TncPrintDoc;
begin
  Result := TncPrintDoc.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then 
    FPrintDocs.Add(Result);
end;

procedure TClienteNexCafe.Notificacao(Obj: TncClasse;
  TipoNot: TTipoNotificacao);
begin
  if Destruindo then Exit;
  if csDestroying in ComponentState then Exit;
  case TipoNot of
    tnAlteracao :
    case Obj.TipoClasse of
      tcMaquina :
        if Assigned(FAoAtualizarMaquina) then FAoAtualizarMaquina(Obj); 
      tcUsuario : begin
        if UA.Username = TncUsuario(Obj).Username then
          UA.Assign(Obj);
        if Assigned(FAoAtualizarUsuario) then FAoAtualizarUsuario(Obj);
      end;
      tcSessao :
        if Assigned(FAoAtualizarSessao) then FAoAtualizarSessao(Obj);  
      tcJob :
        if Assigned(FAoAtualizarJob) then FAoAtualizarJob(Obj);
      tcPrintDoc :
        if Assigned(FAoAtualizarPrintDoc) then FAoAtualizarPrintDoc(Obj);
      tcEspecie :
        if Assigned(FAoAtualizarEspecie) then FAoAtualizarEspecie(Obj);
      tcTipoImp : 
        if Assigned(FAoAtualizarTipoImp) then FAoAtualizarTipoImp(Obj);
      tcTipoAcesso : 
        if Assigned(FAoAtualizarTipoAcesso) then FAoAtualizarTipoAcesso(Obj);  
      tcTarifa:
        if Assigned(FAoAtualizarTarifa) then FAoAtualizarTarifa(Obj);
      tcConfig : begin
        FNovoDesktop := TncConfig(Obj).NomeArqDesktop;
        FNovoLogin := TncConfig(Obj).NomeArqLogin;
        try
          ChecaArqFundo;
        finally
          if Assigned(FAoAtualizarConfig) then FAoAtualizarConfig(Obj);
        end;
      end;
    end;
    
    tnDestruicao :
    case Obj.TipoClasse of
      tcMaquina : 
      begin
//        FMaquinas.Remove(Obj);
        DebugMsg('Notificacao - tcMaquina - ' + IntToStr(TncMaquina(Obj).Numero)); // do not localize
        try
          if Assigned(FAoDestruirMaquina) then FAoDestruirMaquina(Obj);
        finally
          FMaquinas.Remove(Obj);
        end;
      end;
      tcJob : 
      begin
        FJobs.Remove(Obj);
        if Assigned(FAoDestruirJob) then FAoDestruirJob(Obj);
      end;
      tcEspecie : 
      begin
        gEspecies.Remove(Obj);
        if Assigned(FAoDestruirEspecie) then FAoDestruirEspecie(Obj);
      end;
      tcPrintDoc : 
      begin
        FPrintDocs.Remove(Obj);
        if Assigned(FAoDestruirPrintDoc) then FAoDestruirPrintDoc(Obj);
      end;
      tcTipoImp : begin
        if not LadoServidor then gTiposImp.Remove(Obj);
        if Assigned(FAoDestruirTipoImp) then FAoDestruirTipoImp(Obj);
      end;
      tcSessao : 
      begin
        DebugMsg('Notificacao - tcSessao - ID: ' + IntToStr(TncSessao(Obj).ID) + ' - Maq: ' + IntToStr(TncSessao(Obj).Maq)); // do not localize
        FSessoes.Remove(Obj);
        if Assigned(FAoDestruirSessao) then FAoDestruirSessao(Obj);
      end;
      tcTipoAcesso : 
      begin
        if not LadoServidor then gTiposAcesso.Remove(Obj);
        if Assigned(FAoDestruirTipoAcesso) then FAoDestruirTipoAcesso(Obj);
      end;
      tcTarifa :
      begin
        if not LadoServidor then gTarifas.Remove(Obj);
        if Assigned(FAoDestruirTarifa) then FAoDestruirTarifa(Obj);
      end;
      tcUsuario : begin
        FUsuarios.Remove(Obj);
        if Assigned(FAoDestruirUsuario) then FAoDestruirUsuario(Obj);
      end;
    end;  
  end;
end;

procedure TClienteNexCafe.Notification(AComponent: TComponent;
  Operation: TOperation);
var S: String;  
begin
  inherited;
  S := AComponent.ClassName;
  if S='joao' then AComponent.FreeNotification(nil); // do not localize

  if AComponent=FServidor then begin
    if Operation=opRemove then begin
      FServidor := nil;
      FAtivo := False;
    end;
  end;
end;

procedure TClienteNexCafe.ObtemPatrocinios(SL: TStrings);
begin
  ChecaErro(Servidor.ObtemPatrocinios(SL));
end;

function TClienteNexCafe.ObtemProcessos(aMaq: Integer): Integer;
begin
  Result := Random(High(Integer));
  ChecaErro(Servidor.ObtemProcessos(aMaq, Handle, Result));
end;

function TClienteNexCafe.ObtemSenhaCli(aContato: Integer): String;
begin
  ChecaErro(Servidor.ObtemSenhaCli(aContato, Result));
end;

procedure TClienteNexCafe.OnTimerFundo(Sender: Tobject);
begin
  if FTransferindoArq<>taNenhum then Exit;
  DebugMsg('OnTimerFundo 1'); // do not localize
  AtivaTimerFundo;
  if FTimerFundo.Enabled then begin
    if (FNovoDesktop<>'') and (not SameText(FNovoDesktop, FArqDesktop)) then
    begin
      DebugMsg('Download desktop: ' + FNovoDesktop); // do not localize
      FTransferindoArq := taDesktop;
      try
        FServidor.Download('DADOS\'+ExtractFileName(FNovoDesktop), FNovoDesktop); // do not localize
      finally
        FTransferindoArq := taNenhum;
      end;
      ChecaArqFundo;
    end else
    if (FNovoLogin<>'') and (not SameText(FNovoLogin, FArqLogin)) then
    begin
      DebugMsg('Download login: ' + FNovoLogin); // do not localize
      FTransferindoArq := taLogin;
      try
        FServidor.Download('DADOS\'+ExtractFileName(FNovoLogin), FNovoLogin); // do not localize
      finally
        FTransferindoArq := taNenhum;
      end;
      ChecaArqFundo;
    end;
  end;
end;

procedure TClienteNexCafe.CriaWndHandle;
var XClass : TWndClass;
begin
  XClass.hInstance := HInstance;
  with XClass do begin
    Style         := 0;
    lpfnWndProc   := @ClienteCMWndFunc;
    cbClsExtra    := 0;
    cbWndExtra    := SizeOf(Pointer);
    hIcon         := LoadIcon(hInstance, 'DEFICON'); // do not localize
    hCursor       := LoadCursor(0, idc_Arrow);
    hbrBackground := 0;
    lpszMenuName  := nil;
    lpszClassName := NomeClasseClienteNC;
  end;
  WinProcs.RegisterClass(XClass);

  FWndHandle :=
    CreateWindow(NomeClasseClienteNC,     {window class name}
                 '',                     {caption}
                 0,                      {window style}
                 0,                      {X}
                 0,                      {Y}
                 1,                      {width}
                 1,                      {height}
                 0,                      {parent}
                 0,                      {menu}
                 HInstance,              {instance}
                 nil);                   {parameter}
                 
  SetWindowLong(FWndHandle, 0, Longint(Self));
end;

function ClienteCMWndFunc(hWindow : Hwnd; Msg : UINT;
                          wParam : WPARAM;
                          lParam : LPARAM) : LRESULT; stdcall export;
var
  Obj : TClienteNexCafe;
  M   : TMessage;
  
  function DefWndFunc : LongInt;
  begin
    DefWndFunc := DefWindowProc(hWindow, Msg, wParam, lParam);
  end;

begin
  Result := 0;
  Obj := nil;

  DebugMsg('ClienteCMWndFunc - HWND: ' + IntToStr(hWindow) + ' - Msg: ' + IntToStr(Msg) + ' - wParam: ' + IntToStr(wParam) + ' - lParam: ' + IntToStr(lParam)); // do not localize

  if MSG<>wm_Create then begin
    Obj := TClienteNexCafe(GetWindowLong(hWindow, 0));
    if Obj=nil then begin 
      Result := DefWndFunc;
      DebugMsg('ClienteCMWndFunc - Obj = nil'); // do not localize
      Exit;
    end;
  end;

  case Msg of
    ncmc_Primeira..ncmc_Ultima : 
    begin
      M.Msg := Msg;
      M.WParam := WParam;
      M.LParam := LParam;
      DebugMsg('ClienteCMWndFunc - Obj.DespachaMC'); // do not localize
      Obj.DespachaMC(M);
    end;
    
  else 
    DebugMsg('ClienteCMWndFunc - DefWndFunc'); // do not localize
    Result := DefWndFunc;
  end;
end;

function TClienteNexCafe.Lista(TipoClasse: Integer): TListaClasseCS;
begin
  case TipoClasse of
    tcMaquina : Result := FMaquinas;
    tcUsuario : Result := FUsuarios;
    tcTipoAcesso : Result := gTiposAcesso;
    tcTarifa : Result := gTarifas;
    tcSessao : Result := FSessoes;
    tcJob : Result := FJobs;
    tcPrintDoc : Result := FPrintDocs;
    tcEspecie : Result := gEspecies;
    tcTipoImp : Result := gTiposImp;
  else  
    Result := nil;
  end;
end;  

function TClienteNexCafe.AbrirCaixa(aSaldo: Currency): Integer;
begin
  ChecaErro(Servidor.AbreCaixa(Username, aSaldo, Result));
end;

function TClienteNexCafe.AchaObj(TipoClasse: Integer; Chave: Variant): TncClasse;
var L: TListaClasseCS;
begin
  L := Lista(TipoClasse);
  if L <> nil then
    Result := TncClasse(L.ItemPorChave[Chave])
  else
    Result := nil;  
end;  

procedure TClienteNexCafe.tcAbriuFechouCaixaEv(var Msg: TMessage);
begin
  DebugMsg('TClienteNexCafe.tcAbriuFechouCaixaEv'); // do not localize
  if Assigned(FAoAbrirFecharCx) then
    FAoAbrirFecharCx(Self);
end;

procedure TClienteNexCafe.tcAtualizaObj(var Msg: TMessage);
var 
  S : TStream;
  TipoClasse, I : Integer;
  Chave : String;
  T : Byte;
  Obj : TncClasse;
  L : TListaClasseCS;
begin
  S := TStream(Msg.lParam);

  DebugMsg('TClienteNexCafe.tcAtualizaObj - 1'); // do not localize

  S.Position := 0;
  S.Read(TipoClasse, SizeOf(TipoClasse));
  S.Read(T, SizeOf(T));
  SetString(Chave, PChar(nil), T);
  S.Read(Pointer(Chave)^, T);

  DebugMsg('TClienteNexCafe.tcAtualizaObj - TipoClasse: '+IntToStr(TipoClasse)+' - Chave: ' + Chave); // do not localize

  if (TipoClasse in [tcTipoAcesso, tcTarifa, tcTipoImp]) and LadoServidor then Exit;
  
  if TipoClasse=tcConfig then begin
    DebugMsg('TClienteNexCafe.tcAtualizaObj.TipoClasse=tcConfig'); // do not localize
    
    if not LadoServidor then begin
      gConfig.LeStream(S);
      gConfig.Notificar(tnAlteracao);
    end;
  end else begin
    DebugMsg('TClienteNexCafe.tcAtualizaObj - 3'); // do not localize
  
    L := Lista(TipoClasse);
    if L = nil then Exit;
    Obj := TncClasse(L.ItemPorChave[Chave]);

    if Obj = nil then begin
      Obj := TncClasse(CriaClasseCS(TipoClasse));
      L.Add(Obj);
    end;

    if Obj <> nil then begin
      Obj.LeStream(S);
      Obj.Notificar(tnAlteracao);
    end;
  end;  
end;

procedure TClienteNexCafe.tcChatEv(var Msg: TMessage);
var 
  S: TStream;
  SL: TStrings;
  DataHora: TDateTime;
  De, Para, ID: Integer;
begin
  DebugMsg('TClienteNexCafe.tcChatEv - 1'); // do not localize

  if not Assigned(FAoReceberChat) then Exit;

  DebugMsg('TClienteNexCafe.tcChatEv - 2'); // do not localize
  
  S := TStream(Msg.lParam);
  S.Position := 0;
  SL := TStringList.Create;
  try
    SL.LoadFromStream(S);
    DataHora := StrToDateTimeDef(SL.Values['datahora'], Now);  // do not localize
    De := StrToInt(SL.Values['de']); // do not localize
    Para := StrToInt(SL.Values['para']); // do not localize
    ID := StrToInt(SL.Values['id']); // do not localize
    SL.Delete(0);
    SL.Delete(0);
    SL.Delete(0);
    SL.Delete(0);
    DebugMsg('TClienteNexCafe.tcChatEv - Para: ' + IntToStr(Para)); // do not localize
    
    if (De=Maquina) or (Para=Maquina) or (Para=-1) then
      FAoReceberChat(Self, ID, De, Para, DataHora, SL.Text);
  finally
    SL.Free;
  end;
end;

procedure TClienteNexCafe.tcChecaLicEv(var Msg: TMessage);
begin
  if Assigned(FAoChecaLic) then
    FAoChecaLic(Self);
end;

procedure TClienteNexCafe.tcDestroiObj(var Msg: TMessage);
var 
  TipoClasse : Integer;
  Chave: Variant;
  Obj : TncClasse;
begin
  DebugMsg('TClienteNexCafe.tcDestroiObj - 1'); // do not localize
  TipoClasse := PmsgDestroiObj(Msg.LParam)^.msgTipoClasse;
  if (TipoClasse in [tcTipoAcesso, tcTarifa]) and LadoServidor then Exit;
  Chave      := PmsgDestroiObj(Msg.LParam)^.msgChave;
  Obj := AchaObj(TipoClasse, Chave);
  if Obj <> nil then begin
    DebugMsg('TClienteNexCafe.tcDestroiObj - 2'); // do not localize
    DebugMsg('tcDestrouObj - TipoClasse = ' + IntToStr(TipoClasse) + ' - Chave = ' + Chave); // do not localize
    Obj.Free;
  end;
end;

procedure TClienteNexCafe.tcFinalizaProcessoEv(var Msg: TMessage);
var 
  aMaq: Word;
  aProcID : Integer;
begin
  with PmsgFinalizaProcesso(Msg.lParam)^ do begin  
    DebugMsg('TClienteNexCafe.tcFinalizaProcessoEv - ' + IntToStr(aMaq)); // do not localize
    aMaq := msgMaq;
    aProcID := msgProcessID;
    if (aMaq=FMaquina) and Assigned(FAoFinalizaProcesso) then
      FAoFinalizaProcesso(Self, aProcID);
  end;
end;


function IsNT: boolean;
begin
  result:= Win32Platform=VER_PLATFORM_WIN32_NT;
end;

function SetPrivilege(sPrivilegeName: string; bEnabled: boolean): boolean;
var TPPrev, TP: TTokenPrivileges;
    Token: THandle;
    dwRetLen: DWord;
begin
  result:= false;
  OpenProcessToken( GetCurrentProcess,
                    TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, Token);
  TP.PrivilegeCount:= 1;
  if LookupPrivilegeValue(nil, pChar(sPrivilegeName), TP.Privileges[0].LUID) then
  begin
    if bEnabled
      then TP.Privileges[0].Attributes:= SE_PRIVILEGE_ENABLED
      else TP.Privileges[0].Attributes:= 0;
    dwRetLen:= 0;
    result:= AdjustTokenPrivileges(Token, false, TP, 0, TPPrev, dwRetLen);
  end;
  CloseHandle(Token);
end;

procedure EnableAllPrivileges;
type TTokenPrivileges = record
       PrivilegeCount : dword;
       Privileges     : array [0..maxInt shr 4 - 1] of TLUIDAndAttributes;
     end;
var c1, c2 : dword;
    i1     : integer;
    ptp    : ^TTokenPrivileges;
begin
  if OpenProcessToken(windows.GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, c1) then
    try
      c2 := 0;
      GetTokenInformation(c1, TokenPrivileges, nil, 0, c2);
      if c2 <> 0 then begin
        ptp := pointer(LocalAlloc(LPTR, c2 * 2));
        if GetTokenInformation(c1, TokenPrivileges, ptp, c2 * 2, c2) then begin
          for i1 := 0 to integer(ptp^.PrivilegeCount) - 1 do
            ptp^.Privileges[i1].Attributes := ptp^.Privileges[i1].Attributes or SE_PRIVILEGE_ENABLED;
          AdjustTokenPrivileges(c1, false, PTokenPrivileges(ptp)^, c2, PTokenPrivileges(nil)^, cardinal(pointer(nil)^));
        end;
        LocalFree(dword(ptp));
      end;
    finally CloseHandle(c1) end;
end;

procedure ChangeSystemTime(NewTime: TSystemTime);
begin
{  if (not IsNT) or SetPrivilege('SeSystemtimePrivilege', true) then
  begin}
    if IsNT then 
      EnableAllPrivileges;
//      SetPrivilege('SeSystemtimePrivilege', true);
  
    SetLocalTime(NewTime); // or SetSystemTime(NewTime);
//    if IsNT then SetPrivilege('SeSystemtimePrivilege', false );
//  end;
end;

procedure TClienteNexCafe.tcHorarioEv(var Msg: TMessage);
var ST: _SystemTime;
begin
  if Maquina>=1 then
  with PmsgHorarioEv(Msg.lParam)^ do begin
    DateTimeToSystemTime(msgHora, ST);
    ChangeSystemTime(ST);
  end;
end;

procedure TClienteNexCafe.tcMonitorOnOffEv(var Msg: TMessage);
begin
  DebugMsg('TClienteNexCafe.tcMonitorOnOffEv'); // do not localize
  with PmsgMonitorOnOff(msg.LParam)^ do 
  if Assigned(FMonitorOnOff) then
    FMonitorOnOff(Self, msgMaq, msgOn);
end;

procedure TClienteNexCafe.tcNovoObj(var Msg: TMessage);
begin
  DebugMsg('TClienteNexCafe.tcNovoObj - 1'); // do not localize
  tcAtualizaObj(Msg);
end;

procedure TClienteNexCafe.tcObtemProcessosEv(var Msg: TMessage);
begin
  with PmsgObtemProcessos(Msg.lParam)^ do begin 
    DebugMsg('TClienteNexCafe.tcObtemProcessosEv - msgMaq: '+IntToStr(FMaquina)); // do not localize
    if (msgMaq=FMaquina) and Assigned(FAoFinalizaProcesso) then
      FAoObtemProcessos(Self, msgIDCliente, msgIDRequest);
  end;
end;

procedure TClienteNexCafe.tcPedeTela(var Msg: TMessage);
begin
  with PmsgCapturaTela(Msg.LParam)^ do begin
    DebugMsg('TClienteNexCafe.tcPedeTela - msgMaq: '+IntToStr(FMaquina)+' - msgSession: ' + IntToStr(msgSession)); // do not localize
    if (msgMaq=FMaquina) and Assigned(FAoPedirTela) then
      FAoPedirTela(Self, msgSession);
  end;
end;

procedure TClienteNexCafe.tcShutdown(var Msg: TMessage);
var M: TncMaquina;
begin
  with PmsgShutdown(Msg.lParam)^ do begin
    DebugMsg('TClienteNexCafe.tcShutdow'); // do not localize
    M := MaquinaObj;
    if ((msgMaq=0) or 
        (msgMaq=FMaquina) or
        ((M<>nil) and (msgMaq=High(Word)) and (Sessoes.PorMaq[M.Numero]=nil))) and
       Assigned(FShutdown) then
      FShutDown(Self, msgOper);
  end;    
end;

procedure TClienteNexCafe.tcSiteBloqueadoEv(var Msg: TMessage);
var 
  S: TStream;
  Str: String;
  Adicionou : Boolean;
  I : Integer;
begin
  if not Assigned(FAoBloquearSite) then Exit;

  DebugMsg('TClienteNexCafe.tcSiteBloqueadoEv'); // do not localize
  
  
  S := TStream(Msg.LParam);
  SetLength(Str, S.Size);
  S.Position := 0;
  S.Read(Str[1], S.Size);

  Adicionou := SameText(Copy(Str, 1, 1), 'S');
  Delete(Str, 1, 1);

  I := FSitesBloq.IndexOf('127.0.0.1       '+Str); // do not localize
  if Adicionou then begin
    if I=-1 then 
      FSitesBloq.Add('127.0.0.1       '+Str); // do not localize
  end else
  if I>=0 then
    FSitesBloq.Delete(I);

  FAoBloquearSite(Self, Adicionou, Str);
end;

procedure TClienteNexCafe.tcSuporteRemEv(var Msg: TMessage);
begin
  with PmsgSuporteRemEv(Msg.lParam)^ do  
  if Assigned(FSuporteRem) then
    FSuporteRem(Self, msgMaq, msgTec);
end;

procedure TClienteNexCafe.DespachaMC(var Msg: TMessage);
begin
  try
    DebugMsg('TClienteNexCafe.DespachMC - Msg: ' + GetMsgIDString(Msg.Msg)); // do not localize
    Dispatch(Msg);
    if Assigned(FAoDespacharMC) then
      FAoDespacharMC(Msg);
  finally
    FreeDados(Msg.Msg, Pointer(Msg.LParam));
  end;    
end;

procedure TClienteNexCafe.SetServidor(Valor: TncServidorBase);
begin
  if FServidor <> Valor then begin
{    if FServidor<>nil then 
      FServidor.RemoveComponent(Self);}
    FServidor := nil;
    SetAtivo(False);
    FServidor := Valor;
{    if FServidor<>nil then 
      FServidor.InsertComponent(Self);}
  end;  
end;

procedure TClienteNexCafe.tcServidorDesativado(var Msg: TMessage);
begin
  Desativou;
end;

procedure TClienteNexCafe.AtivaTimerFundo;
begin
  FTimerFundo.Enabled := ((FNovoDesktop<>'') and (FNovoDesktop<>FArqDesktop)) or 
                         ((FNovoLogin<>'') and (FNovoLogin<>FArqLogin));
end;

procedure TClienteNexCafe.Ativou;
begin
  if Assigned(FAoAtivar) then
    FAoAtivar(Self);   
end;

function TClienteNexCafe.Permitido(Usuario: TncUsuario; TipoAcesso: Integer): Boolean;
begin
  if Usuario.Admin then 
    Result := True
  else 
    Result := ItemTrueStr(Usuario.Direitos, TipoAcesso);
end;

procedure TClienteNexCafe.PermitirDownload(aSessao: Integer;
  aExe, aPermitir: Boolean);
begin
  ChecaErro(Servidor.PermitirDownload(aSessao, aExe, aPermitir));
end;

procedure TClienteNexCafe.ProcessaMensagens;
var Msg : TMsg;
begin
  while PeekMessage(Msg, FWndHandle, 0, 0, PM_REMOVE) do begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

procedure TClienteNexCafe.ApagaMsgCli(aID: Integer);
begin
  ChecaErro(Servidor.ApagaMsgCli(aID));
end;

procedure TClienteNexCafe.ApagaObj(Obj: TncClasse);
begin
  ChecaErro(Servidor.ApagaObj(Handle, Obj.TipoClasse, Obj.Chave));
end;

procedure TClienteNexCafe.SalvaAlteracoesObj(Obj: TncClasse; Novo: Boolean);
var 
  S : TStream;
  aHandle, 
  aTipoClasse : Integer;
  Chave : String;
  T : Byte;
begin
  S := TMemoryStream.Create;
  try
    aHandle := Handle;
    aTipoClasse := Obj.TipoClasse;
    Chave := Obj.Chave;
    T := Length(Chave);
    S.Write(aHandle, SizeOf(aHandle));
    S.Write(aTipoClasse, SizeOf(aTipoClasse));
    S.Write(T, SizeOf(Byte));
    S.Write(Pointer(Chave)^, T);
    Obj.SalvaStream(S, not Novo);
    S.Position := 0;
    with Servidor do
    ChecaErro(SalvaStreamObj(Novo, S));
  finally
    S.Free;
  end;  
end;

procedure TClienteNexCafe.SalvaCredTempo(aCredTempo: TncCredTempo);
begin
  ChecaErro(Servidor.SalvaCredTempo(aCredTempo));
end;

procedure TClienteNexCafe.SalvaDebito(aDebito: TncDebito);
begin
  ChecaErro(Servidor.SalvaDebito(aDebito));
end;

procedure TClienteNexCafe.SalvaDebTempo(aDebTempo: TncDebTempo);
begin
  ChecaErro(Servidor.SalvaDebTempo(aDebTempo));
end;

procedure TClienteNexCafe.SalvaImpressao(aImpressao: TncImpressao);
begin
  ChecaErro(Servidor.SalvaImpressao(aImpressao));
end;

procedure TClienteNexCafe.SalvaClientPages(aPrinter: String; aJobID: Cardinal; aMaq, aPaginas: Word);
begin
  ChecaErro(Servidor.SalvaClientPages(aPrinter, aJobID, aMaq, aPaginas));
end;

procedure TClienteNexCafe.SalvaLancExtra(aLE: TncLancExtra);
begin
  ChecaErro(Servidor.SalvaLancExtra(aLE));
end;

procedure TClienteNexCafe.SalvaLic(aConta, aChaves: String);
var s: String;
begin
  S := 'chaves='+aChaves; // do not localize
  if aConta>'' then S := S + sLineBreak + 'conta=' + aConta; // do not localize
  ChecaErro(Servidor.SalvaLic(S));
end;

procedure TClienteNexCafe.SalvaMovEst(aMovEst: TncMovEst);
begin
  ChecaErro(Servidor.SalvaMovEst(aMovEst));
end;

procedure TClienteNexCafe.SalvaProcessos(aIDCliente, aReq: Integer;
  aSL: TStrings);
begin
  ChecaErro(Servidor.SalvaProcessos(aIDCliente, aReq, aSL));
end;

procedure TClienteNexCafe.SalvaSenhaCli(aContato: Integer; aSenha: String);
begin
  ChecaErro(Servidor.SalvaSenhaCli(aContato, aSenha));
end;

procedure TClienteNexCafe.SalvaSiteProgAtual(aExe, aTit, aUrl: String);
var 
  S: TncSessao;
  SID : Integer;
  DH : TDateTime;
begin
  S := SessaoMaq;
  if S=nil then begin
    SID := 0;
    DH := 0;
  end else begin
    SID := S.ID;
    DH := S.GetDHAtual;
  end;
  
  if not (SameText(FLastExe, aExe) and SameText(FLastTit, aTit) and SameText(FLastUrl, aUrl)) then
    FAppUrlLog.NewItem.SetData(FMaquina, SID, DH, aExe, aTit, aUrl);
    
  FLastExe := aExe;
  FLastUrl := aUrl;
  FLastTit := aTit;
end;

procedure TClienteNexCafe.LoginMaq(aSessao: TncSessao);
begin
  ChecaErro(Servidor.LoginMaq(aSessao));
end;

procedure TClienteNexCafe.PreLogoutMaq(aMaq: Word);
begin
  DebugMsgEsp('TClienteNexCafe.PreLogoutMaq - ' + IntToStr(aMaq), False, False); // do not localize
  ChecaErro(Servidor.PreLogoutMaq(aMaq));
end;

procedure TClienteNexCafe.PrintDocControl(aInfo: TStrings);
begin
  ChecaErro(Servidor.PrintDocControl(aInfo));
end;

procedure TClienteNexCafe.CancelaTran(aID: Integer; aFunc: String);
begin
  ChecaErro(Servidor.CancelaTran(aID, aFunc));
end;

procedure TClienteNexCafe.CancLogoutMaq(aMaq: Word);
begin
  ChecaErro(Servidor.CancLogoutMaq(aMaq));
end;
    
procedure TClienteNexCafe.SalvaApp(aApp: String);
begin
  ChecaErro(Servidor.SalvaApp(aApp));
end;

procedure TClienteNexCafe.SalvaAppUrlLog;
var S : TStream;
begin
  if FAppUrlLog.Count=0 then Exit;
  
  try
    if Ativo then begin
      S := TMemoryStream.Create;
      try
        FAppUrlLog.SaveToStream(S);
        S.Position := 0;
        if Servidor.SalvaLogAppUrl(S)=0 then 
          FAppUrlLog.Limpa;
      finally
        S.Free;
      end;
    end;
  except
  end;
end;

procedure TClienteNexCafe.TransferirMaq(aOrigem, aDestino: Word);
begin
  ChecaErro(Servidor.TransferirMaq(aOrigem, aDestino));
end;

procedure TClienteNexCafe.PararMaq(aMaq: Word; aParar: Boolean);
begin
  ChecaErro(Servidor.PararTempoMaq(aMaq, aParar));
end;

procedure TClienteNexCafe.LimpaArqsFundo;
var SR: TSearchRec;
begin
  FindFirst(ExtractFilePath(ParamStr(0))+'DESKTOP*.*', faAnyFile, SR); // do not localize
  try
    repeat
      if (Pos('DESKTOP', UpperCase(SR.Name))=1) and // do not localize
         SameText(ExtractFileExt(SR.Name), '.JPG') and // do not localize
         (not SameText(ExtractFileName(FNovoDesktop), SR.Name)) then
      try
        DebugMsg('LimpaArqsFundo - DeleteFile: ' + SR.Name); // do not localize
        DeleteFile(SR.Name);
      except
      end;   
    until (FindNext(SR)<>0);
  finally
    FindClose(SR);
  end;

  FindFirst(ExtractFilePath(ParamStr(0))+'LOGIN*.*', faAnyFile, SR); // do not localize
  try
    repeat
      if (Pos('LOGIN', UpperCase(SR.Name))=1) and // do not localize
         (Length(SR.Name)>9) and
         (SameText(ExtractFileExt(SR.Name), '.JPG') or  // do not localize
          SameText(ExtractFileExt(SR.Name), '.GIF')) and // do not localize
         (not SameText(ExtractFileName(FNovoLogin), SR.Name)) then
      try
        DebugMsg('LimpaArqsFundo - DeleteFile: ' + SR.Name); // do not localize
        DeleteFile(SR.Name);
      except
      end;   
    until (FindNext(SR)<>0);
  finally
    FindClose(SR);
  end;
end;

procedure TClienteNexCafe.LimpaFundo(aDesktop: Boolean);
begin
  ChecaErro(Servidor.LimpaFundo(aDesktop));
end;

procedure TClienteNexCafe.LogoutMaq(aMaq: Word);
begin
  DebugMsgEsp('TClienteNexCafe.LogoutMaq - ' + IntToStr(aMaq), False, False); // do not localize
  ChecaErro(Servidor.LogoutMaq(aMaq));
end;

procedure TClienteNexCafe.ModoManutencao(aMaq: Word; aEntrar: Boolean);
begin
  ChecaErro(Servidor.ModoManutencao(aMaq, Username, Senha, aEntrar));
end;

procedure TClienteNexCafe.MonitorOnOff(aMaq: Word; aOn: Boolean);
begin
  ChecaErro(Servidor.MonitorOnOff(aMaq, aOn));
end;

procedure TClienteNexCafe.SalvaTela(SessionID: Integer; S: TMemoryStream);
begin
  ChecaErro(Servidor.SalvaTelaMaq(SessionID, Maquina, S));
end;

procedure TClienteNexCafe.CapturaTela(aMaq: Word);
begin
  ChecaErro(Servidor.CapturaTelaMaq(aMaq));
end;

procedure TClienteNexCafe.ChecaArqFundo;
begin
  if not SameText(FNovoDesktop, FArqDesktop) then begin
    DebugMsg('ChecaArqFundo - Mudou Desktop'); // do not localize
    if (FNovoDesktop='') then begin
      if FArqDesktop>'' then
      try
        DebugMsg('ChecaArqFundo - Delete ' + FArqDesktop); // do not localize
        DeleteFile(FArqDesktop);
      except
      end;
      FArqDesktop := '';
    end else 
    if FTransferindoArq <> taDesktop then begin
      DebugMsg('ChecaArqFundo - Mudou Desktop 2'); // do not localize
      if FileExists(FNovoDesktop) then
      begin
        FArqDesktop := FNovoDesktop;
        DebugMsg('ChecaArqFundo - Arquivo ' + FNovoDesktop + ' Existe'); // do not localize
        if Assigned(FMudouFundo) then
          FMudouFundo(True);
      end;
    end;
  end else
    DebugMsg('TClienteNexCafe.ChecaArqFundo - FNovoDesktop: ' + FNovoDesktop + ' - FArqDesktop: ' + FArqDesktop); // do not localize

  if not SameText(FNovoLogin, FArqLogin) then begin
    DebugMsg('ChecaArqFundo - Mudou Login'); // do not localize
    if (FNovoLogin='') then begin
      if FArqLogin>'' then
      try
        DebugMsg('ChecaArqFundo - Delete ' + FArqLogin); // do not localize
        DeleteFile(FArqLogin);
      except
      end;
      FArqLogin := '';
    end else 
    if FTransferindoArq <> taLogin then begin
      DebugMsg('ChecaArqFundo - Mudou Login 2'); // do not localize
      if FileExists(FNovoLogin) then
      begin
        DebugMsg('ChecaArqFundo - Arquivo ' + FNovoLogin + ' Existe'); // do not localize
        FArqLogin := FNovoLogin;
        if Assigned(FMudouFundo) then
          FMudouFundo(False);
      end;
    end;
  end else
    DebugMsg('TClienteNexCafe.ChecaArqFundo - FNovoLogin: ' + FNovoLogin + ' - FArqLogin: ' + FArqLogin); // do not localize
  
  AtivaTimerFundo;
end;

procedure TClienteNexCafe.ChecaErro(Erro: Integer);
begin
  if Erro<>0 then 
  if (Erro=ncerrConexaoPerdida) and (not FAtivando) then begin
    Ativo := False;
    raise EErroNexCafe.Create(Erro);
  end else
    raise EErroNexCafe.Create(Erro);
end;

procedure TClienteNexCafe.CorrigeDataCaixa(aID: Integer; aNovaAbertura,
  aNovoFechamento: TDateTime);
begin
  ChecaErro(Servidor.CorrigeDataCaixa(Username, aID, aNovaAbertura, aNovoFechamento));
end;

procedure TClienteNexCafe.RefreshEspera;
begin
  ChecaErro(Servidor.RefreshEspera);
end;

procedure TClienteNexCafe.RefreshPrecosServidor;
begin
  ChecaErro(Servidor.RefreshPrecos);
end;

procedure TClienteNexCafe.ShutdownMaq(aMaq, aOper: Word);
begin
  ChecaErro(Servidor.ShutdownMaq(aMaq, aOper));
end;

procedure TClienteNexCafe.SuporteRem(aMaq, aTec: Word);
begin
  ChecaErro(Servidor.SuporteRem(aMaq, aTec));
end;

procedure TClienteNexCafe.BaixaAtualizacao(Programa, Versao, ArqDestino: String);
var Erro: Integer;
begin
  Erro := Servidor.BaixaNovaVersao(Programa, Versao, ArqDestino);
  if not (Erro in [0, ncerrSemNovaVersao]) then
    Raise EErroNexCafe.Create(Erro);
  if Erro=0 then
    FTransferindoArq := taAtualizacao;  
end;

function TClienteNexCafe.MaquinaObj: TncMaquina;
begin
  Result := Maquinas.PorNumero[Maquina];
end;

procedure TClienteNexCafe.AdicionaPassaporte(aMaq: Word; aSenha: String);
begin
  ChecaErro(Servidor.AdicionaPassaporte(aMaq, aSenha));
end;

procedure TClienteNexCafe.AjustaPontosFid(aCliente: Integer; aFator: Smallint;
  aPontos: Double; aObs: String);
begin
  ChecaErro(Servidor.AjustaPontosFid(UA.Username, aCliente, aFator, aPontos, aObs));
end;

procedure TClienteNexCafe.AlteraSessao(aSessao: TncSessao);
begin
  ChecaErro(Servidor.AlteraSessao(aSessao));
end;

procedure TClienteNexCafe.PaginasImpressas(aJobID: Cardinal; aMaq: Word; aPaginas: Integer;
  aImp, aDoc: String);
begin
  ChecaErro(Servidor.RegistraPaginasImpressas(aJobID, aMaq, aPaginas, aImp, aDoc));
end;

function TClienteNexCafe.SessaoMaq: TncSessao;
begin
  Result := Sessoes.PorMaq[Maquina];
end;

procedure TClienteNexCafe.SetEventsNil;
begin
  FAoAtivar             := nil;
  FAoDesativar          := nil;
  FAoDestruirMaquina    := nil;
  FAoAtualizarMaquina   := nil;
  FAoAtualizarConfig    := nil;
  FAoDestruirTipoAcesso := nil;
  FAoAtualizarTipoAcesso := nil;
  FAoDestruirTarifa     := nil;
  FAoAtualizarTarifa    := nil;
  FAoDespacharMC        := nil;
  FShutdown             := nil;
  FSuporteRem           := nil;
  FMonitorOnOff         := nil;
  FAoDestruirUsuario    := nil;
  FAoAtualizarUsuario   := nil;
  FAoPedirTela          := nil;
  FAoReceberChat        := nil;
  FAoTransferirArq      := nil;
  FMudouFundo           := nil;
  FAoAtualizarSessao    := nil;
  FAoDestruirSessao     := nil;
  FAoAbrirFecharCx      := nil;
  FAoObtemProcessos     := nil;
  FAoFinalizaProcesso   := nil;
  FAoBloquearSite       := nil;
  FAoChecaLic           := nil;
end;

initialization
  Randomize;
  
end.

