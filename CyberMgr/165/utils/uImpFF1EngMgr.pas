{*********************************************************}
{* FlashFiler: Engine manager                            *}
{* Generated on 05/12/2003 with Release 2,1300           *}
{*********************************************************}

{$I ffdefine.inc}

unit uImpFF1EngMgr;

interface

uses
  windows, messages, sysutils, classes, controls, forms, fflleng, ffsreng, 
  ffllcomm, fflllgcy, fflllog, ffllthrd, ffnetmsg, ffsrintm, ffsrcmd, ffllbase,
  ffsrsec, ffsqlbas, ffsqleng, ffllcomp, ffsrjour, ffdb, ffdbbase;

type
  TFFEngMgr = class(TffBaseEngineManager)
    ffServer: TffServerEngine;
    ffDB: TffDatabase;
    ffSession: TffSession;
    ffCli: TffClient;
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
    procedure Shutdown; override;
    procedure Startup; override;
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
  FFEngMgr: TFFEngMgr;

implementation

uses FileCtrl;

{$R *.DFM}

{====================================================================}
constructor TFFEngMgr.Create(Sender: TComponent);
begin
  inherited Create(Sender);
end;
{--------}
function TFFEngMgr.GetLogEnabled : boolean;
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
procedure TFFEngMgr.GetServerEngines(var aServerList: TffList);
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
procedure TFFEngMgr.GetTransports(aServer    : TffIntermediateServerEngine;
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
procedure TFFEngMgr.Process(Msg : PffDataMessage; var Handled : Boolean);
begin
  Handled := True;
  case Msg.dmMsg of
    ffnmServerRestart  : Restart;
    ffnmServerShutdown : Shutdown;
    ffnmServerStartUp  : Startup;
    ffnmServerStop     : Stop;
  else
    Handled := False;
  end;
end;
{--------}
procedure TFFEngMgr.Restart;
begin
  Shutdown;
  Startup;
end;
{--------}
procedure TFFEngMgr.SetLogEnabled(const aEnabled : boolean);
var
  Idx : Integer;
begin
  { Assumption: TffBaseLog is always enabled.  We just control which
    components are issuing messages to the log. }
  for Idx := 0 to Pred(ComponentCount) do
    if (Components[Idx] is TffLoggableComponent) and
       not (Components[Idx] is TffBaseTransport) then
      TffLoggableComponent(Components[Idx]).EventLogEnabled := aEnabled
end;
{--------}
procedure TFFEngMgr.SetScriptFile(const aFileName : TffFullFileName);
var
  Idx : Integer;
begin
  FScriptFile := aFileName;
  for Idx := 0 to Pred(ComponentCount) do
    if (Components[Idx] is TffServerEngine) then
      TffServerEngine(Components[Idx]).ScriptFile := aFileName;
end;
{--------}
procedure TFFEngMgr.Shutdown;
var
  Idx : Integer;
begin
  for Idx := 0 to Pred(ComponentCount) do
    if ((Components[Idx] is TFFBaseServerEngine) or
        (Components[Idx] is TFFBasePluginEngine)) and
        not (TffStateComponent(Components[Idx]).State in
          [ffesInactive, ffesStopped]) then
      TffStateComponent(Components[Idx]).Shutdown;
end;
{--------}
procedure TFFEngMgr.Startup;
var
  Idx : Integer;
begin
  for Idx := 0 to Pred(ComponentCount) do
    if (Components[Idx] is TFFBaseServerEngine) or
       (Components[Idx] is TFFBasePluginEngine) then
      TffStateComponent(Components[Idx]).Startup;
end;
{--------}
procedure TFFEngMgr.Stop;
var
  Idx : Integer;
begin
  for Idx := 0 to Pred(ComponentCount) do
    if (Components[Idx] is TFFBaseServerEngine) or
       (Components[Idx] is TFFBasePluginEngine) then
      TffStateComponent(Components[Idx]).Stop;
end;
{====================================================================}

procedure TFFEngMgr.ffBaseEngineManagerCreate(Sender: TObject);
var S: String;
begin
  ffServer.Configuration.GeneralInfo^.giNoAutoSaveCfg := True;
  ffServer.Configuration.GeneralInfo^.giServerName := 'CMServidorBD';
  try
    S :=  ExtractFileDir(ParamStr(0))+'\Dados';
    if not DirectoryExists(S) then
      MkDir(S);
    ffServer.Configuration.AliasList.DeleteAlias('CyberMgr');
    ffServer.Configuration.AddAlias('CyberMgr', S, False);
  except
  end;  

end;

end.
