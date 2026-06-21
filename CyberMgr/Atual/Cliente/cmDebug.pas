unit cmDebug;

interface

uses
  Dialogs;

var
  DebugAtivo : Boolean = False;

  procedure DebugMsg(S: String);  

implementation

procedure DebugMsg(S: String);
begin
  if DebugAtivo then 
    ShowMessage(S);
end;

end.
