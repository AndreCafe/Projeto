unit DelegationSample;

interface

uses ShowRefCountSample, ComObj;

// NOTE: ComObj used only for TAggregatedObject

type
  IWorkalot = interface
    ['{14C78CAF-69E5-11D6-9239-0004AC5359AE}']
    function Distance(const X1, Y1, X2, Y2: Double): Double;
    function Factorial(AInteger: Integer): Integer;
  end;
  TInterfacedWorkalot = class(TShowRefCountsObject,IWorkalot)
  public
    destructor Destroy; override;
    function Distance(const X1, Y1, X2, Y2: Double): Double;
    function Factorial(AInteger: Integer): Integer;
  end;
  // Note that this object implements the methods of IWorkalot, but does
  // NOT declare that it implements it.  This is a good thing.
  TPlainObjectWorkalot = class
  private
    FName : String;
  public
    constructor Create(const AName: String);
    destructor Destroy; override;
    // "IWorkalot"
    function Distance(const X1, Y1, X2, Y2: Double): Double;
    function Factorial(AInteger: Integer): Integer;
  end;
  // Here, we see that you don't even actually have to implement all of
  // the methods of IWorkalot
  TPlainObjectMissingABitWorkalot = class
  private
    FName : String;
  public
    constructor Create(const AName: String);
    destructor Destroy; override;
    // "IWorkalot" without Factorial
    function Distance(const X1, Y1, X2, Y2: Double): Double;
  end;

  // The delegators
  TDelegateToInterface = class(TShowRefCountsObject,IWorkalot)
  private
    FRealWork : IWorkalot;
  protected
    property RealWork: IWorkalot read FRealWork write FRealWork
      implements IWorkalot;
  public
    constructor Create(const AName: String);
    destructor Destroy; override;
  end;

  TDelegateToObject = class(TShowRefCountsObject,IWorkalot)
  private
    FRealWork : TInterfacedWorkalot;
  protected
    property RealWork: TInterfacedWorkalot read FRealWork write FRealWork
      implements IWorkalot;
  public
    constructor Create(const AName: String);
    destructor Destroy; override;
  end;

  TDelegateToPlainObject = class(TShowRefCountsObject,IWorkalot)
  private
    FRealWork : TPlainObjectWorkalot;
  protected
    property RealWork: TPlainObjectWorkalot read FRealWork write FRealWork
      implements IWorkalot;
  public
    constructor Create(const AName: String);
    destructor Destroy; override;
  end;

  TDelegateToPlainObjectMissingABit = class(TShowRefCountsObject,IWorkalot)
  private
    FRealWork : TPlainObjectMissingABitWorkalot;
  protected
    property RealWork: TPlainObjectMissingABitWorkalot
      read FRealWork write FRealWork implements IWorkalot;
  public
    constructor Create(const AName: String);
    destructor Destroy; override;
    function Factorial(AInteger: Integer): Integer;
  end;

  // Unfortunately for humanity, I tried to see what would happen if I
  // made two properties that both said "implements IWorkalot" but implemented
  // different subsets, and alas, I got an error
  // "Duplicate implements clause for interface 'IWorkalot'"
  // Oh well, perhaps we can suggest this for the next Delphi? :) j/k

implementation

uses LoggerIntf, SysUtils;

{ TInterfacedWorkalot }

destructor TInterfacedWorkalot.Destroy;
begin
  Logger.LogMessage(Format('%s has been destroyed',[Name]));
  inherited;
end;

function TInterfacedWorkalot.Distance(const X1, Y1, X2,
  Y2: Double): Double;
begin
  // Distance between two points
  Result := Sqrt(Sqr(X2-X1)+Sqr(Y2-Y1));
end;

function TInterfacedWorkalot.Factorial(AInteger: Integer): Integer;
begin
  // e.g. 6! (6 factorial) = 1*2*3*4*5*6
  // Folks often like to use factorial as an example of recursion,
  // but for regular use, a loop works absolutely wonderfully :)
  Result := 1;
  while AInteger>1 do
  begin
    Result := Result*AInteger;
    Dec(AInteger);
  end;
end;

{ TPlainObjectWorkalot }

constructor TPlainObjectWorkalot.Create(const AName: String);
begin
  inherited Create;
  FName := AName;
end;

destructor TPlainObjectWorkalot.Destroy;
begin
  Logger.LogMessage(Format('%s has been destroyed',[FName]));
  inherited;
end;

function TPlainObjectWorkalot.Distance(const X1, Y1, X2,
  Y2: Double): Double;
begin
  // Normally, I would never just copy and paste code around like this :)
  Result := Sqrt(Sqr(X2-X1)+Sqr(Y2-Y1));
end;

function TPlainObjectWorkalot.Factorial(AInteger: Integer): Integer;
begin
  Result := 1;
  while AInteger>1 do
  begin
    Result := Result*AInteger;
    Dec(AInteger);
  end;
end;

{ TPlainObjectMissingABitWorkalot }

constructor TPlainObjectMissingABitWorkalot.Create(const AName: String);
begin
  inherited Create;
  FName := AName;
end;

destructor TPlainObjectMissingABitWorkalot.Destroy;
begin
  Logger.LogMessage(Format('%s has been destroyed',[FName]));
  inherited;
end;

function TPlainObjectMissingABitWorkalot.Distance(const X1, Y1, X2,
  Y2: Double): Double;
begin
  Result := Sqrt(Sqr(X2-X1)+Sqr(Y2-Y1));
end;

{ TDelegateToInterface }

constructor TDelegateToInterface.Create(const AName: String);
begin
  inherited Create(AName);
  FRealWork := TInterfacedWorkalot.Create(AName+' worker');
end;

destructor TDelegateToInterface.Destroy;
begin
  Logger.LogMessage(Format('%s has been destroyed',[Name]));
  inherited;
end;

{ TDelegateToObject }

constructor TDelegateToObject.Create(const AName: String);
begin
  inherited Create(AName);
  FRealWork := TInterfacedWorkalot.Create(AName+' worker');
end;

destructor TDelegateToObject.Destroy;
begin
  FRealWork.Free;
  Logger.LogMessage(Format('%s has been destroyed',[Name]));
  inherited;
end;

{ TDelegateToPlainObject }

constructor TDelegateToPlainObject.Create(const AName: String);
begin
  inherited Create(AName);
  FRealWork := TPlainObjectWorkalot.Create(AName+' plain object worker');
end;

destructor TDelegateToPlainObject.Destroy;
begin
  FRealWork.Free;
  Logger.LogMessage(Format('%s has been destroyed',[Name]));
  inherited;
end;

{ TDelegateToPlainObjectMissingABit }

constructor TDelegateToPlainObjectMissingABit.Create(const AName: String);
begin
  inherited Create(AName);
  FRealWork := TPlainObjectMissingABitWorkalot.
    Create(AName+' plain object worker missing a bit');
end;

destructor TDelegateToPlainObjectMissingABit.Destroy;
begin
  FRealWork.Free;
  Logger.LogMessage(Format('%s has been destroyed',[Name]));
  inherited;
end;

function TDelegateToPlainObjectMissingABit.Factorial(
  AInteger: Integer): Integer;
begin
  Result := 500; // Wrong, obviously, but it will show up in the log :)
end;

end.
