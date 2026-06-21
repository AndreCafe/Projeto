unit ExplorerForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Fundamentals;

type
  TInterfacesExplorerForm = class(TForm)
    LoggerPanel: TPanel;
    HintPanel: TPanel;
    ButtonScrollBox: TScrollBox;
    SimpleTestButton: TButton;
    LeakTestButton: TButton;
    ConflictTest1Button: TButton;
    ConflictTest2Button: TButton;
    AsTypecastButton: TButton;
    AssigningNilButton: TButton;
    NonConstRefCountButton: TButton;
    ConstRefCountButton: TButton;
    RefCountExplorerButton: TButton;
    OtherTypecastsButton: TButton;
    AdjustmentsButton: TButton;
    InheritanceButton: TButton;
    DelegationButton1: TButton;
    DelegationButton2: TButton;
    DelegationButton3: TButton;
    OwnershipButton: TButton;
    DeclaringInterfaceAsObjectButton: TButton;
    ContainingObjectsButton: TButton;
    HintLabel: TLabel;
    ThreadsButton: TButton;
    CircularReferenceButton: TButton;
    DelegationButton4: TButton;
    FundamentalsCircularRefButton: TButton;
    FundamentalsParseButton: TButton;
    FundamentalsImpatientParseButton: TButton;
    FundamentalsSelfDestructParseButton: TButton;
    DelegationButton5: TButton;
    procedure FormShow(Sender: TObject);
    procedure SimpleTestButtonClick(Sender: TObject);
    procedure LeakTestButtonClick(Sender: TObject);
    procedure ConflictTest1ButtonClick(Sender: TObject);
    procedure ConflictTest2ButtonClick(Sender: TObject);
    procedure AsTypecastButtonClick(Sender: TObject);
    procedure AssigningNilButtonClick(Sender: TObject);
    procedure FullerRefCountButtonClick(Sender: TObject);
    procedure NonConstRefCountButtonClick(Sender: TObject);
    procedure ConstRefCountButtonClick(Sender: TObject);
    procedure OtherTypecastsButtonClick(Sender: TObject);
    procedure AdjustmentsButtonClick(Sender: TObject);
    procedure InheritanceButtonClick(Sender: TObject);
    procedure DelegationButton1Click(Sender: TObject);
    procedure DelegationButton2Click(Sender: TObject);
    procedure DelegationButton3Click(Sender: TObject);
    procedure OwnershipButtonClick(Sender: TObject);
    procedure DeclaringInterfaceAsObjectButtonClick(Sender: TObject);
    procedure ContainingObjectsButtonClick(Sender: TObject);
    procedure ThreadsButtonClick(Sender: TObject);
    procedure CircularReferenceButtonClick(Sender: TObject);
    procedure DelegationButton4Click(Sender: TObject);
    procedure FundamentalsCircularRefButtonClick(Sender: TObject);
    procedure FundamentalsParseButtonClick(Sender: TObject);
    procedure FundamentalsImpatientParseButtonClick(Sender: TObject);
    procedure FundamentalsSelfDestructParseButtonClick(Sender: TObject);
    procedure DelegationButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure EventDisplayHint(Sender: TObject);
  end;

const // Constants for delegation example
  X1 = 0.0;
  X2 = 4.0;
  Y1 = 0.0;
  Y2 = 5.0;

var
  InterfacesExplorerForm: TInterfacesExplorerForm;

implementation

uses LoggerIntf, LoggerImpl, PlainInterfaceSample, MethodResolutionSample,
     ConstNonConstSample, OwnerAndPetSample, SelfishSample,
     InterfaceInheritanceSample, DelegationSample, ContainmentSample,
     ThreadSample, CircularReferenceSample, CircularFundamentalSample,
     ParseFundamentalSampleIntf, ParseFundamentalSample,
     ParseFundamentalSelfDestructSample;

{$R *.DFM}

procedure TInterfacesExplorerForm.AdjustmentsButtonClick(Sender: TObject);
var
  Selfish : ISelfish;
