unit uNR_Email_Svc;

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

  TRegistroNextar_Email = class(TService)
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
  RegistroNextar_Email: TRegistroNextar_Email;
  RegThread : TRegistroThread;

implementation

uses NR_Email_DM, nrDebug;

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  RegistroNextar_Email.Controller(CtrlCode);
end;

function TRegistroNextar_Email.GetServiceController: TServiceController;
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
var Dummy: Integer;
begin
  DM := nil;
  try
    try
      DM := Tdm.Create(nil);
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
    if DM<>nil then
      FreeAndNil(DM);
  except
  end;
end;

procedure TRegistroThread.ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;  
end;

procedure TRegistroNextar_Email.ServiceStop(Sender: TService;
  var Stopped: Boolean);
begin
  if RegThread <> nil then 
    RegThread.Resume;

  if RegThread <> nil then  
    RegThread.Terminate;

  if RegThread <> nil then  
    RegThread.WaitFor;
    
  Stopped := True;
end;

procedure TRegistroNextar_Email.ServiceStart(Sender: TService;
  var Started: Boolean);
begin
  RegThread := TRegistroThread.Create;
  Started := True;
end;

procedure TRegistroNextar_Email.ServiceExecute(Sender: TService);
begin
  RegThread.Resume;
  while not Terminated do begin
    ServiceThread.ProcessRequests(False);
    Sleep(5);
  end;
  RegThread.Suspend;
end;

end.
