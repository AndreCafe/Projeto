unit LoggerIntf;

interface

type
  ILogger = interface
    ['{14C78CA6-69E5-11D6-9239-0004AC5359AE}']
    procedure Clear;
    procedure LogMessage(const AMessage: String);
  end;

function Logger: ILogger;
procedure SetLogger(ALogger: ILogger);

implementation

var
  FLogger : ILogger;

function Logger: ILogger;
begin
  Result := FLogger;
end;

procedure SetLogger(ALogger: ILogger);
begin
  FLogger := ALogger;
end;

end.
 