begin
  Logger.Clear;
  Selfish := TSelfish.Create;
  // Uses Longint(Selfish) to directly typecast the interface variable
  // as a number. This number represents the spot in memory the interface
  // points to
  Logger.LogMessage(Format('Interface to Selfish points to $%s (%d)',
    [IntToHex(Longint(Selfish),8),Longint(Selfish)]));
  Selfish.TellMeAboutSelf;
  Selfish := TSelfishWithData.Create;
  Logger.LogMessage(Format('Interface to Selfish with data points to $%s (%d)',
    [IntToHex(Longint(Selfish),8),Longint(Selfish)]));
  Selfish.TellMeAboutSelf;
end;

procedure TInterfacesExplorerForm.AssigningNilButtonClick(Sender: TObject);
var
  AGoodMood : IHappy;
  ABadMood : ISad;
begin
  // Contrast this with ConflictTest1ButtonClick
  Logger.Clear;
  AGoodMood := TAmbivalent.Create;
  AGoodMood.ShowMood;
  AGoodMood := nil;
  ABadMood := TAmbivalent.Create;
  ABadMood.ShowMood;
  ABadMood := nil;
end;

procedure TInterfacesExplorerForm.AsTypecastButtonClick(Sender: TObject);
var
  AGoodMood : IHappy;
  ABadMood : ISad;
begin
  Logger.Clear;
  AGoodMood := TEmotionalRollerCoaster.Create;
  AGoodMood.ShowMood;
  Logger.LogMessage('Typecasting AGoodMood as ISad');
  ABadMood := AGoodMood as ISad;
  ABadMood.ShowMood;
end;

procedure TInterfacesExplorerForm.CircularReferenceButtonClick(
  Sender: TObject);
var
  BuddyA, BuddyB : IBuddy;
begin
  Logger.Clear;
  Logger.LogMessage('Setting up a pair of buddies');
  BuddyA := TBuddy.Create('Grinch');
  BuddyB := TBuddy.Create('Icebox');
  BuddyA.Buddy := BuddyB;
  BuddyB.Buddy := BuddyA; // Comment out this line and see the difference
  BuddyA.GreetBuddy;
  BuddyB.GreetBuddy;
  BuddyA := nil;
  BuddyB := nil;
  Logger.LogMessage('END OF ROUTINE.. Cleanup');
end;

procedure TInterfacesExplorerForm.ConflictTest1ButtonClick(
  Sender: TObject);
var
  AGoodMood : IHappy;
  ABadMood : ISad;
begin
  Logger.Clear;
  AGoodMood := TAmbivalent.Create;
  AGoodMood.ShowMood;
  ABadMood := TAmbivalent.Create;
  ABadMood.ShowMood;
end;

procedure TInterfacesExplorerForm.ConflictTest2ButtonClick(
  Sender: TObject);
var
  AGoodMood : IHappy;
  ABadMood : ISad;
begin
  Logger.Clear;
  AGoodMood := TEmotionalRollerCoaster.Create;
  AGoodMood.ShowMood;
  ABadMood := TEmotionalRollerCoaster.Create;
  ABadMood.ShowMood;
end;

procedure TInterfacesExplorerForm.ConstRefCountButtonClick(
  Sender: TObject);
var
  NewScream : IScream;
begin
  Logger.Clear;
  Logger.LogMessage('[Creating screamer]');
  NewScream := TIScream.Create('Robert');
  Logger.LogMessage('[Scream in const fashion]');
  ConstScream(NewScream);
  Logger.LogMessage('[End of method]');
end;

procedure TInterfacesExplorerForm.ContainingObjectsButtonClick(
  Sender: TObject);
var
  ContainedDialog : IDialog;
begin
  Logger.Clear;
  Logger.LogMessage('Creating and executing dialog');
  ContainedDialog := TOpenDialogHolder.Create;
  if ContainedDialog.Execute then
    Logger.LogMessage(Format('Returned: %s',[ContainedDialog.ResultValue]))
  else
    Logger.LogMessage('User cancelled');
end;

procedure TInterfacesExplorerForm.DeclaringInterfaceAsObjectButtonClick(
  Sender: TObject);
var
  SampleObject : TSomeSampleClass;
  Sample : IPlainOldInterface;
