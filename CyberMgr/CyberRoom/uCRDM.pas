unit uCRDM;

interface

uses
  SysUtils, Classes, nxllTransport, nxptBasePooledTransport, Windows, Variants, Messages,
  nxtwWinsockTransport, nxsdServerEngine, nxreRemoteServerEngine, nxdb,
  nxllComponent, kbmMWCustomConnectionPool, kbmMWCustomSQLMetaData,
  kbmMWHTTPStdTransStream, SyncObjs, kbmmwGlobal, kbmmwSecurity, idTCPServer,
  kbmMWNexusDB, kbmMWCustomTransport, kbmMWServer, kbmMWTCPIPIndyTransport,
  DB, kbmMemTable, ExtCtrls, mySQLDbTables;

type
  TDM = class(TDataModule)
    mwNXDBCP: TkbmMWNexusDBConnectionPool;
    mwPS: TkbmMWPooledSession;
    mwNXMD: TkbmMWNexusDBMetaData;
    nxSession: TnxSession;
    nxDB: TnxDatabase;
    nxRSE: TnxRemoteServerEngine;
    nxTCPIP: TnxWinsockTransport;
    mwServ: TkbmMWServer;
    mwTCPIP: TkbmMWTCPIPIndyServerTransport;
    qSeq: TnxQuery;
    mtConn: TkbmMemTable;
    mtConnLoja: TIntegerField;
    mtConnThreadID: TIntegerField;
    tCli: TnxTable;
    mtLoja: TkbmMemTable;
    mtLojaCodigo: TIntegerField;
    mtLojaQuant: TIntegerField;
    tCliCodigo: TIntegerField;
    tCliTipo: TWordField;
    tCliLoja: TStringField;
    tCliLicMaq: TWordField;
    tCliLicTipo: TWordField;
    tCliLicVenc: TDateField;
    tCliSenha: TStringField;
    mtConnURefresh: TLargeintField;
    TimerRefresh: TTimer;
    mySQLDB: TmySQLDatabase;
    qMySql: TmySQLQuery;
    tSessao: TnxTable;
    mtConnMacAddress: TStringField;
    mtConnLocalIP: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure mwServAuthenticate(Sender: TObject;
      ClientIdent: TkbmMWClientIdentity;
      var Perm: TkbmMWAccessPermissions);
    procedure mwTCPIPDisconnect(AThread: TIdPeerThread);
    procedure TimerRefreshTimer(Sender: TObject);
  private
    { Private declarations }
    procedure Desconectou(AThreadID: Cardinal);
    procedure Desconectar(AThreadID: Cardinal);
  public
    procedure FechaSessao(AThreadID: Cardinal; Q: TmySQLQuery; T: TnxTable; AMotivo: String);
    function NovaSessao(AThreadID: Cardinal; AUsername: String; Q: TmySQLQUery; T: TnxTable; AMacAddress, ALocalIP: String): Integer;
    procedure Refresh(AThreadID: Cardinal);
    { Public declarations }
  end;

  TThreadEnter = class ( TThread )
  protected
    procedure Execute; override;
  end;

  function GetSessionID(ASeq: Integer): String;
  function GetUniqueID(ASeq: Integer): String;
  function GetNextAutoInc(ATableName, AFieldName, AWhere: String): Integer;
  
  procedure InitTran(aDB: TnxDatabase;
                     const aTables : array of TnxTable;
                     aWith : Boolean);

var
  DM: TDM;
  SLSeq : TStrings;
  CSSeq : TCriticalSection;

const
  tcUserRequest = 'User-Request';
  tcLostService = 'Lost-Service';
  tcIdleTimeout = 'Idle-Timeout';
  
implementation

uses uCRQS100, md5, WindowList;

{$R *.dfm}

procedure TThreadEnter.Execute;
var
  WL : TWinList;
  I : Integer;
