unit dxSkinEditorPreview;

interface

{$I cxVer.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, Dialogs, cxControls, ComCtrls, ExtCtrls, ShlObj, cxContainer, cxEdit,
  cxGroupBox, cxStyles, cxGraphics, cxCustomData, cxTL, cxTextEdit, DB, cxVGrid,
  cxInplaceContainer, cxSplitter,  cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxClasses, cxGridBandedTableView, cxGridDBBandedTableView,
  cxGridTableView, cxGrid, cxGridDBTableView, cxGridCustomTableView, cxPC,
  cxGridCardView, cxGridDBCardView, cxGridCustomView,  cxEditRepositoryItems,
  cxNavigator, cxTrackBar, cxProgressBar, cxSpinEdit, cxTimeEdit, cxMaskEdit,
  cxButtonEdit, cxCheckBox, cxCheckGroup, cxRadioGroup, cxCalc, cxDropDownEdit,
  cxMemo, cxCalendar, cxMRUEdit, cxBlobEdit, Menus, cxLookAndFeelPainters,
  cxButtons, dxBar, ImgList, cxBarEditItem, dxSkinsCore, dxLayoutControl,
  cxLookAndFeels, dxRibbonSkins, cxScheduler, cxSchedulerStorage, ShellApi,
  cxSchedulerCustomControls, cxSchedulerCustomResourceView, cxSchedulerDayView,
  cxSchedulerDateNavigator, cxSchedulerHolidays, cxSchedulerTimeGridView,
  cxSchedulerUtils, cxSchedulerWeekView, cxSchedulerYearView, cxSchedulerGanttView,
  cxShellCommon, cxGridCustomPopupMenu, cxGridPopupMenu, dxLayoutcxEditAdapters,
  dxLayoutLookAndFeels, dxBarApplicationMenu, dxRibbon, dxSkinsForm, dxDockControl,
  dxNavBarCollns, dxNavBarBase, dxNavBar, dxDockPanel, cxShellComboBox, cxDBEdit,
  cxCurrencyEdit, cxDBNavigator, cxImage, cxHyperLinkEdit, cxCustomPivotGrid,
  cxPivotGrid, cxGridLayoutView, cxGridDBLayoutView, cxGridCustomLayoutView,
  dxSkinscxPCPainter, dxLayoutContainer, dxRibbonBackstageView, dxRibbonForm,
  dxStatusBar, dxRibbonStatusBar, dxSkinsdxNavBarPainter, dxSkinsDefaultPainters,
  dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, dxSkinsdxDockControlPainter,
  dxBreadcrumbEdit, dxShellBreadcrumbEdit, dxAlertWindow, dxBevel, cxLabel,
  dxCore, dxGallery, dxGalleryControl, dxCustomTileControl, dxTileControl,
  cxDateUtils;

type
  TdxSkinEditorPreviewForm = class(TdxRibbonForm, IcxLookAndFeelNotificationListener)
    dxBarManager: TdxBarManager;
    tbStandard: TdxBar;
    tbMain: TdxBar;
    dxbFile: TdxBarSubItem;
    bFormat: TdxBarSubItem;
    dxbHelp: TdxBarSubItem;
    bNew: TdxBarButton;
    dxbSave: TdxBarButton;
    dxbExit: TdxBarButton;
    dxbtnAbout: TdxBarButton;
    bOpen: TdxBarButton;
    bSave: TdxBarButton;
    bCut: TdxBarButton;
    bCopy: TdxBarButton;
    bPaste: TdxBarButton;
    bUndo: TdxBarButton;
    tbFormat: TdxBar;
    bBold: TdxBarButton;
    bPrint: TdxBarButton;
    bItalic: TdxBarButton;
    bUnderline: TdxBarButton;
    bLeft: TdxBarButton;
    bCenter: TdxBarButton;
    bRight: TdxBarButton;
    dxBarButton1: TdxBarButton;
    bEdit: TdxBarSubItem;
    dxBarButton6: TdxBarButton;
    bReplace: TdxBarButton;
    bFind: TdxBarButton;
    bFont: TdxBarButton;
    cxImageList1: TcxImageList;
    dxDockingManager: TdxDockingManager;
    dxSkinController: TdxSkinController;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    dxRibbonTab1: TdxRibbonTab;
    dxRibbon: TdxRibbon;
    QAToolbar: TdxBar;
    ApplicationMenu: TdxBarApplicationMenu;
    dxRibbonTab2: TdxRibbonTab;
    tbStyleOptions: TdxBar;
    AppMenuImages: TcxImageList;
    AppBtnCheck: TdxBarLargeButton;
    QATBar: TdxBar;
    ShowQAT: TdxBarLargeButton;
    bbAboveRibbon: TdxBarButton;
    bbBelowRibbon: TdxBarButton;
    blBarsStyle: TdxBarLargeButton;
    SchedulerStorage: TcxSchedulerStorage;
    btnSmallRibbonStyle: TdxBarButton;
    dxLayoutLookAndFeelList: TdxLayoutLookAndFeelList;
    dxLayoutStandardLookAndFeel: TdxLayoutStandardLookAndFeel;
    dxLayoutOfficeLookAndFeel: TdxLayoutOfficeLookAndFeel;
    dxLayoutWebLookAndFeel: TdxLayoutWebLookAndFeel;
    pcGrids: TcxPageControl;
    tsGrid: TcxTabSheet;
    tsPivotGrid: TcxTabSheet;
    PreviewPivotGrid: TcxPivotGrid;
    pgfPurchaseQuarter: TcxPivotGridField;
    pgfPurchaseMonth: TcxPivotGridField;
    pgfPaymentType: TcxPivotGridField;
    pgfQuantity: TcxPivotGridField;
    pgfCarName: TcxPivotGridField;
    pgfUnitPrice: TcxPivotGridField;
    pgfCompanyName: TcxPivotGridField;
    pgfPaymentAmount: TcxPivotGridField;
    tsScheduler: TcxTabSheet;
    Scheduler: TcxScheduler;
    ControlBox: TPanel;
    rgGroupBy: TcxRadioGroup;
    rgViews: TcxRadioGroup;
    tsTreeList: TcxTabSheet;
    cxTreeList1: TcxTreeList;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    tsVerticalGrid: TcxTabSheet;
    cxVerticalGrid: TcxVerticalGrid;
    cxVerticalGridEditorRow1: TcxEditorRow;
    cxVerticalGridCategoryRow1: TcxCategoryRow;
    cxVerticalGridEditorRow2: TcxEditorRow;
    cxVerticalGridEditorRow5: TcxEditorRow;
    cxVerticalGridEditorRow3: TcxEditorRow;
    cxVerticalGridCategoryRow2: TcxCategoryRow;
    cxVerticalGridEditorRow9: TcxEditorRow;
    cxVerticalGridEditorRow7: TcxEditorRow;
    cxVerticalGridEditorRow6: TcxEditorRow;
    cxVerticalGridEditorRow4: TcxEditorRow;
    cxVerticalGridEditorRow8: TcxEditorRow;
    cxVerticalGridEditorRow10: TcxEditorRow;
    cxVerticalGridEditorRow11: TcxEditorRow;
    tsLayoutControl: TcxTabSheet;
    tsEditors: TcxTabSheet;
    cxCheckGroup1: TcxCheckGroup;
    cxRadioGroup1: TcxRadioGroup;
    cxPopupEdit: TcxPopupEdit;
    cxButtonEdit1: TcxButtonEdit;
    cxTimeEdit1: TcxTimeEdit;
    cxDateEdit: TcxDateEdit;
    pbVertical: TcxProgressBar;
    tbVertical: TcxTrackBar;
    pbHorizontal: TcxProgressBar;
    tbHorizontal: TcxTrackBar;
    cxCalcEdit: TcxCalcEdit;
    cxBlobEdit: TcxBlobEdit;
    cxMemo1: TcxMemo;
    cxSpinEdit1: TcxSpinEdit;
    cxDateTimeEdit: TcxDateEdit;
    cxMemo2: TcxMemo;
    cxComboBox1: TcxComboBox;
    rgControlsState: TcxRadioGroup;
    ShellComboBox: TcxShellComboBox;
    tsDocking: TcxTabSheet;
    dxDockSite: TdxDockSite;
    dxLayoutDockSite4: TdxLayoutDockSite;
    dxLayoutDockSite3: TdxLayoutDockSite;
    dxDockMainPanel: TdxDockPanel;
    dxDockPanelLeft: TdxDockPanel;
    dxDockPanelRight: TdxDockPanel;
    dxNavBar: TdxNavBar;
    dxNavBarGroup1: TdxNavBarGroup;
    dxNavBarGroup3: TdxNavBarGroup;
    dxNavBarGroup2: TdxNavBarGroup;
    dxNavBarItem1: TdxNavBarItem;
    dxNavBarItem2: TdxNavBarItem;
    dxNavBarItem3: TdxNavBarItem;
    dxNavBarItem4: TdxNavBarItem;
    dxNavBarItem5: TdxNavBarItem;
    dxNavBarItem6: TdxNavBarItem;
    dxNavBarItem7: TdxNavBarItem;
    dxNavBarItem8: TdxNavBarItem;
    dxNavBarItem9: TdxNavBarItem;
    dxLayoutDockSite1: TdxLayoutDockSite;
    lcMain: TdxLayoutControl;
    cxDBTextEdit12: TcxDBTextEdit;
    cxDBTextEdit11: TcxDBTextEdit;
    cxDBHyperLinkEdit2: TcxDBHyperLinkEdit;
    cxDBSpinEdit1: TcxDBSpinEdit;
    cxDBSpinEdit2: TcxDBSpinEdit;
    cxDBSpinEdit3: TcxDBSpinEdit;
    cxDBSpinEdit4: TcxDBSpinEdit;
    cxDBSpinEdit5: TcxDBSpinEdit;
    cxDBSpinEdit6: TcxDBSpinEdit;
    cxDBCheckBox2: TcxDBCheckBox;
    cxDBImage1: TcxDBImage;
    cxDBMemo1: TcxDBMemo;
    cxDBNavigator1: TcxDBNavigator;
    lcMainGroup_Root1: TdxLayoutGroup;
    lcMainGroup2: TdxLayoutGroup;
    lcMainGroup3: TdxLayoutGroup;
    lcMainItem21: TdxLayoutItem;
    lcMainItem22: TdxLayoutItem;
    lcMainItem23: TdxLayoutItem;
    lcMainGroup5: TdxLayoutGroup;
    lcMainGroup14: TdxLayoutGroup;
    lcMainItem25: TdxLayoutItem;
    lcMainItem26: TdxLayoutItem;
    lcMainItem27: TdxLayoutItem;
    lcMainItem31: TdxLayoutItem;
    lcMainItem30: TdxLayoutItem;
    lcMainGroup6: TdxLayoutGroup;
    lcMainItem32: TdxLayoutItem;
    lcMainItem33: TdxLayoutItem;
    lcMainItem34: TdxLayoutItem;
    lcMainItem28: TdxLayoutItem;
    lcMainItem29: TdxLayoutItem;
    lcMainGroup7: TdxLayoutGroup;
    lcMainGroup1: TdxLayoutGroup;
    lcMainGroup4: TdxLayoutGroup;
    lcMainGroup8: TdxLayoutGroup;
    cxImageList2: TcxImageList;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    lcMainItem1: TdxLayoutItem;
    lcMainSeparatorItem1: TdxLayoutSeparatorItem;
    lcMainSplitterItem1: TdxLayoutSplitterItem;
    cxGridPopupMenu1: TcxGridPopupMenu;
    Grid: TcxGrid;
    CardViewHorizontal: TcxGridDBCardView;
    CardViewHorizontalTrademark: TcxGridDBCardViewRow;
    CardViewHorizontalPicture: TcxGridDBCardViewRow;
    CardViewHorizontalModel: TcxGridDBCardViewRow;
    CardViewHorizontalRow3: TcxGridDBCardViewRow;
    CardViewHorizontalHP: TcxGridDBCardViewRow;
    CardViewHorizontalLiter: TcxGridDBCardViewRow;
    CardViewHorizontalCyl: TcxGridDBCardViewRow;
    CardViewHorizontalRow4: TcxGridDBCardViewRow;
    CardViewHorizontalTransmissSpeedCount: TcxGridDBCardViewRow;
    CardViewHorizontalTransmissAutomatic: TcxGridDBCardViewRow;
    CardViewHorizontalRow2: TcxGridDBCardViewRow;
    CardViewHorizontalMPG_City: TcxGridDBCardViewRow;
    CardViewHorizontalMPG_Highway: TcxGridDBCardViewRow;
    CardViewHorizontalCategory: TcxGridDBCardViewRow;
    CardViewHorizontalRow1: TcxGridDBCardViewRow;
    CardViewHorizontalDescription: TcxGridDBCardViewRow;
    CardViewHorizontalHyperlink: TcxGridDBCardViewRow;
    CardViewHorizontalPrice: TcxGridDBCardViewRow;
    CardViewVertical: TcxGridDBCardView;
    CardViewVerticalTrademark: TcxGridDBCardViewRow;
    CardViewVerticalModel: TcxGridDBCardViewRow;
    CardViewVerticalPicture: TcxGridDBCardViewRow;
    CardViewVerticalHyperlink: TcxGridDBCardViewRow;
    CardViewVerticalPrice: TcxGridDBCardViewRow;
    CardViewVerticalRow1: TcxGridDBCardViewRow;
    CardViewVerticalHP: TcxGridDBCardViewRow;
    CardViewVerticalLiter: TcxGridDBCardViewRow;
    CardViewVerticalCyl: TcxGridDBCardViewRow;
    CardViewVerticalRow2: TcxGridDBCardViewRow;
    CardViewVerticalTransmissSpeedCount: TcxGridDBCardViewRow;
    CardViewVerticalTransmissAutomatic: TcxGridDBCardViewRow;
    CardViewVerticalCategory: TcxGridDBCardViewRow;
    CardViewVerticalFuelEconomy: TcxGridDBCardViewRow;
    CardViewVerticalMPG_City: TcxGridDBCardViewRow;
    CardViewVerticalMPG_Highway: TcxGridDBCardViewRow;
    CardViewVerticalRow3: TcxGridDBCardViewRow;
    CardViewVerticalDescription: TcxGridDBCardViewRow;
    TableView: TcxGridDBTableView;
    TableViewID: TcxGridDBColumn;
    TableViewTrademark: TcxGridDBColumn;
    TableViewModel: TcxGridDBColumn;
    TableViewCategory: TcxGridDBColumn;
    TableViewPicture: TcxGridDBColumn;
    TableViewPrice: TcxGridDBColumn;
    BandedTableView: TcxGridDBBandedTableView;
    BandedTableViewTrademark: TcxGridDBBandedColumn;
    BandedTableViewModel: TcxGridDBBandedColumn;
    BandedTableViewLiter: TcxGridDBBandedColumn;
    BandedTableViewTransmissAutomatic: TcxGridDBBandedColumn;
    BandedTableViewCategory: TcxGridDBBandedColumn;
    BandedTableViewHyperlink: TcxGridDBBandedColumn;
    BandedTableViewPicture: TcxGridDBBandedColumn;
    BandedTableViewPrice: TcxGridDBBandedColumn;
    GridDBTableView1: TcxGridDBTableView;
    GridDBTableView1Trademark: TcxGridDBColumn;
    GridDBTableView1Model: TcxGridDBColumn;
    GridDBTableView1Category: TcxGridDBColumn;
    GridDBTableView1Picture: TcxGridDBColumn;
    GridDBTableView1Column1: TcxGridDBColumn;
    GridLevel3: TcxGridLevel;
    GridLevel4: TcxGridLevel;
    GridLevel1: TcxGridLevel;
    GridLevel2: TcxGridLevel;
    GridLevel5: TcxGridLevel;
    Panel1: TPanel;
    cxGroupBox1: TcxGroupBox;
    dxbStyle: TdxBar;
    btnOffice2010: TdxBarLargeButton;
    btnBackstageView: TdxBarLargeButton;
    BackstageView: TdxRibbonBackstageView;
    dxRibbonBackstageViewTabSheet1: TdxRibbonBackstageViewTabSheet;
    dxRibbonBackstageViewTabSheet2: TdxRibbonBackstageViewTabSheet;
    MainContainer: TPanel;
    bvlLeftSpacer: TBevel;
    bvlTopSpacer: TBevel;
    bvlBottomSpacer: TBevel;
    bvlRightSpacer: TBevel;
    Bevel1: TBevel;
    dxNavPane: TdxNavBar;
    dxNavBarGroup4: TdxNavBarGroup;
    dxNavBarGroup5: TdxNavBarGroup;
    dxNavBarGroup6: TdxNavBarGroup;
    dxNavBarItem10: TdxNavBarItem;
    dxNavBarItem11: TdxNavBarItem;
    dxNavBarItem12: TdxNavBarItem;
    dxNavBarItem13: TdxNavBarItem;
    dxNavBarItem14: TdxNavBarItem;
    dxNavBarItem15: TdxNavBarItem;
    dxNavBarItem16: TdxNavBarItem;
    dxNavBarItem17: TdxNavBarItem;
    dxNavBarItem18: TdxNavBarItem;
    btnAeroGlass: TdxBarLargeButton;
    GridLevel6: TcxGridLevel;
    GridDBLayoutView1Group_Root: TdxLayoutGroup;
    GridDBLayoutView1: TcxGridDBLayoutView;
    GridDBLayoutView1LayoutItem1: TcxGridLayoutItem;
    GridDBLayoutView1RecId: TcxGridDBLayoutViewItem;
    GridDBLayoutView1LayoutItem2: TcxGridLayoutItem;
    GridDBLayoutView1ID: TcxGridDBLayoutViewItem;
    GridDBLayoutView1LayoutItem3: TcxGridLayoutItem;
    GridDBLayoutView1Trademark: TcxGridDBLayoutViewItem;
    GridDBLayoutView1LayoutItem4: TcxGridLayoutItem;
    GridDBLayoutView1Model: TcxGridDBLayoutViewItem;
    GridDBLayoutView1LayoutItem5: TcxGridLayoutItem;
    GridDBLayoutView1HP: TcxGridDBLayoutViewItem;
    GridDBLayoutView1LayoutItem6: TcxGridLayoutItem;
    GridDBLayoutView1Liter: TcxGridDBLayoutViewItem;
    GridDBLayoutView1LayoutItem7: TcxGridLayoutItem;
    GridDBLayoutView1Cyl: TcxGridDBLayoutViewItem;
    GridDBLayoutView1LayoutItem8: TcxGridLayoutItem;
    GridDBLayoutView1TransmissSpeedCount: TcxGridDBLayoutViewItem;
    GridDBLayoutView1LayoutItem9: TcxGridLayoutItem;
    GridDBLayoutView1TransmissAutomatic: TcxGridDBLayoutViewItem;
    GridDBLayoutView1LayoutItem10: TcxGridLayoutItem;
    GridDBLayoutView1MPG_City: TcxGridDBLayoutViewItem;
    GridDBLayoutView1LayoutItem11: TcxGridLayoutItem;
    GridDBLayoutView1MPG_Highway: TcxGridDBLayoutViewItem;
    GridDBLayoutView1LayoutItem12: TcxGridLayoutItem;
    GridDBLayoutView1Category: TcxGridDBLayoutViewItem;
    GridDBLayoutView1LayoutItem13: TcxGridLayoutItem;
    GridDBLayoutView1Description: TcxGridDBLayoutViewItem;
    GridDBLayoutView1LayoutItem14: TcxGridLayoutItem;
    GridDBLayoutView1Hyperlink: TcxGridDBLayoutViewItem;
    GridDBLayoutView1LayoutItem15: TcxGridLayoutItem;
    GridDBLayoutView1Picture: TcxGridDBLayoutViewItem;
    GridDBLayoutView1LayoutItem16: TcxGridLayoutItem;
    GridDBLayoutView1Price: TcxGridDBLayoutViewItem;
    GridDBLayoutView1Group1: TdxLayoutGroup;
    GridDBLayoutView1Group2: TdxLayoutGroup;
    GridDBLayoutView1Group4: TdxLayoutGroup;
    dxShellBreadCrumbEdit1: TdxShellBreadcrumbEdit;
    cxButton2: TcxButton;
    cxImageList3: TcxImageList;
    dxAlertWindowManager1: TdxAlertWindowManager;
    imgResources: TcxImageList;
    dxBevel1: TdxBevel;
    cxLabel1: TcxLabel;
    cxDBNavigator2: TcxDBNavigator;
    ilAlertWindow: TcxImageList;
    dxBarSubItem1: TdxBarSubItem;
    dxbColorSchemeAccent: TdxBarListItem;
    dxGalleryControl1: TdxGalleryControl;
    dxGalleryControl1Group1: TdxGalleryControlGroup;
    dxGalleryControl1Group1Item1: TdxGalleryControlItem;
    dxGalleryControl1Group1Item2: TdxGalleryControlItem;
    dxGalleryControl1Group1Item3: TdxGalleryControlItem;
    dxGalleryControl1Group1Item4: TdxGalleryControlItem;
    dxGalleryControl1Group1Item5: TdxGalleryControlItem;
    dxGalleryControl1Group1Item6: TdxGalleryControlItem;
    dxGalleryControl1Group2: TdxGalleryControlGroup;
    dxGalleryControl1Group2Item1: TdxGalleryControlItem;
    dxGalleryControl1Group2Item2: TdxGalleryControlItem;
    dxGalleryControl1Group2Item3: TdxGalleryControlItem;
    tsTileControl: TcxTabSheet;
    dxTile: TdxTileControl;
    dxTiledxTileControlActionBarItem1: TdxTileControlActionBarItem;
    dxTiledxTileControlActionBarItem2: TdxTileControlActionBarItem;
    dxTiledxTileControlActionBarItem3: TdxTileControlActionBarItem;
    dxTiledxTileControlActionBarItem4: TdxTileControlActionBarItem;
    dxTiledxTileControlActionBarItem5: TdxTileControlActionBarItem;
    dxTiledxTileControlGroup1: TdxTileControlGroup;
    dxTiledxTileControlGroup2: TdxTileControlGroup;
    tlPhotos: TdxTileControlItem;
    tlUserManagement: TdxTileControlItem;
    tlSystemInformation: TdxTileControlItem;
    tlAgents: TdxTileControlItem;
    tlResearch: TdxTileControlItem;
    tlStatistics: TdxTileControlItem;
    tlZillow: TdxTileControlItem;
    tlLoanCalculator: TdxTileControlItem;
    tlMortgageRates: TdxTileControlItem;
    procedure tbVerticalPropertiesChange(Sender: TObject);
    procedure tbHorizontalPropertiesChange(Sender: TObject);
    procedure dxbExitClick(Sender: TObject);
    procedure dxSkinControllerSkinForm(Sender: TObject;
      AForm: TCustomForm; var ASkinName: String; var UseSkin: Boolean);
    procedure rgControlsStateClick(Sender: TObject);
    procedure AppBtnCheckClick(Sender: TObject);
    procedure bbAboveRibbonClick(Sender: TObject);
    procedure bbBarsStyleClick(Sender: TObject);
    procedure btnAeroGlassClick(Sender: TObject);
    procedure btnBackstageViewClick(Sender: TObject);
    procedure btnOffice2010Click(Sender: TObject);
    procedure btnSmallRibbonStyleClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure dxbColorSchemeAccentClick(Sender: TObject);
    procedure dxShellBreadCrumbEdit1ButtonClick(Sender: TObject; AButton: TdxBreadcrumbEditButton);
    procedure dxTiledxTileControlActionBarItem1Click(Sender: TdxTileControlActionBarItem);
    procedure FormCreate(Sender: TObject);
    procedure rgGroupByClick(Sender: TObject);
    procedure rgViewsPropertiesChange(Sender: TObject);
    procedure tlPhotosActivateDetail(Sender: TdxTileControlItem);
  private
    FLayoutSkinLookAndFeel: TdxLayoutSkinLookAndFeel;
    FOnSkinForm: TdxSkinFormEvent;
    function GetLookAndFeel: TcxLookAndFeel;
    function GetUseRibbonStyle: Boolean;
    procedure SetUseRibbonStyle(AValue: Boolean);
    // IcxLookAndFeelNotificationListener
    function GetObject: TObject;
    procedure MasterLookAndFeelChanged(Sender: TcxLookAndFeel; AChangedValues: TcxLookAndFeelValues);
    procedure MasterLookAndFeelDestroying(Sender: TcxLookAndFeel);
  protected
    procedure InitializePivotGridData;
    procedure InitializePreview(ALookAndFeel: TcxLookAndFeel);
    procedure InitializeScheduler;
    procedure InitializeTileControlItemAgents;
    procedure InitializeTileControlItemPhotos;
    procedure PopulateColorSchemeAccentList;
    procedure SetEditorsState(AEnabled, AReadOnly: Boolean);
    //
    property LookAndFeel: TcxLookAndFeel read GetLookAndFeel;
    property UseRibbonStyle: Boolean read GetUseRibbonStyle write SetUseRibbonStyle;
  public
    constructor Create(AOwner: TComponent); override;
    constructor CreateEx(AOwner: TComponent; ALookAndFeel: TcxLookAndFeel); virtual;
    destructor Destroy; override;
    procedure UpdateController;
    //
    property OnSkinForm: TdxSkinFormEvent read FOnSkinForm write FOnSkinForm;
  end;

var
  dxSkinEditorPreviewForm: TdxSkinEditorPreviewForm;

procedure GenerateRandomEvents(AScheduler: TcxScheduler;
  ACount: Integer; ARandomResource: Boolean = False);
implementation

uses
  dxSkinEditorDM, dxSkinEditorUtils, dxSkinInfo, cxDrawTextUtils;

{$R *.dfm}
{$R cxPivotGridData.res}

type
  TcxCustomEditAccess = class(TcxCustomEdit);

type

