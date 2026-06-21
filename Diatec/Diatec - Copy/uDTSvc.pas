unit uDTSvc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr,
  ExtCtrls;

type

  TDiaTecThread = class (TThread)
    protected
      procedure ProcessMessages;
    public
      constructor Create;
      procedure Execute; override;
  end;

  TDiaTec = class(TService)
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceExecute(Sender: TService);
    procedure ServiceCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  DiaTec: TDiaTec;
  FDiaTecThread : TDiaTecThread;

implementation

uses uDTSrvBDServ, uDTSrvProcessa, uDTSyncDef;


{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  DiaTec.Controller(CtrlCode);
end;

function TDiaTec.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TDiaTecThread.ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;  
end;

procedure TDiaTecThread.Execute;
begin
  try
    dmBDServ := nil;
    DMProc := nil;
    dmBDServ := TdmBDServ.Create(nil);
    DMProc := TDMProc.Create(nil);
    while not Terminated do begin
      ProcessMessages;
      Sleep(5);
    end;
  except
    if DMProc <> nil then FreeAndNil(DMProc);
    if dmBDServ <> nil then FreeAndNil(dmBDServ);
    Raise;
  end;
  if DMProc <> nil then FreeAndNil(DMProc);
  if dmBDServ <> nil then FreeAndNil(dmBDServ);
end;

constructor TDiaTecThread.Create;
begin
  inherited Create(True);
end;

procedure TDiaTec.ServiceStart(Sender: TService; var Started: Boolean);
begin
  FDiaTecThread := TDiaTecThread.Create;
  Started := True;
end;

procedure TDiaTec.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  FDiaTecThread.Resume;
  FDiaTecThread.Terminate;
  FDiaTecThread.WaitFor;
  Stopped := True;
end;

procedure TDiaTec.ServiceExecute(Sender: TService);
begin
  FDiaTecThread.Resume;
  while not Terminated do begin
    ServiceThread.ProcessRequests(False);
    Sleep(5);
  end;
  FDiaTecThread.Suspend;
end;

procedure TDiaTec.ServiceCreate(Sender: TObject);
begin
  Name := cfgServiceName;
  DisplayName := cfgServiceDisplayName;
end;

end.
