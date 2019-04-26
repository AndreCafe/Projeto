unit ncServRemoto;

interface

uses
  Windows,
  Messages,
  WinProcs,
  SysUtils,
  Classes,
  CSCBase,
  CSCQueue,                    
  CSCClient,
  ncMsgCom,
  ncNetMsg,
  ncSessao,
  ncMovEst,
  ncDebito,
  Dialogs,
  ncImpressao,
  ncCredTempo,
  ncClassesBase;

type
  
  TncServidorRemoto = class ( TncServidorBase )
  private
    FCliCom        : TCSCClient;
    FWndHandle     : HWND;

    procedure Desconectou(Sender: TObject);
    procedure CriaWndHandle;

    function GetHost: String;
    procedure SetHost(Valor: String);
    function ObtemModoDemo(var MD, NumMaq: Integer): Integer;
  protected
    procedure ProcessaEventosPendentes;
    procedure ProcessaEventosArqPendentes;
    
    procedure SetAtivo(Valor: Boolean); override;

    procedure nmAtualizaObjEv(var Msg: TCSCMessage);
      message ncnmAtualizaObjEv;
      
    procedure nmDestroiObjEv(var Msg: TCSCMessage);
      message ncnmDestroiObjEv;
      
    procedure nmNovoObjEv(var Msg: TCSCMessage);
      message ncnmNovoObjEv;

    procedure nmPedeTelaEv(var Msg: TCSCMessage);
      message ncnmPedeTelaEv;

    procedure nmShutdownEv(var Msg: TCSCMessage);
      message ncnmShutdownEv; 

    procedure nmSuporteRemEv(var Msg: TCSCMessage);
      message ncnmSuporteRemEv; 

    procedure nmTransfArqEv(var Msg: TCSCMessage);
      message ncnmTransfArqEv;

    procedure nmChatEv(var Msg: TCSCMessage);
      message ncnmChatEv;

    procedure nmChecaLicEv(var Msg: TCSCMessage);
      message ncnmChecaLicEv;

    procedure nmAbriuFechouCaixaEv(var Msg: TCSCMessage);
      message ncnmAbriuFechouCaixaEv;  

    procedure nmObtemProcessosEv(var Msg: TCSCMessage);
      message ncnmObtemProcessosEv;

    procedure nmFinalizaProcessoEv(var Msg: TCSCMessage);
      message ncnmFinalizaProcessoEv;    

    procedure nmSiteBloqueadoEv(var Msg: TCSCMessage);
      message ncnmSiteBloqueadoEv;  

    procedure nmFileTransmissionEv(var Msg : TCSCMessage);
      message cscnmFileTransmissionEv;

    procedure nmHorarioEv(var Msg: TCSCMessage);
      message ncnmHorarioEv;   
      
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function TicksLastCom: Cardinal;

    function KeepAlive: Integer;

    function SalvaStreamObj(Novo: Boolean; S: TStream): Integer; override;
    function ObtemStreamConfig(S: TStream): Integer; override;
    function ObtemStreamAvisos(S: TStream): Integer; override;
    function ObtemStreamListaObj(Cliente: Integer; TipoClasse: Integer; S: TStream): Integer; override;
    function ApagaObj(Cliente: Integer; TipoClasse: Integer; Chave: String): Integer; override;

    function AbreCaixa(aFunc: String; var NovoCx: Integer): Integer; override;
    function FechaCaixa(aFunc: String; aID: Integer): Integer; override;
    function CorrigeDataCaixa(aFunc: String; aID: Integer; aNovaAbertura, aNovoFechamento: TDateTime): integer; override;
    function AjustaPontosFid(aFunc: String; aCliente: Integer; aFator: Smallint; aPontos: Double; aObs: String): Integer; override;
    
    
    function CapturaTelaMaq(aMaq: Word; S: TMemoryStream): integer; override;
    function SalvaTelaMaq(aMaq: Word; S: TMemoryStream): integer; override;
    
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
      
    function BaixaNovaVersao(Programa, Versao, ArqDestino: String): Integer; override;

    function ObtemPastaServ(var NomePastaServ: String): Integer; override;
    function ArqFundoEnviado(NomeArq: String): Integer; override;
    function ObtemSenhaCli(Codigo: Integer; var Senha: String): Integer; override;
    function SalvaSenhaCli(Codigo: Integer; Senha: String): Integer; override;
    function LimpaFundo(Desktop: Boolean): Integer; override;
    function Upload(aFonte, aDestino: String): Integer; override;
    function Download(aFonte, aDestino: String): Integer; override;

    function EnviarMsg(const aDe, aPara: Integer; const aTexto: String): Integer; override;

    function RefreshPrecos: integer; override;
    function ShutdownMaq(aMaq, aOper: Word): integer; override;
    function SuporteRem(aMaq, aTec: Word): Integer; override;
    
    function ObtemSitesBloqueados(var S: String): Integer; override;
    
    function Login(aUsername, aSenha: String; aMaq: Word; aFuncAtual: Boolean; aRemoto: Boolean; aWndHandle: HWND; aProxyHandle: Integer; aSocket: Integer; aIP: String; var Handle: Integer): Integer; override;
    function ModoManutencao(aMaq: Word; aUsername, aSenha: String; aEntrar: Boolean): Integer; override;

    function SalvaLic(aLic: String): Integer; override;
    
    procedure Logout(Cliente: Integer); override;
    

    property CliCom: TCSCClient
      read FCliCom;
      
  published
    property Host: String
      read GetHost write SetHost;
  end;
  
  function CMServRemotoWndFunc(hWindow : Hwnd; Msg : UINT;
                               wParam : WPARAM;
                               lParam : LPARAM) : LRESULT; stdcall export;

