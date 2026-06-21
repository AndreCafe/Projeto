unit CircularReferenceSample;

interface

type
  IBuddy = interface
    ['{14C78CB2-69E5-11D6-9239-0004AC5359AE}']
    function GetBuddy: IBuddy;
    function GetNickname: String;
    procedure GreetBuddy;
    procedure SetBuddy(const ABuddy: IBuddy);
    property Buddy: IBuddy read GetBuddy write SetBuddy;
    property Nickname: String read GetNickname;
  end;
  TBuddy = class(TInterfacedObject,IBuddy)
  private
    FBuddy : IBuddy;
    FNickname : String;
  protected
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

{ TBuddy }

constructor TBuddy.Create(const ANickname: String);
begin
  inherited Create;
  FNickname := ANickname;
end;

destructor TBuddy.Destroy;
begin
  Logger.LogMessage(Format('%s: I''m going away now',[FNickname]));
  inherited;
end;

function TBuddy.GetBuddy: IBuddy;
begin
  Result := FBuddy;
end;

function TBuddy.GetNickname: String;
begin
  Result := FNickname;
end;

procedure TBuddy.GreetBuddy;
begin
  if FBuddy=nil then
    Logger.LogMessage(Format('%s: I have nobody to talk to',[FNickname]))
  else
    Logger.LogMessage(Format('%s: "Hey there, %s"',
      [FNickName,GetBuddy.Nickname]));
end;

procedure TBuddy.SetBuddy(const ABuddy: IBuddy);
begin
  FBuddy := ABuddy;
end;

end.
 