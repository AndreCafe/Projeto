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
  cmClassesBase;

type
  THackTMClasse = class ( TCMClasse );
  TClienteCyberMgr = class;
  TEventoDespachoMC = procedure (var Msg: TMessage) of object;
  TEventoShutdown = procedure (Sender: TObject; Operacao: Byte) of object;
  
  TEventoTransfArq = procedure (Sender: Tobject; 
                                Etapa: Byte; 
                                MsgID, TamArq, Posicao: Integer; 
                                NomeArq: String; 
                                Enviando: Boolean) of object;

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

    FAoPedirTela       : TNotifyEvent;

    FAoDespacharMC     : TEventoDespachoMC;
    FAoTransferirArq   : TEventoTransfArq;
    
    FShutdown          : TEventoShutdown;
    FNumMaq            : Integer;
    FAutoAtualizar     : Boolean;
    FBaixandoAtualizacao: Boolean;
    FPrograma          : String;
    FArqDestino        : String;
    FVersao            : String;

    procedure SetAtivo(Valor: Boolean);
    procedure CriaWndHandle;
    procedure Notificacao(Obj: TCMClasse; TipoNot: TTipoNotificacao);
    procedure SetServidor(Valor: TCMServidorBase);
    
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
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure ProcessaMensagens;

    function Permitido(Usuario: TCMUsuario; Recurso, TipoAcesso: Integer): Boolean;
    
    procedure SalvaAlteracoesObj(Obj: TCMClasse; Novo: Boolean);
    procedure ApagaObj(Obj: TCMClasse);
    procedure SalvaTela(S: TMemoryStream);
    function CapturaTela(aMaq: Byte; S: TMemoryStream): Boolean;
    procedure RefreshPrecosServidor;
    procedure ShutdownMaq(aMaq, aOper: Byte);
    procedure BaixaAtualizacao(Programa, Versao, ArqDestino: String);

    procedure LoginMaq(aMaq: Byte; 
                       aContato: Integer; 
                       aUsername, aSenha, aNome, aObsAcesso: String; 
                       aLimiteTempo: Cardinal; 
                       aSinal: Double; 
                       aTipoAcesso: Word);
                       
    procedure LogoutMaq(aMaq: Byte);
    procedure PararMaq(aMaq: Byte; aParar: Boolean);
    procedure LiberarAlemPacote(aMaq: Byte);
    procedure TransferirMaq(aOrigem, aDestino: Byte);
    procedure PreLogoutMaq(aMaq: Byte);
    procedure CancLogoutMaq(aMaq: Byte);
    procedure ModoManutencao(aMaq: Byte; aEntrar: Boolean);

    function CriaClasseCS(TipoClasse: Integer): TClasseCS;
    function CriaTipoAcesso(InsereLista: Boolean): TCMTipoAcesso; virtual;
    function CriaMaquina(InsereLista: Boolean): TCMMaquina; virtual;
    function CriaUsuario(InsereLista: Boolean): TCMUsuario; virtual;
    function CriaGrupo(InsereLista: Boolean): TCMGrupo; virtual;
    function CriaCorPreco(InsereLista: Boolean): TCMCorPreco; virtual;

    property UA: TCMUsuario
      read FUsuarioAtual;

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

    property BaixandoAtualizacao: Boolean
      read FBaixandoAtualizacao;

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

    property AoTransferirArq: TEventoTransfArq
      read FAoTransferirArq write FAoTransferirArq;
      
    property Shutdown: TEventoShutdown
      read FShutdown write FShutdown;  
  end;

  function ClienteCMWndFunc(hWindow : Hwnd; Msg : UINT;
                            wParam : WPARAM;
                            lParam : LPARAM) : LRESULT; stdcall export;
  
const
  NomeClasseClienteCM = 'TClienteCyberMgr';  
  
implementation

uses
  cmListaID, cmIDRecursos;

{ TClienteCyberMgr }

constructor TClienteCyberMgr.Create(AOwner: TComponent);
begin
  inherited;
  FNumMaq        := 2;
  FCacheConexao  := False;
  
  FUsuarioAtual  := TCMUsuario.Create;

  FMaquinas      := TCMListaMaquinas.Create;
  FUsuarios      := TCMListaUsuarios.Create;
  FGrupos        := TCMListaGrupos.Create;
  FTiposAcesso   := TCMListaTipoAcesso.Create;
  FCorPrecos     := TCMListaCorPreco.Create;

  FConfig        := TCMConfig.Create;
  
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
  FBaixandoAtualizacao := False;
  FPrograma        := '';
  FArqDestino      := '';
  FVersao          := '';
  
  FAoAtivar             := nil;
  FAoDesativar          := nil;
  FAoDestruirMaquina    := nil;
  FAoAtualizarMaquina   := nil;
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
  FAoTransferirArq      := nil;
  
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
  inherited;
end;

procedure TClienteCyberMgr.Desativou;
begin
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
  LicStr : TLicencaStr;
begin
  if (Valor = FAtivo) or (FServidor=nil) then Exit;

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
        FBaixandoAtualizacao := True;
        Exit;
      end else
      if I <> cmerrSemNovaVersao then
        Raise EErroCyberMgr.Create(I);
    end;    
      
    try
      S := TMemoryStream.Create;
      try
        ChecaErro(FServidor.ObtemLicenca(LicStr));
        LicencaGlobal.AsString := LicStr;
      
        ChecaErro(FServidor.ObtemStreamConfig(S));
        FConfig.LeStream(S);
        S.Clear;
        
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
    Exit;
  end;
    
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
begin
  with PmsgTransfArqEv(Msg.lParam)^, msgTransfInfo do begin
    if not FAtivo then FServidor.Logout(FHandle);
    FBaixandoAtualizacao := (nmPos<>2);
    if Assigned(FAoTransferirArq) then
      FAoTransferirArq(Self, nmPos, nmSubMsgID, nmFileSize, nmFilePos, nmFileName, nmSending);
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

procedure TClienteCyberMgr.Ativou;
begin
  if Assigned(FAoAtivar) then
    FAoAtivar(Self);   
end;

function TClienteCyberMgr.Permitido(Usuario: TCMUsuario; Recurso, TipoAcesso: Integer): Boolean;
var
  I : Integer;
  Dir, Valor : String;
begin
  if Usuario.Admin then 
    Result := True
  else begin  
    Dir := Usuario.Direitos;
    for I := 0 to pred(FGrupos.Count) do with FGrupos[I] do
    if ListaContemStr(Usuario.Grupos, Nome) then 
      Dir := LISomaListas(Dir, Direitos);
        
    Valor := ObtemValor(Dir, IntToStr(Recurso));
    Result := LIContemID(Valor, TipoAcesso);
  end;  
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
end;


end.
