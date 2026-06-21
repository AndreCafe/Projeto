unit Fundamentals;

interface

uses Classes, BasicLists, Guards;

type
  IFundamental = interface
    ['{E19082F6-AD3B-11D5-9218-0004AC5359AE}']
    procedure Attach(const AFundamental: IFundamental);
    procedure AttachChild(const AFundamental: IFundamental);
    function GetParent: IFundamental;
    procedure Detach(const AFundamental: IFundamental);
    procedure DetachChild(const AFundamental: IFundamental);
    procedure SetParent(const AFundamental: IFundamental);
    procedure Drop;
    // Internal functions, here only so that casting to another interface
    // is not required, for speed's sake at the low levels
    procedure InternalAttach(const AFundamental: IFundamental);
    procedure InternalAttachChild(const AFundamental: IFundamental);
    procedure InternalDetach(const AFundamental: IFundamental);
    procedure InternalDetachChild(const AFundamental: IFundamental);
    procedure InternalSetParent(const AFundamental: IFundamental);
    // -- end of internal functions
    property Parent: IFundamental read GetParent write SetParent;
    {$IFDEF DEBUG_FUNDAMENTAL}
    function GetAttached(AIndex: Integer): IFundamental;
    function GetAttachedCount: Integer;
    property Attached[Index: Integer]: IFundamental read GetAttached;
    property AttachedCount: Integer read GetAttachedCount;
    function ReferenceCount: Integer;
    {$ENDIF}
  end;
  TFundamental = class(TInterfacedObject,IFundamental)
  private
    FAttachList : TBasicInterfaceList;
    FAttachGuard : ICOREGuard;
    function GetAttached(AIndex: Integer): IFundamental;
    function GetAttachedCount: Integer;
  protected
    // AttachI and DetachI map to Attach and Detach, but do the interface
    // cast to IFundamental for you, so your code need not be littered with
    // 'as IFundamental'
    procedure AttachI(const AInterface: IUnknown);
    procedure DetachI(const AInterface: IUnknown);
    procedure DetachAll; virtual;
    procedure Detaching(const AFundamental: IFundamental); virtual;
    procedure InternalAttach(const AFundamental: IFundamental); virtual;
    procedure InternalAttachChild(const AFundamental: IFundamental); virtual;
    procedure InternalDetach(const AFundamental: IFundamental); virtual;
    procedure InternalDetachChild(const AFundamental: IFundamental); virtual;
    procedure InternalSetParent(const AFundamental: IFundamental); virtual;
    procedure SetMember(var AField; const ASetTo: IUnknown);
    procedure SetMemberAs(var AField; const ASetTo: IUnknown;
      ASetType: TGUID);
    property Attached[Index: Integer]: IFundamental read GetAttached;
    property AttachedCount: Integer read GetAttachedCount;
    property AttachGuard: ICOREGuard read FAttachGuard;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Attach(const AFundamental: IFundamental); virtual;
    procedure AttachChild(const AFundamental: IFundamental); virtual;
    function GetParent: IFundamental; virtual;
    procedure SetParent(const AFundamental: IFundamental); virtual;
    procedure Detach(const AFundamental: IFundamental); virtual;
    procedure DetachChild(const AFundamental: IFundamental); virtual;
    procedure Drop; virtual;
    function ReferenceCount: Integer;
    property Parent: IFundamental read GetParent write SetParent;
  end;
  // If you get an access violation on a line with AttachGuard, it means
  // you forgot to put an "inherited Create" in your constructor

  procedure DropI(const AInterface: IUnknown);
  procedure DropAndNilI(var AInterface);
  function EqualsI(const AInterface1, AInterface2: IUnknown): Boolean;
  function EqualsFI(const AInterface1: IFundamental; AInterface2: IUnknown):
    Boolean;

implementation

uses SysUtils;

procedure DropI(const AInterface: IUnknown);
begin
  if AInterface<>nil then
    (AInterface as IFundamental).Drop;
end;

procedure DropAndNilI(var AInterface);
begin
  if IUnknown(AInterface)<>nil then
  begin
    (IUnknown(AInterface) as IFundamental).Drop;
    IUnknown(AInterface) := nil;
  end;
end;

function EqualsI(const AInterface1, AInterface2: IUnknown): Boolean;
begin
  Result := (AInterface1 as IFundamental)=(AInterface2 as IFundamental);
end;

function EqualsFI(const AInterface1: IFundamental; AInterface2: IUnknown):
  Boolean;
begin
  Result := AInterface1=(AInterface2 as IFundamental);
end;

{ TFundamental }

procedure TFundamental.Attach(const AFundamental: IFundamental);
begin
  // Descendants can gate (i.e. lock for exclusive use by a thread)
  // access to this
  InternalAttach(AFundamental);
  AFundamental.InternalAttach(Self);
end;

procedure TFundamental.AttachChild(const AFundamental: IFundamental);
begin
  Assert(False,'Fundamental::AttachChild not supported');
end;

procedure TFundamental.AttachI(const AInterface: IUnknown);
begin
  Attach(AInterface as IFundamental);
end;

constructor TFundamental.Create;
begin
  inherited;
  FAttachGuard := NewGuard;
end;

resourcestring
  SShutDownImproperly = 'Something Freed this object instead of unreferencing it';
