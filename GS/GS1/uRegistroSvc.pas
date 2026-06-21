unit uRegistroSvc;

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

  TRegistroServ = class(TService)
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
  RegistroServ: TRegistroServ;
  RegThread : TRegistroThread;

implementation

uses uRSDM;

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  RegistroServ.Controller(CtrlCode);
end;

function TRegistroServ.GetServiceController: TServiceController;
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
begin
  DM := nil;
  try
    DM := TDM.Create(nil);
    while not Terminated do begin
      ProcessMessages;
      Sleep(5);
    end;
  finally
    RegThread := nil;
    FreeAndNil(DM);
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

procedure TRegistroServ.ServiceStop(Sender: TService;
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

procedure TRegistroServ.ServiceStart(Sender: TService;
  var Started: Boolean);
begin
  RegThread := TRegistroThread.Create;
  Started := True;
end;

procedure TRegistroServ.ServiceExecute(Sender: TService);
begin
  RegThread.Resume;
  while not Terminated do begin
    ServiceThread.ProcessRequests(False);
    Sleep(5);
  end;
  RegThread.Suspend;
end;

end.