  { TdxSkinTileControlPreviewUnderConstruction }

  TdxSkinTileControlPreviewUnderConstruction = class(TcxControl)
  protected
    procedure Paint; override;
  published
    property Caption;
  end;

var
  SportEvents: array[0..12] of string =
   ('Basketball Qualifying - Men',
    'Lamon Brewster (32-2) vs. Luan Krasniqi (28-1-1) (WBO heavyweight belt)',
    'Vince Philips (47-9-1) vs. Reynaldo Pelonia (35-21-3)',
    'Kili Madrid (6-0-1) vs. Donny Fosmire (10-7)',
    'Nelson Zepeda (1-0-1) vs. Kaleo Padilla (0-0)',
    'Justin Mercado (1-1) vs. Waldo Rojas (0-0)',
    'Australian Open',
    'Weightlifting 48 Kg - Women  - Final',
    'Sabre - Men - 1st Round',
    'Epee - Women - 1st Round',
    'Soccer 1st Round - *Women''s Preliminaries - Women',
    'Greco-Roman 96kg - Men - Qualifying',
    'Men''s Bronze Medal Match - RUS - USA');

  MaxRandomPeriod: Integer = 60;

function GetRandomDate(AScheduler: TcxScheduler): TDateTime;
begin
  Result := Date + Random(MaxRandomPeriod)*(Random(2) * 2 - 1) + AScheduler.OptionsView.WorkStart;
  if Trunc(Result) = Date then
    Result := Result + Random(10) * HourToTime
  else
    Result := Result + Random(24) * HourToTime;
end;

function GetRandomResourceID(AScheduler: TcxScheduler): Variant;
begin
  Result := Null;
  if (AScheduler.Storage = nil) or (AScheduler.Storage.ResourceCount = 0) then
    Exit
  else
    if AScheduler.Storage.ResourceCount = 1 then
      Result := AScheduler.Storage.ResourceIDs[0]
    else
      Result := AScheduler.Storage.ResourceIDs[Random(AScheduler.Storage.ResourceCount)];
end;

function GetRandomState: Integer;
begin
  Result := Random(4);
end;

procedure CreateEventObject(AScheduler: TcxScheduler; AAllDayEvent, ARandomResource: Boolean;
  AEventDuration: TDateTime);
var
  ADate: TDateTime;
  AEvent: TcxSchedulerEvent;
begin
  AEvent := AScheduler.Storage.CreateEvent;
  ADate := GetRandomDate(AScheduler);
  AEvent.Start := ADate;
  AEvent.AllDayEvent := AAllDayEvent;
  AEvent.Finish := ADate + AEventDuration;
  AEvent.State := GetRandomState;
  AEvent.LabelColor := EventLabelColors[Random(11)];
  AEvent.Caption := SportEvents[Random(High(SportEvents) + 1)];
  if ARandomResource then
    AEvent.ResourceID := GetRandomResourceID(AScheduler);
end;

procedure GenerateRandomEvents(AScheduler: TcxScheduler; ACount: Integer;
  ARandomResource: Boolean = False);
var
  I: Integer;
begin
  if AScheduler.Storage = nil then Exit;
  AScheduler.Storage.BeginUpdate;
  try
    Randomize;
    for I := 0 to ACount div 5 * 3 - 1 do
      CreateEventObject(AScheduler, False, ARandomResource, (Random(180) + 30) * MinuteToTime);
    for I := 0 to ACount div 5 - 1 do
      CreateEventObject(AScheduler, True, ARandomResource, 1);
    for I := 0 to ACount div 5 - 1 do
      CreateEventObject(AScheduler, False, ARandomResource, 1 + (Random(180) + 30) * MinuteToTime);
  finally
    AScheduler.Storage.EndUpdate;
  end;
end;

{ TdxSkinTileControlPreviewUnderConstruction }

procedure TdxSkinTileControlPreviewUnderConstruction.Paint;
var
  ASkinInfo: TdxSkinInfo;
  ATextRect: TRect;
begin
  if LookAndFeelPainter.GetPainterData(ASkinInfo) then
  begin
    ASkinInfo.TileControlBackground.Draw(Canvas.Handle, ClientRect);
    Canvas.Font.Color := ASkinInfo.TileControlBackground.TextColor;

