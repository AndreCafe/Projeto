{****************************************************}
{* NexusDB Client Messaging                                       *}
{* Provides the ability for NexusDB clients to send messages      *}
{* to other clients.                                              *}
{******************************************************************}
{* Unit contains client side components                           *}
{******************************************************************}
{* Released as freeware                                           *}
{* Authors:  Nathan Sutcliffe, Terry Haan                         *}
{******************************************************************}
{
    ResourceString: Dario 13/03/13
    Nada para fazer
}

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
  nxlgEventLog,
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
    FEventLog : TnxBaseLog;
    FEventLogEnabled : Boolean;
    FWaitingSock : Boolean;
    function GetCmdHandler: TnxBaseCommandHandler;
    function GetSession: TnxStateComponent;
    procedure SetCmdHandler(const Value: TnxBaseCommandHandler);
    procedure SetSession(const Value: TnxStateComponent);
    procedure ProcessMsgProc(Msg : PnxDataMessage);
    procedure LogEvent(S: String);

    function ProcessRequest(aMsgID          : TnxMsgID;
                            aRequestData    : Pointer;
                            aRequestDataLen : TnxWord32;
                            aReply          : PPointer;
                            aReplyLen       : PnxWord32;
                            aReplyType      : TnxNetMsgDataType)
                                            : TnxResult;
    procedure SetEventLog(const Value: TnxBaseLog);
    procedure SetEventLogEnabled(const Value: Boolean);
    procedure OnTerminateSock(Sender: TObject);
    
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

    procedure nmMonitorOnOffEv(var Msg : TnxDataMessage);
      message ncnmMonitorOnOffEv;  
      
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
    function DownloadArqInterno(aArq: String; aVerCli: Integer; aDestino: String): Integer; override;
    function ObtemVersaoGuard(var Versao: Integer): Integer; override;

    function StartPrintTransfer(aArqInfo: TStrings; var aPos: Int64): Integer; override;
    function SendPTBlock(aArq: TGUID; aLast: Boolean; aTamanho: Integer; aPos: Int64; aBlock: Pointer): Integer; override;
    
    function SalvaStreamObj(Novo: Boolean; S: TStream): Integer; override;
    function ObtemStreamConfig(S: TStream): Integer; override;
    function ObtemStreamAvisos(S: TStream): Integer; override;
    function ObtemStreamListaObj(Cliente: Integer; TipoClasse: Integer; S: TStream): Integer; override;
    function ApagaObj(Cliente: Integer; TipoClasse: Integer; Chave: String): Integer; override;

    function ApagaMsgCli(aID: Integer): Integer; override;

    function SalvaApp(aApp: String): Integer; override;

    function AbreCaixa(aFunc: String; aSaldo: Currency; var NovoCx: Integer): Integer; override;
    function FechaCaixa(aFunc: String; aSaldo: Currency; aID: Integer): Integer; override;
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

    function GetLoginData(var aVer, aConta, aUsers: String): integer;
    
    function FinalizaProcesso(aMaq: Word; aProcessID: Integer): Integer; override;
    function SalvaProcessos(aIDCliente, aRequest: Integer; aSL: TStrings): Integer; override;
    function RefreshEspera: Integer; override;
    
    function AdicionaPassaporte(aMaq: Word; aSenha: String): Integer; override;
    function RegistraPaginasImpressas(aJobID: Cardinal; aMaq: Word; aPaginas: Integer; aImp, aDoc: String): Integer; override;
    
    function PararTempoMaq(aMaq: Word; aParar: Boolean): Integer; override;
    function TransferirMaq(aOrigem, aDestino: Word): Integer; override;
    function PermitirDownload(aSessao: Integer; aExe, aPermitir: Boolean): Integer; override;
    function DesativarFWSessao(aSessao: Integer; aDesativar: Boolean): Integer; override;
    function DesktopSincronizado(aSessao: Integer): integer; override;

    function MonitorOnOff(aMaq: Word; aOn: Boolean): integer; override;

    function PrintDocControl(aInfo: TStrings): Integer; override;
    
    
    function PreLogoutMaq(aMaq: Word): Integer; override;
    function CancLogoutMaq(aMaq: Word): Integer; override;
    function CancelaTran(aID: Integer; aFunc: String): integer; override;

    function SalvaClientPages(aPrinter: String; aJobID: Cardinal; aMaquina, aPaginas: Word): integer; override;
    function JobControl(aPrinterIndex: Integer; aJob: Cardinal; aControl: Byte): integer; override;
    
      
    function ObtemPastaServ(var NomePastaServ: String): Integer; override;
    function ArqFundoEnviado(NomeArq: String): Integer; override;
    function ObtemSenhaCli(Codigo: Integer; var Senha: String): Integer; override;
    function SalvaSenhaCli(Codigo: Integer; Senha: String): Integer; override;
    function LimpaFundo(Desktop: Boolean): Integer; override;

    function EnviarMsg(const aDe, aPara: Integer; const aTexto: String): Integer; override;

    function RefreshPrecos: integer; override;
    function ShutdownMaq(aMaq, aOper: Word): integer; override;
    function SuporteRem(aMaq, aTec: Word): Integer; override;

    function DisableAD(aSessao: Integer; aDisable: Boolean): integer; override;
    
    function ObtemSitesBloqueados(var S: String): Integer; override;
    
    function Login(aUsername, aSenha: String; aMaq: Word; aFuncAtual: Boolean; aRemoto: Boolean; aWndHandle: HWND; aProxyHandle: Integer; aSocket: Integer; aSession: Integer; aIP: String; var Handle: Integer): Integer; override;
    function ModoManutencao(aMaq: Word; aUsername, aSenha: String; aEntrar: Boolean): Integer; override;

    function SalvaLic(aLic: String): Integer; override;

    procedure Logout(Cliente: Integer); override;

    property TicksLastCom: Cardinal read FTicksLastCom;
    
  published   
    property EventLog: TnxBaseLog
      read FEventLog write SetEventLog;

    property EventLogEnabled: Boolean
      read FEventLogEnabled write SetEventLogEnabled;  
      
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