begin
  Logger.Clear;
  SampleObject := TSomeSampleClass.Create;
  Sample := SampleObject;
  Sample.X := 1234;
  Sample := nil;
  // ^^ At this point, SampleObject is now no longer valid, because the
  // interface dropped its reference count to zero
  try
    Sample := SampleObject;
  except
    on E: Exception do
      Logger.LogMessage(Format('Error %s trying to assign Sample again',
        [E.Message]));
  end;
  // The error can be less obvious than we have set it up here...
  // "SampleObject" may have been created in the class, or as a global
  // somewhere
end;

procedure TInterfacesExplorerForm.DelegationButton1Click(Sender: TObject);
var
  Workalot : IWorkalot;
begin
  Logger.Clear;
  // This line comes up with an Internal Error E1289 in Delphi 5 a lot
  // It should actually be a warning - IWorkalot is delegated, and that
  // can cause RefCount screwups
  Workalot := TDelegateToInterface.Create('Delegator to interface');
  Logger.LogMessage(Format('7! = %d',[Workalot.Factorial(7)]));
  Logger.LogMessage(Format('(%8.4f,%8.4f)-(%8.4f,%8.4f) distance = %8.4f',
    [X1,Y1,X2,Y2,Workalot.Distance(X1,Y1,X2,Y2)]));
  Logger.LogMessage('END OF ROUTINE.. Cleanup');
end;

procedure TInterfacesExplorerForm.DelegationButton2Click(Sender: TObject);
var
  Workalot : IWorkalot;
begin
  Logger.Clear;
  Workalot := TDelegateToObject.Create('Delegator to object');
  Logger.LogMessage(Format('7! = %d',[Workalot.Factorial(7)]));
  Logger.LogMessage(Format('(%8.4f,%8.4f)-(%8.4f,%8.4f) distance = %8.4f',
    [X1,Y1,X2,Y2,Workalot.Distance(X1,Y1,X2,Y2)]));
  Logger.LogMessage('END OF ROUTINE.. Cleanup');
end;

procedure TInterfacesExplorerForm.DelegationButton3Click(Sender: TObject);
var
  Workalot : IWorkalot;
begin
  Logger.Clear;
  Workalot := TDelegateToPlainObject.Create('Delegator to plain object');
  Logger.LogMessage(Format('7! = %d',[Workalot.Factorial(7)]));
  Logger.LogMessage(Format('(%8.4f,%8.4f)-(%8.4f,%8.4f) distance = %8.4f',
    [X1,Y1,X2,Y2,Workalot.Distance(X1,Y1,X2,Y2)]));
  Logger.LogMessage('END OF ROUTINE.. Cleanup');
end;

procedure TInterfacesExplorerForm.DelegationButton4Click(Sender: TObject);
var
  Workalot : IWorkalot;
begin
  Logger.Clear;
  Workalot := TDelegateToPlainObjectMissingABit.
    Create('Delegator to plain object that''s missing a bit');
  Logger.LogMessage(Format('7! = %d',[Workalot.Factorial(7)]));
  Logger.LogMessage(Format('(%8.4f,%8.4f)-(%8.4f,%8.4f) distance = %8.4f',
    [X1,Y1,X2,Y2,Workalot.Distance(X1,Y1,X2,Y2)]));
  Logger.LogMessage('END OF ROUTINE.. Cleanup');
end;

procedure TInterfacesExplorerForm.DelegationButton5Click(Sender: TObject);
var
  Temp : IUnknown;
  Workalot : IWorkalot;
begin
  Logger.Clear;
  // This is a pretty tricky technique to work with - it works for some
  // but I don't recommend it, as you have to keep the 'outside' interface
  // reference for at least as long as you use the 'inside' (or delegated)
  // interface. Temp can be of *any* supported interface type in your object
  // that's not delegated
  Temp := TDelegateToInterface.Create('Delegator to interface - careful');
  Workalot := Temp as IWorkalot;
  Logger.LogMessage(Format('7! = %d',[Workalot.Factorial(7)]));
  Logger.LogMessage(Format('(%8.4f,%8.4f)-(%8.4f,%8.4f) distance = %8.4f',
    [X1,Y1,X2,Y2,Workalot.Distance(X1,Y1,X2,Y2)]));
  Logger.LogMessage('END OF ROUTINE.. Cleanup');