const
  NomeClasseServRemoto = 'TncServidorRemoto';
  
implementation

uses ncLancExtra, ncDebTempo;

{ TncServidorRemoto }

constructor TncServidorRemoto.Create(AOwner: TComponent);
begin
  inherited;
  CriaWndHandle;
  FCliCom := TCSCClient.Create(Self);
  FCliCom.OnDisconnect := Desconectou;
  FCliCom.NotifyHandle := FWndHandle;
  FCliCom.Port := 16201;
end;

destructor TncServidorRemoto.Destroy;
begin
  SetAtivo(False);
  FCliCom.Free;
  DestroyWindow(FWndHandle);
  inherited;
end;

function TncServidorRemoto.Download(aFonte, aDestino: String): Integer;
var I: Integer;
begin
  I := 0;
  Result := FCliCom.DownloadFile(aFonte, aDestino, '', I, I);
end;

function TncServidorRemoto.EnviarMsg(const aDe, aPara: Integer;
  const aTexto: String): Integer;
var 
  SL : TStrings;  
  S: TStream;
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
    Result := FCliCom.RequestData(ncnmEnviaChat, S, S.Size, nmdStream, nil, 0, nmdByteArray);
  finally
    SL.Free;
    S.Free;
  end;
end;

function TncServidorRemoto.FechaCaixa(aFunc: String; aID: Integer): Integer;
var Req: TnmFechaCaixaReq;
begin
  Req.nmFunc := aFunc;
  Req.nmID   := aID;
  Result := FCliCom.RequestData(ncnmFechaCaixa, @Req, SizeOf(Req), nmdByteArray,
                                nil, 0, nmdByteArray);
end;

function TncServidorRemoto.FinalizaProcesso(aMaq: Word;
  aProcessID: Integer): Integer;
var Req: TnmFinalizaProcesso;  
begin
  Req.nmProcessID := aProcessID;
  Req.nmMaq       := aMaq;
  Result := FCliCom.RequestData(ncnmFinalizaProcesso, @Req, SizeOf(Req), nmdByteArray,
                                nil, 0, nmdByteArray);
end;

function TncServidorRemoto.ForceRefreshSessao(aSessao: Integer): Integer;
var Req : TnmSessao;
begin
  Req.nmSessao := aSessao;
  Result := FCliCom.RequestData(ncnmRefreshSessao, @Req, SizeOf(Req), nmdByteArray,
                                nil, 0, nmdByteArray);
end;

function TncServidorRemoto.GetHost: String;
begin
  Result := FCliCom.Host;
end;

function TncServidorRemoto.KeepAlive: Integer;
begin
  Result := FCliCom.RequestData(ncnmKeepAlive, nil, 0, nmdByteArray, nil, 0, nmdByteArray);
end;

function TncServidorRemoto.Login(aUsername, aSenha: String; aMaq: Word;
  aFuncAtual: Boolean; aRemoto: Boolean; aWndHandle: HWND; aProxyHandle: Integer;
  aSocket: Integer; aIP: String; var Handle: Integer): Integer;
var
  Request : TnmLoginReq;
  I : Integer;
begin
  Request.nmUsername := aUsername;
  Request.nmSenha := aSenha;
  Request.nmFuncAtual := aFuncAtual;
  Request.nmProxyHandle := aProxyHandle;
  Request.nmMaq := aMaq;
  I := SizeOf(Request);
  Result := FCliCom.RequestData(ncnmLogin, @Request, I, nmdByteArray,
                                @Handle, SizeOf(Handle), nmdByteArray);
  if Result = 0 then
    inherited Login(aUsername, aSenha, aMaq, aFuncAtual, aRemoto, aWndHandle, aProxyHandle, aSocket, aIP, Handle);                                
end;

