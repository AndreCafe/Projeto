unit uDisplayUtils;

interface

uses math, sysutils;

    function showTime(t:TDatetime):string;
    function showBytes(b:int64):string;
    function showVel(v:double):string;
    function SizeToStr(b:Int64):string;

implementation

function showTime(t:TDatetime):string;
var
    AHour, AMinute, ASecond, AMilliSecond: Word;
begin
    result := '';
    DecodeTime( t, AHour, AMinute, ASecond, AMilliSecond);
    if trunc(t)>1 then
       result := result + ' ' + inttostr(trunc(t)) + ' dias'
    else
    if trunc(t)>0 then
       result := result + ' ' + inttostr(trunc(t)) + ' dia';

    if AHour>1 then
       result := result + ' ' + inttostr(AHour) + ' horas'
    else
    if AHour>0 then
       result := result + ' ' + inttostr(AHour) + ' hora';

    if AMinute>1 then
       result := result + ' ' + inttostr(AMinute) + ' minutos'
    else
    if AMinute>0 then
       result := result + ' ' + inttostr(AMinute) + ' minuto';

    if ASecond>1 then
       result := result + ' ' + inttostr(ASecond) + ' segundos'
    else
    if ASecond>0 then
       result := result + ' ' + inttostr(ASecond) + ' segundo';

end;

function showBytes(b:int64):string;
begin
    if b> power(2,30) then
       result := formatfloat('########.00', b /  power(2,30)) + ' GB'
    else
    if b> power(2,20) then
       result := formatfloat('########.00', b /  power(2,20)) + ' MB'
    else
    if b> power(2,10) then
       result := formatfloat('########.00', b /  power(2,10)) + ' KB'
    else
       result := inttostr( b ) + ' B'
end;

function showVel(v:double):string;
begin
    if v> power(2,30) then
       result := formatfloat('########.00', v /  power(2,30)) + ' GB/s.'
    else
    if v> power(2,20) then
       result := formatfloat('########.00', v /  power(2,20)) + ' MB/s.'
    else
    if v> power(2,10) then
       result := formatfloat('########.00', v /  power(2,10)) + ' KB/s.'
    else
       result := inttostr( trunc(v) ) + ' B/s.'
end;

function SizeToStr(b:Int64):string;
begin
    if b<1024 then
       result := inttostr(b) + ' B'
    else if b<( power( 1024, 2)) then
       result := FormatFloat('0.00', b / 1024) + ' KB'
    else if b<( power( 1024, 3)) then
       result := FormatFloat('0.00', b / power( 1024, 2)) + ' MB'
    else if b<( power( 1024, 4)) then
       result := FormatFloat('0.00', b / power( 1024, 3)) + ' GB'
    else if b<( power( 1024, 5)) then
       result := FormatFloat('0.00', b / power( 1024, 4)) + ' TB'
    else if b<( power( 1024, 6)) then
       result := FormatFloat('0.00', b / power( 1024, 4)) + ' EB';
end;


end.
