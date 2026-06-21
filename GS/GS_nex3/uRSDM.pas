unit uRSDM;

interface

uses
  SysUtils, Classes, nxllTransport, nxptBasePooledTransport, Messages, Windows,
  nxtwWinsockTransport, nxsdServerEngine, nxreRemoteServerEngine, Dialogs,
  kbmMWCustomMessagingTransport, kbmMWTCPIPIndyMessagingTransport,
  kbmMemTable, IdPOP3, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdMessageClient, IdSMTP, DB, ExtCtrls, nxdb, idThread,
  kbmMWCustomTransport, kbmMWServer, kbmMWTCPIPIndyServerTransport, kbmMWTCPIPIndyTransport, 
  idTcpServer,
  kbmMWSecurity,
  SyncObjs,
  nxDbBase,
  kbmMWHTTPStdTransStream,
  nxllComponent, kbmMWCustomConnectionPool, kbmMWCustomSQLMetaData,
  kbmMWNexusDB, kbmMWTCPIPIndyMessagingServerTransport, IdMessage, IdIMAP4;

type
  TDM = class(TDataModule)
    mwNXDBCP: TkbmMWNexusDBConnectionPool;
    mwPS: TkbmMWPooledSession;
    mwNXMD: TkbmMWNexusDBMetaData;
    nxSession: TnxSession;
    nxDB: TnxDatabase;
    mwServ: TkbmMWServer;
    TCPIP: TkbmMWTCPIPIndyServerTransport;
    TCPHTTP: TkbmMWTCPIPIndyServerTransport;
    qSeq: TnxQuery;
    tCorpo: TnxTable;
    tEnvio: TnxTable;
    tCorpoAssunto: TStringField;
    tCorpoInclusao: TDateTimeField;
    tCorpoTipo: TWordField;
    tCorpoEnviarEm: TDateTimeField;
    tCorpoProcessou: TBooleanField;
    tEnvioID: TAutoIncField;
    tEnvioCorpo: TIntegerField;
    tEnvioInclusao: TDateTimeField;
    tEnvioEnvio: TDateTimeField;
    tEnvioTentativas: TWordField;
    tEnvioEnviar: TBooleanField;
    tEnvioMsgErro: TMemoField;
    tEnvioOK: TBooleanField;
    tEmail: TTimer;
    tCli: TnxTable;
    tCliTipo: TWordField;
    tCliEmailReg: TMemoField;
    tCliLicMaq: TWordField;
    tCliLicTipo: TWordField;
    tCliLicVenc: TDateField;
    tCliEmailTec: TMemoField;
    SMTP: TIdSMTP;
    tEnvioDestino: TMemoField;
    pop: TIdPOP3;
    TCPIPMsg: TkbmMWTCPIPIndyMessagingServerTransport;
    tConexao: TnxTable;
    tConexaoID: TAutoIncField;
    tConexaoAberta: TBooleanField;
    tConexaoTipo: TWordField;
    tConexaoHD: TStringField;
    tConexaoLogin: TDateTimeField;
    tConexaoLogout: TDateTimeField;
    tConexaoLoja: TIntegerField;
    tConexaoUsuario: TStringField;
    tConexaoNome: TStringField;
    tConexaoStatus: TStringField;
    tConexaoIP: TStringField;
    tConexaoThreadID: TIntegerField;
    msgQIn: TkbmMWMemoryMessageQueue;
    msgQOut: TkbmMWMemoryMessageQueue;
    Timer1: TTimer;
    TCP2: TkbmMWTCPIPIndyServerTransport;
    tCliCodigo: TAutoIncField;
    Msg: TIdMessage;
    tCorpoCType: TStringField;
    IdIMAP41: TIdIMAP4;
    tCorpoAnexos: TnxMemoField;
    tCorpoCorpo: TnxMemoField;
    tCorpoDestino: TnxMemoField;
    tCorpoID: TAutoIncField;
    procedure DataModuleCreate(Sender: TObject);
    procedure tEmailTimer(Sender: TObject);
    procedure TCPIPMsgDisconnected(Sender: TObject;
      Info: TkbmMWCustomTransportInfo);
  private
    { Private declarations }
    function EnviaEmail(aDestino, aAssunto, aCorpo, aAnexos, aCType: String): String;
  public
    { Public declarations }
    function AbreTabelas: Boolean;
  end;

  function Venceu7Dias(D: TDataset): Boolean;

//  function GetNextAutoInc(ATableName, AFieldName, AWhere: String): Integer;

  procedure InitTran(aDB: TnxDatabase;
                     const aTables : array of TnxTable;
                     aWith : Boolean);
  