procedure TncServidorRemoto.Logout(Cliente: Integer);
begin
  inherited;
  FCliCom.RequestData(ncnmLogout, @Cliente, SizeOf(Cliente), 
                      nmdByteArray, nil, 0, nmdByteArray);
end;

procedure TncServidorRemoto.SetAtivo(Valor: Boolean);
begin
  try
    if Valor=False then
      FCliCom.Connected := False;
  except
  end;
    
  if Valor = FAtivo then Exit;
  
  if Valor then
    FCliCom.ConnectAndWait;
    
  inherited;
end;

procedure TncServidorRemoto.SetHost(Valor: String);
begin
  FCliCom.Host := Valor;
end;

procedure TncServidorRemoto.Desconectou(Sender: TObject);
begin
  inherited SetAtivo(False);
end;

procedure TncServidorRemoto.ProcessaEventosArqPendentes;
var DataMsg : PCSCMessage;
begin
  while true do begin
    if (FCliCom=nil) then Exit;
    DataMsg := FCliCom.MsgQueue.ExamineFileEvents;
    if (DataMsg = nil) then Exit;
    FCliCom.MsgQueue.RemoveEventFromQueue(DataMsg);
    try
      Dispatch(DataMsg^);
    except
    end;
    FCliCom.MsgQueue.DisposeEvent(DataMsg);
  end;
end;

procedure TncServidorRemoto.ProcessaEventosPendentes;
var DataMsg : PCSCMessage;
begin
  while true do begin
    if (FCliCom=nil) then Exit;
    DataMsg := FCliCom.MsgQueue.ExamineEvents;
    if (DataMsg = nil) then Exit;
    FCliCom.MsgQueue.RemoveEventFromQueue(DataMsg);
    try
      Dispatch(DataMsg^);
    except
    end;
    FCliCom.MsgQueue.DisposeEvent(DataMsg);
  end;
end;

procedure TncServidorRemoto.CriaWndHandle;
var XClass : TWndClass;
begin
  XClass.hInstance := HInstance;
  with XClass do begin
    Style         := 0;
    lpfnWndProc   := @CMServRemotoWndFunc;
    cbClsExtra    := 0;
    cbWndExtra    := SizeOf(Pointer);
    hIcon         := LoadIcon(hInstance, 'DEFICON');
    hCursor       := LoadCursor(0, idc_Arrow);
    hbrBackground := 0;
    lpszMenuName  := nil;
    lpszClassName := NomeClasseServRemoto;
  end;
  WinProcs.RegisterClass(XClass);

  FWndHandle :=
    CreateWindow(NomeClasseServRemoto,   {window class name}
                 '',                     {caption}
                 0,                      {window style}
                 0,                      {X}
                 0,                      {Y}
                 1,                      {width}
                 1,                      {height}
                 0,                      {parent}
                 0,                      {menu}
                 HInstance,              {instance}
                 nil);                   {parameter}
                 
  SetWindowLong(FWndHandle, 0, Longint(Self));
end;

function CMServRemotoWndFunc(hWindow : Hwnd; Msg : UINT;
                          wParam : WPARAM;
                          lParam : LPARAM) : LRESULT; stdcall export;
var
  Obj : TncServidorRemoto;
  
  function DefWndFunc : LongInt;
  begin
    DefWndFunc := DefWindowProc(hWindow, Msg, wParam, lParam);
  end;

begin
  Result := 0;
  Obj := nil;

  if MSG<>wm_Create then begin
    Obj := TncServidorRemoto(GetWindowLong(hWindow, 0));
    if Obj=nil then begin 
      Result := DefWndFunc;
      Exit;
    end;
  end;

  case Msg of
    cscm_EventReceived : 
      Obj.ProcessaEventosPendentes;
    cscm_FileEventReceived : 
      Obj.ProcessaEventosArqPendentes;
  else 
    Result := DefWndFunc;
  end;
end;

procedure TncServidorRemoto.nmAbriuFechouCaixaEv(var Msg: TCSCMessage);
begin
  EnviaEvento(ncmc_AbriuFechouCaixa, 0, 0);
end;

procedure TncServidorRemoto.nmAtualizaObjEv(var Msg: TCSCMessage);
var S: TMemoryStream;
begin
  S := TMemoryStream.Create;
  TStream(Msg.dmData).Position := 0;
  S.LoadFromStream(TStream(Msg.dmData));
  S.Position := 0;
  EnviaEvento(ncmc_AtualizaObj, 0, Integer(S));
end;

procedure TncServidorRemoto.nmChatEv(var Msg: TCSCMessage);
var S: TMemoryStream;
begin
  S := TMemoryStream.Create;
  S.LoadFromStream(TStream(Msg.dmData));
  S.Position := 0;
  EnviaEvento(ncmc_ChatEv, 0, Integer(S));
end;

