unit cmServCom;

interface

uses
  Windows,
  WinProcs,
  Messages,
  Classes, 
  SysUtils,
  ScktComp,
  ExtCtrls,
  CSCServer,
  CSCQueue,
  CSCBase,
  CSCTimer,
  lmdcompo,
  LMDVersionInfo,
  Dialogs,
  cmErros,
  cmNetMsg,
  cmMsgCom,
  cmServBase,
  cmCompCliente,
  cmClassesBase;
  
type
  TCMServComunicacao = class;
  
  TCMServComunicacao = class ( TComponent )
  private
    FServCom  : TCSCServer;
    FCliente  : TClienteCyberMgr;
    FAtivo    : Boolean;
    FWndHandle: HWND;
    FVersion  : TLmdVersionInfo;
    
    procedure EnviaEvento(MsgID: Integer; P: Pointer; Tam: Integer; Tipo: Byte);  
    procedure CriaWndHandle;

    procedure SetServidor(Valor: TCMServidorBase);
    function GetServidor: TCMServidorBase;

    procedure AoConectarCliente(Sender: TObject; Socket: TCustomWinSocket);
    procedure AoDesconectarCliente(Sender: TObject; Socket: TCustomWinSocket);

  protected
    procedure DespachaMC(var Msg: TMessage);
    procedure SetAtivo(Valor: Boolean); virtual;
    
  {---- TCP/IP Message Handlers -------------------------------------------}
  
    procedure nmLogin(var Msg: TCSCMessage);
              message cmnmLogin;

    procedure nmLogout(var Msg: TCSCMessage);
              message cmnmLogout;
              
    procedure nmObtemLista(var Msg: TCSCMessage);
              message cmnmObtemLista;

    procedure nmAlteraObj(var Msg: TCSCMessage);
              message cmnmAlteraObj;

    procedure nmNovoObj(var Msg: TCSCMessage);
              message cmnmNovoObj;

    procedure nmApagaObj(var Msg: TCSCMessage);
              message cmnmApagaObj;

    procedure nmLoginMaq(var Msg: TCSCMessage);
              message cmnmLoginMaq;
              
    procedure nmLogoutMaq(var Msg: TCSCMessage);
              message cmnmLogoutMaq;

    procedure nmPararTempoMaq(var Msg: TCSCMessage);
              message cmnmPararTempoMaq;

    procedure nmLiberarAlemPacote(var Msg: TCSCMessage);
              message cmnmLiberarAlemPacote;
              
    procedure nmTransferirMaq(var Msg: TCSCMessage);
              message cmnmTransferirMaq;
              
    procedure nmPreLogoutMaq(var Msg: TCSCMessage);
              message cmnmPreLogoutMaq;
              
    procedure nmCancLogoutMaq(var Msg: TCSCMessage);
              message cmnmCancLogoutMaq;

    procedure nmCapturaTelaMaq(var Msg: TCSCMessage);
              message cmnmCapturaTelaMaq;
              
    procedure nmSalvaTelaMaq(var Msg: TCSCMessage);
              message cmnmSalvaTelaMaq;

    procedure nmObtemStreamConfig(var Msg: TCSCMessage);
              message cmnmObtemStreamConfig;

    procedure nmRefreshPrecos(var Msg: TCSCMessage);
              message cmnmRefreshPrecos;

    procedure nmShutdown(var Msg: TCSCMessage);
              message cmnmShutdown;

    procedure nmBaixaAtualizacao(var Msg: TCSCMessage);          
              message cmnmBaixaAtualizacao;
              
    procedure nmObtemLicenca(var Msg: TCSCMessage);
              message cmnmObtemLicenca;

    procedure nmSalvaLicenca(var Msg: TCSCMessage);
              message cmnmSalvaLicenca;

    procedure nmModoManutencao(var Msg: TCSCMessage);
              message cmnmModoManutencao;
              
  {---- MsgCom Handlers ---------------------------------------------------}
  
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

  public
    procedure ProcessaRequestsPendentes;
    
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure RefreshLic;

  published
    property Servidor: TCMServidorBase
      read GetServidor write SetServidor;

    property Ativo: Boolean
      read FAtivo write SetAtivo;  
  end;

  function CMServComWndFunc(hWindow : Hwnd; Msg : UINT;
                            wParam : WPARAM;
                            lParam : LPARAM) : LRESULT; stdcall export;
  