var
  nxsr_ActiveFormHWND : HWND = 0;

procedure Register;


implementation


uses
  SysUtils,
  nxstMessages, nxllFastMove, SyncObjs,
  nxllStreams, ncMsgCom, ncSessao, ncMovEst, ncCredTempo, ncDebTempo, ncDebito,
  ncImpressao, ncLancExtra, ncDebug, ncgPrevLogoff;

// START resource string wizard section
resourcestring
  SÉNecessárioInformarOEndereçoDoSe = 'É necessário informar o endereço do servidor NexCafé';

// END resource string wizard section



type
  TThreadSockConn = class ( TThread )
  private
    FTransp   : TnxBasePooledTransport;
    Fexecuting : Boolean;
  protected 
    procedure Execute; override;
  public
    constructor Create(aTransp: TnxBasePooledTransport);

    property Executing: Boolean
      read FExecuting;
  end;  


procedure Register;
begin
  RegisterComponents('NexCafe', [TncNXServRemoto]); // do not localize
end;


{ TncnxRemotePlugin }
constructor TncnxRemotePlugin.Create(aOwner: TComponent);
begin
  inherited;
  FMsgQueue := TnxDataMessageQueue.Create;
  FHWnd := Classes.AllocateHWnd(PluginMsgHandler);
  DebugMsg('TncnxRemotePlugin.Create - FHWND: ' + IntToStr(FHWND)); // do not localize
  FProcessMsgProc := nil;
end;


destructor TncnxRemotePlugin.Destroy;
begin
  DebugMsg('TncnxRemotePlugin.Destroy'); // do not localize
  Classes.DeallocateHWnd(FHWnd);
  FreeAndNil(FMsgQueue);
  inherited;
end;


procedure TncnxRemotePlugin.LogEvent(aString: string);
begin
  DebugMsg('TncnxRemotePlugin.'+aString); // do not localize
end;


class function TncnxRemotePlugin.bpeIsRemote: Boolean;
begin
  Result := True;
end;

procedure TncnxRemotePlugin.ProcessReceivedMessage( aMsg: PnxDataMessage );
var M : PnxDataMessage;
begin
  try
    with aMsg^ do
      LogEvent('ProcessReceivedMessage - dmMsg: ' + MsgToString(dmMsg) + ' - dmDataLen: ' + IntToStr(dmDataLen)); // do not localize
  except
    on E: Exception do
      try LogEvent('ProcessReceivedMessage - Exception: ' + E.Message); except end; // do not localize
  end;

  try
    M := nxGetZeroMem(SizeOf(TnxDataMessage));
    if (aMsg^.dmDataLen > 0) then begin
      M^.dmData := nxGetMem(aMsg^.dmDataLen);
      nxMove(aMsg^.dmData^, M^.dmData^, aMsg^.dmDataLen);
    end;
    M^.dmMsg := aMsg^.dmMsg;
    M^.dmSource := aMsg^.dmSource;
    M^.dmSessionID := aMsg^.dmSessionID;
    M^.dmErrorCode := aMsg^.dmErrorCode;
    M^.dmDataLen := aMsg^.dmDataLen;

    Windows.PostMessage(FHWnd, cm_ncnxProcessMsg, Integer(M), 0);
    DebugMsg('Windwos.PostMessage - HWND: ' + IntToStr(FHwnd)); // do not localize
    
