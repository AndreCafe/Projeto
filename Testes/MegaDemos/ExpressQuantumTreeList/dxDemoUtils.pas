unit dxDemoUtils;

{$I cxVer.inc}

interface

uses
  Windows, Classes, SysUtils, ShellAPI, dxCore, cxClasses, dxBar,
  cxLookAndFeels, cxLookAndFeelPainters, dxNavBar, dxNavBarConsts,
  dxSkinsForm, dxSkinsDefaultPainters, dxSkinsLookAndFeelPainter, dxSkinsStrs;

const
  sdxFirstSelectedSkinName = 'DevExpressStyle';

  dxStartURL = 'http://www.devexpress.com/';
  dxDownloadURL = 'Downloads';
  dxSupportURL = 'Support/Center';
  dxProductsURL = 'Products/VCL/';
  dxMyDXURL = 'ClientCenter';
  dxMegaDemoProductIndex: Integer = -1;
  
  // Products features relative paths
  dxBarsPath = 'ExBars/Features.xml';
  dxRibbonPath = 'ExBars/Ribbon.xml';
  dxDockingPath = 'ExBars/DockingLib.xml';
  dxDBTreeViewPath = 'ExDBTree/Features.xml';
  dxFlowChartPath = 'ExFlowChart';
  dxGridPath = 'ExQuantumGrid/index.xml';
  dxLayoutControlPath = 'ExLayoutControl/whatsnewv2.xml';
  dxLocalizerPath = 'Subscription/WhatsNewBuild40/index.xml#autolist1';
  dxMasterViewPath = 'ExMasterView';
  dxNavBarPath = 'ExNavBar/WhatsNewV2.xml';
  dxOrgChartPath = 'ExOrgChart';
  dxPivotGridPath = 'ExPivotGrid/Features.xml';
  dxPrintingSystemPath = 'ExPrintingSystem/whatsnewv4.xml';
  dxSchedulerPath = 'ExScheduler/WhatsNewV3.xml';
  dxSkinsPath = 'ExSkins';
  dxSpellCheckerPath = 'ExSpellChecker/whatsnewv2.xml';
  dxSpreadSheetPath = 'ExSpreadSheet';
  dxTreeListPath = 'ExQuantumTreeList';
  dxVerticalGridPath = 'ExVerticalGrid';

  // Products names
  dxBarsProductName = 'ExpressBars';
  dxRibbonProductName = 'ExpressRibbon';
  dxDockingProductName = 'ExpressDocking';
  dxDBTreeViewProductName = 'ExpressDBTreeView';
  dxFlowChartProductName = 'ExpressFlowChart';
  dxGridProductName = 'ExpressQuantumGrid';
  dxLayoutControlProductName = 'ExpressLayoutControl';
  dxLocalizerProductName = 'ExpressLocalizer';
  dxMasterViewProductName = 'ExpressMasterView';
  dxNavBarProductName = 'ExpressNavBar';
  dxOrgChartProductName = 'ExpressOrgChart';
  dxPivotGridProductName = 'ExpressPivotGrid';
  dxPrintingSystemProductName = 'ExpressPrintingSystem';
  dxSchedulerProductName = 'ExpressScheduler';
  dxSkinsProductName = 'ExpressSkinsLibrary';
  dxSpellCheckerProductName = 'ExpressSpellChecker';
  dxSpreadSheetProductName = 'ExpressSpreadSheet';
  dxTreeListProductName = 'ExpressQuantumTreeList';
  dxVerticalGridProductName = 'ExpressVertical';

  // Product indices
  dxBarsIndex =            0;
  dxRibbonIndex =          1;
  dxDockingIndex =         2;
  dxDBTreeViewIndex =      3;
  dxFlowChartIndex =       4;
  dxGridIndex =            5;
  dxLayoutControlIndex =   6;
  dxLocalizerIndex =       7;
  dxMasterViewIndex =      8;
  dxNavBarIndex =          9;
  dxOrgChartIndex =       10;
  dxPivotGridIndex =      11;
  dxPrintingSystemIndex = 12;
  dxSchedulerIndex =      13;
  dxSkinsIndex =          14;
  dxSpellCheckerIndex =   15;
  dxSpreadSheetIndex =    16;
  dxTreeListIndex =       17;
  dxVerticalGridIndex =   18;
  dxLastProductIndex = dxVerticalGridIndex;

  dxProductNames: array [0..dxLastProductIndex] of string = (
    dxBarsProductName, dxRibbonProductName, dxDockingProductName, dxDBTreeViewProductName,
    dxFlowChartProductName, dxGridProductName, dxLayoutControlProductName,
    dxLocalizerProductName, dxMasterViewProductName, dxNavBarProductName,
    dxOrgChartProductName, dxPivotGridProductName, dxPrintingSystemProductName,
    dxSchedulerProductName, dxSkinsProductName, dxSpellCheckerProductName,
    dxSpreadSheetProductName, dxTreeListProductName, dxVerticalGridProductName);

  dxProductRelativeURLs: array [0..dxLastProductIndex] of string = (
    dxBarsPath, dxRibbonPath, dxDockingPath, dxDBTreeViewPath, dxFlowChartPath,
    dxGridPath, dxLayoutControlPath, dxLocalizerPath, dxMasterViewPath, dxNavBarPath,
    dxOrgChartPath, dxPivotGridPath, dxPrintingSystemPath, dxSchedulerPath, dxSkinsPath,
    dxSpellCheckerPath, dxSpreadSheetPath, dxTreeListPath, dxVerticalGridPath);

