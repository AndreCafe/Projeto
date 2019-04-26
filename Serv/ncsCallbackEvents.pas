unit ncsCallbackEvents;

interface

uses
  ncNetMsg,
  SysUtils,
  Windows,
  ncClassesBase,
  ncMsgCom,
  nxptBasePooledTransport,
  nxllMemoryManager,
  nxstMessages,
  nxllList,
  nxllComponent,
  nxllTransport,
  nxllPluginBase,
  nxllSync,
  nxllTypes,
  SyncObjs,
  Classes;

type
  TncCallbackEvent = class;
  
  TncSessionCallback = class ( TThread )
  private
    FSessionID : TnxSessionID;
    FEvent     : TSimpleEvent;
    FMaq       : Integer;
    FTransp    : TnxBaseTransport;
  protected
    procedure Execute; override;  
    function Envia(aCE: TncCallbackEvent): Boolean;
  public
    constructor Create(aSessionID: TnxSessionID; aMaq: Integer; aTransp: TnxBaseTransport);
    destructor Destroy; override;

    procedure YouHaveNewEvents;
    procedure YouMustEnd;
  end;  

  TncCallbackEvent = class
    ceMsgID   : Integer;
    ceMsg     : Pointer;
    ceMsgLen  : Integer;
    ceSS      : TArraySessionSocket;
    ceDiscard : Boolean;

    procedure DeleteSS(aIndex: Integer);

    constructor CreateMsgCom(aMsg: Integer; aDados: Pointer; aSS: TArraySessionSocket);
    constructor CreateMsg(aMsgID: Integer; aDados: Pointer; aMsgLen: Integer; aSS: TArraySessionSocket);
    
    destructor Destroy; override;
    

    function SessionIndex(aSessionID: TnxSessionID): Integer;
    function HasSession(aSessionID: TnxSessionID): Boolean;
    procedure RemoveSession(aSessionID: TnxSessionID);
    function SessionCount: Integer;
  end;

  TncCallbackManager = class
  private
    FCS       : TCriticalSection;
    lSessions : TList;
    lEvents   : TList;
    procedure CallbackSent(aCE: TncCallbackEvent; aSessionID: TnxSessionID);
    function GetNext(aSessionID: TnxSessionID): TncCallbackEvent;

    procedure SessionCallbackTerminated(S: TncSessionCallback);

    function _FindSession(aSessionID: TnxSessionID): TncSessionCallback;
  public
    constructor Create;
    destructor Destroy; override;

    procedure AddEvent(C: TncCallbackEvent);
    procedure AddSession(S: TncSessionCallback);

    procedure RemoveEvent(C: TncCallbackEvent);
    procedure RemoveSession(S: TnxSessionID);

    function SessionExists(S: TnxSessionID): Boolean;

    procedure Clear(aForce: Boolean);
  end;

var
   gCallbackMgr : TncCallbackManager;  

implementation

uses ncDebug;

{ TncCallbackManager }

procedure TncCallbackManager.AddEvent(C: TncCallbackEvent);
var 
  I : Integer;
  S : TncSessionCallback;
begin
  FCS.Enter;
  try
    lEvents.Add(C);
    for I := High(C.ceSS) downto 0 do begin
      S := _FindSession(C.ceSS[I].ssSession);
      if S=nil then
        C.DeleteSS(I) else
        S.YouHaveNewEvents;
    end;
  finally
    FCS.Leave;
  end;
end;

procedure TncCallbackManager.AddSession(S: TncSessionCallback);
begin
  FCS.Enter;
  try
    lSessions.Add(S);
  finally
    FCS.Leave;
  end;
  S.Resume;
end;

procedure TncCallbackManager.CallbackSent(aCE: TncCallbackEvent;
  aSessionID: TnxSessionID);
begin
  FCS.Enter;
  try
    if lEvents.IndexOf(aCE)>=0 then 
      aCE.RemoveSession(aSessionID);
  finally
    FCS.Leave;
  end;
end;

procedure TncCallbackManager.Clear(aForce: Boolean);
var 
  I : Integer;
  E : TncCallbackEvent;
begin
  DebugMsg('TncCallbackManager.Clear');
  FCS.Enter;
  try
    with lEvents do 
      for I := 0 to Count-1 do TncCallbackEvent(Items[I]).ceDiscard := True;
      
    with lSessions do
      for I := Count-1 downto 0 do TncSessionCallback(Items[I]).YouMustEnd;

    if aForce then begin  
      while lEvents.Count > 0 do begin
        E := TncCallbackEvent(lEvents[0]);
        lEvents.Delete(0);
        E.Free;
      end;
    end;
  finally
    FCS.Leave;
  end;
end;

constructor TncCallbackManager.Create;
begin
  FCS := TCriticalSection.Create;
  lSessions := TList.Create;
  lEvents := TList.Create;
  gCallbackMgr := Self;
end;

destructor TncCallbackManager.Destroy;
begin
  gCallbackMgr := nil;
  Clear(True);
  FCS.Free;
  inherited;