    Canvas.Font.Size := 24;
    ATextRect := ClientBounds;
    cxTextOut(Canvas.Handle, Caption, ATextRect, CXTO_CENTER_HORIZONTALLY or CXTO_CENTER_VERTICALLY);
  end;
end;

{ TdxSkinEditorPreviewForm }

constructor TdxSkinEditorPreviewForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLayoutSkinLookAndFeel := TdxLayoutSkinLookAndFeel.Create(Self);
  lcMain.LookAndFeel := FLayoutSkinLookAndFeel;
  InitializePivotGridData;
  LookAndFeel.AddChangeListener(Self);
  Grid.DoubleBuffered := True;
  PreviewPivotGrid.DoubleBuffered := True;
  InitializeScheduler;
  DisableAero := True;
end;

constructor TdxSkinEditorPreviewForm.CreateEx(
  AOwner: TComponent; ALookAndFeel: TcxLookAndFeel);
begin
  Create(AOwner);
  InitializePreview(ALookAndFeel);
  UpdateController;
end;

destructor TdxSkinEditorPreviewForm.Destroy;
begin
  LookAndFeel.RemoveChangeListener(Self);
  FreeAndNil(FLayoutSkinLookAndFeel);
  inherited Destroy;
end;

procedure TdxSkinEditorPreviewForm.cxButton2Click(Sender: TObject);
var
  AAlertWindow: TdxAlertWindow;
begin
  AAlertWindow := dxAlertWindowManager1.Show('Caption', 'Message Text', 0);
  AAlertWindow.MessageList.Add('Caption 2', 'Message Text 2', 1);
end;

function TdxSkinEditorPreviewForm.GetLookAndFeel: TcxLookAndFeel;
begin
  Result := FLayoutSkinLookAndFeel.LookAndFeel;
end;

function TdxSkinEditorPreviewForm.GetUseRibbonStyle: Boolean;
begin
  Result := dxRibbon.BarManager <> nil;
end;

procedure TdxSkinEditorPreviewForm.SetUseRibbonStyle(AValue: Boolean);