begin
  WL := TWinList.Create(nil);
  try
    while not Terminated do begin
      WL.Refresh(False);
      for I := 0 to pred(WL.Count) do with WL.Windows[I]^ do
      if Pos('THANK YOU FOR TRYING MYSQLDAC', UpperCase(WinCaption)) > 0 then
        PostMessage(WinHandle, WM_CLOSE, 0, 0);
      Sleep(1000);
    end;  
  finally
    Free;
    WL.Free;
  end;
end;

function GetSessionID(ASeq: Integer): String;
begin
  Result := 'scybermgr_'+IntToStr(ASeq);
end;

function GetUniqueID(ASeq: Integer): String;
begin
  Result := IntToStr(ASeq);
  Result := Copy(GetMD5Str(GetSessionID(ASeq)), 1, 16-Length(Result)) + Result;
end;

procedure InitTran(aDB: TnxDatabase;
                   const aTables : array of TnxTable;
                   aWith : Boolean);
var I : Integer;
begin
  if aDB.InTransaction then Exit;
  I := 10;
  while I > 0 do begin
    try
      if aWith then
        aDB.StartTransactionWith(aTables)
      else
        aDB.StartTransaction;
      I := 0;
    except
      Dec(I);
      Random(500);
    end
  end;
end;


function GetNextAutoInc(ATableName, AFieldName,
  AWhere: String): Integer;
var
  I : Integer;
begin
  CSSeq.Enter;
  with DM do
  try
    I := SLSeq.IndexOf(ATableName+AFieldName+AWhere);
    if I>=0 then begin
      Result := Integer(SLSeq.Objects[I])+1;
      SLSeq.Objects[I] := TObject(Result);
    end else begin
      qSeq.SQL.Clear;
      qSeq.SQL.Add('SELECT MAX(' + AFieldName + ') AS IDMAX FROM ' + ATableName);
      if AWhere>'' then qSeq.SQL.Add(AWhere);
      qSeq.Open;
      if qSeq.RecordCount>0 then
        Result := qSeq.FieldByName('IDMAX').AsInteger + 1
      else
        Result := 1;
      qSeq.Close;
      SLSeq.AddObject(ATableName + AFieldName + AWhere, TObject(Result));
    end;
  finally
    CSSeq.Leave;
  end;  
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  mtConn.Open;
  mtLoja.Open;
  mwServ.RegisterService(TQS100, False);
  mwServ.Active := True;
  mwTCPIP.Listen;
end;

procedure TDM.Desconectar(AThreadID: Cardinal);
var I : Integer;
begin
  with mwTCPIP.IdTCPServer.Threads, LockList do
  try
    for I := 0 to pred(Count) do with TIdPeerThread(Items[I]) do
    if ThreadID = aThreadID then begin
      Connection.Disconnect;
      Exit;
    end;  
  finally
    UnlockList;
  end;        
end;

procedure TDM.Desconectou(AThreadID: Cardinal);
var I : Integer;
begin
  CSSeq.Enter;
  try
    if not mtConn.FindKey([AThreadID]) then Exit;
    if mtLoja.FindKey([mtConnLoja.Value]) and (mtLojaQuant.Value>0) then begin
      mtLoja.Edit;
      mtLojaQuant.Value := mtLojaQuant.Value - 1;
      mtLoja.Post;
    end;
    mtConn.Delete;
    FechaSessao(AThreadID, qMySql, tSessao, tcLostService);
  finally
    CSSeq.Leave;
  end;
end;

procedure TDM.mwServAuthenticate(Sender: TObject;
  ClientIdent: TkbmMWClientIdentity; var Perm: TkbmMWAccessPermissions);
var 
  ThID : Cardinal;
