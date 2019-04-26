unit ncSyncLic;

interface

uses
  SyncObjs;

//var
//  SyncLic : TCriticalSection;  

{  procedure LockLic;
  procedure UnlockLic;
  function TryLockLic: Boolean;}

implementation

procedure LockLic;
begin
//  SyncLic.Enter;
end;

procedure UnlockLic;
begin
//  SyncLic.Leave;
end;

function TryLockLic: Boolean;
begin
//  Result := SyncLic.TryEnter;
end;

initialization
//  SyncLic := TCriticalSection.Create;

finalization
//  SyncLic.Free;  

end.