  procedure BeginUpdate;
  begin
    SendMessage(Handle, WM_SETREDRAW, 0, 0);
    dxBarManager.BeginUpdate;
    dxRibbon.BeginUpdate;
  end;

  procedure EndUpdate;
  begin
    dxRibbon.EndUpdate;
    dxBarManager.EndUpdate;
    SendMessage(Handle, WM_SETREDRAW, 1, 0);
    RedrawWindow(Handle, nil, 0, RDW_ERASE or RDW_INVALIDATE or RDW_FRAME or RDW_ALLCHILDREN);
  end;

  procedure UpdateQuickAccessBarState(ARibbonStyle: Boolean);
  var
    APrevVisible: Boolean;
  begin
    if ARibbonStyle then
    begin
      APrevVisible := dxRibbon.QuickAccessToolbar.Visible;
      try
        dxRibbon.QuickAccessToolbar.Visible := True; // Problem with recalculating of QuickAccessToolBar if it invisible
        dxRibbon.QuickAccessToolbar.Toolbar := QAToolbar;
      finally
        dxRibbon.QuickAccessToolbar.Visible := APrevVisible;
      end;
    end
    else
      dxRibbon.QuickAccessToolbar.Toolbar := nil;
  end;

  procedure UpdateBarsState(ARibbonStyle: Boolean);
  const
    BarItemVisibility: array[Boolean] of TdxBarItemVisible = (ivNever, ivAlways);
  begin
    QATBar.Visible := ARibbonStyle;
    QAToolbar.Visible := ARibbonStyle;
    tbStyleOptions.Visible := ARibbonStyle;
    dxbStyle.Visible :=  not ARibbonStyle;
    tbMain.Visible := not ARibbonStyle;
    dxBarSubItem1.Visible := BarItemVisibility[ARibbonStyle];
    AppBtnCheck.Visible := BarItemVisibility[ARibbonStyle];
    blBarsStyle.Visible := BarItemVisibility[ARibbonStyle];
    btnSmallRibbonStyle.Down := ARibbonStyle;
    blBarsStyle.Down := ARibbonStyle;
  end;

