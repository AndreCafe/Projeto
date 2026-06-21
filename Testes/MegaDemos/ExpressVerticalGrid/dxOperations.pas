unit dxOperations;

interface

uses
  SysUtils, Controls, Classes, dxBar, dxOperationTypes;

type
  IdxgdEventSubscriber = interface
    ['{94CA5AAE-92A6-4D1D-905A-01DB1308C14A}']
    procedure ProcessEvent(AOperationType: TdxgdOperationType);
  end;

  PdxRegisteredBar = ^TdxRegisteredBar;
  TdxRegisteredBar = record
    Bar: TdxBar;
    BarType: TdxgdBarType;
  end;

  PdxRegisteredPopupMenu = ^TdxRegisteredPopupMenu;
  TdxRegisteredPopupMenu = record
    PopupMenu: TdxBarPopupMenu;
    PopupMenuType: TdxgdPopupMenuType;
  end;

  PdxRegisteredBarItem = ^TdxRegisteredBarItem;
  TdxRegisteredBarItem = record
    BarItem: TdxBarItem;
    OperationType: TdxgdOperationType;
  end;

  TdxOperationManager = class
  private
    FRegisteredBars: TList;
    FRegisteredPopupMenus: TList;
    FRegisteredBarItems: TList;
    FSubscribers: TInterfaceList;

    function GetBarItem(AOperationType: TdxgdOperationType): TdxBarItem;
    function GetRegisteredBar(Index: Integer): TdxRegisteredBar;
    function GetRegisteredBarCount: Integer;
    function GetRegisteredPopupMenu(Index: Integer): TdxRegisteredPopupMenu;
    function GetRegisteredPopupMenuCount: Integer;
    function GetRegisteredBarItem(Index: Integer): TdxRegisteredBarItem;
    function GetRegisteredBarItemCount: Integer;

    procedure BarItemClick(Sender: TObject);
    procedure ClearRegisteredBars;
    procedure ClearRegisteredBarItems;
    procedure ClearRegisteredPopupMenus;
  protected
    constructor CreateInstance;
    class function AccessInstance(Request: Integer): TdxOperationManager;

    function GetBarByBarType(ABarType: TdxgdBarType): TdxBar;
    function GetOperationTypeByBarItem(ABarItem: TdxBarItem): TdxgdOperationType;
    function GetPopupMenuByBarType(APopupMenuType: TdxgdPopupMenuType): TdxBarPopupMenu;

    property RegisteredBarCount: Integer read GetRegisteredBarCount;
    property RegisteredBars[Index: Integer]: TdxRegisteredBar read GetRegisteredBar;
    property RegisteredBarItemCount: Integer read GetRegisteredBarItemCount;
    property RegisteredBarItems[Index: Integer]: TdxRegisteredBarItem read GetRegisteredBarItem;
    property RegisteredPopupMenuCount: Integer read GetRegisteredPopupMenuCount;
    property RegisteredPopupMenus[Index: Integer]: TdxRegisteredPopupMenu read GetRegisteredPopupMenu;
    property Subscribers: TInterfaceList read FSubscribers;
  public
    constructor Create;
    destructor Destroy; override;
    class function Instance: TdxOperationManager;
    class procedure ReleaseInstance;

    procedure RegisterBar(ABar: TdxBar; ABarType: TdxgdBarType);
    procedure RegisterPopupMenu(APopupMenu: TdxBarPopupMenu; APopupMenuType: TdxgdPopupMenuType);
    procedure RegisterBarItem(ABarItem: TdxBarItem; AOperationType: TdxgdOperationType);
    procedure PopupFromCursorPos(APopupMenuType: TdxgdPopupMenuType);

    procedure RegisterSubscriber(ASubscriber: IdxgdEventSubscriber);
    procedure UnregisterSubscriber(ASubscriber: IdxgdEventSubscriber);

    procedure ProcessEvent(AOperationType: TdxgdOperationType);

    property BarItems[AOperationType: TdxgdOperationType]: TdxBarItem read GetBarItem;
  end;

  TdxOperationHandler = procedure(AOperationType: TdxgdOperationType) of object;

  TdxOperation = class
  private
    FBarItem: TdxBarItem;
    FCallOnlyWhenActive: Boolean;
    FHandler: TdxOperationHandler;
    FOperationType: TdxgdOperationType;

    function GetBarItem: TdxBarItem;
    function GetDown: Boolean;
    function GetEnabled: Boolean;
    function GetText: string;
    procedure SetDown(Value: Boolean);
    procedure SetEnabled(Value: Boolean);
    procedure SetText(const Value: string);
  protected
    procedure Update(AShow: Boolean);
  public
    constructor Create(AOperationType: TdxgdOperationType;
      AHandler: TdxOperationHandler; ACallOnlyWhenActive: Boolean);
    procedure DoHandler;
    property BarItem: TdxBarItem read GetBarItem;
    property CallOnlyWhenActive: Boolean read FCallOnlyWhenActive;
    property Down: Boolean read GetDown write SetDown;
    property Enabled: Boolean read GetEnabled write SetEnabled;
    property OperationType: TdxgdOperationType read FOperationType;
    property Text: string read GetText write SetText;
  end;

  TdxOperationArray = array[TdxgdOperationType] of TdxOperation;

  TdxOperations = class
  private
    FOperationList: TdxOperationArray;
    function GetOperation(Index: TdxgdOperationType): TdxOperation;
  public
    destructor Destroy; override;
    procedure AddOperation(AOperationType: TdxgdOperationType;
      AHandler: TdxOperationHandler; ACallOnlyWhenActive: Boolean = True);
    procedure AddOperationToPopupMenu(AOperationType: TdxgdOperationType;
      APopupMenu: TdxBarPopupMenu; ASeparator: Boolean);
    procedure UpdateItems(AShow: Boolean);
    
    property Items[Index: TdxgdOperationType]: TdxOperation read GetOperation; default;
  end;

  TdxBarInfo = class
  private
    FBar: TdxBar;
    FBarType: TdxgdBarType;
    //FCustomize: Boolean;
  protected
    procedure Update(AShow: Boolean);
  public
    constructor Create(ABarType: TdxgdBarType);
    property Bar: TdxBar read FBar write FBar;
    //property Customize: Boolean read FCustomize write FCustomize;
  end;

  TdxBarInfoArray = array[TdxgdBarType] of TdxBarInfo;

  TdxBarList = class
  private
    FBarInfoList: TdxBarInfoArray;
    function GetItem(Value: TdxgdBarType): TdxBarInfo;
  public
    destructor Destroy; override;
    procedure AddBar(ABarType: TdxgdBarType);
    function GetBarInfoByBar(ABar: TdxBar): TdxBarInfo;
    procedure UpdateItems(AShow: Boolean);
    property Items[Value: TdxgdBarType]: TdxBarInfo read GetItem; default;
  end;

