unit cmDMClient;

interface

uses
  SysUtils, Dialogs, Classes, kbmMWCustomTransport, kbmMWClient, kbmMWGlobal,
  kbmMWCustomMessagingTransport, kbmMWTCPIPIndyMessagingTransport,
  kbmMWFileClient, kbmMWCustomConnectionPool, kbmMWClientDataset,
  kbmMWTCPIPIndyTransport, kbmMWTCPIPIndyMessagingClientTransport,
  kbmMWTCPIPIndyClientTransport;

type
  TdmClient = class(TDataModule)
    Client: TkbmMWFileClient;
    msgQIn: TkbmMWMemoryMessageQueue;
    msgQOut: TkbmMWMemoryMessageQueue;
    Client2: TkbmMWSimpleClient;
    CCP: TkbmMWClientConnectionPool;
    mwTCPIP: TkbmMWTCPIPIndyClientTransport;
    mwTCPIPmsg: TkbmMWTCPIPIndyMessagingClientTransport;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmClient: TdmClient;

implementation

uses uCMGPri;

{$R *.dfm}

procedure TdmClient.DataModuleCreate(Sender: TObject);
begin
  mwTCPIPmsg.NodeID := kbmmwGenerateUniqueNodeID;
  mwTCPIPmsg.Subscriptions.Text := 'RES.*.'+mwTCPIPmsg.NodeID+'.>';
end;

end.




                           
