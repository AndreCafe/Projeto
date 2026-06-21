unit MethodResolutionSample;

interface

uses LoggerIntf;

type
  IHappy = interface
    ['{14C78CA7-69E5-11D6-9239-0004AC5359AE}']
    procedure ShowMood;
  end;
  ISad = interface
    ['{14C78CA8-69E5-11D6-9239-0004AC5359AE}']
    procedure ShowMood;
  end;

  TAmbivalent = class(TInterfacedObject,IHappy,ISad)
  public
    destructor Destroy; override;
    procedure ShowMood;
  end;

  TEmotionalRollerCoaster = class(TInterfacedObject,IHappy,ISad)
  public
    destructor Destroy; override;
    procedure ShowMood;
    procedure ISad.ShowMood = ShowSadMood;
    procedure ShowSadMood;
  end;

implementation

{ TAmbivalent }

destructor TAmbivalent.Destroy;
begin
  Logger.LogMessage('Ambivalent object destroyed');
  inherited;
end;

procedure TAmbivalent.ShowMood;
begin
  Logger.LogMessage('"I''m okay, I guess"');
end;

{ TEmotionalRollerCoaster }

destructor TEmotionalRollerCoaster.Destroy;
begin
  Logger.LogMessage('EmotionalRollerCoaster object destroyed');
  inherited;
end;

procedure TEmotionalRollerCoaster.ShowMood;
begin
  Logger.LogMessage('"Wow, everything is GREAT!"');
end;

procedure TEmotionalRollerCoaster.ShowSadMood;
begin
  Logger.LogMessage('"Everything SUCKS!"');
end;

end.
 