var
  GlobalNotifyHandle : HWND = 0;
    
const
  CMServComClassName = 'CMServComunicacao';
  
implementation

uses uLicenca;

procedure FreeObj(var Obj);
var P : TObject;
begin
  if TObject(Obj) <> nil then begin
    P := TObject(Obj);
    TObject(Obj) := nil;
    P.Free;
  end;  
end;


{ TCMServComunicacao }

constructor TCMServComunicacao.Create(aOwner: TComponent);
begin
  inherited;
  FVersion := TLmdVersionInfo.Create(Self);
  
  FAtivo := False;
  FCliente := TClienteCyberMgr.Create(Self);
  FCliente.AoDespacharMC := DespachaMC;
  FCliente.Username := ProxyUsername;
  FCliente.Senha    := ProxySenha;
  
  FServCom  := TCSCServer.Create(nil);
  CriaWndHandle;
  FServCom.NotifyHandle := FWndHandle;
  FServCom.Port         := ptCyberMgr;
  FServCom.OnConnect    := AoConectarCliente;
  FServCom.OnDisconnect := AoDesconectarCliente;
  GlobalNotifyHandle := FWndHandle;
  
  FServCom.Listening    := False;
end;

destructor TCMServComunicacao.Destroy;
var T: TCSCTimer;
begin
  SetTimer(T, 1000);
  while not HasTimerExpired(T) and (FServCom.Daemon.Socket.ActiveConnections > 0) do 
    FServCom.WinsockBreath;

  FCliente.ProcessaMensagens; 

  SetAtivo(False);
    
  FServCom.Free;
  FServCom := nil;

  FCliente.Ativo := False;
  FCliente.Free;
  FVersion.Free;

  inherited;
end;

procedure TCMServComunicacao.CriaWndHandle;
var XClass : TWndClass;
begin
  XClass.hInstance := HInstance;
  with XClass do begin
    Style         := 0;
    lpfnWndProc   := @CMServComWndFunc;
    cbClsExtra    := 0;
    cbWndExtra    := SizeOf(Pointer);
    hIcon         := LoadIcon(hInstance, 'DEFICON');
    hCursor       := LoadCursor(0, idc_Arrow);
    hbrBackground := 0;
    lpszMenuName  := nil;
    lpszClassName := CMServComClassName;
  end;
  WinProcs.RegisterClass(XClass);

  FWndHandle :=
    CreateWindow(CMServComClassName,     {window class name}
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

function CMServComWndFunc(hWindow : Hwnd; Msg : UINT;
                          wParam : WPARAM;
                          lParam : LPARAM) : LRESULT; stdcall export;
var
  Obj : TCMServComunicacao;
  
  function DefWndFunc : LongInt;
  begin
    DefWndFunc := DefWindowProc(hWindow, Msg, wParam, lParam);
  end;

begin
  Result := 0;
  Obj := nil;

  if MSG<>wm_Create then begin
    Obj := TCMServComunicacao(GetWindowLong(hWindow, 0));
    if Obj=nil then begin 
      Result := DefWndFunc;
      Exit;
    end;
  end;

  case Msg of
    cscm_EventReceived : 
      Obj.ProcessaRequestsPendentes;

    cscm_RefreshLic :
      Obj.RefreshLic;  
  else 
    Result := DefWndFunc;
  end;
end;

procedure TCMServComunicacao.ProcessaRequestsPendentes;
var DataMsg : PCSCMessage;
begin
  while true do begin
    if (FServCom=nil) then Exit;
    DataMsg := FServCom.MsgQueue.ExamineEvents;
    if (DataMsg = nil) then Exit;
    FServCom.MsgQueue.RemoveEventFromQueue(DataMsg);
    try
      Dispatch(DataMsg^);
    except
    end;
    FServCom.MsgQueue.DisposeEvent(DataMsg);
  end;
end;



{--- Processamento de Mensagens TCP-IP ----------------------------------}

procedure TCMServComunicacao.nmCapturaTelaMaq(var Msg: TCSCMessage);
var 
  S : TMemoryStream;
  Erro : Integer;
begin
  with Msg, TnmCapturaTela(dmData^) do begin
    S := TMemoryStream.Create;
    Erro := FCliente.Servidor.CapturaTelaMaq(nmMaq, S);
    try
      if Erro <> 0 then 
        FServCom.SendMsg(dmMsg, False, dmClientSck, nil, 0, nmdStream, Erro)
      else
        FServCom.SendMsg(dmMsg, False, dmClientSck, S, S.Size, nmdStream, 0);
    finally
      FreeObj(S);
    end;
  end;  
end;
              
procedure TCMServComunicacao.nmSalvaTelaMaq(var Msg: TCSCMessage);
var 
  Erro: Integer;
  S : TMemoryStream;
  Maq : Byte;
begin
  with Msg do begin
    S := TMemoryStream(dmData);
    S.Position := S.Size-1;
    if S.Size > 1 then 
      S.Read(Maq, 1)
    else
      Maq := 0;  
    S.Position := 0;
    S.SetSize(pred(S.Size));
    Erro := Servidor.SalvaTelaMaq(Maq, S);
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, Erro);
  end;
