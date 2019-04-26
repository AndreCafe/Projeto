{***************************************************************}
{* NexusDB Client Messaging                                       *}
{* Provides the ability for NexusDB clients to send messages      *}
{* to other clients.                                              *}
{******************************************************************}
{* Unit contains client side components                           *}
{******************************************************************}
{* Released as freeware                                           *}
{* Authors:  Nathan Sutcliffe, Terry Haan                         *}
{******************************************************************}

unit ncNXServRemoto;

interface

uses
  Windows,
  Classes,
  Messages,
  Forms,
  nxllComponent,
  nxllMemoryManager,
  nxllTypes,
  nxllTransport,
  nxllPluginBase,
  nxllDataMessageQueue,
  nxptBasePooledTransport,
  ncNetMsg,
  nxllBDE,
  ncErros,
  ncClassesBase;

const
  cm_ncnxProcessMsg = WM_USER + 4000;

type

  TncnxProcessMsgProc = procedure (Msg : PnxDataMessage) of object;

  TncnxRemotePlugin = class(TnxBasePluginEngine)
  private
    FMsgQueue: TnxDataMessageQueue;
    FProcessMsgProc : TncnxProcessMsgProc;
    FHWnd: HWND;

    procedure PluginMsgHandler( var aMsg: TMessage );
    procedure msgProcessMsg( var aMsg: TMessage ); message cm_ncnxProcessMsg;

  protected
    procedure LogEvent(aString: string);

    class function bpeIsRemote: Boolean; override;

    procedure ProcessReceivedMessage( aMsg: PnxDataMessage );

  public
    constructor Create( aOwner: TComponent ); override;
    destructor Destroy; override;

    property ProcessMsgProc: TncnxProcessMsgProc
      read FProcessMsgProc write FProcessMsgProc;
  end;


  TncnxRemoteCmdHandler = class(TnxBasePluginCommandHandler)
  private
    procedure rmchSetPluginEngine( const aPlugin: TncnxRemotePlugin );
    function rmchGetPluginEngine: TncnxRemotePlugin;
  public
    procedure bpchProcess( aMsg: PnxDataMessage;
                           var aHandled: Boolean ); override;

  published
    property PluginEngine: TncnxRemotePlugin
      read rmchGetPluginEngine
      write rmchSetPluginEngine;
  end;

  TncSalvaTelaEv = procedure (Sender: TObject; aMaq: Word; aJpg: TMemoryStream) of object;
  TncProgressoArqEv = procedure(Perc: Integer; Etapa: Byte; NomeArq: String; Download: Boolean) of object;
  

  TncNXServRemoto = class(TncServidorBase)
  private
    FTransp    : TnxBasePooledTransport;
    FRemPlugin : TncnxRemotePlugin;
    FCmdHandler : TncnxRemoteCmdHandler;
    FSalvaTelaEv : TncSalvaTelaEv;
    FOnProgressoArq : TncProgressoArqEv;
    FTicksLastCom : Cardinal;
    function GetCmdHandler: TnxBaseCommandHandler;
    function GetSession: TnxStateComponent;
    procedure SetCmdHandler(const Value: TnxBaseCommandHandler);
    procedure SetSession(const Value: TnxStateComponent);
    procedure ProcessMsgProc(Msg : PnxDataMessage);

    function ProcessRequest(aMsgID          : TnxMsgID;
                            aRequestData    : Pointer;
                            aRequestDataLen : TnxWord32;
                            aReply          : PPointer;
                            aReplyLen       : PnxWord32;
                            aReplyType      : TnxNetMsgDataType)
                                            : TnxResult;
    
  protected
    procedure SetAtivo(Valor: Boolean); override;
  
    procedure nmMsgComEv(var Msg : TnxDataMessage); 
      message ncnmMsgComEv;
      
    procedure nmChecaLicEv(var Msg : TnxDataMessage); 
      message ncnmChecaLicEv;
      
    procedure nmHorarioEv(var Msg : TnxDataMessage); 
      message ncnmHorarioEv;
      
    procedure nmCapturaTelaEv(var Msg : TnxDataMessage); 
      message ncnmCapturaTelaEv;
      
    procedure nmSalvaTelaEv(var Msg : TnxDataMessage); 
      message ncnmSalvaTelaEv;
      
    procedure nmFinalizaProcessoEv(var Msg : TnxDataMessage); 
      message ncnmFinalizaProcessoEv;
      
    procedure nmShutdownEv(var Msg : TnxDataMessage); 
      message ncnmShutdownEv;
      
    procedure nmSuporteRemEv(var Msg : TnxDataMessage); 
      message ncnmSuporteRemEv;
      
    procedure nmObtemProcessosEv(var Msg : TnxDataMessage); 
      message ncnmObtemProcessosEv;
  
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function KeepAlive: Integer;

    function Upload(aFonte, aDestino: String): Integer; override;
    function Download(aFonte, aDestino: String): Integer; override;
    function ObtemVersaoGuard(var Versao: Integer): Integer; override;
    
    function SalvaStreamObj(Novo: Boolean; S: TStream): Integer; override;
    function ObtemStreamConfig(S: TStream): Integer; override;
    function ObtemStreamAvisos(S: TStream): Integer; override;
    function ObtemStreamListaObj(Cliente: Integer; TipoClasse: Integer; S: TStream): Integer; override;
    function ApagaObj(Cliente: Integer; TipoClasse: Integer; Chave: String): Integer; override;

    function AbreCaixa(aFunc: String; var NovoCx: Integer): Integer; override;
    function FechaCaixa(aFunc: String; aID: Integer): Integer; override;
    function CorrigeDataCaixa(aFunc: String; aID: Integer; aNovaAbertura, aNovoFechamento: TDateTime): integer; override;
    function AjustaPontosFid(aFunc: String; aCliente: Integer; aFator: Smallint; aPontos: Double; aObs: String): Integer; override;
    
    function CapturaTelaMaq(aMaq: Word): integer; override;
    function SalvaTelaMaq(aSessionID: Integer; aMaq: Word; S: TMemoryStream): integer; override;
    
    function LoginMaq(aSessao: TObject): Integer; override;
    function LogoutMaq(aMaq: Word): Integer; override;
    function AlteraSessao(aSessao: Tobject): Integer; override;
    function ForceRefreshSessao(aSessao: Integer): Integer; override;
    
    function SalvaCredTempo(aObj: TObject): Integer; override;
    function SalvaMovEst(aObj: TObject): Integer; override;
    function SalvaDebito(aObj: TObject): Integer; override;
    function SalvaLancExtra(aObj: TObject): Integer; override;
    function SalvaDebTempo(aObj: TObject): Integer; override;
    function SalvaImpressao(aObj: TObject): Integer; override;

    function SalvaLogAppUrl(S: TStream): Integer; override;

    function ObtemProcessos(aMaq: Word; aIDCliente, aIDReq: Integer): integer; override;
    function ObtemPatrocinios(aSL: TStrings): Integer; override;
    
    function FinalizaProcesso(aMaq: Word; aProcessID: Integer): Integer; override;
    function SalvaProcessos(aIDCliente, aRequest: Integer; aSL: TStrings): Integer; override;
    function RefreshEspera: Integer; override;
    
    function AdicionaPassaporte(aMaq: Word; aSenha: String): Integer; override;
    function RegistraPaginasImpressas(aMaq: Word; aPaginas: Integer; aImp, aDoc: String): Integer; override;
    
    function PararTempoMaq(aMaq: Word; aParar: Boolean): Integer; override;
    function TransferirMaq(aOrigem, aDestino: Word): Integer; override;
    function PermitirDownload(aSessao: Integer; aPermitir: Boolean): Integer; override;
    
    function PreLogoutMaq(aMaq: Word): Integer; override;
    function CancLogoutMaq(aMaq: Word): Integer; override;
    function CancelaTran(aID: Integer; aFunc: String): integer; override;
      
    function ObtemPastaServ(var NomePastaServ: String): Integer; override;
    function ArqFundoEnviado(NomeArq: String): Integer; override;
    function ObtemSenhaCli(Codigo: Integer; var Senha: String): Integer; override;
    function SalvaSenhaCli(Codigo: Integer; Senha: String): Integer; override;
    function LimpaFundo(Desktop: Boolean): Integer; override;

    function EnviarMsg(const aDe, aPara: Integer; const aTexto: String): Integer; override;

    function RefreshPrecos: integer; override;
    function ShutdownMaq(aMaq, aOper: Word): integer; override;
    function SuporteRem(aMaq, aTec: Word): Integer; override;
    
    function ObtemSitesBloqueados(var S: String): Integer; override;
    
    function Login(aUsername, aSenha: String; aMaq: Word; aFuncAtual: Boolean; aRemoto: Boolean; aWndHandle: HWND; aProxyHandle: Integer; aSocket: Integer; aSession: Integer; aIP: String; var Handle: Integer): Integer; override;
    function ModoManutencao(aMaq: Word; aUsername, aSenha: String; aEntrar: Boolean): Integer; override;

    function SalvaLic(aLic: String): Integer; override;

    procedure Logout(Cliente: Integer); override;

    property TicksLastCom: Cardinal read FTicksLastCom;
    
  published   
    property OnProgressoArq: TncProgressoArqEv        
      read FOnProgressoArq write FOnProgressoArq;

    property Transp: TnxBasePooledTransport
      read FTransp write FTransp;  
      
    property CmdHandler : TnxBaseCommandHandler
      read GetCmdHandler write SetCmdHandler;

    property Session : TnxStateComponent
      read GetSession write SetSession;

    property OnSalvaTela: TncSalvaTelaEv
      read FSalvaTelaEv write FSalvaTelaEv;  
  end;


