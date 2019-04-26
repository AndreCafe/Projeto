unit ncsDMBackup;

interface

uses
  SysUtils, Classes, nxdbBackupController, nxdb, nxllComponent;

type
  TdmBackup = class(TDataModule)
    nxDBD: TnxDatabase;
    nxDBO: TnxDatabase;
    nxSession: TnxSession;
    nxBackup: TnxBackupController;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FTables: TStrings;
    { Private declarations }

    procedure IncluirTabela(aSender    : TnxBackupController;
                            const aTableName : string;
                              var aUseTable  : Boolean);
    
  public
    procedure FazBackup(aTables, aDestino: String);

    class procedure Copiar(aTables, aDestino: String);
    { Public declarations }
  end;

var
  dmBackup: TdmBackup;

implementation

uses ncServBD, ncTableDefs;

{$R *.dfm}

class procedure TdmBackup.Copiar(aTables, aDestino: String);
begin
  with TdmBackup.Create(nil) do 
  try
    FazBackup(aTables, aDestino);
  finally
    Free;
  end;
end;

procedure TdmBackup.DataModuleCreate(Sender: TObject);
begin
  FTables := TStringList.Create;
end;

procedure TdmBackup.DataModuleDestroy(Sender: TObject);
begin
  FTables.Free;
end;

procedure TdmBackup.FazBackup(aTables, aDestino: String);
begin
  FTables.Text := aTables;
  
  nxSession.ServerEngine := dmServidorBD.ServerEngine;
  nxSession.Active := True;
  nxSession.PasswordAdd(sEncpass);
  nxDBD.AliasPath := aDestino;  
  if not DirectoryExists(nxDBD.AliasPath) then
    ForceDirectories(nxDBD.AliasPath);
  nxDBO.Active := True;
  nxDBD.Active := True;
  try
    nxBackup.OnIncludeTable := IncluirTabela;
    nxBackup.Backup;
  finally
    nxDBD.Active := False;
    nxDBO.Active := False;
    nxSession.CloseInactiveTables;
    nxSession.CloseInactiveFolders;
    nxSession.Active := False;
    nxSession.ServerEngine := nil;
    nxBackup.Close;
  end;
end;

procedure TdmBackup.IncluirTabela(aSender: TnxBackupController;
  const aTableName: string; var aUseTable: Boolean);
begin
  aUseTable := (FTables.IndexOf(aTableName)>=0);
end;

end.