end;

procedure TCMServComunicacao.nmLogin(var Msg: TCSCMessage);
var 
  Erro  : integer;
  Reply : TnmLoginRpy;
begin
  with Msg, TnmLoginReq(dmData^) do begin
    if nmProxyHandle = 0 then
      nmProxyHandle := FCliente.Handle;
    Erro := Servidor.Login(nmUsername, nmSenha, nmMaq, nmFuncAtual, True, 0, nmProxyHandle, Integer(dmClientSck), Reply.nmHandle);
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     @Reply, SizeOf(Reply), nmdByteArray, Erro);
  end;                     
end;

procedure TCMServComunicacao.nmLogout(var Msg: TCSCMessage);
begin
  with Msg do begin
    Servidor.Logout(Integer(dmData^));
    FServCom.SendMsg(dmMsg, False, dmClientSck, nil, 0, nmdByteArray, 0);
  end;  
end;


procedure TCMServComunicacao.nmObtemLista(var Msg: TCSCMessage);
var 
  S : TStream;
  Erro : Integer;
begin
  with Msg, TnmObtemListaReq(dmData^) do begin
    S := TMemoryStream.Create;
    Erro := 0;
    try
      try
        case nmTipoClasse of
          tcMaquina : Erro := FCliente.Servidor.ObtemStreamListaObj(FCliente.Handle, tcMaquina, S);
          tcUsuario : FCliente.Usuarios.SalvaStream(S);
          tcTipoAcesso : FCliente.TiposAcesso.SalvaStream(S);
          tcCorPreco : FCliente.CorPrecos.SalvaStream(S);
        else
          Erro := cmerrTipoClasseInvalido;
        end;
      except
        Erro := cmerrExcecaoNaoTratada;
      end;
      if Erro <> 0 then 
        FServCom.SendMsg(dmMsg, False, dmClientSck, nil, 0, nmdStream, Erro)
      else
        FServCom.SendMsg(dmMsg, False, dmClientSck, S, S.Size, nmdStream, 0);
    finally
      FreeObj(S);
    end;
  end;  
end;

procedure TCMServComunicacao.nmNovoObj(var Msg: TCSCMessage);
begin
  nmAlteraObj(Msg);
end;

procedure TCMServComunicacao.nmAlteraObj(var Msg: TCSCMessage);
var Erro: Integer;
begin
  with Msg, TStream(dmData) do begin
    Position := 0;
    Erro := Servidor.SalvaStreamObj((dmMsg=cmnmNovoObj), TStream(dmData));
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, Erro);
  end;
end;

procedure TCMServComunicacao.nmApagaObj(var Msg: TCSCMessage);
begin
  with Msg, PnmObj(dmData)^ do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, 
                     Servidor.ApagaObj(nmCliente, nmTipoClasse, nmChave));
end;

{--- Processamento de Mensagens Thread-Com ------------------------------}

procedure TCMServComunicacao.tcAtualizaObj(var Msg: TMessage);
var S : TStream;
begin
  S := TStream(Msg.lParam);
  if S <> nil then begin
    S.Position := 0;
    EnviaEvento(cmnmAtualizaObjEv, S, S.Size, nmdStream);
  end;  
end;

