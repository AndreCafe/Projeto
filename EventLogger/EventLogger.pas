unit EventLogger;

interface

uses
  Windows,
  Messages,
  SysUtils,
  StringUtil,
  Classes;

const
  LinesToFlush = 50;
    
type  
  TEventLogger = class
    FNumLines  : Integer;
    FArqLog    : Text;
    FActive    : Boolean;
    FAutoFlush : Boolean;
    FArqOk     : Boolean;
  protected
    procedure SetActive(Value: Boolean);
  public  
    constructor Create(aFileName: String);
    destructor Destroy; override;

    procedure Log(Channel: Integer; S: String);
    procedure LogFlush(Channel: Integer; S: String);

    procedure CustomLog(Channel: Integer; aFlush: Boolean; S: String);
    procedure LogStr(S: String);
    procedure LogDateTimeStr(S: String);

    procedure FlushLog;

    property Active: Boolean
      read FActive write SetActive;

    property AutoFlush: Boolean
      read FAutoFlush write FAutoFlush;
  end;  
    
implementation

constructor TEventLogger.Create(aFileName: String);
begin
  FActive    := False;
  FAutoFlush := False;
  FNumLines  := 0;
  FArqOk := False;
  {$I-}
  AssignFile(FArqLog, aFileName);
  if FileExists(aFileName) then
    Append(FArqLog)
  else  
    Rewrite(FArqLog);

  FArqOk := (IOResult=0);  
 {$I+}
end;  

destructor TEventLogger.Destroy;
begin
  CloseFile(FArqLog);
end;

procedure TEventLogger.SetActive(Value: Boolean);
begin
  FActive := Value;
  if not FActive then FlushLog;
end;

procedure TEventLogger.CustomLog(Channel: Integer; aFlush: Boolean; S: String);
begin
  if not FArqOk then Exit;
  
  if Channel > 0 then
    Writeln(FArqLog, FormatDateTime('dd/mm/yyyy  hh:mm:ss', Now) + 
            '  CH: ' + IntPad(Channel, 2) + '  - ' + S)
  else  
    Writeln(FArqLog, FormatDateTime('dd/mm/yyyy  hh:mm:ss', Now) + 
            '          - ' + S);
    
  if aFlush then 
    FlushLog
  else begin
    Inc(FNumLines);
    if FNumLines >= LinesToFlush then
      FlushLog;
  end;    
end;

procedure TEventLogger.Log(Channel: Integer; S: String);
begin
  if not FActive then Exit;
  CustomLog(Channel, FAutoFlush, S);
end;

procedure TEventLogger.LogFlush(Channel: Integer; S: String);
begin
  if not FActive then Exit;
  CustomLog(Channel, True, S);
end;

procedure TEventLogger.FlushLog;
begin
  Flush(FArqLog);
  FNumLines := 0;
end;


procedure TEventLogger.LogStr(S: String);
begin
  if not FActive then Exit;
  Writeln(FArqLog, S);
  Inc(FNumLines);
  if FNumLines >= LinesToFlush then
    FlushLog;
end;

procedure TEventLogger.LogDateTimeStr(S: String);
begin
  LogStr(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now)+ ' - ' + S);
end;

end.