procedure Register;


implementation


uses
  SysUtils,
  nxstMessages,
  nxllStreams, ncMsgCom, ncSessao, ncMovEst, ncCredTempo, ncDebTempo, ncDebito,
  ncImpressao, ncLancExtra, ncDebug;



procedure Register;
begin
  RegisterComponents('NexCafe', [TncNXServRemoto]);
end;



{ TncnxRemotePlugin }


constructor TncnxRemotePlugin.Create(aOwner: TComponent);
begin
  inherited;
  FMsgQueue := TnxDataMessageQueue.Create;
  FHWnd := Classes.AllocateHWnd(PluginMsgHandler);
  FProcessMsgProc := nil;
end;


destructor TncnxRemotePlugin.Destroy;
begin
  Classes.DeallocateHWnd(FHWnd);
  FreeAndNil(FMsgQueue);
  inherited;
end;


procedure TncnxRemotePlugin.LogEvent(aString: string);
begin
  if Assigned(EventLog) then
    EventLog.WriteString(aString);
end;


class function TncnxRemotePlugin.bpeIsRemote: Boolean;
begin
  Result := True;
end;

procedure TncnxRemotePlugin.ProcessReceivedMessage( aMsg: PnxDataMessage );
begin
  with aMsg^ do
    FMsgQueue.Push( Self,
                                dmMsg,
                                dmSessionId,
                                dmRequestId,
                                0,
                                0,
                                dmData,
                                dmDataLen );

  // Post a message to our window handle.  This way, we don't call the events
  // in the context of the NexusDB thread.  Also, we can return control to the
  // calling thread right away.
  Windows.PostMessage(FHWnd, cm_ncnxProcessMsg, 0, 0);
