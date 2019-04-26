unit ncServCom;

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
  ncSessao,
  ncDebug,
  ncErros,
  ncNetMsg,
  ncMsgCom,
  ncServBase,
  ncCredTempo,
  ncMovEst,
  ncDebito,
  ncImpressao,
  ncCompCliente,
  ncClassesBase;
  
type
  TncServComunicacao = class;
  
  TncServComunicacao = class ( TComponent )
  private
    FServCom  : TCSCServer;
    FCliente  : TClienteNexCafe;
    FAtivo    : Boolean;
    FWndHandle: HWND;
    FVersion  : TLmdVersionInfo;
    FTimerR   : TTimer;
    FTimerHora: TTimer;
    FSockLic  : Integer;
    
    procedure EnviaEvento(MsgID: Integer; P: Pointer; Tam: Integer; Tipo: Byte);  
    procedure CriaWndHandle;

    procedure SetServidor(Valor: TncServidorBase);
    function GetServidor: TncServidorBase;

    procedure AoConectarCliente(Sender: TObject; Socket: TCustomWinSocket);
    procedure AoDesconectarCliente(Sender: TObject; Socket: TCustomWinSocket);

    procedure OnTimerR(Sender: TObject);
    procedure OnTimerHora(Sender: TObject);

  protected
    procedure DespachaMC(var Msg: TMessage);
    procedure SetAtivo(Valor: Boolean); virtual;
    
  {---- TCP/IP Message Handlers -------------------------------------------}
  
    procedure nmLogin(var Msg: TCSCMessage);
              message ncnmLogin;
                     
    procedure nmLogout(var Msg: TCSCMessage);
              message ncnmLogout;
              
    procedure nmObtemLista(var Msg: TCSCMessage);
              message ncnmObtemLista;

    procedure nmAlteraObj(var Msg: TCSCMessage);
              message ncnmAlteraObj;

    procedure nmNovoObj(var Msg: TCSCMessage);
              message ncnmNovoObj;

    procedure nmApagaObj(var Msg: TCSCMessage);
              message ncnmApagaObj;

    procedure nmLoginMaq(var Msg: TCSCMessage);
              message ncnmLoginMaq;
              
    procedure nmLogoutMaq(var Msg: TCSCMessage);
              message ncnmLogoutMaq;

    procedure nmPararTempoMaq(var Msg: TCSCMessage);
              message ncnmPararTempoMaq;

    procedure nmTransferirMaq(var Msg: TCSCMessage);
              message ncnmTransferirMaq;
              
    procedure nmPreLogoutMaq(var Msg: TCSCMessage);
              message ncnmPreLogoutMaq;
              
    procedure nmCancLogoutMaq(var Msg: TCSCMessage);
              message ncnmCancLogoutMaq;

    procedure nmCapturaTelaMaq(var Msg: TCSCMessage);
              message ncnmCapturaTelaMaq;
              
    procedure nmSalvaTelaMaq(var Msg: TCSCMessage);
              message ncnmSalvaTelaMaq;

    procedure nmObtemStreamConfig(var Msg: TCSCMessage);
              message ncnmObtemStreamConfig;

    procedure nmRefreshPrecos(var Msg: TCSCMessage);
              message ncnmRefreshPrecos;

    procedure nmRefreshEspera(var Msg: TCSCMessage);
              message ncnmRefreshEspera;

    procedure nmShutdown(var Msg: TCSCMessage);
              message ncnmShutdown;

    procedure nmSuporteRem(var Msg: TCSCMessage);
              message ncnmSuporteRem;          

    procedure nmBaixaAtualizacao(var Msg: TCSCMessage);          
              message ncnmBaixaAtualizacao;
              
    procedure nmModoManutencao(var Msg: TCSCMessage);
              message ncnmModoManutencao;

    procedure nmAdicionaPassaporte(var Msg: TCSCMessage);
              message ncnmAdicionaPassaporte;

    procedure nmPaginasImpressas(var Msg: TCSCMessage);
              message ncnmPaginasImpressas;

    procedure nmAvisos(var Msg: TCSCMessage);
              message ncnmAvisos;

    procedure nmObtemPastaServ(var Msg: TCSCMessage);
              message ncnmObtemPastaServ;
              
    procedure nmArqFundoEnviado(var Msg: TCSCMessage);
              message ncnmArqFundoEnviado;

    procedure nmLimpaFundo(var Msg: TCSCMessage);
              message ncnmLimpaFundo;

    procedure nmObtemSenhaCli(var Msg: TCSCMessage);
              message ncnmObtemSenhaCli;
              
    procedure nmSalvaSenhaCli(var Msg: TCSCMessage);
              message ncnmSalvaSenhaCli;

    procedure nmEnviaChat(var Msg: TCSCMessage);
              message ncnmEnviaChat;

    procedure nmSalvaCredTempo(var Msg: TCSCMessage);
              message ncnmSalvaCredTempo;

    procedure nmSalvaMovEst(var Msg: TCSCMessage);
              message ncnmSalvaMovEst;

    procedure nmSalvaDebito(var Msg: TCSCMessage);
              message ncnmSalvaDebito;

    procedure nmSalvaLancExtra(var Msg: TCSCMessage);
              message ncnmSalvaLancExtra;

    procedure nmSalvaDebTempo(var Msg: TCSCMessage);
              message ncnmSalvaDebTempo;

    procedure nmSalvaImpressao(var Msg: TCSCMessage);
              message ncnmSalvaImpressao;

    procedure nmAlteraSessao(var Msg: TCSCMessage);
              message ncnmAlteraSessao;

    procedure nmRefreshSessao(var Msg: TCSCMessage);
              message ncnmRefreshSessao;

    procedure nmCancelaTran(var Msg: TCSCMessage);
              message ncnmCancelaTran;  

    procedure nmAbreCaixa(var Msg: TCSCMessage);
              message ncnmAbreCaixa;

    procedure nmFechaCaixa(var Msg: TCSCMessage);
              message ncnmFechaCaixa;

    procedure nmCorrigeDataCaixa(var Msg: TCSCMessage);
              message ncnmCorrigeDataCaixa;          

    procedure nmAjustaPontosFid(var Msg: TCSCMessage);
              message ncnmAjustaPontosFid;

    procedure nmObtemProcessos(var Msg: TCSCMessage);
              message ncnmObtemProcessos;    

    procedure nmFinalizaProcesso(var Msg: TCSCMessage);
              message ncnmFinalizaProcesso;

    procedure nmSalvaProcessos(var Msg: TCSCMessage);
              message ncnmSalvaProcessos;

    procedure nmObtemSitesBloq(var Msg: TCSCMessage);
              message ncnmObtemSitesBloq;

    procedure nmPermitirDownload(var Msg: TCSCMessage);
              message ncnmPermitirDownload;

    procedure nmSalvaLic(var Msg: TCSCMessage);
              message ncnmSalvaLic;

    procedure nmObtemPatrocinios(var Msg: TCSCMessage);
              message ncnmObtemPatrocinios;

    procedure nmSalvaAppUrlLog(var Msg: TCSCMessage);           
              message ncnmSalvaAppUrlLog;

    procedure nmKeepAlive(var Msg: TCSCMessage);           
              message ncnmKeepAlive;
  {---- MsgCom Handlers ---------------------------------------------------}
  
    procedure tcAtualizaObj(var Msg: TMessage);
              message ncmc_AtualizaObj;
              
    procedure tcNovoObj(var Msg: TMessage);
              message ncmc_NovoObj;
              
    procedure tcDestroiObj(var Msg: TMessage);
              message ncmc_DestroiObj;

    procedure tcServidorDesativado(var Msg: TMessage);
              message ncmc_ServidorDesativado;

    procedure tcPedeTela(var Msg: TMessage);
              message ncmc_PedeTela;

    procedure tcShutdown(var Msg: TMessage);
              message ncmc_Shutdown;

    procedure tcChatEv(var Msg: TMessage);
              message ncmc_ChatEv;

    procedure tcSuporteRemEv(var Msg: TMessage);
              message ncmc_SuporteRemEv;              

    procedure tcAbriuFechouCaixaEv(var Msg: TMessage);
              message ncmc_AbriuFechouCaixa; 

    procedure tcSiteBloqueadoEv(var Msg: TMessage);
              message ncmc_SiteBloqueado; 

  public
    procedure ProcessaRequestsPendentes;
    
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    property Servidor: TncServidorBase
      read GetServidor write SetServidor;

    property Ativo: Boolean
      read FAtivo write SetAtivo;  
  end;

  function CMServComWndFunc(hWindow : Hwnd; Msg : UINT;
                            wParam : WPARAM;
                            lParam : LPARAM) : LRESULT; stdcall export;
  