{    with aMsg^ do
    try
      FMsgQueue.Push( Self,
                      dmMsg,
                      dmSessionId,
                      0,
                      0,
                      dmData,
                      dmDataLen );
  
      // Post a message to our window handle.  This way, we don't call the events
      // in the context of the NexusDB thread.  Also, we can return control to the
      // calling thread right away.
    finally  
      Windows.PostMessage(FHWnd, cm_ncnxProcessMsg, 0, 0);
      DebugMsg('Windwos.PostMessage - HWND: ' + IntToStr(FHwnd));
    end;}
  except
    on E: Exception do
      try LogEvent('ProcessReceviedMessage - Exception: '+E.Message); except end; // do not localize
  end;
end;

procedure TncnxRemotePlugin.msgProcessMsg( var aMsg: TMessage );
var M : PnxDataMessage;
begin
  DebugMsg('TncnxRemotePlugin.msgProcessMsg'); // do not localize
  try
    M := PnxDataMessage(aMsg.WParam);
    try
      try DebugMsg('TncnxRemotePlugin.msgProcessMsg - dmMsg: '+MsgToString(M^.dmMsg)); except end; // do not localize
        
      if Assigned(FProcessMsgProc) then 
        FProcessMsgProc(M) else
        DebugMsg('TncnxRemotePlugin.msgProcessMsg - FProcessMsgProc NOT ASSIGNED'); // do not localize
        
    finally
      if Assigned( M^.dmData) then
        nxFreeMem( M^.dmData); 
    
      nxFreeMem(M);
    end;
{    Msg := FMsgQueue.Pop;
    while Assigned( Msg ) do begin
      try
        try LogEvent('msgProcessMsg - dmMsg: '+MsgToString(Msg^.dmMsg)); except end;
        
        if Assigned(FProcessMsgProc) then 
          FProcessMsgProc(Msg);
      finally
        // better free the message
        if Assigned( Msg^.dmData ) then
          nxFreeMem( Msg^.dmData);
        nxFreeMem( Msg );
      end;
      Msg := FMsgQueue.Pop;
    end;}
  except
    on E: Exception do 
      DebugMsgEsp('TncnxRemotePlugin. msgProcessMsg - Exception: ' + E.Message, False, True); // do not localize
  end;
end;

procedure TncnxRemotePlugin.PluginMsgHandler(var aMsg: TMessage);
begin
  DebugMsg('TncnxRemotePlugin.PluginMsgHandler - ' + IntToStr(aMsg.Msg)); // do not localize
  if aMsg.Msg = WM_QUERYENDSESSION then begin
    aMsg.Result := 1;
    DebugMsg('TncnxRemotePlugin.PluginMsgHandler - WM_QUERYENDSESSION'); // do not localize
    PrevLogoff;
  end else
  if aMsg.Msg = cm_ncnxProcessMsg then begin
    DebugMsg('TncnxRemotePlugin.PluginMsgHandler - Dispatch'); // do not localize
    Dispatch( aMsg );
  end else begin
    DebugMsg('TncnxRemotePlugin.PluginMsgHandler - DEFWINDOWPROC - FHWND: '+IntToStr(FHWND)); // do not localize
    DefWindowProc( FHWnd, aMsg.Msg, aMsg.WParam, aMsg.LParam );
  end;
end;


{ TncnxRemoteCmdHandler }

procedure TncnxRemoteCmdHandler.bpchProcess( aMsg: PnxDataMessage;
                                                      var aHandled: Boolean);
