unit uObjPool;

interface

uses
  Windows,
  Classes,
  SysUtils,
  SyncObjs;

type

  TCreateNewPoolObj = function: TObject of object;
  
  TPoolItem = class
  private
    InUse : Boolean;
    Obj   : TObject;
  public  
    constructor Create(AObj: TObject);
    destructor Destroy; override;
  end;

  TObjectPool = class
  private
    FItems: TThreadList;
    FMaxObjs : Integer;
    FCreateNewPoolObj: TCreateNewPoolObj;
    
    function GetObj: TObject;
  protected  
    function CreateObj: TObject; virtual;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Clear;

    procedure ReleaseObj(AObj: TObject);
    function GetObjFromPool: TObject;
    
    property MaxObjs: Integer
      read FMaxObjs write FMaxObjs;

    property CreateNewPoolObj: TCreateNewPoolObj    
      read FCreateNewPoolObj write FCreateNewPoolObj; 
  end;
  

implementation

{ TObjectPool }

procedure TObjectPool.Clear;
begin
  with FItems.LockList do 
  try
    while Count > 0 do begin
      TPoolItem(Items[0]).Free;
      Delete(0);
    end;  
  finally
    FItems.UnlockList;
  end;
end;

constructor TObjectPool.Create;
begin
  inherited;
  FItems := TThreadList.Create;
  FMaxObjs := -1;
  FCreateNewPoolObj := nil;
end;

function TObjectPool.CreateObj: TObject;
begin
  if not Assigned(FCreateNewPoolObj) then
    Raise Exception.Create('CreateNewPoolObj method not assigned');

  Result := FCreateNewPoolObj;
end;

destructor TObjectPool.Destroy;
begin
  Clear;
  FItems.Free;  
  inherited;
end;

function TObjectPool.GetObj: TObject;
var 
  I : Integer;
  PI : TPoolItem;
begin
  with FItems.LockList do 
  try
    for I := 0 to Count-1 do 
    with TPoolItem(Items[I]) do 
    if not InUse then begin
      InUse := True;
      Result := TPoolItem(Items[I]).Obj;
      Exit;
    end;
    
    if (FMaxObjs=-1) or (Count<FMaxObjs) then begin
      Result := CreateObj;
      PI := TPoolItem.Create(Result);
      Add(PI);
    end else
      Result := nil;  
  finally
    FItems.UnlockList;
  end;  
end;

function TObjectPool.GetObjFromPool: TObject;
begin
  repeat
    Result := GetObj;
    if Result = nil then
      Sleep(10);
  until (Result<>nil);    
end;

procedure TObjectPool.ReleaseObj(AObj: TObject);
var I : Integer;
begin
  with FItems.LockList do 
  try
    for I := 0 to Count-1 do with TPoolItem(Items[I]) do 
      if Obj = AObj then begin
        InUse := False;
        Exit;
      end;
    AObj.Free;  
  finally
    FItems.UnlockList;
  end;  
end;

{ TPoolItem }

constructor TPoolItem.Create(AObj: TObject);
begin
  inherited Create;
  Obj := AObj;
  InUse := True;
end;

destructor TPoolItem.Destroy;
begin
  Obj.Free;
  inherited;
end;

end.
