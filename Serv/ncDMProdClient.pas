unit ncDMProdClient;

interface

uses
  SysUtils, Classes, nxdb, nxsrSqlEngineBase, nxsqlEngine,
  nxllComponent, nxsdServerEngine, nxsrServerEngine, ncChecarServidor,
  ncProdD, ncProdU, ncClassesBase;

type
  TdmProdClient = class(TDataModule)
    nxServerEngineDnld: TnxServerEngine;
    nxSqlEngineDnld: TnxSqlEngine;
    nxSessionDnld: TnxSession;
    nxDatabaseDnld: TnxDatabase;
    nxSqlEngineUpld: TnxSqlEngine;
    nxServerEngineUpld: TnxServerEngine;
    nxSessionUpld: TnxSession;
    nxDatabaseUpld: TnxDatabase;
    procedure DataModuleCreate(Sender: TObject);
  private
    fProgPath : string;
    fdbPath : string;
    fdbDownloadPath : string;
    fdbUploadPath : string;
    fUpdateSrvThread : TChecarServidorThread;
    fSenha: String;
    fEmailConta: String;
    fCodEquip: String;
    procedure IniciaDB;
    { Private declarations }
  public
    nexDB : TnxDatabase;
    nexSession  : TnxSession;
    property EmailConta : String write fEmailConta;
    property CodEquip : String write fCodEquip;
    property Senha : String write fSenha;

    class procedure Iniciar(aCodEquip, aEmailConta, aSenha: String);
    class procedure Finalizar;

    function StartUpdateSrvThread:boolean;
    procedure StopUpdateSrvThread;

    destructor Destroy; override;
    { Public declarations }
  end;

  procedure PackTable(nxTable: TnxTable; const aProgressCallback:TnxcgProgressCallback=nil);
  procedure ReindexTable(nxTable: TnxTable; const aProgressCallback:TnxcgProgressCallback=nil);
  procedure PackAndReindexTable(nxTable: TnxTable; const aProgressCallback:TnxcgProgressCallback=nil);
  
var
  dmProdClient: TdmProdClient;

implementation

{$R *.dfm}

uses
    nxllException, nxsdTypes, nxsdDataDictionary, uVersionInfo,
    uLogs, ncServBD, uUtils;

function RCharPos(aChar: char; S: string): Integer;
var
     i : integer;
begin
     result := 0;
     for i:=length(S) downto 1 do
          if upcase(aChar)=upcase(s[i]) then begin
               result := i;
               break;
          end;
end;

procedure PackTable(nxTable: TnxTable; const aProgressCallback:TnxcgProgressCallback=nil);
var
    Dict : TnxDataDictionary;
    ai : TnxAbstractTaskInfo;
    st : TnxTaskStatus;
    comp : boolean;
    cancelTask : Boolean;
begin
        Dict := TnxDataDictionary.create;
        try
            nxCheck(nxTable.Database.GetDataDictionaryEx(nxTable.tablename, '', Dict));

            GLog.Log(nil,[lcTrace],'packing tabela '+nxTable.tablename);
            ai := nxTable.PackTable;
            repeat
                ai.GetStatus(comp, st);

                if Assigned(aProgressCallback) then
                  aProgressCallback(nxTable.tablename, st, cancelTask);
                if comp then
                  break;
                if cancelTask then
                  nxCheck(ai.Cancel);

                sleep(100);
            until comp;
            GLog.Log(nil,[lcTrace],'tabela '+nxTable.tablename+' packed');

        finally
            Dict.free;
        end;
end;

procedure ReindexTable(nxTable: TnxTable; const aProgressCallback:TnxcgProgressCallback=nil);
var
    Dict : TnxDataDictionary;
    i : integer;
    ai : TnxAbstractTaskInfo;
    st : TnxTaskStatus;
    comp : boolean;
    cancelTask : Boolean;
