unit uCMdmKbmCli;

interface

uses
  SysUtils, Classes, kbmMWCustomMessagingTransport, kbmMWCustomTransport,
  kbmMWClient, kbmMWGlobal, kbmMWTCPIPIndyMessagingClientTransport, kbmMWFileClient;

type
  TArqCompletouEv = procedure (NomeArq: String);
  TArqAndamentoEv = procedure (NomeArq: String; Percentual: Integer; var Cancelar: Boolean);
  TMensagemEv     = procedure (Assunto: String; const Args: TkbmMWArrayVariant) of object;
  
  TdmKBMCli = class(TDataModule)
    mwCli: TkbmMWFileClient;
    Transp: TkbmMWTCPIPIndyMessagingClientTransport;
    mmqIn: TkbmMWMemoryMessageQueue;
    mmqOut: TkbmMWMemoryMessageQueue;
    procedure TranspMessage(Sender: TObject;
      const TransportStream: TkbmMWCustomMessageTransportStream;
      const Args: TkbmMWArrayVariant; UserStream: TMemoryStream);
    procedure mwCliProgress(Sender: TObject; Pct: Integer; Receiving: Boolean;
      var Terminate: Boolean);
    procedure TranspDisconnected(Sender: TObject;
      Info: TkbmMWCustomTransportInfo);
    procedure TranspConnectionLost(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    FNomeArq: String;
    FArqCompletou: TArqCompletouEv;
    FArqAndamento: TArqAndamentoEv;
    FMensagem: TMensagemEv;
    FNumMaq: Integer;
    function GetServidor: String;
    procedure SetServidor(const Value: String);
    function GetAtivo: Boolean;
    procedure SetAtivo(const Value: Boolean);
    procedure SetNumMaq(const Value: Integer);
    { Private declarations }
  public
    procedure EnviaArq(const aOrigem, aDestino: String);
    procedure ObtemArq(const aOrigem, aDestino: String);
    
    { Public declarations }
    function NomeArq: String;

    property OnArqCompletou: TArqCompletouEv
      read FArqCompletou write FArqCompletou;

    property OnArqAndamento: TArqAndamentoEv
      read FArqAndamento write FArqAndamento;

    property OnMensagem: TMensagemEv
      read FMensagem write FMensagem;

    property NumMaq: Integer
      read FNumMaq write SetNumMaq; 

    property Ativo: Boolean
      read GetAtivo write SetAtivo;  

    property Servidor: String
      read GetServidor write SetServidor;   
  end;

var
  dmKBMCli: TdmKBMCli;

implementation

{$R *.dfm}

procedure TdmKBMCli.DataModuleCreate(Sender: TObject);
begin
  FNomeArq := '';
  FArqCompletou := nil;
  FArqAndamento := nil;
  FMensagem := nil;
  FNumMaq := 0;
end;

procedure TdmKBMCli.EnviaArq(const aOrigem, aDestino: String);
begin
  if FNomeArq<>'' then
    Raise Exception.Create('Já existe um arquivo sendo transmitido');
  mwCli.PutFile(aOrigem, aDestino);
  FNomeArq := ExtractFileName(aOrigem);
end;

function TdmKBMCli.GetAtivo: Boolean;
begin
  Result := Transp.Active;
end;

function TdmKBMCli.GetServidor: String;
begin
  Result := Transp.Host;
end;

procedure TdmKBMCli.mwCliProgress(Sender: TObject; Pct: Integer;
  Receiving: Boolean; var Terminate: Boolean);
begin
  if Pct=100 then begin
    try
      if Assigned(FArqCompletou) then
        FArqCompletou(FNomeArq);
    finally
      FNomeArq := '';
    end;
  end else
  if Assigned(FArqAndamento) then
    FArqAndamento(FNomeArq, Pct, Terminate);
end;

function TdmKBMCli.NomeArq: String;
begin
  Result := FNomeArq;
end;

procedure TdmKBMCli.ObtemArq(const aOrigem, aDestino: String);
begin
  if FNomeArq<>'' then
    Raise Exception.Create('Já existe um arquivo sendo transmitido');
  mwCli.GetFile(aOrigem, aDestino);
  FNomeArq := ExtractFileName(aOrigem);
end;

procedure TdmKBMCli.SetAtivo(const Value: Boolean);
begin
  if NumMaq=0 then 
    raise exception.Create('É necessário ajustar o número da máquina');
  Transp.Active := True;  
end;

procedure TdmKBMCli.SetNumMaq(const Value: Integer);
begin
  mwCli.Username := IntToStr(Value);
  Transp.NodeID := mwCli.Username;
  FNumMaq := Value;
end;

procedure TdmKBMCli.SetServidor(const Value: String);
begin
  Transp.Host := Value;
end;

procedure TdmKBMCli.TranspConnectionLost(Sender: TObject);
begin
  FNomeArq := '';
end;

procedure TdmKBMCli.TranspDisconnected(Sender: TObject;
  Info: TkbmMWCustomTransportInfo);
begin
  FNomeArq := '';
end;

function ExtraiAssunto(const S: String): String;
var P : Integer;
begin
  Result := Trim(S);
  P := Pos('.', Result);
  while P>0 do begin
    Delete(Result, 1, P);
    P := Pos('.', Result);
  end;
end;

procedure TdmKBMCli.TranspMessage(Sender: TObject;
  const TransportStream: TkbmMWCustomMessageTransportStream;
  const Args: TkbmMWArrayVariant; UserStream: TMemoryStream);
begin
  with TransportStream do 
  if (UpperCase(Copy(Subject, 1, 3))='MSG') and  Assigned(FMensagem) then
    FMensagem(ExtraiAssunto(Subject), Args);
end;

end.
