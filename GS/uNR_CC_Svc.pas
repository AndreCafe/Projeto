unit uNR_CC_Svc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs;

type

  TRegistroThread = class (TThread)
    protected
      procedure ProcessMessages;
    public
      constructor Create;
      procedure Execute; override;
  end;

  TRegistroNextar_SalvaChecaConta = class(TService)
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceExecute(Sender: TService);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  RegistroNextar_SalvaChecaConta: TRegistroNextar_SalvaChecaConta;
  RegThread : TRegistroThread;

implementation

uses NR_cc_dm, nrDebug, nr_db_conn;

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  RegistroNextar_SalvaChecaConta.Controller(CtrlCode);
end;

function TRegistroNextar_SalvaChecaConta.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

{ TRegistroThread }

constructor TRegistroThread.Create;
begin
  inherited Create(True);
  RegThread := Self;
end;

procedure TRegistroThread.Execute;
var 
  Dummy : Integer;
  dm : Tdm_cc;
  C: Cardinal;
  Ok: Boolean;
begin
  dm := Tdm_cc.Create(nil);
  try
    while (not Terminated) do begin
      MsgWaitForMultipleObjects(0, Dummy, False, 500, QS_ALLINPUT);
      try
        ProcessMessages;
      except
      end;
    end;        
  except
    on E: Exception do
      DebugMsg('TRegistroThread.Execute - E.Message: ' + E.Message);
  end;
  dm.Free;
end;

procedure TRegistroThread.ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;  
end;

procedure TRegistroNextar_SalvaChecaConta.ServiceStop(Sender: TService;
  var Stopped: Boolean);
begin
  Terminar := True;
  
  if RegThread <> nil then 
    RegThread.Resume;

  if RegThread <> nil then  
    RegThread.Terminate;

  if RegThread <> nil then  
    RegThread.WaitFor;
    
  Stopped := True;
end;

procedure TRegistroNextar_SalvaChecaConta.ServiceStart(Sender: TService;
  var Started: Boolean);
begin
  RegThread := TRegistroThread.Create;
  Started := True;
end;

procedure TRegistroNextar_SalvaChecaConta.ServiceExecute(Sender: TService);
begin

  CurrencyString := 'R$';
  ThousandSeparator := '.';
  DecimalSeparator := ',';
  ShortDateFormat := 'dd/mm/yyyy';

  RegThread.Resume;
  while not Terminated do begin
    ServiceThread.ProcessRequests(False);
    Sleep(5);
  end;
  RegThread.Suspend;
end;

end.
