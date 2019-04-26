{
esta unit define os tipos, constantes e métodos usados na comunicao via
windows message, que é feita entre diferentes componentes / threads do 
sistema.
}

unit ncMsgCom;

interface

uses
  SysUtils,
  Windows,
  Classes,
  Messages,
  nxstMessages;

type  

  PmsgDestroiObj = ^TmsgDestroiObj;
  TmsgDestroiObj = packed record
    msgTipoClasse : Integer;
    msgChave      : String[30];
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
  
  TTipoDados = (tdPointer, tdStream);
  
  procedure EnviaMsg(H: HWND; Msg: UInt; WParam: WPARAM; LParam: LPARAM);
  
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

ncmc_Primeira    = ncmc_AtualizaObj;
ncmc_Ultima      = ncmc_Tela;

implementation

function GetMsgIDString(aMsg: integer): String;
begin
  case aMsg of
    ncmc_AtualizaObj        : Result := 'ncmc_AtualizaObj';
    ncmc_NovoObj            : Result := 'ncmc_NovoObj';
    ncmc_DestroiObj         : Result := 'ncmc_DestroiObj';
    ncmc_ServidorDesativado : Result := 'ncmc_ServidorDesativado';
    ncmc_CapturaTela        : Result := 'ncmc_CapturaTela';
    ncmc_Tela               : Result := 'ncmc_Tela';
    ncmc_Shutdown           : Result := 'ncmc_ShutDown';
    ncmc_TransfArqEv        : Result := 'ncmc_TransfArqEv';
    ncmc_ChatEv             : Result := 'ncmc_ChatEv';
    ncmc_AbriuFechouCaixa   : Result := 'ncmc_AbriuFechouCaixa';
    ncmc_ObtemProcessos     : Result := 'ncmc_ObtemProcesso';
    ncmc_FinalizaProcesso   : Result := 'ncmc_FinalizaProcesso';
    ncmc_SiteBloqueado      : Result := 'ncmc_SiteBloqueado';
    ncmc_SuporteRemEv       : Result := 'ncmc_SuporeRemEv';
    ncmc_ChecaLicEv         : Result := 'ncmc_ChecaLicEv';
    ncmc_HorarioEv          : Result := 'ncmc_HorarioEv';
  else
    Result := 'MsgID: '+IntToStr(aMsg);  
  end;
end;

procedure EnviaMsg(H: HWND; Msg: UInt; WParam: WPARAM; LParam: LPARAM);
begin
  if (H <> 0) {and IsWindow(H)} then
    PostMessage(H, Msg, wParam, lParam)
  else
    FreeDados(Msg, Pointer(LParam));  
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
  else
    Result := 0;
  end;    
end;

procedure FreeDados(Msg: UInt; Dados: Pointer);
begin
  case ObtemTipoDados(Msg) of
    tdPointer : FreeMem(Dados, ObtemTamanhoDados(Msg));
    tdStream  : TStream(Dados).Free;
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


end.