end;

procedure TInterfacesExplorerForm.EventDisplayHint(Sender: TObject);
begin
  HintLabel.Caption := GetLongHint(Application.Hint);
end;

procedure TInterfacesExplorerForm.FormShow(Sender: TObject);
begin
  SetLogger(TMemoLogger.Create(LoggerPanel));
  Application.OnHint := EventDisplayHint;
end;

procedure TInterfacesExplorerForm.FullerRefCountButtonClick(Sender: TObject);
var
  APet : IPet;
  AOwner : IPetOwner;
begin
  Logger.Clear;
  Logger.LogMessage('[creating dog]');
  APet := TDog.Create('Sparky');
  Logger.LogMessage('[making dog make a sound]');
  APet.MakeAnimalSound;
  Logger.LogMessage('[assigning dog to new owner John]');
  AOwner := TPetOwner.Create('John',APet);
  Logger.LogMessage('[setting APet to nil]');
  APet := nil;
  Logger.LogMessage('[creating cat]');
  APet := TCat.Create('Fluffy');
  Logger.LogMessage('[assigning cat to John]');
  AOwner.SetPet(APet);
  Logger.LogMessage('[asking John''s pet to make a sound]');
  AOwner.GetPet.MakeAnimalSound; // A temporary variable is assigned here!
  Logger.LogMessage('[letting go of John]');
  AOwner := nil;
  APet := nil;
  Logger.LogMessage('END OF ROUTINE.. Cleanup');
end;
// The temporary variable assigned by AOwner.GetPet.MakeAnimalSound is due to
// Delphi needing a temporary IPet to assign GetPet to so it can then call
// MakeAnimalSound.  The temporary variable is cleaned up at the very end of
// the method

procedure TInterfacesExplorerForm.FundamentalsCircularRefButtonClick(
  Sender: TObject);
var
  BuddyA, BuddyB : IBuddy;
begin
  Logger.Clear;
  Logger.LogMessage('Setting up a pair of fundamental buddies');
  BuddyA := TFunBuddy.Create('Snazz');
  BuddyB := TFunBuddy.Create('Bats');
  BuddyA.Buddy := BuddyB;
  BuddyB.Buddy := BuddyA; // Comment out this line and see the difference
  BuddyA.GreetBuddy;
  // If you add in a DropI(BuddyA) right here, BuddyB gets notified, and will
  // complain that he has nobody to talk to in this next line
  BuddyB.GreetBuddy;
  DropAndNilI(BuddyA); // *1
  DropAndNilI(BuddyB);
  Logger.LogMessage('END OF ROUTINE.. Cleanup');
end;
// *1: DropAndNilI is a shortcut for:
//  (BuddyA as IFundamental).Drop;
//  BuddyA := nil;
// ...and creates no temporaries

procedure TInterfacesExplorerForm.FundamentalsImpatientParseButtonClick(
  Sender: TObject);
var
  OpenDialog : IDialog;
  Parser : ITextParser;
  ParseFile : ITextParseFile;
  Index : Integer;
begin
  Logger.Clear;
  OpenDialog := TOpenDialogHolder.Create;
  if OpenDialog.Execute then
  begin
    OpenDialog.ResultValue;
    ParseFile := TTextParseTextFile.Create(OpenDialog.ResultValue);
    Parser := TTextParser.Create(
      ParseFile,TTextParsePreferences.Create(',',False));
    try
      while not Parser.EOF do
      begin
        Logger.LogMessage(Format('Line # %d',[Parser.LineNumber+1]));
        for Index := 0 to Parser.ItemCount-1 do
          Logger.LogMessage(Format('  Item # %d = %s',
            [Index+1,Parser.Items[Index]]));
        if Parser.LineNumber=2 then // 3rd line
        begin
          Logger.LogMessage('3 lines? That''s enough - die, file!!');
          DropAndNilI(ParseFile);
          Logger.LogMessage('File dropped');
        end;
        Parser.Next;
      end;
    finally
      Logger.LogMessage('End of file - dropping parser');
      DropAndNilI(Parser);
    end;
  end
  else
    Logger.LogMessage('Cancelled');
  Logger.LogMessage('END OF ROUTINE.. Cleanup');
