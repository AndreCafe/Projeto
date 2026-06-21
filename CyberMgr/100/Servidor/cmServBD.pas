unit CMServBD;

interface

uses
  windows, messages, sysutils, classes, controls, forms, fflleng, ffsreng, 
  ffllcomm, fflllgcy, ffllprot, fflllog, ffllthrd, ffnetmsg, ffsrintm, ffsrcmd, ffllbase,
  ffsrsec, ffsqlbas, ffsqleng, ffllcomp, ffsrjour, FileCtrl;

type
  TMyLT = Class(TffLegacyTransport);
  
  TFFEM = class(TFFBaseEngineManager)
    ServerEngine : TFFServerEngine;
    EventLog : TffEventLog;
    CommandHandler : TFFServerCommandHandler;
    SecurityMonitor : TFFSecurityMonitor;
    ThreadPool : TFFThreadPool;
    TCPIPTransport : TFFLegacyTransport;
    ffSqlEngine1: TffSqlEngine;
    procedure RecoveryCheck(Sender : TObject);
    procedure ffBaseEngineManagerCreate(Sender: TObject);
  private
    { private declarations }
  protected
    FScriptFile : TffFullFileName;
    function GetLogEnabled : boolean;
    procedure SetLogEnabled(const aEnabled : boolean);
    procedure SetScriptFile(const aFileName : TffFullFileName);
  public
    constructor Create(Sender: TComponent); override;
    procedure GetServerEngines(var aServerList : TffList);
    procedure GetTransports(aServer : TffIntermediateServerEngine; var aTransList : TffList);
    procedure Process(Msg : PffDataMessage; var Handled : Boolean); override;
    procedure Restart; override;
    procedure ShutDown; override;
    procedure StartUp; override;
    procedure Stop; override;

    { Properties }
    property EventLogEnabled : boolean
             read  GetLogEnabled
             write SetLogEnabled;

    property ScriptFile : TffFullFileName
             read FScriptFile
             write SetScriptFile;

  end;


  TCMServidorBD = class (TThread)
  private
    FFFEM : TffEM;
    FRunning : Boolean;
  protected
    procedure Execute; override;
  public
    constructor Create;
    destructor Destroy; override;
    
    function FFHWND: HWND;  
    
    property Running: Boolean
      read FRunning;   

    property Terminated;    
  end;

procedure AjustaNIC;
  

var
  FFEM: TFFEM;
  FFServerEng : TffServerEngine;

const
  CMAliasPath : String = 'C:\CyberMgr\Dados';

implementation

uses VocTimer;

{$R *.DFM}

{====================================================================}
constructor TFFEM.Create(Sender: TComponent);
begin
  inherited Create(Sender);
  EventLog.FileName := ExtractFilePath(ParamStr(0)) + 'FFServer.log';
end;
{--------}
function TFFEM.GetLogEnabled : boolean;
var
  Idx : Integer;
begin
  Result := False;
  { Assumption: Event log is enabled if we find a server engine
    that is routing events to the log. }
  for Idx := 0 to Pred(ComponentCount) do
    if (Components[Idx] is TffBaseServerEngine) then begin
      Result := TffBaseServerEngine(Components[Idx]).EventLogEnabled;
      break;
    end;
end;
{--------}
procedure TFFEM.GetServerEngines(var aServerList: TffList);
var
  ServerListItem : TffIntListItem;
  i              : Integer;
begin
  for I := 0 to Pred(ComponentCount) do
    if (Components[i] is TffBaseServerEngine) then begin
      ServerListItem := TffIntListItem.Create(longint(Components[i]));
      aServerList.Insert(ServerListItem);
    end;
end;
{--------}
procedure TFFEM.GetTransports(aServer    : TffIntermediateServerEngine;
                                     var aTransList : TffList);
var
  TransportItem : TffIntListItem;
  i, k          : Integer;
begin
  for i := 0 to Pred(aServer.CmdHandlerCount) do begin
    for k := 0 to Pred(aServer.CmdHandler[i].TransportCount) do begin
      TransportItem := TffIntListItem.Create(Integer(aServer.CmdHandler[i].Transports[k]));
      aTransList.Insert(TransportItem);
    end;
  end;
end;
{--------}
procedure TFFEM.Process(Msg : PffDataMessage; var Handled : Boolean);
begin
  Handled := True;
  case Msg.dmMsg of
    ffnmServerRestart  : Restart;
    ffnmServerShutdown : ShutDown;
    ffnmServerStartUp  : StartUp;
    ffnmServerStop     : Stop;
  else
    Handled := False;
  end;
end;
{--------}
procedure TFFEM.RecoveryCheck(Sender : TObject);
begin
  with FFRecoveryClass.Create do
    try
      Check(TffServerEngine(Sender));
    finally
      Free;
    end;
