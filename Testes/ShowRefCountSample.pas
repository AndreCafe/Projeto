unit ShowRefCountSample;

interface

type
  // A class type that you can create with a name and have it report all
  // of its _AddRefs and _Releases to the Logger

  // One of the interesting tricks shown here is to redeclare IUnknown support
  // - this makes the IUnknown try to re-map its _AddRef, _Release and
  // QueryInterface again, and it ends up mapping _AddRef and _Release to the
  // new implementations, and QueryInterface to the old TInterfacedObject
  // implementation.

  TShowRefCountsObject = class(TInterfacedObject,IUnknown)
  private
    FName : String;
  protected
    // IUnknown
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

    property Name: String read FName;
  public
    constructor Create(const AName: String);
  end;

implementation

uses LoggerIntf, SysUtils;

{ TShowRefCountsObject }

function TShowRefCountsObject._AddRef: Integer;
begin
  Result := inherited _AddRef;
  Logger.LogMessage(Format('ADDREF: %s.RefCount now %d',
    [Name,RefCount]));
end;

function TShowRefCountsObject._Release: Integer;
begin
  Logger.LogMessage(Format('RELEASE: %s.RefCount now %d',
    [Name,RefCount-1]));
  Result := inherited _Release;
end;

constructor TShowRefCountsObject.Create(const AName: String);
begin
  inherited Create;
  FName := AName;
end;

end.
