unit ncUploadDelay;

interface

uses classes, sysUtils, uLogs;

function delay(aThread: TThread; aMinutes: integer; aDelta: double; aLabel:string):boolean;

implementation

uses
     ncUploadMain;
     
function delay(aThread: TThread; aMinutes: integer; aDelta: double; aLabel:string):boolean;
var
    d, i: integer;
begin
    result := true;

    if aMinutes=0 then begin
        GLog.Log(nil,[lcDebug], aLabel + ' delay=0, continue.');
        exit;
    end;
    
    d := (aMinutes * 60000) + random( trunc( aMinutes * aDelta * 60000 ));
    GLog.Log(nil,[lcDebug], aLabel +' '+ floattostr( d / 60000) + ' min.');

    while d>0 do begin

        if TncUploadThread(aThread).Terminated then begin
            GLog.Log(nil,[lcDebug], aLabel + ' terminated');
            result := false;
            exit;
        end;

        for i:= 0 to 4 do
            if not TncUploadThread(aThread).Terminated then
                sleep(200);
        dec(d, 1000);
        
    end;

    GLog.Log(nil,[lcDebug], aLabel + ' done');
end;


end.
