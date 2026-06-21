unit PlainInterfaceSample;

interface

uses Classes;

type
  IPlainOldInterface = interface
    ['{14C78CA5-69E5-11D6-9239-0004AC5359AE}']
    function GetX: Integer;
    procedure SetX(AX: Integer);
    procedure DoSomething;
    property X: Integer read GetX write SetX;
  end;

  TSomeSampleClass = class(TInterfacedObject,IPlainOldInterface)
  private
    FX : Integer;
    function GetX: Integer;
    procedure SetX(AX: Integer);
  public
    constructor Create;
    destructor Destroy; override;
    procedure DoSomething;
  end;

implementation

uses LoggerIntf, Dialogs;

{ TSomeSampleClass }

constructor TSomeSampleClass.Create;
begin
  inherited;
  FX := 100; // Initialize to 100
end;

destructor TSomeSampleClass.Destroy;
begin
  Logger.LogMessage('SomeSampleClass object destroyed');
  inherited;
end;

procedure TSomeSampleClass.DoSomething;
begin
  Logger.LogMessage('I''ve done something!');
end;

function TSomeSampleClass.GetX: Integer;
begin
  Result := FX;
end;

procedure TSomeSampleClass.SetX(AX: Integer);
begin
  FX := AX;
end;

end.
 