procedure TncServidorRemoto.nmChecaLicEv(var Msg: TCSCMessage);
begin
  EnviaEvento(ncmc_ChecaLicEv, 0, 0);
end;

procedure TncServidorRemoto.nmDestroiObjEv(var Msg: TCSCMessage);
var 
  Evento : TnmObj;
  msgDestroi : PmsgDestroiObj;
begin
  Evento := TnmObj(Msg.dmData^);
  New(msgDestroi);
  msgDestroi^.msgTipoClasse := Evento.nmTipoClasse;
  msgDestroi^.msgChave := Evento.nmChave;
  EnviaEvento(ncmc_DestroiObj, 0, Integer(msgDestroi));
end;

procedure TncServidorRemoto.nmNovoObjEv(var Msg: TCSCMessage);
var S: TMemoryStream;
begin
  S := TMemoryStream.Create;
  S.LoadFromStream(TStream(Msg.dmData));
  S.Position := 0;
  EnviaEvento(ncmc_NovoObj, 0, Integer(S));
end;

procedure TncServidorRemoto.nmObtemProcessosEv(var Msg: TCSCMessage);
var Evento : PnmObtemProcessos;
begin
  New(Evento);
  Move(Msg.dmData^, Evento^, SizeOf(TnmObtemProcessos));
  EnviaEvento(ncmc_ObtemProcessos, 0, Integer(Evento));
end;

procedure TncServidorRemoto.nmPedeTelaEv(var Msg: TCSCMessage);
begin
  with TnmCapturaTela(Msg.dmData^) do
    EnviaEvento(ncmc_PedeTela, nmMaq, 0);
end;

procedure TncServidorRemoto.nmShutdownEv(var Msg: TCSCMessage);
var 
  msgShutdown : PmsgShutdown;
begin
  New(msgShutdown);
  with TnmShutdown(Msg.dmData^) do begin
    msgShutdown.msgMaq := nmMaq;
    msgShutdown.msgOper := nmOper;
  end;  
  EnviaEvento(ncmc_Shutdown, 0, Integer(msgShutdown));
end;

procedure TncServidorRemoto.nmSiteBloqueadoEv(var Msg: TCSCMessage);
var S: TMemoryStream;
begin
  S := TMemoryStream.Create;
  TStream(Msg.dmData).Position := 0;
  S.LoadFromStream(TStream(Msg.dmData));
  S.Position := 0;
  EnviaEvento(ncmc_SiteBloqueado, 0, Integer(S));
end;

procedure TncServidorRemoto.nmSuporteRemEv(var Msg: TCSCMessage);
var 
  msgSuporteR : PmsgSuporteRemEv;
begin
  New(msgSuporteR);
  with TnmSuporteRem(Msg.dmData^) do begin
    msgSuporteR.msgMaq := nmMaq;
    msgSuporteR.msgTec := nmTec;
  end;  
  EnviaEvento(ncmc_SuporteRemEv, 0, Integer(msgSuporteR));
end;

procedure TncServidorRemoto.nmTransfArqEv(var Msg: TCSCMessage);
var 
  msgTransfArqEv : PmsgTransfArqEv;
begin
  New(msgTransfArqEv);
  Move(Msg.dmData^, msgTransfArqEv^.msgTransfInfo, SizeOf(msgTransfArqEv^.msgTransfInfo));
  EnviaEvento(ncmc_TransfArqEv, 0, Integer(msgTransfArqEv));
end;

procedure TncServidorRemoto.nmFileTransmissionEv(var Msg : TCSCMessage);
begin
  nmTransfArqEv(Msg);
end;

procedure TncServidorRemoto.nmFinalizaProcessoEv(var Msg: TCSCMessage);
var Evento : PnmFinalizaProcesso;
begin
  New(Evento);
  Move(Msg.dmData^, Evento^, SizeOf(TnmFinalizaProcesso));
  EnviaEvento(ncmc_FinalizaProcesso, 0, Integer(Evento));
end;

procedure TncServidorRemoto.nmHorarioEv(var Msg: TCSCMessage);
var Evento: PmsgHorarioEv;
begin
  New(Evento);
  Move(Msg.dmData^, Evento^, SizeOf(TmsgHorarioEv));
  EnviaEvento(ncmc_HorarioEv, 0, Integer(Evento));
end;

function TncServidorRemoto.ObtemStreamListaObj(Cliente,
  TipoClasse: Integer; S: TStream): Integer;
var Request : TnmObtemListaReq;  
begin
  Request.nmCliente := Cliente;
  Request.nmTipoClasse := TipoClasse;
  Result := FCliCom.RequestData(ncnmObtemLista, @Request, SizeOf(Request), 
                                nmdByteArray, Pointer(S), 0, nmdStream);
end;

