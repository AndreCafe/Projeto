unit ncaMethodList;

interface

uses
   classes;
   
type
  TMethodInfo = class
    MethodName : string;
    Method : TMethod;
  end;

  TMethodList = class(TList)
  private
   protected
    function Get(Index: Integer): TMethodInfo;
    procedure Put(Index: Integer; Item: TMethodInfo);
   public
    function assigned(aMethodName: string): boolean;
    procedure Clear; override;
    procedure New(aMethodName:string; aMethod: TMethod);
    function  byName(aMethodName:string):TMethod;
    property Items[Index: Integer]: TMethodInfo read Get write Put; default;
    destructor Destroy; override;
  end;


implementation

{ TMethoList }

function TMethodList.byName(aMethodName: string): TMethod;
var
    i : integer;
    mi : TMethodInfo;
begin
    for i:=0 to count-1 do begin
       mi := get(i);
       if mi.MethodName=aMethodName then begin
           result := mi.Method;
           exit;
       end;
    end;
end;


procedure TMethodList.Clear;
var
    i : integer;
begin
    for i:=count-1 downto 0 do
       Get(i).free;
    count := 0;
end;

destructor TMethodList.Destroy;
begin
  Clear;
  inherited;
end;

function TMethodList.Get(Index: Integer): TMethodInfo;
begin
    result := inherited Get(Index);
end;

function TMethodList.assigned(aMethodName: string): boolean;
begin
    result := byName(aMethodName).Code<>nil;
end;

procedure TMethodList.New(aMethodName: string; aMethod: TMethod);
var
    nM : TMethodInfo;
begin
    nM := TMethodInfo.create;
    nM.MethodName := aMethodName;
    nM.Method     := aMethod;
    inherited add(nM);
end;

procedure TMethodList.Put(Index: Integer; Item: TMethodInfo);
begin
    inherited  Put(Index, Item);
end;

end.
