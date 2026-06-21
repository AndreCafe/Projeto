unit WinThreadGuard;

interface

uses Guards, SyncObjs;

type
  TMultithreadedWindowsCOREGuard = class(TBasicCOREGuard)
  private
    FCriticalSection : TCriticalSection;
  protected
    property CriticalSection: TCriticalSection read FCriticalSection;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Acquire; override;
    procedure Release; override;
  end;

implementation

{ TMultithreadedWindowsCOREGuard }

procedure TMultithreadedWindowsCOREGuard.Acquire;
begin
  inherited;
  CriticalSection.Acquire;
end;

constructor TMultithreadedWindowsCOREGuard.Create;
begin
  inherited;
  FCriticalSection := TCriticalSection.Create;
end;

destructor TMultithreadedWindowsCOREGuard.Destroy;
begin
  FCriticalSection.Free;
  FCriticalSection := nil;
  inherited;
end;

procedure TMultithreadedWindowsCOREGuard.Release;
begin
  CriticalSection.Release;
  inherited;
end;

initialization
  COREGuardClass := TMultithreadedWindowsCOREGuard;
end.
