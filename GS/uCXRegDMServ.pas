unit uCXRegDMServ;

interface

uses
  Forms, SysUtils, Classes, kbmMWCustomMessagingTransport, kbmMWServer,
  kbmMWCustomTransport, kbmMWglobal, kbmMWSecurity, kbmMWUDPIndyMessagingTransport,
  LMDCustomComponent, LMDOneInstance;

type
  TdmServ = class(TDataModule)
    udpServ: TkbmMWUDPIndyMessagingServerTransport;
    kbmServ: TkbmMWServer;
    mmqIn: TkbmMWMemoryMessageQueue;
    mmqOut: TkbmMWMemoryMessageQueue;
    OneOnly: TLMDOneInstance;
    procedure udpServMessage(Sender: TObject;
      const TransportStream: TkbmMWCustomMessageTransportStream;
      const Args: TkbmMWArrayVariant; UserStream: TMemoryStream);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmServ: TdmServ;

implementation

uses uLicenca, uCXRegDMCli, ucxregPri;

{$R *.dfm}

procedure TdmServ.udpServMessage(Sender: TObject;
  const TransportStream: TkbmMWCustomMessageTransportStream;
  const Args: TkbmMWArrayVariant; UserStream: TMemoryStream);
var CI : TkbmMWClientIdentity;  
begin
  if TransportStream.Subject='MSG.CLIENT.SHOWSERV' then begin
    FrmPri.TrayClick(nil);;
    Exit;
  end else begin  
    CI := TkbmMWClientIdentity.Create;
    try
      udpServ.SendMessage('MSG.SERVER.LICENCA', TransportStream.RemoteLocation, CI, nil, [LicencaGlobal.AsString]);
    finally
      CI.Free;
    end;      
  end;  
end;

procedure TdmServ.DataModuleCreate(Sender: TObject);
begin
  udpServ.Subscriptions.Clear;
  udpServ.Subscriptions.Add('MSG.CLIENT.>');
  try
    kbmServ.Active := True;
    udpServ.Listen;
    udpServ.AnnounceSubscriptions;
  except
    dmCli := TdmCli.Create(Self);
    dmCli.ShowServ;
    dmCli.Free;
    Application.Terminate;
  end;  
end;

end.