var
  GlobalNotifyHandle : HWND = 0;
  InternalCliHandle  : HWND = 0;
    
const
  NCServComClassName = 'NCServComunicacao';
  
implementation

uses uLicEXECryptor, ncLancExtra, ncDebTempo, ncSyncLic;

procedure FreeObj(var Obj);
var P : TObject;
begin
  if TObject(Obj) <> nil then begin
    P := TObject(Obj);
    TObject(Obj) := nil;
    P.Free;
  end;  
end;


{ TncServComunicacao }

constructor TncServComunicacao.Create(aOwner: TComponent);
begin
  inherited;
  FVersion := TLmdVersionInfo.Create(Self);
  FSockLic := -1;
  
  FTimerR := TTimer.Create(nil);
  FTimerR.OnTimer := OnTimerR;
  FTimerR.Interval := (4*60*1000) + Random(2*60*1000);
  FTimerR.Enabled := True;

  FTimerHora := TTimer.Create(nil);
  FTimerHora.OnTimer := OnTimerHora;
  FTimerHora.Interval := 60000;
  FTimerHora.Enabled := True;
  
  FAtivo := False;
  FCliente := TClienteNexCafe.Create(Self);
  FCliente.AoDespacharMC := DespachaMC;
  FCliente.Username := ProxyUsername;
  FCliente.Senha    := ProxySenha;

  InternalCliHandle := FCliente.WndHandle;
  
  FServCom  := TCSCServer.Create(nil);
  CriaWndHandle;
  FServCom.NotifyHandle := FWndHandle;
  FServCom.Port         := 16201;
  FServCom.OnConnect    := AoConectarCliente;
  FServCom.OnDisconnect := AoDesconectarCliente;
  GlobalNotifyHandle := FWndHandle;
  
  FServCom.Listening    := False;