begin
  with aMsg^ do
    if (dmMsg>=ncnmFirstEv) and (dmMsg<=ncnmLastEv) then begin
      PluginEngine.ProcessReceivedMessage( aMsg );
      aHandled := True;
    end else 
      DebugMsg('TncnxRemoteCmdHandler.bpchProcess - dmMsg: ' + IntToStr(dmMsg) + ' - Fora da faixa de processamento'); // do not localize
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
  FEventLog := nil;
  FTicksLastCom := 0;
  FRemPlugin := TncnxRemotePlugin.Create(Self);
  FCmdHandler := TncnxRemoteCmdHandler.Create(Self);
  FCmdHandler.PluginEngine := FRemPlugin;
  FRemPlugin.ProcessMsgProc := Self.ProcessMsgProc;
  FTransp := nil;
  FSalvaTelaEv := nil;
  FOnProgressoArq := nil;
end;

function TncNXServRemoto.DesativarFWSessao(aSessao: Integer;
  aDesativar: Boolean): Integer;
var Req: TnmDesativarFWSessaoReq;
begin
  Req.nmSessao := aSessao;
  Req.nmDesativar := aDesativar;  
  Result := ProcessRequest(ncnmDesativarFWSessao, @Req, SizeOf(Req), nil, nil, nmdByteArray);
end;

function TncNXServRemoto.DesktopSincronizado(aSessao: Integer): integer;
var Req: TnmSessao;
begin
  Req.nmSessao := aSessao;
  Result := ProcessRequest(ncnmDesktopSincronizado, @Req, SizeOf(Req), nil, nil, nmdByteArray);
end;

destructor TncNXServRemoto.Destroy;
begin
  DebugMsg('TncNXServRemoto - Destroy'); // do not localize
  FCmdHandler.Active := False;
  if Assigned(FCmdHandler) then
    FCmdHandler.Active := False;
  FCmdHandler.CommandHandler := nil;
  FreeAndNil(FCmdHandler);
  FreeAndNil(FRemPlugin);
  inherited;
end;

function TncNXServRemoto.DisableAD(aSessao: Integer;
  aDisable: Boolean): integer;
var Req : TnmDisableAdReq;
begin
  Req.nmSessao := aSessao;
  Req.nmDisable := aDisable;
  Result := ProcessRequest(ncnmDisableAd, @Req, SizeOf(Req), nil, nil, nmdByteArray);
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

function TncNXServRemoto.DownloadArqInterno(aArq: String; aVerCli: Integer;
  aDestino: String): Integer;
var 
  S: TMemoryStream;
  Req : TnmDownArqInt;
begin                  
  Req.nmArq := aArq;
  Req.nmVer := aVerCli;
  S := TMemoryStream.Create;
  try
    Result := ProcessRequest(ncnmDownloadArqInterno, @Req, SizeOf(Req), @S, nil, nmdStream);
    if Result=0 then begin
      S.SaveToFile(aDestino);
    end;
  finally
    S.Free;
  end;
end;

function TncNXServRemoto.GetCmdHandler: TnxBaseCommandHandler;
begin
  Result := FCmdHandler.CommandHandler;
end;

function TncNXServRemoto.GetSession: TnxStateComponent;
begin
  Result := FRemPlugin.Session;
end;

function TncNXServRemoto.JobControl(aPrinterIndex: Integer; aJob: Cardinal; aControl: Byte): integer;
var Req : TnmJobControl;
begin
  Req.nmJob := aJob;
  Req.nmControl := aControl;
  Req.nmPrinterIndex := aPrinterIndex;
  Result := ProcessRequest(ncnmJobControl, @Req, SizeOf(Req), nil, nil, nmdByteArray);
end;

procedure TncNXServRemoto.nmCapturaTelaEv(var Msg: TnxDataMessage);
var M: PmsgCapturaTela;
begin
  LogEvent('nmCapturaTelaEv'); // do not localize
  New(M);
  Move(Msg.dmData^, M^, Msg.dmDataLen);
  EnviaEvento(ncmc_CapturaTela, M);
end;

procedure TncNXServRemoto.nmChecaLicEv(var Msg: TnxDataMessage);
begin
  LogEvent('nmChecaLicEv'); // do not localize
  EnviaEvento(ncmc_ChecaLicEv, nil);
end;

procedure TncNXServRemoto.nmFinalizaProcessoEv(var Msg: TnxDataMessage);
var M : PmsgFinalizaProcesso;
begin
  LogEvent('nmFinalizaProcessoEv'); // do not localize
  New(M);
  Move(Msg.dmData^, M^, Msg.dmDataLen);
  EnviaEvento(ncmc_FinalizaProcesso, M);
end;