procedure TCMServComunicacao.tcShutdown(var Msg: TMessage);
var Evento : TnmShutdown;
begin
  with Msg, Evento do begin
    nmMaq  := PmsgShutdown(LParam)^.msgMaq;
    nmOper := PmsgShutdown(LParam)^.msgOper;
  end;  
  EnviaEvento(cmnmShutdownEv, @Evento, SizeOf(Evento), nmdByteArray);
end;

procedure TCmServComunicacao.tcPedeTela(var Msg: TMessage);
var Evento: TnmCapturaTela;
begin
  Evento.nmMaq := Msg.WParam;
  EnviaEvento(cmnmPedeTelaEv, @Evento, SizeOf(Evento), nmdByteArray);
end;

procedure TCMServComunicacao.tcDestroiObj(var Msg: TMessage);
var Evento: TnmObj;
begin
  with Msg do begin
    Evento.nmTipoClasse := PmsgDestroiObj(LParam)^.msgTipoClasse;
    Evento.nmChave := PmsgDestroiObj(lParam)^.msgChave;
    EnviaEvento(cmnmDestroiObjEv, @Evento, SizeOf(Evento), nmdByteArray);
  end;  
end;

procedure TCMServComunicacao.tcNovoObj(var Msg: TMessage);
var S : TStream;
begin
  S := TStream(Msg.lParam);
  if S <> nil then begin
    S.Position := 0;
    EnviaEvento(cmnmNovoObjEv, S, S.Size, nmdStream);
  end;  
end;

procedure TCMServComunicacao.EnviaEvento(MsgID: Integer; P: Pointer;
  Tam: Integer; Tipo: Byte);
var I : Integer;
begin
  with FServCom, Daemon.Socket do
    for I := 0 to pred(ActiveConnections) do 
    if Integer(Connections[I].Data) <> -1 then
      SendMsg(MsgID, True, Connections[I], P, Tam, Tipo, 0);
end;

procedure TCMServComunicacao.SetServidor(Valor: TCMServidorBase);
begin
  if Valor = Servidor then Exit;
  FServCom.Listening := False;
  FCliente.Servidor := Valor;
end;

procedure TCMServComunicacao.SetAtivo(Valor: Boolean);
begin
  if (Valor = FAtivo) or (Valor and (Servidor=nil)) then Exit;
  FCliente.Ativo := Valor;
  FServCom.Listening := Valor;
  FAtivo := Valor;
end;

function TCMServComunicacao.GetServidor: TCMServidorBase;
begin
  Result := FCliente.Servidor;
end;

procedure TCMServComunicacao.DespachaMC(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

procedure TCMServComunicacao.tcServidorDesativado(var Msg: TMessage);
begin
  FServCom.Listening := False;
  FAtivo := False;
end;

procedure TCMServComunicacao.AoConectarCliente(Sender: TObject;
  Socket: TCustomWinSocket);
begin
end;

procedure TCMServComunicacao.AoDesconectarCliente(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  if Ativo then begin
    Socket.Data := Pointer(-1);
    Servidor.LogoutSocket(Integer(Socket));
  end;  
end;

procedure TCMServComunicacao.nmLoginMaq(var Msg: TCSCMessage);
begin
  with Msg, TnmLoginMaqReq(dmData^) do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, 
                     Servidor.LoginMaq(nmMaq, nmContato, nmUsername, nmSenha, nmNome, nmObs, nmLimiteTempo, nmSinal, nmTipoAcesso));
end;

procedure TCMServComunicacao.nmLogoutMaq(var Msg: TCSCMessage);
begin
  with Msg, TnmLogoutMaqReq(dmData^) do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, 
                     Servidor.LogoutMaq(nmMaq));
end;

procedure TCMServComunicacao.nmTransferirMaq(var Msg: TCSCMessage);
begin
  with Msg, TnmTransferirMaqReq(dmData^) do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, 
                     Servidor.TransferirMaq(nmOrigem, nmDestino));
end;

procedure TCMServComunicacao.nmPararTempoMaq(var Msg: TCSCMessage);
begin
  with Msg, TnmPararTempoMaqReq(dmData^) do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, 
                     Servidor.PararTempoMaq(nmMaq, nmParar));
end;

