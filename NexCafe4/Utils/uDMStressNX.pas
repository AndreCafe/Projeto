unit uDMStressNX;

interface

uses
  SysUtils, Classes, SyncObjs, CSCBase, Windows, CSCCustomBase, CSCClient, ncClassesBase,
  ncCompCliente, ncNXServRemoto, nxllTransport,
  nxllSimpleCommandHandler, nxdb, nxllComponent, nxptBasePooledTransport,
  nxtwWinsockTransport, nxllSimpleSession;

type
  Tdm = class(TDataModule)
    nxSession: TnxSimpleSession;
    nxTCPIP: TnxWinsockTransport;
    nxCmdH: TnxSimpleCommandHandler;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TThreadStress = class ( TThread )
  protected
     procedure AoTransferirArq(Sender: TObject; Etapa: Byte; MsgID, TamArq,
        Posicao: Integer; NomeArq: string; Enviando: Boolean);
    procedure Execute; override;
  end;

  function GetQtd: Integer;
  procedure IncQtd;
  procedure DecQtd;
  

var
  NumTh: Integer;
  CS : TCriticalSection = nil;
  dm: Tdm;
  serv : String = '127.0.0.1';

implementation

{$R *.dfm}


{ TThreadStress }

procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

procedure TThreadStress.AoTransferirArq(Sender: TObject; Etapa: Byte; MsgID,
  TamArq, Posicao: Integer; NomeArq: string; Enviando: Boolean);
begin
end;

procedure TThreadStress.Execute;
var 
  d: TDM;
  I: Integer;
  Inicio: Cardinal;
begin
  IncQtd;
  try
    try
      D := Tdm.Create(nil);
      try
        I := 10;
        while (I>0) and (not D.nxTCPIP.Active) do begin
          try
            D.nxTCPIP.Active := True;
            D.nxSession.Active := True;
            Sleep(random(5000));
          except
            D.nxSession.Active := False;
            D.nxTCPIP.Active := False;
            Sleep(Random(500));
            Dec(I);
          end;
        end;
        Inicio := GetTickCount;
{        while not Terminated do begin
          MsgWaitForMultipleObjects(0, I, False, Random(400), QS_ALLINPUT);
          try
            ProcessMessages;
          except
          end;
          if (GetTickCount-Inicio)>600000 then Terminate;
        end;}   
      finally
        D.free;
      end;
    except
    end;
  finally
    DecQtd;
  end;
end;

function GetQtd: Integer;
begin
  CS.Enter;
  try
    Result := NumTh;  
  finally
    CS.Leave;
  end;
end;

procedure IncQtd;
begin
  CS.Enter;
  try
    Inc(NumTh);
  finally
    CS.Leave;
  end;
end;

procedure DecQtd;
begin
  CS.Enter;
  try
    Dec(NumTh);
  finally
    CS.Leave;
  end;
end;


initialization
  NumTh := 0;
  CS := TCriticalSection.Create;
  Randomize;

finalization
  CS.Free;  

end.