end;


procedure TncnxRemotePlugin.msgProcessMsg( var aMsg: TMessage );
var Msg: PnxDataMessage;
begin
  Msg := FMsgQueue.Pop;
  while Assigned( Msg ) do begin
    try
      if Assigned(FProcessMsgProc) then FProcessMsgProc(Msg);
    finally
      // better free the message
      if Assigned( Msg^.dmData ) then
        nxFreeMem( Msg^.dmData, Msg^.dmDataLen );
      nxFreeMem( Msg, sizeOf(TnxDataMessage ));
    end;
    Msg := FMsgQueue.Pop;
  end;
end;


procedure TncnxRemotePlugin.PluginMsgHandler(var aMsg: TMessage);
begin
  if aMsg.Msg = WM_QUERYENDSESSION then
    aMsg.Result := 1
  else if aMsg.Msg = cm_ncnxProcessMsg then
    Dispatch( aMsg )
  else
    DefWindowProc( FHWnd, aMsg.Msg, aMsg.WParam, aMsg.LParam );
end;


{ TncnxRemoteCmdHandler }

procedure TncnxRemoteCmdHandler.bpchProcess( aMsg: PnxDataMessage;
                                                      var aHandled: Boolean);
begin
  with aMsg^ do
    if (dmMsg>=ncnmFirstEv) and (dmMsg<=ncnmLastEv) then begin
      PluginEngine.ProcessReceivedMessage( aMsg );
      aHandled := True;
    end;
end;


procedure TncnxRemoteCmdHandler.rmchSetPluginEngine( const aPlugin: TncnxRemotePlugin );
begin
  bpchSetPluginEngine( aPlugin );
end;


function TncnxRemoteCmdHandler.rmchGetPluginEngine: TncnxRemotePlugin;
begin
  Result := TncnxRemotePlugin( bpchPluginEngine );
end;

{ TncNXServRemoto }

constructor TncNXServRemoto.Create(AOwner: TComponent);
begin
  inherited;
  FTicksLastCom := 0;
  FRemPlugin := TncnxRemotePlugin.Create(Self);
  FCmdHandler := TncnxRemoteCmdHandler.Create(Self);
  FCmdHandler.PluginEngine := FRemPlugin;
  FRemPlugin.ProcessMsgProc := Self.ProcessMsgProc;
  FTransp := nil;
  FSalvaTelaEv := nil;
  FOnProgressoArq := nil;
end;

destructor TncNXServRemoto.Destroy;
begin
  FCmdHandler.CommandHandler := nil;
  FreeAndNil(FCmdHandler);
  FreeAndNil(FRemPlugin);
  inherited;
end;

function TncNXServRemoto.Download(aFonte, aDestino: String): Integer;
var 
  S: TMemoryStream;
  Req : TnmNomeArq;
  
begin                  
  Req.nmNomeArq := aFonte;
  S := TMemoryStream.Create;
  try
    if Assigned(FOnProgressoArq) then FOnProgressoArq(0, 0, aDestino, True);
    Result := ProcessRequest(ncnmDownloadArq, @Req, SizeOf(Req), @S, nil, nmdStream);
    if Result=0 then begin
      S.SaveToFile(aDestino);
    end;
  finally
    S.Free;
  end;
  if (Result=0) and Assigned(FOnProgressoArq) then
    FOnProgressoArq(100, 2, aDestino, True);
end;

function TncNXServRemoto.GetCmdHandler: TnxBaseCommandHandler;
begin
  Result := FCmdHandler.CommandHandler;
end;

function TncNXServRemoto.GetSession: TnxStateComponent;
begin
  Result := FRemPlugin.Session;
end;

procedure TncNXServRemoto.nmCapturaTelaEv(var Msg: TnxDataMessage);
var M: PmsgCapturaTela;
begin
  New(M);
  Move(Msg.dmData^, M^, Msg.dmDataLen);
  EnviaEvento(ncmc_CapturaTela, M);
end;

procedure TncNXServRemoto.nmChecaLicEv(var Msg: TnxDataMessage);
begin
  EnviaEvento(ncmc_ChecaLicEv, nil);
end;

procedure TncNXServRemoto.nmFinalizaProcessoEv(var Msg: TnxDataMessage);
var M : PmsgFinalizaProcesso;
begin
  New(M);
  Move(Msg.dmData^, M^, Msg.dmDataLen);
  EnviaEvento(ncmc_FinalizaProcesso, M);
end;

procedure TncNXServRemoto.nmHorarioEv(var Msg: TnxDataMessage);
var M : PmsgHorarioEv;
begin
  New(M);
  Move(Msg.dmData^, M^, Msg.dmDataLen);
  EnviaEvento(ncmc_HorarioEv, M);
end;

procedure TncNXServRemoto.nmMsgComEv(var Msg: TnxDataMessage);
var 
  S: TMemoryStream;
  Dados : Pointer;