procedure TncNXServRemoto.nmHorarioEv(var Msg: TnxDataMessage);
var M : PmsgHorarioEv;
begin
  LogEvent('nmHorarioEv'); // do not localize
  New(M);
  Move(Msg.dmData^, M^, Msg.dmDataLen);
  EnviaEvento(ncmc_HorarioEv, M);
end;

procedure TncNXServRemoto.nmMonitorOnOffEv(var Msg: TnxDataMessage);
var M : PmsgMonitorOnOff;
begin
  New(M);
  with TnmMonitorOnOff(Msg.dmData^) do begin
    DebugMsg('TncNXServRemoto.nmMonitorOnOffEv - nmMaq: ' + IntToStr(nmMaq) + ' - nmOn: ' + BoolStr[nmOn]); // do not localize
    M.msgMaq := nmMaq;
    M.msgOn  := nmOn;
  end;
  EnviaEvento(ncmc_MonitorOnOffEv, M);
end;

procedure TncNXServRemoto.nmMsgComEv(var Msg: TnxDataMessage);
var 
  S: TMemoryStream;
  Dados : Pointer;
begin
  LogEvent('nmMsgComEv'); // do not localize
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
  FTicksLastCom := GetTickCount;
  DebugMsg('TncNXServRemoto.ProcessMsgProc'); // do not localize
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
//  FTicksLastCom := GetTickCount;
  if (Result>ncerrUltimo) and (aMsgID<>ncnmLogout) then begin
    Result := ncerrConexaoPerdida;
    SetAtivo(False);
  end;
end;

procedure ProcessMsgConn;
var Msg : TMsg;
begin
  while PeekMessage(Msg, nxsr_ActiveFormHWND, 0, 0, PM_REMOVE) do begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

function TncNXServRemoto.SendPTBlock(aArq: TGUID; aLast: Boolean;
  aTamanho: Integer; aPos: Int64; aBlock: Pointer): Integer;
var 
  Req : PnmSendPTBlock;
  ReqLen : Integer;
begin
  ReqLen := SizeOf( TnmSendPTBlock ) - SizeOf( TnxVarMsgField ) + aTamanho + 1;
  nxGetZeroMem(Req, ReqLen);
  try
    Req^.nmArq := aArq;
    Req^.nmLast := aLast;
    Req^.nmTamanho := aTamanho;
    Move(aBlock^, Req^.nmBlock, aTamanho);
    Result := ProcessRequest(ncnmUploadArq, Req, ReqLen, nil, nil, nmdByteArray);
  finally
    nxFreeMem(Req);
  end;
end;

