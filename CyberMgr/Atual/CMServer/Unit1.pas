unit Unit1;

interface

uses
  SysUtils, Classes, nxdb, nxllComponent, nxdbBackupController;

type
  TDataModule1 = class(TDataModule)
    nxBackup: TnxBackupController;
    nxDBO: TnxDatabase;
    nxDBD: TnxDatabase;
    nxSession: TnxSession;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.
