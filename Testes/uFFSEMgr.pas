unit uFFSEMgr;

interface

uses
  windows, messages, sysutils, classes, controls, forms, fflleng, ffsreng, 
  ffllcomm, fflllgcy, fflllog, ffllthrd, ffnetmsg, ffsrintm, ffsrcmd, ffllbase,
  ffsrsec, ffsqlbas, ffsqleng, ffllcomp, ffsrjour, Db, ffdb, ffdbbase;

type
  TFFEngineManager1 = class(TFFBaseEngineManager)
    SE: TffServerEngine;
    EventLog : TffEventLog;
    CommandHandler : TFFServerCommandHandler;
    SecurityMonitor : TFFSecurityMonitor;
    ThreadPool : TFFThreadPool;
    SUPTransport : TFFLegacyTransport;
    TCPIPTransport : TFFLegacyTransport;
    SQLEngine: TffSqlEngine;
    ffClient1: TffClient;
    ffSession1: TffSession;
    ffTable1: TffTable;
    DataSource1: TDataSource;
    ffCommsEngine1: TffCommsEngine;
    ffTable1Telefone: TStringField;
    ffTable1EspLogradouro: TStringField;
    ffTable1Logradouro: TStringField;
    ffTable1Numero: TIntegerField;
    ffTable1Complemento: TStringField;
    ffTable1Zona: TStringField;
    ffTable1Nome: TStringField;
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

var
  FFEngineManager1: TFFEngineManager1;

implementation

{$R *.DFM}

{====================================================================}
constructor TFFEngineManager1.Create(Sender: TComponent);
begin
  inherited Create(Sender);
  EventLog.FileName := ExtractFilePath(Application.ExeName) + 'FFServer.log';
end;
{--------}
function TFFEngineManager1.GetLogEnabled : boolean;
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
procedure TFFEngineManager1.GetServerEngines(var aServerList: TffList);
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
procedure TFFEngineManager1.GetTransports(aServer    : TffIntermediateServerEngine;
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
procedure TFFEngineManager1.Process(Msg : PffDataMessage; var Handled : Boolean);
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
procedure TFFEngineManager1.RecoveryCheck(Sender : TObject);
begin
  with FFRecoveryClass.Create do
    try
      Check(TffServerEngine(Sender));
    finally
      Free;
    end;
end;
{--------}
procedure TFFEngineManager1.Restart;
begin
  Shutdown;
  Startup;
end;
{--------}
procedure TFFEngineManager1.SetLogEnabled(const aEnabled : boolean);
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
procedure TFFEngineManager1.SetScriptFile(const aFileName : TffFullFileName);
var
  Idx : Integer;
begin
  FScriptFile := aFileName;
  for Idx := 0 to Pred(ComponentCount) do
    if (Components[Idx] is TffServerEngine) then
      TffServerEngine(Components[Idx]).ScriptFile := aFileName;
end;
{--------}
procedure TFFEngineManager1.ShutDown;
var
  Idx : Integer;
begin
  for Idx := 0 to Pred(ComponentCount) do
    if (Components[Idx] is TFFBaseServerEngine) or
       (Components[Idx] is TFFBasePluginEngine) then
      TffStateComponent(Components[Idx]).Shutdown;
end;
{--------}
procedure TFFEngineManager1.StartUp;
var
  Idx : Integer;
begin
  for Idx := 0 to Pred(ComponentCount) do
    if (Components[Idx] is TFFBaseServerEngine) or
       (Components[Idx] is TFFBasePluginEngine) then
      TffStateComponent(Components[Idx]).Startup;
end;
{--------}
procedure TFFEngineManager1.Stop;
var
  Idx : Integer;
begin
  for Idx := 0 to Pred(ComponentCount) do
    if (Components[Idx] is TFFBaseServerEngine) or
       (Components[Idx] is TFFBasePluginEngine) then
      TffStateComponent(Components[Idx]).Stop;
end;
{====================================================================}

procedure TFFEngineManager1.ffBaseEngineManagerCreate(Sender: TObject);
begin
  SE.Configuration.AddAlias('Teste', 'C:\');
  SE.WriteAliasData;
end;

end.