function dxOperationManager: TdxOperationManager;

implementation

uses
  uStrsConst, TypInfo;

type
  TdxBarWindowItemAccess = class(TdxBarWindowItem);

function dxOperationManager: TdxOperationManager;
begin
  Result := TdxOperationManager.Instance;
end;

{ TdxOperationManager }

constructor TdxOperationManager.Create;
begin
  inherited Create;
  raise Exception.CreateFmt(sdxCannotCreateSecondInstance, [ClassName]);
end;

destructor TdxOperationManager.Destroy;
begin
  if AccessInstance(0) = Self then AccessInstance(2);
  FSubscribers.Free;
  ClearRegisteredBarItems;
  FRegisteredBarItems.Free;
  ClearRegisteredBars;
  FRegisteredBars.Free;
  ClearRegisteredPopupMenus;
  FRegisteredPopupMenus.Free;
  inherited Destroy;
end;

function TdxOperationManager.GetBarItem(AOperationType: TdxgdOperationType): TdxBarItem;
var
  I: Integer;
begin
  for I := 0 to RegisteredBarItemCount - 1 do
  begin
    Result := RegisteredBarItems[I].BarItem;
    if RegisteredBarItems[I].OperationType = AOperationType then Exit;
  end;
  Result := nil;
end;

function TdxOperationManager.GetRegisteredBar(Index: Integer): TdxRegisteredBar;
begin
  Result := PdxRegisteredBar(FRegisteredBars[Index])^;
end;

function TdxOperationManager.GetRegisteredBarCount: Integer;
begin
  Result := FRegisteredBars.Count;