end;

destructor TncServComunicacao.Destroy;
var T: TCSCTimer;
begin
  SetTimer(T, 1000);
  while not HasTimerExpired(T) and (FServCom.Daemon.Socket.ActiveConnections > 0) do 
    FServCom.WinsockBreath(0);

  FCliente.ProcessaMensagens; 

  SetAtivo(False);
    
  FServCom.Free;
  FServCom := nil;

  FCliente.Ativo := False;
  FCliente.Free;
  FVersion.Free;
  FTimerR.Free;
  FTimerHora.Free;

  inherited;
end;

procedure TncServComunicacao.CriaWndHandle;
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
    lpszClassName := NCServComClassName;
  end;
  WinProcs.RegisterClass(XClass);

  FWndHandle :=
    CreateWindow(NCServComClassName,     {window class name}
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
  Obj : TncServComunicacao;
  
  function DefWndFunc : LongInt;
  begin
    DefWndFunc := DefWindowProc(hWindow, Msg, wParam, lParam);
  end;

begin
  Result := 0;
  Obj := nil;

  if MSG<>wm_Create then begin
    Obj := TncServComunicacao(GetWindowLong(hWindow, 0));
    if Obj=nil then begin 
      Result := DefWndFunc;
      Exit;
    end;
  end;

  try
    case Msg of
      cscm_EventReceived : 
        Obj.ProcessaRequestsPendentes;

      cscm_FileEventReceived : 
        Obj.ProcessaRequestsPendentes;
    else 
      Result := DefWndFunc;
    end;
  except
  end;
end;

procedure TncServComunicacao.ProcessaRequestsPendentes;
var 
  DataMsg : PCSCMessage;
  C : TncCliente;
begin
  while true do begin
    if (FServCom=nil) then Exit;
    DataMsg := FServCom.MsgQueue.ExamineEvents;
    if (DataMsg = nil) then Exit;
    DebugMsg('TncServComunicacao.ProcessaRequestPendentes - DataMsg.dmClientSck: ' + 
             IntToStr(Integer(DataMsg^.dmClientSck)) + ' - DataMsg.Msg: ' +
             IntToStr(DataMsg^.dmMsg));
    FServCom.MsgQueue.RemoveEventFromQueue(DataMsg);
    try
      C := Servidor.ObtemClientePorSocket(Integer(DataMsg^.dmClientSck));
      if C<>nil then begin
        UsernameAtual := C.Username;
        HandleCliAtual := C.Handle;
      end else begin
        UsernameAtual := '';
        HandleCliAtual := -1;
      end;
      Dispatch(DataMsg^);
    except
    end;
    FServCom.MsgQueue.DisposeEvent(DataMsg);
  end;
end;



{--- Processamento de Mensagens TCP-IP ----------------------------------}

procedure TncServComunicacao.nmCapturaTelaMaq(var Msg: TCSCMessage);
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
              
procedure TncServComunicacao.nmCorrigeDataCaixa(var Msg: TCSCMessage);
begin
  with Msg, TnmCorrigeDataCaixaReq(dmData^) do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, 
                     Servidor.CorrigeDataCaixa(nmFunc, nmCaixa, nmNovaAbertura, nmNovoFechamento));
end;

procedure TncServComunicacao.nmEnviaChat(var Msg: TCSCMessage);
var 
  S: TStream;
  SL: TStrings;
  De, Para: Integer;
begin
  S := TStream(Msg.dmData);
  S.Position := 0;
  SL := TStringList.Create;
  try
    SL.LoadFromStream(S);
    De := StrToInt(SL.Values['de']);
    Para := StrToInt(SL.Values['para']);
    SL.Delete(0);
    SL.Delete(0);
    SL.Delete(0);
    SL.Delete(0);
    with Msg do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, Servidor.EnviarMsg(De, Para, SL.Text));
  finally
    SL.Free;
  end;
end;

procedure TncServComunicacao.nmFechaCaixa(var Msg: TCSCMessage);
begin
  with Msg, TnmFechaCaixaReq(dmData^) do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, Servidor.FechaCaixa(nmFunc, nmID));
end;

procedure TncServComunicacao.nmFinalizaProcesso(var Msg: TCSCMessage);
begin
  with Msg do begin
    FServCom.SendMsg(dmMsg, False, dmClientSck, nil, 0, nmdByteArray, 0);
    DebugMsg('TncServComunicacao.nmFinalizaProcesso');
    EnviaEvento(ncnmFinalizaProcessoEv, Msg.dmData, SizeOf(TnmFinalizaProcesso), nmdByteArray);
  end;
end;

procedure TncServComunicacao.nmKeepAlive(var Msg: TCSCMessage);
begin
  FServCom.SendMsg(ncnmKeepAlive, False, Msg.dmClientSck, nil, 0, nmdByteArray, 0);
end;

procedure TncServComunicacao.nmSalvaTelaMaq(var Msg: TCSCMessage);
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

procedure TncServComunicacao.nmLogin(var Msg: TCSCMessage);
var 
  Erro  : integer;
  Reply : TnmLoginRpy;
