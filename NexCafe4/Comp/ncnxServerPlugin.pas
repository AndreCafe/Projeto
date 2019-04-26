unit ncnxServerPlugin;

interface

uses
  Classes,
  ExtCtrls,
  nxptBasePooledTransport,
  nxllTypes,
  nxllList,
  nxllComponent,
  nxllTransport,
  nxllPluginBase,
  nxllSync,
  ncNetMsg,
  ncClassesBase;

type
  TncCacheEvento = record
    ceMsg   : Integer;
    ceDados : Pointer;
    ceSS    : TArraySessionSocket;
  end;
  PncCacheEvento = ^TncCacheEvento;

  TncEventoFalhou = class
  protected
    evMsg : Integer;
    evDados : Pointer;
    evSessionID : TnxSessionID;
    evTransp : TnxBaseTransport;
  public
    constructor Create(aMsg: Integer; aDados: Pointer; aSessionID: TnxSessionID; aTransp: TnxBaseTransport);
    destructor Destroy; override;
  end;

  TncnxServerPlugin = class(TnxBasePluginEngine)
  private
    FNexServ : TncServidorBase;
    FEventos : TThreadList;
    FFalhas  : TThreadList;
    FSessoesTerm : TThreadList;
    FReenviando : TThreadList;
    
    FTransp : TnxBaseTransport;
    FTimer  : TTimer;
    procedure SetNexServ(const Value: TncServidorBase);
    procedure OnTimer(Sender: TObject);
    function SessaoFalhou(aSessao: TnxSessionId): Boolean;
    function SessaoTerminou(aSessao: TnxSessionId): Boolean;
  protected
    class function bpeIsRemote: Boolean; override;

    procedure spEnviaEvento(CE: PncCacheEvento);

    procedure OnEnviaEvento(aMsg: Integer; aDados: Pointer);

    procedure ReenviaFalhas;

    procedure EnviaEventosPendentes(aEventos: TList);

    procedure scStateChanged(aOldState, aNewState: TnxState); override;

  public
    constructor Create( aOwner: TComponent ); override;
    destructor Destroy; override;

    procedure BroadcastKeepAlive;

    function spRemoveSession( aSessionId: TnxSessionId ): TnxResult;

    procedure SessionLogin(aSessionId: TnxSessionId);
    procedure RemoveFalhas(aSessionId: TnxSessionId);

    function scShowUpTime: Boolean; override;

    function CopiaELimpaEventos: TList;

    property Transp: TnxBaseTransport read FTransp write FTransp;
  published  
    property NexServ: TncServidorBase
      read FNexServ write SetNexServ;
  end;


  {
    This is the plugin command handler that translates messages from the
    remote interface into method calls of the actual plugin engine.
  }

  TncnxCmdHandler = class(TnxBasePluginCommandHandler)
  private
    function ServUnlock: TList;
    procedure ServLock(aSessionID: TnxSessionID);
    procedure SendReply(aEventos      : TList;
                        aMsgID        : TnxMsgID;
                        aErrorCode    : TnxResult;
                        aReplyData    : Pointer;
                        aReplyDataLen : TnxWord32);
    
  protected
    function GetPluginEngine: TncnxServerPlugin;
    procedure SetPluginEngine( aEngine: TncnxServerPlugin );

    procedure bpchRemoveSession( aTransport: TnxBaseTransport;
                                 aSessionId: TnxSessionID); override;

    procedure bpchSessionFailed(aTransport : TnxBaseTransport;
                                aSessionID : TnxSessionID); override;
                                 

    function Serv: TncServidorBase;

    procedure nmLogin              (var aMsg: TnxDataMessage); 
    procedure nmLogout             (var aMsg: TnxDataMessage); 
    procedure nmNovoObj            (var aMsg: TnxDataMessage); 
    procedure nmAlteraObj          (var aMsg: TnxDataMessage); 
    procedure nmApagaObj           (var aMsg: TnxDataMessage); 
    procedure nmObtemLista         (var aMsg: TnxDataMessage); 
    procedure nmLoginMaq           (var aMsg: TnxDataMessage); 
    procedure nmLogoutMaq          (var aMsg: TnxDataMessage); 
    procedure nmDownloadArq        (var aMsg: TnxDataMessage);
    procedure nmUploadArq          (var aMsg: TnxDataMessage);
    procedure nmObtemVersaoGuard   (var aMsg: TnxDataMessage);
  
    procedure nmPreLogoutMaq       (var aMsg: TnxDataMessage);
    procedure nmCancLogoutMaq      (var aMsg: TnxDataMessage);
    procedure nmSalvaTelaMaq       (var aMsg: TnxDataMessage);
    procedure nmCapturaTelaMaq     (var aMsg: TnxDataMessage);
    procedure nmObtemStreamConfig  (var aMsg: TnxDataMessage);
    procedure nmPararTempoMaq      (var aMsg: TnxDataMessage);
    procedure nmTransferirMaq      (var aMsg: TnxDataMessage);
    procedure nmRefreshPrecos      (var aMsg: TnxDataMessage);
    procedure nmShutdown           (var aMsg: TnxDataMessage);
    procedure nmModoManutencao     (var aMsg: TnxDataMessage);
    procedure nmAdicionaPassaporte (var aMsg: TnxDataMessage);
    procedure nmPaginasImpressas   (var aMsg: TnxDataMessage);
    procedure nmAvisos             (var aMsg: TnxDataMessage);
    procedure nmObtemPastaServ     (var aMsg: TnxDataMessage);
    procedure nmArqFundoEnviado    (var aMsg: TnxDataMessage);
    procedure nmObtemSenhaCli      (var aMsg: TnxDataMessage);
    procedure nmSalvaSenhaCli      (var aMsg: TnxDataMessage);
    procedure nmLimpaFundo         (var aMsg: TnxDataMessage);
    procedure nmEnviaChat          (var aMsg: TnxDataMessage);
    procedure nmSalvaCredTempo     (var aMsg: TnxDataMessage);
    procedure nmAlteraSessao       (var aMsg: TnxDataMessage);
    procedure nmCancelaTran        (var aMsg: TnxDataMessage);
    procedure nmSalvaMovEst        (var aMsg: TnxDataMessage);
    procedure nmSalvaDebito        (var aMsg: TnxDataMessage);
    procedure nmSalvaImpressao     (var aMsg: TnxDataMessage);
    procedure nmAbreCaixa          (var aMsg: TnxDataMessage);
    procedure nmFechaCaixa         (var aMsg: TnxDataMessage);
    procedure nmObtemProcessos     (var aMsg: TnxDataMessage);
    procedure nmFinalizaProcesso   (var aMsg: TnxDataMessage);
    procedure nmSalvaProcessos     (var aMsg: TnxDataMessage);
    procedure nmObtemSitesBloq     (var aMsg: TnxDataMessage);
    procedure nmRefreshEspera      (var aMsg: TnxDataMessage);
    procedure nmPermitirDownload   (var aMsg: TnxDataMessage);
    procedure nmDesativarFWSessao  (var aMsg: TnxDataMessage);
    procedure nmDesktopSincronizado(var aMsg: TnxDataMessage);
    procedure nmMonitorOnOff       (var aMsg: TnxDataMessage);
    
    procedure nmSalvaLancExtra     (var aMsg: TnxDataMessage);
    procedure nmSalvaDebTempo      (var aMsg: TnxDataMessage);
    procedure nmCorrigeDataCaixa   (var aMsg: TnxDataMessage);
    procedure nmRefreshSessao      (var aMsg: TnxDataMessage);
    procedure nmSuporteRem         (var aMsg: TnxDataMessage);
    procedure nmSalvaLic           (var aMsg: TnxDataMessage);
    procedure nmObtemPatrocinios   (var aMsg: TnxDataMessage);
    procedure nmAjustaPontosFid    (var aMsg: TnxDataMessage);
    procedure nmSalvaAppUrlLog     (var aMsg: TnxDataMessage);
    procedure nmKeepAlive          (var aMsg: TnxDataMessage);
    procedure nmDisableAd          (var aMsg: TnxDataMessage);
    procedure nmSalvaClientPages   (var aMsg: TnxDataMessage);
    procedure nmJobControl         (var aMsg: TnxDataMessage);
    procedure nmApagaMsgCli        (var aMsg: TnxDataMessage);
                                 
    procedure _bpchProcess( aMsg: PnxDataMessage;
                           var aHandled: Boolean); 
    
  public
    procedure bpchProcess( aMsg: PnxDataMessage;
                           var aHandled: Boolean); override;

  published
    property PluginEngine: TncnxServerPlugin
      read GetPluginEngine
      write SetPluginEngine;

  end;

procedure Register;

implementation

uses SysUtils,
     nxllMemoryManager,
     nxstMessages,
     nxllBDE, 
     nxllStreams, ncDebug, ncSessao, ncCredTempo, ncDebito, ncDebTempo,
     ncImpressao, ncLancExtra, ncMovEst, ncMsgCom, ncErros, ncServBD;

function BoolStr(B: Boolean): String;
begin
  if B then
    Result := 'True' else
    Result := 'False';
end;

procedure Register;
begin
  RegisterComponents('NexCafe',
                       [ TncnxServerPlugin,
                         TncnxCmdHandler ]);
end;


{ TncnxServerPlugin }

procedure TncnxServerPlugin.BroadcastKeepAlive;
var 
  I : Integer;
  Dummy : Array[1..128] of Byte;
begin
  Fillchar(Dummy, SizeOf(Dummy), $FF);
  
  try
    if not ServidorAtivo then Exit;
      dmServidorBD.nxTCPIP.Broadcast(ncnmKeepAlive, 0, @Dummy, SizeOf(Dummy), 100);
  except
  end;

