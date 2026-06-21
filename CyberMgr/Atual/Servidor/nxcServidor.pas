unit nxcServidor;

interface

uses
  SysUtils, Classes, kbmMWCustomMessagingTransport, kbmMemTable, Windows, kbmMWSecurity, 
  kbmMWStreamFormat, kbmMWBinaryStreamFormat, kbmMWCustomTransport, kbmMWServer,
  kbmMWTCPIPIndyMessagingServerTransport, kbmMWFileService;

type
  TdmKBMserv = class(TDataModule)
    mwServ: TkbmMWServer;
    mwTCPIP: TkbmMWTCPIPIndyMessagingServerTransport;
    BSF: TkbmMWBinaryStreamFormat;
    mmqIn: TkbmMWMemoryMessageQueue;
    mmqOut: TkbmMWMemoryMessageQueue;
    FilePool: TkbmMWFilePool;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    FCI : TkbmMWClientIdentity;
    { Public declarations }
  end;

  TThreadRename = class ( TThread )
  private
    FArqNovo: String;
    FArqVelho: String;
  public
    constructor Create(aArqNovo, aArqVelho: String);

    procedure Execute; override;
  end;

var
  dmKBMserv: TdmKBMserv;
  EncerrarThreads: Boolean;

implementation

uses nxcSkbmArqs, cmClassesBase, nxcSkbmProcs;

{$R *.dfm}

procedure TdmKBMserv.DataModuleCreate(Sender: TObject);
var
  fsd:TkbmMWFileServiceDefinition;
begin
  FCI := TkbmmwClientIdentity.Create;
  FCI.Username := 'cmserver';
  mwTCPIP.Bindings[0].Port := PortaKBMMW;
  fsd := TkbmMWFileServiceDefinition(mwServ.RegisterService(TmwServArq, False));
  fsd.RootPath := ExtractFilePath(ParamStr(0)) + 'dados';
  fsd.BlockSize:=8192;
  fsd.ListAttributesOptional:=false;
  fsd.StorageAttributes:=faArchive;
  mwServ.RegisterService(TkbmProcs, False);
  mwServ.Active := True;
  mwTCPIP.Listen;
  dmKBMServ := Self;
end;

procedure TdmKBMserv.DataModuleDestroy(Sender: TObject);
begin
  dmKBMServ := nil;
  EncerrarThreads := True;
  Sleep(200);
  mwTCPIP.Close;
  mwServ.Active := False;
  FCI.Free;
end;

{ TThreadRename }

constructor TThreadRename.Create(aArqNovo, aArqVelho: String);
begin
  FreeOnTerminate := True;
  FArqNovo := aArqNovo;
  FArqVelho := aArqVelho;
  inherited Create(False);
end;

procedure TThreadRename.Execute;
var 
  Ok: Boolean;
begin
  Ok := False;
  if FileExists(FArqNovo) then
  while (not Ok) and (not Terminated) and (not EncerrarThreads) do begin
    Ok := DeleteFile(PChar(FArqNovo));
    if not OK then Sleep(100);
  end;

  Ok := False;
  if (FArqVelho<>'') then
  while (not Ok) and (not Terminated) and (not EncerrarThreads) do begin
    Ok := RenameFile(FArqVelho, FArqNovo);
    if not OK then Sleep(100);
  end;
end;

initialization
  EncerrarThreads := False;
end.
