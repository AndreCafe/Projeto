{
esta unit define os tipos, constantes e métodos usados na comunicao via
windows message, que é feita entre diferentes componentes / threads do 
sistema.
}
{
    ResourceString: Dario 13/03/13
}

unit ncMsgCom;

interface

uses
  ncDebug,
  SysUtils,
  Windows,
  Classes,
  Messages,
  nxstMessages;

type  

  PmsgDestroiObj = ^TmsgDestroiObj;
  TmsgDestroiObj = packed record
    msgTipoClasse : Integer;
    msgChave      : String[50];
  end;  

  PmsgShutdown = ^TmsgShutdown;
  TmsgShutdown = packed record
    msgMaq : Word; // 0 - Todas
    msgOper : Byte; // 0 - Fechar NexGuard, 1 - Reiniciar Maq, 2 - Desligar Maq
  end;

  PmsgHorarioEv = ^TmsgHorarioEv;
  TmsgHorarioEv = packed record
    msgHora : TDateTime;
  end;  

  PmsgSuporteRemEv = ^TmsgSuporteRemEv;
  TmsgSuporteRemEv = packed record
    msgMaq : Word;
    msgTec : Word;
  end;

  PmsgCapturaTela = ^TmsgCapturaTela;
  TmsgCapturaTela = packed record
    msgSession : Integer;
    msgMaq : Word;
  end;
  
  TmsgObtemProcessos = packed record
    msgIDCliente : Integer;
    msgIDRequest : Integer;
    msgMaq       : Word;
  end;
  PmsgObtemProcessos = ^TmsgObtemProcessos;

  TmsgFinalizaProcesso = packed record
    msgProcessID : Integer;
    msgMaq       : Word;
  end;
  PmsgFinalizaProcesso = ^TmsgFinalizaProcesso;

  TmsgPubPar = class
    pbBRT        : Variant;
    pbHPOpenBef  : Variant;
    pbExCookie   : Variant;
    pbHPUrl      : Variant;
    pbHPTab      : Variant;
    pbSkyUrl     : Variant;
    pbTbUrl      : Variant;
    pbBanners    : Variant;
    pbBotoes     : Variant;

    pbDTol       : Variant;
    pbDVA        : Variant;
    pbPreLib     : Variant;
    pbAlertaAss  : Variant;

    constructor Create;
    
    function AllNull: Boolean;
    procedure Limpa;
  end;

  PmsgMonitorOnOff = ^TmsgMonitorOnOff;
  TmsgMonitorOnOff = record
    msgMaq : Word;
    msgOn : Boolean;
  end;
  
  TTipoDados = (tdPointer, tdStream);
  
  procedure EnviaMsg(H: HWND; Msg: UInt; WParam: WPARAM; LParam: LPARAM);

  procedure EnviaSiteBloq(H: HWND; aBloq: Boolean; aURL: String);
  
  function ObtemTipoDados(Msg: UInt): TTipoDados; 
  function ObtemTamanhoDados(Msg: UInt): Integer;
  function ClonaDados(Msg: UInt; Dados: Pointer): Pointer;
  procedure FreeDados(Msg: UInt; Dados: Pointer);

  function GetMsgIDString(aMsg: integer): String;

const
  
// ID das mensagens trocadas
ncmc_AtualizaObj        = WM_User + 10001;
ncmc_NovoObj            = WM_User + 10002;
ncmc_DestroiObj         = WM_User + 10003;
ncmc_ServidorDesativado = WM_User + 10004;
ncmc_Shutdown           = WM_User + 10006;
ncmc_TransfArqEv        = WM_User + 10007;
ncmc_ChatEv             = WM_User + 10008;
ncmc_AbriuFechouCaixa   = WM_User + 10009;
ncmc_ObtemProcessos     = WM_User + 10010;
ncmc_FinalizaProcesso   = WM_User + 10011;
ncmc_SiteBloqueado      = WM_User + 10012;
ncmc_SuporteRemEv       = WM_User + 10013;
ncmc_ChecaLicEv         = WM_User + 10014;
ncmc_HorarioEv          = WM_User + 10015;
ncmc_CapturaTela        = WM_User + 10016;
ncmc_Tela               = WM_User + 10017;
ncmc_MonitorOnOffEv     = WM_User + 10018;

ncmc_Primeira    = ncmc_AtualizaObj;
ncmc_Ultima      = ncmc_MonitorOnOffEv;

var
  CliNotifyHandle : HWND = 0;

implementation

uses variants;

procedure EnviaSiteBloq(H: HWND; aBloq: Boolean; aURL: String);
const BoolStr : Array[Boolean] of Char = ('N', 'S');
var S : TMemoryStream;
begin
  S := tMemoryStream.Create;
  aURL := BoolStr[aBloq]+aURL;
  S.WriteBuffer(aURL[1], Length(aURL));
  EnviaMsg(H, ncmc_SiteBloqueado, 0, Integer(S));
end;