{  FNexServ.Lock;
  with dmServidorBD do 
  try
    Fillchar(Dummy, SizeOf(Dummy), $FF);
    
    GetAllSessions(A);
    for I := Low(A) to High(A) do
      try
        nxTCPIP.Post(0, A[i], 0, ncnmKeepAlive, @Dummy, SizeOf(Dummy), 500);
      except
        on E: Exception do 
          DebugMsg('TncnxServerPlugin.BroadcastKeepAlive - **** Exception: ' + E.Message);
      end;
      
  finally
    FNexServ.Unlock;
  end;}
end;

function TncnxServerPlugin.CopiaELimpaEventos: TList;
var L : TList;
begin
  L := FEventos.LockList;
  try
    Result := TList.Create;
    Result.Assign(L);
    L.Clear;
  finally
    FEventos.UnlockList
  end;
end;

constructor TncnxServerPlugin.Create(aOwner: TComponent);
begin
  inherited;
  FTimer := TTimer.Create(nil);
  FTimer.OnTimer := OnTimer;
  FTimer.Interval := 2500;
  FTimer.Enabled := False;
  FEventos := TThreadList.Create;
  FFalhas := TThreadList.Create;
  FSessoesTerm := TThreadList.Create;
  FReenviando := TThreadList.Create;
  FNexServ := nil;
end;

destructor TncnxServerPlugin.Destroy;
begin
  FEventos.Free;
  FTimer.Free;
  
  with FFalhas.LockList do
  try
    while Count>0 do begin
      try TObject(Items[0]).Free; except end;
      Delete(0);
    end;
  finally
    FFalhas.UnlockList;
  end;
  
  FFalhas.Free;
  FSessoesTerm.Free;
  FReenviando.Free;
  inherited;
end;

procedure TncnxServerPlugin.EnviaEventosPendentes(aEventos: TList);
var CE: PncCacheEvento;
begin
  if aEventos=nil then Exit;

  try
    while ServidorAtivo and (aEventos.Count>0) do begin
      spEnviaEvento(PncCacheEvento(aEventos[0]));
      aEventos.Delete(0);
    end;
  finally
    while aEventos.Count>0 do begin
      CE := PncCacheEvento(aEventos[0]);
      FreeDados(CE^.ceMsg, CE^.ceDados);
      SetLength(CE^.ceSS, 0);
      Dispose(CE);
      aEventos.Delete(0);
    end;
  
    aEventos.Free;
  end;
end;

procedure TncnxServerPlugin.OnEnviaEvento(aMsg: Integer; aDados: Pointer);
var 
  CE: PncCacheEvento;
  L : TList;
begin
  if not ServidorAtivo then Exit;
  New(CE);
  CE^.ceMsg := aMsg;
  CE^.ceDados := aDados;
  FNexServ.ObtemSessionSocketArray(0, CE^.ceSS);
  FEventos.Add(CE);
end;

procedure TncnxServerPlugin.OnTimer(Sender: TObject);
var L: TList;
begin
  if not ServidorAtivo then Exit;

  FTimer.Enabled := False;
  try
    FTimer.Tag := FTimer.Tag + 1;
    if ServidorAtivo and ((FTimer.Tag mod 2) = 0) then
    try
      ReenviaFalhas;
    except
      on E: Exception do 
        DebugMsgEsp('TncnxServerPlugin.OnTimer.ReenviaFalhas - E.Message: ' + E.Message, False, True);
    end;

    try
      if ServidorAtivo then begin
        L := CopiaELimpaEventos;
        if L<>nil then
          EnviaEventosPendentes(L); 
      end;
    except
      on E: Exception do 
        DebugMsgEsp('TncnxServerPlugin.OnTimer.EnviaEventosPendentes - E.Message: ' + E.Message, False, True);
    end;
  finally
    FTimer.Enabled := True;
  end;
end;

procedure MsgFromEvento(var Msg: PnmMsgCom; var MsgLen: Integer;  evMsg: Integer; evDados: Pointer);
var DataLen : Integer;
begin
  Msg := nil;
  if ObtemTipoDados(evMsg)=tdStream then 
    DataLen := TStream(evDados).Size else 
    DataLen := ObtemTamanhoDados(evMsg);
  
  MsgLen := SizeOf( TnmMsgCom )
              - SizeOf( TnxVarMsgField ) + DataLen + 1;
  
  nxGetZeroMem(Msg, MsgLen);
  try
    Msg^.nmMsgID := evMsg;
    Msg^.nmDataLength := DataLen;
    if ObtemTipoDados(evMsg)=tdStream then
      Move(TMemoryStream(evDados).Memory^, Msg^.nmData, DataLen) else
      Move(evDados^, Msg^.nmData, DataLen);
  except
    nxFreeMem(Msg);
    raise;
  end;
end;

procedure TncnxServerPlugin.ReenviaFalhas;
var 
  L: TList;
  Ev : TncEventoFalhou;
  Msg : PnmMsgCom;  
  MsgLen : Integer;
  aID : TnxSessionID;
  
procedure Envia;
begin
  try
    MsgFromEvento(Msg, MsgLen, Ev.evMsg, Ev.evDados);
    try
      if not ServidorAtivo then Exit;

      dmServidorBD.nxTCPIP.Post(0, Ev.evSessionID, 0, ncnmMsgComEv, Msg, MsgLen, 500);
      try Ev.Free; except end;
    finally
      nxFreeMem(Msg);
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TncnxServerPlugin.ReenviaFalhas.Envia - Ev.evSessionID: ' + IntToStr(EV.evSessionID) + 
                  ' - E.Message: ' + E.Message, False, True);
      L.Add(Pointer(Ev.evSessionID));
      with FFalhas.LockList do
      try
        if SessaoTerminou(Ev.evSessionID) then 
          Ev.Free else
          Insert(0, Ev);
      finally
        FFalhas.UnlockList;
      end;
    end;
  end;
end;  

function GetNext: Boolean;
var I: Integer;
begin
  with FFalhas.LockList do 
  try
    for I := 0 to Count-1 do begin
      Ev := TncEventoFalhou(Items[I]);
      if L.IndexOf(Pointer(Ev.evSessionID))=-1 then begin
        Delete(I);
        Result := True;
        Exit;
      end;
    end;
    Result := False;
    Ev := nil;
  finally
    FFalhas.UnlockList;
  end;
end;

begin
  L := TList.Create;
  try
    while GetNext do begin
      aID := Ev.evSessionID;
      FReenviando.Add(Pointer(aID));
      try
        Envia;
      finally
        FReenviando.Remove(Pointer(aID));
      end;
    end;
  finally
    L.Free;
  end;
end;

procedure TncnxServerPlugin.RemoveFalhas(aSessionId: TnxSessionId);
var I: Integer;
begin
  with FFalhas.LockList do
  try
    for I := Count - 1 downto 0 do 
      with TncEventoFalhou(Items[I]) do 
        if evSessionID=aSessionID then begin
          TObject(Items[I]).Free;
          Delete(I);
        end;
  finally
    FFalhas.UnlockList;
  end;
end;

{
function TncnxServerPlugin.BroadcastMessage( aData: Pointer;
                                                      aDataLength: Integer;
                                                      aMsgID: Integer;
                                                      aSenderSessionID,
                                                      aRecipientSessionID: TnxSessionId ): TnxResult;
var
  Request: PnxnmBroadcastMessageReq;
  ReqLen: Integer;
  Index: Integer;
  MsgsSent: Integer;
  anItem: TpsnxRegisteredClientItem;
  SessionList: TpsnxRegisteredClientList;
begin
  Result := DBIERR_NONE;
  MsgsSent := 0;

  // calcuate the reply message size
  ReqLen := SizeOf( TnxnmBroadcastMessageReq )
              - SizeOf( TnxVarMsgField ) + aDataLength + 1;

  nxGetZeroMem(Request, ReqLen);
  try
    Request^.DataLength := aDataLength;
    Request^.MsgID := aMsgID;
    Request^.SessionID := aSenderSessionId;
    if aDataLength > 0 then
      Move(aData^, Request^.Data, aDataLength);

    SessionList := TpsnxRegisteredClientList(FServidorAtivoMsgSessions.BeginRead);
    try
      for Index := 0 to (SessionList.Count - 1) do begin
        anItem := SessionList[Index];


        if ( ( ( aRecipientSessionID = 0 ) or               // no recipent
            ( anItem.SessionID = aRecipientSessionID ) ) and // or recipent matches
            ( anItem.SessionID <> aSenderSessionID ) ) or    // and Session isn't sender
            anItem.PromiscuousMode then begin               // or always sent

          // broadcast with the transport the Session registered with just in case
          // they are a different transport then is currently ServidorAtivo
          anItem.Transport.Post( 0,
                                 anItem.SessionID,     // destination client
                                 nxnmRelayedMessage,
                                 Request,
                                 ReqLen,
                                 1000 );

          Inc(MsgsSent);
        end;
      end;
    finally
      FServidorAtivoMsgSessions.EndRead;
    end;
  finally
    nxFreeMem(Request, ReqLen);
  end;
end;
}

function TncnxServerPlugin.spRemoveSession(aSessionId: TnxSessionId): TnxResult;
var FCEList : TList;
begin
  if not ServidorAtivo then Exit;

  Result := DBIERR_NONE;
  FSessoesTerm.Add(Pointer(aSessionId));
  RemoveFalhas(aSessionId);
  if not ServidorAtivo then Exit;
  FNexServ.Lock;
  try
    FNexServ.LogoutSession(aSessionID);
    FCEList := CopiaELimpaEventos;
  finally
    FNexServ.Unlock;  
  end;
  EnviaEventosPendentes(FCEList);
