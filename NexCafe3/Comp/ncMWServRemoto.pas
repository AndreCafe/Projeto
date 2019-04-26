unit ncMWServRemoto;

interface

uses 
  windows, 
  sysutils, 
  classes, 
  messages, 
  Variants,
  ncClassesBase,
  kbmMemTable,
  kbmMWGlobal,
  kbmMWCustomTransport, 
  kbmMWClient,
  kbmMWSecurity,
  kbmMWClientDataset,
  kbmMWCustomMessagingTransport, 
  kbmMWFileClient,
  kbmMWTCPIPIndyMessagingClientTransport;
  
type

  TncMWProgressoArqEv = procedure(Perc: Integer; Etapa: Byte; NomeArq: String; Download: Boolean) of object;

  TncMWServRemoto = class ( TncServidorBase )
  private
    FClient    : TkbmMWFileClient;
    FCI        : TkbmMWClientIdentity;
    FTransp    : TkbmMWTCPIPIndyMessagingClientTransport;
    FmmqIn     : TkbmMWMemoryMessageQueue;
    FmmqOut    : TkbmMWMemoryMessageQueue;
    FLoginOk   : Boolean;
    FMaq       : Integer;
    FLastRes   : Variant;
    FTicksLastCom : Cardinal;
    FArquivo      : String;
    FOnProgressoArq : TncMWProgressoArqEv;
    procedure OnDisconnected(Sender:TObject; Info:TkbmMWCustomTransportInfo);
    procedure OnConnectionLost(Sender: TObject);
    
    procedure MWMessage(Sender:TObject; 
                        const TransportStream:TkbmMWCustomMessageTransportStream; 
                        const Args:TkbmMWArrayVariant; 
                        UserStream:TMemoryStream);

    function Request(aCmd: String; const Args:array of Variant): Integer;
    function GetHost: String;
    procedure SetHost(const Value: String);
    procedure OnFileProgress(Sender:TObject; Pct:integer; Receiving:boolean; var Terminate:boolean);
  protected
    procedure SetAtivo(Valor: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function ObtemPastaServ(var NomePastaServ: String): Integer; override;
    function ArqFundoEnviado(NomeArq: String): Integer; override;
    function ObtemSenhaCli(Codigo: Integer; var Senha: String): Integer; override;
    function SalvaSenhaCli(Codigo: Integer; Senha: String): Integer; override;
    function LimpaFundo(Desktop: Boolean): Integer; override;
    function SalvaCredTempo(aObj: TObject): Integer; override;
    function SalvaMovEst(aObj: TObject): Integer; override;
    function SalvaDebito(aObj: TObject): Integer; override;
    function SalvaLancExtra(aObj: TObject): Integer; override;
    function SalvaDebTempo(aObj: TObject): Integer; override;
    function SalvaImpressao(aObj: TObject): Integer; override;
    function AbreCaixa(aFunc: String; var NovoCx: Integer): Integer; override;
    function FechaCaixa(aFunc: String; aID: Integer): Integer; override;
    function ReprocCaixa(aFunc: String; aID: Integer): Integer; override;
    function CorrigeDataCaixa(aFunc: String; aID: Integer; aNovaAbertura, aNovoFechamento: TDateTime): integer; override;
    function AjustaPontosFid(aFunc: String; aCliente: Integer; aFator: Smallint; aPontos: Double; aObs: String): Integer; override;

    function ObtemSitesBloqueados(var S: String): Integer; override;

    function SalvaLogAppUrl(S: TStream): Integer; override;
    
    function SalvaStreamObj(Novo: Boolean; S: TStream): Integer; override;
    function ObtemStreamAvisos(S: TStream): integer; override;
    function ObtemStreamConfig(S: TStream): integer; override;
    function ObtemStreamListaObj(Cliente: Integer; TipoClasse: Integer; S: TStream): Integer; override;
    function ApagaObj(Cliente: Integer; TipoClasse: Integer; Chave: String): Integer; override;
    function Login(aUsername, 
                   aSenha: String; 
                   aMaq: Word;
                   aFuncAtual: Boolean;
                   aRemoto: Boolean; 
                   aWndHandle: HWND; 
                   aProxyHandle: Integer; 
                   aSocket: Integer;
                   aSession: Integer;
                   aIP: String;
                   var Handle: Integer): Integer; override;

    function LoginMaq(aSessao: TObject): Integer; override;
    function AlteraSessao(aSessao: TObject): Integer; override;
    function CancelaTran(aID: Integer; aFunc: String): integer; override;
    function ObtemProcessos(aMaq: Word; aIDCliente, aIDReq: Integer): Integer; override;
    function FinalizaProcesso(aMaq: Word; aProcessID: Integer): Integer; override;
    function SalvaProcessos(aIDCliente, aRequest: Integer; aSL: TStrings): Integer; override;
    function ForceRefreshSessao(aSessao: Integer): Integer; override;
    function SalvaLic(aLic: String): Integer; override;
    function ObtemPatrocinios(aSL: TStrings): Integer; override;

    function RefreshEspera: Integer; override;
    function PermitirDownload(aSessao: Integer; aPermitir: Boolean): Integer; override;

    function AdicionaPassaporte(aMaq: Word; aSenha: String): Integer; override;
    function RegistraPaginasImpressas(aMaq: Word; aPaginas: Integer; aImp, aDoc: String): Integer; override;
    
    function PararTempoMaq(aMaq: Word; aParar: Boolean): Integer; override;
    function TransferirMaq(aOrigem, aDestino: Word): Integer; override;
    function ModoManutencao(aMaq: Word; aUsername, aSenha: String; aEntrar: Boolean): Integer; override;

    function SuporteRem(aMaq, aTec: Word): Integer; override;
    
    function LogoutMaq(aMaq: Word): Integer; override;
    function PreLogoutMaq(aMaq: Word): Integer; override;
    function CancLogoutMaq(aMaq: Word): Integer; override;

    function ObtemVersaoGuard(var Versao: Integer): Integer; override;
    
    function CapturaTelaMaq(aMaq: Word): integer; override;
    function SalvaTelaMaq(aSessionaMaq: Word; S: TMemoryStream): integer; override;
    function RefreshPrecos: integer; override;
    function ShutdownMaq(aMaq, aOper: Word): integer; override;

    function Download(aFonte, aDestino: String): Integer; override;
    function Upload(aFonte, aDestino: String): Integer; override;
    
    function EnviarMsg(const aDe, aPara: Integer; const aTexto: String): Integer; override;

    property TicksLastCom: Cardinal read FTicksLastCom;

    procedure KeepAlive;
    
  published
    property Host: String
      read GetHost write SetHost; 

    property OnProgressoArq: TncMWProgressoArqEv
      read FOnProgressoArq write FOnProgressoArq;   
  end;

  procedure Register;


implementation

uses ncMsgCom, ncSessao, ncCredTempo, ncDebito, ncDebTempo, ncLancExtra,
  ncMovEst, ncImpressao, ncErros, ncDebug;

const
  SvcName = 'NexServ';
  SvcVersion = '1';

{ TcadDispRemServer }

function TncMWServRemoto.AbreCaixa(aFunc: String; var NovoCx: Integer): Integer;
begin
  Result := Request('AbreCaixa', [aFunc]);
  if Result=0 then
    NovoCx := FLastRes[1];
end;

function TncMWServRemoto.AdicionaPassaporte(aMaq: Word;
  aSenha: String): Integer;
begin
  Result := Request('AdicionaPassaporte', [aMaq, aSenha]);
end;

function TncMWServRemoto.AjustaPontosFid(aFunc: String; aCliente: Integer;
  aFator: Smallint; aPontos: Double; aObs: String): Integer;
begin
  Result := Request('AjustaPontosFid', [AFunc, aCliente, aFator, aPontos, aObs]);
end;

function TncMWServRemoto.AlteraSessao(aSessao: TObject): Integer;
var S : TMemoryStream;
begin
  S := TMemoryStream.Create;
  try
    TncSessao(aSessao).SalvaStream(S, False);
    S.Position := 0;
    Result := Request('AlteraSessao', [kbmMWStreamToVariant(S)]);
  finally
    S.Free;
  end;
end;

function TncMWServRemoto.ApagaObj(Cliente, TipoClasse: Integer;
  Chave: String): Integer;
begin
  Result := Request('ApagaObj', [Cliente, TipoClasse, Chave]);
end;

function TncMWServRemoto.ArqFundoEnviado(NomeArq: String): Integer;
begin
  Result := Request('ArqFundoEnviado', [NomeArq]);
end;

function TncMWServRemoto.CancelaTran(aID: Integer; aFunc: String): integer;
begin
  Result := Request('CancelaTran', [aID, aFunc]);
end;

function TncMWServRemoto.CancLogoutMaq(aMaq: Word): Integer;
begin
  Result := Request('CancLogoutMaq', [aMaq]);
end;

function TncMWServRemoto.CapturaTelaMaq(aMaq: Word): integer;
begin
  Result := Request('CapturaTelaMaq', [aMaq]);
  if Result=0 then begin
    FLastRes := null;
  end;
end;

function TncMWServRemoto.CorrigeDataCaixa(aFunc: String; aID: Integer;
  aNovaAbertura, aNovoFechamento: TDateTime): integer;
begin
  Result := Request('CorrigeDataCaixa', [aFunc, aID, aNovaAbertura, aNovoFechamento]);
end;

constructor TncMWServRemoto.Create(AOwner: TComponent);
begin
  inherited;
  FOnProgressoArq := nil;
  FArquivo := '';
  FTicksLastCom := 0;
  FLoginOk := False;
  FMaq     := 0;
  FmmqIn := TkbmMWMemoryMessageQueue.Create(Self);
  FmmqOut := TkbmMWMemoryMessageQueue.Create(Self);
  FClient := TkbmMWFileClient.Create(Self);
  FTransp := TkbmMWTCPIPIndyMessagingClientTransport.Create(Self);
  FCI := TkbmMWClientIdentity.Create;
  FTransp.Subscriptions.Add('Eventos.>');
  FTransp.OnMessage := MWMessage;
  FClient.Transport := FTransp;
  FTransp.OutboundMessageQueue := FmmqOut;
  FTransp.InboundMessageQueue := FmmqIn;
  FTransp.StreamFormat := 'ZIPPED';
  FTransp.AutoSetupResponseSubscription := True;
  FTransp.AnnounceSubscriptionsOnConnect := True;
  FTransp.Port := 16202;
  FTransp.NodeID := IntToStr(Random(High(Integer))) + '_' +
                    IntToStr(Random(High(Integer))) + '_' +
                    IntToStr(Random(High(Integer)));
  FTransp.OnDisconnected := OnDisconnected;
  FTransp.OnConnectionLost := OnConnectionLost;
  FTransp.ConnectTimeout := 10;
  FTransp.RequestTimeout := 10;
  FClient.OnProgress := OnFileProgress;
  FClient.FileService := 'NexCafeFileServer';
  FClient.KeepPartialFileOnCancel := False;
  FClient.KeepPartialFileOnException := False;
end;

destructor TncMWServRemoto.Destroy;
begin
  Ativo := False;
  FCI.Free;
  FTransp.Free;
  FClient.Free;
  FmmqIn.Free;
  FmmqOut.Free;
  inherited;
end;

function TncMWServRemoto.Download(aFonte, aDestino: String): Integer;
begin
  FArquivo := aFonte;
  if Assigned(FOnProgressoArq) then
    FOnProgressoArq(0, 0, aFonte, True);
  if FClient.GetFile(aDestino, aFonte) then begin
    Result := 0;
    if Assigned(FOnProgressoArq) then
      FOnProgressoArq(100, 2, aFonte, True);
  end else begin
    Result := ncerrFalhaTransfArq;
    if Assigned(FOnProgressoArq) then
      FOnProgressoArq(-1, 2, aFonte, True);
  end;
end;

function TncMWServRemoto.EnviarMsg(const aDe, aPara: Integer;
  const aTexto: String): Integer;
begin
  Result := Request('EnviarMsg', [aDe, aPara, aTexto]);
end;

function TncMWServRemoto.FechaCaixa(aFunc: String; aID: Integer): Integer;
begin
  Result := Request('FechaCaixa', [aFunc, aID]);
end;

function TncMWServRemoto.FinalizaProcesso(aMaq: Word;
  aProcessID: Integer): Integer;
begin
  Result := Request('FinalizaProcesso',[aMaq, aProcessID]);
end;

function TncMWServRemoto.ForceRefreshSessao(aSessao: Integer): Integer;
begin
  Result := Request('ForceRefreshSessao', [aSessao]);
end;

function TncMWServRemoto.GetHost: String;
begin
  Result := FTransp.Host;
end;

procedure TncMWServRemoto.KeepAlive;
begin
  Request('KeepAlive', []);
end;

function TncMWServRemoto.LimpaFundo(Desktop: Boolean): Integer;
begin
  Result := Request('LimpaFundo', [Desktop]);
end;

function TncMWServRemoto.Login(aUsername, aSenha: String; aMaq: Word;
  aFuncAtual, aRemoto: Boolean; aWndHandle: HWND; aProxyHandle,
  aSocket: Integer; aSession: Integer; aIP: String; var Handle: Integer): Integer;
begin
  Result := Request('Login', [aUsername, aSenha, aMaq, aFuncAtual, aRemoto, 0, aProxyHandle, aSocket, aIP]);
  if Result=0 then begin
    FLoginOk := True;
    FMaq := aMaq;
    Handle := FLastRes[1];
    FLastRes := null;
    inherited Login(aUsername, aSenha, aMaq, aFuncAtual, aRemoto, aWndHandle, aProxyHandle, aSocket, aSession, aIP, Handle);                                
  end;
end;

function TncMWServRemoto.LoginMaq(aSessao: TObject): Integer;
var S : TMemoryStream;
begin
  S := TMemoryStream.Create;
  try
    TncSessao(aSessao).SalvaStream(S, False);
    S.Position := 0;
    Result := Request('LoginMaq', [kbmMWStreamToVariant(S)]);
  finally
    S.Free;
  end;
end;

function TncMWServRemoto.LogoutMaq(aMaq: Word): Integer;
begin
  Result := Request('LogoutMaq', [aMaq]);
end;

function TncMWServRemoto.ModoManutencao(aMaq: Word; aUsername, aSenha: String;
  aEntrar: Boolean): Integer;
begin
  Result := Request('ModoManutencao', [aMaq, aUsername, aSenha, aEntrar]);
end;

function GetArgsStr(const Args: TkbmMWArrayVariant): String;
var 
  I : Integer;
  Str : String;
begin
  Result := '';
  for I := 0 to High(Args) do begin
    Result := Result + ' - Args['+IntToStr(I)+'] = ';
    try
      if I=0 then
        Result := Result + GetMsgIDString(Args[0]) 
      else begin
        Str := Args[I];
        Result := Result + Str;
      end;
    except
      Result := Result + '##conversion failed';
    end;
  end;
end;  

function GetArgsStr2(const Args: Array of Variant): String;
var 
  I : Integer;
  Str : String;
begin
  Result := '';
  for I := 0 to High(Args) do begin
    Result := Result + ' - Args['+IntToStr(I)+'] = ';
    try
      Str := Args[I];
      Result := Result + Str;
    except
      Result := Result + '##conversion failed';
    end;
  end;
end;  

procedure TncMWServRemoto.MWMessage(Sender: TObject;
  const TransportStream: TkbmMWCustomMessageTransportStream;
  const Args: TkbmMWArrayVariant; UserStream: TMemoryStream);
var 
  Evento, T: Integer;  
  S : TMemoryStream;
  msgDestroi : PmsgDestroiObj;
  msgShutdown : PmsgShutdown;
  msgObtemProc : PmsgObtemProcessos;
  msgFinalizaProc : PmsgFinalizaProcesso;
  msgHorario : PmsgHorarioEv;
  msgSuporteRem : PmsgSuporteRemEv;
  msgCapturaTela : PmsgCapturaTela;

begin
  if not FLoginOk then begin
    DebugMsg(Self.ClassName + '.MWMessage - FLoginOk = False' + GetArgsStr(Args));
    Exit;
  end;
  DebugMsg(Self.ClassName + '.MWMessage' + GetArgsStr(Args));
  FTicksLastCom := GetTickCount;
  Evento := Args[0];
  case Evento of
    ncmc_AtualizaObj, ncmc_NovoObj, ncmc_ChatEv, ncmc_SiteBloqueado : begin
      S := TMemoryStream.Create;
      UserStream.Position := 0;
      T := UserStream.Size;
      if T=9994884 then
        Exit;
      S.LoadFromStream(UserStream);
      S.Position := 0;
      EnviaEvento(Evento, S);
    end;
    ncmc_DestroiObj : begin
      New(msgDestroi);
      msgDestroi^.msgTipoClasse := Args[1];
      msgDestroi^.msgChave := Args[2];
      EnviaEvento(ncmc_DestroiObj, msgDestroi);
    end;
    ncmc_ServidorDesativado : Ativo := False;
    ncmc_CapturaTela        : begin
      New(msgCapturaTela);
      msgCapturaTela^.msgSession := Args[0];
      msgCapturaTela^.msgMaq := Args[1];
      EnviaEvento(ncmc_CapturaTela, msgCapturaTela);
    end;
    ncmc_Shutdown           : begin
      New(msgShutdown);
      msgShutdown^.msgMaq := Args[1];
      msgShutdown^.msgOper := Args[2];
      EnviaEvento(ncmc_Shutdown, msgShutdown);
    end;
    ncmc_AbriuFechouCaixa   : EnviaEvento(Evento, nil);
    ncmc_ObtemProcessos     : begin
      New(msgObtemProc);
      msgObtemProc^.msgIDCliente := Args[1];
      msgObtemProc^.msgIDRequest := Args[2];
      msgObtemProc^.msgMaq := Args[3];
      EnviaEvento(Evento, msgObtemProc);
    end;
    ncmc_FinalizaProcesso   : begin
      New(msgFinalizaProc);
      msgFinalizaProc^.msgProcessID := Args[1];
      msgFinalizaProc^.msgMaq := Args[2];
      EnviaEvento(Evento, msgFinalizaProc);
    end;
    ncmc_ChecaLicEv         : if FMaq=Args[1] then EnviaEvento(Evento, nil);
    ncmc_SuporteRemEv       : begin
      New(msgSuporteRem);
      msgSuporteRem^.msgMaq := Args[1];
      msgSuporteRem^.msgTec := Args[2];
      EnviaEvento(Evento, msgSuporteRem);
    end;
    ncmc_HorarioEv          : begin
      New(msgHorario);
      msgHorario^.msgHora := Args[1];
      EnviaEvento(Evento, msgHorario);
    end;
  end;
end;

function TncMWServRemoto.ObtemPastaServ(var NomePastaServ: String): Integer;
begin
  Result := Request('ObtemPastaServ', []);
  if Result=0 then begin
    NomePastaServ := FLastRes[1];
    FLastRes := null;
  end;
end;

function TncMWServRemoto.ObtemPatrocinios(aSL: TStrings): Integer;
begin
  Result := Request('ObtemPatrocinios', []);
  if Result=0 then begin
    aSL.Text := FLastRes[1];
    FLastRes := null;
  end;
end;

function TncMWServRemoto.ObtemProcessos(aMaq: Word; aIDCliente,
  aIDReq: Integer): Integer;
begin
  Result := Request('ObtemProcessos', [aMaq, aIDCliente, aIDReq]);
end;

function TncMWServRemoto.ObtemSenhaCli(Codigo: Integer;
  var Senha: String): Integer;
begin
  Result := Request('ObtemSenhaCli', [Codigo]);
  if Result=0 then begin
    Senha := FLastRes[1];
    FLastRes := null;
  end;
end;

function TncMWServRemoto.ObtemSitesBloqueados(var S: String): Integer;
begin
  Result := Request('ObtemSitesBloqueados', []);
  if Result=0 then begin
    S := FLastRes[1];
    FLastRes := null;
  end;
end;

function TncMWServRemoto.ObtemStreamAvisos(S: TStream): integer;
begin
  Result := Request('ObtemStreamAvisos', []);
  if Result=0 then begin
    kbmMWVariantToStream(FLastRes[1], S);
    FLastRes := null;
  end;
end;

function TncMWServRemoto.ObtemStreamConfig(S: TStream): integer;
begin
  Result := Request('ObtemStreamConfig', []);
  if Result=0 then begin
    kbmMWVariantToStream(FLastRes[1], S);
    FLastRes := null;
  end;
end;

function TncMWServRemoto.ObtemStreamListaObj(Cliente, TipoClasse: Integer;
  S: TStream): Integer;
begin
  Result := Request('ObtemStreamListaObj', [Cliente, TipoClasse]);
  if Result=0 then begin
    kbmMWVariantToStream(FLastRes[1], S);
    FLastRes := null;
  end;
end;

function TncMWServRemoto.ObtemVersaoGuard(var Versao: Integer): Integer;
begin
  Result := Request('ObtemVersaoGuard', []);
  if Result=0 then Versao := FLastRes[1];
end;

procedure TncMWServRemoto.OnConnectionLost(Sender: TObject);
begin
  inherited SetAtivo(False);
end;

procedure TncMWServRemoto.OnDisconnected(Sender: TObject;
  Info: TkbmMWCustomTransportInfo);
begin
  inherited SetAtivo(False);
end;

procedure TncMWServRemoto.OnFileProgress(Sender: TObject; Pct: integer;
  Receiving: boolean; var Terminate: boolean);
begin
  if Assigned(FOnProgressoArq) then
    FOnProgressoArq(Pct, 1, FArquivo, Receiving);
end;

function TncMWServRemoto.PararTempoMaq(aMaq: Word; aParar: Boolean): Integer;
begin
  Result := Request('PararTempoMaq', [aMaq, aParar]);
end;

function TncMWServRemoto.PermitirDownload(aSessao: Integer;
  aPermitir: Boolean): Integer;
begin
  Result := Request('PermitirDownload', [aSessao, aPermitir]);
end;

function TncMWServRemoto.PreLogoutMaq(aMaq: Word): Integer;
begin
  Result := Request('PreLogoutMaq', [aMaq]);
end;

function TncMWServRemoto.RefreshEspera: Integer;
begin
  Result := Request('RefreshEspera', []);
end;

function TncMWServRemoto.RefreshPrecos: integer;
begin
  Result := Request('RefreshPrecos', []);
end;

function TncMWServRemoto.RegistraPaginasImpressas(aMaq: Word; aPaginas: Integer;
  aImp, aDoc: String): Integer;
begin
  Result := Request('RegistraPaginasImpressas', [aMaq, aPaginas, aImp, aDoc]);
end;

function TncMWServRemoto.ReprocCaixa(aFunc: String; aID: Integer): Integer;
begin
  Result := Request('ReprocCaixa', [aFunc, aID]);
end;

function TncMWServRemoto.Request(aCmd: String;
  const Args: array of Variant): Integer;
begin
  FTicksLastCom := GetTickCount;
  try
    DebugMsg('TncMWServRemoto.Request - aCmd: ' + aCmd + GetArgsStr2(Args));
    if not FAtivo then begin
      DebugMsg('TnxMWServRemoto - FAtivo = False)');
      Result := ncerrConexaoPerdida;
      Exit;
    end;
    FLastRes := FClient.SendRequest(SvcName, SvcVersion, aCmd, Args);
  except
    on E: Exception do begin
      DebugMsg('TncMWServRemoto.Request - Exception: ' + E.Message);
      if Pos('Response for request', E.Message)=1 then begin
        Result := ncerrConexaoPerdida;
        FTransp.Disconnect;
        Exit;
      end else 
        Raise;
    end;
  end;
  if VarIsArray(FLastRes) then
    Result := FLastRes[0] else
    Result := FLastRes;
end;

function TncMWServRemoto.SalvaCredTempo(aObj: TObject): Integer;
var S: TMemoryStream;
begin
  S := TMemoryStream.Create;
  try
    TncCredTempo(aObj).SaveToStream(S);
    S.Position := 0;
    Result := Request('SalvaCredTempo', [kbmMWStreamToVariant(S)]);
  finally
    S.Free;
  end;
end;

function TncMWServRemoto.SalvaDebito(aObj: TObject): Integer;
var S: TMemoryStream;
begin
  S := TMemoryStream.Create;
  try
    TncDebito(aObj).SalvaStream(S, False);
    S.Position := 0;
    Result := Request('SalvaDebito', [kbmMWStreamToVariant(S)]);
  finally
    S.Free;
  end;
end;

function TncMWServRemoto.SalvaDebTempo(aObj: TObject): Integer;
var S: TMemoryStream;
begin
  S := TMemoryStream.Create;
  try
    TncDebTempo(aObj).SalvaStream(S, False);
    S.Position := 0;
    Result := Request('SalvaDebTempo', [kbmMWStreamToVariant(S)]);
  finally
    S.Free;
  end;
end;

function TncMWServRemoto.SalvaImpressao(aObj: TObject): Integer;
var S: TMemoryStream;
begin
  S := TMemoryStream.Create;
  try
    TncImpressao(aObj).SaveToStream(S);
    S.Position := 0;
    Result := Request('SalvaImpressao', [kbmMWStreamToVariant(S)]);
  finally
    S.Free;
  end;
end;

function TncMWServRemoto.SalvaLancExtra(aObj: TObject): Integer;
var S: TMemoryStream;
begin
  S := TMemoryStream.Create;
  try
    TncLancExtra(aObj).SalvaStream(S, False);
    S.Position := 0;
    Result := Request('SalvaLancExtra', [kbmMWStreamToVariant(S)]);
  finally
    S.Free;
  end;
end;

function TncMWServRemoto.SalvaLic(aLic: String): Integer;
begin
  Result := Request('SalvaLic', [aLic]);
end;

function TncMWServRemoto.SalvaLogAppUrl(S: TStream): Integer;
begin
  Result := Request('SalvaLogAppUrl', [kbmMWStreamToVariant(S)]);
end;

function TncMWServRemoto.SalvaMovEst(aObj: TObject): Integer;
var S: TMemoryStream;
begin
  S := TMemoryStream.Create;
  try
    TncMovEst(aObj).SalvaStream(S, False);
    S.Position := 0;
    Result := Request('SalvaMovEst', [kbmMWStreamToVariant(S)]);
  finally
    S.Free;
  end;
end;

function TncMWServRemoto.SalvaProcessos(aIDCliente, aRequest: Integer;
  aSL: TStrings): Integer;
begin
  Result := Request('SalvaProcessos', [aIDCliente, aRequest, aSL.Text]);
end;

function TncMWServRemoto.SalvaSenhaCli(Codigo: Integer; Senha: String): Integer;
begin
  Result := Request('SalvaSenhaCli', [Codigo, Senha]);
end;

function TncMWServRemoto.SalvaStreamObj(Novo: Boolean; S: TStream): Integer;
begin
  Result := Request('SalvaStreamObj', [Novo, kbmMWStreamToVariant(S)]);
end;

function TncMWServRemoto.SalvaTelaMaq(aMaq: Word; S: TMemoryStream): integer;
begin
  Result := Request('SalvaTelaMaq', [aMaq, kbmMWStreamToVariant(S)]);
end;

procedure TncMWServRemoto.SetAtivo(Valor: Boolean);
begin
  FLoginOk       := False;
  FTransp.Active := False;
  if Valor then
    try
      FTransp.NodeID := kbmmwGenerateUniqueNodeID + '_' +
                        IntToStr(Random(High(Integer)));
    except
      FTransp.NodeID := IntToStr(Random(High(Integer)))+'_'+
                        IntToStr(Random(High(Integer)));
    end;
  FTransp.Active := Valor;
  inherited;
end;

procedure TncMWServRemoto.SetHost(const Value: String);
begin
  FTransp.Host := Value;
end;

function TncMWServRemoto.ShutdownMaq(aMaq, aOper: Word): integer;
begin
  Result := Request('ShutdownMaq', [aMaq, aOper]);
end;

function TncMWServRemoto.SuporteRem(aMaq, aTec: Word): Integer;
begin
  Result := Request('SuporteRem', [aMaq, aTec]);
end;

function TncMWServRemoto.TransferirMaq(aOrigem, aDestino: Word): Integer;
begin
  Result := Request('TransferirMaq', [aOrigem, aDestino]);
end;

function TncMWServRemoto.Upload(aFonte, aDestino: String): Integer;
begin
  FArquivo := aFonte;
  if Assigned(FOnProgressoArq) then
    FOnProgressoArq(0, 0, aFonte, True);
  try  
    FClient.PutFile(aFonte, aDestino);
    Result := 0;
    if Assigned(FOnProgressoArq) then
      FOnProgressoArq(100, 2, aFonte, True);
  except
    Result := ncerrFalhaTransfArq;
    if Assigned(FOnProgressoArq) then
      FOnProgressoArq(-1, 2, aFonte, True);
  end;
end;

procedure Register;
begin
  RegisterComponents('NexCafe', [TncMWServRemoto]);
end;

initialization
  randomize;

end.