begin
  ThID := GetCurrentThreadID;

  with ClientIdent do
  if Token = IntToStr(ThID) then 
    Perm := [mwapRead,mwapWrite,mwapDelete,mwapExecute]
  else begin
    CSSeq.Enter;
    try
      try
        tCli.Active := True;
        tCli.IndexName := 'ICodigo';
        if not tCli.FindKey([Username]) then begin
          tCli.Refresh;
          if not tCli.FindKey([Username]) then
            Raise Exception.Create('O código de loja '+Username+' não está cadastrado no servidor de registro');
        end;
        if UpperCase(Password) <> UpperCase(tCli.FieldByName('Senha').AsString) then
            Raise Exception.Create('A senha da loja está errada');

        if not mtLoja.FindKey([tCliCodigo.Value]) then begin
          mtLoja.Insert;
          mtLojaCodigo.Value := tCliCodigo.Value;
          mtLojaQuant.Value := 0;
          mtLoja.Post;
        end;
        
        if mtLojaQuant.Value > tCliLicMaq.Value then
          Raise Exception.Create('Limite de máquinas ('+tCliLicMaq.AsString+') foi excedido')
        else begin
          mtLoja.Edit;
          mtLojaQuant.Value := mtLojaQuant.Value + 1;
          mtLoja.Post;
        end;
            
        if mtConn.FindKey([ThID]) then 
          mtConn.Edit
        else begin
          mtConn.Insert;
          mtConnThreadID.Value := ThID;
        end;  
        mtConnLoja.Value := tCliCodigo.Value;
        mtConnURefresh.Value := GetTickCount;
        mtConn.Post;
        Token := IntToStr(ThID);
        Perm := [mwapRead,mwapWrite,mwapDelete,mwapExecute]
      except
        Raise;
      end;
    finally
      CSSeq.Leave;
    end;
  end;  
end;

procedure TDM.Refresh(AThreadID: Cardinal);
begin
  CSSeq.Enter;
  try
    if mtConn.FindKey([AThreadID]) then begin
      mtConn.Edit;
      mtConnURefresh.Value := GetTickCount;
      mtConn.Post;
    end;
  finally
    CSSeq.Leave;                                
  end;
end;

procedure TDM.mwTCPIPDisconnect(AThread: TIdPeerThread);
begin
  Desconectou(AThread.ThreadID);
end;

procedure TDM.TimerRefreshTimer(Sender: TObject);
var C: Cardinal;
begin
  C := GetTickCount-60000;
  CSSeq.Enter;
  try
    mtConn.First;
    while not mtConn.Eof do begin
      if mtConnURefresh.Value <= C then
        Desconectar(mtConnThreadID.Value);
      mtConn.Next;
    end;  
  finally
    CSSeq.Leave;
  end;
end;

procedure TDM.FechaSessao(AThreadID: Cardinal; Q: TmySQLQuery;
  T: TnxTable; AMotivo: String);
var C : Cardinal;  
begin
  T.Active := True;
  T.IndexName := 'IThreadIDStop';
  T.Refresh;
  if not T.FindKey([AThreadID, Null]) then Exit;
  InitTran(T.Database, [T], True);
  try
    C := GetTickCount - T.FieldByName('TicksInicio').AsInteger;
    T.Edit;
    T.FieldByName('Stop').AsDateTime := Now;
    T.FieldByName('DuracaoS').AsInteger := C div 1000;
    T.Post;
    Q.Active := False;
    Q.SQL.Clear;
    Q.Params.Clear;
    Q.SQL.Text := 'UPDATE radacct ' +
                  'SET AcctStopTime = ' + 
                  QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', T.FieldByName('Stop').AsDateTime)) + ' , ' +
                  'AcctSessionTime = ' + T.FieldByName('DuracaoS').AsString + ' , ' +
                  'AcctTerminateCause = ' + QuotedStr(AMotivo) + ' ' +
                  'WHERE AcctSessionID = ' + QuotedStr(GetSessionID(T.FieldByName('ID').AsInteger));
    Q.Prepare;                  
    Q.ExecSQL;                  
    T.Database.Commit;
  except
    T.Database.Rollback;
    Raise;
  end;
end;

