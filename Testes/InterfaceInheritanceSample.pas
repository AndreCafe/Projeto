unit InterfaceInheritanceSample;

interface

type
  IBaseInterface = interface
    ['{14C78CAD-69E5-11D6-9239-0004AC5359AE}']
    procedure DoBaseyThing;
  end;
  IDerivedInterface = interface(IBaseInterface)
    ['{14C78CAE-69E5-11D6-9239-0004AC5359AE}']
    procedure DoDerivedyThing;
  end;

  TFirstClass = class(TInterfacedObject,IBaseInterface)
  public
    procedure DoBaseyThing;
  end;

  // No explicit declaration of support for IBaseInterface
  TSecondClass = class(TInterfacedObject,IDerivedInterface)
  public
    procedure DoBaseyThing;
    procedure DoDerivedyThing;
  end;

  // Explicit declaration of support for IBaseInterface
  TThirdClass = class(TInterfacedObject,IBaseInterface,IDerivedInterface)
  public
    procedure DoBaseyThing;
    procedure DoDerivedyThing;
  end;

implementation

uses LoggerIntf;

{ TFirstClass }

procedure TFirstClass.DoBaseyThing;
begin
  Logger.LogMessage('First Class Says: "All your base are belong to us"');
end;

{ TSecondClass }

procedure TSecondClass.DoBaseyThing;
begin
  Logger.LogMessage('Second Class Says: "Some of your base are belong to us"');
end;

procedure TSecondClass.DoDerivedyThing;
begin
  Logger.LogMessage('Second Class Says: "We''re #2, so we try harder"');
end;

{ TThirdClass }

procedure TThirdClass.DoBaseyThing;
begin
  Logger.LogMessage('Third Class Says: "None of your base are belong to us :("');
end;

procedure TThirdClass.DoDerivedyThing;
begin
  Logger.LogMessage('Third Class Says: "Oh dear"');
end;

end.
