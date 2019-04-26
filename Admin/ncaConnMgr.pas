unit ncaConnMgr;

interface

uses SysUtils, Classes, SyncObjs, Windows, Messages, nxtwWinsockTransport, madTools, madTypes, idHttp;

type

  TConnMgr = class
  private
    FCS : TCriticalSection;
    FServidor : String;
    FAuto : TStrings;
    FLastConn : String;
    FLastConnOk : Boolean;
    FLastRefresh : Cardinal;
    FAutoRemote : TStrings;
    FAutoLocal  : TStrings;
    FOnUpdate : TNotifyEvent;
    FHandle : HWND;
    function GetAuto: Boolean;
    procedure SetAuto(const Value: Boolean);

    function ArqAuto: String;
    procedure LoadAuto;
    procedure SaveAuto;
    procedure SetServidor(const Value: String);
    function GetAutoRemote: String;
    procedure SetAutoRemote(const Value: String);
    function GetAutoLocal: String;
    procedure SetAutoLocal(const Value: String);

    procedure wmUpdate(window: HWND; msg: cardinal; wParam, lParam: madTypes.NativeInt; var result: madTypes.NativeInt);

    procedure MergeLocalAndRemote;

    property AutoLocal: String
      read GetAutoLocal write SetAutoLocal;

    property AutoRemote: String
      read GetAutoRemote write SetAutoRemote;
  public
    constructor Create;
    destructor Destroy; override;

    procedure LoadConfig;
    procedure SaveConfig;

    property Handle: HWND read FHandle;

    procedure SetLastConnOk(aServ: String);

    procedure RefreshAutoInfo;

    function ObtemServidor: String;

    procedure Conectou(aServ: String);
    procedure NaoConectou(aServ: String);

    property OnUpdate: TNotifyEvent
      read FOnUpdate write FOnUpdate;

    property LastConn: String
      read FLastConn;

    property LastConnOk: Boolean
      read FLastConnOk;

    property AutoServers: TStrings
      read FAuto;

    property Servidor: String
      read FServidor write SetServidor;

    property Auto: Boolean
      read GetAuto write SetAuto;  
  end;

var
  gConnMgr : TConnMgr = nil; 
  csRem     : TCriticalSection; 
  csLoc     : TCriticalSection;
  LastRem   : Cardinal = 0;
  LastLoc   : Cardinal = 0;
  gConnMgrStopRetry : Boolean = False;

implementation

uses ncaDM, ncDebug, MD5, nexUrls;

{ TConnMgr }

function GetRemoteServerNames: String;
var 
  H : TidHttp;
  sl : TStrings;
  Chave : String;
  Ok : Boolean;
  NextTry : Cardinal;
begin
  Result := '';
  if not csRem.TryEnter then Exit;
  try
    if (LastRem>0) and ((GetTickCount-LastRem)<120000) then Exit;
    DebugMsg('GetRemoteServerNames 1');
    sl := TStringList.Create;
    try
      H := TidHttp.Create(nil);
      try
        H.HandleRedirects := True;
        DebugMsg('GetRemoteServerNames 2');
        Chave := IntToStr(Random(999999));
        Ok := False;
        NextTry := 0;
        
        while (not Ok) and (not gConnMgrStopRetry) do begin
          if NextTry>0 then Sleep(500);
          if GetTickCount>=NextTry then
          try
            try 
              sl.Text := H.Get(gUrls.Url('autoconninfo', 'chave='+Chave)); 
            except 
              on e: exception do 
                DebugMsg('GetRemoteServerNames - Exception 1: '+E.Message);
            end;
            if (sl.Text>'') and (sl[0]=getMD5Str(Chave)) then begin
              Ok := True;
              LastRem := GetTickCount;
              sl.Delete(0);
              Result := sl.Text;
              DebugMsg('GetRemoteServerNames - OK - ' + Result);
            end else
              NextTry := GetTickCount + 10000;
          except
          end;
        end;
        DebugMsg('GetRemoteServerNames 3');
      finally
        H.Free;
      end;
    except
      on E: Exception do
        DebugMsg('GetRemoteServerNames - Exception 2: '+E.Message);
    end;
    sl.Free;
  finally
    csRem.Leave;
  end;
end;

function GetLocalServerNames: String;
var
  sl : TStrings;
  i : integer;
  s : string;
  NextTry : Cardinal;
begin
  Result := '';
  if not csLoc.TryEnter then Exit;
  try
    DebugMsg('GetLocalServerNames 1');
    with TnxWinsockTransport.Create(nil) do 
    try
      Port := 16200;
      sl := TStringList.Create;
      try
        NextTry := 0;
        while (Result='') and (not gConnmgrStopRetry) do begin
          if NextTry>0 then Sleep(500);
          if GetTickCount>=NextTry then begin
            try GetServerNames(sl, 1500); except end;
            if sl.Count>0 then begin
              for i := 0 to sl.Count-1 do  begin
                s := sl[i];
                Delete(s, 1, Pos('@', s));
                sl[i] := s;
              end;
              Result := sl.Text;
              DebugMsg('GetLocalServerNames OK - ' + Result);
            end else begin
              NextTry := GetTickCount+5000;
              DebugMsg('GetLocalServerNames FAIL');
            end;
          end;
        end;
      finally
        sl.Free;
      end;
    finally
      Free;
    end;
  finally
    csLoc.Leave;
  end;