end;

function TdxOperationManager.GetRegisteredPopupMenu(Index: Integer): TdxRegisteredPopupMenu;
begin
  Result := PdxRegisteredPopupMenu(FRegisteredPopupMenus[Index])^;
end;

function TdxOperationManager.GetRegisteredPopupMenuCount: Integer;
begin
  Result := FRegisteredPopupMenus.Count;
end;

function TdxOperationManager.GetRegisteredBarItem(Index: Integer): TdxRegisteredBarItem;
begin
  Result := PdxRegisteredBarItem(FRegisteredBarItems[Index])^;
end;

function TdxOperationManager.GetRegisteredBarItemCount: Integer;
begin
  Result := FRegisteredBarItems.Count;
end;

procedure TdxOperationManager.BarItemClick(Sender: TObject);
begin
  ProcessEvent(GetOperationTypeByBarItem(Sender as TdxBarItem));
end;

procedure TdxOperationManager.ClearRegisteredBars;
var
  I: Integer;
begin
  if FRegisteredBars <> nil then
    for I := 0 to FRegisteredBars.Count - 1 do
      Dispose(FRegisteredBars[I]);
end;

procedure TdxOperationManager.ClearRegisteredBarItems;
var
  I: Integer;
begin
  if FRegisteredBarItems <> nil then
    for I := 0 to FRegisteredBarItems.Count - 1 do
      Dispose(FRegisteredBarItems[I]);
end;

procedure TdxOperationManager.ClearRegisteredPopupMenus;
var
  I: Integer;
begin
  if FRegisteredPopupMenus <> nil then
    for I := 0 to FRegisteredPopupMenus.Count - 1 do
      Dispose(FRegisteredPopupMenus[I]);
end;

constructor TdxOperationManager.CreateInstance;
begin
  inherited Create;
  FRegisteredBarItems := TList.Create;
  FRegisteredBars := TList.Create;
  FRegisteredPopupMenus := TList.Create;
  FSubscribers := TInterfaceList.Create;
end;

var
  FInstance: TdxOperationManager = nil;

class function TdxOperationManager.AccessInstance(
  Request: Integer): TdxOperationManager;
begin
  case Request of
    0 : ;
    1 : if not Assigned(FInstance) then FInstance := CreateInstance;
    2 : FInstance := nil;
  else
    raise Exception.CreateFmt(sdxAccessCodeIsIllegal, [Request]);
  end;
  Result := FInstance;
end;

function TdxOperationManager.GetBarByBarType(ABarType: TdxgdBarType): TdxBar;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to RegisteredBarCount - 1 do
    if RegisteredBars[I].BarType = ABarType then
      Result := RegisteredBars[I].Bar;
end;

function TdxOperationManager.GetOperationTypeByBarItem(ABarItem: TdxBarItem): TdxgdOperationType;
var
  I: Integer;
begin
  Result := otNone;
  for I := 0 to RegisteredBarItemCount - 1 do
    if RegisteredBarItems[I].BarItem = ABarItem then
    begin
      Result := RegisteredBarItems[I].OperationType;
      break;
    end;
end;

function TdxOperationManager.GetPopupMenuByBarType(APopupMenuType: TdxgdPopupMenuType): TdxBarPopupMenu;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to RegisteredPopupMenuCount - 1 do
    if RegisteredPopupMenus[I].PopupMenuType = APopupMenuType then
    begin
      Result := RegisteredPopupMenus[I].PopupMenu;
      break;
    end;
end;


class function TdxOperationManager.Instance: TdxOperationManager;
begin
  Result := AccessInstance(1);
end;

class procedure TdxOperationManager.ReleaseInstance;
begin
  AccessInstance(0).Free;
end;

procedure TdxOperationManager.RegisterBar(ABar: TdxBar; ABarType: TdxgdBarType);
var
  RegisteredBar: PdxRegisteredBar;
begin
  New(RegisteredBar);
  with RegisteredBar^ do
  begin
    Bar := ABar;
    BarType := ABarType;
  end;
  FRegisteredBars.Add(RegisteredBar);
end;