const
  ThereIsNoMDACMessage =
    'Unable to execute this application. You do not have ' +
    'the most recent version of MDAC and Jet 4 installed. ' +
    'Please visit microsoft.com to obtain the most recent libraries.';

type
  dxSitePage = (spFeatures, spDownloads, spSupport, spStart, spProducts, spMyDX);

function HasJet: Boolean;

procedure Browse(ASitePage: dxSitePage);
procedure CreateHelpMenuItems(ABarManager: TdxBarManager; AHelpSubItem: TdxBarSubItem);
procedure CreateSkinsMenuItems(ABarManager: TdxBarManager;
  AViewSubItem: TdxBarSubItem; ASkinController: TdxSkinController; ANavBar: TdxNavBar = nil);
procedure SetNavBarStyle(ANavBar: TdxNavBar; ASkinController: TdxSkinController);

implementation

uses
  Registry, dxAboutDemo, dxSkinChooserGallery;

const
  dxSkinMenuCategory = 3;

type

  { TdxBarMenuItemClickController }

  TdxBarMenuItemClickController = class
  protected
    procedure MenuItemClickHandler(Sender: TObject); virtual; abstract;
  end;

  { TdxHelpMenuClickController }

  TdxHelpMenuClickController = class(TdxBarMenuItemClickController)
  protected
    procedure MenuItemClickHandler(Sender: TObject); override;
  end;

  { TdxSkinMenuController }

  TdxSkinMenuController = class(TdxBarMenuItemClickController)
  private
    FBarManager: TdxBarManager;
    FNavBar: TdxNavBar;
    FSkinChooser: TdxSkinChooserGalleryItem;
    FSkinController: TdxSkinController;
    FSkinsBarMenuItems: TList;
    procedure UpdateStyle;
  protected
    procedure MenuItemClickHandler(Sender: TObject); override;
    procedure SkinChooserClickHandler(Sender: TObject; const ASkinName: string);
    procedure SkinChooserPopulateEventHandler(Sender: TObject);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure BuildMenu(AViewSubItem: TdxBarSubItem);
  end;

var
  FSkinMenuController: TdxSkinMenuController;
  FHelpClickController: TdxHelpMenuClickController;
  dxMegaDemoFeaturesItemCaption: string = '&Features';

function HasJet: Boolean;

   function GetMajorVersion(const ASt: string): Integer;
   var
     ANumbers: string;
     I: Integer;
   begin
     Result := 0;
     if ASt <> '' then
     begin
       ANumbers := '';
       I := 1;
       while (I <= Length(ASt)) and dxCharInSet(ASt[I], ['0'..'9']) do
       begin
         ANumbers := ANumbers + ASt[I];
         Inc(I);
       end;
       if ANumbers <> '' then
         Result := StrToInt(ANumbers);
     end;
   end;