begin
        Dict := TnxDataDictionary.create;
        try
            nxCheck(nxTable.Database.GetDataDictionaryEx(nxTable.tablename, '', Dict));

            GLog.Log(nil,[lcTrace],'reindexando tabela '+nxTable.tablename);
            for i:=0 to Dict.IndicesDescriptor.IndexCount-1 do begin
                ai := nxTable.ReIndexTable(i);
                repeat
                    ai.GetStatus(comp, st);

                    if Assigned(aProgressCallback) then
                      aProgressCallback(nxTable.tablename, st, cancelTask);
                    if comp then
                      break;
                    if cancelTask then
                      nxCheck(ai.Cancel);

                    sleep(100);
                until comp;
            end;
            GLog.Log(nil,[lcTrace],'tabela '+nxTable.tablename+' reindexada');
        finally
            Dict.free;
        end;
end;

procedure PackAndReindexTable(nxTable: TnxTable;const aProgressCallback:TnxcgProgressCallback=nil);
begin
        PackTable(nxTable, aProgressCallback);
        ReindexTable(nxTable, aProgressCallback);
end;

// -----------------------------------------------------------------------------

procedure TdmProdClient.DataModuleCreate(Sender: TObject);
begin
    fUpdateSrvThread := nil;
    fProgPath       := ExtractFilePath(ParamStr(0));
    fdbPath         := fProgPath+'dados\';
    fdbDownloadPath := fProgPath+'dadosDownload\';
    fdbUploadPath   := fProgPath+'dadosUpload\';
    CleanUpAndDeleteDirectory(fdbDownloadPath, nil, nil);
    CleanUpAndDeleteDirectory(fdbUploadPath, nil, nil);
    fdbDownloadPath := fdbPath+'temp1\';
    fdbUploadPath   := fdbPath+'temp2\';

    forcedirectories(fdbDownloadPath);
    forcedirectories(fdbUploadPath);

    nxServerEngineDnld.Options := [seoForceFailSafe, seoCloseInactiveFolders, seoCloseInactiveTables];
end;

destructor TdmProdClient.Destroy;
begin
  if fUpdateSrvThread<>nil then begin
    StopUpdateSrvThread;
    fUpdateSrvThread.Free;
  end;

  inherited;
end;

class procedure TdmProdClient.Finalizar;
begin
  if dmProdClient<>nil then begin
    dmProdClient.StopUpdateSrvThread;
    FreeAndNil(dmProdClient);
  end;
end;

procedure TdmProdClient.IniciaDB;
begin
    nexSession := nil;
    nexDB := CreateDB(nexSession, Self);

    nxDatabaseDnld.AliasPath := fdbDownloadPath;
    nxDatabaseDnld.open;

    nxDatabaseUpld.AliasPath := fdbUploadPath;
    nxDatabaseUpld.open;

    ncProdD.BuildDatabase(nxDatabaseDnld);
    //movido pra a thread de ncChecarServidor
    //ncProdU.BuildAndEvolveProduComIndices(nxDatabaseUpld);
end;

class procedure TdmProdClient.Iniciar(aCodEquip, aEmailConta, aSenha: String);
begin
  Finalizar;
  
  dmProdClient := TdmProdClient.Create(nil);
  dmProdClient.CodEquip := aCodEquip;
  dmProdClient.EmailConta := aEmailConta;
  dmProdClient.Senha := aSenha;
  dmProdClient.StartUpdateSrvThread;
end;

function TdmProdClient.StartUpdateSrvThread:boolean;
begin
  result := false;
  if dmProdClient<>nil then
    with dmProdClient do
    try
      IniciaDB;

      if GConfig.AutoCad then begin
          fUpdateSrvThread := TChecarServidorThread.create(fProgPath, fdbPath, fdbDownloadPath, fdbUploadPath,
              nil, nxServerEngineDnld, nxServerEngineUpld, fCodEquip, fEmailConta, fSenha);
          //fUpdateSrvThread.OnMsg := Log;
          fUpdateSrvThread.Resume;
          result := true;
      end;
    except
      FreeAndNil(dmProdClient);
      Raise;
    end;
end;

procedure TdmProdClient.StopUpdateSrvThread;
begin
  if (dmProdClient<>nil) and (fUpdateSrvThread<>nil) then begin
      fUpdateSrvThread.Terminate;
      fUpdateSrvThread.WaitFor;
  end;
end;

initialization
  dmProdClient := nil;
  
end.