procedure TdxOperationManager.RegisterPopupMenu(APopupMenu: TdxBarPopupMenu; APopupMenuType: TdxgdPopupMenuType);
var
  RegisteredPopupMenu: PdxRegisteredPopupMenu;
begin
  New(RegisteredPopupMenu);
  with RegisteredPopupMenu^ do
  begin
    PopupMenu := APopupMenu;
    PopupMenuType := APopupMenuType;
  end;
  FRegisteredPopupMenus.Add(RegisteredPopupMenu);
end;

procedure TdxOperationManager.RegisterBarItem(ABarItem: TdxBarItem;
  AOperationType: TdxgdOperationType);
var
  RegisteredBarItem: PdxRegisteredBarItem;
begin
  New(RegisteredBarItem);
  with RegisteredBarItem^ do
  begin
    BarItem := ABarItem;
    OperationType := AOperationType;
  end;
  ABarItem.OnClick := BarItemClick;
  if ABarItem is TdxBarWindowItem then
    TdxBarWindowItem(ABarItem).OnChange := BarItemClick;
  FRegisteredBarItems.Add(RegisteredBarItem);
end;

procedure TdxOperationManager.PopupFromCursorPos(APopupMenuType: TdxgdPopupMenuType);
var
  APopupMenu: TdxBarPopupMenu;
begin
  APopupMenu := GetPopupMenuByBarType(APopupMenuType);
  if APopupMenu <> nil then
    APopupMenu.PopupFromCursorPos;
end;


procedure TdxOperationManager.RegisterSubscriber(ASubscriber: IdxgdEventSubscriber);
begin
  if (ASubscriber <> nil) and (FSubscribers.IndexOf(ASubscriber) = -1) then
    FSubscribers.Add(ASubscriber);
end;

procedure TdxOperationManager.UnregisterSubscriber(ASubscriber: IdxgdEventSubscriber);
begin
  FSubscribers.Remove(ASubscriber);
end;

procedure TdxOperationManager.ProcessEvent(AOperationType: TdxgdOperationType);
var
  I: Integer;
begin
  for I := 0 to FSubscribers.Count - 1 do
    IdxgdEventSubscriber(FSubscribers[I]).ProcessEvent(AOperationType);
end;

{ TdxOperation }

constructor TdxOperation.Create(AOperationType: TdxgdOperationType;
  AHandler: TdxOperationHandler; ACallOnlyWhenActive: Boolean);
begin
  inherited Create;
  FCallOnlyWhenActive := ACallOnlyWhenActive;
//  FEnabled := True;
  FHandler := AHandler;
  FOperationType := AOperationType;
  FBarItem := dxOperationManager.BarItems[FOperationType];
end;

function TdxOperation.GetBarItem: TdxBarItem;

begin
  Result := FBarItem;
  if Result = nil then
    raise Exception.Create('The Operation Type has not been created properly:"' + IntToStr(Integer(OperationType)) + '"');
end;

function TdxOperation.GetDown: Boolean;
begin
  Result := False;
  if BarItem is TdxBarButton then
    Result := TdxBarButton(BarItem).Down;
end;

function TdxOperation.GetEnabled: Boolean;
begin
  Result := BarItem.Enabled;
end;

function TdxOperation.GetText: string;
begin
  if BarItem is TdxBarWindowItem then
    Result := TdxBarWindowItemAccess(BarItem).Text
  else
    Result := BarItem.Caption;
end;

procedure TdxOperation.SetEnabled(Value: Boolean);
begin
  BarItem.Enabled := Value;
end;

procedure TdxOperation.SetDown(Value: Boolean);
begin
  if BarItem is TdxBarButton then
  begin
    TdxBarButton(BarItem).Down := Value;
    if Enabled then
      dxOperationManager.ProcessEvent(FOperationType);
  end;
end;

procedure TdxOperation.SetText(const Value: string);
begin
  if Text <> Value then
    if BarItem is TdxBarWindowItem then
      TdxBarWindowItemAccess(BarItem).Text := Value
    else
      BarItem.Caption := Value;
end;

procedure TdxOperation.Update(AShow: Boolean);
const
  Visibles: array[Boolean] of TdxBarItemVisible = (ivInCustomizing, ivAlways);
begin
  BarItem.Visible := Visibles[AShow];
end;

