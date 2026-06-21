unit cmCompCliente;

interface

uses
  Classes,
  WinProcs,
  Messages,
  Windows,
  cmErros,
  cmMsgCom,
  ClasseCS,
  SysUtils,
  ExtCtrls,
  kbmMemTable,
  kbmUtils,
  cmDebug,
  cmClassesBase;

type
  TMudouFundoEv = procedure (Desktop: Boolean) of object;

  THackTMClasse = class ( TCMClasse );
  TClienteCyberMgr = class;
  TEventoDespachoMC = procedure (var Msg: TMessage) of object;
  TEventoShutdown = procedure (Sender: TObject; Operacao: Byte) of object;
  
  TEventoTransfArq = procedure (Sender: Tobject; 
                                Etapa: Byte; 
                                MsgID, TamArq, Posicao: Integer;
                                NomeArq: String; 
                                Enviando: Boolean) of object;

  TEventoChat = procedure (Sender: TObject;
                           MsgID, De, Para: Integer;
                           DataHora: TDateTime;
                           Texto: String) of object;

  TClienteCyberMgr = class ( TComponent )
  private
    FHandle            : Integer;
    FWndHandle         : HWND;
    FServidor          : TCMServidorBase;
    FAtivo             : Boolean;
    
    FMaquinas          : TCMListaMaquinas;
    FUsuarios          : TCMListaUsuarios;
    FGrupos            : TCMListaGrupos;
    FTiposAcesso       : TCMListaTipoAcesso;
    FCorPrecos         : TCMListaCorPreco;
    FCacheConexao      : Boolean;
    FAvisos            : TkbmMemTable;
    
    FUsername          : String;
    FSenha             : String;
    FMaquina           : Byte;
    FFuncAtual         : Boolean;

    FConfig            : TCMConfig;

    FUsuarioAtual      : TCMUsuario;
    
    FAoAtivar          : TNotifyEvent;
    FAoDesativar       : TNotifyEvent;
    
    FAoDestruirMaquina : TNotifyEvent;
    FAoAtualizarMaquina: TNotifyEvent;

    FAoAtualizarTipoAcesso : TNotifyEvent;
    FAoDestruirTipoAcesso  : TNotifyEvent;

    FAoAtualizarCorPreco : TNotifyEvent;
    FAoDestruirCorPreco  : TNotifyEvent;

    FAoDestruirGrupo   : TNotifyEvent;
    FAoAtualizarGrupo  : TNotifyEvent;

    FAoDestruirUsuario : TNotifyEvent;
    FAoAtualizarUsuario: TNotifyEvent;

    FAoReceberChat     : TEventoChat;

    FAoAtualizarConfig : TNotifyEvent;

    FAoPedirTela       : TNotifyEvent;

    FAoDespacharMC     : TEventoDespachoMC;
    FAoTransferirArq   : TEventoTransfArq;
    
    FShutdown          : TEventoShutdown;
    FNumMaq            : Integer;
    FAutoAtualizar     : Boolean;
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

    procedure SetAtivo(Valor: Boolean);
    procedure CriaWndHandle;
    procedure Notificacao(Obj: TCMClasse; TipoNot: TTipoNotificacao);
    procedure SetServidor(Valor: TCMServidorBase);
    procedure ChecaArqFundo;
    procedure AtivaTimerFundo;
    procedure OnTimerFundo(Sender: Tobject);
    procedure LimpaArqsFundo;
    
  protected
    procedure Desativou; virtual;
    procedure Ativou; virtual;

    function Lista(TipoClasse: Integer): TListaClasseCS;
    
    function AchaObj(TipoClasse: Integer; Chave: Variant): TCMClasse;
  
    procedure DespachaMC(var Msg: TMessage); virtual;
    
    procedure tcAtualizaObj(var Msg: TMessage);
              message cmmc_AtualizaObj;
              
    procedure tcNovoObj(var Msg: TMessage);
              message cmmc_NovoObj;
              
    procedure tcDestroiObj(var Msg: TMessage);
              message cmmc_DestroiObj;

    procedure tcServidorDesativado(var Msg: TMessage);
              message cmmc_ServidorDesativado;

    procedure tcPedeTela(var Msg: TMessage);
              message cmmc_PedeTela;

    procedure tcShutdown(var Msg: TMessage);
              message cmmc_Shutdown;

    procedure tcTransfArqEv(var Msg: TMessage);
              message cmmc_TransfArqEv;

    procedure tcChatEv(var Msg: TMessage);
              message cmmc_ChatEv;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure ProcessaMensagens;

    function Permitido(Usuario: TCMUsuario; TipoAcesso: Integer): Boolean;
    
    procedure SalvaAlteracoesObj(Obj: TCMClasse; Novo: Boolean);
    procedure ApagaObj(Obj: TCMClasse);
    procedure SalvaTela(S: TMemoryStream);
    function CapturaTela(aMaq: Byte; S: TMemoryStream): Boolean;
    procedure RefreshPrecosServidor;
    procedure ShutdownMaq(aMaq, aOper: Byte);
    procedure BaixaAtualizacao(Programa, Versao, ArqDestino: String);
    procedure EnviaArqFundo(aFonte: String; aDesktop: Boolean);
    procedure LimpaFundo(aDesktop: Boolean);
    procedure SalvaSenhaCli(aContato: Integer; aSenha: String);
    function ObtemSenhaCli(aContato: Integer): String;

    procedure LoginMaq(aMaq: Byte; 
                       aContato: Integer; 
                       aUsername, aSenha, aNome, aObsAcesso: String; 
                       aLimiteTempo: Cardinal; 
                       aSinal: Double; 
                       aTipoAcesso: Word);
                       
    procedure LogoutMaq(aMaq: Byte);

    procedure AdicionaPassaporte(aMaq: Byte; aSenha: String);
    procedure PaginasImpressas(aMaq: Byte; aPaginas: Integer; aImp, aDoc: String);
    procedure PararMaq(aMaq: Byte; aParar: Boolean);
    procedure LiberarAlemPacote(aMaq: Byte);
    procedure TransferirMaq(aOrigem, aDestino: Byte);
    procedure PreLogoutMaq(aMaq: Byte);
    procedure CancLogoutMaq(aMaq: Byte);
    procedure ModoManutencao(aMaq: Byte; aEntrar: Boolean);
    procedure EnviaChat(const aPara: Integer; const aTexto: String);

    function CriaClasseCS(TipoClasse: Integer): TClasseCS;
    function CriaTipoAcesso(InsereLista: Boolean): TCMTipoAcesso; virtual;
    function CriaMaquina(InsereLista: Boolean): TCMMaquina; virtual;
    function CriaUsuario(InsereLista: Boolean): TCMUsuario; virtual;
    function CriaGrupo(InsereLista: Boolean): TCMGrupo; virtual;
    function CriaCorPreco(InsereLista: Boolean): TCMCorPreco; virtual;

    function MaquinaObj: TCMMaquina;

    property UA: TCMUsuario
      read FUsuarioAtual;

    property Avisos: TkbmMemtable
      read FAvisos;  

    property Maquinas: TCMListaMaquinas
      read FMaquinas; 

    property TiposAcesso: TCMListaTipoAcesso
      read FTiposAcesso;  

    property Usuarios: TCMListaUsuarios
      read FUsuarios;

    property Grupos: TCMListaGrupos
      read FGrupos; 

    property CorPrecos: TCMListaCorPreco
      read FCorPrecos;     

    property Handle: Integer
      read FHandle;  

    property AoDespacharMC: TEventoDespachoMC
      read FAoDespacharMC write FAoDespacharMC;

    property Config: TCMConfig
      read FConfig;  

    property NumMaq: Integer
      read FNumMaq;  

    property TransferindoArq: Byte
      read FTransferindoArq;

    property NomeArqDesktop: String
      read FArqDesktop;

    property NomeArqLogin: String
      read FArqLogin;    

  published
    property Servidor: TCMServidorBase
      read FServidor write SetServidor;

    property Ativo: Boolean
      read FAtivo write SetAtivo;  

    property Username: String
      read FUsername write FUsername;

    property Senha: String
      read FSenha write FSenha;    

    property Maquina: Byte
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

    property AoDestruirMaquina: TNotifyEvent
      read FAoDestruirMaquina write FAoDestruirMaquina;
      
    property AoAtualizarMaquina: TNotifyEvent
      read FAoAtualizarMaquina write FAoAtualizarMaquina;

    property AoDestruirTipoAcesso : TNotifyEvent
      read FAoDestruirTipoAcesso write FAoDestruirTipoAcesso;
      
    property AoAtualizarTipoAcesso : TNotifyEvent
      read FAoAtualizarTipoAcesso write FAoAtualizarTipoAcesso;

    property AoDestruirCorPreco : TNotifyEvent
      read FAoDestruirCorPreco write FAoDestruirCorPreco;
      
    property AoAtualizarCorPreco : TNotifyEvent
      read FAoAtualizarCorPreco write FAoAtualizarCorPreco;

    property AoAtualizarConfig : TNotifyEvent
      read FAoAtualizarConfig write FAoAtualizarConfig;  
      
    property AoDestruirGrupo: TNotifyEvent
      read FAoDestruirGrupo write FAoDestruirGrupo;
        
    property AoAtualizarGrupo: TNotifyEvent
      read FAoAtualizarGrupo write FAoAtualizarGrupo;

    property AoDestruirUsuario: TNotifyEvent
      read FAoDestruirUsuario write FAoDestruirUsuario;
        
    property AoAtualizarUsuario: TNotifyEvent
      read FAoAtualizarUsuario write FAoAtualizarUsuario;

    property AoPedirTela: TNotifyEvent
      read FAoPedirTela write FAoPedirTela;  

    property AoReceberChat: TEventoChat
      read FAoReceberChat write FAoReceberChat;  

    property AoTransferirArq: TEventoTransfArq
      read FAoTransferirArq write FAoTransferirArq;
      
    property Shutdown: TEventoShutdown
      read FShutdown write FShutdown;  

    property AoMudarFundo: TMudouFundoEv
      read FMudouFundo write FMudouFundo;
  end;

  function ClienteCMWndFunc(hWindow : Hwnd; Msg : UINT;
                            wParam : WPARAM;
                            lParam : LPARAM) : LRESULT; stdcall export;
  