end;

procedure TInterfacesExplorerForm.FundamentalsParseButtonClick(
  Sender: TObject);
var
  OpenDialog : IDialog;
  Parser : ITextParser;
  ParseFile : ITextParseFile;
  Index : Integer;
begin
  Logger.Clear;
  OpenDialog := TOpenDialogHolder.Create;
  if OpenDialog.Execute then
  begin
    OpenDialog.ResultValue;
    ParseFile := TTextParseTextFile.Create(OpenDialog.ResultValue);
    Parser := TTextParser.Create(
      ParseFile,TTextParsePreferences.Create(',',False));
    try
      while not Parser.EOF do
      begin
        Logger.LogMessage(Format('Line # %d',[Parser.LineNumber+1]));
        for Index := 0 to Parser.ItemCount-1 do
          Logger.LogMessage(Format('  Item # %d = %s',
            [Index+1,Parser.Items[Index]]));
        Parser.Next;
      end;
    finally
      Logger.LogMessage('End of file - dropping parser');
      DropAndNilI(Parser);
    end;
  end
  else
    Logger.LogMessage('Cancelled');
  Logger.LogMessage('END OF ROUTINE.. Cleanup');
end;

procedure TInterfacesExplorerForm.FundamentalsSelfDestructParseButtonClick(
  Sender: TObject);
var
  OpenDialog : IDialog;
  Parser : ITextParser;
  ParseFile : ITextParseFile;
  Index : Integer;
begin
  Logger.Clear;
  OpenDialog := TOpenDialogHolder.Create;
  if OpenDialog.Execute then
  begin
    OpenDialog.ResultValue;
    // This object tells itself to Drop after 2 lines
    ParseFile := TTextParseSelfDestructiveTextFile.Create
      (OpenDialog.ResultValue);
    Parser := TTextParser.Create(
      ParseFile,TTextParsePreferences.Create(',',False));
    // ParseFile := nil; // 
    try
      while not Parser.EOF do
      begin
        Logger.LogMessage(Format('Line # %d',[Parser.LineNumber+1]));
        for Index := 0 to Parser.ItemCount-1 do
          Logger.LogMessage(Format('  Item # %d = %s',
            [Index+1,Parser.Items[Index]]));
        Parser.Next;
      end;
    finally
      Logger.LogMessage('End of file - dropping parser');
      DropAndNilI(Parser);
    end;
  end
  else
    Logger.LogMessage('Cancelled');
  Logger.LogMessage('END OF ROUTINE.. Cleanup');
end;

procedure TInterfacesExplorerForm.InheritanceButtonClick(Sender: TObject);
var
  Base : IBaseInterface;
  Derived : IDerivedInterface;
begin
  Logger.Clear;
  Logger.LogMessage('[Assigning TFirstClass object to Base]');
  Base := TFirstClass.Create;
  Base.DoBaseyThing;
  Logger.LogMessage('');

  // vv This line would give a compile error, because TSecondClass does not
  //    EXPLICITLY declare support for IBaseInterface
  // Base := TSecondClass.Create;
  Logger.LogMessage('[Assigning TSecondClass object to Derived]');
  Derived := TSecondClass.Create;
  Derived.DoBaseyThing;
  Derived.DoDerivedyThing;
  Logger.LogMessage('');
  Logger.LogMessage('[Trying to typecast TSecondClass to a Base]');
  try
    Base := Derived as IBaseInterface;
    Logger.LogMessage('SUCCESSFUL CAST: IBaseInterface supported');
  except
    Logger.LogMessage('FAILED CAST: IBaseInterface not supported')
  end;
  Logger.LogMessage('[Trying to typecast TSecondClass using nasty '+
    'direct-cast trick]');
  // vv This is a NASTY means to do it; you can do a direct cast because
  //    a derived interface will have base interface methods at the
  //    beginning of its indirection table.  DON'T DO THIS!
  Base := IBaseInterface(Derived);
  Base.DoBaseyThing;
  Logger.LogMessage('[It worked, but it was NASTY]');

  Logger.LogMessage('');
  Logger.LogMessage('[Assigning TThirdClass object to Derived]');
  Derived := TThirdClass.Create;
  Derived.DoBaseyThing;
  Derived.DoDerivedyThing;
  Logger.LogMessage('[Trying to typecast TThirdClass to a Base]');
  try
    Base := Derived as IBaseInterface;
    Logger.LogMessage('SUCCESSFUL CAST: IBaseInterface supported');
  except
    Logger.LogMessage('FAILED CAST: IBaseInterface not supported')
  end;
