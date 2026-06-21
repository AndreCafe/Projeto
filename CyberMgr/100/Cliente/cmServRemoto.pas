unit cmServRemoto;

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
  cmMsgCom,
  cmNetMsg,
  cmClassesBase;

type
  
  TCMServidorRemoto = class ( TCMServidorBase )
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
      message cmnmAtualizaObjEv;
      
    procedure nmDestroiObjEv(var Msg: TCSCMessage);
      message cmnmDestroiObjEv;
      
    procedure nmNovoObjEv(var Msg: TCSCMessage);
      message cmnmNovoObjEv;

    procedure nmPedeTelaEv(var Msg: TCSCMessage);
      message cmnmPedeTelaEv;

    procedure nmShutdownEv(var Msg: TCSCMessage);
      message cmnmShutdownEv; 

    procedure nmTransfArqEv(var Msg: TCSCMessage);
      message cmnmTransfArqEv; 

    procedure nmFileTransmissionEv(var Msg : TCSCMessage);
      message cscnmFileTransmissionEv;
      
      
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function ObtemLicenca(var LicencaStr: TLicencaStr): Integer; override;
    function SalvaLicenca(LicencaStr: String): Integer; override;
    
    function SalvaStreamObj(Novo: Boolean; S: TStream): Integer; override;
    function ObtemStreamConfig(S: TStream): Integer; override;
    function ObtemStreamListaObj(Cliente: Integer; TipoClasse: Integer; S: TStream): Integer; override;
    function ApagaObj(Cliente: Integer; TipoClasse: Integer; Chave: String): Integer; override;
    
    function CapturaTelaMaq(aMaq: Byte; S: TMemoryStream): integer; override;
    function SalvaTelaMaq(aMaq: Byte; S: TMemoryStream): integer; override;
    
    function LoginMaq(aMaq: Byte; aContato: Integer; aUserName, aSenha, aNome, aObsAcesso: String; aLimiteTempo: Cardinal; aSinal: Double; aTipoAcesso: Word): Integer; override;
    function LogoutMaq(aMaq: Byte): Integer; override;
    
    function PararTempoMaq(aMaq: Byte; aParar: Boolean): Integer; override;
    function TransferirMaq(aOrigem, aDestino: Byte): Integer; override;
    function LiberarAlemPacote(aMaq: Byte): Integer; override;
    
    function PreLogoutMaq(aMaq: Byte): Integer; override;
    function CancLogoutMaq(aMaq: Byte): Integer; override;  

    function BaixaNovaVersao(Programa, Versao, ArqDestino: String): Integer; override;
    

    function RefreshPrecos: integer; override;
    function ShutdownMaq(aMaq, aOper: Byte): integer; override;
    
    function Login(aUsername, aSenha: String; aMaq: Byte; aFuncAtual: Boolean; aRemoto: Boolean; aWndHandle: HWND; aProxyHandle: Integer; aSocket: Integer; var Handle: Integer): Integer; override;
    function ModoManutencao(aMaq: Byte; aUsername, aSenha: String; aEntrar: Boolean): Integer; override;
    
    procedure Logout(Cliente: Integer); override;
  published
    property Host: String
      read GetHost write SetHost;
  end;
  
  function CMServRemotoWndFunc(hWindow : Hwnd; Msg : UINT;
                               wParam : WPARAM;
                               lParam : LPARAM) : LRESULT; stdcall export;

const
  NomeClasseServRemoto = 'TCMServidorRemoto';
  
implementation

{ TCMServidorRemoto }

constructor TCMServidorRemoto.Create(AOwner: TComponent);
begin
  inherited;
  CriaWndHandle;
  FCliCom := TCSCClient.Create(Self);
  FCliCom.OnDisconnect := Desconectou;
  FCliCom.NotifyHandle := FWndHandle;
  FCliCom.Port := ptCyberMgr;
end;

destructor TCMServidorRemoto.Destroy;
begin
  SetAtivo(False);
  FCliCom.Free;
  DestroyWindow(FWndHandle);
  inherited;
end;

function TCMServidorRemoto.GetHost: String;
begin
  Result := FCliCom.Host;
end;