  procedure UpdateBarsPositions;
  begin
    tbMain.Row := 0;
    dxbStyle.Row := 1;
    tbStandard.Row := 1;
    tbFormat.Row := 1;
  end;

begin
  if UseRibbonStyle <> AValue then
  begin
    BeginUpdate;
    try
      if AValue then
      begin
        UpdateBarsState(AValue);
        dxRibbon.BarManager := dxBarManager;
        dxRibbon.Visible := AValue;
        dxRibbon.SupportNonClientDrawing := AValue;
      end
      else
      begin
        dxRibbon.Visible := AValue;
        dxRibbon.SupportNonClientDrawing := AValue;
        dxRibbon.BarManager := nil;
        UpdateBarsState(AValue);
      end;
      UpdateQuickAccessBarState(AValue);
      UpdateBarsPositions;
      UpdateController;
    finally
      EndUpdate;
    end;
  end;
end;

function TdxSkinEditorPreviewForm.GetObject: TObject;
begin
  Result := LookAndFeel;
end;

procedure TdxSkinEditorPreviewForm.MasterLookAndFeelChanged(
  Sender: TcxLookAndFeel; AChangedValues: TcxLookAndFeelValues);

  function GetSelectedSkinName: string;
  begin
    if LookAndFeel <> nil then
      Result := LookAndFeel.SkinName
    else
      Result := dxSkinController.SkinName;
  end;

