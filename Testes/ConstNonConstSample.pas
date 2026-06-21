unit ConstNonConstSample;

interface

uses ShowRefCountSample;

type
  IScream = interface
    ['{14C78CAB-69E5-11D6-9239-0004AC5359AE}']
    procedure Scream;
  end;
  TIScream = class(TShowRefCountsObject,IScream)
  protected
    procedure Scream;
  end;

  procedure NonConstScream(AScream: IScream);
  procedure ConstScream(const AScream: IScream);

implementation

uses LoggerIntf, SysUtils;

{ TIScream }

procedure TIScream.Scream;
begin
  Logger.LogMessage(Format('%s Screams For Ice Cream!',[Name]));
end;

procedure NonConstScream(AScream: IScream);
begin
  Assert(AScream<>nil,'AScream must be non-nil!');
  AScream.Scream;
end;

procedure ConstScream(const AScream: IScream);
begin
  Assert(AScream<>nil,'AScream must be non-nil!');
  AScream.Scream;
end;

end.
 