begin
  with TnmMsgCom(Msg.dmData^) do begin
    if ObtemTipoDados(nmMsgID)=tdStream then begin
      S := TMemoryStream.Create;
      S.SetSize(nmDataLength);
      Move(nmData, S.Memory^, nmDataLength);
      EnviaEvento(nmMsgID, S);
    end else begin
      GetMem(Dados, nmDataLength);
      Move(nmData, Dados^, nmDataLength);
      EnviaEvento(nmMsgID, Dados);
    end;
  end;
end;

procedure TncNXServRemoto.nmObtemProcessosEv(var Msg: TnxDataMessage);
var M : PmsgObtemProcessos;
begin
  New(M);
  Move(Msg.dmData^, M^, Msg.dmDataLen);
  EnviaEvento(ncmc_ObtemProcessos, M);
end;

procedure TncNXServRemoto.nmSalvaTelaEv(var Msg: TnxDataMessage);
var S: TMemoryStream;
begin
  if not Assigned(FSalvaTelaEv) then Exit;

  with TnmSalvaTela(Msg.dmData^) do begin
    S := TMemoryStream.Create;
    try
      S.SetSize(nmJpgLen);
      Move(nmJpg, S.Memory^, nmJpgLen);
      FSalvaTelaEv(Self, nmMaq, S);
    finally
      S.Free;  
    end;
  end;
end;

procedure TncNXServRemoto.nmShutdownEv(var Msg: TnxDataMessage);
var M : PmsgShutdown;
begin
  New(M);
  Move(Msg.dmData^, M^, Msg.dmDataLen);
  EnviaEvento(ncmc_Shutdown, M);
end;

procedure TncNXServRemoto.nmSuporteRemEv(var Msg: TnxDataMessage);
var M : PmsgSuporteRemEv;
begin
  New(M);
  Move(Msg.dmData^, M^, Msg.dmDataLen);
  EnviaEvento(ncmc_SuporteRemEv, M);
end;

procedure TncNXServRemoto.ProcessMsgProc(Msg: PnxDataMessage);
begin
  Dispatch(Msg^);
end;

function TncNXServRemoto.ProcessRequest(aMsgID: TnxMsgID; aRequestData: Pointer;
  aRequestDataLen: TnxWord32; aReply: PPointer; aReplyLen: PnxWord32;
  aReplyType: TnxNetMsgDataType): TnxResult;
var SaveTimeout : TnxWord32;  
begin
  if (aMsgID=ncnmDownloadArq) or (aMsgID=ncnmUploadArq) then begin
    SaveTimeout := FremPlugin.Timeout;
    if FRemPlugin.Timeout<60000 then
      FRemPlugin.Timeout := 60000;
  end;
  try
    Result := FRemPlugin.bpeProcessRequest(aMsgID, aRequestData, aRequestDataLen, aReply, aReplyLen, aReplyType);
  finally
    if (aMsgID=ncnmDownloadArq) or (aMsgID=ncnmUploadArq) then
      FRemPlugin.Timeout := SaveTimeout;
  end;
  FTicksLastCom := GetTickCount;
  if (Result>ncerrUltimo) and (aMsgID<>ncnmLogout) then begin
    Result := ncerrConexaoPerdida;
    SetAtivo(False);
  end;
end;

procedure TncNXServRemoto.SetAtivo(Valor: Boolean);
begin
  try
    if Valor and Assigned(FTransp) then FTransp.Active := True;
    FRemPlugin.Active := Valor;
    FCmdHandler.Active := Valor;
    if Assigned(FRemPlugin.Session) then
      FRemPlugin.Session.Active := Valor;
    if (not Valor) and Assigned(FTransp) then FTransp.Active := False;
    if Assigned(FCmdHandler.CommandHandler) then
      FCmdHandler.CommandHandler.Active := True;
  except
    On E: EnxPooledTransportException do begin
      DebugMsg('TncNXServRemoto.SetAtivo - Valor: ' + BoolString[Valor] + 
        ' - Exception: ' + E.Message + 
        ' - ErrorCode: ' + IntToStr(E.ErrorCode) + 
        ' - OS Error: ' + IntToStr(E.OSError));
      Raise EErroNexCafe.Create(ncerrFalhaConexao);
    end;
    On E: Exception do Raise;
  end;
  inherited;
end;

procedure TncNXServRemoto.SetCmdHandler(const Value: TnxBaseCommandHandler);
begin
  FCmdHandler.CommandHandler := Value;
end;

procedure TncNXServRemoto.SetSession(const Value: TnxStateComponent);
begin
  FRemPlugin.Session := Value;
end;

function TncNXServRemoto.EnviarMsg(const aDe, aPara: Integer;
  const aTexto: String): Integer;
var 
  SL : TStrings;  
  S: TMemoryStream;
begin
  SL := TStringList.Create;
  S := TMemoryStream.Create;
  try
    SL.Values['de'] := IntToStr(aDe);
    SL.Values['para'] := IntToStr(aPara);
    SL.Values['datahora'] := '0';
    SL.Values['id'] := '0';
    SL.Add(aTexto);
    SL.SaveToStream(S);
    Result := ProcessRequest(ncnmEnviaChat, S.Memory, S.Size, nil, nil, nmdByteArray);
  finally
    SL.Free;
    S.Free;
  end;
end;

function TncNXServRemoto.FechaCaixa(aFunc: String; aID: Integer): Integer;
var Req: TnmFechaCaixaReq;
begin
  Req.nmFunc := aFunc;
  Req.nmID   := aID;
  Result := ProcessRequest(ncnmFechaCaixa, @Req, SizeOf(Req), nil, nil, nmdByteArray);