function TCMServidorRemoto.Login(aUsername, aSenha: String; aMaq: Byte;
  aFuncAtual: Boolean; aRemoto: Boolean; aWndHandle: HWND; aProxyHandle: Integer;
  aSocket: Integer; var Handle: Integer): Integer;
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
  Result := FCliCom.RequestData(cmnmLogin, @Request, I, nmdByteArray,
                                @Handle, SizeOf(Handle), nmdByteArray);
  if Result = 0 then
    inherited Login(aUsername, aSenha, aMaq, aFuncAtual, aRemoto, aWndHandle, aProxyHandle, aSocket, Handle);                                
end;

procedure TCMServidorRemoto.Logout(Cliente: Integer);
begin
  inherited;
  FCliCom.RequestData(cmnmLogout, @Cliente, SizeOf(Cliente), 
                      nmdByteArray, nil, 0, nmdByteArray);
end;

procedure TCMServidorRemoto.SetAtivo(Valor: Boolean);
begin
  if Valor = FAtivo then Exit;
  FCliCom.ConnectAndWait;
  inherited;
end;

procedure TCMServidorRemoto.SetHost(Valor: String);
begin
  FCliCom.Host := Valor;
end;

procedure TCMServidorRemoto.Desconectou(Sender: TObject);
begin
  inherited SetAtivo(False);
end;

procedure TCMServidorRemoto.ProcessaEventosArqPendentes;
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

procedure TCMServidorRemoto.ProcessaEventosPendentes;
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

procedure TCMServidorRemoto.CriaWndHandle;
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
  Obj : TCMServidorRemoto;
  
  function DefWndFunc : LongInt;
  begin
    DefWndFunc := DefWindowProc(hWindow, Msg, wParam, lParam);
  end;

begin
  Result := 0;
  Obj := nil;

  if MSG<>wm_Create then begin
    Obj := TCMServidorRemoto(GetWindowLong(hWindow, 0));
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

procedure TCMServidorRemoto.nmAtualizaObjEv(var Msg: TCSCMessage);
var S: TMemoryStream;
begin
  S := TMemoryStream.Create;
  TStream(Msg.dmData).Position := 0;
  S.LoadFromStream(TStream(Msg.dmData));
  S.Position := 0;
  EnviaEvento(cmmc_AtualizaObj, 0, Integer(S));
end;

procedure TCMServidorRemoto.nmDestroiObjEv(var Msg: TCSCMessage);
var 
  Evento : TnmObj;
  msgDestroi : PmsgDestroiObj;
begin
  Evento := TnmObj(Msg.dmData^);
  New(msgDestroi);
  msgDestroi^.msgTipoClasse := Evento.nmTipoClasse;
  msgDestroi^.msgChave := Evento.nmChave;
  EnviaEvento(cmmc_DestroiObj, 0, Integer(msgDestroi));
end;

procedure TCMServidorRemoto.nmNovoObjEv(var Msg: TCSCMessage);
var S: TMemoryStream;
begin
  S := TMemoryStream.Create;
  S.LoadFromStream(TStream(Msg.dmData));
  S.Position := 0;
  EnviaEvento(cmmc_NovoObj, 0, Integer(S));
end;

procedure TCMServidorRemoto.nmPedeTelaEv(var Msg: TCSCMessage);
begin
  with TnmCapturaTela(Msg.dmData^) do
    EnviaEvento(cmmc_PedeTela, nmMaq, 0);
end;

procedure TCMServidorRemoto.nmShutdownEv(var Msg: TCSCMessage);
var 
  msgShutdown : PmsgShutdown;
begin
  New(msgShutdown);
  with TnmShutdown(Msg.dmData^) do begin
    msgShutdown.msgMaq := nmMaq;
    msgShutdown.msgOper := nmOper;
  end;  
  EnviaEvento(cmmc_Shutdown, 0, Integer(msgShutdown));
end;

procedure TCMServidorRemoto.nmTransfArqEv(var Msg: TCSCMessage);
var 
  msgTransfArqEv : PmsgTransfArqEv;
begin
  New(msgTransfArqEv);
  Move(Msg.dmData^, msgTransfArqEv^.msgTransfInfo, SizeOf(msgTransfArqEv^.msgTransfInfo));
  EnviaEvento(cmmc_TransfArqEv, 0, Integer(msgTransfArqEv));
end;

procedure TCMServidorRemoto.nmFileTransmissionEv(var Msg : TCSCMessage);
begin
  nmTransfArqEv(Msg);