end;

class function TncnxServerPlugin.bpeIsRemote: Boolean;
begin
  Result := False;
end;

function TncnxServerPlugin.scShowUpTime: Boolean;
begin
  Result := True;
end;

procedure TncnxServerPlugin.scStateChanged(aOldState, aNewState: TnxState);
begin
  inherited;
  FTimer.Enabled := (aNewState=nxsStarted);
end;

function TncnxServerPlugin.SessaoFalhou(aSessao: TnxSessionId): Boolean;
var I : Integer;
begin
  with FFalhas.LockList do
  try
    for I := 0 to Count - 1 do
      if TncEventoFalhou(Items[i]).evSessionID=aSessao then begin
        Result := True;
        Exit;
      end;
  finally
    FFalhas.UnlockList;
  end;
  Result := False;
  
  with FReenviando.LockList do
  try
    Result := (IndexOf(Pointer(aSessao))>=0);
  finally
    FReenviando.UnlockList;
  end;
end;

function TncnxServerPlugin.SessaoTerminou(aSessao: TnxSessionId): Boolean;
begin
  with FSessoesTerm.LockList do
  try
    Result := (IndexOf(Pointer(aSessao))>=0);
  finally
    FSessoesTerm.UnlockList;
  end;
end;

procedure TncnxServerPlugin.SessionLogin(aSessionId: TnxSessionId);
var I : Integer;
begin
  FSessoesTerm.Remove(Pointer(aSessionId));
  RemoveFalhas(aSessionId);
end;

procedure TncnxServerPlugin.SetNexServ(const Value: TncServidorBase);
begin
  if FNexServ=Value then Exit;
  if FNexServ<>nil then FNexServ.OnEnviaEvento := nil;
  FNexServ := Value;
  if FNexServ<>nil then FNexServ.OnEnviaEvento := OnEnviaEvento;
end;

{procedure TncnxServerPlugin.spEnviaEvento(CE: PncCacheEvento);
var 
  Msg : PnmMsgCom;  
  MsgLen : Integer;
  Falhou : Boolean;
  I: Integer;
  A: TSessionArray;
begin
  try
    MsgFromEvento(Msg, MsgLen, CE^.ceMsg, CE^.ceDados);
    with dmServidorBD do 
    try
      GetAllSessions(A);
      for I := Low(A) to High(A) do 
      if ServidorAtivo then begin
        Falhou := SessaoFalhou(A[i]);
        if not Falhou then
        try
          if nxTCPIP.ServidorAtivo then begin
            nxTCPIP.Post(0, A[I], 0, ncnmMsgComEv, Msg, MsgLen, 500);
            DebugMsg('TncnxServerPlugin.spEnviaEvento - SessionID: ' + IntToStr(A[i]) + ' - OK');
          end else
            DebugMsg('TncnxServerPlugin.spEnviaEvento - SessionID: ' + IntToStr(A[i]) + ' - nxTCPIP INATIVO');
            
          Falhou := False;
        except
          on E: Exception do begin
            DebugMsgEsp('TncnxServerPlugin.spEnviaEvento - SessionID: ' + IntToStr(A[i]) + ' - Exception: ' + E.Message, False, True);
            Falhou := True;
          end;
        end;
        if Falhou then 
          if not SessaoTerminou(A[i]) then
            FFalhas.Add(TncEventoFalhou.Create(CE^.ceMsg, CE^.ceDados, A[i], nil));
      end;
    finally
      nxFreeMem(Msg);
    end;
  finally
    try
      FreeDados(CE^.ceMsg, CE^.ceDados);
    finally
      SetLength(CE^.ceSS, 0);
      Dispose(CE);
    end;
  end;
end;}

procedure TncnxServerPlugin.spEnviaEvento(CE: PncCacheEvento);
var 
  Msg : PnmMsgCom;  
  MsgLen : Integer;
  Falhou : Boolean;
  I: Integer;
begin
  try
    MsgFromEvento(Msg, MsgLen, CE^.ceMsg, CE^.ceDados);
    try
      for I := 0 to High(CE^.ceSS) do 
      if ServidorAtivo then begin
        Falhou := SessaoFalhou(CE^.ceSS[I].ssSession);
        if not Falhou then
        try
          TnxBaseTransport(CE^.ceSS[I].ssSocket).Post(0, CE^.ceSS[I].ssSession, 0, ncnmMsgComEv, Msg, MsgLen, 500);
          Falhou := False;
        except
          on E: Exception do begin
            DebugMsgEsp('TncnxServerPlugin.spEnviaEvento - **** Exception: ' + E.Message, False, True);
            Falhou := True;
          end;
        end;
        if Falhou then with CE^.ceSS[I] do
          if not SessaoTerminou(ssSession) then
            FFalhas.Add(TncEventoFalhou.Create(CE^.ceMsg, CE^.ceDados, ssSession, TnxBaseTransport(ssSocket)));
      end;
    finally
      nxFreeMem(Msg);
    end;
  finally
    try
      FreeDados(CE^.ceMsg, CE^.ceDados);
    finally
      SetLength(CE^.ceSS, 0);
      Dispose(CE);
    end;
  end;
end;


{ TncnxCmdHandler }

function TncnxCmdHandler.GetPluginEngine: TncnxServerPlugin;
begin
  Result := TncnxServerPlugin(bpchPluginEngine);
end;

procedure TncnxCmdHandler.SendReply(aEventos: TList; aMsgID: TnxMsgID;
  aErrorCode: TnxResult; aReplyData: Pointer; aReplyDataLen: TnxWord32);
  var CE: PncCacheEvento;
begin
  try
    TnxBaseTransport.Reply(aMsgID, aErrorCode, aReplyData, aReplyDataLen);
  finally  
    PluginEngine.EnviaEventosPendentes(aEventos);
  end;
end;

function TncnxCmdHandler.Serv: TncServidorBase;
begin
  Result := PluginEngine.NexServ;
end;

procedure TncnxCmdHandler.ServLock(aSessionID: TnxSessionID);
begin
  DebugMsg('TncnxCmdHandle.ServLock 1');

  if not ServidorAtivo then begin
    DebugMsg('TncnxCmdHandle.ServLock 2');
    Raise Exception.Create('Servidor Inativo');
  end;
  
  DebugMsg('TncnxCmdHandle.ServLock 3');
  Serv.Lock;
  DebugMsg('TncnxCmdHandle.ServLock 4');

  if not ServidorAtivo then begin
    DebugMsg('TncnxCmdHandle.ServLock 5');
    Serv.Unlock;
    Raise Exception.Create('Servidor Inativo');
  end;
  try
    DebugMsg('TncnxCmdHandle.ServLock 6');
    Serv.ObtemUsernameHandlePorSessionID(aSessionID, UsernameAtual, HandleCliAtual);
    DebugMsg('TncnxCmdHandle.ServLock 7');
    if SameText(UsernameAtual, 'proxy') then
      UsernameAtual := '';
  except
    UsernameAtual := '';
    HandleCliAtual := -1;
  end;
end;

function TncnxCmdHandler.ServUnlock: TList;
begin
  try
    Result := PluginEngine.CopiaELimpaEventos;
  finally
    PluginEngine.FNexServ.Unlock;
  end;
end;

procedure TncnxCmdHandler.SetPluginEngine( aEngine: TncnxServerPlugin );
begin
  bpchSetPluginEngine(aEngine);
end;

procedure TncnxCmdHandler.nmAbreCaixa(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; CEList : TList;
  R : TnmAbreCaixaRpy;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmAbreCaixaReq(dmData^) do 
  try
    try
      DebugMsg('TncnxCmdHandler.nmAbreCaixa - nmFunc: ' + nmFunc); 
      Erro := Serv.AbreCaixa(nmFunc, nmSaldo, R.nmID);
      DebugMsg('TncnxCmdHandler.nmAbreCaixa - Res: ' + IntToStr(Erro) + ' - nmID: ' + IntToStr(R.nmID));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmAbreCaixa - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, @R, SizeOf(R));
end;