const
  NomeClasseClienteCM = 'TClienteCyberMgr';  

  // Transferindo arquivo
  taNenhum      = 0;
  taAtualizacao = 1;
  taDesktop     = 2;
  taLogin       = 3;
  
implementation

uses
  cmListaID, cmIDRecursos, uLicenca;

{ TClienteCyberMgr }

constructor TClienteCyberMgr.Create(AOwner: TComponent);
begin
  inherited;
  FNumMaq        := 2;
  FCacheConexao  := False;
  
  FUsuarioAtual  := TCMUsuario.Create;
  FTimerFundo    := TTimer.Create(nil);
  FTimerFundo.Interval := Random(5000);
  if FTimerFundo.Interval < 500 then
    FTimerFundo.Interval := FTimerFundo.Interval + 500;
    
  FTimerFundo.Enabled := False;
  FTimerFundo.OnTimer := OnTimerFundo;

  FMaquinas      := TCMListaMaquinas.Create;
  FUsuarios      := TCMListaUsuarios.Create;
  FGrupos        := TCMListaGrupos.Create;
  FTiposAcesso   := TCMListaTipoAcesso.Create;
  FCorPrecos     := TCMListaCorPreco.Create;
  FAvisos        := CreateMemTableAndFields(nil, Campos_Avisos);
  

  FConfig        := TCMConfig.Create;
  THackTMClasse(FConfig).ProcNotificar := Notificacao;

  FMaquinas.CriaClasse := CriaClasseCS;
  FUsuarios.CriaClasse := CriaClasseCS;
  FGrupos.CriaClasse := CriaClasseCS;
  FTiposAcesso.CriaClasse := CriaClasseCS;
  FCorPrecos.CriaClasse := CriaClasseCS;

  FHandle      := 0;
  
  CriaWndHandle;
  
  FServidor        := nil;
  FAtivo           := False;
  FUsername        := '';
  FMaquina         := 0;
  FFuncAtual       := False;

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
  
  FAoAtivar             := nil;
  FAoDesativar          := nil;
  FAoDestruirMaquina    := nil;
  FAoAtualizarMaquina   := nil;
  FAoAtualizarConfig    := nil;
  FAoDestruirTipoAcesso := nil;
  FAoAtualizarTipoAcesso := nil;
  FAoDestruirCorPreco   := nil;
  FAoAtualizarCorPreco  := nil;
  FAoDespacharMC        := nil;
  FShutdown             := nil;
  FAoDestruirGrupo      := nil;
  FAoAtualizarGrupo     := nil;
  FAoDestruirUsuario    := nil;
  FAoAtualizarUsuario   := nil;
  FAoPedirTela          := nil;
  FAoReceberChat        := nil;
  FAoTransferirArq      := nil;
  FMudouFundo           := nil;