end;


function TConnMgr.ArqAuto: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'autoconn.ini';
end;

procedure TConnMgr.Conectou(aServ: String);
begin
  FLastConn := aServ;
  FLastConnOk := True;
  slConfig.Values['UltimoServidor'] := aServ;
  Self.SaveConfig;
  DebugMsg('TConnMgr.Conectou - ' + slConfig.text);
end;

constructor TConnMgr.Create;
begin
  FCS := TCriticalSection.Create;
  FLastRefresh := 0;
  FAuto := TStringList.Create;
  FServidor := '127.0.0.1';
  FAutoRemote := TStringList.Create;
  FAutoLocal  := TStringList.Create;
  FOnUpdate := nil;
  FLastConn := '';
  FLastConnOk := False;
  LoadAuto;
  AddMsgHandler(wmUpdate, wm_user);
  FHandle := MsgHandlerWindow;
end;

destructor TConnMgr.Destroy;
begin
  FAuto.Free;
  FAutoRemote.Free;
  FAutoLocal.Free;
  FCS.Free;
  inherited;
end;

function TConnMgr.GetAutoRemote: String;
begin
  FCS.Enter;
  try
    Result := FAutoRemote.Text;
  finally
    FCS.Leave;
  end;
end;

function TConnMgr.GetAuto: Boolean;
begin
  Result := SameText(FServidor, 'auto');
end;

function TConnMgr.GetAutoLocal: String;
begin
  FCS.Enter;
  try
    Result := FAutoLocal.Text;
  finally
    FCS.Leave;
  end;
end;

procedure TConnMgr.LoadAuto;
begin
  if FileExists(ArqAuto) then 
    FAuto.LoadFromFile(ArqAuto);
end;

procedure TConnMgr.LoadConfig;
begin
  if slConfig.Values['servidor']='' then
    slConfig.Values['servidor'] := '127.0.0.1';
    
  gConnMgr.Servidor := slConfig.Values['servidor'];
  gConnMgr.SetLastConnOk(slConfig.Values['ultimoservidor']);
end;

procedure TConnMgr.MergeLocalAndRemote;
var 
  sl : TStrings;
  i : Integer;
begin
  DebugMsg('TConnMgr - MergeLocalAndRemote');
  sl := TStringList.Create;
  try
    sl.Text := FAutoLocal.Text;
    for I := 0 to FAutoRemote.Count-1 do 
      if sl.IndexOf(FAutoRemote[I])<0 then
        sl.Add(FAutoRemote[I]);
    PostMessage(FHandle, wm_user, wParam(sl), 0);
  except
    sl.Free;
  end;
end;

procedure TConnMgr.NaoConectou(aServ: String);
begin
  FLastConn := aServ;
  FLastConnOk := False;
end;

function TConnMgr.ObtemServidor: String;
var I : Integer;
begin
  if not Auto then
    Result := FServidor
  else 
  if FLastConnOk then
    Result := FLastConn
  else
  if FAuto.Count=0 then begin
    RefreshAutoInfo;
    if FAuto.Count>0 then
      Result := FAuto[0] else
      Result := '';
  end else begin
    I := FAuto.IndexOf(FLastConn);
    Inc(I);
    if I > (FAuto.Count-1) then begin
      RefreshAutoInfo;
      I := 0;
    end;
    Result := FAuto[I];
  end;
  if Result='' then Result := '127.0.0.1';
end;

type
  TThreadAutoRemote = class ( TThread )
  protected
    FHWND : HWND;
    procedure Execute; override;
  public
    constructor Create;
  end;

procedure TThreadAutoRemote.Execute;
var S: String;
begin
  S := GetRemoteServerNames;
  if S>'' then 
    try gConnMgr.AutoRemote := S; except end;
end;

constructor TThreadAutoRemote.Create;
begin
  inherited Create(True);
  FreeOnTerminate := True;
  Resume;
end;

type
  TThreadAutoLocal = class ( TThread )
  protected
     procedure Execute; override;
  public
    constructor Create;
  end;

