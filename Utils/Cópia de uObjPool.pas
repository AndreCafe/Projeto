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
    FItems: TList;
    FThreads: TList;
    FCS: TCriticalSection;
    FMaxObjs : Integer;
    FWaitTime : Cardinal;
    FCreateNewPoolObj: TCreateNewPoolObj;
    
    function GetObj(T: Pointer): TObject;
  protected  
    function CreateObj: TObject; virtual;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Clear;

    procedure ReleaseObj(AObj: TObject);
    function GetObjFromPool: TObject;

    property WaitTime: Cardinal
      read FWaitTime write FWaitTime;
    
    property MaxObjs: Integer
      read FMaxObjs write FMaxObjs;

    property CreateNewPoolObj: TCreateNewPoolObj    
      read FCreateNewPoolObj write FCreateNewPoolObj; 
  end;
  

implementation

{ TObjectPool }

procedure TObjectPool.Clear;
begin
  FCS.Enter;
  try
    while FItems.Count > 0 do begin
      TPoolItem(FItems[0]).Free;
      FItems.Delete(0);
    end;  
  finally
    FCS.Leave;
  end;
end;

constructor TObjectPool.Create;
begin
  inherited;
  FCS := TCriticalSection.Create;
  FItems := TList.Create;
  FThreads := TList.Create;
  
  FMaxObjs := -1;
  FWaitTime := 5;
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
  FThreads.Free;
  FCS.Free;
  inherited;
end;

function TObjectPool.GetObj(T: Pointer): TObject;
var 
  I, P: Integer;
  PI : TPoolItem;
begin
  FCS.Enter;
  try
    if (FMaxObjs>0) and (FThreads[0]<>T) then begin
      Result := nil;
      Exit;
    end;
    
    for I := 0 to FItems.Count-1 do 
    with TPoolItem(FItems[I]) do 
    if not InUse then begin
      InUse := True;
      Result := Obj;
      Exit;
    end;
    
    if (FMaxObjs=-1) or (FItems.Count<FMaxObjs) then begin
      Result := CreateObj;
      PI := TPoolItem.Create(Result);
      FItems.Add(PI);
    end else
      Result := nil;  
  finally
    FCS.Leave;
  end;  
end;

function TObjectPool.GetObjFromPool: TObject;
var T: Pointer;
begin
  if FMaxObjs>0 then begin
    T := Pointer(GetCurrentThreadID);
    FCS.Enter;
    try
      FThreads.Add(T);
    finally
      FCS.Leave;
    end;
  end;

  try
    repeat
      Result := GetObj(T);
      if Result = nil then
        Sleep(FWaitTime);
    until (Result<>nil);
  finally
    if FMaxObjs>0 then begin
      FCS.Enter;
      try
        FThreads.Remove(T);
      finally
        FCS.Leave;
      end;
    end;
  end;
end;

procedure TObjectPool.ReleaseObj(AObj: TObject);
var I : Integer;
begin
  FCS.Enter;
  try
    for I := 0 to FItems.Count-1 do 
    with TPoolItem(FItems[I]) do 
      if Obj = AObj then begin
        InUse := False;
        Exit;
      end;
    AObj.Free;  
  finally
    FCS.Leave;
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