procedure TncNXServRemoto.SetAtivo(Valor: Boolean);
var T : TThreadSockConn; Dummy: Integer;
begin
  DebugMsg('TncNCServRemoto.SetAtivo - 0'); // do not localize

  try
    if Valor and Assigned(FTransp) then begin
      FTransp.Active := False;
      if Trim(FTransp.ServerName)='' then 
        raise exception.Create(SÉNecessárioInformarOEndereçoDoSe);
        
      if Win32MajorVersion>5 then begin
        DebugMsg('TncNCServRemoto.SetAtivo A-1'); // do not localize
        T := TThreadSockConn.Create(FTransp);
        DebugMsg('TncNCServRemoto.SetAtivo A-2'); // do not localize
        FWaitingSock := True;
        T.Resume;
        while T.Executing do begin
          DebugMsg('TncNXServRemoto.SetAtivo - Waiting 1'); // do not localize
          MsgWaitForMultipleObjects(0, Dummy, False, 500, QS_ALLINPUT);
          DebugMsg('TncNXServRemoto.SetAtivo - Waiting 2'); // do not localize
          ProcessMsgConn;
          DebugMsg('TncNXServRemoto.SetAtivo - Waiting 3'); // do not localize
        end;
        DebugMsg('TncNCServRemoto.SetAtivo A-3'); // do not localize
  
        try T.Free; except end;
      end else begin
        DebugMsg('TncNXServRemoto.SetAtivo B-1'); // do not localize
        FTransp.Active := True;
        DebugMsg('TncNXServRemoto.SetAtivo B-2'); // do not localize
      end;

      DebugMsg('TncNCServRemoto.SetAtivo 4'); // do not localize
      
      if not FTransp.Active then begin
        DebugMsg('TncNCServRemoto.SetAtivo 5'); // do not localize
        raise EErroNexCafe.Create(ncerrFalhaConexao);
      end else
        DebugMsg('TncNCServRemoto.SetAtivo 6'); // do not localize
    end else
      DebugMsg('TncNCServRemoto.SetAtivo - FALSE'); // do not localize

    DebugMsg('TncNCServRemoto.SetAtivo 7'); // do not localize
    FRemPlugin.Active := Valor;
    DebugMsg('TncNCServRemoto.SetAtivo 8'); // do not localize
    FCmdHandler.Active := Valor;
    DebugMsg('TncNCServRemoto.SetAtivo 9'); // do not localize
    if Assigned(FRemPlugin.Session) then
      FRemPlugin.Session.Active := Valor;

    DebugMsg('TncNCServRemoto.SetAtivo 10'); // do not localize
      
    if (not Valor) and Assigned(FTransp) then 
      FTransp.Active := False;

    DebugMsg('TncNCServRemoto.SetAtivo 11'); // do not localize
      
    if Assigned(FCmdHandler.CommandHandler) then
      FCmdHandler.CommandHandler.Active := True;

    DebugMsg('TncNCServRemoto.SetAtivo 12'); // do not localize
  except
    On E: EnxPooledTransportException do begin
      DebugMsg('TncNXServRemoto.SetAtivo - Valor: ' + BoolString[Valor] +  // do not localize
        ' - Exception: ' + E.Message +  // do not localize
        ' - ErrorCode: ' + IntToStr(E.ErrorCode) +  // do not localize
        ' - OS Error: ' + IntToStr(E.OSError)); // do not localize
      Raise EErroNexCafe.Create(ncerrFalhaConexao);
    end;
    on E: EErroNexCafe do begin
      DebugMsg('TncNCServRemoto.SetAtivo - E: ErroNexCafe - '+E.Message); // do not localize
      raise EErroNexCafe.Create(E.CodigoErro);
    end;
    On E: Exception do begin
      DebugMsg('TncNCServRemoto.SetAtivo - E: Exception - '+E.Message); // do not localize
      raise;
    end;
  end;
  inherited;
end;

procedure TncNXServRemoto.SetCmdHandler(const Value: TnxBaseCommandHandler);
begin
  FCmdHandler.CommandHandler := Value;
end;

procedure TncNXServRemoto.SetEventLog(const Value: TnxBaseLog);
begin
  FEventLog := Value;
  
  FRemPlugin.EventLog := Value;
  FRemPlugin.EventLogEnabled := FEventLogEnabled;

  FCmdHandler.EventLog := Value;
  FCmdHandler.EventLogEnabled := FEventLogEnabled;
end;

procedure TncNXServRemoto.SetEventLogEnabled(const Value: Boolean);
begin
  FEventLogEnabled := Value;
  FCmdHandler.EventLog := FEventLog;
  FCmdHandler.EventLogEnabled := Value;

  FRemPlugin.EventLog := FEventLog;
  FRemPlugin.EventLogEnabled := Value;
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
    SL.Values['de'] := IntToStr(aDe); // do not localize
    SL.Values['para'] := IntToStr(aPara); // do not localize
    SL.Values['datahora'] := '0'; // do not localize
    SL.Values['id'] := '0'; // do not localize
    SL.Add(aTexto);
    SL.SaveToStream(S);
    Result := ProcessRequest(ncnmEnviaChat, S.Memory, S.Size, nil, nil, nmdByteArray);
  finally
    SL.Free;
    S.Free;
  end;
end;

function TncNXServRemoto.FechaCaixa(aFunc: String; aSaldo: Currency; aID: Integer): Integer;
var Req: TnmFechaCaixaReq;
begin
  Req.nmFunc := aFunc;
  Req.nmID   := aID;
  Req.nmSaldo := aSaldo;
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

procedure TncNXServRemoto.LogEvent(S: String);
begin
  DebugMsg('TnxNCServRemoto.'+S); // do not localize
end;

function TncNXServRemoto.Login(aUsername, aSenha: String; aMaq: Word;
  aFuncAtual: Boolean; aRemoto: Boolean; aWndHandle: HWND; aProxyHandle: Integer;
  aSocket: Integer; aSession: Integer; aIP: String; var Handle: Integer): Integer;
var
  Request : TnmLoginReq;
  ReplyLen : TnxWord32;
  P : Pointer;
