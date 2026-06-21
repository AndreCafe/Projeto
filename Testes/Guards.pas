unit Guards;

interface

type
  ICOREGuard = interface
    ['{D4AD6D52-B1EE-11D5-9218-0004AC5359AE}']
    procedure Acquire;
    procedure Release;
  end;
  TBasicCOREGuard = class(TInterfacedObject,ICOREGuard)
  public
    constructor Create; virtual;
    procedure Acquire; virtual;
    procedure Release; virtual;
  end;
  TBasicCOREGuardClass = class of TBasicCOREGuard;

  function NewGuard: ICOREGuard;

var
  COREGuardClass : TBasicCOREGuardClass = TBasicCOREGuard;

implementation

function NewGuard: ICOREGuard;
begin
  Result := COREGuardClass.Create;
end;

{ TBasicCOREGuard }

procedure TBasicCOREGuard.Acquire;
begin

end;

constructor TBasicCOREGuard.Create;
begin
  inherited;
end;

procedure TBasicCOREGuard.Release;
begin

end;

end.