procedure TncnxCmdHandler.nmCancelaTran(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmCancelaTranReq(dmData^) do 
  try
    try
      DebugMsg('TncnxCmdHandler.nmCancelaTran - nmTran: ' + IntToStr(nmTran) + ' - nmFunc: ' + nmFunc);
      Erro := Serv.CancelaTran(nmTran, nmFunc);
      DebugMsg('TncnxCmdHandler.nmCancelaTran - Res: ' + IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmCancelaTran - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmCancLogoutMaq(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmLogoutMaqReq(dmData^) do 
  try
    try
      DebugMsg('TncnxCmdHandler.nmCancLogoutMaq - nmMaq: ' + IntToStr(nmMaq));
      Erro := Serv.CancLogoutMaq(nmMaq);
      DebugMsg('TncnxCmdHandler.nmCancLogoutMaq - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmCancLogoutMaq - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmCapturaTelaMaq(var aMsg: TnxDataMessage);
var
  Erro : TnxResult; CEList : TList;
  C : TmsgCapturaTela;
  SS: TArraySessionSocket;
begin
  Erro := 0;
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmCapturaTela(dmData^) do 
  try
    try
      nmSession := aMsg.dmSessionID;
      Serv.ObtemSessionSocketArray(nmMaq, SS);
      DebugMsg('TncnxCmdHandler.nmCapturaTelaMaq - nmMaq: ' + IntToStr(nmMaq));
      C.msgSession := aMsg.dmSessionID;
      C.msgMaq := nmMaq;
      if Length(SS)>0 then
        TnxBaseTransport(SS[0].ssSocket).Post(0, SS[0].ssSession, 0, ncnmCapturaTelaEv, dmData, dmDataLen, 3000);
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmCapturaTelaMaq - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;
{var
  Erro : TnxResult; CEList : TList;
  A : TSessionArray;
  C : TmsgCapturaTela;
begin
  Erro := 0;
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmCapturaTela(dmData^) do 
  try
    try
      nmSession := aMsg.dmSessionID;
      DebugMsg('TncnxCmdHandler.nmCapturaTelaMaq - nmMaq: ' + IntToStr(nmMaq));
      C.msgSession := aMsg.dmSessionID;
      C.msgMaq := nmMaq;
      Self.PluginEngine.OnEnviaEvento(ncmc_CapturaTela, @C);
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmCapturaTelaMaq - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;}

procedure TncnxCmdHandler.nmCorrigeDataCaixa(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmCorrigeDataCaixaReq(dmData^) do 
  try
    try
      DebugMsg('TncnxCmdHandler.nmCorrigeDataCaixa - nmFunc: ' + nmFunc + 
        ' - nmCaixa: ' + IntToStr(nmCaixa) +
        ' - nmNovaAbertura: '   + FormatDateTime('dd/mm/yyyy hh:mm:ss', nmNovaAbertura) +
        ' - nmNovoFechamento: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', nmNovoFechamento));
      Erro := Serv.CorrigeDataCaixa(nmFunc, nmCaixa, nmNovaAbertura, nmNovoFechamento);
      DebugMsg('TncnxCmdHandler.nmCorrigeDataCaixa - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmCorrigeDataCaixa - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmDisableAd(var aMsg: TnxDataMessage);
var Erro: TnxResult; CEList: TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmDisableAdReq(dmData^) do 
  try
    try
      DebugMsg('TncnxCmdHandler.nmDisableAd - nmSessao: ' + IntToStr(nmSessao) + 
        ' - nmDisable: ' + BoolStr(nmDisable));
      Erro := Serv.DisableAd(nmSessao, nmDisable);
      DebugMsg('TncnxCmdHandler.nmDisableAd - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmDisableAd - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmDownloadArq(var aMsg: TnxDataMessage);
var 
  S: TnxMemoryStream;
  Str: String;
  Erro : TnxResult;
  CEList : TList;
begin
  S := TnxMemoryStream.Create;
  try
    ServLock(aMsg.dmSessionID);
    try
      with aMsg, TnmNomeArq(aMsg.dmData^) do 
      try
        DebugMsg('TncnxCmdHandler.nmDownloadArq - NomeArq: ' + nmNomeArq);
        Str := ExtractFilePath(ParamStr(0)) + nmNomeArq;
        if FileExists(Str) then begin
          Erro := 0;
          S.LoadFromFile(Str);
        end else  
          Erro := ncerrArqNaoEncontrado;
          
        DebugMsg('TncnxCmdHandler.nmDownloadArq - Res: ' + IntToStr(Erro));
      except
        on E: Exception do begin
          Erro := 2;
          DebugMsg('TncnxCmdHandler.nmDownloadArq - Exception: ' + E.Message);
        end;
      end;
    finally
      CEList := ServUnlock;
    end;
    SendReply(CEList, aMsg.dmMsg, Erro, S.Memory, S.Size);
  finally
    S.Free;
  end;
end;

procedure TncnxCmdHandler.nmEnviaChat(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; CEList : TList;
  SL: TStrings;
  De, Para: Integer;
begin
  ServLock(aMsg.dmSessionID);
  try
    with aMsg, TnxDataMessageStream.Create(aMsg) do try
      try
        SL := TStringList.Create;
        try
          SL.LoadFromStream(TheStream);
          De := StrToInt(SL.Values['de']);
          Para := StrToInt(SL.Values['para']);
          SL.Delete(0);
          SL.Delete(0);
          SL.Delete(0);
          SL.Delete(0);
          DebugMsg('TncnxCmdHandler.nmEnviaChat - De: ' + IntToStr(De) +
            ' - Para: ' + IntToStr(Para) +
            ' - Texto: ' + SL.Text);
                                                                        
          Erro := Serv.EnviarMsg(De, Para, SL.Text);
          DebugMsg('TncnxCmdHandler.nmEnviaChat - Res: ' + IntToStr(Erro));
        finally
          SL.Free;
        end;
      except
        on E: Exception do begin
          Erro := 2;
          DebugMsg('TncnxCmdHandler.nmCancLogoutMaq - Exception: ' + E.Message);
        end;
      end;
    finally
      Free;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmFechaCaixa(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmFechaCaixaReq(dmData^) do 
  try
    try
      DebugMsg('TncnxCmdHandler.nmFechaCaixa - nmFunc: ' + nmFunc + 
        ' - nmID: ' + IntToStr(nmID));
      Erro := Serv.FechaCaixa(nmFunc, nmSaldo, nmID);
      DebugMsg('TncnxCmdHandler.nmFechaCaixa - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmFechaCaixa - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmFinalizaProcesso(var aMsg: TnxDataMessage);
var
  Erro: TnxResult; CEList: TList;
  SS: TArraySessionSocket;
begin
  Erro := 0;
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmFinalizaProcesso(dmData^) do 
  try
    try
      Serv.ObtemSessionSocketArray(nmMaq, SS);
      DebugMsg('TncnxCmdHandler.nmFinalizaProcesso - nmMaq: ' + IntToStr(nmMaq) +
               ' - nmProcessID: ' + IntToStr(nmProcessID));
      if Length(SS)>0 then
        TnxBaseTransport(SS[0].ssSocket).Post(0, SS[0].ssSession, 0, ncnmFinalizaProcessoEv, dmData, dmDataLen, 1000);
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmFinalizaProcesso - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmJobControl(var aMsg: TnxDataMessage);
var
  Erro: TnxResult; CEList: TList;
begin
  Erro := 0;
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmJobControl(dmData^) do 
  try
    try
      DebugMsg('TncnxCmdHandler.nmJobControl - nmPrinterIndex: ' + IntToStr(nmPrinterIndex) + 
               ' - nmJobID: ' + IntToStr(nmJob) +
               ' - nmControl: ' + IntToStr(nmControl));
      Erro := Serv.JobControl(nmPrinterIndex, nmJob, nmControl);
      DebugMsg('TncnxCmdHandler.nmJobControl - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmJobControl - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmAdicionaPassaporte(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmAdicionaPassaporteReq(dmData^) do
  try
    try
      DebugMsg('TncnxCmdHandler.nmAdicionaPassaporte - nmMaq: ' + IntToStr(nmMaq) +
        ' - nmSenha: ' + nmSenha);
      Erro := Serv.AdicionaPassaporte(nmMaq, nmSenha);
      DebugMsg('TncnxCmdHandler.nmAdicionaPassaporte - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmAdicionaPassaporte - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmAjustaPontosFid(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmAjustaPontosFid(dmData^) do
  try
    try
      DebugMsg('TncnxCmdHandler.nmAjustaPontosFid - nmFunc: ' + nmFunc + 
        ' - nmCliente: ' + IntToStr(nmCliente) + 
        ' - nmFator: ' + IntToStr(nmFator) + 
        ' - nmPontos: ' + FloatToStr(nmPontos) + 
        ' - nmObs: ' + nmObs);

      Erro := Serv.AjustaPontosFid(nmFunc, nmCliente, nmFator, nmPontos, nmObs);
      DebugMsg('TncnxCmdHandler.nmAjustaPontosFid - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmAjustaPontosFid - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmAlteraObj(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; CEList : TList;
  sCmd : String;
begin
  ServLock(aMsg.dmSessionID);
  try
    with aMsg, TnxDataMessageStream.Create(aMsg) do try
      try
        if dmMsg=ncnmAlteraObj then
          sCmd := 'TncnxCmdHandler.nmAlteraObj' else
          sCmd := 'TncnxCmdHandler.nmNovoObj';
        DebugMsg(sCmd);
        Erro := Serv.SalvaStreamObj((dmMsg=ncnmNovoObj), TheStream);
        DebugMsg(sCmd + ' - Res: ' + IntToStr(Erro));
      except
        on E: Exception do begin
          Erro := 2;
          DebugMsg(sCmd + ' - Exception: ' + E.Message);
        end;
      end;
    finally
      Free;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmAlteraSessao(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; CEList : TList;
  S : TncSessao;
begin
  ServLock(aMsg.dmSessionID);
  try
    with aMsg, TnxDataMessageStream.Create(aMsg) do try
      try
        S := TncSessao.Create(False);
        try
          S.LeStream(TheStream);
          DebugMsg('TncnxCmdHandler.nmAlteraSessao - SessionID: ' + IntToStr(S.ID));
          Erro := Serv.AlteraSessao(S);
          DebugMsg('TncnxCmdHandler.nmAlterassao - Res: ' +  IntToStr(Erro));
        finally
          S.Free;
        end;
      except
        on E: Exception do begin
          Erro := 2;
          DebugMsg('TncnxCmdHandler.nmAlteraSessao - Exception: ' + E.Message);
        end;
      end;
    finally
      Free;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmApagaMsgCli(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with TnmApagaMsgCli(aMsg.dmData^) do 
  try
    try
      DebugMsg('TncnxCmdHandler.nmApagaMsgCli - nmMsgID: ' + IntToStr(nmMsgID));
      Erro := Serv.ApagaMsgCli(nmMsgID);
      DebugMsg('TncnxCmdHandler.nmApagaMsgCli- Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmApagaMsgCli - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmApagaObj(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, PnmObj(dmData)^ do 
  try
    try
      DebugMsg('TncnxCmdHandler.nmApagaObj - nmCliente: ' + IntToStr(nmCliente) + 
        ' - nmTipoClasse: ' + IntToStr(nmTipoClasse) + 
        ' - nmChave: ' + nmChave);
      Erro := Serv.ApagaObj(nmCliente, nmTipoClasse, nmChave);
      DebugMsg('TncnxCmdHandler.nmApagaObj - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmApagaObj - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmArqFundoEnviado(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmNomeArq(dmData^) do
  try
    try
      DebugMsg('TncnxCmdHandler.nmArqFundoEnviado - nmNomeArq: ' + nmNomeArq);
      Erro := Serv.ArqFundoEnviado(nmNomeArq);
      DebugMsg('TncnxCmdHandler.nmArqFundoEnviado - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmArqFundoEnviado - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmAvisos(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; CEList : TList;
  S : TnxMemoryStream;
begin
  S := TnxMemoryStream.Create;
  try
    ServLock(aMsg.dmSessionID);
    with aMsg do 
    try
      try
        DebugMsg('TncnxCmdHandler.nmAvisos');
        Erro := Serv.ObtemStreamAvisos(S);
        DebugMsg('TncnxCmdHandler.nmAvisos - Res: ' +  IntToStr(Erro));
      except
        on E: Exception do begin
          Erro := 2;
          DebugMsg('TncnxCmdHandler.nmAvisos - Exception: ' + E.Message);
        end;
      end;
    finally
      CEList := ServUnlock;
    end;
    SendReply(CEList, aMsg.dmMsg, Erro, S.Memory, S.Size);
  finally
    S.Free;
  end;
end;

procedure TncnxCmdHandler.nmRefreshEspera(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg do 
  try
    try
      DebugMsg('TncnxCmdHandler.nmRefreshEspera');
      Erro := Serv.RefreshEspera;
      DebugMsg('TncnxCmdHandler.nmRefreshEspera - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmRefreshEspera - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmRefreshPrecos(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg do 
  try
    try
      DebugMsg('TncnxCmdHandler.nmRefreshPrecos');
      Erro := Serv.RefreshPrecos;
      DebugMsg('TncnxCmdHandler.nmRefreshPrecos - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmRefreshPrecos - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmRefreshSessao(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmSessao(dmData^) do
  try
    try
      DebugMsg('TncnxCmdHandler.nmRefreshSessao - nmSessao: ' + IntToStr(nmSessao));
      Erro := Serv.ForceRefreshSessao(nmSessao);
      DebugMsg('TncnxCmdHandler.nmRefreshSessao - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmRefreshSessao - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmSalvaAppUrlLog(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  try
    with aMsg, TnxDataMessageStream.Create(aMsg) do try
      try
        DebugMsg('TncnxCmdHandler.nmSalvaAppUrlLog');
        Erro := Serv.SalvaLogAppUrl(TheStream);
        DebugMsg('TncnxCmdHandler.nmSalvaAppUrlLog - Res: ' +  IntToStr(Erro));
      except
        on E: Exception do begin
          Erro := 2;
          DebugMsg('TncnxCmdHandler.nmSalvaAppUrlLog - Exception: ' + E.Message);
        end;
      end;
    finally
      Free;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmSalvaCredTempo(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; CEList : TList;
  CT : TncCredTempo;
begin
  ServLock(aMsg.dmSessionID);
  try
    with aMsg, TnxDataMessageStream.Create(aMsg) do try
      try
        DebugMsg('TncnxCmdHandler.nmSalvaCredTempo');
        CT := TncCredTempo.Create;
        try
          CT.LoadFromStream(TheStream);
          Erro := Serv.SalvaCredTempo(CT);
        finally
          CT.Free;
        end;
        DebugMsg('TncnxCmdHandler.nmSalvaCredTempo - Res: ' +  IntToStr(Erro));
      except
        on E: Exception do begin
          Erro := 2;
          DebugMsg('TncnxCmdHandler.nmSalvaCredTempo - Exception: ' + E.Message);
        end;
      end;
    finally
      Free;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmSalvaDebito(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; CEList : TList;
  Deb : TncDebito;
begin
  ServLock(aMsg.dmSessionID);
  try
    with aMsg, TnxDataMessageStream.Create(aMsg) do try
      try
        DebugMsg('TncnxCmdHandler.nmSalvaDebito');
        Deb := TncDebito.Create;
        try
          Deb.LeStream(TheStream);
          Erro := Serv.SalvaDebito(Deb);
        finally
          Deb.Free;
        end;
        DebugMsg('TncnxCmdHandler.nmSalvaDebito - Res: ' +  IntToStr(Erro));
      except
        on E: Exception do begin
          Erro := 2;
          DebugMsg('TncnxCmdHandler.nmSalvaDebito - Exception: ' + E.Message);
        end;
      end;
    finally
      Free;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmSalvaDebTempo(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; CEList : TList;
  Deb : TncDebTempo;
begin
  ServLock(aMsg.dmSessionID);
  try
    with aMsg, TnxDataMessageStream.Create(aMsg) do try
      try
        DebugMsg('TncnxCmdHandler.nmSalvaDebTempo');
        Deb := TncDebTempo.Create;
        try
          Deb.LeStream(TheStream);
          Erro := Serv.SalvaDebTempo(Deb);
        finally
          Deb.Free;
        end;
        DebugMsg('TncnxCmdHandler.nmSalvaDebTempo - Res: ' +  IntToStr(Erro));
      except
        on E: Exception do begin
          Erro := 2;
          DebugMsg('TncnxCmdHandler.nmSalvaDebTempo - Exception: ' + E.Message);
        end;
      end;
    finally
      Free;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmSalvaImpressao(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; CEList : TList;
  Imp : TncImpressao;
begin
  ServLock(aMsg.dmSessionID);
  try
    with aMsg, TnxDataMessageStream.Create(aMsg) do try
      try
        DebugMsg('TncnxCmdHandler.nmSalvaImpressao');
        Imp := TncImpressao.Create;
        try
          Imp.LoadFromStream(TheStream);
          Erro := Serv.SalvaImpressao(Imp);
        finally
          Imp.Free;
        end;
        DebugMsg('TncnxCmdHandler.nmSalvaImpressao - Res: ' +  IntToStr(Erro));
      except
        on E: Exception do begin
          Erro := 2;
          DebugMsg('TncnxCmdHandler.nmSalvaImpressao - Exception: ' + E.Message);
        end;
      end;
    finally
      Free;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmSalvaClientPages(var aMsg: TnxDataMessage);
var
  Erro: TnxResult; CEList: TList;
begin
  Erro := 0;
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmClientPages(dmData^) do 
  try
    try
      DebugMsg('TncnxCmdHandler.nmSalvaClientPages - nmImp: ' + nmImp +
               ' - nmJobID: ' + IntToStr(nmJobID) +
               ' - nmMaq: ' + IntToStr(nmMaq));
      Erro := Serv.SalvaClientPages(nmImp, nmJobID, nmMaq, nmPaginas);
      DebugMsg('TncnxCmdHandler.nmSalvaClientPages - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmSalvaClientPages - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmSalvaLancExtra(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; CEList : TList;
  Le  : TncLancExtra;
begin
  ServLock(aMsg.dmSessionID);
  try
    with aMsg, TnxDataMessageStream.Create(aMsg) do try
      try
        DebugMsg('TncnxCmdHandler.nmSalvaLancExtra');
        LE := TncLancExtra.Create;
        try
          LE.LeStream(TheStream);
          Erro := Serv.SalvaLancExtra(LE);
        finally
          LE.Free;
        end;
        DebugMsg('TncnxCmdHandler.nmSalvaLancExtra - Res: ' +  IntToStr(Erro));
      except
        on E: Exception do begin
          Erro := 2;
          DebugMsg('TncnxCmdHandler.nmSalvaLancExtra - Exception: ' + E.Message);
        end;
      end;
    finally
      Free;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmSalvaLic(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; CEList : TList;
  SL  : TStrings;
begin
  ServLock(aMsg.dmSessionID);
  try
    with aMsg, TnxDataMessageStream.Create(aMsg) do try
      try
        SL := TStringList.Create;
        try
          SL.LoadFromStream(TheStream);
          DebugMsg('TncnxCmdHandler.nmSalvaLic - Lic: '+SL.Text);
          Erro := Serv.SalvaLic(SL.Text);
        finally
          SL.Free;
        end;
        DebugMsg('TncnxCmdHandler.nmSalvaLic - Res: ' +  IntToStr(Erro));
      except
        on E: Exception do begin
          Erro := 2;
          DebugMsg('TncnxCmdHandler.nmSalvaLic - Exception: ' + E.Message);
        end;
      end;
    finally
      Free;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmSalvaMovEst(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; CEList : TList;
  ME : TncMovEst;
begin
  ServLock(aMsg.dmSessionID);
  try
    with aMsg, TnxDataMessageStream.Create(aMsg) do try
      try
        DebugMsg('TncnxCmdHandler.nmSalvaMovEst - HandleCliAtual: '+IntToStr(HandleCliAtual));
        ME := TncMovEst.Create;
        try
          ME.LeStream(TheStream);
          Erro := Serv.SalvaMovEst(ME);
        finally
          ME.Free;
        end;
        DebugMsg('TncnxCmdHandler.nmSalvaMovEst - Res: ' +  IntToStr(Erro));
      except
        on E: Exception do begin
          Erro := 2;
          DebugMsg('TncnxCmdHandler.nmSalvaMovEst - Exception: ' + E.Message);
        end;
      end;
    finally
      Free;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmSalvaProcessos(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; CEList : TList;
  SL  : TStrings;
  aIDCliente, aReq : Integer;
begin
  ServLock(aMsg.dmSessionID);
  try
    with aMsg, TnxDataMessageStream.Create(aMsg) do try
      try
        SL := TStringList.Create;
        try
          SL.LoadFromStream(TheStream);
          aIDCliente := StrToIntDef(SL[0], 0);
          aReq := StrToIntDef(SL[1], 1);
          SL.Delete(0);SL.Delete(0);
          DebugMsg('TncnxCmdHandler.nmSalvaProcessos - SL.Text: '+SL.Text);
          Erro := Serv.SalvaProcessos(aIDCliente, aReq, SL);
        finally
          SL.Free;
        end;
        DebugMsg('TncnxCmdHandler.nmSalvaProcessos - Res: ' +  IntToStr(Erro));
      except
        on E: Exception do begin
          Erro := 2;
          DebugMsg('TncnxCmdHandler.nmSalvaProcessos - Exception: ' + E.Message);
        end;
      end;
    finally
      Free;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmSalvaSenhaCli(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmSenhaCli(dmData^) do
  try
    try
      DebugMsg('TncnxCmdHandler.nmSalvaSenhaCli - nmCodigo: ' + IntToStr(nmCodigo) +
        ' - nmSenha: ' + nmSenha);
      Erro := Serv.SalvaSenhaCli(nmCodigo, nmSenha);
      DebugMsg('TncnxCmdHandler.nmSalvaSenhaCli - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmSalvaSenhaCli - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmSalvaTelaMaq(var aMsg: TnxDataMessage);
var
  Erro : TnxResult; CEList : TList;
  C : TncCliente;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmSalvaTela(dmData^) do 
  try
    try
      Erro := 0;
      DebugMsg('TncnxCmdHandler.nmSalvaTelaMaq - nmSession: ' + IntToStr(nmSession));
      C := Serv.ObtemClientePorSessionID(nmSession);
      if (C<>nil) and (C.SessionID>0) and (C.Socket<>0) then
        TnxBaseTransport(C.Socket).Post(0, nmSession, 0, ncnmSalvaTelaEv, dmData, dmDataLen, 3000);
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmSalvaTelaMaq - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmShutdown(var aMsg: TnxDataMessage);
var
  Erro : TnxResult; CEList : TList;
  SS: TArraySessionSocket;
  I : Integer;
begin
  Erro := 0;
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmShutdown(dmData^) do 
  try
    try
      Serv.ObtemSessionSocketArray(nmMaq, SS);
      DebugMsg('TncnxCmdHandler.nmShutdown - nmMaq: ' + IntToStr(nmMaq) +
        ' - nmOper: ' + IntToStr(nmOper));
        
      for I := 0 to High(SS) do
      if (nmMaq<>High(Word)) or (TncSessoes(Serv.ObtemLista(tcSessao)).PorMaq[SS[I].ssMaq]=nil) then
        TnxBaseTransport(SS[I].ssSocket).Post(0, SS[I].ssSession, 0, ncnmShutdownEv, dmData, dmDataLen, 1000);
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmShutdown - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmSuporteRem(var aMsg: TnxDataMessage);
var
  Erro : TnxResult; CEList : TList;
  SS: TArraySessionSocket;
  I : Integer;
begin
  Erro := 0;
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmSuporteRem(dmData^) do 
  try
    try
      Serv.ObtemSessionSocketArray(nmMaq, SS);
      DebugMsg('TncnxCmdHandler.nmSuporteRem - nmMaq: ' + IntToStr(nmMaq) +
        ' - nmTec: ' + IntToStr(nmTec));
      for I := 0 to High(SS) do 
        TnxBaseTransport(SS[I].ssSocket).Post(0, SS[I].ssSession, 0, ncnmSuporteRemEv, dmData, dmDataLen, 1000);
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmSuporteRem - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmTransferirMaq(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmTransferirMaqReq(dmData^) do
  try
    try
      DebugMsg('TncnxCmdHandler.nmTransferirMaq - nmOrigem: ' + IntToStr(nmOrigem) +
        ' - nmDestino: ' + IntToStr(nmDestino));
      Erro := Serv.TransferirMaq(nmOrigem, nmDestino);
      DebugMsg('TncnxCmdHandler.nmTransferirMaq - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmTransferirMaq - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmUploadArq(var aMsg: TnxDataMessage);
var 
  S: TnxMemoryStream;
  Str: String;
  Erro : TnxResult;
  CEList : TList;
begin
  S := TnxMemoryStream.Create;
  try
    ServLock(aMsg.dmSessionID);
    try
      with aMsg, TnmUpload(aMsg.dmData^) do 
      try
        DebugMsg('TncnxCmdHandler.nmUploadArq - NomeArq: ' + nmNomeArq +
                 ' - Tamanho: ' + IntToStr(nmTamanho));
        Str := ExtractFilePath(ParamStr(0)) + nmNomeArq;
        if FileExists(Str) then 
          DeleteFile(Str);
          
        S.SetSize(nmTamanho);
        Move(nmArq, S.Memory^, nmTamanho);
        S.SaveToFile(Str);
          
        Erro := 0;
        DebugMsg('TncnxCmdHandler.nmUploadArq - Res: ' + IntToStr(Erro));
      except
        on E: Exception do begin
          Erro := 2;
          DebugMsg('TncnxCmdHandler.nmUploadArq - Exception: ' + E.Message);
        end;
      end;
    finally
      CEList := ServUnlock;
    end;
    SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
  finally
    S.Free;
  end;
end;

procedure TncnxCmdHandler.nmKeepAlive(var aMsg: TnxDataMessage);
begin
  TnxBaseTransport.Reply(aMsg.dmMsg, 0, nil, 0);
end;

procedure TncnxCmdHandler.nmLimpaFundo(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmLimpaFundoReq(dmData^) do
  try
    try
      DebugMsg('TncnxCmdHandler.nmLimpaFundo - nmDesktop: ' + BoolStr(nmDesktop));
      Erro := Serv.LimpaFundo(nmDesktop);
      DebugMsg('TncnxCmdHandler.nmLimpaFundo - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmLimpaFundo - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

type
  THackTransp = Class (TnxBasePooledTransport )
    function GetRemoteAddress(aSessionID: TnxSessionID): String;
  End;

  
  
procedure TncnxCmdHandler.nmLogin(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; CEList : TList;
  R    : TnmLoginRpy;
  I : Integer;
  S : String;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmLoginReq(dmData^) do
  try
    PluginEngine.SessionLogin(aMsg.dmSessionID);
    try
      DebugMsg('TncnxCmdHandler.nmLogin - dmSessionID: ' + IntToStr(aMsg.dmSessionID) +
        ' - nmUsername: ' + nmUsername +
        ' - nmSenha: ' + nmSenha +
        ' - nmFuncAtual: ' + BoolStr(nmFuncAtual) + 
        ' - nmMaq: ' + IntToStr(nmMaq) + 
        ' - nmProxyHandle: ' + IntToStr(nmProxyHandle));

      S := '';  
      I := Integer(TnxBaseTransport.CurrentTransport);
      try
        S := dmServidorBD.GetSessionIP(aMsg.dmSessionID);
        if Pos(':', S)>0 then Delete(S, Pos(':', S), 100);
      except
        S := '';
      end;
      Erro := Serv.Login(nmUsername, nmSenha, nmMaq, nmFuncAtual, True, 0, nmProxyHandle, 
                         I, aMsg.dmSessionID, S, R.nmHandle);
      DebugMsg('TncnxCmdHandler.nmLogin - Handle Cliente: ' + IntToStr(R.nmHandle)+ ' - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmLogin - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, @R, SizeOf(R));
end;

procedure TncnxCmdHandler.nmLoginMaq(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; CEList : TList;
  S : TncSessao;
begin
  ServLock(aMsg.dmSessionID);
  try
    with aMsg, TnxDataMessageStream.Create(aMsg) do try
      try
        S := TncSessao.Create(False);
        try
          S.LeStream(TheStream);   
          DebugMsg('TncnxCmdHandler.nmLoginMaq - dmSessionID: ' + IntToStr(aMsg.dmSessionID) + 
            ' - Username: ' + S.UsernameLogin + 
            ' - Senha: ' + S.SenhaLogin);
          Erro := Serv.LoginMaq(S);
          DebugMsg('TncnxCmdHandler.nmLoginMaq - Res: ' +  IntToStr(Erro));
        finally
          S.Free;
        end;
      except
        on E: Exception do begin
          Erro := 2;
          DebugMsg('TncnxCmdHandler.nmLoginMaq - Exception: ' + E.Message);
        end;
      end;
    finally
      Free;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmLogout(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg do 
  try
    try
      DebugMsg('TncnxCmdHandler.nmLogout - nmCliente: ' + IntToStr(Integer(dmData^)));
      Serv.Logout(Integer(dmData^));
      Erro := 0;
      DebugMsg('TncnxCmdHandler.nmLogout - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmLogout - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmLogoutMaq(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmLogoutMaqReq(dmData^) do
  try
    try
      DebugMsg('TncnxCmdHandler.nmLogoutMaq - dmSessionID: ' + IntToStr(aMsg.dmSessionID) + 
      ' - nmMaq: ' + IntToStr(nmMaq));
      Erro := Serv.LogoutMaq(nmMaq);
      DebugMsg('TncnxCmdHandler.nmLogoutMaq - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmLogoutMaq - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmModoManutencao(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmModoManutencaoReq(dmData^) do
  try
    try
      DebugMsg('TncnxCmdHandler.nmModoManutencao - nmMaq: ' + IntToStr(nmMaq) +
        ' - nmUsername: ' + nmUsername + 
        ' - Senha: ' + nmSenha +
        ' - Entrar: ' + BoolStr(nmEntrar));
        
      Erro := Serv.ModoManutencao(nmMaq, nmUsername, nmSenha, nmEntrar);
      DebugMsg('TncnxCmdHandler.nmModoManutencao - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmModoManutencao - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmMonitorOnOff(var aMsg: TnxDataMessage);
var
  Erro : TnxResult;
  CEList : TList;
  SS: TArraySessionSocket;
begin
  Erro := 0;
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmMonitorOnOff(dmData^) do 
  try
    try
      Serv.ObtemSessionSocketArray(nmMaq, SS);
      DebugMsg('TncnxCmdHandler.nmMonitorOnOff - nmMaq: ' + IntToStr(nmMaq));
      if Length(SS)>0 then
        TnxBaseTransport(SS[0].ssSocket).Post(0, SS[0].ssSession, 0, ncnmMonitorOnOffEv, dmData, dmDataLen, 3000) else
        DebugMsg('TncnxCmdHandler.nmMonitorOnOff - SS = 0');
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmMonitorOnOff - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmNovoObj(var aMsg: TnxDataMessage);
begin
  nmAlteraObj(aMsg);
end;

procedure TncnxCmdHandler.nmObtemLista(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; CEList : TList;
  S : TnxMemoryStream;
begin  
  S := TnxMemoryStream.Create;
  try
    ServLock(aMsg.dmSessionID);
    with aMsg, TnmObtemListaReq(dmData^) do 
    try
      try
        DebugMsg('TncnxCmdHandler.nmObtemLista - nmCliente: '+IntToStr(nmCliente) + 
          ' - nmTipoClasse: ' + IntToStr(nmTipoClasse));
        Erro := Serv.ObtemStreamListaObj(nmCliente, nmTipoClasse, S);
        DebugMsg('TncnxCmdHandler.nmObtemLista - Res: ' +  IntToStr(Erro));
      except
        on E: Exception do begin
          Erro := 2;
          DebugMsg('TncnxCmdHandler.nmObtemLista - Exception: ' + E.Message);
        end;
      end;
    finally
      CEList := ServUnlock;
    end;
    SendReply(CEList, aMsg.dmMsg, Erro, S.Memory, S.Size);
  finally
    S.Free;
  end;
end;

procedure TncnxCmdHandler.nmObtemPastaServ(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; CEList : TList;
  R : TnmNomeArq;
  S : String;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg do 
  try
    try
      Erro := Serv.ObtemPastaServ(S);
      R.nmNomeArq := S;
      DebugMsg('TncnxCmdHandler.nmObtemPastaServ - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmObtemPastaServ - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, @R, SizeOf(R));
end;

procedure TncnxCmdHandler.nmObtemPatrocinios(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; CEList : TList;
  S : TnxMemoryStream;
  SL : TStrings;
begin
  S := TnxMemoryStream.Create;
  try
    ServLock(aMsg.dmSessionID);
    with aMsg do 
    try
      try
        DebugMsg('TncnxCmdHandler.nmObtemPatrocinios');
        SL := TStringList.Create;
        try
          Erro := Serv.ObtemPatrocinios(SL);
          SL.SaveToStream(S);
        finally
          SL.Free;
        end;
        DebugMsg('TncnxCmdHandler.nmObtemPatrocinios - Res: ' +  IntToStr(Erro));
      except
        on E: Exception do begin
          Erro := 2;
          DebugMsg('TncnxCmdHandler.nmObtemPatrocinios - Exception: ' + E.Message);
        end;
      end;
    finally
      CEList := ServUnlock;
    end;
    SendReply(CEList, aMsg.dmMsg, Erro, S.Memory, S.Size);
  finally
    S.Free;
  end;
end;

procedure TncnxCmdHandler.nmObtemProcessos(var aMsg: TnxDataMessage);
var
  Erro : TnxResult; CEList : TList;
  SS: TArraySessionSocket;
begin
  Erro := 0;
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmObtemProcessos(dmData^) do 
  try
    try
      Serv.ObtemSessionSocketArray(nmMaq, SS);
      DebugMsg('TncnxCmdHandler.nmObtemProcessos - nmIDCliente: ' + IntToStr(nmIDCliente) +
        ' - nmIDRequest: ' + IntToStr(nmIDRequest) + 
        ' - nmMaq: ' + IntToStr(nmMaq));

      if Length(SS)>0 then
        TnxBaseTransport(SS[0].ssSocket).Post(0, SS[0].ssSession, 0, ncnmObtemProcessosEv, dmData, dmDataLen, 1000);
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmCapturaTelaMaq - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmObtemSenhaCli(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; CEList : TList;
  R : TnmSenhaCli;
  S : String;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmSenhaCli(dmData^) do 
  try
    try
      DebugMsg('TncnxCmdHandle.nmObtemSenhaCli - nmCodigo: ' + IntToStr(nmCodigo));
      Erro := Serv.ObtemSenhaCli(nmCodigo, S);
      R.nmSenha := S;
      DebugMsg('TncnxCmdHandler.nmObtemSenhaCli - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmObtemSenhaCli - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, @R, SizeOf(R));
end;

procedure TncnxCmdHandler.nmObtemSitesBloq(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; CEList : TList;
  S : TnxMemoryStream;
  SL : TStrings;
  Str : String;
begin
  S := TnxMemoryStream.Create;
  try
    ServLock(aMsg.dmSessionID);
    with aMsg do 
    try
      try
        DebugMsg('TncnxCmdHandler.nmObtemSitesBloq');
        Erro := Serv.ObtemSitesBloqueados(Str);
        if Erro=0 then begin
          SL := TStringList.Create;
          try
            SL.Text := Str;
            SL.SaveToStream(S);
          finally
            SL.Free;
          end;
        end;
        DebugMsg('TncnxCmdHandler.nmObtemSitesBloq - Res: ' +  IntToStr(Erro));
      except
        on E: Exception do begin
          Erro := 2;
          DebugMsg('TncnxCmdHandler.nmObtemSitesBloq - Exception: ' + E.Message);
        end;
      end;
    finally
      CEList := ServUnlock;
    end;
    SendReply(CEList, aMsg.dmMsg, Erro, S.Memory, S.Size);
  finally
    S.Free;
  end;
end;

procedure TncnxCmdHandler.nmObtemStreamConfig(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; CEList : TList;
  S : TnxMemoryStream;
begin
  S := TnxMemoryStream.Create;
  try
    ServLock(aMsg.dmSessionID);
    with aMsg do 
    try
      try
        DebugMsg('TncnxCmdHandler.nmObtemStreamConfig');
        Erro := Serv.ObtemStreamConfig(S);
        DebugMsg('TncnxCmdHandler.nmObtemStreamConfig - Res: ' +  IntToStr(Erro));
      except
        on E: Exception do begin
          Erro := 2;
          DebugMsg('TncnxCmdHandler.nmObtemStreamConfig - Exception: ' + E.Message);
        end;
      end;
    finally
      CEList := ServUnlock;
    end;
    SendReply(CEList, aMsg.dmMsg, Erro, S.Memory, S.Size);
  finally
    S.Free;
  end;
end;

procedure TncnxCmdHandler.nmObtemVersaoGuard(var aMsg: TnxDataMessage);
var 
  Erro : TnxResult; 
  CEList : TList;
  Ver    : Integer;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmPaginasImpressasReq(dmData^) do
  try
    try
      DebugMsg('TncnxCmdHandler.nmObtemVersaoGuard');
      Erro := Serv.ObtemVersaoGuard(Ver);
      DebugMsg('TncnxCmdHandler.nmObtemVersaoGuard - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmObtemVersaoGuard - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, @Ver, SizeOf(Integer));
end;

procedure TncnxCmdHandler.nmPaginasImpressas(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmPaginasImpressasReq(dmData^) do
  try
    try
      DebugMsg('TncnxCmdHandler.nmPaginasImpressas - nmMaq: ' + IntToStr(nmMaq) +
        ' - nmJobId: ' + IntToStr(nmJobID) + 
        ' - nmPaginas: ' + IntToStr(nmPag) +
        ' - nmImp: ' + nmImp + 
        ' - nmDoc: ' + nmDoc);

      Erro := Serv.RegistraPaginasImpressas(nmJobID, nmMaq, nmPag, nmImp, nmDoc);
      DebugMsg('TncnxCmdHandler.nmPaginasImpressas - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmPaginasImpressas - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmPararTempoMaq(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmPararTempoMaqReq(dmData^) do
  try
    try
      DebugMsg('TncnxCmdHandler.nmPararTempoMaq - nmMaq: ' + IntToStr(nmMaq) +
        ' - nmParar: ' + BoolStr(nmParar));

      Erro := Serv.PararTempoMaq(nmMaq, nmParar);
      DebugMsg('TncnxCmdHandler.nmPararTempoMaq - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmPararTempoMaq - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;


procedure TncnxCmdHandler.nmPermitirDownload(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmPermitirDownloadReq(dmData^) do
  try
    try
      DebugMsg('TncnxCmdHandler.nmPermitirDownload - nmSessao: ' + IntToStr(nmSessao) +
        ' - nmExe: ' + BoolStr(nmExe) + '- nmPerm: ' + BoolStr(nmPerm));

      Erro := Serv.PermitirDownload(nmSessao, nmExe, nmPerm);
      DebugMsg('TncnxCmdHandler.nmPermitirDownload - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmPermitirDownload - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmDesativarFWSessao(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmDesativarFWSessaoReq(dmData^) do
  try
    try
      DebugMsg('TncnxCmdHandler.nmDesativarFWSessao - nmSessao: ' + IntToStr(nmSessao) +
        ' - nmPerm: ' + BoolStr(nmDesativar));

      Erro := Serv.DesativarFWSessao(nmSessao, nmDesativar);
      DebugMsg('TncnxCmdHandler.nmDesativarFWSessao - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmDesativarFWSessao - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmDesktopSincronizado(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmSessao(dmData^) do
  try
    try
      DebugMsg('TncnxCmdHandler.nmDesktopSincronizado - nmSessao: ' + IntToStr(nmSessao) +
        ' - nmPerm: ' + IntToStr(nmSessao));

      Erro := Serv.DesktopSincronizado(nmSessao);
      DebugMsg('TncnxCmdHandler.nmDesktopSincronizado - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmDesktopSincronizado - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.nmPreLogoutMaq(var aMsg: TnxDataMessage);
var Erro : TnxResult; CEList : TList;
begin
  ServLock(aMsg.dmSessionID);
  with aMsg, TnmLogoutMaqReq(dmData^) do
  try
    try
      DebugMsg('TncnxCmdHandler.nmPreLogountMaq - nmMaq: ' + IntToStr(nmMaq));
      Erro := Serv.PreLogoutMaq(nmMaq);
      DebugMsg('TncnxCmdHandler.nmPreLogoutMaq - Res: ' +  IntToStr(Erro));
    except
      on E: Exception do begin
        Erro := 2;
        DebugMsg('TncnxCmdHandler.nmPreLogoutMaq - Exception: ' + E.Message);
      end;
    end;
  finally
    CEList := ServUnlock;
  end;
  SendReply(CEList, aMsg.dmMsg, Erro, nil, 0);
end;

procedure TncnxCmdHandler.bpchProcess( aMsg: PnxDataMessage; var aHandled: Boolean );
begin
  aHandled := False;
  if (Serv=nil) or (not ServidorAtivo) then Exit;
  IncPend;
  try
    try
      if not ServidorAtivo then Exit;
      _bpchProcess(aMsg, aHandled);
    except
    end;
  finally
    DecPend;
  end;
end;

procedure TncnxCmdHandler._bpchProcess( aMsg: PnxDataMessage; var aHandled: Boolean );
begin
  aHandled := True;
  case aMsg^.dmMsg of
    ncnmLogin              : nmLogin(aMsg^);
    ncnmLogout             : nmLogout(aMsg^); 
    ncnmNovoObj            : nmNovoObj(aMsg^); 
    ncnmAlteraObj          : nmAlteraObj(aMsg^); 
    ncnmApagaObj           : nmApagaObj(aMsg^); 
    ncnmObtemLista         : nmObtemLista(aMsg^); 
    ncnmLoginMaq           : nmLoginMaq(aMsg^); 
    ncnmLogoutMaq          : nmLogoutMaq(aMsg^); 
    ncnmDownloadArq        : nmDownloadArq(aMsg^);
    ncnmUploadArq          : nmUploadArq(aMsg^);
    ncnmObtemVersaoGuard   : nmObtemVersaoGuard(aMsg^);
    
    ncnmPreLogoutMaq       : nmPreLogoutMaq(aMsg^);
    ncnmCancLogoutMaq      : nmCancLogoutMaq(aMsg^);
    ncnmSalvaTelaMaq       : nmSalvaTelaMaq(aMsg^); 
    ncnmCapturaTelaMaq     : nmCapturaTelaMaq(aMsg^);
    ncnmObtemStreamConfig  : nmObtemStreamConfig(aMsg^);
    ncnmPararTempoMaq      : nmPararTempoMaq(aMsg^);
    ncnmTransferirMaq      : nmTransferirMaq(aMsg^);
    ncnmRefreshPrecos      : nmRefreshPrecos(aMsg^);
    ncnmShutdown           : nmShutdown(aMsg^);
    ncnmModoManutencao     : nmModoManutencao(aMsg^);
    ncnmAdicionaPassaporte : nmAdicionaPassaporte(aMsg^);
    ncnmPaginasImpressas   : nmPaginasImpressas(aMsg^);
    ncnmAvisos             : nmAvisos(aMsg^);
    ncnmObtemPastaServ     : nmObtemPastaServ(aMsg^);
    ncnmArqFundoEnviado    : nmArqFundoEnviado(aMsg^);
    ncnmObtemSenhaCli      : nmObtemSenhaCli(aMsg^);
    ncnmSalvaSenhaCli      : nmSalvaSenhaCli(aMsg^);
    ncnmLimpaFundo         : nmLimpaFundo(aMsg^);
    ncnmEnviaChat          : nmEnviaChat(aMsg^);
    ncnmSalvaCredTempo     : nmSalvaCredTempo(aMsg^);
    ncnmAlteraSessao       : nmAlteraSessao(aMsg^);
    ncnmCancelaTran        : nmCancelaTran(aMsg^);
    ncnmSalvaMovEst        : nmSalvaMovEst(aMsg^);
    ncnmSalvaDebito        : nmSalvaDebito(aMsg^);
    ncnmSalvaImpressao     : nmSalvaImpressao(aMsg^);
    ncnmAbreCaixa          : nmAbreCaixa(aMsg^);
    ncnmFechaCaixa         : nmFechaCaixa(aMsg^);
    ncnmObtemProcessos     : nmObtemProcessos(aMsg^);
    ncnmFinalizaProcesso   : nmFinalizaProcesso(aMsg^);
    ncnmSalvaProcessos     : nmSalvaProcessos(aMsg^);
    ncnmObtemSitesBloq     : nmObtemSitesBloq(aMsg^);
    ncnmRefreshEspera      : nmRefreshEspera(aMsg^);
    ncnmPermitirDownload   : nmPermitirDownload(aMsg^);
    ncnmDesativarFWSessao  : nmDesativarFWSessao(aMsg^);
    ncnmDesktopSincronizado: nmDesktopSincronizado(aMsg^);
    ncnmMonitorOnOff       : nmMonitorOnOff(aMsg^);
    ncnmSalvaLancExtra     : nmSalvaLancExtra(aMsg^);
    ncnmSalvaDebTempo      : nmSalvaDebTempo(aMsg^);
    ncnmCorrigeDataCaixa   : nmCorrigeDataCaixa(aMsg^);
    ncnmRefreshSessao      : nmRefreshSessao(aMsg^);
    ncnmSuporteRem         : nmSuporteRem(aMsg^);
    ncnmSalvaLic           : nmSalvaLic(aMsg^);
    ncnmObtemPatrocinios   : nmObtemPatrocinios(aMsg^);
    ncnmAjustaPontosFid    : nmAjustaPontosFid(aMsg^);
    ncnmSalvaAppUrlLog     : nmSalvaAppUrlLog(aMsg^);
    ncnmKeepAlive          : nmKeepAlive(aMsg^);
    ncnmDisableAd          : nmDisableAd(aMsg^);
    ncnmSalvaClientPages   : nmSalvaClientPages(aMsg^);
    ncnmJobControl         : nmJobControl(aMsg^);
    ncnmApagaMsgCli        : nmApagaMsgCli(aMsg^);
  else
    aHandled := False;
  end;
end;


procedure TncnxCmdHandler.bpchRemoveSession(aTransport: TnxBaseTransport;
                                                             aSessionId: TnxSessionID);
begin
  inherited;
  if not ServidorAtivo then Exit;
  PluginEngine.spRemoveSession( aSessionID );
end;

procedure TncnxCmdHandler.bpchSessionFailed(aTransport: TnxBaseTransport;
  aSessionID: TnxSessionID);
begin
  inherited;
  if not ServidorAtivo then Exit;
  PluginEngine.spRemoveSession( aSessionID );
end;

{ THackTransp }

type
  THackSession = class ( TnxBaseRemoteSession );


  THackRemTransp = class ( TnxBaseRemoteTransport )
    function IsSessionID(aSessionID: TnxSessionID): Boolean;
  end;
  
function THackTransp.GetRemoteAddress(aSessionID: TnxSessionID): String;
var 
  i: Integer;
begin
  Result := '';
  with btRemoteTransports, BeginRead do try
    for I := 0 to Count - 1 do 
      with THackRemTransp(Items[i]) do  
        if IsSessionID(aSessionID) then begin
          Result := RemoteAddress;
          if Trim(Result)<>'' then
            Exit;
        end;
      
  finally
    EndRead;
  end
end;

{ THackRemTransp }

function THackRemTransp.IsSessionID(aSessionID: TnxSessionID): Boolean;
var i: Integer;
begin
  Result := False;
  with brtSessions, BeginRead do 
  try
    for i := 0 to Count - 1 do 
      if THackSession(Items[I]).brsSessionID=aSessionID then  begin
        Result := True;
        Exit;
      end;
  finally
    EndRead;
  end
end;

{ TncEventoFalhou }

constructor TncEventoFalhou.Create(aMsg: Integer; aDados: Pointer; aSessionID: TnxSessionID; aTransp: TnxBaseTransport);
begin
  evMsg := aMsg;
  evDados := ClonaDados(aMsg, aDados);
  evSessionID := aSessionID;
  evTransp := aTransp;
end;

destructor TncEventoFalhou.Destroy;
begin
  FreeDados(evMsg, evDados);
  inherited;
end;

initialization
  TncnxServerPlugin.rcRegister;
  TncnxCmdHandler.rcRegister;

finalization
  TncnxServerPlugin.rcUnregister;
  TncnxCmdHandler.rcUnregister;



end.