function TncServidorRemoto.AlteraSessao(aSessao: Tobject): Integer;
var  S: TStream;
begin
  S := TMemoryStream.Create;
  try
    TncSessao(aSessao).SalvaStream(S, False);
    S.Position := 0;
    Result := FCliCom.RequestData(ncnmAlteraSessao,
                                  S, S.Size, nmdStream,
                                  nil, 0, nmdByteArray);
  finally
    S.Free;
  end;
end;

function TncServidorRemoto.ApagaObj(Cliente: Integer; TipoClasse: Integer; Chave: String): Integer;
var Request : TnmObj;
begin
  Request.nmCliente := Cliente;
  Request.nmTipoClasse := TipoClasse;
  Request.nmChave := Chave;
  Result := FCliCom.RequestData(ncnmApagaObj, @Request, SizeOf(Request), 
                                nmdByteArray, nil, 0, nmdByteArray);
end;


function TncServidorRemoto.ArqFundoEnviado(NomeArq: String): Integer;
var Request : TnmNomeArq;
begin
  Request.nmNomeArq := NomeArq;
  Result := FCliCom.RequestData(ncnmArqFundoEnviado, @Request, SizeOf(Request), 
                                nmdByteArray, nil, 0, nmdByteArray);
end;

function TncServidorRemoto.SalvaMovEst(aObj: TObject): Integer; 
var S: TStream;
begin
  S := TMemoryStream.Create;
  try
    TncMovEst(aObj).SalvaStream(S, False);
    S.Position := 0;
    Result := FCliCom.RequestData(ncnmSalvaMovEst,
                                  S, S.Size, nmdStream,
                                  nil, 0, nmdByteArray);
    
  finally
    S.Free;
  end;
end;

function TncServidorRemoto.SalvaProcessos(aIDCliente, aRequest: Integer;
  aSL: TStrings): Integer;
var S: TStream;
begin
  aSL.Insert(0, IntToStr(aIDCliente));
  aSL.Insert(1, IntToStr(aRequest));
  S := TMemoryStream.Create;
  try
    aSL.SaveToStream(S);
    S.Position := 0;
    Result := FCliCom.RequestData(ncnmSalvaProcessos,
                                  S, S.Size, nmdStream,
                                  nil, 0, nmdByteArray);
    
  finally
    S.Free;
  end;
end;

function TncServidorRemoto.SalvaCredTempo(aObj: TObject): Integer;
var S: TStream;
begin
  S := TMemoryStream.Create;
  try
    TncCredTempo(aObj).SaveToStream(S);
    S.Position := 0;
    Result := FCliCom.RequestData(ncnmSalvaCredTempo,
                                  S, S.Size, nmdStream,
                                  nil, 0, nmdByteArray);
    
  finally
    S.Free;
  end;
end;

function TncServidorRemoto.SalvaDebito(aObj: TObject): Integer;
var S: TStream;
begin
  S := TMemoryStream.Create;
  try
    TncDebito(aObj).SalvaStream(S, False);
    S.Position := 0;
    Result := FCliCom.RequestData(ncnmSalvaDebito,
                                  S, S.Size, nmdStream,
                                  nil, 0, nmdByteArray);
    
  finally
    S.Free;
  end;
end;

function TncServidorRemoto.SalvaDebTempo(aObj: TObject): Integer;
var S: TStream;
begin
  S := TMemoryStream.Create;
  try
    TncDebTempo(aObj).SalvaStream(S, False);
    S.Position := 0;
    Result := FCliCom.RequestData(ncnmSalvaDebTempo,
                                  S, S.Size, nmdStream,
                                  nil, 0, nmdByteArray);
    
  finally
    S.Free;
  end;
end;

function TncServidorRemoto.SalvaImpressao(aObj: TObject): Integer;
var S: TStream;
begin
  S := TMemoryStream.Create;
  try
    TncImpressao(aObj).SaveToStream(S);
    S.Position := 0;
    Result := FCliCom.RequestData(ncnmSalvaImpressao,
                                  S, S.Size, nmdStream,
                                  nil, 0, nmdByteArray);
    
  finally
    S.Free;
  end;
end;

function TncServidorRemoto.SalvaLancExtra(aObj: TObject): Integer;
var S: TStream;
begin
  S := TMemoryStream.Create;
  try
    TncLancExtra(aObj).SalvaStream(S, False);
    S.Position := 0;
    Result := FCliCom.RequestData(ncnmSalvaLancExtra,
                                  S, S.Size, nmdStream,
                                  nil, 0, nmdByteArray);
    
  finally
    S.Free;
  end;
end;

function TncServidorRemoto.SalvaLic(aLic: String): Integer;
var 
  SL : TStrings;
  S  : TStream;
