unit BasicLists;

interface

uses Classes{$IFDEF VER140}, RTLConsts{$ENDIF};

type
  // You can use these lists as you would a regular TInterfaceList
  // if you are not using threads, or if you are using threads, but using
  // your own critical sections to guard the list (making TInterfaceList's
  // guarding redundant)
  TCustomInterfaceList = class
  private
    FList: TList;
  protected
    { IInterfaceList }
    function Get(Index: Integer): IUnknown;
    function GetCapacity: Integer;
    function GetCount: Integer;
    procedure Put(Index: Integer; const Item: IUnknown); virtual; abstract;
    procedure SetCapacity(NewCapacity: Integer);
    procedure SetCount(NewCount: Integer);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    function Add(const Item: IUnknown): Integer; virtual; abstract;
    procedure Clear;
    function Clone: TCustomInterfaceList; virtual;
    procedure Delete(Index: Integer);
    procedure Exchange(Index1, Index2: Integer);
    function Expand: TCustomInterfaceList;
    function First: IUnknown;
    function IndexOf(const Item: IUnknown): Integer;
    procedure Insert(Index: Integer; const Item: IUnknown); virtual; abstract;
    function Last: IUnknown;
    procedure Pack;
    function Remove(const Item: IUnknown): Integer; virtual; abstract;
    property Capacity: Integer read GetCapacity write SetCapacity;
    property Count: Integer read GetCount write SetCount;
    property Items[Index: Integer]: IUnknown read Get write Put; default;
  end;
  TBasicInterfaceList = class(TCustomInterfaceList)
  protected
    procedure Put(Index: Integer; const Item: IUnknown); override;
  public
    function Add(const Item: IUnknown): Integer; override;
    procedure Insert(Index: Integer; const Item: IUnknown); override;
    function Remove(const Item: IUnknown): Integer; override;
  end;
  TNonRefCountedBasicInterfaceList = class(TCustomInterfaceList)
  protected
    procedure Put(Index: Integer; const Item: IUnknown); override;
  public
    function Add(const Item: IUnknown): Integer; override;
    procedure Insert(Index: Integer; const Item: IUnknown); override;
    function Remove(const Item: IUnknown): Integer; override;
  end;

implementation

uses Consts;

{ TCustomInterfaceList }

procedure TCustomInterfaceList.Clear;
begin
  FList.Clear;
end;

type
  TCustomInterfaceListClass = class of TCustomInterfaceList;
function TCustomInterfaceList.Clone: TCustomInterfaceList;
var
  Index : Integer;
begin
  Result := TCustomInterfaceListClass(ClassType).Create;
  for Index := 0 to Count-1 do
    Result.Add(Items[Index]);
end;

constructor TCustomInterfaceList.Create;
begin
  inherited Create;
  FList := TList.Create;
end;

procedure TCustomInterfaceList.Delete(Index: Integer);
begin
  Put(Index, nil);
  FList.Delete(Index);
end;

destructor TCustomInterfaceList.Destroy;
begin
  Clear;
  FList.Free;
  inherited Destroy;
end;

procedure TCustomInterfaceList.Exchange(Index1, Index2: Integer);
begin
  FList.Exchange(Index1, Index2);
end;

function TCustomInterfaceList.Expand: TCustomInterfaceList;
begin
  FList.Expand;
  Result := Self;
end;

function TCustomInterfaceList.First: IUnknown;
begin
  Result := Get(0);
end;

function TCustomInterfaceList.Get(Index: Integer): IUnknown;
begin
  if (Index < 0) or (Index >= Count) then
    FList.Error(@SListIndexError, Index);
  Result := IUnknown(FList.List[Index]);
end;

function TCustomInterfaceList.GetCapacity: Integer;
begin
  Result := FList.Capacity;
end;

function TCustomInterfaceList.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TCustomInterfaceList.IndexOf(const Item: IUnknown): Integer;
begin
  Result := FList.IndexOf(Pointer(Item));
end;

function TCustomInterfaceList.Last: IUnknown;
begin
  Result := Get(Count - 1);
end;

procedure TCustomInterfaceList.Pack;
begin
  FList.Pack;
end;

procedure TCustomInterfaceList.SetCapacity(NewCapacity: Integer);
begin
  FList.Capacity := NewCapacity;
end;

procedure TCustomInterfaceList.SetCount(NewCount: Integer);
begin
  FList.Count := NewCount;
end;

{ TBasicInterfaceList }

function TBasicInterfaceList.Add(const Item: IUnknown): Integer;
begin
  Result := FList.Add(nil);
  IUnknown(FList.List[Result]) := Item;
end;

procedure TBasicInterfaceList.Insert(Index: Integer; const Item: IUnknown);
begin
  FList.Insert(Index, nil);
  IUnknown(FList.List[Index]) := Item;
end;

procedure TBasicInterfaceList.Put(Index: Integer; const Item: IUnknown);
begin
  if (Index < 0) or (Index >= Count) then
    FList.Error(@SListIndexError, Index);
  IUnknown(FList.List[Index]) := Item;
end;

function TBasicInterfaceList.Remove(const Item: IUnknown): Integer;
begin
  Result := FList.IndexOf(Pointer(Item));
  if Result > -1 then
  begin
    IUnknown(FList.List[Result]) := nil;
    FList.Delete(Result);
  end;
end;

{ TNonRefCountedBasicInterfaceList }

function TNonRefCountedBasicInterfaceList.Add(const Item: IUnknown): Integer;
begin
  Result := FList.Add(Pointer(Item));
end;

procedure TNonRefCountedBasicInterfaceList.Insert(Index: Integer;
  const Item: IUnknown);
begin
  inherited;
  FList.Insert(Index,Pointer(Item));
end;

procedure TNonRefCountedBasicInterfaceList.Put(Index: Integer;
  const Item: IUnknown);
begin
  if (Index < 0) or (Index >= Count) then
    FList.Error(@SListIndexError, Index);
  FList.List[Index] := Pointer(Item);
end;

function TNonRefCountedBasicInterfaceList.Remove(const Item: IUnknown): Integer;
begin
  Result := FList.IndexOf(Pointer(Item));
  if Result > -1 then
    FList.Delete(Result);
end;

end.
