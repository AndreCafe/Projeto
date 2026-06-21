unit NR_Email_DM;

interface

uses
  SysUtils, Classes, nxllTransport, nxptBasePooledTransport, Messages, Windows,
  nxtwWinsockTransport, nxsdServerEngine, nxreRemoteServerEngine, Dialogs,
  kbmMemTable, IdPOP3, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdMessageClient, IdSMTP, DB, ExtCtrls, nxdb, idThread,
  idTcpServer,
  kbmMWSecurity,
  SyncObjs,
  nxDbBase,
  kbmMWHTTPStdTransStream,
  nxllComponent, kbmMWCustomConnectionPool, 
  IdMessage, IdIMAP4,
  IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL, 
  uObjPool, uRSdmEmail, IdHTTP;

type
  TDM = class(TDataModule)
    nxSession: TnxSession;
    nxDB: TnxDatabase;
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
    tEnvioDestino: TMemoField;
    pop: TIdPOP3;
    tCliCodigo: TAutoIncField;
    Msg: TIdMessage;
    tCorpoCType: TStringField;
    tCorpoAnexos: TnxMemoField;
    tCorpoCorpo: TnxMemoField;
    tCorpoDestino: TnxMemoField;
    tCorpoID: TAutoIncField;
    SMTP: TIdSMTP;
    IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
    tAut: TnxTable;
    tAutID: TAutoIncField;
    tAutPrograma: TWordField;
    tAutLoja: TIntegerField;
    tAutAutorizacao: TStringField;
    tAutVencimento: TDateField;
    tAutCodigoEquip: TStringField;
    tAutMaquinas: TWordField;
    tAutTipo: TWordField;
    tAutCriadaEm: TDateTimeField;
    tAutCriadaPor: TStringField;
    tAutInativadaEm: TDateTimeField;
    tAutInativadaPor: TStringField;
    tAutAtiva: TBooleanField;
    tAutObs: TnxMemoField;
    tAutGerar: TBooleanField;
    tAutEnviouCli: TBooleanField;
    tCorpoConta: TIntegerField;
    tCliEmailConta: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure tEmailTimer(Sender: TObject);
  private
    { Private declarations }
    function EnviaEmail(aDestino, aAssunto, aCorpo, aAnexos, aCType: String): String;
    procedure EnviarEmails;
  public
    { Public declarations }
    function AbreTabelas: Boolean;
  end;

  function Venceu7Dias(D: TDataset): Boolean;

  function LoadHTMLArq(aArq: String): String;
  procedure SaveArqText(aArq, aText: String);

  

//  function GetNextAutoInc(ATableName, AFieldName, AWhere: String): Integer;

var
  DM: TDM;
  DBServer: String;
  slCfg : TStrings;
  SLSeq : TStrings;
  CSSeq : TCriticalSection;
  FimApp : Boolean = False;
  ScriptStr : String;
  BaseFileName : String;
  gBRT : Word = 30;
  gExCookie : String = 'N';
  gHPOpenBef : String = 'N';

  nRequests : Array[0..1] of Integer;  
  
  
implementation

uses 
  nrAutorizacao, uLicEXECryptor, nr_consts,
  nr_db_conn, nrDebug;

{$R *.dfm}

function EncodeText(const Str: WideString; CodePage: Word): AnsiString;
var
    len: Integer;
begin
    Result := '';
    if Str <> '' then
    begin
        len := WideCharToMultiByte(CodePage, 0, PWideChar(Str), Length(Str), nil, 0, nil, nil);
        if (len > 1) then
        begin
            SetLength(Result, len-1);
            WideCharToMultiByte(CodePage, 0, PWideChar(Str), Length(Str), PAnsiChar(Result), len, nil, nil);
        end;
    end;
end;

function VenceuSemana(D: TDateTime): Boolean;
begin
  Result := (Now>D) and ((Now-D)>6);
end;

function Venceu7Dias(D: TDataset): Boolean;
begin
  Result := (D.FieldByName('Tipo').AsInteger<>taDefinitiva) and 
             VenceuSemana(D.FieldByName('Vencimento').AsDateTime);
end;

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
  Start_DBConn(nxSession);
  nxDB.AliasPath := '';
  nxDB.AliasName := 'Registro';
  nxDB.Open;
end;

function LoadHTMLArq(aArq: String): String;
var SL : TStringList;
begin
  SL := TStringList.Create;
  try
    SL.LoadFromFile(BaseFileName+aArq);
    Result := SL.Text;
  finally
    SL.Free;
  end;
end;

procedure SaveArqText(aArq, aText: String);
var SL : TStringList;
begin
  SL := TStringList.Create;
  try
    SL.Text := aText;
    SL.SaveToFile(BaseFileName+aArq);
  finally
    SL.Free;
  end;