procedure TdxOperation.DoHandler;
begin
  if Assigned(FHandler) then FHandler(FOperationType);
end;

{ TdxOperations }

destructor TdxOperations.Destroy;
var
  I: TdxgdOperationType;
begin
  for I := Low(I) to High(I) do
    if Items[I] <> nil then Items[I].Free;
  inherited Destroy;    
end;

function TdxOperations.GetOperation(Index: TdxgdOperationType): TdxOperation;
begin
  Result := FOperationList[Index];
end;

procedure TdxOperations.AddOperation(AOperationType: TdxgdOperationType;
  AHandler: TdxOperationHandler; ACallOnlyWhenActive: Boolean = True);
begin
  FOperationList[AOperationType] :=
    TdxOperation.Create(AOperationType, AHandler, ACallOnlyWhenActive);
end;

procedure TdxOperations.AddOperationToPopupMenu(
  AOperationType: TdxgdOperationType; APopupMenu: TdxBarPopupMenu; ASeparator: Boolean);
var
  ItemLink: TdxBarItemLink;
begin
  if Assigned(APopupMenu) then
  begin
    ItemLink := APopupMenu.ItemLinks.Add;
    ItemLink.Item := Items[AOperationType].BarItem;
    ItemLink.BeginGroup := ASeparator;
  end;
end;
{
procedure TdxOperations.TextChanged(
  AOperationType: TdxgdOperationType; ASender: TNotifyEvent);
var
  Operation: TdxOperation;
begin
  Operation := GetOperation(AOperationType);
  if Operation <> nil then
    Operation.FOnChange := ASender;
end;
}
procedure TdxOperations.UpdateItems(AShow: Boolean);
var
  I: TdxgdOperationType;
  ABarManager: TdxBarManager;
  PrevLockUpdate: Boolean;
begin
  ABarManager := nil;
  PrevLockUpdate := False;
  try
    for I := Low(TdxgdOperationType) to High(TdxgdOperationType) do
      if Items[I] <> nil then
      begin
        if ABarManager = nil then
        begin
          ABarManager := Items[I].BarItem.BarManager;
          PrevLockUpdate := ABarManager.LockUpdate;
          ABarManager.LockUpdate := True;
        end;
        Items[I].Update(AShow);
      end;
  finally
    if ABarManager <> nil then
      ABarManager.LockUpdate := PrevLockUpdate;
  end;
end;

{ TdxBarInfo }

constructor TdxBarInfo.Create(ABarType: TdxgdBarType);
begin
  inherited Create;
  FBarType := ABarType;
  FBar := dxOperationManager.GetBarByBarType(FBarType);
end;

procedure TdxBarInfo.Update(AShow: Boolean);
begin
  Bar.Visible := AShow;
  Bar.Hidden := not AShow;
end;

{ TdxBarList }
destructor TdxBarList.Destroy;
var
  I: TdxgdBarType;
begin
  for I := Low(I) to High(I) do
    if Items[I] <> nil then Items[I].Free;
  inherited;
end;

function TdxBarList.GetItem(Value: TdxgdBarType): TdxBarInfo;
begin
  Result := FBarInfoList[Value];
end;

procedure TdxBarList.AddBar(ABarType: TdxgdBarType);
begin
  if FBarInfoList[ABarType] = nil then
    FBarInfoList[ABarType] := TdxBarInfo.Create(ABarType);
end;

function TdxBarList.GetBarInfoByBar(ABar: TdxBar): TdxBarInfo;
var
  I: TdxgdBarType;
begin
  for I := Low(TdxgdBarType) to High(TdxgdBarType) do
  begin
    Result := Items[I];
    if (Result <> nil) and (Result.Bar = ABar) then Exit;
  end;
  Result := nil;
end;

procedure TdxBarList.UpdateItems(AShow: Boolean);
var
  I: TdxgdBarType;
begin
  if AShow then
    for I := Low(TdxgdBarType) to High(TdxgdBarType) do
      if Items[I] <> nil then
        Items[I].Update(AShow)
      else
  else
    for I := High(TdxgdBarType) downto Low(TdxgdBarType) do
      if Items[I] <> nil then
        Items[I].Update(AShow);
end;

initialization

finalization
  TdxOperationManager.ReleaseInstance;

end.