end;
{--------}
procedure TFFEM.Restart;
begin
  Shutdown;
  Startup;
end;
{--------}
procedure TFFEM.SetLogEnabled(const aEnabled : boolean);
var
  Idx : Integer;
begin
  { Assumption: TffBaseLog is always enabled.  We just control which
    components are issuing messages to the log. }
  for Idx := 0 to Pred(ComponentCount) do
    if (Components[Idx] is TffLoggableComponent) then
      TffLoggableComponent(Components[Idx]).EventLogEnabled := aEnabled
end;
{--------}
procedure TFFEM.SetScriptFile(const aFileName : TffFullFileName);
var
  Idx : Integer;
begin
  FScriptFile := aFileName;
  for Idx := 0 to Pred(ComponentCount) do
    if (Components[Idx] is TffServerEngine) then
      TffServerEngine(Components[Idx]).ScriptFile := aFileName;
end;
{--------}
procedure TFFEM.ShutDown;
var
  Idx : Integer;
begin
  for Idx := 0 to Pred(ComponentCount) do
    if (Components[Idx] is TFFBaseServerEngine) or
       (Components[Idx] is TFFBasePluginEngine) then
      TffStateComponent(Components[Idx]).Shutdown;
end;
{--------}
procedure AjustaNIC;
begin
{  InterfaceSt := '0';
  try
    SL := TStringList.Create;
    try
      FName := ExtractFilePath(ParamStr(0)) + 'FFRede.TXT';
      if FileExists(FName) then 
      try
        SL.LoadFromFile(FName);
        InterfaceSt := SL.Values['NIC'];
      except
      end;  
      if InterfaceSt = '' then InterfaceSt := '0';
    except
    end;
    SL.Free;
  except
  end;  
  InterfaceI := StrToIntDef(InterfaceSt, 0);  }
  ffc_TCPInterface := -1;
end;

procedure TFFEM.StartUp;
var
  Idx : Integer;
begin
  TCPIPTransport.Enabled := True;
  for Idx := 0 to Pred(ComponentCount) do
    if (Components[Idx] is TFFBaseServerEngine) or
       (Components[Idx] is TFFBasePluginEngine) then
      TffStateComponent(Components[Idx]).Startup;
end;
{--------}
procedure TFFEM.Stop;
var
  Idx : Integer;
begin
  for Idx := 0 to Pred(ComponentCount) do
    if (Components[Idx] is TFFBaseServerEngine) or
       (Components[Idx] is TFFBasePluginEngine) then
      TffStateComponent(Components[Idx]).Stop;
end;
{====================================================================}

procedure TFFEM.ffBaseEngineManagerCreate(Sender: TObject);
begin
  ffc_TCPInterface := -1;
  ServerEngine.Configuration.GeneralInfo^.giNoAutoSaveCfg := True;
  ServerEngine.Configuration.GeneralInfo^.giServerName := 'CMServidorBD';
  try
    CMAliasPath :=  ExtractFileDir(ParamStr(0))+'\Dados';
    if not DirectoryExists(CMAliasPath) then
      MkDir(CMAliasPath);
    ServerEngine.Configuration.AliasList.DeleteAlias('CyberMgr');
    ServerEngine.Configuration.AddAlias('CyberMgr', CMAliasPath, False);
  except
  end;  
end;

procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

constructor TCMServidorBD.Create;
begin
  FRunning := False;
  inherited Create(False);
end;

destructor TCMServidorBD.Destroy;
begin
  if not Terminated then begin
    Terminate;
    WaitFor;
  end;  
  FffEM.Free;
  inherited;
end;

procedure TCMServidorBD.Execute;
var 
  VT: TVocTimer;
  Dummy: Integer;
begin
  try
    FffEM := TffEM.Create(nil);
    FffEM.StartUp;
    FFServerEng := FffEM.ServerEngine;
    
    FRunning := True;
    
    if not (FffEM.TCPIPTransport.State in [ffesInitializing, ffesStarting, ffesStarted]) then 
    begin
      VTInicia(VT, 2000);
      while not VTExpirou(VT) do begin
        ProcessMessages;
        Sleep(1);
      end;  
      FffEM.TCPIPTransport.Startup;
      FffEM.TCPIPTransport.Enabled := True;
    end;
    
    while not Terminated do begin
      MsgWaitForMultipleObjects(0, Dummy, False, 500, QS_ALLINPUT);
      try
        ProcessMessages;
      except
      end;
    end;
    VTInicia(VT, 1000);
    while not VTExpirou(VT) do begin
      ProcessMessages;
      Sleep(1);
    end;  
    FffEM.ShutDown;
  except
  end;
end;

function TCMServidorBD.FFHWND: HWND;   
begin
  Result := TMyLT(FffEM.TCPIPTransport).FLostConnWindow;
end;

end.