end;

function TncCallbackManager.GetNext(aSessionID: TnxSessionID): TncCallbackEvent;
var 
  I : Integer;
  C : TncCallbackEvent;
begin
  FCS.Enter;
  try
    Result := nil;
    
    for I := 0 to lEvents.Count-1 do begin
      C := TncCallbackEvent(lEvents[I]);
      if C.HasSession(aSessionID) then begin
        if C.ceDiscard then
          C.DeleteSS(aSessionID) 
        else begin
          Result := TncCallbackEvent(lEvents[I]);
          Break;
        end;
      end;
    end;

    for I := lEvents.Count-1 downto 0 do begin
      C := TncCallbackevent(lEvents[I]);
      if C.SessionCount=0 then C.Free;
    end;
  finally
    FCS.Leave;
  end;
end;

procedure TncCallbackManager.RemoveEvent(C: TncCallbackEvent);
begin
  FCS.Enter;
  try
    DebugMsg('TncCallbackManager.RemoveEvent');
  
    lEvents.Remove(C);
  finally
    FCS.Leave;
  end;
end;

procedure TncCallbackManager.RemoveSession(S: TnxSessionID);
var 
  I : Integer;
  Obj : TncSessionCallback;
begin
  FCS.Enter;
  try
    Obj := _FindSession(S);
    if Assigned(Obj) then begin
      lSessions.Remove(Obj);
      Obj.YouMustEnd;
    end;
  finally
    FCS.Leave;
  end;
end;

procedure TncCallbackManager.SessionCallbackTerminated(
  S: TncSessionCallback);
var I : Integer;  
begin
  FCS.Enter;
  try
    for I := lEvents.Count-1 downto 0 do 
      TncCallbackEvent(lEvents[i]).RemoveSession(S.FSessionID);
    lSessions.Remove(S);  
  finally
    FCS.Leave;
  end;
  try DebugMsg('TncCallbaclManager.SessionCallbackTerminated- SessionID: '+ IntToStr(S.FSessionID) + ' - Maq: ' + IntToStr(S.FMaq)); except end;
end;

function TncCallbackManager.SessionExists(S: TnxSessionID): Boolean;
begin
  FCS.Enter;
  try
    Result := (_FindSession(S)<>nil);
  finally
    FCS.Leave;
  end;
end;

function TncCallbackManager._FindSession(
  aSessionID: TnxSessionID): TncSessionCallback;
var I: Integer;  
begin
  for I := 0 to lSessions.Count-1 do 
    if TncSessionCallback(lSessions[I]).FSessionID=aSessionID then begin
      Result := TncSessionCallback(lSessions[i]);
      Exit;
    end;
  Result := nil;  
end;

{ TncCallbackEvent }

constructor TncCallbackEvent.CreateMsg(aMsgID: Integer; aDados: Pointer;
  aMsgLen: Integer; aSS: TArraySessionSocket);
begin
  inherited;
  
  ceMsgID := aMsgID;
  
  ceMsgLen := aMsgLen;
  
  nxGetMem(ceMsg, aMsgLen);
  try
    Move(aDados^, ceMsg^, aMsgLen);
  except
    on E: Exception do begin
      nxFreeMem(ceMsg);
      DebugMsg('TncCallbackEvent.CreateMsg - Exception: ' + E.Message);
      raise;
    end;
  end;

  ceSS := aSS;
  ceDiscard := False;
end;

constructor TncCallbackEvent.CreateMsgCom(aMsg: Integer; aDados: Pointer;
  aSS: TArraySessionSocket);
var DataLen : Integer;
begin
  inherited;
  debugMsg('TncCallbackEvent.CreateMsgCom 1');
  ceMsg := nil;
  debugMsg('TncCallbackEvent.CreateMsgCom 2');
  if ObtemTipoDados(aMsg)=tdStream then 
    DataLen := TStream(aDados).Size else 
    DataLen := ObtemTamanhoDados(aMsg);
  debugMsg('TncCallbackEvent.CreateMsgCom 3');

  ceMsgID := ncnmMsgComEv;  
  debugMsg('TncCallbackEvent.CreateMsgCom 4');
  
  ceMsgLen := SizeOf( TnmMsgCom )
              - SizeOf( TnxVarMsgField ) + DataLen + 1;
  debugMsg('TncCallbackEvent.CreateMsgCom 5');
  
  nxGetZeroMem(ceMsg, ceMsgLen);
  debugMsg('TncCallbackEvent.CreateMsgCom 6');
  try
    debugMsg('TncCallbackEvent.CreateMsgCom 7');
    TnmMsgCom(ceMsg^).nmMsgID := aMsg;
    debugMsg('TncCallbackEvent.CreateMsgCom 8');
    TnmMsgCom(ceMsg^).nmDataLength := DataLen;
    debugMsg('TncCallbackEvent.CreateMsgCom 9');
    if ObtemTipoDados(aMsg)=tdStream then
      Move(TMemoryStream(aDados).Memory^, TnmMsgCom(ceMsg^).nmData, DataLen) else
      Move(aDados^, TnmMsgCom(ceMsg^).nmData, DataLen);
     debugMsg('TncCallbackEvent.CreateMsgCom 10');
  except
    nxFreeMem(ceMsg);
    raise;
  end;
  debugMsg('TncCallbackEvent.CreateMsgCom 11');

  ceSS := aSS;
  ceDiscard := False;
  debugMsg('TncCallbackEvent.CreateMsgCom 12');