function TDM.NovaSessao(AThreadID: Cardinal; AUsername: String;
  Q: TmySQLQUery; T: TnxTable; AMacAddress, ALocalIP: String): Integer;
var
  MaxTime: Integer;
begin
  Result := 0;
  T.Active := True;
  T.IndexName := 'IUsernameStop';
  if T.FindKey([AUsername, Null]) then
    Raise Exception.Create('Já existe uma sessão em andamento com este código de usuário');
    
  T.IndexName := 'IThreadIDStop';
  if T.FindKey([AThreadID, Null]) then 
    Raise Exception.Create('Já existe uma sessão em andamento nesta máquina');

  Q.Active := False;
  Q.SQL.Clear;
  Q.SQL.Text := 'select Value from radcheck where (UserName = ' + QuotedStr(AUsername) +') AND '+
                '(Attribute = ' + QuotedStr('Max-All-Session') + ')';

  Q.Active := True;
                
  if Q.RecordCount=0 then
    Raise Exception.Create('Nome de usuário inválido');

  MaxTime := StrToIntDef(Q.FieldByName('Value').AsString, 0);
  if MaxTime = 0 then
    Raise Exception.Create('O crédito para este username acabou');

  Q.Active := False;
  Q.SQL.Text := 'select sum(AcctSessionTime) as TempoUsado from radacct where Username = ' +
                QuotedStr(AUsername);
  Q.Open;                
  if (Q.RecordCount > 0) then 
    Result := MaxTime - Q.FieldByName('TempoUsado').AsInteger
  else 
    Result := 0;  

  if Result < 5 then
    Raise Exception.Create('O crédito para este username acabou');  

  InitTran(T.Database, [T], True);
  try
    T.Insert;
    T.FieldByName('ThreadID').AsInteger := AThreadID;
    T.FieldByName('Username').AsString := AUsername;
    T.FieldByName('Start').AsDateTime := Now;
    T.FieldByName('TicksInicio').AsInteger := GetTickCount;
    T.Post;

    Q.Active := False;
    Q.SQL.Clear;
    Q.Params.Clear;
    Q.SQL.Text := 'INSERT INTO  radacct '+
                  '(acctsessionid, acctuniqueid, username, NASIPAddress, NASPortType, NASPortID, AcctStartTime,'+
                  ' calledstationid, callingstationid, framedipaddress,'+
                  ' acctstartdelay, acctstopdelay, AcctAuthentic,' +
                  ' ConnectInfo_start,' +
                  ' ConnectInfo_stop,' +  
                  ' AcctInputOctets,' + 
                  ' AcctOutputOctets,' +
                  ' ServiceType,' +
                  ' FramedProtocol) ' +
                  'VALUES (' +
                  QuotedStr(GetSessionID(T.FieldByName('ID').AsInteger)) + ', ' +
                  QuotedStr(GetUniqueID(T.FieldByName('ID').AsInteger)) + ', ' +
                  QuotedStr(AUserName) + ', ' +
                  QuotedStr(ALocalIP) + ', ' +
                  QuotedStr('Ethernet') + ', 0, ' +
                  QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', T.FieldByName('Start').AsDateTime))+', '+
                  QuotedStr('00:00:00:00:00:00') + ', ' +
                  QuotedStr('00:00:00:00:00:00')+', '+
                  QuotedStr(ALocalIP)+', 0, 0, ' +
                  QuotedStr('') + ', ' +
                  QuotedStr('') + ', ' +    
                  QuotedStr('') + ', ' +
                  '1, 1, ' +  
                  QuotedStr('') + ', ' +
                  QuotedStr('') + ') ';
    Q.ExecSQL;                  
    T.Database.Commit;
  except
    T.Database.Rollback;
    Raise;
  end
end;

initialization
  CSSeq := TCriticalSection.Create;
  SLSeq := TStringList.Create;

finalization
  CSSeq.Free;
  SLSeq.Free;  

end.