end;

function TncNXServRemoto.FinalizaProcesso(aMaq: Word;
  aProcessID: Integer): Integer;
var Req: TnmFinalizaProcesso;  
begin
  Req.nmProcessID := aProcessID;
  Req.nmMaq       := aMaq;
  Result := ProcessRequest(ncnmFinalizaProcesso, @Req, SizeOf(Req), 
                                nil, nil, nmdByteArray);
end;

function TncNXServRemoto.ForceRefreshSessao(aSessao: Integer): Integer;
var Req : TnmSessao;
begin
  Req.nmSessao := aSessao;
  Result := ProcessRequest(ncnmRefreshSessao, @Req, SizeOf(Req), 
                                nil, nil, nmdByteArray);
end;

function TncNXServRemoto.KeepAlive: Integer;
begin
  Result := ProcessRequest(ncnmKeepAlive, nil, 0,  nil, nil, nmdByteArray);
end;

function TncNXServRemoto.Login(aUsername, aSenha: String; aMaq: Word;
  aFuncAtual: Boolean; aRemoto: Boolean; aWndHandle: HWND; aProxyHandle: Integer;
  aSocket: Integer; aSession: Integer; aIP: String; var Handle: Integer): Integer;
var
  Request : TnmLoginReq;
  ReplyLen : TnxWord32;
  P : Pointer;
begin
  Request.nmUsername := aUsername;
  Request.nmSenha := aSenha;
  Request.nmFuncAtual := aFuncAtual;
  Request.nmProxyHandle := aProxyHandle;
  Request.nmMaq := aMaq;
  try
    Result := ProcessRequest(ncnmLogin, @Request, SizeOf(Request), @P, @ReplyLen, nmdByteArray);
    Move(P^, Handle, SizeOf(Integer));
  finally
    if Assigned(P) then nxFreeMem(P, ReplyLen);
  end;
  if Result = 0 then
    inherited Login(aUsername, aSenha, aMaq, aFuncAtual, aRemoto, aWndHandle, aProxyHandle, aSocket, aSession, aIP, Handle);                                
end;

procedure TncNXServRemoto.Logout(Cliente: Integer);
begin
  inherited;
  ProcessRequest(ncnmLogout, @Cliente, SizeOf(Cliente), 
                       nil, nil, nmdByteArray);
end;

function TncNXServRemoto.ObtemStreamListaObj(Cliente,
  TipoClasse: Integer; S: TStream): Integer;
var Request : TnmObtemListaReq;  
begin
  Request.nmCliente := Cliente;
  Request.nmTipoClasse := TipoClasse;
  Result := ProcessRequest(ncnmObtemLista, @Request, SizeOf(Request), @S, nil, nmdStream);
end;

function TncNXServRemoto.ObtemVersaoGuard(var Versao: Integer): Integer;
var
  P : Pointer;
  ReplyLen : TnxWord32;
begin
  try
    Result := ProcessRequest(ncnmObtemVersaoGuard, nil, 0, @P, @ReplyLen, nmdByteArray);
    Move(P^, Versao, SizeOf(Versao));
  finally
    if Assigned(P) then nxFreeMem(P, ReplyLen);
  end;
end;

function TncNXServRemoto.AlteraSessao(aSessao: Tobject): Integer;
var  S: TMemoryStream;
begin
  S := TMemoryStream.Create;
  try
    TncSessao(aSessao).SalvaStream(S, False);
    S.Position := 0;
    Result := ProcessRequest(ncnmAlteraSessao, S.Memory, S.Size, nil, nil, nmdByteArray);
  finally
    S.Free;
  end;
end;

function TncNXServRemoto.ApagaObj(Cliente: Integer; TipoClasse: Integer; Chave: String): Integer;
var Request : TnmObj;
begin
  Request.nmCliente := Cliente;
  Request.nmTipoClasse := TipoClasse;
  Request.nmChave := Chave;
  Result := ProcessRequest(ncnmApagaObj, @Request, SizeOf(Request), 
                                 nil, nil, nmdByteArray);
end;


function TncNXServRemoto.ArqFundoEnviado(NomeArq: String): Integer;
var Request : TnmNomeArq;
begin
  Request.nmNomeArq := NomeArq;
  Result := ProcessRequest(ncnmArqFundoEnviado, @Request, SizeOf(Request), 
                                 nil, nil, nmdByteArray);
end;

function TncNXServRemoto.SalvaMovEst(aObj: TObject): Integer; 
var S: TMemoryStream;
begin
  S := TMemoryStream.Create;
  try
    TncMovEst(aObj).SalvaStream(S, False);
    S.Position := 0;
    Result := ProcessRequest(ncnmSalvaMovEst, S.Memory, S.Size, nil, nil, nmdByteArray);
    
  finally
    S.Free;
  end;
end;

function TncNXServRemoto.SalvaProcessos(aIDCliente, aRequest: Integer;
  aSL: TStrings): Integer;
var S: TMemoryStream;
begin
  aSL.Insert(0, IntToStr(aIDCliente));
  aSL.Insert(1, IntToStr(aRequest));
  S := TMemoryStream.Create;
  try
    aSL.SaveToStream(S);
    S.Position := 0;
    Result := ProcessRequest(ncnmSalvaProcessos, S.Memory, S.Size, nil, nil, nmdByteArray);
  finally
    S.Free;
  end;
end;