end;

procedure TncCallbackEvent.DeleteSS(aIndex: Integer);
var J : Integer;
begin
  if aIndex>=0 then begin
    for J := aIndex to High(ceSS)-1 do
      ceSS[J] := ceSS[J+1];
    SetLength(ceSS, Length(ceSS)-1);
  end;
end;

destructor TncCallbackEvent.Destroy;
begin
  try nxFreeMem(ceMsg); except end;
  try
    if gCallbackMgr<>nil then
      gCallbackMgr.RemoveEvent(Self);
  except
  end;

  inherited;
end;

function TncCallbackEvent.HasSession(aSessionID: TnxSessionID): Boolean;
begin
  Result := (SessionIndex(aSessionID)>=0);
end;

procedure TncCallbackEvent.RemoveSession(aSessionID: TnxSessionID);
begin
  DeleteSS(SessionIndex(aSessionID));
  if SessionCount=0 then Free;
end;

function TncCallbackEvent.SessionCount: Integer;
begin
  Result := Length(ceSS);
end;

function TncCallbackEvent.SessionIndex(aSessionID: TnxSessionID): Integer;
begin
  for Result := 0 to High(ceSS) do 
    if ceSS[Result].ssSession=aSessionID then Exit;
  Result := -1;  
end;

{ TncSessionCallback }

constructor TncSessionCallback.Create(aSessionID: TnxSessionID; aMaq: Integer; aTransp: TnxBaseTransport);
begin
  inherited Create(True);
  FSessionID := aSessionID;
  FTransp := aTransp;
  FMaq := aMaq;
  FEvent := TSimpleEvent.Create(nil, False, False, 'nexsessionevent'+IntToStr(aSessionID)+IntToStr(Integer(Self)));
  FreeOnTerminate := True;
  DebugMsg('TncSessionCallback.Create - aSessionID: '+ IntToStr(aSessionID) + ' - aMaq: ' + IntToStr(aMaq));
end;

destructor TncSessionCallback.Destroy;
begin
  DebugMsg('TncSessionCallback.Destroy - aSessionID: '+ IntToStr(FSessionID) + ' - aMaq: ' + IntToStr(FMaq));
  FEvent.Free;
  inherited;
end;

function TncSessionCallback.Envia(aCE: TncCallbackEvent): Boolean;
var Tries: Integer;
begin
  try
    Result := False;
    Tries := 0;
    while (not Terminated) and (not Result) and (Tries<3) do begin
      try
        Inc(Tries);
        if Tries>1 then Sleep(50);
        FTransp.Post(0, FSessionID, 0, aCE.ceMsgID, aCE.ceMsg, aCE.ceMsgLen, Tries*2000);
        Result := True;
        DebugMsg('TncSessionCallback.Envia - OK - SessionID: ' + IntToStr(FSessionID) + ' - Maq: ' + IntToStr(FMaq));
      except
      end;
    end;

    if (not Result) and (not Terminated) then begin
      DebugMsg('TncSessionCallback.Envia - FALHOU - SessionID: '+ IntToStr(FSessionID) + ' - Maq: ' + IntToStr(FMaq));
      PostMessage(CliNOtifyHandle, wm_removesession, FSessionID, 0);
      Terminate;
      try if Assigned(gCallbackMgr) then gCallbackMgr.RemoveSession(FSessionID); except end;
    end;
  finally
    try
      if Assigned(gCallbackMgr) then 
        gCallbackMgr.CallbackSent(aCE, FSessionID);
    except
    end;
  end;
end;

procedure TncSessionCallback.Execute;
var CE: TncCallbackEvent;
begin
  try
    while not Terminated do begin
      try
        repeat 
          CE := gCallbackMgr.GetNext(FSessionID);
        until Terminated or (CE=nil) or (not Envia(CE));
      except
      end;
      if not Terminated then
        FEvent.WaitFor(INFINITE);
    end;
  finally
    if Assigned(gCallbackMgr) then 
      gCallbackMgr.SessionCallbackTerminated(Self);
  end;
end;

procedure TncSessionCallback.YouHaveNewEvents;
begin
  FEvent.SetEvent;
end;

procedure TncSessionCallback.YouMustEnd;
begin
  DebugMsg('TncSessionCallback.YouMustEnd - SessionID: '+ IntToStr(FSessionID) + ' - Maq: ' + IntToStr(FMaq));
  Terminate;
  FEvent.SetEvent;
end;

initialization
  TncCallbackManager.Create;

finalization
  gCallbackMgr.Free;

end.
