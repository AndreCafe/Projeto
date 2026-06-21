unit NR_MW_DM;

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
  kbmMWNexusDB, kbmMWTCPIPIndyMessagingServerTransport, IdMessage, IdIMAP4,
  IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL, rtcConn, rtcDataSrv, rtcHttpSrv,
  rtcInfo, uObjPool, uRSdmEmail, IdHTTP, rtcFunction, rtcSrvModule;

type
  TDM = class(TDataModule)
    mwNXDBCP: TkbmMWNexusDBConnectionPool;
    mwPS: TkbmMWPooledSession;
    mwNXMD: TkbmMWNexusDBMetaData;
    mwServ: TkbmMWServer;
    TCPIP: TkbmMWTCPIPIndyServerTransport;
    TCPHTTP: TkbmMWTCPIPIndyServerTransport;
    TCP2: TkbmMWTCPIPIndyServerTransport;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Venceu7Dias(D: TDataset): Boolean;

  procedure SaveArqText(aArq, aText: String);

  function GeraCodAtivacao: String;
  


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
  MaxCount100 : Integer = 5;
  MaxCount200 : Integer = 20;
  MaxCount300 : Integer = 50;

  nRequests : Array[0..1] of Integer;  
  
  
implementation

uses 
  uRSqsRegistro100, 
  uRSQSAdmin100, 
  kbmMWZipStdTransStream,
  uRSQSRegistro200,
  nrAutorizacao, 
  uRSQSRegistro300, 
  uLicEXECryptor;

{$R *.dfm}

function GeraCodAtivacao: String;
var 
  I : Integer;
  S : String;
begin
  S := IntToStr(Random(9999999));
  Result := '';
  for I := 1 to Length(S) do
    Result := S[I] + Result;
  while Length(Result)<7 do
    Result := Result + IntToStr(Random(9)); 
end;


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

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  {TkbmMWServiceDefinition(mwServ.RegisterService(TqsRegistro100, False)).MaxCount := MaxCount100;
  TkbmMWServiceDefinition(mwServ.RegisterService(TqsRegistro200, False)).MaxCount := MaxCount200;
  TkbmMWServiceDefinition(mwServ.RegisterService(TqsRegistro300, False)).MaxCount := MaxCount300;}

  mwServ.RegisterService(TqsRegistro100, False);
  mwServ.RegisterService(TqsRegistro200, False);
  mwServ.RegisterService(TqsRegistro300, False);
  
  mwServ.Active := True;
  
  TCPIP.Listen;
  TCP2.Listen;
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

procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
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
    MaxCount100 := StrToIntDef(slCFG.Values['MaxCount100'], -1);
    MaxCount200 := StrToIntDef(slCFG.Values['MaxCount200'], -1);
    MaxCount300 := StrToIntDef(slCFG.Values['MaxCount300'], -1);
    
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
