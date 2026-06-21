unit fClientDataModule;

interface

uses {vcl:} SysUtils, Classes, DB, DBClient, 
     {RemObjects:} uROClient, uROClientIntf, uRORemoteService, uROBinMessage, uROIndyTCPChannel, 
     {Data Abstract:} uDAClientDataModule, uDADataTable, uDABINAdapter, uDAInterfaces;

type
  TClientDataModule = class(TDAClientDataModule)
    ROMessage: TROBinMessage;
    ROChannel: TROIndyTCPChannel;
    RORemoteService: TRORemoteService;
    DABinAdapter: TDABINAdapter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientDataModule: TClientDataModule;

implementation

{$R *.dfm}

initialization
end.