end;

destructor TClienteCyberMgr.Destroy;
begin
  ProcessaMensagens;
  DestroyWindow(FWndHandle);
  SetAtivo(False);
  FMaquinas.Free;
  FTiposAcesso.Free;
  FUsuarios.Free;
  FGrupos.Free;
  FUsuarioAtual.Free;
  FConfig.Free;
  FAvisos.Free;
  FTimerFundo.Free;
  inherited;
end;

procedure TClienteCyberMgr.EnviaArqFundo(aFonte: String; aDesktop: Boolean);
var S: String;
begin
  if FTransferindoArq<>taNenhum then
    Raise Exception.Create('Já existe uma transfência de arquivo em andamento');
  if aDesktop then
    S := 'desktop_cliente_'
  else   
    S := 'login_cliente_';
  S:= FPastaServ+'DADOS\'+S+IntToStr(Random(High(Integer)))+ExtractFileExt(aFonte);
  ChecaErro(Servidor.Upload(aFonte, S));
  FArqEnviando := S;
  if aDesktop then
    FTransferindoArq := taDesktop else
    FTransferindoArq := taLogin;
end;

procedure TClienteCyberMgr.EnviaChat(const aPara: Integer;
  const aTexto: String);
begin
  Servidor.EnviarMsg(Maquina, aPara, aTexto);
