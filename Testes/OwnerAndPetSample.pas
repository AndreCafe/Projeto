unit OwnerAndPetSample;

interface

uses ShowRefCountSample;

type
  IPet = interface
    ['{14C78CAA-69E5-11D6-9239-0004AC5359AE}']
    procedure MakeAnimalSound;
  end;
  IPetOwner = interface
    ['{14C78CA9-69E5-11D6-9239-0004AC5359AE}']
    function GetPet: IPet;
    procedure SetPet(APet: IPet);
    procedure PassPetTo(const APetOwner: IPetOwner);
    property Pet: IPet read GetPet write SetPet;
  end;

  // Based on TShowRefCountsObject so that it will say when the _AddRefs
  // and _Releases happen
  TPetOwner = class(TShowRefCountsObject,IPetOwner)
  private
    FPet : IPet;
  protected
    // IPetOwner
    function GetPet: IPet;
    procedure SetPet(APet: IPet);
    procedure PassPetTo(const APetOwner: IPetOwner);
  public
    constructor Create(const AName: String; APet: IPet);
    destructor Destroy; override;
  end;

  TBasePet = class(TShowRefCountsObject,IPet)
  protected
    procedure MakeAnimalSound; virtual; abstract;
  end;

  TCat = class(TBasePet)
  protected
    procedure MakeAnimalSound; override;
  public
    destructor Destroy; override;
  end;

  TDog = class(TBasePet)
  protected
    procedure MakeAnimalSound; override;
  public
    destructor Destroy; override;
  end;

implementation

uses LoggerIntf;

{ TPetOwner }

constructor TPetOwner.Create(const AName: String; APet: IPet);
begin
  inherited Create(AName);
  FPet := APet;
end;

destructor TPetOwner.Destroy;
begin
  Logger.LogMessage('Pet owner going away');
  inherited;
end;

function TPetOwner.GetPet: IPet;
begin
  Result := FPet;
end;

procedure TPetOwner.PassPetTo(const APetOwner: IPetOwner);
begin
  APetOwner.SetPet(FPet);
  FPet := nil;
end;

procedure TPetOwner.SetPet(APet: IPet);
begin
  Logger.LogMessage('  [assigning pet]');
  FPet := APet;
  Logger.LogMessage('  [finished assigning pet]');
end;

{ TCat }

destructor TCat.Destroy;
begin
  Logger.LogMessage('Cat going away');
  inherited;
end;

procedure TCat.MakeAnimalSound;
begin
  Logger.LogMessage('Meow');
end;

{ TDog }

destructor TDog.Destroy;
begin
  Logger.LogMessage('Dog going away');
  inherited;
end;

procedure TDog.MakeAnimalSound;
begin
  Logger.LogMessage('Woof');
end;

end.
