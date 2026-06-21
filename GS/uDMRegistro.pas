unit uDMRegistro;

interface

uses
  SysUtils, Classes, DB, kbmMemTable, kbmMWCustomConnectionPool,
  kbmMWCustomDataset, kbmMWClientDataset, kbmMWCustomTransport,
  kbmMWClient, kbmMWTCPIPIndyTransport, kbmMWStreamFormat,
  kbmMWBinaryStreamFormat, kbmMemBinaryStreamFormat;

type
  TDM = class(TDataModule)
  private
    { Private declarations }
  public
    function Request(AFunc: string; Args: Array of Variant): Variant;
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

function TDM.Request(AFunc: string; Args: array of Variant): Variant;
var S: String;
begin
  Result := mwClient.Request('REGISTRO', '1.00', AFunc, Args);
  S := Result[0];
  if S <> 'OK' then
    Raise Exception.Create(S);
end;

end.
