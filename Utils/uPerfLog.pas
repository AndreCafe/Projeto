unit uPerfLog;

interface

uses Classes, SysUtils, Windows;

type
  TPerfLog = class
  private
    FArq   : Text;
    FName  : String;
    FStart : Cardinal;
    FActive : Boolean;
    procedure SetActive(const Value: Boolean);
  public
    constructor Create;
    destructor Destroy; override;

    procedure Start(aName: String);
    procedure Done;

    property Active: Boolean
      read FActive write SetActive;
  end;

var 
  PerfLog: TPerfLog = nil;  

implementation

{ TPerfLog }


function SMS(C: Cardinal): String;
begin
  Str((C/1000):1:3, Result);
end;

constructor TPerfLog.Create;
begin
  FActive := False;
  FName := '';
  FStart := 0;
end;

destructor TPerfLog.Destroy;
begin
  Active := False;
  inherited;
end;

procedure TPerfLog.Done;
begin
  if FStart>0 then begin
    if FActive then 
      Writeln(FArq, FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' + FName + ': ' + SMS(GetTickCount-FStart));
    FStart := 0;
    FName := '';
  end;
end;

procedure TPerfLog.SetActive(const Value: Boolean);
var S: String;
begin
  if Value = FActive then Exit;
  if Value then begin
    S := ExtractFilePath(ParamStr(0)) + 'perflog.txt';
    Assign(FArq, S);
    Rewrite(FArq);
    Writeln(FArq, 'Ativado em ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now));
  end else begin
    Writeln(FArq, 'Destivado em ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now));
    CloseFile(FArq);
  end;  
  FActive := Value;
end;
  
procedure TPerfLog.Start(aName: String);
begin
  FStart := GetTickCount;
  FName := aName;
end;

initialization
  PerfLog := TPerfLog.Create;

finalization
  if Assigned(PerfLog) then 
    PerfLog.Free;

end.