begin
  DebugMsg('TncNXServRemoto.Login - 1'); // do not localize
  Request.nmUsername := aUsername;
  DebugMsg('TncNXServRemoto.Login - 2'); // do not localize
  Request.nmSenha := aSenha;
  DebugMsg('TncNXServRemoto.Login - 3'); // do not localize
  Request.nmFuncAtual := aFuncAtual;
  DebugMsg('TncNXServRemoto.Login - 4'); // do not localize
  Request.nmProxyHandle := aProxyHandle;
  DebugMsg('TncNXServRemoto.Login - 5'); // do not localize
  Request.nmMaq := aMaq;
  DebugMsg('TncNXServRemoto.Login - 6'); // do not localize
  try
    DebugMsg('TncNXServRemoto.Login - 7'); // do not localize
    Result := ProcessRequest(ncnmLogin, @Request, SizeOf(Request), @P, @ReplyLen, nmdByteArray);
    DebugMsg('TncNXServRemoto.Login - 8: '+IntToStr(ReplyLen)); // do not localize
    Move(P^, Handle, SizeOf(Integer));
    DebugMsg('TncNXServRemoto.Login - Result: ' + IntToStr(Result)); // do not localize
  finally
    if Assigned(P) then nxFreeMem(P);
  end;
  if Result = 0 then begin
    DebugMsg('TncNXServRemoto.Login - 9'); // do not localize
    inherited Login(aUsername, aSenha, aMaq, aFuncAtual, aRemoto, aWndHandle, aProxyHandle, aSocket, aSession, aIP, Handle);
  end;
  DebugMsg('TncNXServRemoto.Login - 10'); // do not localize
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
    if Assigned(P) then nxFreeMem(P);
  end;
end;

procedure TncNXServRemoto.OnTerminateSock(Sender: TObject);
begin
  DebugMsg('TncNXServRemoto.OnTerminateSock'); // do not localize
  FWaitingSock := False;
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

function TncNXServRemoto.ApagaMsgCli(aID: Integer): Integer;
var Req: TnmApagaMsgCli;
begin
  Req.nmMsgID := aID;
  Result := ProcessRequest(ncnmApagaMsgCli, @Req, SizeOf(Req), nil, nil, nmdByteArray);
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
var  S: TMemoryStream;
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

function TncNXServRemoto.SalvaApp(aApp: String): Integer;
var 
  SL : TStrings;  
  S: TMemoryStream;
begin
  SL := TStringList.Create;
  S := TMemoryStream.Create;
  try
    SL.Text := aApp;
    SL.SaveToStream(S);
    Result := ProcessRequest(ncnmSalvaApp, S.Memory, S.Size, nil, nil, nmdByteArray);
  finally
    SL.Free;
    S.Free;
  end;
end;

function TncNXServRemoto.SalvaClientPages(aPrinter: String; aJobID: Cardinal; aMaquina, aPaginas: Word): integer;
var Req: TnmClientPages;
begin
  Req.nmJobID := aJobID;
  Req.nmMaq := aMaquina;
  Req.nmImp := aPrinter;
  Req.nmPaginas := aPaginas;
  Result := ProcessRequest(ncnmSalvaClientPages, @Req, SizeOf(Req), nil, nil, nmdByteArray);
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
    nxFreeMem(Req);
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
      nxFreeMem(Req);
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
  aExe, aPermitir: Boolean): Integer;
var Req: TnmPermitirDownloadReq;
begin
  Req.nmSessao := aSessao;
  Req.nmPerm := aPermitir;  
  Req.nmExe := aExe;
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
  DebugMsgEsp('TnxNXServRemoto.LogoutMaq - ' + IntToStr(aMaq), False, False); // do not localize
  Req.nmMaq := aMaq;
  Result := ProcessRequest(ncnmLogoutMaq, @Req, SizeOf(Req), nil, nil, nmdByteArray);
end;

function TncNXServRemoto.PreLogoutMaq(aMaq: Word): Integer;
var 
  Req : TnmLogoutMaqReq;  
begin
  DebugMsgEsp('TnxNXServRemoto.PreLogoutMaq - ' + IntToStr(aMaq), False, False); // do not localize
  Req.nmMaq := aMaq;
  Result := ProcessRequest(ncnmPreLogoutMaq, @Req, SizeOf(Req), nil, nil, nmdByteArray);
end;

function TncNXServRemoto.PrintDocControl(aInfo: TStrings): Integer;
var S: AnsiString;
begin
  S := aInfo.Text;
  Result := ProcessRequest(ncnmPrintDocControl, @s[1], Length(S), nil, nil, nmdByteArray);
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
    if Assigned(P) then nxFreeMem(P);
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
    if Assigned(P) then nxFreeMem(P);
  end;