function TncNXServRemoto.SalvaCredTempo(aObj: TObject): Integer;
var S: TMemoryStream;
begin
  S := TMemoryStream.Create;
  try
    TncCredTempo(aObj).SaveToStream(S);
    S.Position := 0;
    Result := ProcessRequest(ncnmSalvaCredTempo, S.Memory, S.Size, nil, nil, nmdByteArray);
  finally
    S.Free;
  end;
end;

function TncNXServRemoto.SalvaDebito(aObj: TObject): Integer;
var S: TMemoryStream;
begin
  S := TMemoryStream.Create;
  try
    TncDebito(aObj).SalvaStream(S, False);
    S.Position := 0;
    Result := ProcessRequest(ncnmSalvaDebito, S.Memory, S.Size, nil, nil, nmdByteArray);
  finally
    S.Free;
  end;
end;

function TncNXServRemoto.SalvaDebTempo(aObj: TObject): Integer;
var S: TMemoryStream;
begin
  S := TMemoryStream.Create;
  try
    TncDebTempo(aObj).SalvaStream(S, False);
    S.Position := 0;
    Result := ProcessRequest(ncnmSalvaDebTempo, S.Memory, S.Size, nil, nil, nmdByteArray);
  finally
    S.Free;
  end;
end;

function TncNXServRemoto.SalvaImpressao(aObj: TObject): Integer;
var S: TMemoryStream;
begin
  S := TMemoryStream.Create;
  try
    TncImpressao(aObj).SaveToStream(S);
    S.Position := 0;
    Result := ProcessRequest(ncnmSalvaImpressao, S.Memory, S.Size, nil, nil, nmdByteArray);
    
  finally
    S.Free;
  end;
end;

function TncNXServRemoto.SalvaLancExtra(aObj: TObject): Integer;
var S: TMemoryStream;
begin
  S := TMemoryStream.Create;
  try
    TncLancExtra(aObj).SalvaStream(S, False);
    S.Position := 0;
    Result := ProcessRequest(ncnmSalvaLancExtra, S.Memory, S.Size, nil, nil, nmdByteArray);
  finally
    S.Free;
  end;
end;

function TncNXServRemoto.SalvaLic(aLic: String): Integer;
var 
  SL : TStrings;
  S  : TMemoryStream;
begin
  SL := TStringList.Create;
  try
    S := TMemoryStream.Create;
    try
      SL.Text := aLic;
      SL.SaveToStream(S);
      S.Position := 0;
      Result := ProcessRequest(ncnmSalvaLic, S.Memory, S.Size, nil, nil, nmdByteArray);    
    finally
      S.Free;
    end;
  finally
    SL.Free;
  end;
end;

function TncNXServRemoto.SalvaLogAppUrl(S: TStream): Integer;
begin
  Result := ProcessRequest(ncnmSalvaAppUrlLog, TMemoryStream(S).Memory, S.Size, nil, nil, nmdByteArray);
end;

function TncNXServRemoto.SalvaSenhaCli(Codigo: Integer;
  Senha: String): Integer;
var Request : TnmSenhaCli;
begin
  Request.nmCodigo := Codigo;
  Request.nmSenha  := Senha;
  Result := ProcessRequest(ncnmSalvaSenhaCli, @Request, SizeOf(Request), 
                                 nil, nil, nmdByteArray);
end;

function TncNXServRemoto.SalvaStreamObj(Novo: Boolean; S: TStream): Integer;
const
  ID_Msg : Array[Boolean] of Integer = (ncnmAlteraObj, ncnmNovoObj);
begin
  with FRemPlugin do
  Result := 
    bpeProcessRequest(ID_Msg[Novo], TMemoryStream(S).Memory, S.Size, nil, nil, nmdByteArray); 
end;

function TncNXServRemoto.CapturaTelaMaq(aMaq: Word): integer; 
var
  Req : TnmCapturaTela;
begin
  Req.nmMaq := aMaq;
  Result := ProcessRequest(ncnmCapturaTelaMaq, @Req, SizeOf(Req), nil, nil, nmdByteArray);
end;

function TncNXServRemoto.SalvaTelaMaq(aSessionID: Integer; aMaq: Word; S: TMemoryStream): integer;
var 
  Req : PnmSalvaTela;  
  ReqLen : Integer;
begin
  ReqLen := SizeOf( TnmSalvaTela ) - SizeOf( TnxVarMsgField ) + S.Size + 1;
  nxGetZeroMem(Req, ReqLen);
  try
    Req^.nmMaq := aMaq;
    Req^.nmSession := aSessionID;
    Req^.nmJpgLen := S.Size;
    Move(S.Memory^, Req^.nmJpg, S.Size);
    Result := ProcessRequest(ncnmSalvaTelaMaq, Req, ReqLen, nil, nil, nmdByteArray);
  finally
    nxFreeMem(Req, ReqLen);
  end;
end;

function TncNXServRemoto.TransferirMaq(aOrigem, aDestino: Word): Integer; 
var
  Req : TnmTransferirMaqReq;
begin
  Req.nmOrigem := aOrigem;
  Req.nmDestino := aDestino;
  Result := ProcessRequest(ncnmTransferirMaq, @Req, SizeOf(Req), nil, nil, nmdByteArray);
end;

function TncNXServRemoto.Upload(aFonte, aDestino: String): Integer;
var 
  Req : PnmUpload;
  S : TnxMemoryStream;
  ReqLen : Integer;