begin
  with Msg, TnmLoginReq(dmData^) do begin
    if nmProxyHandle = 0 then
      nmProxyHandle := FCliente.Handle;
    Erro := Servidor.Login(nmUsername, nmSenha, nmMaq, nmFuncAtual, True, 0, nmProxyHandle, Integer(dmClientSck), '', Reply.nmHandle);
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     @Reply, SizeOf(Reply), nmdByteArray, Erro);
  end;                     
end;

procedure TncServComunicacao.nmLogout(var Msg: TCSCMessage);
begin
  with Msg do begin
    Servidor.Logout(Integer(dmData^));
    FServCom.SendMsg(dmMsg, False, dmClientSck, nil, 0, nmdByteArray, 0);
  end;  
end;


procedure TncServComunicacao.nmObtemLista(var Msg: TCSCMessage);
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
          tcSessao  : Erro := FCliente.Servidor.ObtemStreamListaObj(FCliente.Handle, tcSessao, S);
          tcTipoAcesso : gTiposAcesso.SalvaStream(S);
          tcTarifa : gTarifas.SalvaStream(S);
        else
          Erro := ncerrTipoClasseInvalido;
        end;
      except
        Erro := ncerrExcecaoNaoTratada;
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

procedure TncServComunicacao.nmObtemPastaServ(var Msg: TCSCMessage);
var 
  S : String;
  Erro : Integer;
  Reply : TnmNomeArq;
begin
  with Msg do begin
    Erro := Servidor.ObtemPastaServ(S);
    Reply.nmNomeArq := S;
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     @Reply, SizeOf(Reply), nmdByteArray, Erro);
  end;                     
end;

procedure TncServComunicacao.nmObtemPatrocinios(var Msg: TCSCMessage);
var 
  S: TStream;
  SL: TStrings;
  Erro : Integer;
begin
  with Msg do begin
    S := TMemoryStream.Create;
    SL := TStringList.Create;
    try
      Erro := Servidor.ObtemPatrocinios(SL);  
      SL.SaveToStream(S);    
      FServCom.SendMsg(dmMsg, False, dmClientSck, S, S.Size, nmdStream, Erro);
    except
    end;
    SL.Free;
    S.Free;
  end;
end;

procedure TncServComunicacao.nmObtemProcessos(var Msg: TCSCMessage);
begin
  with Msg do begin
    FServCom.SendMsg(dmMsg, False, dmClientSck, nil, 0, nmdByteArray, 0);
    DebugMsg('TncServComunicacao.nmObtemProcessos');
    EnviaEvento(ncnmObtemProcessosEv, Msg.dmData, SizeOf(TnmObtemProcessos), nmdByteArray);
  end;
end;

procedure TncServComunicacao.nmNovoObj(var Msg: TCSCMessage);
begin
  nmAlteraObj(Msg);
end;

procedure TncServComunicacao.nmAlteraObj(var Msg: TCSCMessage);
var Erro: Integer;
begin
  with Msg, TStream(dmData) do begin
    Position := 0;
    Erro := Servidor.SalvaStreamObj((dmMsg=ncnmNovoObj), TStream(dmData));
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, Erro);
  end;
end;

procedure TncServComunicacao.nmRefreshSessao(var Msg: TCSCMessage);
begin
  with Msg, TnmSessao(dmData^) do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, 
                     Servidor.ForceRefreshSessao(nmSessao));
end;

procedure TncServComunicacao.nmAlteraSessao(var Msg: TCSCMessage);
var S: TncSessao;
begin
  S := TncSessao.Create(False);
  with Msg do 
  try
    try
      TStream(dmData).Position := 0;
      S.LeStream(TStream(dmData));
      FServCom.SendMsg(dmMsg, False, dmClientSck, 
                       nil, 0, nmdByteArray, 
                       Servidor.AlteraSessao(S));
      
    except
      FServCom.SendMsg(dmMsg, False, dmClientSck, 
                       nil, 0, nmdByteArray, 
                       ncerrExcecaoNaoTratada);
    end;
  finally
    S.Free;
  end;
end;

procedure TncServComunicacao.nmApagaObj(var Msg: TCSCMessage);
begin
  with Msg, PnmObj(dmData)^ do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, 
                     Servidor.ApagaObj(nmCliente, nmTipoClasse, nmChave));
end;

procedure TncServComunicacao.nmArqFundoEnviado(var Msg: TCSCMessage);
begin
  with Msg, TnmNomeArq(dmData^) do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, 
                     Servidor.ArqFundoEnviado(nmNomeArq));
end;

{--- Processamento de Mensagens Thread-Com ------------------------------}

procedure TncServComunicacao.tcAbriuFechouCaixaEv(var Msg: TMessage);
begin
  DebugMsg('TncServComunicacao.tcAbriuFechouCaixaEv');
  EnviaEvento(ncnmAbriuFechouCaixaEv, nil, 0, nmdByteArray);
end;

procedure TncServComunicacao.tcAtualizaObj(var Msg: TMessage);
var S : TStream;
begin
  S := TStream(Msg.lParam);
  if S <> nil then begin
    S.Position := 0;
    DebugMsg('TncServComunicacao.tcAtualizaObj');
    EnviaEvento(ncnmAtualizaObjEv, S, S.Size, nmdStream);
  end;  
end;

