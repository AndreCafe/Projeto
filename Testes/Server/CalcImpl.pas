unit CalcImpl;

interface

uses
  nxrdClass,
  CalcIntf;

type
  TnxCalc = class(TnxClass, InxCalc, InxCalc2)
  protected {private}
    clcResult   : Extended;
    clcCallback : InxCalcCallback;
  protected
    {--- InxCalc ---}
    procedure Clear;

    procedure Add(const aValue: Extended);
    procedure Subtract(const aValue: Extended);
    procedure Multiply(const aValue: Extended);
    procedure Divide(const aValue: Extended);

    function GetResult: Extended;

    {--- InxCalc2 ---}
    function GetCallback: InxCalcCallback;
    procedure SetCallback(const aCallback: InxCalcCallback);
  end;

implementation

uses
  nxrbTypes;

{ TnxCalc }

procedure TnxCalc.Add(const aValue: Extended);
begin
  clcResult := clcResult + aValue;
  if Assigned(clcCallback) then
    clcCallback.ResultChanged(clcResult);
end;

procedure TnxCalc.Clear;
begin
  clcResult := 0;
  if Assigned(clcCallback) then
    clcCallback.ResultChanged(clcResult);
end;

procedure TnxCalc.Divide(const aValue: Extended);
begin
  clcResult := clcResult / aValue;
  if Assigned(clcCallback) then
    clcCallback.ResultChanged(clcResult);
end;

function TnxCalc.GetCallback: InxCalcCallback;
begin
  Result := clcCallback;
end;

function TnxCalc.GetResult: Extended;
begin
  Result := clcResult;
end;

procedure TnxCalc.Multiply(const aValue: Extended);
begin
  clcResult := clcResult * aValue;
  if Assigned(clcCallback) then
    clcCallback.ResultChanged(clcResult);
end;

procedure TnxCalc.SetCallback(const aCallback: InxCalcCallback);
begin
  clcCallback := aCallback;
end;

procedure TnxCalc.Subtract(const aValue: Extended);
begin
  clcResult := clcResult - aValue;
  if Assigned(clcCallback) then
    clcCallback.ResultChanged(clcResult);
end;

var
  Control : InxClassFactoryControl;

initialization
  TnxClassFactory.RegisterClass(CLSID_Calc, TnxCalc, Control);
end.
