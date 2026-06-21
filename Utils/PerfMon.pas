unit PerfMon;

interface

uses Classes, SysUtils;

type
  TPerfMon = class
  private
    FArq   : Text;
    FName  : String;
    FStart : Cardinal;
    FQtd   : Integer;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Start(aName: String = '');
    procedure Done;
  end;

implementation

{ TPerfMon }

constructor TPerfMon.Create;
var S: String;
begin
  S := ExtractFilePath(ParamStr(0)) + 'performance.txt';
  Assign(FArq, S);
  Rewrite(FArq);
  Writeln(FArq, 'Inicio em ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now));
end;

destructor TPerfMon.Destroy;
begin
  Writeln(FArq, 'Finalizado em ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now));
  inherited;
end;

procedure TPerfMon.Done;
begin
  if FStart>0 then
    Writeln(FArq, FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' + FName + ': ' + (GetTickCount-FStart)
end;

procedure TPerfMon.Start(aName: String);
begin

end;

end.