begin
  SL := TStringList.Create;
  try
    S := TMemoryStream.Create;
    try
      SL.Text := aLic;
      SL.SaveToStream(S);
      S.Position := 0;
      Result := FCliCom.RequestData(ncnmSalvaLic, S, S.Size, nmdStream, nil, 0, nmdByteArray);    
    finally
      S.Free;
    end;
  finally
    SL.Free;
  end;
end;

function TncServidorRemoto.SalvaLogAppUrl(S: TStream): Integer;
begin
  Result := FCliCom.RequestData(ncnmSalvaAppUrlLog, S, S.Size, nmdStream, nil, 0, nmdByteArray);
end;

function TncServidorRemoto.SalvaSenhaCli(Codigo: Integer;
  Senha: String): Integer;
var Request : TnmSenhaCli;
begin
  Request.nmCodigo := Codigo;
  Request.nmSenha  := Senha;
  Result := FCliCom.RequestData(ncnmSalvaSenhaCli, @Request, SizeOf(Request), 
                                nmdByteArray, nil, 0, nmdByteArray);
end;

function TncServidorRemoto.SalvaStreamObj(Novo: Boolean; S: TStream): Integer;
const
  ID_Msg : Array[Boolean] of Integer = (ncnmAlteraObj, ncnmNovoObj);
begin
  with FCliCom do
  Result := 
    RequestData(ID_Msg[Novo], S, S.Size, nmdStream, nil, 0, nmdByteArray); 
end;

function TncServidorRemoto.CapturaTelaMaq(aMaq: Word; S: TMemoryStream): integer; 
var
  Req : TnmCapturaTela;
begin
  Req.nmMaq := aMaq;
  Result := FCliCom.RequestData(ncnmCapturaTelaMaq, @Req, SizeOf(Req), nmdByteArray,
                                Pointer(S), 0, nmdStream);
end;

function TncServidorRemoto.SalvaTelaMaq(aMaq: Word; S: TMemoryStream): integer;
begin
  S.Position := S.Size;
  S.Write(aMaq, 1);
  Result := FCliCom.RequestData(ncnmSalvaTelaMaq, Pointer(S), S.Size, nmdStream,
                                nil, 0, nmdByteArray);
end;

function TncServidorRemoto.TicksLastCom: Cardinal;
begin
  Result := FCliCom.TicksLastCom;
end;

function TncServidorRemoto.TransferirMaq(aOrigem, aDestino: Word): Integer; 
var
  Req : TnmTransferirMaqReq;
begin
  Req.nmOrigem := aOrigem;
  Req.nmDestino := aDestino;
  Result := FCliCom.RequestData(ncnmTransferirMaq,  @Req, SizeOf(Req), nmdByteArray,
                                nil, 0, nmdByteArray);
end;

function TncServidorRemoto.Upload(aFonte, aDestino: String): Integer;
var I: Integer;
begin
  I := 0;
  Result := FCliCom.UploadFile(aFonte, aDestino, '', I, I);
end;

function TncServidorRemoto.LimpaFundo(Desktop: Boolean): Integer;
var Req : TnmLimpaFundoReq;
begin
  Req.nmDesktop := Desktop;
  Result := FCliCom.RequestData(ncnmLimpaFundo,  @Req, SizeOf(Req), nmdByteArray,
                                nil, 0, nmdByteArray);
end;

function TncServidorRemoto.PararTempoMaq(aMaq: Word; aParar: Boolean): Integer; 
var
  Req : TnmPararTempoMaqReq;
begin
  Req.nmMaq := aMaq;
  Req.nmParar := aParar;
  Result := FCliCom.RequestData(ncnmPararTempoMaq,  @Req, SizeOf(Req), nmdByteArray,
                                nil, 0, nmdByteArray);
end;
  
function TncServidorRemoto.PermitirDownload(aSessao: Integer;
  aPermitir: Boolean): Integer;
var Req: TnmPermitirDownloadReq;
begin
  Req.nmSessao := aSessao;
  Req.nmPerm := aPermitir;  
  Result := FCliCom.RequestData(ncnmPermitirDownload, @Req, SizeOf(Req), nmdByteArray,
                                nil, 0, nmdByteArray);
end;

function TncServidorRemoto.LoginMaq(aSessao: TObject): Integer;
var  S: TStream;
begin
  S := TMemoryStream.Create;
  try
    TncSessao(aSessao).SalvaStream(S, False);
    S.Position := 0;
    Result := FCliCom.RequestData(ncnmLoginMaq, 
                                  S, S.Size, nmdStream,
                                  nil, 0, nmdByteArray);
  finally
    S.Free;
  end;
end;

function TncServidorRemoto.LogoutMaq(aMaq: Word): Integer;
var 
  Req : TnmLogoutMaqReq;  
begin
  Req.nmMaq := aMaq;
  Result := FCliCom.RequestData(ncnmLogoutMaq, 
                                @Req, SizeOf(Req), nmdByteArray,
                                nil, 0, nmdByteArray);
