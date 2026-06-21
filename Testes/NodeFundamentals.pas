unit NodeFundamentals;

interface

uses Fundamentals, BasicLists;

type
  // This type of Fundamental can act as a parent
  TParentFundamental = class(TFundamental)
  private
    FAttachChildList : TBasicInterfaceList;
    function GetAttachedChildCount: Integer;
    function GetAttachedChildren(const AIndex: Integer): IFundamental;
  protected
    procedure DetachingChild(const AFundamental: IFundamental); virtual;
    procedure DropAllChildren; virtual;
    procedure InternalAttachChild(const AFundamental: IFundamental); override;
    procedure InternalDetachChild(const AFundamental: IFundamental); override;
    property AttachedChildCount: Integer read GetAttachedChildCount;
    property AttachedChildren[const AIndex: Integer]: IFundamental
      read GetAttachedChildren;
  public
    destructor Destroy; override;
    procedure Drop; override;
    procedure AttachChild(const AFundamental: IFundamental); override;
    procedure DetachChild(const AFundamental: IFundamental); override;
  end;
  // This type of Fundamental can act as a child
  TChildFundamental = class(TFundamental)
  private
    FParent : Pointer; // Weak pointer so as to not affect the parent's RefCount
  protected
    procedure InternalSetParent(const AFundamental: IFundamental); override;
  public
    procedure Drop; override;
    function GetParent: IFundamental; override;
    procedure SetParent(const AFundamental: IFundamental); override;
  end;
  // This type of Fundamental can act as either parent, child, or both
  // (Just like a node in a tree, for example)
  // Note that I have reimplemented the short functions from TChildFundamental
  // into a TParentFundamental instead of a more convoluted mix-in or delegation
  TNodeFundamental = class(TParentFundamental)
  private
    FParent : Pointer; // Weak pointer so as to not affect the parent's RefCount
  protected
    procedure InternalSetParent(const AFundamental: IFundamental); override;
  public
    procedure Drop; override;
    function GetParent: IFundamental; override;
    procedure SetParent(const AFundamental: IFundamental); override;
  end;

implementation

{ TParentFundamental }

procedure TParentFundamental.AttachChild(const AFundamental: IFundamental);
begin
  InternalAttachChild(AFundamental);
  AFundamental.InternalSetParent(Self);
end;

resourcestring
  SDetachChildAsymmetrical =
    'Detach failed; an attached child did not remove itself';
destructor TParentFundamental.Destroy;
begin
  DropAllChildren;
  inherited;
end;

procedure TParentFundamental.DetachChild(const AFundamental: IFundamental);
begin
  InternalDetachChild(AFundamental);
  AFundamental.InternalSetParent(nil);
end;

procedure TParentFundamental.DropAllChildren;
var
  Index : Integer;
  ToDetach : IFundamental;
begin
  if FAttachChildList<>nil then
  begin
    Index := AttachedChildCount-1;
    while Index>=0 do
    begin
      AttachGuard.Acquire;
      try
        if Index>=AttachedChildCount then
          Index := AttachedChildCount-1;
        if Index>=0 then
          ToDetach := AttachedChildren[Index];
      finally
        AttachGuard.Release;
      end;
      ToDetach.Drop;
      Dec(Index);
    end;
    Assert(AttachedChildCount=0,SDetachChildAsymmetrical);
  end;
end;

procedure TParentFundamental.DetachingChild(
  const AFundamental: IFundamental);
begin
  // For descendant classes; fires when a child is detaching
end;

procedure TParentFundamental.Drop;
begin
  inherited;
  DropAllChildren;
end;

function TParentFundamental.GetAttachedChildCount: Integer;
begin
  // -- Unguarded - must be called from a AttachGuard-guarded function
  Result := FAttachChildList.Count;
end;

function TParentFundamental.GetAttachedChildren(
  const AIndex: Integer): IFundamental;
begin
  // -- Unguarded - must be called from a AttachGuard-guarded function
  Result := FAttachChildList[AIndex] as IFundamental;
end;

procedure TParentFundamental.InternalAttachChild(
  const AFundamental: IFundamental);
begin
  AttachGuard.Acquire;
  try
    if FAttachChildList=nil then
      FAttachChildList := TBasicInterfaceList.Create;
    FAttachChildList.Add(AFundamental);
  finally
    AttachGuard.Release;
  end;
end;

procedure TParentFundamental.InternalDetachChild(
  const AFundamental: IFundamental);
begin
  AttachGuard.Acquire;
  try
    DetachingChild(AFundamental);
    if FAttachChildList<>nil then
      FAttachChildList.Remove(AFundamental);
  finally
    AttachGuard.Release;
  end;
end;

{ TChildFundamental }

procedure TChildFundamental.Drop;
begin
  Parent := nil;
  inherited;
end;

function TChildFundamental.GetParent: IFundamental;
begin
  Result := IFundamental(FParent);
end;

procedure TChildFundamental.InternalSetParent(
  const AFundamental: IFundamental);
begin
  Assert((FParent=nil) or (AFundamental=nil),
    'ChildFundamental::InternalSetParent cannot reassign parent without '+
    'nil-ing it first');
  AttachGuard.Acquire;
  try
    FParent := Pointer(AFundamental);
  finally
    AttachGuard.Release;
  end;
end;

procedure TChildFundamental.SetParent(const AFundamental: IFundamental);
begin
  // Direct usage required to make sure that RefCount isn't altered
  if FParent<>nil then
    IFundamental(FParent).InternalDetachChild(Self);
  InternalSetParent(AFundamental);
  if AFundamental<>nil then
    AFundamental.InternalAttachChild(Self);
end;

{ TNodeFundamental }

procedure TNodeFundamental.Drop;
begin
  Parent := nil;
  inherited;
end;

function TNodeFundamental.GetParent: IFundamental;
begin
  Result := IFundamental(FParent);
end;

procedure TNodeFundamental.InternalSetParent(
  const AFundamental: IFundamental);
begin
  Assert((FParent=nil) or (AFundamental=nil),
    'NodeFundamental::InternalSetParent cannot reassign parent without '+
    'nil-ing it first');
  AttachGuard.Acquire;
  try
    FParent := Pointer(AFundamental);
  finally
    AttachGuard.Release;
  end;
end;

procedure TNodeFundamental.SetParent(const AFundamental: IFundamental);
begin
  // Direct usage required to make sure that RefCount isn't altered
  if FParent<>nil then
    IFundamental(FParent).InternalDetachChild(Self);
  InternalSetParent(AFundamental);
  if AFundamental<>nil then
    AFundamental.InternalAttachChild(Self);
end;

end.