end;

procedure TClienteCyberMgr.Desativou;
begin
  FTransferindoArq := taNenhum;
  FTimerFundo.Enabled := False;
  if not FCacheConexao then begin
    FTiposAcesso.Limpa;
    FMaquinas.Limpa;
    FUsuarios.Limpa;
    FGrupos.Limpa;
  end;  
  if FAtivo = True then begin
    FAtivo := False;
    if Assigned(FAoDesativar) then
      FAoDesativar(Self);
  end;  
  FHandle := 0;
end;

procedure TClienteCyberMgr.SetAtivo(Valor: Boolean);
var 
  S : TMemoryStream;
  U : TCMUsuario;
  I : Integer;
  SLic : TLicencaStr;
begin
  if (Valor = FAtivo) or (FServidor=nil) then Exit;

  FTransferindoArq := taNenhum;

  if Valor then begin
    if (not FServidor.Ativo) then begin
      FServidor.Ativo := True;
      if not FServidor.Ativo then Exit;
    end;  
    ChecaErro(FServidor.Login(FUsername, FSenha, FMaquina, FFuncAtual, False, FWndHandle, 0, 0, FHandle));  

    if FAutoAtualizar then begin
      I := FServidor.BaixaNovaVersao(FPrograma, FVersao, FArqDestino);
      if I = 0 then begin
        FAtivo := True;
        Ativou;
        FTransferindoArq := taAtualizacao;
        Exit;
      end else
      if I <> cmerrSemNovaVersao then
        Raise EErroCyberMgr.Create(I);
    end;    
      
    try
      S := TMemoryStream.Create;
      try
        ChecaErro(FServidor.ObtemStreamConfig(S));
        FConfig.LeStream(S);
        FConfig.CodLoja := FConfig.CodLoja;
        S.Clear;

        ChecaErro(FServidor.ObtemLicenca(SLic));
        LicencaGlobal.AsString := SLic;
        
        ChecaErro(FServidor.ObtemStreamListaObj(FHandle, tcMaquina, S));
        S.Position := 0;
        FMaquinas.LeStream(S);
        S.Clear;

        ChecaErro(FServidor.ObtemStreamListaObj(FHandle, tcTipoAcesso, S));
        S.Position := 0;
        FTiposAcesso.LeStream(S);
        S.Clear;

        ChecaErro(FServidor.ObtemStreamListaObj(FHandle, tcCorPreco, S));
        S.Position := 0;
        FCorPrecos.LeStream(S);
        S.Clear;
        
        ChecaErro(FServidor.ObtemStreamListaObj(FHandle, tcUsuario, S));
        S.Position := 0;
        FUsuarios.LeStream(S);
        S.Clear;

        ChecaErro(FServidor.ObtemStreamListaObj(FHandle, tcGrupo, S));
        S.Position := 0;
        FGrupos.LeStream(S);
        S.Clear;

        ChecaErro(FServidor.ObtemStreamAvisos(S));
        S.Position := 0;
        FAvisos.LoadFromStreamViaFormat(S, FAvisos.AllDataFormat);
        FAvisos.First;

        ChecaErro(FServidor.ObtemPastaServ(FPastaServ));

        FNovoDesktop := FConfig.NomeArqDesktop;
        FNovoLogin := FConfig.NomeArqLogin;
        LimpaArqsFundo;
        ChecaArqFundo;
      finally 
        S.Free;
      end;    
      FAtivo := True;
      Ativou;
    except
      FServidor.Logout(FHandle);
      Desativou;
      Raise;
    end  
  end else begin
    FServidor.Logout(FHandle); 
    Desativou;   
  end;
  U := FUsuarios.PorUsername[FUsername];
  
  if U <> nil then begin
    for I := 0 to pred(FGrupos.Count) do with FGrupos[I] do
    if ListaContemStr(U.Grupos, Nome) then 
      U.Direitos := 
        LISomaListas(U.Direitos, Direitos);
    with U do begin
      FUsuarioAtual.Username := Username;
      FUsuarioAtual.Senha    := Senha;
      FUsuarioAtual.Admin    := Admin;
      FUsuarioAtual.Grupos   := Grupos;
      FUsuarioAtual.Direitos := Direitos;
      FUsuarioAtual.Nome     := Nome;
    end;  
  end else begin
    FUsuarioAtual.Username := '';
    FUsuarioAtual.Senha    := '';
    FUsuarioAtual.Admin    := False;
    FUsuarioAtual.Grupos   := '';
    FUsuarioAtual.Direitos := '';
    FUsuarioAtual.Nome     := '';
  end;
end;

function TClienteCyberMgr.CriaTipoAcesso(InsereLista: Boolean): TCMTipoAcesso;
begin
  Result := TCMTipoAcesso.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then 
    FTiposAcesso.Add(Result);