end;

function TncServidorRemoto.BaixaNovaVersao(Programa, Versao, ArqDestino: String): Integer;
var
  Req : TnmBaixaAtualizacao;
begin
  Req.nmPrograma := Programa;
  Req.nmVersao   := Versao;
  StrECopy(Req.nmNomeArq, PChar(ArqDestino));
  
  Result := FCliCom.RequestData(ncnmBaixaAtualizacao, @Req, SizeOf(Req), 
                                nmdByteArray, nil, 0, nmdByteArray);
end;  

function TncServidorRemoto.PreLogoutMaq(aMaq: Word): Integer;
var 
  Req : TnmLogoutMaqReq;  
begin
  Req.nmMaq := aMaq;
  Result := FCliCom.RequestData(ncnmPreLogoutMaq, 
                                @Req, SizeOf(Req), nmdByteArray,
                                nil, 0, nmdByteArray);
end;

function TncServidorRemoto.CancelaTran(aID: Integer; aFunc: String): integer;
var Req: TnmCancelaTranReq;
begin
  Req.nmFunc := aFunc;
  Req.nmTran := aID;
  Result := FCliCom.RequestData(ncnmCancelaTran, 
                                @Req, SizeOf(Req), nmdByteArray,
                                nil, 0, nmdByteArray);
end;

function TncServidorRemoto.CancLogoutMaq(aMaq: Word): Integer;
var 
  Req : TnmLogoutMaqReq;  
begin
  Req.nmMaq := aMaq;
  Result := FCliCom.RequestData(ncnmCancLogoutMaq, 
                                @Req, SizeOf(Req), nmdByteArray,
                                nil, 0, nmdByteArray);
end;

function TncServidorRemoto.ObtemStreamConfig(S: TStream): Integer;
begin
  Result := FCliCom.RequestData(ncnmObtemStreamConfig, nil, 0, nmdByteArray, Pointer(S), 0, nmdStream);
  S.Position := 0;
end;

function TncServidorRemoto.ObtemSenhaCli(Codigo: Integer;
  var Senha: String): Integer;
var Request, Reply : TnmSenhaCli;
begin
  Request.nmCodigo := Codigo;
  Request.nmSenha  := '';   
  Reply.nmCodigo := 0;
  Reply.nmSenha := '';
  Result := FCliCom.RequestData(ncnmObtemSenhaCli, @Request, SizeOf(Request), 
                                nmdByteArray, @Reply, SizeOf(Reply), nmdByteArray);
  if Result=0 then
    Senha := Reply.nmSenha;                               
end;

function TncServidorRemoto.ObtemSitesBloqueados(var S: String): Integer;
var Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  try
    Result := FCliCom.RequestData(ncnmObtemSitesBloq, nil, 0, nmdByteArray, 
                                  Stream, 0, nmdStream);
    if Result=0 then begin
      Stream.Position := 0;
      SetLength(S, Stream.Size);
      Stream.Read(S[1], Stream.Size);
    end;                                 
  finally
    Stream.Free;
  end;
end;

function TncServidorRemoto.ObtemStreamAvisos(S: TStream): Integer;
begin
  Result := FCliCom.RequestData(ncnmAvisos, nil, 0, nmdByteArray, Pointer(S), 0, nmdStream);
  S.Position := 0;
end;

function TncServidorRemoto.ObtemModoDemo(var MD, NumMaq : Integer): Integer;
var Reply : TnmObtemModoDemoRpy;
begin
  Result := FCliCom.RequestData(ncnmObtemModoDemo, nil, 0, nmdByteArray, @Reply, SizeOf(MD), nmdByteArray);
  if Result = 0 then begin
    MD := Reply.nmModoDemo;
    NumMaq := Reply.nmNumMaq;
  end;  
end;

function TncServidorRemoto.ObtemPastaServ(var NomePastaServ: String): Integer;
var Reply: TnmNomeArq;
begin
  Reply.nmNomeArq := '';
  Result := FCliCom.RequestData(ncnmObtemPastaServ, nil, 0, nmdByteArray, @Reply, SizeOf(Reply), nmdByteArray);
  NomePastaServ := Reply.nmNomeArq;  
end;

function TncServidorRemoto.ObtemPatrocinios(aSL: TStrings): Integer;
var S: TStream;
begin
  S := TMemoryStream.Create;
  try
    Result := FCliCom.RequestData(ncnmObtemPatrocinios, nil, 0, nmdByteArray, S, 0, nmdStream);
    S.Position := 0;
    aSL.LoadFromStream(S);
  finally
    S.Free;
  end;
end;

function TncServidorRemoto.ObtemProcessos(aMaq: Word; aIDCliente,
  aIDReq: Integer): integer;