end;

function TCMServidorRemoto.ObtemStreamListaObj(Cliente,
  TipoClasse: Integer; S: TStream): Integer;
var Request : TnmObtemListaReq;  
begin
  Request.nmCliente := Cliente;
  Request.nmTipoClasse := TipoClasse;
  Result := FCliCom.RequestData(cmnmObtemLista, @Request, SizeOf(Request), 
                                nmdByteArray, Pointer(S), 0, nmdStream);
end;

function TCMServidorRemoto.ApagaObj(Cliente: Integer; TipoClasse: Integer; Chave: String): Integer;
var Request : TnmObj;
begin
  Request.nmCliente := Cliente;
  Request.nmTipoClasse := TipoClasse;
  Request.nmChave := Chave;
  Result := FCliCom.RequestData(cmnmApagaObj, @Request, SizeOf(Request), 
                                nmdByteArray, nil, 0, nmdByteArray);
end;


function TCMServidorRemoto.SalvaStreamObj(Novo: Boolean; S: TStream): Integer;
const
  ID_Msg : Array[Boolean] of Integer = (cmnmAlteraObj, cmnmNovoObj);
begin
  with FCliCom do
  Result := 
    RequestData(ID_Msg[Novo], S, S.Size, nmdStream, nil, 0, nmdByteArray); 
end;

function TCMServidorRemoto.CapturaTelaMaq(aMaq: Byte; S: TMemoryStream): integer; 
var
  Req : TnmCapturaTela;
begin
  Req.nmMaq := aMaq;
  Result := FCliCom.RequestData(cmnmCapturaTelaMaq, @Req, SizeOf(Req), nmdByteArray,
                                Pointer(S), 0, nmdStream);
end;

function TCMServidorRemoto.SalvaTelaMaq(aMaq: Byte; S: TMemoryStream): integer;
begin
  S.Position := S.Size;
  S.Write(aMaq, 1);
  Result := FCliCom.RequestData(cmnmSalvaTelaMaq, Pointer(S), S.Size, nmdStream,
                                nil, 0, nmdByteArray);
end;

function TCMServidorRemoto.TransferirMaq(aOrigem, aDestino: Byte): Integer; 
var
  Req : TnmTransferirMaqReq;
begin
  Req.nmOrigem := aOrigem;
  Req.nmDestino := aDestino;
  Result := FCliCom.RequestData(cmnmTransferirMaq,  @Req, SizeOf(Req), nmdByteArray,
                                nil, 0, nmdByteArray);
end;

function TCMServidorRemoto.LiberarAlemPacote(aMaq: Byte): Integer; 
var
  Req : TnmLiberarAlemPacoteReq;
begin
  Req.nmMaq := aMaq;
  Result := FCliCom.RequestData(cmnmLiberarAlemPacote, @Req, SizeOf(Req), nmdByteArray,
                                nil, 0, nmdByteArray);
end;

function TCMServidorRemoto.PararTempoMaq(aMaq: Byte; aParar: Boolean): Integer; 
var
  Req : TnmPararTempoMaqReq;
begin
  Req.nmMaq := aMaq;
  Req.nmParar := aParar;
  Result := FCliCom.RequestData(cmnmPararTempoMaq,  @Req, SizeOf(Req), nmdByteArray,
                                nil, 0, nmdByteArray);
end;
  
function TCMServidorRemoto.LoginMaq(aMaq: Byte; aContato: Integer; aUserName, aSenha,
  aNome, aObsAcesso: String; aLimiteTempo: Cardinal; aSinal: Double; aTipoAcesso: Word): Integer;
var 
  Req : TnmLoginMaqReq;  
begin
  Req.nmMaq := aMaq;
  Req.nmUsername := aUsername;
  Req.nmSenha := aSenha;
  Req.nmNome := aNome;
  Req.nmLimiteTempo := aLimiteTempo;
  Req.nmTipoAcesso := aTipoAcesso;
  Req.nmSinal := aSinal;
  Req.nmContato := aContato;
  Req.nmObs := aObsAcesso;
  Result := FCliCom.RequestData(cmnmLoginMaq, 
                                @Req, SizeOf(Req), nmdByteArray,
                                nil, 0, nmdByteArray);
