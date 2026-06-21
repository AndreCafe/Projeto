{
esta unit define os tipos, constantes e métodos usados na comunicao via
windows message, que é feita entre diferentes componentes / threads do 
sistema.
}

unit cmMsgCom;

interface

uses
  CSCBase,
  Windows,
  Classes,
  Messages;
  
type  
  PmsgDestroiObj = ^TmsgDestroiObj;
  TmsgDestroiObj = packed record
    msgTipoClasse : Integer;
    msgChave      : String[30];
  end;  

  PmsgShutdown = ^TmsgShutdown;
  TmsgShutdown = packed record
    msgMaq : Byte; // 0 - Todas
    msgOper : Byte; // 0 - Fechar CMTempo, 1 - Reiniciar Maq, 2 - Desligar Maq
  end;

  PmsgTransfArqEv = ^TmsgTransfArqEv;
  TmsgTransfArqEv = packed record
    msgTransfInfo : TCSCnmFileTransmissionEv;
  end;
  
  TTipoLParam = (tlpInteger, tlpPointer, tlpStream);
  
  procedure EnviaMsg(H: HWND; Msg: UInt; WParam: WPARAM; LParam: LPARAM);
  
  function ObtemTipoLParam(Msg: UInt): TTipoLParam;
  function ObtemTamanhoLParam(Msg: UInt): Integer;
  function ClonaLParam(Msg: UInt; LParam: LParam): LParam;
  procedure FreeLParam(Msg: UInt; LParam: LPARAM);

const
  
// ID das mensagens trocadas
cmmc_AtualizaObj        = WM_User + 1;
cmmc_NovoObj            = WM_User + 2;
cmmc_DestroiObj         = WM_User + 3;
cmmc_ServidorDesativado = WM_User + 4;
cmmc_PedeTela           = WM_User + 5;
cmmc_Shutdown           = WM_User + 6;
cmmc_TransfArqEv        = WM_User + 7;
cmmc_ChatEv             = WM_User + 8;


cmmc_Primeira    = cmmc_AtualizaObj;
cmmc_Ultima      = cmmc_ChatEv;

implementation

procedure EnviaMsg(H: HWND; Msg: UInt; WParam: WPARAM; LParam: LPARAM);
begin
  if (H <> 0) {and IsWindow(H)} then
    PostMessage(H, Msg, wParam, lParam)
  else
    FreeLParam(Msg, LParam);  
end;

function ObtemTipoLParam(Msg: UInt): TTipoLParam;
begin
  case Msg of
    cmmc_AtualizaObj,
    cmmc_ChatEv, 
    cmmc_NovoObj      : Result := tlpStream;
    cmmc_Shutdown,
    cmmc_TransfArqEv,
    cmmc_DestroiObj   : Result := tlpPointer;
  else
    Result := tlpInteger;
  end;
end;

function ObtemTamanhoLParam(Msg: UInt): Integer;
begin
  case Msg of
    cmmc_Shutdown   : Result := SizeOf(TmsgShutdown);
    cmmc_DestroiObj : Result := SizeOf(TmsgDestroiObj);
    cmmc_TransfArqEv : Result := SizeOf(TmsgTransfArqEv);
  else
    Result := 0;
  end;    
end;

procedure FreeLParam(Msg: UInt; LParam: LPARAM);
begin
  case ObtemTipoLParam(Msg) of
    tlpPointer : FreeMem(Pointer(LParam), ObtemTamanhoLParam(Msg));
    tlpStream  : TStream(LParam).Free;
  end;
end;

function ClonaLParam(Msg: UInt; LParam: LParam): LParam;
begin
  case ObtemTipoLParam(Msg) of
    tlpPointer : begin
      GetMem(Pointer(Result), ObtemTamanhoLParam(Msg));
      Move(Pointer(LParam)^, Pointer(Result)^, ObtemTamanhoLParam(Msg));
    end;
      
    tlpStream  : begin
      TMemoryStream(Result) := TMemoryStream.Create;
      TMemoryStream(Result).LoadFromStream(TStream(LParam));
    end;
      
    tlpInteger : Result := LParam;
  end;
end;


end.