var
  ARegistry: TRegistry;
  AKeys: TStrings;
  I: Integer;
  AMajorVersion: Integer;
begin
  Result := False;
  ARegistry := TRegistry.Create;
  AKeys := TStringList.Create;
  try
    ARegistry.RootKey := HKEY_LOCAL_MACHINE;
    if ARegistry.OpenKeyReadOnly('\SOFTWARE\Microsoft\Jet') then
    begin
      ARegistry.GetKeyNames(AKeys);
      for I := 0 to AKeys.Count - 1 do
      begin
        AMajorVersion := GetMajorVersion(AKeys[I]);
        if (AMajorVersion >= 4) then
        begin
          Result := True;
          break;
        end;
      end;
    end;
  finally
    AKeys.Free;
    ARegistry.Free;
  end;
end;

procedure Browse(ASitePage: dxSitePage);
var
  AURL: string;
begin
  case ASitePage of
    spFeatures:
      AURL := dxStartURL + dxProductsURL + dxProductRelativeURLs[dxMegaDemoProductIndex];
    spDownloads:
      AURL := dxStartURL + dxDownloadURL;
    spSupport:
      AURL := dxStartURL + dxSupportURL;
    spStart:
      AURL := dxStartURL;
    spProducts:
      AURL := dxStartURL + dxProductsURL;
    spMyDX:
      AURL := dxStartURL + dxMyDXURL;
  end;
  ShellExecute(0, 'OPEN', PChar(AURL), nil, nil, SW_SHOW);
end;

procedure CreateHelpMenuItems(ABarManager: TdxBarManager; AHelpSubItem: TdxBarSubItem);

  function AddButton(ASubItem: TdxBarSubItem; ACaption: string; ATag: Integer;
    AHasSeparator: Boolean = False): TdxBarButton;
  begin
    Result := ABarManager.AddButton;
    with Result do
    begin
      Caption := Acaption;
      OnClick := FHelpClickController.MenuItemClickHandler;
      Tag := ATag;
    end;
    ASubItem.ItemLinks.Add(Result).BeginGroup := AHasSeparator;
  end;

begin
  FHelpClickController := TdxHelpMenuClickController.Create;
  AddButton(AHelpSubItem, dxProductNames[dxMegaDemoProductIndex] + ' ' + dxMegaDemoFeaturesItemCaption, 0);
  AddButton(AHelpSubItem, '&About', 6, True);
end;

procedure CreateSkinsMenuItems(ABarManager: TdxBarManager;
  AViewSubItem: TdxBarSubItem; ASkinController: TdxSkinController; ANavBar: TdxNavBar);
begin
  FSkinMenuController := TdxSkinMenuController.Create;
  FSkinMenuController.FSkinController := ASkinController;
  FSkinMenuController.FBarManager := ABarManager;
  FSkinMenuController.FNavBar := ANavBar;
  FSkinMenuController.BuildMenu(AViewSubItem);
end;

procedure SetNavBarStyle(ANavBar: TdxNavBar; ASkinController: TdxSkinController);
begin
  if ASkinController.NativeStyle then
    if IsWinVista then
      ANavBar.View := dxNavBarVistaExplorerBarView
    else
      ANavBar.View := dxNavBarXPExplorerBarView
  else
    if ASkinController.UseSkins then
      ANavBar.View := dxNavBarSkinExplorerBarView
    else
      case ASkinController.Kind of
        lfStandard, lfFlat:
          ANavBar.View := dxNavBarExplorerBarView;
        lfUltraFlat:
          ANavBar.View := dxNavBarUltraFlatExplorerView;
        lfOffice11:
          ANavBar.View := dxNavBarOffice11ExplorerBarView;
      end;
end;

procedure DestroyMenuItems;
begin
  FreeAndNil(FSkinMenuController);
  FreeAndNil(FHelpClickController);
end;

{ TdxHelpMenuClickController }