end;

procedure TInterfacesExplorerForm.LeakTestButtonClick(Sender: TObject);
var
  ASample : IPlainOldInterface;
begin
  Logger.Clear;
  ASample := TSomeSampleClass.Create;
  ASample.X := 777;
  Logger.LogMessage(Format('Sample.X = %d',[ASample.X]));
  ASample := TSomeSampleClass.Create;
  Logger.LogMessage(Format('Sample.X = %d',[ASample.X]));
end;

procedure TInterfacesExplorerForm.NonConstRefCountButtonClick(
  Sender: TObject);
var
  NewScream : IScream;
begin
  Logger.Clear;
  Logger.LogMessage('[Creating screamer]');
  NewScream := TIScream.Create('Robert');
  Logger.LogMessage('[Scream in non-const fashion]');
  NonConstScream(NewScream);
  Logger.LogMessage('[End of method]');
end;

procedure TInterfacesExplorerForm.OtherTypecastsButtonClick(
  Sender: TObject);
var
  AGoodMood : IHappy;
  ABadMood : ISad;
begin
  Logger.Clear;
  AGoodMood := TEmotionalRollerCoaster.Create;
  AGoodMood.ShowMood;
  Logger.LogMessage('Typecasting AGoodMood as ISad using ''Supports''');
  if Supports(AGoodMood,ISad,ABadMood) then
    ABadMood.ShowMood;
  ABadMood := nil;
  Logger.LogMessage('Typecasting AGoodMood as ISad using ''QueryInterface''');
  if AGoodMood.QueryInterface(ISad,ABadMood)=S_OK then
    ABadMood.ShowMood;
end;

procedure TInterfacesExplorerForm.OwnershipButtonClick(Sender: TObject);
var
  AJohn, ABob, AMary : IPetOwner;
begin
  // This shows that ownership isn't quite as much of a problem with interfaces
  // No 'owner' in this example is responsible for Freeing the Dog
  Logger.Clear;
  Logger.LogMessage('[creating owners - John has a dog]');
  AJohn := TPetOwner.Create('John',TDog.Create('Sparky'));
  ABob := TPetOwner.Create('Bob',nil);
  AMary := TPetOwner.Create('Mary',nil);
  Logger.LogMessage('[passing dog to Bob]');
  AJohn.PassPetTo(ABob);
  Logger.LogMessage('[passing dog to Mary]');
  ABob.PassPetTo(AMary);
  Logger.LogMessage('[letting go of John and Bob]');
  AJohn := nil;
  ABob := nil;
  Logger.LogMessage('END OF ROUTINE.. Cleanup');
end;

procedure TInterfacesExplorerForm.SimpleTestButtonClick(Sender: TObject);
var
  ASample : IPlainOldInterface;
begin
  Logger.Clear;
  ASample := TSomeSampleClass.Create;
  ASample.X := 777;
  Logger.LogMessage(Format('Sample.X = %d',[ASample.X]));
  ASample.DoSomething;
end;

procedure TInterfacesExplorerForm.ThreadsButtonClick(Sender: TObject);
var
  Flasher : IFlasher;
begin
  Logger.Clear;
  Logger.LogMessage('Flashing the form 3 times');
  Flasher := TFlasher.Create(Handle);
  Flasher.Flash;
  Logger.LogMessage
    ('Created thread with 8 second timer that will flash the form later');
  TFlashThread.Create(Flasher);
  Flasher := nil;
  Logger.LogMessage('Main method exiting');
end;

end.
