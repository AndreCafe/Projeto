unit uDTSrvBDServ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, 
  nxllTransport, nxchCommandHandler, nxllComponent, nxllEventLog, Db,
  nxptBasePooledTransport, nxtwWinsockTransport, nxsrSqlEngineBase,
  FileCtrl, nxsqlEngine, nxdb,
  kbmMWServer, nxptZipCompressor, kbmMWSecurity, kbmMWCustomTransport, nxllPluginBase,
  ExtCtrls, nxsdSimpleMonitor, kbmmwZipStdTransStream, kbmMWTCPIPIndyTransport,
  nxreRemoteServerEngine, idtcpserver, 
  kbmMWCustomConnectionPool, kbmMWNexusDB, SyncObjs, kbmMemTable,
  kbmMWStreamFormat, kbmMWBinaryStreamFormat, nxllSimpleCommandHandler,
  nxsdServerEngine, kbmMWTCPIPIndyServerTransport;

type
  TdmBDServ = class(TDataModule)
    kbmServ: TkbmMWServer;
    Timer1: TTimer;
    nxTCPIP: TnxWinsockTransport;
    nxRSE: TnxRemoteServerEngine;
    mwTCPIP: TkbmMWTCPIPIndyServerTransport;
    mwHTTP: TkbmMWTCPIPIndyServerTransport;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure SimpleMonDestroy(aExtender: TnxSimpleMonitorExtender;
      aBefore: Boolean);
    procedure SimpleMonCreate(aExtender: TnxSimpleMonitorExtender;
      aBefore: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure mwTCPIPConnect(AThread: TIdPeerThread);
    procedure mwTCPIPDisconnect(AThread: TIdPeerThread);
  private
    FUltimoUp    : Cardinal;
    FUltimoUpImp : Cardinal;
    FUltimoImp   : Cardinal;
    FUltimoExp   : Cardinal;
    FUltimoLog   : Cardinal;
    FCS          : TCriticalSection;
    FListaDB     : TStrings;
    { Private declarations }
  protected  
    function GetUltimoUp   : Cardinal;
    function GetUltimoImp : Cardinal;
    function GetUltimoExp : Cardinal;
    function GetUltimoUpImp: Cardinal;

    procedure SetUltimoUp(const Value: Cardinal);
    procedure SetUltimoImp(const Value: Cardinal);
    procedure SetUltimoExp(const Value: Cardinal);
    procedure SetUltimoUpImp(const Value: Cardinal);
    procedure AbriuDB(S: String);
    procedure FechouDB(S: String);
    function DBEmUso(S: String): Boolean;
  public
    function GetProxLog: Cardinal;
    function GetProxOper: Integer;

    procedure ApagaDirSemUso;

    property UltimoUp: Cardinal
      read GetUltimoUp write SetUltimoUp;
      
    property UltimoImp: Cardinal
      read GetUltimoImp write SetUltimoImp;

    property UltimoExp: Cardinal
      read GetUltimoExp write SetUltimoExp;

    property UltimoUpImp: Cardinal
      read GetUltimoUpImp write SetUltimoUpImp;  
    { Public declarations }
  end;

  TLogInfo = class
  public
    liLogID      : Cardinal;
    liOper       : Integer;
    liInicio     : TDateTime;
    liTicks      : Cardinal;
    liDetalhes   : TStrings;
    liUUploadImp : Cardinal;
    liSucesso    : Boolean;
    liTecnico    : String;
 
    constructor Create;
    destructor Destroy; override;

    procedure Salva(T: TnxTable; DB: TnxDatabase; S: TnxSession);
    procedure SalvaEsp(T: TDataset);
    procedure Limpa;
    procedure Inicia(aOper: Integer);
    class procedure Debug(Str: String; T: TnxTable; DB: TnxDatabase; S: TnxSession);
  end;



  function NomeAlias(S: String): String;
  function DownDir(ID: Cardinal): String;
  function TempDir: String;
  function Existe(Arq: String): Boolean;
  function ExisteTemp(Arq: String): Boolean;
  function Renomeia(Old, New: String): Boolean;
  function TicksToDateTime(Ticks: Cardinal): TDateTime;
  procedure InitTran(aDB: TnxDatabase;
                     const aTables : array of TnxTable;
                     aWith : Boolean);

var
  dmBDServ: TdmBDServ;
  NumClientesCon : Integer = 0;

implementation

uses uDTSyncDef, uDTTabelas, uDTSDown, uDTSrvProcessa, uDTSUp;

{$R *.DFM}

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

function TicksToDateTime(Ticks: Cardinal): TDateTime;
var D, H, M, S : Integer;
begin
  D := Ticks div (1000 * 60 * 60) * 24;
  Ticks := Ticks mod ((1000 * 60 * 60) * 24);
  H := Ticks div (1000 * 60 * 60);
  Ticks := Ticks mod (1000 * 60 * 60);
  M := Ticks div (1000 * 60);
  Ticks := Ticks mod (1000 * 60);
  S := Ticks div 1000;
  Ticks := Ticks mod 1000;
  
  if (H>23) then H := 23;
  
  Result := D + EncodeTime(H, M, S, Ticks);
end;

function Existe(Arq: String): Boolean;
begin
  Result := FileExists(cfgDirDBF+Arq);
end;

function TempDir: String;
begin
  Result := AppFolder+'Temp\';
end;

function ExisteTemp(Arq: String): Boolean;
begin
  Result := FileExists(TempDir+Arq);
end;

function Renomeia(Old, New: String): Boolean;
begin
  Result := RenameFile(cfgDirDBF+Old, cfgDirDBF+New);
  if not Result then
    Raise Exception.Create('Falha renomeando arquivo '+Old+' para '+New+' em '+cfgDirDBF+
                           ' (Erro='+IntToStr(GetLastError)+')');
end;

function DownDir(ID: Cardinal): String;
begin
  Result := IntToStr(ID);
  while Length(Result)<10 do Result := '_' + Result;
  Result := AppFolder+'Tabelas\Download\'+Result;
end;

function NomeAlias(S: String): String;
var
  sArm: String;
  I: Integer;
begin
  sArm := cfgNomeArm;
  for I := 1 to Length(sArm) do
    if sArm[I]=' '  then sArm[I] := '_';
  if sArm>'' then
    Result := sArm+'_'+S
  else
    Result := S;
end;

procedure TdmBDServ.DataModuleCreate(Sender: TObject);
var
  CBD: TChecaBD;
  S  : TnxSession;

  dbUp,
  dbPar,
  dbDown,
  dbLog  : TnxDatabase;

  T : TnxTable;
begin
  FCS := TCriticalSection.Create;
  FListaDB := TStringList.Create;

  FUltimoLog := 0;
  FUltimoUp  := 0;
  FUltimoImp := 0;
  FUltimoUpImp := 0;
  FUltimoExp := 0;

  if not DirectoryExists(AppFolder+'Tabelas') then
    MkDir(AppFolder+'Tabelas');

  if not DirectoryExists(AppFolder+'Tabelas\Upload') then
    MkDir(AppFolder+'Tabelas\Upload');

  if not DirectoryExists(AppFolder+'Tabelas\Download') then
    MkDir(AppFolder+'Tabelas\Download');

  if not DirectoryExists(AppFolder+'Tabelas\Log') then
    MkDir(AppFolder+'Tabelas\Log');

  if not DirectoryExists(AppFolder+'Tabelas\Par') then
    MkDir(AppFolder+'Tabelas\Par');

  if not DirectoryExists(AppFolder+'Temp') then
    MkDir(AppFolder+'Temp');

  nxRSE.Enabled := True;
  mwTCPIP.Bindings[0].Port := cfgPort;

  if cfgPortHTTP>0 then
    mwHTTP.Bindings[0].Port := cfgPortHTTP;

  S := TnxSession.Create(Self);

  dbUp := TnxDatabase.Create(Self);
  dbPar := TnxDatabase.Create(Self);
  dbDown := TnxDatabase.Create(Self);
  dbLog := TnxDatabase.Create(Self);

  T := TnxTable.Create(Self);
  try
    S.ServerEngine := nxRSE;
    S.Enabled := True;
    S.Active := True;

    S.DeleteAliasEx(NomeAlias(cDiaTecPar));
    S.AddAliasEx(NomeAlias(cDiaTecPar), AppFolder+'Tabelas\Par');

    S.DeleteAliasEx(NomeAlias(cDiaTecUp));
    S.AddAliasEx(NomeAlias(cDiaTecUp), AppFolder+'Tabelas\Upload');

    S.DeleteAliasEx(NomeAlias(cDiaTecLog));
    S.AddAliasEx(NomeAlias(cDiaTecLog), AppFolder+'Tabelas\Log');

    S.DeleteAliasEx(NomeAlias(cDiaTecTemp));
    S.AddAliasEx(NomeAlias(cDiaTecTemp), TempDir);

    dbLog.Session := S;
    dbLog.Enabled := True;
    dbLog.AliasName := NomeAlias(cDiatecLog);

    dbPar.Session := S;
    dbPar.Enabled := True;
    dbPar.AliasName := NomeAlias(cDiatecPar);

    dbUp.Session := S;
    dbUp.Enabled := True;
    dbUp.AliasName := NomeAlias(cDiatecUp);
    
    dbLog.Connected := True;
    dbUp.Connected := True;
    dbPar.Connected := True;
    try
      CBD := TChecaBD.Create;
      try
        CBD.Checar(dbPar, dbLog, nil, dbUp);
      finally
        CBD.Free;
      end;
    except
    end;  

    dbLog.Connected := True;
    T.Database := dbLog;
    T.TableName := 'Log';
    T.Open;

    T.IndexName := 'IID';
    T.Last;
    if T.RecordCount>0 then 
      FUltimoLog := T.FieldByName('ID').AsInteger;
    
    T.IndexName := 'IOperID';
    
    T.SetRange([iolImportacao, True], [iolImportacao, True]);
    T.Last;
    if T.RecordCount>0 then begin
      FUltimoImp := T.FieldByName('ID').AsInteger;
      FUltimoUpImp := T.FieldByName('UUpload').AsInteger;
      if not DirectoryExists(DownDir(FUltimoImp)) then
        MkDir(DownDir(FUltimoImp));

      dbDown.Session := S;
      dbDown.AliasPath := DownDir(FUltimoImp);
      dbDown.Connected := True;
      try
        CBD := TChecaBD.Create;
        try
          CBD.Checar(nil, nil, dbDown, nil);
        finally
          CBD.Free;
        end;
      except
      end;  
    end;

    T.CancelRange;

    T.SetRange([iolUpload, True], [iolUpload, True]);
    T.Last;
    if T.RecordCount>0 then
      FUltimoUp := T.FieldByName('ID').AsInteger;

    T.SetRange([iolExportacao, True], [iolExportacao, True]);
    T.Last;
    if T.RecordCount>0 then
      FUltimoExp := T.FieldByName('ID').AsInteger;

    T.Close;  
  finally
    T.Free;
    dbLog.Free;
    dbUp.Free;
    dbPar.Free;
    dbDown.Free;
    S.Free;
  end;  
  ApagaDirSemUso;

  kbmServ.RegisterService(TkbmDown, True);
  kbmServ.RegisterService(TkbmUp, False);
  mwTCPIP.Listen;
  kbmServ.Active := True;
  if cfgPortHTTP>0 then
    mwHTTP.Listen;
end;

procedure TdmBDServ.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(FListaDB);
  FCS.Free;
end;

function TdmBDServ.GetProxLog: Cardinal;
begin
  FCS.Enter;
  try
    Inc(FUltimoLog);
    Result := FUltimoLog;
  finally
    FCS.Leave;
  end;
end;

function TdmBDServ.GetProxOper: Integer;
begin
  FCS.Enter;
  try
    if FUltimoUpImp < FUltimoUp then
      Result := iolImpUpload
    else  
    if Existe(DBFDown) then
      Result := iolImportacao
    else
    if FUltimoExp < FUltimoUp then
      Result := iolExportacao
    else
      Result := -1;  
  finally
    FCS.Leave;
  end;
end;

function TdmBDServ.GetUltimoExp: Cardinal;
begin
  FCS.Enter;
  try
    Result := FUltimoExp;
  finally
    FCS.Leave;
  end;
end;

function TdmBDServ.GetUltimoImp: Cardinal;
begin
  FCS.Enter;
  try
    Result := FUltimoImp;
  finally
    FCS.Leave;
  end;
end;

function TdmBDServ.GetUltimoUp: Cardinal;
begin
  FCS.Enter;
  try
    Result := FUltimoUp;
  finally
    FCS.Leave;
  end;
end;

function TdmBDServ.GetUltimoUpImp: Cardinal;
begin
  FCS.Enter;
  try
    Result := FUltimoUpImp;
  finally
    FCS.Leave;
  end;
end;

procedure TdmBDServ.SetUltimoExp(const Value: Cardinal);
begin
  FCS.Enter;
  try
    FUltimoExp := Value;
  finally
    FCS.Leave;
  end;
end;

procedure TdmBDServ.SetUltimoImp(const Value: Cardinal);
begin
  FCS.Enter;
  try
    FUltimoImp := Value;
  finally
    FCS.Leave;
  end;
end;

procedure TdmBDServ.SetUltimoUp(const Value: Cardinal);
begin
  FCS.Enter;
  try
    FUltimoUp := Value;
  finally
    FCS.Leave;
  end;
end;

procedure TdmBDServ.SetUltimoUpImp(const Value: Cardinal);
begin
  FCS.Enter;
  try
    FUltimoUpImp := Value;
  finally
    FCS.Leave;
  end;
end;

{ TLogInfo }

procedure TLogInfo.Limpa;
begin
  liLogID      := 0;
  liOper       := 1;
  liInicio     := 0;
  liTicks      := 0;
  liDetalhes.Clear;
  liTecnico    := '';
  liUUploadImp := 0;
  liSucesso    := False;
end;

constructor TLogInfo.Create;
begin
  liDetalhes   := TStringList.Create;
  Limpa;
end;

destructor TLogInfo.Destroy;
begin
  inherited;
  liDetalhes.Free;
end;

procedure TLogInfo.Inicia(aOper: Integer);
begin
  liLogID      := dmBDServ.GetProxLog;
  liOper       := aOper;
  liInicio     := Now;
  liTicks      := GetTickCount;
  liDetalhes.Clear;
  liUUploadImp := 0;
  liSucesso    := False;
  liTecnico    := '';
end;

procedure TLogInfo.SalvaEsp(T: TDataset);
begin
  T.Active := True;
  T.Insert;
  T.FieldByName('ID').AsInteger := liLogID;
  T.FieldByName('Data').AsDateTime := liInicio;
  T.FieldByName('Duracao').AsDateTime := TicksToDateTime(GetTickCount - liTicks);
  T.FieldByName('UUpload').AsInteger := liUUploadImp;
  T.FieldByName('Oper').AsInteger := liOper;
  T.FieldByName('Ok').AsBoolean := liSucesso;
  T.FieldByName('Detalhes').Value := liDetalhes.Text;
  T.FieldByName('Tecnico').AsString := liTecnico;
  T.Post;
end;

procedure TLogInfo.Salva(T: TnxTable; DB: TnxDatabase; S: TnxSession);
var
  CriouTB, CriouDB: Boolean;

begin
  if liLogID=0 then Exit;

  CriouTB := False;
  CriouDB := False;

  if T=nil then begin
    if DB=nil then begin
      DB := TnxDatabase.Create(nil);
      CriouDB := True;
      DB.Session := S;
      DB.AliasName := NomeAlias(cDiatecLog);
    end;

    T := TnxTable.Create(nil);
    CriouTB := True;
    T.Session := S;
    T.Database := DB;
    T.TableName := 'Log';
  end else
    DB := T.Database;

  try
    DB.Connected := True;
    T.Open;

    InitTran(DB, [T], True);
    try
      SalvaEsp(T);
      DB.Commit;
      Limpa;
    except
      DB.Rollback;
      Raise;
    end;
  finally
    if CriouTB then
      T.Free;
    if CriouDB then
      DB.Free;
  end;
end;

class procedure TLogInfo.Debug(Str: String; T: TnxTable; DB: TnxDatabase;
  S: TnxSession);
var
  CriouTB, CriouDB: Boolean;
begin
  Exit;
  
  CriouTB := False;
  CriouDB := False;
  
  if (T=nil) then begin
    if S=nil then Exit;

    if DB=nil then begin
      DB := TnxDatabase.Create(nil);
      CriouDB := True;
      DB.Session := S;
      DB.AliasName := NomeAlias(cDiatecLog);
    end;

    T := TnxTable.Create(nil);
    CriouTB := True;
    T.Session := S;
    T.Database := DB;
    T.TableName := 'Log';
  end else
    DB := T.Database;

  try
    DB.Connected := True;
    T.Open;
    InitTran(DB, [T], True);
    try
      T.Active := True;
      T.Insert;
      T.FieldByName('ID').AsInteger := dmBDServ.GetProxLog;
      T.FieldByName('Data').AsDateTime := Now;
      T.FieldByName('Duracao').AsDateTime := 0;
      T.FieldByName('UUpload').AsInteger := 0;
      T.FieldByName('Oper').AsInteger := iolDebug;
      T.FieldByName('Ok').AsBoolean := True;
      T.FieldByName('Detalhes').AsString := Str;
      T.FieldByName('Tecnico').AsString := '';
      T.Post;
      DB.Commit;
    except
      DB.Rollback;
      Raise;
    end;
  finally
    if CriouTB then
      T.Free;
    if CriouDB then
      DB.Free;
  end;
end;


procedure TdmBDServ.SimpleMonDestroy(
  aExtender: TnxSimpleMonitorExtender; aBefore: Boolean);
var S: String;  
begin
  if aExtender.ExtendableObject is TnxAbstractDatabase then begin
    S := '';
    TnxAbstractDatabase(aExtender.ExtendableObject).GetPath(S);
    FechouDB(S);
  end;  
end;

procedure TdmBDServ.AbriuDB(S: String);
var I : Integer;
begin
  S := UpperCase(S);
  if Pos('\TABELAS\DOWNLOAD\', S)=0 then Exit;
  FCS.Enter;
  try
    I := FListaDB.IndexOf(S);
    if I=-1 then 
      FListaDB.AddObject(S, TObject(1))
    else
      FListaDB.Objects[I] := TObject(Integer(FListaDB.Objects[I])+1);
  finally
    FCS.Leave;
  end;    
end;

procedure ApagaDir(Dir: String);
var
  SR: TSearchRec;
begin
  try
    if FindFirst(Dir+'\*.*', faAnyFile, SR)=0 then 
    try
      repeat
        DeleteFile(PChar(Dir+'\'+SR.Name));
        Sleep(5);
      until (FindNext(SR)<>0);
    finally
      SysUtils.FindClose(SR);
    end;
    RemoveDir(Dir);
  except
  end;  
end;

procedure TdmBDServ.ApagaDirSemUso;
var
  SR: TSearchRec;
  S : String;
  C : Cardinal;
begin
  try
    if FindFirst(AppFolder+'Tabelas\Download\*.*', faDirectory, SR)=0 then
    try
      repeat
        S := SR.Name;
        while (S>'') and (S[1]='_') do Delete(S, 1, 1);
        C := StrToIntDef(S, 0);
        S := AppFolder+'Tabelas\Download\'+SR.Name;
        if (C>0) and (C<dmBDServ.UltimoImp) and (not DBEmUso(S)) then
          ApagaDir(S);
        Sleep(5);  
      until (FindNext(SR)<>0);
    finally
      SysUtils.FindClose(SR);
    end;
  except
  end;  
end;

procedure TdmBDServ.FechouDB(S: String);
var 
  I : Integer;
  Path : String;
begin
  S := UpperCase(S);
  Path := S;
  if Pos('\TABELAS\DOWNLOAD\', S)=0 then Exit;
  FCS.Enter;
  try
    I := FListaDB.IndexOf(S);
    if (I>-1) and (Integer(FListaDB.Objects[I])=1) then 
      FListaDB.Delete(I);
  finally
    FCS.Leave;
  end;    
end;

function TdmBDServ.DBEmUso(S: String): Boolean;
begin
  FCS.Enter;
  try
    S := UpperCase(S);
    if Copy(S, Length(S), 1)='\' then Delete(S, Length(S), 1);
    DBEmUso := (FListaDB.IndexOf(S)>-1);
  finally
    FCS.Leave;
  end;  
end;

procedure TdmBDServ.SimpleMonCreate(
  aExtender: TnxSimpleMonitorExtender; aBefore: Boolean);
var S: String;  
begin
  if aExtender.ExtendableObject is TnxAbstractDatabase then begin
    S := '';
    TnxAbstractDatabase(aExtender.ExtendableObject).GetPath(S);
    AbriuDB(S);
  end;  
end;

procedure TdmBDServ.Timer1Timer(Sender: TObject);
begin
  ApagaDirSemUso;
end;

procedure TdmBDServ.mwTCPIPConnect(AThread: TIdPeerThread);
begin
  Inc(NumClientesCon);
end;

procedure TdmBDServ.mwTCPIPDisconnect(AThread: TIdPeerThread);
begin
  Dec(NumClientesCon);
end;

end.
