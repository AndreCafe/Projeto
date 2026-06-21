unit CircularFundamentalSample;

interface

uses CircularReferenceSample, Fundamentals;

type
  TFunBuddy = class(TFundamental,IBuddy)
  private
    FBuddy : IBuddy;
    FNickname : String;
  protected
    procedure Detaching(const AFundamental: IFundamental); override;
    // IBuddy
    function GetBuddy: IBuddy;
    function GetNickname: String;
    procedure GreetBuddy;
    procedure SetBuddy(const ABuddy: IBuddy);
  public
    constructor Create(const ANickname: String);
    destructor Destroy; override;
  end;

implementation

uses LoggerIntf, SysUtils;

{ TFunBuddy }

constructor TFunBuddy.Create(const ANickname: String);
begin
  inherited Create;
  FNickname := ANickname;
end;

destructor TFunBuddy.Destroy;
begin
  Logger.LogMessage(Format('%s: I''m going away now',[FNickname]));
  inherited;
end;

procedure TFunBuddy.Detaching(const AFundamental: IFundamental);
begin
  if EqualsFI(AFundamental,FBuddy) then
    FBuddy := nil;
end;

function TFunBuddy.GetBuddy: IBuddy;
begin
  Result := FBuddy;
end;

function TFunBuddy.GetNickname: String;
begin
  Result := FNickname;
end;

procedure TFunBuddy.GreetBuddy;
begin
  if FBuddy=nil then
    Logger.LogMessage(Format('%s: I have nobody to talk to',[FNickname]))
  else
    Logger.LogMessage(Format('%s: "Hey there, %s"',
      [FNickName,GetBuddy.Nickname]));
end;

procedure TFunBuddy.SetBuddy(const ABuddy: IBuddy);
begin
  //SetMember(FBuddy,ABuddy); // Not type-safe, assumes FBuddy and ABuddy
                              // are exactly the same type
  SetMemberAs(FBuddy,ABuddy,IBuddy); // More type-safe, but you have
                                     // to make sure that FBuddy is a variable
                                     // of type IBuddy
  // Or, you can go with the eminently safe, but verbose:
  // if FBuddy<>nil then
  //   DetachI(FBuddy);
  // FBuddy := ABuddy;
  // if ABuddy<>nil then
  //   AttachI(ABuddy);
end;

end.