procedure TdxHelpMenuClickController.MenuItemClickHandler(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    0..5:
      Browse(dxSitePage(TComponent(Sender).Tag));
    6:
      dxShowAboutForm;
  end;
end;

{ TdxSkinMenuController }

constructor TdxSkinMenuController.Create;
begin
  inherited Create;
  FSkinsBarMenuItems := TList.Create;
end;

destructor TdxSkinMenuController.Destroy;
begin
  FreeAndNil(FSkinsBarMenuItems);
  inherited Destroy;
end;

procedure TdxSkinMenuController.BuildMenu(AViewSubItem: TdxBarSubItem);

  procedure AddButton(ASubItem: TdxBarSubItem; ACaption: string; ATag: Integer);
  var
    AItem: TdxBarButton;
  begin
    AItem := FBarManager.AddButton;
    AItem.Caption := ACaption;
    AItem.OnClick := MenuItemClickHandler;
    AItem.ButtonStyle := bsChecked;
    AItem.Category := dxSkinMenuCategory;
    AItem.Tag := ATag;
    ASubItem.ItemLinks.Add(AItem);
    FSkinsBarMenuItems.Add(AItem);
  end;

begin
  AddButton(AViewSubItem, 'Flat', 0);
  AddButton(AViewSubItem, 'Standard', 1);
  AddButton(AViewSubItem, 'UltraFlat', 2);
  AddButton(AViewSubItem, 'Office11', 3);
  AddButton(AViewSubItem, 'Native', 4);

  FSkinChooser := TdxSkinChooserGalleryItem(FBarManager.AddItem(TdxSkinChooserGalleryItem));
  FSkinChooser.Caption := 'Skins';
  AViewSubItem.ItemLinks.Add(FSkinChooser);
  FSkinChooser.GalleryOptions.ItemAllowDeselect := False;
  FSkinChooser.OnPopulate := SkinChooserPopulateEventHandler;
  FSkinChooser.OnSkinChanged := SkinChooserClickHandler;
  FSkinChooser.PopulateGallery;
  FSkinChooser.SelectedSkinName := sdxFirstSelectedSkinName;
  if FSkinChooser.GalleryGroups.Count = 0 then
    FSkinChooser.Visible := ivNever;
end;

procedure TdxSkinMenuController.MenuItemClickHandler(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    0..3:
      begin
        FSkinController.Kind := TcxLookAndFeelKind(TComponent(Sender).Tag);
        FSkinController.NativeStyle := False;
        FSkinController.SkinName := '';
        FSkinController.UseSkins := False;
      end;
    4:
      begin
        FSkinController.SkinName := '';
        FSkinController.UseSkins := False;
        FSkinController.NativeStyle := True;
      end;
  end;
  UpdateStyle;
end;

procedure TdxSkinMenuController.SkinChooserClickHandler(Sender: TObject; const ASkinName: string);
var
  AItem: TdxSkinChooserGalleryGroupItem;
begin
  AItem := (Sender as TdxSkinChooserGalleryItem).SelectedGroupItem;
  if AItem <> nil then
  begin
    dxSkinsUserSkinLoadFromResource(AItem.SkinResInstance, AItem.SkinResName, AItem.SkinName);
    FSkinController.SkinName := sdxSkinsUserSkinName;
    FSkinController.UseSkins := True;
    FSkinController.NativeStyle := False;
    UpdateStyle;
  end;
end;

procedure TdxSkinMenuController.SkinChooserPopulateEventHandler(Sender: TObject);
begin
  (Sender as TdxSkinChooserGalleryItem).AddSkinsFromResources(HInstance);
end;

procedure TdxSkinMenuController.UpdateStyle;

  function GetActiveStyleIndex: Integer;
  begin
    if FSkinController.NativeStyle then
      Result := 4
    else
      if (FSkinController.SkinName <> '') and FSkinController.UseSkins then
        Result := 5
      else
        Result := Ord(FSkinController.Kind);
  end;

var
  I, AActiveStyleIndex: Integer;
begin
  AActiveStyleIndex := GetActiveStyleIndex;
  if AActiveStyleIndex < 5 then
    FSkinChooser.SelectedGroupItem := nil;
  for I := 0 to FSkinsBarMenuItems.Count - 1 do
    TdxBarButton(FSkinsBarMenuItems[I]).Down := TdxBarButton(FSkinsBarMenuItems[I]).Tag = AActiveStyleIndex;
  if FNavBar <> nil then
    SetNavBarStyle(FNavBar, FSkinController);
end;

initialization
finalization
  DestroyMenuItems;
end.