procedure TncServComunicacao.tcChatEv(var Msg: TMessage);
var S: TStream;
begin
  S := TStream(Msg.lParam);
  if S <> nil then begin
    S.Position := 0;
    DebugMsg('TncServComunicacao.tcChatEv');
    EnviaEvento(ncnmChatEv, S, S.Size, nmdStream);
  end;  
end;

procedure TncServComunicacao.tcSuporteRemEv(var Msg: TMessage);
var Evento : TnmSuporteRem;
begin
  with Msg, Evento do begin
    nmMaq  := PmsgSuporteRemEv(LParam)^.msgMaq;
    nmTec  := PmsgSuporteRemEv(LParam)^.msgTec;
  end;  
  DebugMsg('TncServComunicacao.tcSuporteRemEv');
  EnviaEvento(ncnmSuporteRemEv, @Evento, SizeOf(Evento), nmdByteArray);
end;

procedure TncServComunicacao.tcShutdown(var Msg: TMessage);
var Evento : TnmShutdown;
begin
  with Msg, Evento do begin
    nmMaq  := PmsgShutdown(LParam)^.msgMaq;
    nmOper := PmsgShutdown(LParam)^.msgOper;
  end;  
  DebugMsg('TncServComunicacao.tcShutdown');
  EnviaEvento(ncnmShutdownEv, @Evento, SizeOf(Evento), nmdByteArray);
end;

procedure TncServComunicacao.tcSiteBloqueadoEv(var Msg: TMessage);
var S : TStream;
begin
  S := TStream(Msg.lParam);
  if S <> nil then begin
    S.Position := 0;
    DebugMsg('TncServComunicacao.tcSiteBloqueado');
    EnviaEvento(ncnmSiteBloqueadoEv, S, S.Size, nmdStream);
  end;  
end;
  
procedure TncServComunicacao.tcPedeTela(var Msg: TMessage);
var Evento: TnmCapturaTela;
begin
  Evento.nmMaq := Msg.WParam;
  DebugMsg('TncServComunicacao.tcPedeTela');
  EnviaEvento(ncnmPedeTelaEv, @Evento, SizeOf(Evento), nmdByteArray);
end;

procedure TncServComunicacao.tcDestroiObj(var Msg: TMessage);
var Evento: TnmObj;
begin
  with Msg do begin
    Evento.nmTipoClasse := PmsgDestroiObj(LParam)^.msgTipoClasse;
    Evento.nmChave := PmsgDestroiObj(lParam)^.msgChave;
    DebugMsg('TncServComunicacao.tcDestroiObj - TipoClasse = ' + 
      IntToStr(Evento.nmTipoClasse) + ' - Chave = ' +
      Evento.nmChave);
   EnviaEvento(ncnmDestroiObjEv, @Evento, SizeOf(Evento), nmdByteArray);
  end;  
end;

procedure TncServComunicacao.tcNovoObj(var Msg: TMessage);
var S : TStream;
begin
  S := TStream(Msg.lParam);
  if S <> nil then begin
    S.Position := 0;
    DebugMsg('TncServComunicacao,.tcNovoObj');
    EnviaEvento(ncnmNovoObjEv, S, S.Size, nmdStream);
  end;  
end;

procedure TncServComunicacao.EnviaEvento(MsgID: Integer; P: Pointer;
  Tam: Integer; Tipo: Byte);
var 
  I : Integer;
  L : TList;
begin
  L := TList.Create;
  try
    with FServCom, Daemon.Socket do begin
      Lock;
      try
        for I := 0 to pred(ActiveConnections) do
        if Integer(Connections[I].Data) <> -1 then
          L.Add(Connections[I])  
        else
          DebugMsg('Connection.Data = -1');
      finally
        Unlock;
      end;
      for I := 0 to L.Count-1 do
        try
          DebugMsg('EnviaEvento - ' + TCustomWinSocket(L[I]).RemoteAddress);
          SendMsg(MsgID, True, TCustomWinSocket(L[I]), P, Tam, Tipo, 0);
        except
          on E: Exception do 
            DebugMsg('EnviaEvento - ' + E.Message);
        end;
    end;
  finally
    L.Free;
  end;
end;

procedure TncServComunicacao.SetServidor(Valor: TncServidorBase);
begin
  if Valor = Servidor then Exit;
  FServCom.Listening := False;
  FCliente.Servidor := Valor;
end;

procedure TncServComunicacao.SetAtivo(Valor: Boolean);
begin
  if (Valor = FAtivo) or (Valor and (Servidor=nil)) then Exit;
  FCliente.Ativo := Valor;
  FServCom.Listening := Valor;
  FAtivo := Valor;
end;

function TncServComunicacao.GetServidor: TncServidorBase;
begin
  Result := FCliente.Servidor;
end;

