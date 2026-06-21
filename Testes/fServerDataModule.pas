unit fServerDataModule;

interface

uses
  SysUtils, Classes, 
  uROClient, uROPoweredByRemObjectsButton, uROClientIntf, uROServer,
  uROBinMessage, uROIndyTCPServer,
  uDADriverManager, uDAClasses, uDADBXDriver, uDAIBXDriver, uDAEngine, uDAADODriver;

type
  TServerDataModule = class(TDataModule)
    ROServer: TROIndyTCPServer;
    ROMessage: TROBinMessage;
    ConnectionManager: TDAConnectionManager;
    DriverManager: TDADriverManager;
    ADODriver: TDAADODriver;
    IBXDriver: TDAIBXDriver;
    DBXDriver: TDADBXDriver;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServerDataModule: TServerDataModule;

implementation

{$R *.dfm}

procedure TServerDataModule.DataModuleCreate(Sender: TObject);
begin
  ROServer.Active := true;
end;

end.
