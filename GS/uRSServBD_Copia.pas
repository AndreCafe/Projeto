unit uRSServBD_Copia;

interface

uses
  Windows, FileCtrl, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Variants,
  EXECryptorKeyGen,
  nxseAllEngines,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport,
  nxsdServerEngine, nxsrSecurityMonitor, nxsrSqlEngineBase, nxsqlEngine,
  nxchCommandHandler, nxllComponent, nxsrServerEngine, nxdb,
  Db, nxsdSimpleMonitor,
  nxllMemoryManager,
  nxsqlProxies,
  nxllTypes,
  nxsdTypes, nxlgEventLog, nxtmSharedMemoryTransport;
  

type
  TAndamentoConversao = procedure (Arquivo: String; Total, Atual : Integer) of Object;

  TdmServidorBD = class(TDataModule)
    EventLog: TnxEventLog;
    ServerEngine: TnxServerEngine;
    CommandHandler: TnxServerCommandHandler;
    nxSQLEng: TnxSqlEngine;
    nxTCPIP: TnxWinsockTransport;
    nxSimpleMon: TnxSimpleMonitor;
    nxSe: TnxSession;
    nxDB: TnxDatabase;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

  function CreateSession: TnxSession;
  procedure TableCancel(T: TnxTable);

  procedure TransfDados(F, D: TDataset);

  function InitTran(aDB: TnxDatabase;
                     const aTables : array of TnxTable;
                     aWith : Boolean): Boolean;
  


var
  dmServidorBD: TdmServidorBD;

implementation

uses nr_consts, JTimer, uLicEXECryptor, nrTablesDef , nxFieldsUtils;

{$R *.DFM}


function DataBaseLic: TDateTime;
begin
  Result := EncodeDate(2003, 1, 1);
end;

procedure TableCancel(T: TnxTable);
begin
  if T.State in [dsEdit, dsInsert] then
    T.Cancel;
end;


function InitTran(aDB: TnxDatabase;
                  const aTables : array of TnxTable;
                  aWith : Boolean): Boolean;
var I : Integer;
begin
  Result := False;
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
  Result := True;
end;

procedure TransfDados(F, D: TDataset);
var 
  I : Integer;
  AF : TField;
begin
  D.Append;
  for I := 0 to pred(F.FieldCount) do 
  with F.Fields[I] do
  if (FieldKind = fkData) then begin
    AF := D.FindField(FieldName);
    if AF <> nil then 
      AF.Value := Value;
  end;  
  D.Post;
end;

procedure TdmServidorBD.DataModuleCreate(Sender: TObject);
var 
  S : String;
  SR : TSearchRec;

begin
  dmServidorBD := Self;
  
  S := ExtractFilePath(ParamStr(0)) + 'Dados';
  if not DirectoryExists(S) then MkDir(S);
  S := ExtractFilePath(ParamStr(0)) + 'Dados';
  if not DirectoryExists(S) then MkDir(S);
  
  ServerEngine.AliasHandler.Delete('nexreg_copia');
  ServerEngine.AliasHandler.Add('nexreg_copia', S, True);
  S := ExtractFilePath(ParamStr(0)) + 'Temp';
  if not DirectoryExists(S) then 
    MkDir(S)
  else 
  if FindFirst(S+'\*.*', faAnyFile, SR)=0 then begin
    repeat
      if (SR.Attr and faDirectory) <> faDirectory then
        DeleteFile(S+'\'+ExtractFileName(SR.Name));
    until (FindNext(SR)<>0);
    FindClose(SR);
  end;  
  ServerEngine.TempStorePath := S;
  ServerEngine.TempStoreSize := 500;

{  S := ExtractFilePath(ParamStr(0)) + 'Copia';
  if not DirectoryExists(S) then MkDir(S);

  S := ExtractFilePath(ParamStr(0)) + 'Email';
  if not DirectoryExists(S) then MkDir(S);}
  
  ServerEngine.Active := True;
  nxSimpleMon.Active := True;
  nxDB.AliasPath := '';
  nxDB.AliasName := 'nexreg_copia';

  nxSe.Active := True;
  nxDB.Active := True;
  BuildAndEvolveDatabase(nxDB);

  CommandHandler.Active := True;
  nxSqlEng.Active := True;
  nxTCPIP.Active := True;
end;

procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

function CreateSession: TnxSession;
begin
  if dmServidorBD=nil then
    Result := nil
  else begin  
    Result := TnxSession.Create(nil);
    Result.ServerEngine := dmServidorBD.ServerEngine;
    Result.Timeout := 10000;
    Result.Active := True;
  end;  
end;

procedure TdmServidorBD.DataModuleDestroy(Sender: TObject);
begin
  dmServidorBD := nil;
end;

function padroniza_cidade(S: String): String;
var I : Integer;
begin
  S := AnsiUpperCase(Trim(S));
  Result := '';
  for I := 1 to Length(S) do 
  if (S[I]<>' ') or ((I>1) and (S[I-1]<>' ')) then
    Result := Result + S[I];
end;


initialization
  dmServidorBD := nil;

end.