var Req: TnmObtemProcessos;  
begin
  Req.nmMaq := aMaq;
  Req.nmIDCliente := aIDCliente;
  Req.nmIDRequest := aIDReq;
  Result := FCliCom.RequestData(ncnmObtemProcessos, @Req, SizeOf(Req), nmdByteArray, nil, 0, nmdByteArray);
end;

function TncServidorRemoto.RefreshEspera: Integer;
begin
  Result := FCliCom.RequestData(ncnmRefreshEspera, nil, 0, nmdByteArray, nil, 0, nmdByteArray);
end;

function TncServidorRemoto.RefreshPrecos: integer;
begin
  Result := FCliCom.RequestData(ncnmRefreshPrecos, nil, 0, nmdByteArray, nil, 0, nmdByteArray);
end;

function TncServidorRemoto.ShutdownMaq(aMaq, aOper: Word): integer;
var Req : TnmShutdown;
begin
  Req.nmMaq := aMaq;
  Req.nmOper := aOper;
  Result := FCliCom.RequestData(ncnmShutdown, @Req, SizeOf(Req), nmdByteArray, nil, 0, nmdByteArray);
end;

function TncServidorRemoto.SuporteRem(aMaq, aTec: Word): Integer;
var Req : TnmSuporteRem;
begin
  Req.nmMaq := aMaq;
  Req.nmTec := aTec;
  Result := FCliCom.RequestData(ncnmSuporteRem, @Req, SizeOf(Req), nmdByteArray, nil, 0, nmdByteArray);
end;

function TncServidorRemoto.ModoManutencao(aMaq: Word; aUsername, aSenha: String; aEntrar: Boolean): Integer; 
var Req : TnmModoManutencaoReq;
begin
  Req.nmMaq := aMaq;
  Req.nmUsername := aUsername;
  Req.nmSenha := aSenha;
  Req.nmEntrar := aEntrar;
  Result := FCliCom.RequestData(ncnmModoManutencao, @Req, SizeOf(Req), nmdByteArray, nil, 0, nmdByteArray);
end;

function TncServidorRemoto.AbreCaixa(aFunc: String;
  var NovoCx: Integer): Integer;
var 
  Req: TnmAbreCaixaReq;
  Rpy: TnmAbreCaixaRpy;
begin
  Req.nmFunc := aFunc;
  Result := FCliCom.RequestData(ncnmAbreCaixa, @Req, SizeOf(Req), nmdByteArray,
                                @Rpy, SizeOf(Rpy), nmdByteArray);
  NovoCx := Rpy.nmID;                                
end;

function TncServidorRemoto.CorrigeDataCaixa(aFunc: String; aID: Integer; aNovaAbertura, aNovoFechamento: TDateTime): integer;
var 
  Req: TnmCorrigeDataCaixaReq;
begin
  Req.nmFunc := aFunc;
  Req.nmCaixa := aID;
  Req.nmNovaAbertura := aNovaAbertura;
  Req.nmNovoFechamento := aNovoFechamento;
  Result := FCliCom.RequestData(ncnmCorrigeDataCaixa, @Req, SizeOf(Req), nmdByteArray,
                                nil, 0, nmdByteArray);
end;

function TncServidorRemoto.AdicionaPassaporte(aMaq: Word;
  aSenha: String): Integer;
var Req: TnmAdicionaPassaporteReq;
begin
  Req.nmSenha := aSenha;
  Req.nmMaq := aMaq;
  Result := FCliCom.RequestData(ncnmAdicionaPassaporte, @Req, SizeOf(Req), nmdByteArray, nil, 0, nmdByteArray);
end;

function TncServidorRemoto.AjustaPontosFid(aFunc: String; aCliente: Integer;
  aFator: Smallint; aPontos: Double; aObs: String): Integer;
var 
  Req: TnmAjustaPontosFid;
begin
  Req.nmFunc := aFunc;
  Req.nmCliente := aCliente;
  Req.nmFator := aFator;
  Req.nmPontos := aPontos;
  Req.nmObs := aObs;
  Result := FCliCom.RequestData(ncnmAjustaPontosFid, @Req, SizeOf(Req), nmdByteArray,
                                nil, 0, nmdByteArray);
end;

function TncServidorRemoto.RegistraPaginasImpressas(aMaq: Word;
  aPaginas: Integer; aImp, aDoc: String): Integer;
var Req: TnmPaginasImpressasReq;  
begin
  Req.nmMaq := aMaq;
  Req.nmPaginas := aPaginas;
  Req.nmImp := aImp;
  Req.nmDoc := aDoc;
  Result := FCliCom.RequestData(ncnmPaginasImpressas, @Req, SizeOf(Req), nmdByteArray, nil, 0, nmdByteArray);
end;

end.
