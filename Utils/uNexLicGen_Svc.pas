unit uNexLicGen_Svc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs, ncDebug;

type

  TLicGenThread = class (TThread)
    protected
      procedure ProcessMessages;
    public
      constructor Create;
      destructor Destroy; override;
      procedure Execute; override;
  end;

  TNextarLicGen = class(TService)
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
  NextarLicGen: TNextarLicGen;
  LicGenThread : TLicGenThread = nil;

implementation

uses uDMNexLicGen;

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  NextarLicGen.Controller(CtrlCode);
end;

function TNextarLicGen.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

{ TLicGenThread }

constructor TLicGenThread.Create;
begin
  inherited Create(True);
  LicGenThread := Self;               
end;

destructor TLicGenThread.Destroy;
begin
  LicGenThread := nil;
  inherited;
end;

procedure TLicGenThread.Execute;
var Dummy: Integer;
begin
  DMKeyGen := nil;
  try
    try
      DMKeyGen := TDMKeyGen.Create(nil);
      while (not Terminated) do begin
        MsgWaitForMultipleObjects(0, Dummy, False, 500, QS_ALLINPUT);
        try
          ProcessMessages;
        except
        end;
      end;        
    except
      on E: Exception do
        DebugMsgEsp('TKeyGenThread.Execute - E.Message: ' + E.Message, False, True);
    end;
    if dmKeyGen<>nil then
      FreeAndNil(dmKeyGen);
  except
    on E: Exception do 
      DebugMsgEsp('TKeyGenThread.Execute - E.Message: ' + E.Message, False, True);
  end;
end;

procedure TLicGenThread.ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;  
end;

procedure TNextarLicGen.ServiceExecute(Sender: TService);
begin
  try LicGenThread.Resume; except end;
  while not Terminated do begin
    ServiceThread.ProcessRequests(False);
    Sleep(5);
  end;
  try  LicGenThread.Suspend; except end;
end;

procedure TNextarLicGen.ServiceStart(Sender: TService;
  var Started: Boolean);
begin
  LicGenThread := TLicGenThread.Create;
  Started := True;
end;

procedure TNextarLicGen.ServiceStop(Sender: TService;
  var Stopped: Boolean);
begin
  if LicGenThread <> nil then 
    LicGenThread.Resume;

  if LicGenThread <> nil then  
    LicGenThread.Terminate;

  if LicGenThread <> nil then  
    LicGenThread.WaitFor;
    
  Stopped := True;
end;

end.