  procedure CheckNavBars;
  const
    NavBarViewStyle: array[TcxLookAndFeelKind] of Integer = (1, 0, 1, 13);
    NavPaneViewStyle: array[TcxLookAndFeelKind] of Integer = (8, 8, 9, 12);
  begin
    if dxSkinController.UseSkins then
    begin
      dxNavPane.View := 14;
      with dxNavPane.ViewStyle as TdxNavBarSkinExplorerBarPainter do
      begin
        LookAndFeel.NativeStyle := False;
        SkinName := GetSelectedSkinName;
      end;
      dxNavBar.View := 15;
      with dxNavBar.ViewStyle as TdxNavBarSkinNavPanePainter do
      begin
        LookAndFeel.NativeStyle := False;
        SkinName := GetSelectedSkinName;
      end;
    end
    else
      if dxSkinController.NativeStyle then
      begin
        dxNavPane.View := 11;
        dxNavBar.View := 7;
      end
      else
      begin
        dxNavPane.View := NavPaneViewStyle[dxSkinController.Kind];
        dxNavBar.View := NavBarViewStyle[dxSkinController.Kind];
      end;
  end;

  procedure CheckLayoutControl;
  begin
    if dxSkinController.UseSkins then
      lcMain.LookAndFeel := FLayoutSkinLookAndFeel
    else
      if dxSkinController.NativeStyle then
        lcMain.LookAndFeel := dxLayoutWebLookAndFeel
      else
        if dxSkinController.Kind = lfOffice11 then
          lcMain.LookAndFeel := dxLayoutOfficeLookAndFeel
        else
          lcMain.LookAndFeel := dxLayoutStandardLookAndFeel;
  end;