destructor TFundamental.Destroy;
begin
  Assert(AttachedCount=0,SShutDownImproperly);

  if FAttachList<>nil then
  begin
    FAttachList.Free;
    FAttachList := nil;
  end;
  inherited;
end;

procedure TFundamental.Detach(const AFundamental: IFundamental);
begin
  // Descendants can gate access to this
  InternalDetach(AFundamental);
  AFundamental.InternalDetach(Self);
end;

resourcestring
  SDetachAsymmetrical = 'Detach failed; an attached item did not remove itself';
procedure TFundamental.DetachAll;
var
  Index : Integer;
  ToDetach : IFundamental;
begin
  if FAttachList<>nil then
  begin
    Index := AttachedCount-1;
    while Index>=0 do
    begin
      AttachGuard.Acquire;
      try
        if Index>=AttachedCount then
          Index := AttachedCount-1;
        if Index>=0 then
          ToDetach := Attached[Index];
      finally
        AttachGuard.Release;
      end;
      Detach(ToDetach);
      Dec(Index);
    end;
    Assert(AttachedCount=0,SDetachAsymmetrical);
  end;
end;

procedure TFundamental.DetachChild(const AFundamental: IFundamental);
begin
  Assert(False,'Fundamental::DetachChild not supported');
end;

procedure TFundamental.DetachI(const AInterface: IUnknown);
begin
  Detach(AInterface as IFundamental);
end;

procedure TFundamental.Detaching(const AFundamental: IFundamental);
begin
  // This is the equivalent of TComponent.Notification with opRemove
  // Take this opportunity to nil out properties that are detaching
  // from you
end;

procedure TFundamental.Drop;
begin
  // Left for descendants to expand upon
  DetachAll;
end;

resourcestring
  SNoAttached = '.GetAttached invalid with a nil attached list';
function TFundamental.GetAttached(AIndex: Integer): IFundamental;
begin
  Assert(FAttachList<>nil,SNoAttached);
  Result := FAttachList[AIndex] as IFundamental;
end;

function TFundamental.GetAttachedCount: Integer;
begin
  if FAttachList=nil then
    Result := 0
  else
    Result := FAttachList.Count;
end;

function TFundamental.GetParent: IFundamental;
begin
  Assert(False,'Fundamental::GetParent not supported');
end;

procedure TFundamental.InternalAttach(const AFundamental: IFundamental);
begin
  AttachGuard.Acquire;
  try
    if FAttachList=nil then
      FAttachList := TBasicInterfaceList.Create;
    FAttachList.Add(AFundamental);
  finally
    AttachGuard.Release;
  end;
end;

procedure TFundamental.InternalAttachChild(
  const AFundamental: IFundamental);
begin
  Assert(False,'Fundamental::InternalAttachChild not supported');
end;

procedure TFundamental.InternalDetach(const AFundamental: IFundamental);
begin
  AttachGuard.Acquire;
  try
    Detaching(AFundamental);
    if FAttachList=nil then
      FAttachList := TBasicInterfaceList.Create;
    FAttachList.Remove(AFundamental);
  finally
    AttachGuard.Release;
  end;
end;

procedure TFundamental.InternalDetachChild(
  const AFundamental: IFundamental);
begin
  Assert(False,'Fundamental::InternalDetachChild not supported');
end;

procedure TFundamental.InternalSetParent(const AFundamental: IFundamental);
begin
  Assert(False,'Fundamental::InternalSetParent not supported');
end;

function TFundamental.ReferenceCount: Integer;
begin
  Result := RefCount;
end;

procedure TFundamental.SetParent(const AFundamental: IFundamental);
begin
  Assert(False,'Fundamental::SetParent not supported');
end;

procedure TFundamental.SetMember(var AField; const ASetTo: IUnknown);
begin
  // This lets you hide a little bit of the tedium of attaching and
  // detaching in your property setters, so instead of
  // if FMyVariable<>nil then
  //   Detach(FMyVariable);
  // FMyVariable := ANewValue;
  // if FMyVariable<>nil then
  //   Attach(FMyVariable);
  // ... you can go
  // SetMember(FMyVariable,AMyVariable);
  // ...and be done with it
  // NOTE: This code shortcut may not work with .NET; there have been
  //   indications that typeless var parameters may go away
  if IUnknown(AField)<>nil then
    Detach(IUnknown(AField) as IFundamental);
  if ASetTo=nil then
    IUnknown(AField) := nil
  else
  begin
    Attach(ASetTo as IFundamental);
    // NOTE: This particular setting trick only works properly if AField and
    //   ASetTo are the type of interface variable.  Otherwise, the
    //   _AddRef, _Release and QueryInterface may point to the right spot,
    //   but other methods could cause serious errors.
    IUnknown(AField) := ASetTo;
  end;
end;

resourcestring
  SSetMemberAsError =
    'Fundamental::SetMemberAs - ASetTo does not implement ASetType';
procedure TFundamental.SetMemberAs(var AField; const ASetTo: IUnknown;
  ASetType: TGUID);
begin
  if IUnknown(AField)<>nil then
    Detach(IUnknown(AField) as IFundamental);
  if ASetTo=nil then
    IUnknown(AField) := nil
  else
  begin
    Attach(ASetTo as IFundamental);
    Assert(Supports(ASetTo,ASetType,IUnknown(AField)),SSetMemberAsError);
  end;
end;

end.
