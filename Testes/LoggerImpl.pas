unit LoggerImpl;

interface

uses Classes, Controls, StdCtrls, LoggerIntf;

type
  // Since we're (unavoidably) mixing reference-counting with the TWinControl's
  // ability to free the underlying object, we need a way to be informed when
  // the memo goes away
  TDestroyAwareMemo = class(TMemo)
  private
    FOnDestroy : TNotifyEvent;
  public
    destructor Destroy; override;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
  end;

  TMemoLogger = class(TInterfacedObject,ILogger)
  private
    FMemo : TDestroyAwareMemo;
  protected
    procedure EventMemoDestroying(Sender: TObject);
  public
    constructor Create(AParent: TWinControl);
    destructor Destroy; override;
    procedure Clear;
    procedure LogMessage(const AMessage: String);
  end;

implementation

uses SysUtils;

{ TDestroyAwareMemo }

destructor TDestroyAwareMemo.Destroy;
begin
  if Assigned(OnDestroy) then
    OnDestroy(Self);
  inherited;
end;

{ TMemoLogger }

procedure TMemoLogger.Clear;
begin
  if FMemo<>nil then
    FMemo.Clear;
end;

constructor TMemoLogger.Create(AParent: TWinControl);
begin
  inherited Create;
  FMemo := TDestroyAwareMemo.Create(nil);
  FMemo.Align := alClient;
  FMemo.Parent := AParent;
  FMemo.OnDestroy := EventMemoDestroying;
  FMemo.ScrollBars := ssVertical;
end;

destructor TMemoLogger.Destroy;
begin
  // We 'own' the memo in the sense that it should only be around as long
  // as the logger interface, so we destroy it
  FMemo.Free;
  FMemo := nil; // In D5 and later, you can use FreeAndNil(FMemo) instead
                // It's a handy function; it nils your pointer FIRST and
                // then frees the object - so that if there is a problem
                // with the Free, you'll still get a nil pointer back
  inherited;
end;

procedure TMemoLogger.EventMemoDestroying(Sender: TObject);
begin
  FMemo := nil;
end;

procedure TMemoLogger.LogMessage(const AMessage: String);
begin
  // It could be nil if the memo goes away
  if FMemo<>nil then
  begin
    FMemo.Lines.BeginUpdate;
    try
      if FMemo.Lines.Count>1000 then
        FMemo.Lines.Delete(0);
      FMemo.Lines.Add(AMessage);
    finally
      FMemo.Lines.EndUpdate;
    end;
  end;
end;

end.
