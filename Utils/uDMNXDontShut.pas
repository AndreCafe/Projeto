unit uDMNXDontShut;

interface

uses
  SysUtils, Classes, SyncObjs, Windows, 
  nxllTransport,
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

  TThreadDontShut = class ( TThread )
  protected
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


{ TThreadDontShut }

procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

procedure TThreadDontShut.Execute;
var 
  d: TDM;
begin
  IncQtd;
  try
    try
      D := Tdm.Create(nil);
      try
        D.nxTCPIP.Active := True;
        D.nxSession.Active := True;
        Sleep(random(5000));
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
