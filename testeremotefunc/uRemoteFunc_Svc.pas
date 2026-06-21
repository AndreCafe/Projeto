unit uRemoteFunc_Svc;

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

  TRemoteFunc = class(TService)
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceExecute(Sender: TService);
    procedure ServiceDestroy(Sender: TObject);
    procedure ServiceAfterInstall(Sender: TService);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  remoteFunc: TRemoteFunc;
  RegThread : TRegistroThread;

implementation

uses uRemoteFunc_DM, uLogs, registry;

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  RemoteFunc.Controller(CtrlCode);
end;

function TRemoteFunc.GetServiceController: TServiceController;
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
var Dummy : Integer;
begin
  dmRemoteFunc := nil;
  try
    try

      dmRemoteFunc := TdmRemoteFunc.Create(nil);
      while (not Terminated) do begin
        MsgWaitForMultipleObjects(0, Dummy, False, 500, QS_ALLINPUT);
        try
          ProcessMessages;
        except
        end;
      end;        
    except
      on E: Exception do
        GLog.Log (self, [lcExcept], 'TRegistroThread.Execute - E.Message: ' + E.Message);
    end;
    if dmRemoteFunc<>nil then
      FreeAndNil(dmRemoteFunc);
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

procedure TRemoteFunc.ServiceStop(Sender: TService;
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

procedure TRemoteFunc.ServiceStart(Sender: TService;
  var Started: Boolean);
begin
  RegThread := TRegistroThread.Create;
  Started := True;
end;

procedure TRemoteFunc.ServiceAfterInstall(Sender: TService);
begin

  with TRegistry.Create(KEY_READ or KEY_WRITE) do
  try
    RootKey := HKEY_LOCAL_MACHINE;
    if OpenKey('\SYSTEM\CurrentControlSet\Control\SafeBoot\Minimal\'+DisplayName, true) then begin
        WriteString('', 'Service');
        CloseKey;
    end;
    if OpenKey('\SYSTEM\CurrentControlSet\Control\SafeBoot\Network\'+DisplayName, true) then begin
        WriteString('', 'Service');
        CloseKey;
    end;
  finally
    Free;
  end;
end;

procedure TRemoteFunc.ServiceDestroy(Sender: TObject);
begin
    GLog.CloseLogFile;

end;

procedure TRemoteFunc.ServiceExecute(Sender: TService);
begin

  RegThread.Resume;
  while not Terminated do begin
    ServiceThread.ProcessRequests(False);
    Sleep(5);
  end;
  RegThread.Suspend;
end;

end.
