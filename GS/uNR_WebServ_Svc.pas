unit uNR_WebServ_Svc;

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

  TRegistroNextar_WebServer = class(TService)
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
  RegistroNextar_WebServer: TRegistroNextar_WebServer;
  RegThread : TRegistroThread;

implementation

uses NR_WebServ_DM, nrDebug, nr_db_conn, uDMContas;

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  RegistroNextar_WebServer.Controller(CtrlCode);
end;

function TRegistroNextar_WebServer.GetServiceController: TServiceController;
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
  dmc : TdmContas;
  C: Cardinal;
  Ok: Boolean;
begin
  DM := nil;
  dmc := nil;
  try
    try
      try 
        Start_DBConn(nil); 
        dmc := TdmContas.Create(nil);
        C := GetTickCount;
        try
          repeat
            dmc.tCli.Active := False;
            dmc.CheckDB;
          until dmc.tCli.Active or ((GetTickCount-C)>10000);
          if dmc.tCli.Active then
            DebugMsg('TRegistroThread.Execute - Abriu DB OK') else
            DebugMsg('TRegistroThread.Execute - DB Fail');
        finally
          dmc.Free;
        end;
      except 
      end;
      
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

procedure TRegistroNextar_WebServer.ServiceStop(Sender: TService;
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

procedure TRegistroNextar_WebServer.ServiceStart(Sender: TService;
  var Started: Boolean);
begin
  RegThread := TRegistroThread.Create;
  Started := True;
end;

procedure TRegistroNextar_WebServer.ServiceExecute(Sender: TService);
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
