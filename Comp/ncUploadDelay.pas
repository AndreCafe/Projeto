unit ncUploadDelay;

interface

uses classes, sysUtils, uLogs;

function delay(aThread: TThread; aSeconds: integer; aDelta: double; aLabel:string):boolean;

implementation

uses
     ncUploadMain;
     
function delay(aThread: TThread; aSeconds: integer; aDelta: double; aLabel:string):boolean;
var
    d, i: integer;
begin
    result := true;

    if aSeconds=0 then begin
        GLog.Log(nil,[lcDebug], aLabel + ' delay=0, continue.');
        exit;
    end;              
    
    d := (aSeconds * 1000) + random( trunc( aSeconds * aDelta * 1000 ));
    GLog.Log(nil,[lcDebug], aLabel +' '+ floattostr( d / 1000) + ' secs.');

    while d>0 do begin

        if TncUploadThread(aThread).Terminated then begin
            GLog.Log(nil,[lcDebug], aLabel + ' terminated');
            result := false;
            exit;
        end;

//        for i:= 0 to 4 do
//            if not TncUploadThread(aThread).Terminated then
//                sleep(200);
//        dec(d, 1000);

        if not TncUploadThread(aThread).Terminated then
            sleep(100)
        else
            d := 100;
        dec(d, 100);

    end;

    GLog.Log(nil,[lcDebug], aLabel + ' done');
end;


end.