begin
  if not FileExists(aFonte) then begin
    Result := ncerrArqNaoEncontrado;
    Exit;
  end;
  S := TnxMemoryStream.Create;
  try
    S.LoadFromFile(aFonte);
    ReqLen := SizeOf( TnmUpload ) - SizeOf( TnxVarMsgField ) + S.Size + 1;
    nxGetZeroMem(Req, ReqLen);
    try
      Req^.nmNomeArq := aDestino;
      Req.nmTamanho := S.Size;
      Move(S.Memory^, Req^.nmArq, S.Size);
      Result := ProcessRequest(ncnmUploadArq, Req, ReqLen, nil, nil, nmdByteArray);
    finally
      nxFreeMem(Req, ReqLen);
    end;
  finally
    S.Free;
  end;
end;

function TncNXServRemoto.LimpaFundo(Desktop: Boolean): Integer;
var Req : TnmLimpaFundoReq;
begin
  Req.nmDesktop := Desktop;
  Result := ProcessRequest(ncnmLimpaFundo, @Req, SizeOf(Req), nil, nil, nmdByteArray);
end;

function TncNXServRemoto.PararTempoMaq(aMaq: Word; aParar: Boolean): Integer; 
var
  Req : TnmPararTempoMaqReq;
begin
  Req.nmMaq := aMaq;
  Req.nmParar := aParar;
  Result := ProcessRequest(ncnmPararTempoMaq, @Req, SizeOf(Req), nil, nil, nmdByteArray);
end;
  
function TncNXServRemoto.PermitirDownload(aSessao: Integer;
  aPermitir: Boolean): Integer;
var Req: TnmPermitirDownloadReq;
begin
  Req.nmSessao := aSessao;
  Req.nmPerm := aPermitir;  
  Result := ProcessRequest(ncnmPermitirDownload, @Req, SizeOf(Req), nil, nil, nmdByteArray);
end;

function TncNXServRemoto.LoginMaq(aSessao: TObject): Integer;
var  S: TMemoryStream;
begin
  S := TMemoryStream.Create;
  try
    TncSessao(aSessao).SalvaStream(S, False);
    S.Position := 0;
    Result := ProcessRequest(ncnmLoginMaq, S.Memory, S.Size, nil, nil, nmdByteArray);
  finally
    S.Free;
  end;
end;

function TncNXServRemoto.LogoutMaq(aMaq: Word): Integer;
var 
  Req : TnmLogoutMaqReq;  
begin
  Req.nmMaq := aMaq;
  Result := ProcessRequest(ncnmLogoutMaq, @Req, SizeOf(Req), nil, nil, nmdByteArray);
end;

function TncNXServRemoto.PreLogoutMaq(aMaq: Word): Integer;
var 
  Req : TnmLogoutMaqReq;  
begin
  Req.nmMaq := aMaq;
  Result := ProcessRequest(ncnmPreLogoutMaq, @Req, SizeOf(Req), nil, nil, nmdByteArray);
end;

function TncNXServRemoto.CancelaTran(aID: Integer; aFunc: String): integer;
var Req: TnmCancelaTranReq;
begin
  Req.nmFunc := aFunc;
  Req.nmTran := aID;
  Result := ProcessRequest(ncnmCancelaTran, 
                                @Req, SizeOf(Req), 
                                nil, nil, nmdByteArray);
end;

function TncNXServRemoto.CancLogoutMaq(aMaq: Word): Integer;
var 
  Req : TnmLogoutMaqReq;  
begin
  Req.nmMaq := aMaq;
  Result := ProcessRequest(ncnmCancLogoutMaq, 
                                @Req, SizeOf(Req), 
                                nil, nil, nmdByteArray);
end;

function TncNXServRemoto.ObtemStreamConfig(S: TStream): Integer;
begin
  Result := ProcessRequest(ncnmObtemStreamConfig, nil, 0, @S, nil, nmdStream);
  S.Position := 0;
end;

function TncNXServRemoto.ObtemSenhaCli(Codigo: Integer;
  var Senha: String): Integer;
var 
  Request : TnmSenhaCli; 
  P : Pointer;
  ReplyLen : TnxWord32;
begin
  Request.nmCodigo := Codigo;
  Request.nmSenha  := '';   
  try
    Result := ProcessRequest(ncnmObtemSenhaCli, @Request, SizeOf(Request), 
                                 @P, @ReplyLen, nmdByteArray);
    if Result=0 then
      Senha := PnmSenhaCli(P)^.nmSenha;
  finally
    if Assigned(P) then nxFreeMem(P, ReplyLen);
  end;
end;

function TncNXServRemoto.ObtemSitesBloqueados(var S: String): Integer;
var Stream: TnxMemoryStream;
begin
  Stream := TnxMemoryStream.Create;
  try
    Result := ProcessRequest(ncnmObtemSitesBloq, nil, 0,  @Stream, nil, nmdStream);
    if Result=0 then begin
      Stream.Position := 0;
      SetLength(S, Stream.Size);
      Stream.Read(S[1], Stream.Size);
    end;                                 
  finally
    Stream.Free;
  end;
end;

function TncNXServRemoto.ObtemStreamAvisos(S: TStream): Integer;
begin
  Result := ProcessRequest(ncnmAvisos, nil, 0, @S, nil, nmdStream);
  S.Position := 0;
end;

function TncNXServRemoto.ObtemPastaServ(var NomePastaServ: String): Integer;
var 
  ReplyLen : TnxWord32;
  P : Pointer;
begin
  try
    Result := ProcessRequest(ncnmObtemPastaServ, nil, 0, @P, @ReplyLen, nmdByteArray);
    if Result=0 then
      NomePastaServ := PnmNomeArq(P)^.nmNomeArq;
  finally
    if Assigned(P) then nxFreeMem(P, ReplyLen);
  end;