procedure TncServComunicacao.DespachaMC(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

procedure TncServComunicacao.tcServidorDesativado(var Msg: TMessage);
begin
  FServCom.Listening := False;
  FAtivo := False;
end;

procedure TncServComunicacao.AoConectarCliente(Sender: TObject;
  Socket: TCustomWinSocket);
begin
end;

procedure TncServComunicacao.AoDesconectarCliente(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  if Ativo then begin
    Socket.Data := Pointer(-1);
    Servidor.LogoutSocket(Integer(Socket));
  end;  
end;

procedure TncServComunicacao.nmLoginMaq(var Msg: TCSCMessage);
var S: TncSessao;
begin
  S := TncSessao.Create(False);
  with Msg do 
  try
    try
      TStream(dmData).Position := 0;
      S.LeStream(TStream(dmData));
//      S.Obs := IntToStr(TStream(dmData).Size);
//      ShowMessage(S.Obs+'--'+S.NomeCliente+'--Maq='+IntToStr(S.Maq));
      FServCom.SendMsg(dmMsg, False, dmClientSck, 
                       nil, 0, nmdByteArray, 
                       Servidor.LoginMaq(S));
      
    except
      FServCom.SendMsg(dmMsg, False, dmClientSck, 
                       nil, 0, nmdByteArray, 
                       ncerrExcecaoNaoTratada);
    end;
  finally
    S.Free;
  end;
end;

procedure TncServComunicacao.nmLogoutMaq(var Msg: TCSCMessage);
begin
  with Msg, TnmLogoutMaqReq(dmData^) do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, 
                     Servidor.LogoutMaq(nmMaq));
end;

procedure TncServComunicacao.nmTransferirMaq(var Msg: TCSCMessage);
begin
  with Msg, TnmTransferirMaqReq(dmData^) do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, 
                     Servidor.TransferirMaq(nmOrigem, nmDestino));
end;

procedure TncServComunicacao.OnTimerHora(Sender: TObject);
var Evento : TnmHorarioEv;
begin
  if not Ativo then Exit;
  with Evento do
  if gConfig.SincronizarHorarios then begin
    nmHora := Now;
    DebugMsg('TncServComunicacao.OnTimerHora');
    EnviaEvento(ncnmHorarioEv, @Evento, SizeOf(Evento), nmdByteArray);
  end;
end;

procedure TncServComunicacao.OnTimerR(Sender: TObject);
var M: Integer;
begin
  try
    FTimerR.Enabled := False;
    FTimerR.Interval := (4*60*1000) + Random(3*60*1000);
    FTimerR.Enabled := True;

    if not Ativo then Exit;

    FSockLic := Servidor.GetProxSocketLic(FSockLic, M);

    if FSockLic<>-1 then
      FServCom.SendMsg(ncnmChecaLicEv, True, TCustomWinSocket(FSockLic), nil, 0, nmdByteArray, 0);
  except
  end;
end;

procedure TncServComunicacao.nmPararTempoMaq(var Msg: TCSCMessage);
begin
  with Msg, TnmPararTempoMaqReq(dmData^) do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, 
                     Servidor.PararTempoMaq(nmMaq, nmParar));
end;

procedure TncServComunicacao.nmPermitirDownload(var Msg: TCSCMessage);
begin
  with Msg, TnmPermitirDownloadReq(dmData^) do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, 
                     Servidor.PermitirDownload(nmSessao, nmPerm));
end;

procedure TncServComunicacao.nmLimpaFundo(var Msg: TCSCMessage);
begin
  with Msg, TnmLimpaFundoReq(dmData^) do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, 
                     Servidor.LimpaFundo(nmDesktop));
end;

procedure TncServComunicacao.nmPreLogoutMaq(var Msg: TCSCMessage);
begin
  with Msg, TnmLogoutMaqReq(dmData^) do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, 
                     Servidor.PreLogoutMaq(nmMaq));
end;

procedure TncServComunicacao.nmCancelaTran(var Msg: TCSCMessage);
begin
  with Msg, TnmCancelaTranReq(dmData^) do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, 
                     Servidor.CancelaTran(nmTran, nmFunc));
end;

procedure TncServComunicacao.nmCancLogoutMaq(var Msg: TCSCMessage);
begin
  with Msg, TnmLogoutMaqReq(dmData^) do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, 
                     Servidor.CancLogoutMaq(nmMaq));
end;

procedure TncServComunicacao.nmObtemSenhaCli(var Msg: TCSCMessage);
var 
  Erro: Integer;
  Reply: TnmSenhaCli;
  S: String;
begin
  with Msg, TnmSenhaCli(dmData^) do begin
    S := '';
    Erro := Servidor.ObtemSenhaCli(nmCodigo, S);
    Reply.nmSenha := S;
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     @Reply, SizeOf(Reply), nmdByteArray, Erro);
  end;
end;

procedure TncServComunicacao.nmObtemSitesBloq(var Msg: TCSCMessage);
var 
  Erro: Integer;
  Str: String;
  S: TStream;
begin
  with Msg do begin
    Erro := Servidor.ObtemSitesBloqueados(Str);
    if Erro=0 then begin
      S := TMemoryStream.Create;
      try
        if Str>'' then
          S.WriteBuffer(Str[1], Length(Str));
        S.Position := 0;  
        FServCom.SendMsg(dmMsg, False, dmClientSck, 
                         S, S.Size, nmdStream, Erro);
      finally
        S.Free;
      end;
    end else
      FServCom.SendMsg(dmMsg, False, dmClientSck, 
                       nil, 0, nmdStream, Erro);
  end;
end;

procedure TncServComunicacao.nmObtemStreamConfig(var Msg: TCSCMessage);
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