const
  Email_TodosCli    = '__TODOSCLIENTES';
  Email_Cybermgr    = '__TODOSCYBERMGR';
  MaxTriesEmail     = 10;

var
  DM: TDM;
  DBServer: String;
  slCfg : TStrings;
  SLSeq : TStrings;
  CSSeq : TCriticalSection;
  FimApp : Boolean = False;

  nRequests : Array[0..1] of Integer;  
  
  
implementation

uses 
  uRSqsRegistro100, 
  uRSQSAdmin100, 
  ursCHAT100,
  kbmMWZipStdTransStream, 
  uRSServBD, 
  uRSQSRegistro200, 
  nrAutorizacao, uRSQSRegistro300;

{$R *.dfm}

function VenceuSemana(D: TDateTime): Boolean;
begin
  Result := (Now>D) and ((Now-D)>6);
end;

function Venceu7Dias(D: TDataset): Boolean;
begin
  Result := (D.FieldByName('Tipo').AsInteger<>taDefinitiva) and 
             VenceuSemana(D.FieldByName('Vencimento').AsDateTime);
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

{function GetNextAutoInc(ATableName, AFieldName,
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
      try
        if qSeq.RecordCount>0 then
          Result := qSeq.FieldByName('IDMAX').AsInteger + 1
        else
          Result := 1;
      finally    
        qSeq.Close;
      end;  
      SLSeq.AddObject(ATableName + AFieldName + AWhere, TObject(Result));
    end;
  finally
    CSSeq.Leave;
  end;  
end;}

function TDM.AbreTabelas: Boolean;
begin
  Result := False;
  try
    nxSession.Open;
    nxDB.Open;
    tEnvio.Open;
    tCorpo.Open;
    Result := True;
  except
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  nxDB.AliasPath := '';
  nxDB.AliasName := 'Registro';
  mwServ.RegisterService(TqsRegistro100, False);
  mwServ.RegisterService(TqsRegistro200, False);
  mwServ.RegisterService(TqsRegistro300, False);
  mwServ.RegisterService(TqsAdmin100, False);
  mwServ.RegisterService(TqsChat100, False);
  mwServ.Active := True;
  TCPIP.Listen;
  TCP2.Listen;
  TCPIPmsg.Listen;
  TCPIPmsg.AnnounceSubscriptions;
end;

function TDM.EnviaEmail(aDestino, aAssunto, aCorpo, aAnexos, aCType: String): String;
var 
  SL: TStrings;
  I: Integer;
begin
  Result := '';
  SL := TStringList.Create;
  try
    try
      Msg.Subject := aAssunto;
      Msg.Recipients.Clear;
      SL.Text := aDestino;
      Msg.Recipients.Clear;
      Msg.ContentType := aCType; 
      for I := 0 to SL.Count-1 do 
        Msg.Recipients.Add.Address := SL[I];
      SL.Text := aAnexos;
      Msg.Body.Text := aCorpo;
      Msg.Subject := aAssunto;
      Msg.MessageParts.Clear;
      for I := 0 to SL.Count - 1 do
        with TidAttachment.Create(Msg.MessageParts, SL.ValueFromIndex[I]) do
          FileName := SL.Names[I];
      Smtp.Send(Msg);
    except
      on E: Exception do 
        Result := E.Message
    end;
  finally
    SL.Free;
  end;
end;

procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

procedure TDM.tEmailTimer(Sender: TObject);
var 
  SL : TStrings;
  I  : Integer;
  Enviar : Boolean;
  S: String;
  
procedure ObtemDestinatarios;
begin
  SL.Clear;
  if tCorpoDestino.Value=Email_TodosCli then begin
    SL.Add('todos@nexcafe.com.br');
    tCli.Open;
    try
      tCli.First;
      while not tCli.Eof do begin
        ProcessMessages;
        S := Trim(tCliEmailReg.Value);
        if Trim(tCliEmailTec.Value) > '' then
          if S>'' then 
            S := S + '; ' + tCliEmailTec.Value
          else
            S := Trim(tCliEmailTec.Value);

        if S>'' then      
          SL.Add(S);
        tCli.Next;
      end;
    finally
      tCli.Close;
    end;    
  end else
    SL.Add(tCorpoDestino.Value);
end;

begin
  tEmail.Enabled := False;
  try
    SL := TStringList.Create;
    if not AbreTabelas then Exit;
    tCorpo.CancelRange;
    tCorpo.IndexName := 'IProcessou';
    tCorpo.SetRange([False, EncodeDate(1900, 1, 1)], [False, Now]);
   
    while not tCorpo.Eof do begin
      nxDB.StartTransactionWith([tCorpo, tEnvio]);
      try
        ObtemDestinatarios;
        for I := 0 to SL.Count-1 do begin
          tEnvio.Insert;
          tEnvioCorpo.Value := tCorpoID.Value;
          tEnvioDestino.Value := SL[I];
          tEnvioInclusao.Value := Now;
          tEnvioTentativas.Value := 0;
          tEnvioOK.Value := False;
          tEnvioEnviar.Value := True;
          tEnvio.Post;
        end;  
        tCorpo.Edit;
        tCorpoProcessou.Value := True;
        tCorpo.Post;
        nxDB.Commit;
      except
        nxDB.Rollback;
        Raise;
      end;  
    end;

    tCorpo.CancelRange;
    tCorpo.IndexName := 'IID';
    tEnvio.SetRange([True], [True]);
    tEnvio.Refresh;
    
{    if not tEnvio.Eof then
     try
      pop.Connect(0);
    except
    end;}
    
    while (not tEnvio.Eof) and (not FimApp) do begin  
      ProcessMessages;
      try
        tEnvio.Edit;
        tEnvioTentativas.Value := tEnvioTentativas.Value + 1;
        if tCorpo.FindKey([tEnvioCorpo.Value]) then begin
          Smtp.Connect;
          try
            EnviaEmail(tEnvioDestino.Value, 
                       tCorpoAssunto.Value, 
                       tCorpoCorpo.Value, 
                       tCorpoAnexos.Value,
                       tCorpoCType.Value);
          finally
            smtp.Disconnect;
            Sleep(500);
          end;
          tEnvioEnvio.Value := Now;
          tEnvioOK.Value := True;
          tEnvioEnviar.Value := False;
        end else begin
          tEnvioOk.Value := False;
          tEnvioEnviar.Value := False;
          tEnvioMsgErro.Value := 'Corpo da mensagem não encontrado';
        end;  
        tEnvio.Post;
      except  
        On E: EnxDatabaseError do Exit;
        On E: Exception do begin
          tEnvioMsgErro.Value := E.Message;
          Enviar := (tEnvioTentativas.Value < MaxTriesEmail);
          tEnvioEnviar.Value := Enviar;
          tEnvio.Post;
          if Enviar then 
            tEnvio.Next;
        end;  
      end;  
      Sleep(0);
    end;
  {  try
      if pop.Connected then
        pop.Disconnect;
    except
    end;  }
  finally
    if SMTP.Connected then
      SMTP.Disconnect;
    SL.Free;
    tEmail.Enabled := True;
    tCorpo.Close;
    tEnvio.Close;
    nxDB.Close;
    nxSession.Close;
  end;
end;

procedure TDM.TCPIPMsgDisconnected(Sender: TObject;
  Info: TkbmMWCustomTransportInfo);
var 
  C : TkbmMWClientIdentity;
  ThID : Cardinal;
begin
  CSSeq.Enter;
  try
    tConexao.Active := True;
    tConexao.IndexName := 'IAbertaThreadID';
    tConexao.Refresh;
    ThID := GetCurrentThreadID;
    
    InitTran(nxDB, [tConexao], True);
    try
      if not tConexao.FindKey([True, ThID]) then begin
        nxDB.Rollback;
        Exit;
      end;  
      tConexao.Edit;
      tConexaoLogout.Value := Now;
      tConexaoAberta.Value := False;
      tConexao.Post;
      
      C := TkbmMWClientIdentity.Create;
      try
        TCPIPMsg.SendMessage('MSG.CHAT.TODOS.LOGOUT', '', C, nil, [tConexaoHD.Value]);
      finally
        C.Free;
      end;    
      
      nxDB.Commit;
    except
      nxDB.Rollback;
      if tConexao.State in [dsEdit, dsInsert] then tConexao.Cancel;
      Raise;
    end;  
  finally
    CSSeq.Leave;
  end;
end;

function IniFName: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'RegistroServ.ini';
end;  


initialization
  Randomize;
  nRequests[0] := 0;
  nRequests[1] := 0;
  
  slCFG := TStringList.Create;
  try
    if FileExists(IniFName) then 
      slCFG.LoadFromFile(IniFName);
    
    if slCFG.Values['DBServer'] = '' then begin
      slCFG.Values['DBServer'] := '127.0.0.1';
      slCFG.SaveToFile(IniFName);
    end;  
    DBServer := slCFG.Values['DBServer'];
  finally
    slCFG.Free;
  end;    
  CSSeq := TCriticalSection.Create;
  SLSeq := TStringList.Create;

finalization
  CSSeq.Free;
  SLSeq.Free;  


end.