end;

function TncNXServRemoto.GetLoginData(var aVer, aConta, aUsers: String): integer;
var 
  S: TStream;
  sl : TStrings;
  str: String;
begin
  S := TMemoryStream.Create;
  sl := TStringList.Create;
  try
    aVer := '';
    aConta := '';
    aUsers := '';
    Result := ProcessRequest(ncnmGetLoginData, nil, 0,  @S, nil, nmdStream);
    if Result=0 then begin
      S.Position := 0;
      sl.LoadFromStream(S);
      str := sl.Text;
      if str='sadsdfsdf' then Exit;
      
      if sl.Count>1 then begin
        aVer := sl[0];
        aConta := sl[1];
        sl.Delete(0);
        sl.Delete(0);
        aUsers := sl.Text;
      end;
    end;
  finally
    S.Free;
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

function TncNXServRemoto.StartPrintTransfer(aArqInfo: TStrings;
  var aPos: Int64): Integer;
var 
  S: TStream;
  ReplyLen : TnxWord32;
begin
  S := TMemoryStream.Create;
  try
    aArqInfo.SaveToStream(S);
    S.Position := 0;
    ReplyLen := SizeOf(aPos);
    Result := ProcessRequest(ncnmStartPrintTransfer, S, S.Size, @aPos, @ReplyLen, nmdByteArray);
  finally
    S.Free;
  end;
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

function TncNXServRemoto.MonitorOnOff(aMaq: Word; aOn: Boolean): integer;
var 
  Req: TnmMonitorOnOff;
  ReplyLen : TnxWord32;
begin
  Req.nmMaq := aMaq;
  Req.nmOn  := aOn;
  Result := ProcessRequest(ncnmMonitorOnOff, @Req, SizeOf(Req), nil, @ReplyLen, nmdByteArray);
end;

function TncNXServRemoto.AbreCaixa(aFunc: String; aSaldo: Currency;
  var NovoCx: Integer): Integer;
var 
  Req: TnmAbreCaixaReq;
  P: Pointer;
  ReplyLen : TnxWord32;
begin
  Req.nmFunc := aFunc;
  Req.nmSaldo := aSaldo;
  try
    Result := ProcessRequest(ncnmAbreCaixa, @Req, SizeOf(Req), 
                                  @P, @ReplyLen, nmdByteArray);
    if Result=0 then
      NovoCx := PnmAbreCaixaRpy(P)^.nmID;                              
  finally
    if Assigned(P) then nxFreeMem(P);
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

function TncNXServRemoto.RegistraPaginasImpressas(aJobID: Cardinal; aMaq: Word;
  aPaginas: Integer; aImp, aDoc: String): Integer;
var Req: TnmPaginasImpressasReq;  
begin
  Req.nmJobID := aJobID;
  Req.nmMaq := aMaq;
  Req.nmPag := aPaginas;
  Req.nmImp := aImp;
  Req.nmDoc := aDoc;
  Result := ProcessRequest(ncnmPaginasImpressas, @Req, SizeOf(Req),  nil, nil, nmdByteArray);
end;


{ TThreadSockConn }

constructor TThreadSockConn.Create(aTransp: TnxBasePooledTransport);
begin
  inherited Create(True);
  FTransp := aTransp;
  FreeOnTerminate := False;
  FExecuting := True;
  DebugMsg('TThreadSockConn.Create'); // do not localize
end;

procedure TThreadSockConn.Execute;
begin
  DebugMsg('TThreadSockConn.Execute - 1'); // do not localize
  try
    try
      DebugMsg('TThreadSockConn.Execute - 2'); // do not localize
      FTransp.Active := True;
      DebugMsg('TThreadSockConn.Execute - 3'); // do not localize
    except
      On E: Exception do 
        DebugMsg('TThreadSockConn.Execute - Exception: ' + E.message); // do not localize
    end;
  finally
    FExecuting := False;
    DebugMsg('TThreadSockConn.Execute - Finally'); // do not localize
  end;
end;

initialization
  TncnxRemotePlugin.rcRegister;
  TncnxRemoteCmdHandler.rcRegister;
finalization
  TncnxRemotePlugin.rcUnRegister;
  TncnxRemoteCmdHandler.rcUnRegister;

end.