{procedure TConnMgr.RefreshAuto(const aForce: Boolean = False);
var 
  S: String;
  I : Integer;
  sl, sl2 : TStrings;

function Normalizesl2: String;
var k, p: integer;
begin
  Result := '';
  for k := 0 to sl2.count-1 do begin
    p := Pos('@', sl2[k]);
    if Result>'' then
      Result := Result + sLineBreak;
    Result := Result + Copy(sl2[k], 1, P-1) + sLineBreak + Copy(sl2[k], P+1, 300);
  end;
end;  
  
begin
  DebugMsg('TConnMsg.RefreshAuto 1');
  if (not aForce) and (not ACIExpired) and FACIOk and ((GetTickCount-FLastRefresh)<120000) then Exit;
  DebugMsg('TConnMsg.RefreshAuto 2');
  FLastRefresh := GetTickCount;
  sl := TStringList.Create;
  sl2 := TStringList.Create;
  try
    TThreadAutoRemote.Create;
    Sleep(500);
    sl.Text := ACIStr;
    FACIOk := (sl.Text>'');
    DebugMsg('TConnMsg.RefreshAuto 3 - Sl.Text: '+Sl.Text);
    try 
      FrmPri.nxTCPIP.GetServerNames(sl2, 1500); 
    except 
      on E: Exception do 
        DebugMsg('TConnMsg.RefreshAuto - Exception: '+E.Message);
    end;
    sl2.Text := Normalizesl2;
    DebugMsg('TConnMsg.RefreshAuto 4 - Sl2.Text: '+Sl2.Text);
    
    for I := 0 to sl2.Count-1 do 
      if sl.IndexOf(sl2[I])=-1 then
        sl.Add(sl2[I]);

    DebugMsg('TConnMsg.RefreshAuto 5 - Sl.Text: '+Sl.Text);
    
    if sl.Count>0 then begin
      DebugMsg('TConnMsg.RefreshAuto 6 - Sl.Text: '+Sl.Text);
      FLastRefresh := GetTickCount;
      FAuto.Text := sl.Text;
      FAuto.SaveToFile(ArqAuto);
      DebugMsg('TConnMsg.RefreshAuto 7 - Sl.Text: '+Sl.Text);
      FLastConn := '';
      FLastConnOk := False;
    end;
  finally
    sl.free;
    sl2.Free;
  end;
end;}

procedure TConnMgr.RefreshAutoInfo;
begin
  TThreadAutoRemote.Create;
  TThreadAutoLocal.Create;
end;

procedure TConnMgr.SaveAuto;
begin
  DebugMsg('TConnMgr.SaveAuto - ' + FAuto.Text);
  FAuto.SaveToFile(ArqAuto);
end;

procedure TConnMgr.SaveConfig;
begin
  slConfig.Values['servidor'] := Servidor;
  ncaDM.SaveConfig;
end;

procedure TConnMgr.SetAutoRemote(const Value: String);
begin
  FCS.Enter;
  try
    DebugMsg('TConnMgr.SetAutoRemote - Value: '+Value);
  
    if Value <> FAutoRemote.Text then begin
      FAutoRemote.Text := Value;
      MergeLocalAndRemote;
    end;
  finally
    FCS.Leave;
  end;
end;

procedure TConnMgr.SetAuto(const Value: Boolean);
begin
  if Value then 
    FServidor := 'auto';
end;

procedure TConnMgr.SetLastConnOk(aServ: String);
begin
  FLastConn := aServ;
  FLastConnOk := (aServ>'');
end;

procedure TConnMgr.SetAutoLocal(const Value: String);
begin
  FCS.Enter;
  try
    DebugMsg('TConnMgr.SetAutoLocal - Value: '+Value);
    if Value <> FAutoLocal.Text then begin
      FAutoLocal.Text := Value;
      MergeLocalAndRemote;
    end;
  finally
    FCS.Leave;
  end;
end;

procedure TConnMgr.SetServidor(const Value: String);
begin
  if Value='' then
    FServidor := 'auto' else
    FServidor := Value;
end;

procedure TConnMgr.wmUpdate(window: HWND; msg: cardinal; wParam, lParam: madTypes.NativeInt;
  var result: madTypes.NativeInt);
begin
  try 
    DebugMsg('TConnMgr.wmUpdate');
    if FAuto.Text <> TStrings(wParam).Text then begin 
      FAuto.Text := TStrings(wParam).Text;
      SaveAuto;
      if Assigned(FOnUpdate) then FOnUpdate(Self);
    end;
  finally
    try TObject(wParam).Free; except end;
  end;
end;

{ TThreadAutoLocal }

constructor TThreadAutoLocal.Create;
begin
  inherited Create(True);
  FreeOnTerminate := True;
  Resume;
end;

procedure TThreadAutoLocal.Execute;
var 
  s : string;
begin
  S := GetLocalServerNames;
  if S>'' then
    try 
      gConnMgr.AutoLocal := S; 
    except 
      on E: Exception do
        DebugMsg('TThreadAutoLocal.Execute - Exception: ' + E.Message);
    end;
end;

initialization
  csRem := TCriticalSection.Create;
  csLoc := TCriticalSection.Create;
  gConnMgr := TConnMgr.Create;
  gConnMgr.RefreshAutoInfo;

finalization
  if Assigned(gConnMgr) then FreeAndNil(gConnMgr);
  csRem.Free;
  csLoc.Free;

end.