end;

function TClienteCyberMgr.CriaCorPreco(InsereLista: Boolean): TCMCorPreco;
begin
  Result := TCMCorPreco.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then 
    FCorPrecos.Add(Result);
end;

function TClienteCyberMgr.CriaMaquina(InsereLista: Boolean): TCMMaquina;
begin
  Result := TCMMaquina.Create(True);
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then 
    FMaquinas.Add(Result);
end;

function TClienteCyberMgr.CriaUsuario(InsereLista: Boolean): TCMUsuario; 
begin
  Result := TCMUsuario.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then 
    FUsuarios.Add(Result);
end;

function TClienteCyberMgr.CriaGrupo(InsereLista: Boolean): TCMGrupo; 
begin
  Result := TCMGrupo.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then
    FGrupos.Add(Result);
end;

function TClienteCyberMgr.CriaClasseCS(TipoClasse: Integer): TClasseCS;
begin
  case TipoClasse of
    tcMaquina : Result := CriaMaquina(False);
    tcGrupo   : Result := CriaGrupo(False);
    tcUsuario : Result := CriaUsuario(False);
    tcTipoAcesso : Result := CriaTipoAcesso(False);
    tcCorPreco : Result := CriaCorPreco(False);
  else
    Result := nil;  
  end;
end;

procedure TClienteCyberMgr.Notificacao(Obj: TCMClasse;
  TipoNot: TTipoNotificacao);
begin
  case TipoNot of
    tnAlteracao :
    case Obj.TipoClasse of
      tcMaquina :
        if Assigned(FAoAtualizarMaquina) then FAoAtualizarMaquina(Obj);  
      tcUsuario :
        if Assigned(FAoAtualizarUsuario) then FAoAtualizarUsuario(Obj);  
      tcGrupo   :
        if Assigned(FAoAtualizarGrupo) then FAoAtualizarGrupo(Obj);  
      tcTipoAcesso : 
        if Assigned(FAoAtualizarTipoAcesso) then FAoAtualizarTipoAcesso(Obj);  
      tcCorPreco :
        if Assigned(FAoAtualizarCorPreco) then FAoAtualizarCorPreco(Obj);
      tcConfig : begin
        FNovoDesktop := TCMConfig(Obj).NomeArqDesktop;
        FNovoLogin := TCMConfig(Obj).NomeArqLogin;
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
        FMaquinas.Remove(Obj);
        if Assigned(FAoDestruirMaquina) then FAoDestruirMaquina(Obj);
      end;
      tcTipoAcesso : 
      begin
        FTiposAcesso.Remove(Obj);
        if Assigned(FAoDestruirTipoAcesso) then FAoDestruirTipoAcesso(Obj);
      end;
      tcCorPreco :
      begin
        FCorPrecos.Remove(Obj);
        if Assigned(FAoDestruirCorPreco) then FAoDestruirCorPreco(Obj);
      end;
      tcUsuario : begin
        FUsuarios.Remove(Obj);
        if Assigned(FAoDestruirUsuario) then FAoDestruirUsuario(Obj);
      end;
      tcGrupo : begin
        FGrupos.Remove(Obj);
        if Assigned(FAoDestruirGrupo) then FAoDestruirGrupo(Obj);
      end;
    end;  
  end;
end;

function TClienteCyberMgr.ObtemSenhaCli(aContato: Integer): String;
begin
  ChecaErro(Servidor.ObtemSenhaCli(aContato, Result));
end;

