unit uNexMonitors;

interface

uses
   classes, forms;

   procedure scanMonitors;

var
  gMonitorIDX : integer;

implementation

procedure scanMonitors;
var
    i, mmon, mw : integer;
begin

    mw := 0;
    mmon  := 0;
    for i:=0 to screen.MonitorCount-1 do
      if screen.Monitors[i].Width > mw then begin
          mw := screen.Monitors[i].Width;
          mmon := screen.Monitors[i].Left;
          gMonitorIDX := i;
      end;

 //   top  := 0;
 //   left := mmon;


end;

end.