end;

function TCMServidorRemoto.LogoutMaq(aMaq: Byte): Integer;
var 
  Req : TnmLogoutMaqReq;  
begin
  Req.nmMaq := aMaq;
  Result := FCliCom.RequestData(cmnmLogoutMaq, 
                                @Req, SizeOf(Req), nmdByteArray,
                                nil, 0, nmdByteArray);
end;

function TCMServidorRemoto.BaixaNovaVersao(Programa, Versao, ArqDestino: String): Integer;
var
  Req : TnmBaixaAtualizacao;
begin
  Req.nmPrograma := Programa;
  Req.nmVersao   := Versao;
  StrECopy(Req.nmNomeArq, PChar(ArqDestino));
  
  Result := FCliCom.RequestData(cmnmBaixaAtualizacao, @Req, SizeOf(Req), 
                                nmdByteArray, nil, 0, nmdByteArray);
end;  

function TCMServidorRemoto.PreLogoutMaq(aMaq: Byte): Integer;
var 
  Req : TnmLogoutMaqReq;  
begin
  Req.nmMaq := aMaq;
  Result := FCliCom.RequestData(cmnmPreLogoutMaq, 
                                @Req, SizeOf(Req), nmdByteArray,
                                nil, 0, nmdByteArray);
end;

function TCMServidorRemoto.CancLogoutMaq(aMaq: Byte): Integer;
var 
  Req : TnmLogoutMaqReq;  
begin
  Req.nmMaq := aMaq;
  Result := FCliCom.RequestData(cmnmCancLogoutMaq, 
                                @Req, SizeOf(Req), nmdByteArray,
                                nil, 0, nmdByteArray);
end;

function TCMServidorRemoto.ObtemStreamConfig(S: TStream): Integer;
begin
  Result := FCliCom.RequestData(cmnmObtemStreamConfig, nil, 0, nmdByteArray, Pointer(S), 0, nmdStream);
  S.Position := 0;
end;

function TCMServidorRemoto.ObtemModoDemo(var MD, NumMaq : Integer): Integer;
var Reply : TnmObtemModoDemoRpy;
begin
  Result := FCliCom.RequestData(cmnmObtemModoDemo, nil, 0, nmdByteArray, @Reply, SizeOf(MD), nmdByteArray);
  if Result = 0 then begin
    MD := Reply.nmModoDemo;
    NumMaq := Reply.nmNumMaq;
  end;  
end;

function TCMServidorRemoto.RefreshPrecos: integer;
begin
  Result := FCliCom.RequestData(cmnmRefreshPrecos, nil, 0, nmdByteArray, nil, 0, nmdByteArray);
end;

function TCMServidorRemoto.ShutdownMaq(aMaq, aOper: Byte): integer;
var Req : TnmShutdown;
begin
  Req.nmMaq := aMaq;
  Req.nmOper := aOper;
  Result := FCliCom.RequestData(cmnmShutdown, @Req, SizeOf(Req), nmdByteArray, nil, 0, nmdByteArray);
end;

function TCMServidorRemoto.ModoManutencao(aMaq: Byte; aUsername, aSenha: String; aEntrar: Boolean): Integer; 
var Req : TnmModoManutencaoReq;
begin
  Req.nmMaq := aMaq;
  Req.nmUsername := aUsername;
  Req.nmSenha := aSenha;
  Req.nmEntrar := aEntrar;
  Result := FCliCom.RequestData(cmnmModoManutencao, @Req, SizeOf(Req), nmdByteArray, nil, 0, nmdByteArray);
end;

function TCMServidorRemoto.ObtemLicenca(
  var LicencaStr: TLicencaStr): Integer;
var Reply: TnmLicenca;  
begin
  Result := FCliCom.RequestData(cmnmObtemLicenca, nil, 0, nmdByteArray, @Reply, SizeOf(Reply), nmdByteArray);
  LicencaStr := Reply.nmLicencaStr;
end;

function TCMServidorRemoto.SalvaLicenca(LicencaStr: String): Integer;
var Req: TnmLicenca;  
begin
  Req.nmLicencaStr := LicencaStr;
  Result := FCliCom.RequestData(cmnmSalvaLicenca, @Req, SizeOf(Req), nmdByteArray, nil, 0, nmdByteArray);
end;

end.
