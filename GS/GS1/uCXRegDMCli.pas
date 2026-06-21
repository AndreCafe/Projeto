unit uCXRegDMCli;

interface

uses
  SysUtils, Classes, Windows, ShellApi, kbmMWCustomTransport, kbmMWClient, kbmMWSecurity,
  kbmMWCustomMessagingTransport, kbmMWGlobal, kbmMWUDPIndyMessagingTransport,
  LMDCustomComponent, LMDStarter;

type
  TdmCli = class(TDataModule)
    mmqIn: TkbmMWMemoryMessageQueue;
    mmqOut: TkbmMWMemoryMessageQueue;
    udpCli: TkbmMWUDPIndyMessagingClientTransport;
    Starter: TLMDStarter;
    procedure DataModuleCreate(Sender: TObject);
    procedure udpCliMessage(Sender: TObject;
      const TransportStream: TkbmMWCustomMessageTransportStream;
      const Args: TkbmMWArrayVariant; UserStream: TMemoryStream);
  private
    FCI : TkbmMWClientIdentity;
    FLicStr: String;
    { Private declarations }
    procedure ProcessaMsgs;
    function ObtemLic(const aTentativas: Integer; const aInterval: Cardinal): Boolean;
  public
    function ObtemLicenca: String;
    procedure ShowServ;
    { Public declarations }
  end;

var
  dmCli: TdmCli;

implementation

{$R *.dfm}

{ TdmCli }

function TdmCli.ObtemLic(const aTentativas: Integer; const aInterval: Cardinal): Boolean;
var 
  Start: Cardinal;
  Vezes: Integer;
begin
  try
    FLicStr := '';
    Vezes := 0;
    udpCli.Active := True;
    repeat
      udpCli.SendMessage('MSG.CLIENT.LICENCA', '', FCI, nil, []);
      Start := GetTickCount;
      Inc(Vezes);
      while (FLicStr='') and ((GetTickCount-Start)<aInterval) do begin
        ProcessaMsgs;
        Sleep(5);
      end;
    until (Vezes>=aTentativas) or (FLicStr>'');
    Result := (FLicStr>'');
  except
    Result := False;
  end;  
end;

procedure TdmCli.ProcessaMsgs;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

procedure TdmCli.DataModuleCreate(Sender: TObject);
begin    
  FLicStr := '';
  FCI := TkbmMWClientIdentity.Create;
  udpCli.NodeID := kbmMWGenerateUniqueNodeID;
end;

procedure TdmCli.udpCliMessage(Sender: TObject;
  const TransportStream: TkbmMWCustomMessageTransportStream;
  const Args: TkbmMWArrayVariant; UserStream: TMemoryStream);
begin
  FLicStr := Args[0];
end;

function TdmCli.ObtemLicenca: String;
begin
  if (not ObtemLic(2, 3000)) and SameText(Copy(ParamStr(0), 1, 2), 'C:') then begin
    ShellExecute(0, 'open', PChar(ParamStr(0)), nil, nil, SW_SHOW);
    ObtemLic(5, 2000);
  end;
  Result := FLicStr;
end;

procedure TdmCli.ShowServ;
var Inicio: Cardinal;
begin
  udpCli.Active := True;
  udpCli.SendMessage('MSG.CLIENT.SHOWSERV', '', FCI, nil, []);
  Inicio := GetTickCount;
  while (GetTickCOunt-Inicio)<500 do begin
    ProcessaMsgs;
    Sleep(5);
  end;  
end;

end.