procedure TClienteCyberMgr.OnTimerFundo(Sender: Tobject);
begin
  if FTransferindoArq<>taNenhum then Exit;
  AtivaTimerFundo;
  if FTimerFundo.Enabled then begin
    if (FNovoDesktop<>'') and (not SameText(FNovoDesktop, FArqDesktop)) then
    begin
      ChecaErro(FServidor.Download(FPastaServ+'DADOS\'+ExtractFileName(FNovoDesktop), FNovoDesktop+'_'));
      FTransferindoArq := taDesktop;
    end else
    if (FNovoLogin<>'') and (not SameText(FNovoLogin, FArqLogin)) then
    begin
      ChecaErro(FServidor.Download(FPastaServ+'DADOS\'+ExtractFileName(FNovoLogin), FNovoLogin+'_'));
      FTransferindoArq := taLogin;
    end;
  end;
end;

procedure TClienteCyberMgr.CriaWndHandle;
var XClass : TWndClass;
begin
  XClass.hInstance := HInstance;
  with XClass do begin
    Style         := 0;
    lpfnWndProc   := @ClienteCMWndFunc;
    cbClsExtra    := 0;
    cbWndExtra    := SizeOf(Pointer);
    hIcon         := LoadIcon(hInstance, 'DEFICON');
    hCursor       := LoadCursor(0, idc_Arrow);
    hbrBackground := 0;
    lpszMenuName  := nil;
    lpszClassName := NomeClasseClienteCM;
  end;
  WinProcs.RegisterClass(XClass);

  FWndHandle :=
    CreateWindow(NomeClasseClienteCM,     {window class name}
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
  Obj : TClienteCyberMgr;
  M   : TMessage;
  
  function DefWndFunc : LongInt;
  begin
    DefWndFunc := DefWindowProc(hWindow, Msg, wParam, lParam);
  end;

begin
  Result := 0;
  Obj := nil;

  if MSG<>wm_Create then begin
    Obj := TClienteCyberMgr(GetWindowLong(hWindow, 0));
    if Obj=nil then begin 
      Result := DefWndFunc;
      Exit;
    end;
  end;

  case Msg of
    cmmc_Primeira..cmmc_Ultima : 
    begin
      M.Msg := Msg;
      M.WParam := WParam;
      M.LParam := LParam;
      Obj.DespachaMC(M);
    end;
    
  else 
    Result := DefWndFunc;
  end;
end;

function TClienteCyberMgr.Lista(TipoClasse: Integer): TListaClasseCS;
begin
  case TipoClasse of
    tcMaquina : Result := FMaquinas;
    tcUsuario : Result := FUsuarios;
    tcGrupo   : Result := FGrupos;
    tcTipoAcesso : Result := FTiposAcesso;
    tcCorPreco : Result := FCorPrecos;
  else  
    Result := nil;
  end;
end;  

function TClienteCyberMgr.AchaObj(TipoClasse: Integer; Chave: Variant): TCMClasse;
var L: TListaClasseCS;
begin
  L := Lista(TipoClasse);
  if L <> nil then
    Result := TCMClasse(L.ItemPorChave[Chave])
  else
    Result := nil;  
end;  

procedure TClienteCyberMgr.tcAtualizaObj(var Msg: TMessage);
var 
  S : TStream;
  TipoClasse : Integer;
  Chave : String;
  T : Byte;
  Obj : TCMClasse;
  L : TListaClasseCS;
begin
  with Msg do
  S := TStream(lParam);
  
  S.Position := 0;
  S.Read(TipoClasse, SizeOf(TipoClasse));
  S.Read(T, SizeOf(T));
  SetString(Chave, PChar(nil), T);
  S.Read(Pointer(Chave)^, T);

  if TipoClasse=tcConfig then begin
    FConfig.LeStream(S);
    FConfig.Notificar(tnAlteracao);
  end else begin
    L := Lista(TipoClasse);
    if L = nil then Exit;
    Obj := TCMClasse(L.ItemPorChave[Chave]);

    if Obj = nil then begin
      Obj := TCMClasse(CriaClasseCS(TipoClasse));
      L.Add(Obj);
    end;

    if Obj <> nil then begin
      Obj.LeStream(S);
      Obj.Notificar(tnAlteracao);
    end;
  end;  
end;

procedure TClienteCyberMgr.tcChatEv(var Msg: TMessage);
var 
  S: TStream;
  SL: TStrings;
  DataHora: TDateTime;
  De, Para, ID: Integer;
begin
  if not Assigned(FAoReceberChat) then Exit;
  
  S := TStream(Msg.lParam);
  S.Position := 0;
  SL := TStringList.Create;
  try
    SL.LoadFromStream(S);
    DataHora := StrToDateTime(SL.Values['datahora']);
    De := StrToInt(SL.Values['de']);
    Para := StrToInt(SL.Values['para']);
    ID := StrToInt(SL.Values['id']);
    SL.Delete(0);
    SL.Delete(0);
    SL.Delete(0);
    SL.Delete(0);
    if (De=Maquina) or (Para=Maquina) or (Para=-1) then
      FAoReceberChat(Self, ID, De, Para, DataHora, SL.Text);
  finally
    SL.Free;
  end;
end;

procedure TClienteCyberMgr.tcDestroiObj(var Msg: TMessage);
var 
  TipoClasse : Integer;
  Chave: Variant;
  Obj : TCMClasse;
begin
  TipoClasse := PmsgDestroiObj(Msg.LParam)^.msgTipoClasse;
  Chave      := PmsgDestroiObj(Msg.LParam)^.msgChave;
  Obj := AchaObj(TipoClasse, Chave);
  if Obj <> nil then Obj.Free;
end;

procedure TClienteCyberMgr.tcNovoObj(var Msg: TMessage);
begin
  tcAtualizaObj(Msg);
end;

procedure TClienteCyberMgr.tcPedeTela(var Msg: TMessage);
begin
  if (Msg.WParam=Maquina) and Assigned(FAoPedirTela) then
    FAoPedirTela(Self);
end;

procedure TClienteCyberMgr.tcShutdown(var Msg: TMessage);
var Maq: Byte;
begin
  with PmsgShutdown(Msg.lParam)^ do  begin
    Maq := msgMaq;
    if ((Maq=0) or (Maq=FMaquina)) and Assigned(FShutdown) then
      FShutDown(Self, msgOper);
  end;    
end;

procedure TClienteCyberMgr.tcTransfArqEv(var Msg: TMessage);
var 
  OK: Boolean;
  I : Integer;
begin
  with PmsgTransfArqEv(Msg.lParam)^, msgTransfInfo do begin
    if not FAtivo then FServidor.Logout(FHandle);
    try
      if nmPos=2 then begin
        try
          if FTransferindoArq in [taDesktop, taLogin] then begin
            if nmSending then 
              ChecaErro(Servidor.ArqFundoEnviado(ExtractFileName(FArqEnviando)))
            else begin
              OK := False;
              I := 0;
              while (not OK) and (I<30) do begin
                OK := RenameFile(nmFileName, Copy(nmFileName, 1, Length(nmFileName)-1));
                if not OK then begin
                  Sleep(50);
                  Inc(I);
                end;
              end;
              FTransferindoArq := taNenhum;
              ChecaArqFundo;
            end;
          end;
        finally
          FArqEnviando := '';
        end;
      end;
    finally
      try
        if Assigned(FAoTransferirArq) then
          FAoTransferirArq(Self, nmPos, nmSubMsgID, nmFileSize, nmFilePos, nmFileName, nmSending);
      finally    
        if nmPos=2 then FTransferindoArq := taNenhum;        
      end;  
    end;
  end;    
end;

procedure TClienteCyberMgr.DespachaMC(var Msg: TMessage);
begin
  try
    Dispatch(Msg);
    if Assigned(FAoDespacharMC) then
      FAoDespacharMC(Msg);
  finally
    FreeLParam(Msg.Msg, Msg.LParam);
  end;    
end;

procedure TClienteCyberMgr.SetServidor(Valor: TCMServidorBase);
begin
  if FServidor <> Valor then begin
    SetAtivo(False);
    FServidor := Valor;
  end;  
end;

procedure TClienteCyberMgr.tcServidorDesativado(var Msg: TMessage);
begin
  Desativou;
end;

procedure TClienteCyberMgr.AtivaTimerFundo;
begin
  FTimerFundo.Enabled := ((FNovoDesktop<>'') and (FNovoDesktop<>FArqDesktop)) or 
                         ((FNovoLogin<>'') and (FNovoLogin<>FArqLogin));
end;

procedure TClienteCyberMgr.Ativou;
begin
  if Assigned(FAoAtivar) then
    FAoAtivar(Self);   
end;

function TClienteCyberMgr.Permitido(Usuario: TCMUsuario; TipoAcesso: Integer): Boolean;
begin
  if Usuario.Admin then 
    Result := True
  else 
    Result := ItemTrueStr(Usuario.Direitos, TipoAcesso);
end;

procedure TClienteCyberMgr.ProcessaMensagens;
var Msg : TMsg;
begin
  while PeekMessage(Msg, FWndHandle, 0, 0, PM_REMOVE) do begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

procedure TClienteCyberMgr.ApagaObj(Obj: TCMClasse);
begin
  ChecaErro(Servidor.ApagaObj(Handle, Obj.TipoClasse, Obj.Chave));
end;

procedure TClienteCyberMgr.SalvaAlteracoesObj(Obj: TCMClasse; Novo: Boolean);
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

procedure TClienteCyberMgr.SalvaSenhaCli(aContato: Integer; aSenha: String);
begin
  ChecaErro(Servidor.SalvaSenhaCli(aContato, aSenha));
end;

procedure TClienteCyberMgr.LoginMaq(aMaq: Byte; aContato: Integer; aUsername, aSenha,
  aNome, aObsAcesso: String; aLimiteTempo: Cardinal; aSinal: Double; aTipoAcesso: Word);
begin
  ChecaErro(Servidor.LoginMaq(aMaq, aContato, aUsername, aSenha, aNome, aObsAcesso, aLimiteTempo, aSinal, aTipoAcesso));
end;

procedure TClienteCyberMgr.PreLogoutMaq(aMaq: Byte);
begin
  ChecaErro(Servidor.PreLogoutMaq(aMaq));
end;

procedure TClienteCyberMgr.CancLogoutMaq(aMaq: Byte);
begin
  ChecaErro(Servidor.CancLogoutMaq(aMaq));
end;
    
procedure TClienteCyberMgr.TransferirMaq(aOrigem, aDestino: Byte);
begin
  ChecaErro(Servidor.TransferirMaq(aOrigem, aDestino));
end;

procedure TClienteCyberMgr.PararMaq(aMaq: Byte; aParar: Boolean);
begin
  ChecaErro(Servidor.PararTempoMaq(aMaq, aParar));
end;

procedure TClienteCyberMgr.LiberarAlemPacote(aMaq: Byte);
begin
  ChecaErro(Servidor.LiberarAlemPacote(aMaq));
end;
    
procedure TClienteCyberMgr.LimpaArqsFundo;
var SR: TSearchRec;
begin
  FindFirst(ExtractFilePath(ParamStr(0))+'DESKTOP*.*', faAnyFile, SR);
  try
    repeat
      if (Pos('DESKTOP', UpperCase(SR.Name))=1) and
         SameText(ExtractFileExt(SR.Name), '.JPG') and
         (not SameText(ExtractFileName(FNovoDesktop), SR.Name)) then
      try
        DeleteFile(SR.Name);
      except
      end;   
    until (FindNext(SR)<>0);
  finally
    FindClose(SR);
  end;

  FindFirst(ExtractFilePath(ParamStr(0))+'LOGIN*.*', faAnyFile, SR);
  try
    repeat
      if (Pos('LOGIN', UpperCase(SR.Name))=1) and
         (SameText(ExtractFileExt(SR.Name), '.JPG') or 
          SameText(ExtractFileExt(SR.Name), '.GIF')) and
         (not SameText(ExtractFileName(FNovoLogin), SR.Name)) then
      try
        DeleteFile(SR.Name);
      except
      end;   
    until (FindNext(SR)<>0);
  finally
    FindClose(SR);
  end;
end;

procedure TClienteCyberMgr.LimpaFundo(aDesktop: Boolean);
begin
  ChecaErro(Servidor.LimpaFundo(aDesktop));
end;

procedure TClienteCyberMgr.LogoutMaq(aMaq: Byte);
begin
  ChecaErro(Servidor.LogoutMaq(aMaq));
end;

procedure TClienteCyberMgr.ModoManutencao(aMaq: Byte; aEntrar: Boolean);
begin
  ChecaErro(Servidor.ModoManutencao(aMaq, Username, Senha, aEntrar));
end;

procedure TClienteCyberMgr.SalvaTela(S: TMemoryStream);
begin
  ChecaErro(Servidor.SalvaTelaMaq(Maquina, S));
end;

function TClienteCyberMgr.CapturaTela(aMaq: Byte; S: TMemoryStream): Boolean;
begin
  Result := (Servidor.CapturaTelaMaq(aMaq, S)=0);
end;

procedure TClienteCyberMgr.ChecaArqFundo;
begin
  if not SameText(FNovoDesktop, FArqDesktop) then begin
    if (FNovoDesktop='') then begin
      if FArqDesktop>'' then
      try
        DeleteFile(FArqDesktop);
      except
      end;
      FArqDesktop := '';
    end else begin
      if FTransferindoArq <> taDesktop then 
      if FileExists(FNovoDesktop) then
      begin
        FArqDesktop := FNovoDesktop;
        if Assigned(FMudouFundo) then
          FMudouFundo(True);
      end;
    end;
  end;

  if not SameText(FNovoLogin, FArqLogin) then begin
    if (FNovoLogin='') then begin
      if FArqLogin>'' then
      try
        DeleteFile(FArqLogin);
      except
      end;
      FArqLogin := '';
    end else begin
      if FTransferindoArq <> taLogin then 
      if FileExists(FNovoLogin) then
      begin
        FArqLogin := FNovoLogin;
        if Assigned(FMudouFundo) then
          FMudouFundo(False);
      end;
    end;
  end;
  AtivaTimerFundo;
end;

procedure TClienteCyberMgr.RefreshPrecosServidor;
begin
  ChecaErro(Servidor.RefreshPrecos);
end;

procedure TClienteCyberMgr.ShutdownMaq(aMaq, aOper: Byte);
begin
  ChecaErro(Servidor.ShutdownMaq(aMaq, aOper));
end;

procedure TClienteCyberMgr.BaixaAtualizacao(Programa, Versao, ArqDestino: String);
var Erro: Integer;
begin
  Erro := Servidor.BaixaNovaVersao(Programa, Versao, ArqDestino);
  if not (Erro in [0, cmerrSemNovaVersao]) then
    Raise EErroCyberMgr.Create(Erro);
  FTransferindoArq := taAtualizacao;  
end;


function TClienteCyberMgr.MaquinaObj: TCMMaquina;
begin
  Result := Maquinas.PorNumero[Maquina];
end;

procedure TClienteCyberMgr.AdicionaPassaporte(aMaq: Byte; aSenha: String);
begin
  ChecaErro(Servidor.AdicionaPassaporte(aMaq, aSenha));
end;

procedure TClienteCyberMgr.PaginasImpressas(aMaq: Byte; aPaginas: Integer;
  aImp, aDoc: String);
begin
  ChecaErro(Servidor.RegistraPaginasImpressas(aMaq, aPaginas, aImp, aDoc));
end;

initialization
  Randomize;
  
end.