procedure TncServComunicacao.nmRefreshEspera(var Msg: TCSCMessage);
begin
  with Msg do
  FServCom.SendMsg(dmMsg, False, dmClientSck, nil, 0, nmdByteArray, Servidor.RefreshEspera);
end;

procedure TncServComunicacao.nmRefreshPrecos(var Msg: TCSCMessage);
begin
  with Msg do
  FServCom.SendMsg(dmMsg, False, dmClientSck, nil, 0, nmdByteArray, Servidor.RefreshPrecos);
end;

procedure TncServComunicacao.nmShutdown(var Msg: TCSCMessage);
begin
  with Msg, TnmShutdown(dmData^) do 
  FServCom.SendMsg(dmMsg, False, dmClientSck, nil, 0, nmdByteArray, Servidor.ShutdownMaq(nmMaq, nmOper));
end;

procedure TncServComunicacao.nmSuporteRem(var Msg: TCSCMessage);
begin
  with Msg, TnmSuporteRem(dmData^) do 
  FServCom.SendMsg(dmMsg, False, dmClientSck, nil, 0, nmdByteArray, Servidor.SuporteRem(nmMaq, nmTec));
end;

procedure TncServComunicacao.nmBaixaAtualizacao(var Msg: TCSCMessage);
var
  Erro    : integer;
  Versao  : String;
  NArq    : String;
begin
  with Msg, TnmBaixaAtualizacao(dmData^) do begin
    Erro := 0;
    NArq := ExtractFilePath(ParamStr(0)) + 'Atualiza\nexguard.exe';
    try
      FVersion.RetrieveFilename := '';
      FVersion.RetrieveFilename := NArq;
      Versao := FVersion.FileVersion;

      if Versao>'' then 
        Versao := FormataNumVersao(Versao);

        
      if (Versao=nmVersao) or (Versao='') {Versao <= nmVersao}  then
        Erro := ncerrSemNovaVersao;
        
    except
      Erro := ncerrSemNovaVersao;
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

procedure TncServComunicacao.nmSalvaAppUrlLog(var Msg: TCSCMessage);
begin
  with Msg do 
    FServCom.SendMsg(dmMsg, False,
                     dmClientSck,
                     nil, 0, nmdByteArray, Servidor.SalvaLogAppUrl(TStream(dmData)));
end;

procedure TncServComunicacao.nmSalvaCredTempo(var Msg: TCSCMessage);
var CT: TncCredTempo;
begin
  CT := TncCredTempo.Create;
  with Msg do 
  try
    try
      TStream(dmData).Position := 0;
      CT.LoadFromStream(TStream(dmData));
      FServCom.SendMsg(dmMsg, False, dmClientSck, 
                       nil, 0, nmdByteArray, 
                       Servidor.SalvaCredTempo(CT));
      
    except
      FServCom.SendMsg(dmMsg, False, dmClientSck, 
                       nil, 0, nmdByteArray, 
                       ncerrExcecaoNaoTratada);
    end;
  finally
    CT.Free;
  end;
end;

procedure TncServComunicacao.nmSalvaMovEst(var Msg: TCSCMessage);
var ME: TncMovEst;
begin
  ME := TncMovEst.Create;
  with Msg do 
  try
    try
      TStream(dmData).Position := 0;
      ME.LeStream(TStream(dmData));
      FServCom.SendMsg(dmMsg, False, dmClientSck, 
                       nil, 0, nmdByteArray, 
                       Servidor.SalvaMovEst(ME));
      
    except
      FServCom.SendMsg(dmMsg, False, dmClientSck, 
                       nil, 0, nmdByteArray, 
                       ncerrExcecaoNaoTratada);
    end;
  finally
    ME.Free;
  end;
end;

procedure TncServComunicacao.nmSalvaProcessos(var Msg: TCSCMessage);
var 
  SL : TStrings;
  aIDCliente, aReq : Integer;
begin
  SL := TStringList.Create;
  with Msg do 
  try
    try
      TStream(dmData).Position := 0;
      SL.LoadFromStream(TStream(dmData));
      aIDCliente := StrToIntDef(SL[0], 0);
      aReq := StrToIntDef(SL[1], 1);
      SL.Delete(0);SL.Delete(0);
      FServCom.SendMsg(dmMsg, False, dmClientSck, 
                       nil, 0, nmdByteArray, 
                       Servidor.SalvaProcessos(aIDCliente, aReq, SL));
    except
      FServCom.SendMsg(dmMsg, False, dmClientSck, 
                       nil, 0, nmdByteArray, 
                       ncerrExcecaoNaoTratada);
    end;
  finally
    SL.Free;
  end;
end;

procedure TncServComunicacao.nmSalvaDebito(var Msg: TCSCMessage);
var D: TncDebito;
begin
  D := TncDebito.Create;
  with Msg do 
  try
    try
      TStream(dmData).Position := 0;
      D.LeStream(TStream(dmData));
      FServCom.SendMsg(dmMsg, False, dmClientSck, 
                       nil, 0, nmdByteArray, 
                       Servidor.SalvaDebito(D));
      
    except
      FServCom.SendMsg(dmMsg, False, dmClientSck, 
                       nil, 0, nmdByteArray, 
                       ncerrExcecaoNaoTratada);
    end;
  finally
    D.Free;
  end;
end;

