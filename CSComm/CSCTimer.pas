unit CSCTimer;

interface

uses
  Windows;

{===Timer declarations===}
type

  TCSCWord32 = type DWORD;                   {32-bit unsigned integer}

  TCSCTimer = packed record
    trStart    : longint;
    trExpire   : longint;
    trWrapped  : boolean;
    trForEver  : boolean;
  end;

const
  CSCTimerInfinite = -1;
  CSCTimerMaxExpiry = 120000;

procedure SetTimer(var T : TCSCTimer; Time : integer);
  {-Set a timer to expire in Time milliseconds. 1 <= Time <= 120000.}
function HasTimerExpired(const T : TCSCTimer) : boolean;
  {-Return true if the timer has expired}
function TimeToExpire(const T : TCSCTimer): Integer;

function TimeToExpireTC(const T : TCSCTimer; TC: Cardinal): Integer;
  

implementation

function CmpDW(a, b : TCSCWord32) : integer;
asm
  xor ecx, ecx
  cmp eax, edx
  ja @@GT
  je @@EQ
@@LT:
  dec ecx
  dec ecx
@@GT:
  inc ecx
@@EQ:
  mov eax, ecx
end;

function ForceInRange(a, aLow, aHigh : longint) : longint;
register;
asm
  cmp eax, edx
  jg @@CheckHigh
  mov eax, edx
  jmp @@Exit
@@CheckHigh:
  cmp eax, ecx
  jl @@Exit
  mov eax, ecx
@@Exit:
end;

{===Timer routines===================================================}
procedure SetTimer(var T : TCSCTimer; Time : integer);
begin
  with T do begin
    if (Time = CSCTimerInfinite) then begin
      trForEver := true;
      trStart := 0;
      trExpire := 0;
      trWrapped := false;
    end
    else begin
      trForEver := false;
      Time := ForceInRange(Time, 1, CSCTimerMaxExpiry);
      trStart := GetTickCount;
      trExpire := trStart + Time;
      trWrapped := CmpDW(trStart, trExpire) < 0;
    end;
  end;
end;

function TimeToExpire(const T : TCSCTimer): Integer;
begin
  Result := TimeToExpireTC(T, GetTickCount);
end;

function TimeToExpireTC(const T : TCSCTimer; TC: Cardinal): Integer; 
begin
  with T do 
  if trForEver then 
    Result := High(Integer)
  else 
  if HasTimerExpired(T) then
    Result := 1
  else begin  
    if trWrapped then 
      Result := trExpire + High(Cardinal) - TC
    else
      Result := trExpire - TC;  
  end;  
end;

{--------}
function HasTimerExpired(const T : TCSCTimer) : boolean;
asm
  push ebx
  xor ebx, ebx
  cmp [eax].TCSCTimer.trForEver, 0
  jne @@Exit
  push eax
  call GetTickCount
  pop edx
  mov ecx, [edx].TCSCTimer.trExpire
  mov edx, [edx].TCSCTimer.trStart
  cmp edx, ecx
  jbe @@StartLEExpire
@@StartGEExpire:
  cmp eax, edx
  jae @@Exit
  cmp eax, ecx
  jae @@Expired
  jmp @@Exit
@@StartLEExpire:
  cmp eax, ecx
  jae @@Expired
  cmp eax, edx
  jae @@Exit
@@Expired:
  inc ebx
@@Exit:
  mov eax, ebx
  pop ebx
end;
{====================================================================}

end.