  procedure CheckRibbon;
  begin
    if (dxSkinController.SkinName = '') or not dxSkinController.UseSkins then
      dxRibbon.ColorSchemeName := 'Blue'
    else
      dxRibbon.ColorSchemeName := GetSelectedSkinName;

    MainContainer.Color := dxRibbon.ColorScheme.GetPartColor(rfspRibbonForm);
    dxRibbon.InvalidateWithChildren;
  end;

begin
  CheckNavBars;
  CheckLayoutControl;
  CheckRibbon;
end;

procedure TdxSkinEditorPreviewForm.MasterLookAndFeelDestroying(Sender: TcxLookAndFeel);
begin
end;

procedure TdxSkinEditorPreviewForm.PopulateColorSchemeAccentList;
var
  AAccentIndex: TdxRibbonColorSchemeAccent;
begin
  dxbColorSchemeAccent.Items.BeginUpdate;
  try
    dxbColorSchemeAccent.Items.Clear;
    for AAccentIndex := Low(TdxRibbonColorSchemeAccent) to High(TdxRibbonColorSchemeAccent) do
      dxbColorSchemeAccent.Items.Add(dxRibbonColorSchemeAccentNames[AAccentIndex])
  finally
    dxbColorSchemeAccent.Items.EndUpdate;
    dxbColorSchemeAccent.ItemIndex := Ord(dxRibbon.ColorSchemeAccent);
  end;
end;

procedure TdxSkinEditorPreviewForm.UpdateController;
begin
  dxSkinController.Refresh;
end;

procedure TdxSkinEditorPreviewForm.InitializePivotGridData;
var
  AStream: TStream;
begin
  AStream := TResourceStream.Create(hInstance, 'PIVOTPREVIEWDATA', 'PIVOTDATA');
  try
    AStream.Position := 0;
    PreviewPivotGrid.DataController.LoadFromStream(AStream);
    PreviewPivotGrid.FullRefresh;
  finally
    AStream.Free;
  end;
end;

procedure TdxSkinEditorPreviewForm.InitializePreview(ALookAndFeel: TcxLookAndFeel);
begin
  dxAlertWindowManager1.LookAndFeel.MasterLookAndFeel := ALookAndFeel;
  FLayoutSkinLookAndFeel.LookAndFeel.MasterLookAndFeel := ALookAndFeel;
  dxDockingManager.LookAndFeel.MasterLookAndFeel := ALookAndFeel;
  SkinEditorSetControlLookAndFeel(Self, ALookAndFeel);
  dxBarManager.LookAndFeel.MasterLookAndFeel := ALookAndFeel;
  with TdxNavBarSkinExplorerBarPainter(dxNavBar.ViewStyle) do
    LookAndFeel.MasterLookAndFeel := ALookAndFeel;
  with TdxNavBarSkinNavPanePainter(dxNavPane.ViewStyle) do
    LookAndFeel.MasterLookAndFeel := ALookAndFeel;
  dxRibbon.ColorSchemeName := ALookAndFeel.SkinName;
  InitializeScheduler;
  PopulateColorSchemeAccentList;
end;

procedure TdxSkinEditorPreviewForm.InitializeScheduler;
begin
  GenerateRandomEvents(Scheduler, 50, True);
  Scheduler.SelectDays([Date - 1, Date, Date + 1], True);
end;

procedure TdxSkinEditorPreviewForm.tbVerticalPropertiesChange(Sender: TObject);
begin
  pbVertical.Position := 20 - tbVertical.Position;
end;

procedure TdxSkinEditorPreviewForm.tlPhotosActivateDetail(
  Sender: TdxTileControlItem);

  function GetDetailControlCaption(AItem: TdxTileControlItem): string;
  begin
    Result := Sender.DetailOptions.Caption;
    if Result = '' then
      Result := Sender.Text1.Value;
  end;

var
  AControl: TdxSkinTileControlPreviewUnderConstruction;
begin
  if Sender.DetailOptions.DetailControl = nil then
  begin
    AControl := TdxSkinTileControlPreviewUnderConstruction.Create(Self);
    AControl.LookAndFeel.MasterLookAndFeel := dxTile.LookAndFeel;
    AControl.Name := Sender.Name + 'DetailControl';
    AControl.Caption := GetDetailControlCaption(Sender);
    Sender.DetailOptions.DetailControl := AControl;
  end;
end;

procedure TdxSkinEditorPreviewForm.tbHorizontalPropertiesChange(Sender: TObject);
begin
  pbHorizontal.Position := tbHorizontal.Position;
  dxShellBreadCrumbEdit1.Properties.ProgressBar.Position := tbHorizontal.Position;
end;

procedure TdxSkinEditorPreviewForm.dxbColorSchemeAccentClick(Sender: TObject);
begin
  dxRibbon.ColorSchemeAccent := TdxRibbonColorSchemeAccent(dxbColorSchemeAccent.ItemIndex);
end;

procedure TdxSkinEditorPreviewForm.dxbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TdxSkinEditorPreviewForm.dxShellBreadCrumbEdit1ButtonClick(
  Sender: TObject; AButton: TdxBreadcrumbEditButton);
begin
  ShowMessage('Clicked!');
end;

procedure TdxSkinEditorPreviewForm.dxSkinControllerSkinForm(Sender: TObject;
  AForm: TCustomForm; var ASkinName: String; var UseSkin: Boolean);
begin
  if not ((ASkinName <> '') and UseSkin or (FLayoutSkinLookAndFeel = nil)) then
  begin
    if Assigned(OnSkinForm) then
      OnSkinForm(Sender, AForm, ASkinName, UseSkin);
  end;
end;

procedure TdxSkinEditorPreviewForm.dxTiledxTileControlActionBarItem1Click(
  Sender: TdxTileControlActionBarItem);
begin
  ShowMessage(Sender.Caption + ' clicked!');
end;

procedure TdxSkinEditorPreviewForm.FormCreate(Sender: TObject);
begin
  InitializeTileControlItemAgents;
  InitializeTileControlItemPhotos;
end;

procedure TdxSkinEditorPreviewForm.InitializeTileControlItemAgents;
var
  AFrame: TdxTileControlItemFrame;
  dsAgents: TDataSet;
begin
  dsAgents := dmSkinEditor.mdTileAgents;
  dsAgents.First;
  while not dsAgents.EOF do
  begin
    AFrame := tlAgents.Frames.Add;
    AFrame.Glyph.Image.LoadFromFieldValue(dsAgents.FieldByName('Photo').Value);
    AFrame.Glyph.Align := oaMiddleRight;
    AFrame.Glyph.IndentHorz := 0;
    AFrame.Glyph.IndentVert := 0;
    AFrame.Style.Font.Size := 13;
    AFrame.Text1.Value := dsAgents.FieldByName('Name').AsString;
    AFrame.Text1.IndentHorz := 10;
    AFrame.Text1.IndentVert := 10;
    AFrame.Text2.Value := dsAgents.FieldByName('Phone').AsString;
    AFrame.Text2.Align := oaTopLeft;
    AFrame.Text2.IndentHorz := 10;
    AFrame.Text2.IndentVert := 30;
    dsAgents.Next;
  end;
end;

procedure TdxSkinEditorPreviewForm.InitializeTileControlItemPhotos;
var
  AFrame: TdxTileControlItemFrame;
  dsHomes: TDataSet;
begin
  dsHomes := dmSkinEditor.mdTileHouses;
  dsHomes.First;
  while not dsHomes.EOF do
  begin
    AFrame := tlPhotos.Frames.Add;
    AFrame.Glyph.Mode := ifmStretch;
    AFrame.Glyph.Image.LoadFromFieldValue(dsHomes.FieldByName('Photo').Value);