procedure TCMServComunicacao.nmLiberarAlemPacote(var Msg: TCSCMessage);
begin
  with Msg, TnmLiberarAlemPacoteReq(dmData^) do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, 
                     Servidor.LiberarAlemPacote(nmMaq));
end;

procedure TCMServComunicacao.nmPreLogoutMaq(var Msg: TCSCMessage);
begin
  with Msg, TnmLogoutMaqReq(dmData^) do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, 
                     Servidor.PreLogoutMaq(nmMaq));
end;

procedure TCMServComunicacao.nmCancLogoutMaq(var Msg: TCSCMessage);
begin
  with Msg, TnmLogoutMaqReq(dmData^) do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, 
                     Servidor.CancLogoutMaq(nmMaq));
end;

procedure TCMServComunicacao.nmObtemStreamConfig(var Msg: TCSCMessage);
var 
  S: TStream;
  Erro: Integer;
begin
  S := TMemoryStream.Create;
  with Msg do
  try
    Erro := Servidor.ObtemStreamConfig(S);
    if Erro=0 then
      FServCom.SendMsg(dmMsg, False, dmClientSck, Pointer(S), S.Size, nmdStream, 0)
    else
      FServCom.SendMsg(dmMsg, False, dmClientSck, nil, 0, 0, Erro);
  finally
    S.Free;
  end;                         
end;

procedure TCMServComunicacao.nmRefreshPrecos(var Msg: TCSCMessage);
begin
  with Msg do
  FServCom.SendMsg(dmMsg, False, dmClientSck, nil, 0, nmdByteArray, Servidor.RefreshPrecos);
end;

procedure TCMServComunicacao.nmShutdown(var Msg: TCSCMessage);
begin
  with Msg, TnmShutdown(dmData^) do 
  FServCom.SendMsg(dmMsg, False, dmClientSck, nil, 0, nmdByteArray, Servidor.ShutdownMaq(nmMaq, nmOper));
end;

procedure TCMServComunicacao.nmBaixaAtualizacao(var Msg: TCSCMessage);
var
  Erro    : integer;
  Versao  : String;
  NArq    : String;
begin
  with Msg, TnmBaixaAtualizacao(dmData^) do begin
    Erro := 0;
    NArq := ExtractFilePath(ParamStr(0)) + 'Atualiza\'+nmPrograma;
    try
      FVersion.RetrieveFilename := '';
      FVersion.RetrieveFilename := NArq;
      Versao := FVersion.FileVersion;

      if Versao>'' then 
        Versao := FormataNumVersao(Versao);

      if Versao <= nmVersao then
        Erro := cmerrSemNovaVersao;
        
    except
      Erro := cmerrSemNovaVersao;
    end;
    if Erro = 0 then
      Erro := FServCom.MsgQueue.TransmitFile(dmClientSck,
                                             NArq, nmNomeArq,
                                             nmPrograma,
                                             Erro, 0, dmMsg);
    FServCom.SendMsg(dmMsg, False,
                     dmClientSck,
                     nil, 0, nmdByteArray, Erro);
                                             
  end;
end;

procedure TCMServComunicacao.nmObtemLicenca(var Msg: TCSCMessage);
var Reply: TnmLicenca;
begin
  with Msg do 
  FServCom.SendMsg(dmMsg, False, dmClientSck, @Reply, SizeOf(Reply), nmdByteArray, 
                   Servidor.ObtemLicenca(Reply.nmLicencaStr));
end;

procedure TCMServComunicacao.nmSalvaLicenca(var Msg: TCSCMessage);
begin
  with Msg, TnmLicenca(dmData^) do 
  FServCom.SendMsg(dmMsg, False, dmClientSck, nil, 0, nmdByteArray, 
                   Servidor.SalvaLicenca(nmLicencaStr));
end;

procedure TCMServComunicacao.nmModoManutencao(var Msg: TCSCMessage);
begin
  with Msg, TnmModoManutencaoReq(dmData^)  do 
  FServCom.SendMsg(dmMsg, False, dmClientSck, nil, 0, nmdByteArray, 
                   Servidor.ModoManutencao(nmMaq, nmUsername, nmSenha, nmEntrar));

end;

procedure TCMServComunicacao.RefreshLic;
begin
  LicencaGlobal.LeArquivoPadrao;
  LicencaGlobal.LeSerialHD;
end;

end.