end;

function TncNXServRemoto.ObtemPatrocinios(aSL: TStrings): Integer;
var S: TStream;
begin
  S := TMemoryStream.Create;
  try
    Result := ProcessRequest(ncnmObtemPatrocinios, nil, 0,  @S, nil, nmdStream);
    S.Position := 0;
    aSL.LoadFromStream(S);
  finally
    S.Free;
  end;
end;

function TncNXServRemoto.ObtemProcessos(aMaq: Word; aIDCliente,
  aIDReq: Integer): integer;
var Req: TnmObtemProcessos;  
begin
  Req.nmMaq := aMaq;
  Req.nmIDCliente := aIDCliente;
  Req.nmIDRequest := aIDReq;
  Result := ProcessRequest(ncnmObtemProcessos, @Req, SizeOf(Req),  nil, nil, nmdByteArray);
end;

function TncNXServRemoto.RefreshEspera: Integer;
begin
  Result := ProcessRequest(ncnmRefreshEspera, nil, 0,  nil, nil, nmdByteArray);
end;

function TncNXServRemoto.RefreshPrecos: integer;
begin
  Result := ProcessRequest(ncnmRefreshPrecos, nil, 0,  nil, nil, nmdByteArray);
end;

function TncNXServRemoto.ShutdownMaq(aMaq, aOper: Word): integer;
var Req : TnmShutdown;
begin
  Req.nmMaq := aMaq;
  Req.nmOper := aOper;
  Result := ProcessRequest(ncnmShutdown, @Req, SizeOf(Req),  nil, nil, nmdByteArray);
end;

function TncNXServRemoto.SuporteRem(aMaq, aTec: Word): Integer;
var Req : TnmSuporteRem;
begin
  Req.nmMaq := aMaq;
  Req.nmTec := aTec;
  Result := ProcessRequest(ncnmSuporteRem, @Req, SizeOf(Req),  nil, nil, nmdByteArray);
end;

function TncNXServRemoto.ModoManutencao(aMaq: Word; aUsername, aSenha: String; aEntrar: Boolean): Integer; 
var Req : TnmModoManutencaoReq;
begin
  Req.nmMaq := aMaq;
  Req.nmUsername := aUsername;
  Req.nmSenha := aSenha;
  Req.nmEntrar := aEntrar;
  Result := ProcessRequest(ncnmModoManutencao, @Req, SizeOf(Req),  nil, nil, nmdByteArray);
end;

function TncNXServRemoto.AbreCaixa(aFunc: String;
  var NovoCx: Integer): Integer;
var 
  Req: TnmAbreCaixaReq;
  P: Pointer;
  ReplyLen : TnxWord32;
begin
  Req.nmFunc := aFunc;
  try
    Result := ProcessRequest(ncnmAbreCaixa, @Req, SizeOf(Req), 
                                  @P, @ReplyLen, nmdByteArray);
    if Result=0 then
      NovoCx := PnmAbreCaixaRpy(P)^.nmID;                              
  finally
    if Assigned(P) then nxFreeMem(P, ReplyLen);
  end;
end;

function TncNXServRemoto.CorrigeDataCaixa(aFunc: String; aID: Integer; aNovaAbertura, aNovoFechamento: TDateTime): integer;
var 
  Req: TnmCorrigeDataCaixaReq;
begin
  Req.nmFunc := aFunc;
  Req.nmCaixa := aID;
  Req.nmNovaAbertura := aNovaAbertura;
  Req.nmNovoFechamento := aNovoFechamento;
  Result := ProcessRequest(ncnmCorrigeDataCaixa, @Req, SizeOf(Req), nil, nil, nmdByteArray);
end;

function TncNXServRemoto.AdicionaPassaporte(aMaq: Word;
  aSenha: String): Integer;
var Req: TnmAdicionaPassaporteReq;
begin
  Req.nmSenha := aSenha;
  Req.nmMaq := aMaq;
  Result := ProcessRequest(ncnmAdicionaPassaporte, @Req, SizeOf(Req),  nil, nil, nmdByteArray);
end;

function TncNXServRemoto.AjustaPontosFid(aFunc: String; aCliente: Integer;
  aFator: Smallint; aPontos: Double; aObs: String): Integer;
var 
  Req: TnmAjustaPontosFid;
begin
  Req.nmFunc := aFunc;
  Req.nmCliente := aCliente;
  Req.nmFator := aFator;
  Req.nmPontos := aPontos;
  Req.nmObs := aObs;
  Result := ProcessRequest(ncnmAjustaPontosFid, @Req, SizeOf(Req), nil, nil, nmdByteArray);
end;

function TncNXServRemoto.RegistraPaginasImpressas(aMaq: Word;
  aPaginas: Integer; aImp, aDoc: String): Integer;
var Req: TnmPaginasImpressasReq;  
begin
  Req.nmMaq := aMaq;
  Req.nmPaginas := aPaginas;
  Req.nmImp := aImp;
  Req.nmDoc := aDoc;
  Result := ProcessRequest(ncnmPaginasImpressas, @Req, SizeOf(Req),  nil, nil, nmdByteArray);
end;


initialization
  TncnxRemotePlugin.rcRegister;
  TncnxRemoteCmdHandler.rcRegister;
finalization
  TncnxRemotePlugin.rcUnRegister;
  TncnxRemoteCmdHandler.rcUnRegister;

end.