procedure TncServComunicacao.nmSalvaDebTempo(var Msg: TCSCMessage);
var T: TncDebTempo;
begin
  T := TncDebTempo.Create;
  with Msg do 
  try
    try
      TStream(dmData).Position := 0;
      T.LeStream(TStream(dmData));
      FServCom.SendMsg(dmMsg, False, dmClientSck, 
                       nil, 0, nmdByteArray, 
                       Servidor.SalvaDebTempo(T));
    except
      FServCom.SendMsg(dmMsg, False, dmClientSck, 
                       nil, 0, nmdByteArray, 
                       ncerrExcecaoNaoTratada);
    end;
  finally
    T.Free;
  end;
end;

procedure TncServComunicacao.nmSalvaImpressao(var Msg: TCSCMessage);
var Imp: TncImpressao;
begin
  Imp := TncImpressao.Create;
  with Msg do 
  try
    try
      TStream(dmData).Position := 0;
      Imp.LoadFromStream(TStream(dmData));
      FServCom.SendMsg(dmMsg, False, dmClientSck, 
                       nil, 0, nmdByteArray, 
                       Servidor.SalvaImpressao(Imp));
      
    except
      FServCom.SendMsg(dmMsg, False, dmClientSck, 
                       nil, 0, nmdByteArray, 
                       ncerrExcecaoNaoTratada);
    end;
  finally
    Imp.Free;
  end;
end;

procedure TncServComunicacao.nmSalvaLancExtra(var Msg: TCSCMessage);
var L: TncLancExtra;
begin
  L := TncLancExtra.Create;
  with Msg do 
  try
    try
      TStream(dmData).Position := 0;
      L.LeStream(TStream(dmData));
      FServCom.SendMsg(dmMsg, False, dmClientSck, 
                       nil, 0, nmdByteArray, 
                       Servidor.SalvaLancExtra(L));
    except
      FServCom.SendMsg(dmMsg, False, dmClientSck, 
                       nil, 0, nmdByteArray, 
                       ncerrExcecaoNaoTratada);
    end;
  finally
    L.Free;
  end;
end;

procedure TncServComunicacao.nmSalvaLic(var Msg: TCSCMessage);
var SL: TStrings;
begin
  SL := TStringList.Create;
  try
    with Msg do begin
      try
        TStream(dmData).Position := 0;
        SL.LoadFromStream(TStream(dmData));
        Servidor.SalvaLic(SL.Text);
      except
      end;
      FServCom.SendMsg(dmMsg, False, dmClientSck,
                       nil, 0, nmdByteArray, 0);
    end;
  except
  end;
  SL.Free;
end;

procedure TncServComunicacao.nmSalvaSenhaCli(var Msg: TCSCMessage);
var Erro: Integer;
begin
  with Msg, TnmSenhaCli(dmData^) do begin
    Erro := Servidor.SalvaSenhaCli(nmCodigo, nmSenha);    
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, Erro);
  end;
end;

procedure TncServComunicacao.nmModoManutencao(var Msg: TCSCMessage);
begin
  with Msg, TnmModoManutencaoReq(dmData^)  do 
  FServCom.SendMsg(dmMsg, False, dmClientSck, nil, 0, nmdByteArray, 
                   Servidor.ModoManutencao(nmMaq, nmUsername, nmSenha, nmEntrar));
end;

procedure TncServComunicacao.nmAbreCaixa(var Msg: TCSCMessage);
var Rpy : TnmAbreCaixaRpy;
begin
  with Msg, TnmAbreCaixaReq(dmData^) do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     @Rpy, SizeOf(Rpy), nmdByteArray, Servidor.AbreCaixa(nmFunc, Rpy.nmID));
end;

procedure TncServComunicacao.nmAdicionaPassaporte(var Msg: TCSCMessage);
begin
  with Msg, TnmAdicionaPassaporteReq(dmData^)  do 
  FServCom.SendMsg(dmMsg, False, dmClientSck, nil, 0, nmdByteArray, 
                   Servidor.AdicionaPassaporte(nmMaq, nmSenha));
end;

procedure TncServComunicacao.nmAjustaPontosFid(var Msg: TCSCMessage);
begin
  with Msg, TnmAjustaPontosFid(dmData^) do 
    FServCom.SendMsg(dmMsg, False, dmClientSck, 
                     nil, 0, nmdByteArray, 
                     Servidor.AjustaPontosFid(nmFunc, nmCliente, nmFator, nmPontos, nmObs));
end;

procedure TncServComunicacao.nmPaginasImpressas(var Msg: TCSCMessage);
begin
  with Msg, TnmPaginasImpressasReq(dmData^)  do 
  FServCom.SendMsg(dmMsg, False, dmClientSck, nil, 0, nmdByteArray, 
                   Servidor.RegistraPaginasImpressas(nmMaq, nmPaginas, nmImp, nmDoc));
end;

procedure TncServComunicacao.nmAvisos(var Msg: TCSCMessage);
var 
  S: TStream;
  Erro: Integer;
begin
  S := TMemoryStream.Create;
  try
    with Msg do begin
      Erro := Servidor.ObtemStreamAvisos(S);
      FServCom.SendMsg(dmMsg, False, dmClientSck, S, S.Size, nmdStream, Erro);
    end;  
  finally
    S.Free;
  end;                       
end;



end.