    AFrame.Style.Font.Size := 13;
    AFrame.Text2.Value := ' ' + dsHomes.FieldByName('Beds').AsString + ' Beds' + #10 + ' ' + dsHomes.FieldByName('Baths').AsString + ' Baths ';
    AFrame.Text2.IndentHorz := 0;
    AFrame.Text2.IndentVert := 0;
    AFrame.Text2.Transparent := False;
    AFrame.Text3.Value := ' ' + FloatToStrF(dsHomes.FieldByName('Price').AsFloat, ffNumber, 10, 0)+ '$' + ' ';
    AFrame.Text3.IndentHorz := 0;
    AFrame.Text3.IndentVert := 0;
    AFrame.Text3.Transparent := False;

    dsHomes.Next;
  end;
end;

procedure TdxSkinEditorPreviewForm.rgControlsStateClick(Sender: TObject);
begin
  SetEditorsState(rgControlsState.ItemIndex <> 1, rgControlsState.ItemIndex = 2);
  if rgControlsState.ItemIndex <> 0 then
    cxDBNavigator2.DataSource := nil
  else
    cxDBNavigator2.DataSource := dmSkinEditor.dsCars;
end;

procedure TdxSkinEditorPreviewForm.SetEditorsState(AEnabled, AReadOnly: Boolean);
var
  AControl: TControl;
  I: Integer;
begin
  for I := 0 to tsEditors.ControlCount - 1 do
  begin
    AControl := tsEditors.Controls[I];
    if AControl <> rgControlsState then
    begin
      AControl.Enabled := AEnabled;
      if AControl is TcxCustomEdit then
        TcxCustomEditAccess(AControl).Properties.ReadOnly := AReadOnly;
      if AControl is TdxShellBreadcrumbEdit then
        TdxShellBreadcrumbEdit(AControl).Properties.PathEditor.ReadOnly := AReadOnly;
    end;
  end;
end;

procedure TdxSkinEditorPreviewForm.AppBtnCheckClick(Sender: TObject);
begin
  dxRibbon.ApplicationButton.Visible := AppBtnCheck.Down;
  btnBackstageView.Enabled := AppBtnCheck.Down;
end;

procedure TdxSkinEditorPreviewForm.bbAboveRibbonClick(Sender: TObject);
const
  QATPositionMap: array[Boolean] of TdxQuickAccessToolbarPosition =
    (qtpBelowRibbon, qtpAboveRibbon);
begin
  dxRibbon.QuickAccessToolbar.Visible := ShowQAT.Down;
  dxRibbon.QuickAccessToolbar.Position := QATPositionMap[bbAboveRibbon.Down];
  bbAboveRibbon.Enabled := ShowQAT.Down;
  bbBelowRibbon.Enabled := ShowQAT.Down
end;

procedure TdxSkinEditorPreviewForm.bbBarsStyleClick(Sender: TObject);
begin
  UseRibbonStyle := blBarsStyle.Down;
end;

procedure TdxSkinEditorPreviewForm.rgGroupByClick(Sender: TObject);
begin
  case rgGroupBy.ItemIndex of
    0:
      Scheduler.OptionsView.GroupingKind := gkNone;
    1:
      Scheduler.OptionsView.GroupingKind := gkByResource;
    2:
      Scheduler.OptionsView.GroupingKind := gkByDate;
  end;
end;

procedure TdxSkinEditorPreviewForm.rgViewsPropertiesChange(
  Sender: TObject);
begin
  case rgViews.ItemIndex of
    0: Scheduler.ViewDay.Active := True;
    1: Scheduler.ViewWeek.Active := True;
    2: Scheduler.ViewWeeks.Active := True;
    3: Scheduler.ViewTimeGrid.Active := True;
    4: Scheduler.ViewYear.Active := True;
    5: Scheduler.ViewGantt.Active := True;
  end;
end;

procedure TdxSkinEditorPreviewForm.btnBackstageViewClick(Sender: TObject);
begin
  if btnBackstageView.Down then
    dxRibbon.ApplicationButton.Menu := BackstageView
  else
    dxRibbon.ApplicationButton.Menu := ApplicationMenu;
end;

procedure TdxSkinEditorPreviewForm.btnAeroGlassClick(Sender: TObject);
begin
  DisableAero := not btnAeroGlass.Down;
end;

procedure TdxSkinEditorPreviewForm.btnOffice2010Click(Sender: TObject);
const
  StyleMap: array[Boolean] of TdxRibbonStyle = (rs2007, rs2010);
begin
  dxRibbon.Style := StyleMap[btnOffice2010.Down];
  dxBarSubItem1.Enabled :=  btnOffice2010.Down;
end;

procedure TdxSkinEditorPreviewForm.btnSmallRibbonStyleClick(Sender: TObject);
begin
  UseRibbonStyle := btnSmallRibbonStyle.Down;
end;

end.