function GetMsgIDString(aMsg: integer): String;
begin
  case aMsg of
    ncmc_AtualizaObj        : Result := 'ncmc_AtualizaObj'; // do not localize
    ncmc_NovoObj            : Result := 'ncmc_NovoObj'; // do not localize
    ncmc_DestroiObj         : Result := 'ncmc_DestroiObj'; // do not localize
    ncmc_ServidorDesativado : Result := 'ncmc_ServidorDesativado'; // do not localize
    ncmc_CapturaTela        : Result := 'ncmc_CapturaTela'; // do not localize
    ncmc_Tela               : Result := 'ncmc_Tela'; // do not localize
    ncmc_Shutdown           : Result := 'ncmc_ShutDown'; // do not localize
    ncmc_TransfArqEv        : Result := 'ncmc_TransfArqEv'; // do not localize
    ncmc_ChatEv             : Result := 'ncmc_ChatEv'; // do not localize
    ncmc_AbriuFechouCaixa   : Result := 'ncmc_AbriuFechouCaixa'; // do not localize
    ncmc_ObtemProcessos     : Result := 'ncmc_ObtemProcesso'; // do not localize
    ncmc_FinalizaProcesso   : Result := 'ncmc_FinalizaProcesso'; // do not localize
    ncmc_SiteBloqueado      : Result := 'ncmc_SiteBloqueado'; // do not localize
    ncmc_SuporteRemEv       : Result := 'ncmc_SuporeRemEv'; // do not localize
    ncmc_ChecaLicEv         : Result := 'ncmc_ChecaLicEv'; // do not localize
    ncmc_HorarioEv          : Result := 'ncmc_HorarioEv'; // do not localize
    ncmc_MonitorOnOffEv     : Result := 'ncmc_MonitorOnOffEv'; // do not localize
  else
    Result := 'MsgID: '+IntToStr(aMsg);   // do not localize
  end;
end;

procedure EnviaMsg(H: HWND; Msg: UInt; WParam: WPARAM; LParam: LPARAM);
begin
  if (H <> 0) {and IsWindow(H)} then  begin
    DebugMsg('ncMsgCom.EnviaMsg - H: '+IntToStr(H) + ' - Msg: ' + GetMsgIDString(Msg) + ' - WParam: ' + IntToStr(WParam) + ' - LParam: ' + IntToStr(LParam)); // do not localize
    PostMessage(H, Msg, wParam, lParam);
  end else begin
    DebugMsg('ncMsgCom.EnviaMsg - H: 0 - Msg: '+GetMsgIDString(Msg)); // do not localize
    FreeDados(Msg, Pointer(LParam));
  end;
end;

function ObtemTipoDados(Msg: UInt): TTipoDados;
begin
  case Msg of
    ncmc_AtualizaObj,
    ncmc_ChatEv, 
    ncmc_SiteBloqueado,
    ncmc_Tela,
    ncmc_NovoObj      : Result := tdStream;
    ncmc_Shutdown,
    ncmc_TransfArqEv,
    ncmc_ObtemProcessos,
    ncmc_FinalizaProcesso,
    ncmc_SuporteRemEv,
    ncmc_HorarioEv, 
    ncmc_CapturaTela,
    ncmc_MonitorOnOffEv,
    ncmc_DestroiObj   : Result := tdPointer;
  end;
end;

function ObtemTamanhoDados(Msg: UInt): Integer;
begin
  case Msg of
    ncmc_ObtemProcessos : Result := SizeOf(TmsgObtemProcessos);
    ncmc_FinalizaProcesso : Result := SizeOf(TmsgFinalizaProcesso);
    ncmc_Shutdown   : Result := SizeOf(TmsgShutdown);
    ncmc_DestroiObj : Result := SizeOf(TmsgDestroiObj);
    ncmc_SuporteRemEv : Result := SizeOf(TmsgSuporteRemEv);
    ncmc_HorarioEv : Result := SizeOf(TmsgHorarioEv);
    ncmc_CapturaTela : Result := SizeOf(TmsgCapturaTela);
    ncmc_MonitorOnOffEv : result := SizeOf(TmsgMonitorOnOff);
  else
    Result := 0;
  end;    
end;

procedure FreeDados(Msg: UInt; Dados: Pointer);
begin
  try
    case ObtemTipoDados(Msg) of
      tdPointer : FreeMem(Dados, ObtemTamanhoDados(Msg));
      tdStream  : TStream(Dados).Free;
    end;
  except
  end;
end;

function ClonaDados(Msg: UInt; Dados: Pointer): Pointer;
begin
  case ObtemTipoDados(Msg) of
    tdPointer : begin
      GetMem(Result, ObtemTamanhoDados(Msg));
      Move(Dados^, Result^, ObtemTamanhoDados(Msg));
    end;
      
    tdStream  : begin
      TMemoryStream(Result) := TMemoryStream.Create;
      TMemoryStream(Result).LoadFromStream(TStream(Dados));
    end;
  end;
end;

{ TmsgPubPar }

function TmsgPubPar.AllNull: Boolean;
begin
  Result :=
    VarIsNull(pbBRT        ) and
    VarIsNull(pbHPOpenBef  ) and
    VarIsNull(pbExCookie   ) and
    VarIsNull(pbHPUrl      ) and
    VarIsNull(pbSkyUrl     ) and
    VarIsNull(pbTbUrl      ) and
    VarIsNull(pbHPTab      ) and
    VarIsNull(pbBanners    ) and
    VarIsNull(pbDTol       ) and
    VarIsNull(pbPreLib     ) and
    VarIsNull(pbDVA        ) and
    VarIsNull(pbAlertaAss  ) and
    VarIsNull(pbBotoes     );
end;

constructor TmsgPubPar.Create;
begin
  Limpa;
end;

procedure TmsgPubPar.Limpa;
begin
  pbBRT := null;
  pbHPOpenBef := null;
  pbExCookie := null;
  pbHPUrl := null;
  pbHPTab := null;
  pbTBUrl := null;
  pbSkyUrl := null;
  pbBanners := null;
  pbBotoes := null;
  pbDTol := null;
  pbDVA := null;
  pbPreLib := null;
  pbAlertaAss := null;
end;

end.