end;


function EmailValido(sEmail: String): Boolean;
begin
  Result := False;
  if (Pos('@', sEmail)=0) then Exit;
  Delete(sEmail, 1, Pos('@', sEmail));
  if (Pos('.', sEmail)=0) then Exit;
  Delete(sEmail, 1, Pos('.', sEmail));
  Result := (Length(sEmail)>0);
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
begin
  tEmail.Enabled := False;
  try
    EnviarEmails;
  except
    tEmail.Enabled := True;
  end;
end;

procedure TDM.EnviarEmails;
var 
  SL : TStrings;
  I, P  : Integer;
  Enviar : Boolean;

procedure _Add(sEmail: String);
begin
  if (sEmail>'') and (SL.IndexOf(sEmail)<0) then
    SL.Add(sEmail);
end;
  
procedure AddEmail(sEmail: String);
begin
  while Trim(sEmail)>'' do begin
    P := Pos(',', sEmail);
    if P=0 then P := Pos(';', sEmail);
    if P>0 then begin
      _Add(Trim(Copy(sEmail, 1, P-1)));
      Delete(sEmail, 1, P);
    end else begin
      _Add(Trim(sEmail));
      sEmail := '';
    end;
  end;
end;
  
procedure ObtemDestinatarios;
begin
  SL.Clear;
  if tCorpoDestino.Value=Email_TodosCli then begin
    SL.Add('todos@nextar.com.br');
    tCli.Open;
    try
      tCli.First;
      while not tCli.Eof do begin
        ProcessMessages;
        AddEmail(tCliEmailConta.Value);
        AddEmail(tCliEmailReg.Value);
        AddEmail(tCliEmailTec.Value);
        Sleep(0);
      end;
    finally
      tCli.Close;
    end;    
  end else
  if tCorpoDestino.Value=Email_Definitivos then begin
    SL.Add('todos@nextar.com.br');
    tCli.Open;
    try
      tCli.First;
      while not tCli.Eof do begin
        ProcessMessages;
        if tAut.FindKey([tCliCodigo.Value, True]) and (tAutTipo.Value=2) then begin
          AddEmail(tCliEmailConta.Value);
          AddEmail(tCliEmailReg.Value);
          AddEmail(tCliEmailTec.Value);
        end;
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
    tAut.Active := True;
   
    while (not tCorpo.Eof) do begin
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
          Sleep(5);
        end;  
        tCorpo.Edit;
        tCorpoProcessou.Value := True;
        tCorpo.Post;
        Sleep(5);
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
      tEnvio.Edit;
      tEnvioTentativas.Value := tEnvioTentativas.Value + 1;
      tEnvio.Post;
      try
        
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
          tEnvio.Edit;
          tEnvioEnvio.Value := Now;
          tEnvioOK.Value := True;
          tEnvioEnviar.Value := False;
          tEnvio.Post;
        end else begin
          tEnvio.Edit;
          tEnvioOk.Value := False;
          tEnvioEnviar.Value := False;
          tEnvioMsgErro.Value := 'Corpo da mensagem não encontrado';
          tEnvio.Post;
        end; 
      except  
        On E: EnxDatabaseError do Exit;
        On E: Exception do begin
          tEnvioMsgErro.Value := E.Message;
          Enviar := (tEnvioTentativas.Value < MaxTriesEmail);
          if not (tEnvio.State in [dsEdit, dsInsert]) then tEnvio.Edit;
          tEnvioEnviar.Value := Enviar;
          tEnvio.Post;
          if Enviar then 
            tEnvio.Next;
        end;  
      end;  
      Sleep(5);
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

function IniFName: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'RegistroServ.ini';
end;  

initialization
  BaseFileName := ExtractFilePath(ParamStr(0));
  
  ScriptStr := 
    '<html>'+sLinebreak+
    '<script>'+sLineBreak+
    'window.location = ' //+ QuotedStr('http://open2.nextar.com.br') + sLineBreak +
    +QuotedStr('http://br.rd.yahoo.com/kityahoolan/nexcafe/*http:/br.yahoo.com/')+';'+sLinebreak+
    '</script>'+sLineBreak+
    '</html>';

  Randomize;
  nRequests[0] := 0;
  nRequests[1] := 0;
  
  slCFG := TStringList.Create;
  try
    if FileExists(IniFName) then 
      slCFG.LoadFromFile(IniFName);

    if SameText(slCFG.Values['ExCookie'], 'S') or SameText(slCFG.Values['ExCookie'], 'N') then
      gExCookie := UpperCase(slCFG.Values['ExCookie']);
      
    gBRT := StrToIntDef(slCFG.Values['BRT'], 60);
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
