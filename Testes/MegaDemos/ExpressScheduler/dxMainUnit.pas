
unit dxMainUnit;

interface

uses
{$I dxSkins.inc}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxSplitter, ExtCtrls, dxBar, dxNavBarBase, dxNavBarCollns,
  dxNavBar, dxNavBarViewsFact, cxStyles, cxGraphics, ActnList, ImgList,
  dxBarExtItems, cxLookAndFeels, StdCtrls, cxContainer, cxSchedulerStorage,
  cxSchedulerCustomControls, cxSchedulerDateNavigator, cxDateNavigator, cxScheduler,
  cxSchedulerDayView, cxSchedulerWeekView, cxSchedulerTimeGridView, cxSchedulerYearView,
  cxPC, Menus, cxEdit, cxSchedulerCustomResourceView, cxSchedulerUtils,
  cxSchedulerDBStorage, dxOffice11, cxCustomData, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ADODB, cxLookAndFeelPainters, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLabel, cxCheckBox, cxButtons, cxExportSchedulerLink,
  cxSchedulerOutlookExchange, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSCore, dxPScxCommon, dxPScxSchedulerLnk, cxSchedulerDialogs, cxDateUtils,
  cxExtEditRepositoryItems, cxEditRepositoryItems, cxSchedulerEventEditor,
  cxSchedulerHolidays, cxSchedulerGanttView, cxSchedulerAggregateStorage, DateUtils, 
  cxGroupBox, cxCheckGroup, Math, cxColorComboBox, cxSchedulercxGridConnection,
  dxSkinsCore, dxSkinsdxNavBarPainter, dxBarSkinnedCustForm,
  dxSkinscxSchedulerPainter, dxSkinsdxBarPainter, dxSkinsForm,
  dxSkinscxPCPainter, dxSkinsdxRibbonPainter, dxSkinsLookAndFeelPainter,
  dxSkinsStrs, dxSkinInfo, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPScxPageControlProducer, cxPCdxBarPopupMenu,
  cxNavigator, cxSchedulerTreeListBrowser;

type
  TfrmMain = class(TForm)
    dxBarManager: TdxBarManager;
    pnlNavBar: TPanel;
    cxSplitterWorkAreaSplitter: TcxSplitter;
    dxNavBar: TdxNavBar;
    nbgLayoutFeatures: TdxNavBarGroup;
    nbgOtherFeatures: TdxNavBarGroup;
    nbiDay: TdxNavBarItem;
    nbiWorkWeek: TdxNavBarItem;
    nbiWeek: TdxNavBarItem;
    nbiMonth: TdxNavBarItem;
    nbiTimeGrid: TdxNavBarItem;
    nbiYear: TdxNavBarItem;
    dxbtnFile: TdxBarSubItem;
    nbiReminders: TdxNavBarItem;
    nbiCustomDraw: TdxNavBarItem;
    nbgStandaloneDateNavigator: TdxNavBarGroup;
    nbgStandaloneDateNavigatorControl: TdxNavBarGroupControl;
    cxDateNavigator1: TcxDateNavigator;
    nbgDataBinding: TdxNavBarGroup;
    dxbtnExit: TdxBarButton;
    dxbtnPrintPreview: TdxBarButton;
    dxbtnPrint: TdxBarButton;
    dxbtnStyle: TdxBarSubItem;
    dxbtnInspector: TdxBarButton;
    dxbtnStandard: TdxBarButton;
    dxbtnFlat: TdxBarButton;
    dxbtnOffice11: TdxBarButton;
    dxbtnUltraFlat: TdxBarButton;
    dxbtnNative: TdxBarButton;
    dxbtnHelp: TdxBarSubItem;
    dxbtnProducts: TdxBarButton;
    dxbtnDevExOnTheWeb: TdxBarButton;
    dxbtnDownloads: TdxBarButton;
    dxbtnForum: TdxBarButton;
    dxbtnView: TdxBarSubItem;
    mbiBound: TdxNavBarItem;
    nbiDifferentTimeZones: TdxNavBarItem;
    nbiUnbound: TdxNavBarItem;
    nbiStyles: TdxNavBarItem;
    lstSchedulerActions: TActionList;
    acDayView: TAction;
    acWorkWeekView: TAction;
    acWeekView: TAction;
    acMonthView: TAction;
    acYearView: TAction;
    acTimeGridView: TAction;
    acBound: TAction;
    acUnbound: TAction;
    acCustomDraw: TAction;
    acVisualStyles: TAction;
    acCustomDialogs: TAction;
    dxbtnDayView: TdxBarButton;
    dxbtnWeekView: TdxBarButton;
    dxbtnWorkWeek: TdxBarButton;
    dxbtnMonthView: TdxBarButton;
    dxbtnTimeGridView: TdxBarButton;
    dxbtnYearView: TdxBarButton;
    Panel1: TPanel;
    pbHintPanel: TPaintBox;
    UnboundStorage: TcxSchedulerStorage;
    DBStorage: TcxSchedulerDBStorage;
    EventsDataSource: TDataSource;
    EventsTable: TADOTable;
    DBConnection: TADOConnection;
    EventsCommand: TADOCommand;
    nbgOutlookSync: TdxNavBarGroup;
    nbiWithOutlook: TdxNavBarItem;
    nbiWithScheduler: TdxNavBarItem;
    nbgExport: TdxNavBarGroup;
    nbiExcel: TdxNavBarItem;
    nbiHTML: TdxNavBarItem;
    nbiXML: TdxNavBarItem;
    nbiText: TdxNavBarItem;
    acExcel: TAction;
    acHTML: TAction;
    acXML: TAction;
    acText: TAction;
    acOutlookWithScheduler: TAction;
    acSchedulerWithOutlook: TAction;
    dlgExportTo: TSaveDialog;
    dxpsPrinter: TdxComponentPrinter;
    pslnkScheduler: TcxSchedulerReportLink;
    acPrintPreview: TAction;
    acPrint: TAction;
    dxbtnEvents: TdxBarSubItem;
    dxbtnCreating: TdxBarButton;
    dxbtnDeleting: TdxBarButton;
    dxbtnDialogEditing: TdxBarButton;
    dxbtnInplaceEditing: TdxBarButton;
    dxbtnIntersection: TdxBarButton;
    dxbtnMoving: TdxBarButton;
    dxbtnMovingBetweenResource: TdxBarButton;
    dxbtnReadOnly: TdxBarButton;
    dxbtnRecurrence: TdxBarButton;
    dxbtnSharing: TdxBarButton;
    dxbtnSizing: TdxBarButton;
    dxbtnCurrentView: TdxBarSubItem;
    dxbtnControlBox: TdxBarButton;
    dxbtnNavigator: TdxBarButton;
    dxbtnSync: TdxBarSubItem;
    dxbtnExportTo: TdxBarSubItem;
    dxbtnHTML: TdxBarButton;
    dxbtnText: TdxBarButton;
    dxbtnXML: TdxBarButton;
    dxbtnExcel: TdxBarButton;
    dxbtnOutlookWithScheduler: TdxBarButton;
    dxbtnSchedulerWithOutlook: TdxBarButton;
    dxbarEventsGroup: TdxBarGroup;
    dxbarResourcesGroup: TdxBarGroup;
    dxBarSubItem1: TdxBarSubItem;
    dxbtnGroupBy: TdxBarSubItem;
    dxbtnByNone: TdxBarButton;
    dxbtnByResource: TdxBarButton;
    dxbtnByDate: TdxBarButton;
    dxbtnLayoutEditor: TdxBarButton;
    dxbtnResourcePerPage: TdxBarSubItem;
    dxptnAllPerPage: TdxBarButton;
    dxbtnOnePerPage: TdxBarButton;
    dxbtnTwoPerPage: TdxBarButton;
    dxbtnThreePerPage: TdxBarButton;
    cxGridEventsTable: TcxGrid;
    cxGridEventsTableTableView: TcxGridDBTableView;
    cxGridEventsTableTableViewID: TcxGridDBColumn;
    cxGridEventsTableTableViewParentID: TcxGridDBColumn;
    cxGridEventsTableTableViewType: TcxGridDBColumn;
    cxGridEventsTableTableViewStart: TcxGridDBColumn;
    cxGridEventsTableTableViewFinish: TcxGridDBColumn;
    cxGridEventsTableTableViewOptions: TcxGridDBColumn;
    cxGridEventsTableTableViewCaption: TcxGridDBColumn;
    cxGridEventsTableTableViewRecurrenceIndex: TcxGridDBColumn;
    cxGridEventsTableTableViewLocation: TcxGridDBColumn;
    cxGridEventsTableTableViewMessage: TcxGridDBColumn;
    cxGridEventsTableTableViewReminderDate: TcxGridDBColumn;
    cxGridEventsTableTableViewReminderMinutes: TcxGridDBColumn;
    cxGridEventsTableTableViewState: TcxGridDBColumn;
    cxGridEventsTableTableViewLabelColor: TcxGridDBColumn;
    cxGridEventsTableTableViewActualStart: TcxGridDBColumn;
    cxGridEventsTableTableViewActualFinish: TcxGridDBColumn;
    cxGridEventsTableLevel1: TcxGridLevel;
    Scheduler: TcxScheduler;
    pcControlBox: TcxPageControl;
    tbsTemplate: TcxTabSheet;
    Memo1: TMemo;
    Panel2: TPanel;
    btnGenerateMoreEvents: TcxButton;
    cbxSmartRefresh: TcxCheckBox;
    cxLabel1: TcxLabel;
    cbxDataBase: TcxComboBox;
    btnDeleteAll: TcxButton;
    cxGridSplitter: TcxSplitter;
    imgSports: TImageList;
    SaveDialog1: TSaveDialog;
    dxBarSubItem2: TdxBarSubItem;
    dxbtnDayViewOptions: TdxBarSubItem;
    dxbtnWeekViewOptions: TdxBarSubItem;
    dxbtnMonthViewOptions: TdxBarSubItem;
    dxbtnTimeGridViewOptions: TdxBarSubItem;
    dxbtnYearViewOptions: TdxBarSubItem;
    dxbtnAllDayEventsContainer: TdxBarButton;
    dxbtnWorkTimeOnly: TdxBarButton;
    dxbtnTimeRulerMinutes: TdxBarButton;
    dxbtnSingleColumn: TdxBarButton;
    dxbtnWeekCompressWeekends: TdxBarButton;
    dxbtnWeekTimeAsClock: TdxBarButton;
    dxbtnMonthCompressWeekends: TdxBarButton;
    dxbtnMonthTimeAsClock: TdxBarButton;
    dxbtnWorkDaysOnly: TdxBarButton;
    dxbtnTimeGridWorkTimeOnly: TdxBarButton;
    dxbtnAllDayEventsOnly: TdxBarButton;
    dxbtnDetailInfo: TdxBarButton;
    imgEventImages: TImageList;
    srEventStyles: TcxStyleRepository;
    stEventStyle1: TcxStyle;
    stEventStyle2: TcxStyle;
    stEventStyle3: TcxStyle;
    stEventStyle4: TcxStyle;
    stRed: TcxStyle;
    imgParts: TImageList;
    stCustomDrawContainer: TcxStyle;
    stCustomDrawSelectedContainer: TcxStyle;
    stCustomDrawVSeparator: TcxStyle;
    stCustomDrawHSeparator: TcxStyle;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxbtnMajorUnit: TdxBarCombo;
    dxbtnMinorUnit: TdxBarCombo;
    cxStylesRepository: TcxStyleRepository;
    stEvents: TcxStyle;
    stHeaders: TcxStyle;
    stContent: TcxStyle;
    stContentSelection: TcxStyle;
    stResources: TcxStyle;
    stGroupSeparator: TcxStyle;
    stContainer: TcxStyle;
    stBackground: TcxStyle;
    stDateContent: TcxStyle;
    stVertSplitter: TcxStyle;
    stTimeRuler: TcxStyle;
    nbiCustomEditors: TdxNavBarItem;
    UnboundStorageTwo: TcxSchedulerStorage;
    cxEditRepository1: TcxEditRepository;
    ComboBoxItem: TcxEditRepositoryComboBoxItem;
    RichItem: TcxEditRepositoryRichItem;
    dxBarPopupMenu: TdxBarPopupMenu;
    nbiCustomPopupMenus: TdxNavBarItem;
    nbiAggregate: TdxNavBarItem;
    AggregateStorage: TcxSchedulerAggregateStorage;
    SchedulerHolidays: TcxSchedulerHolidays;
    nbgNew: TdxNavBarGroup;
    nbiGanttView: TdxNavBarItem;
    nbiHolidays: TdxNavBarItem;
    acHolidays: TAction;
    acAggregate: TAction;
    dxbtnGanttView: TdxBarButton;
    acGanttView: TAction;
    btnHolidaysEditor: TcxButton;
    btnGenerateHolidaysEvents: TcxButton;
    pmGenerageHolidaysEvents: TPopupMenu;
    miGenerateHolidaysEventsForAllResources: TMenuItem;
    miGenerateHolidaysEventsOnlyESPN: TMenuItem;
    miGenerateHolidaysEventsForEUROSPORTNEWSandFOXFOOTY: TMenuItem;
    SchedulerGanttStorage: TcxSchedulerStorage;
    cbHolidaysHints: TcxCheckBox;
    cxLabel2: TcxLabel;
    ccbHolidayColor: TcxColorComboBox;
    nbgNewControl: TdxNavBarGroupControl;
    SchedulerHolidaysStorage: TcxSchedulerStorage;
    dxbci: TdxBarContainerItem;
    dxbtnDayHeader: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    dxbtnShowEvents: TdxBarButton;
    dxBarSubItem4: TdxBarSubItem;
    dxBarSubItem5: TdxBarSubItem;
    dxbtnAllDayAreaHeightDefault: TdxBarButton;
    dxbtnAllDayAreaHeight3: TdxBarButton;
    dxbtnAllDayAreaHeight5: TdxBarButton;
    dxbtnAllDayAreaScrollBarDefault: TdxBarButton;
    dxbtnAllDayAreaScrollBarNever: TdxBarButton;
    dxbtnAllDayAreaScrollBarAlways: TdxBarButton;
    dxbtnSelectOnRightClick: TdxBarButton;
    dxBarSubItem6: TdxBarSubItem;
    dxbtnGanttHotTrack: TdxBarButton;
    dxbtnGanttShowAsProgress: TdxBarButton;
    GridConnection: TcxSchedulerGridConnection;
    acGridConnection: TAction;
    nbiGridConnection: TdxNavBarItem;
    cxGridEventsTableTableViewConnection: TcxGridTableView;
    cxGridEventsTableLevel2: TcxGridLevel;
    dxbtnGanttViewShowExpandButton: TdxBarButton;
    dxsiSkins: TdxBarSubItem;
    dxBarSeparator1: TdxBarSeparator;
    btnGanttExpandAll: TcxButton;
    btnGanttCollapseAll: TcxButton;
    cxLFController: TdxSkinController;
    cxLabel4: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    cbAdditionalDST: TcxCheckBox;
    cxGroupBox2: TcxGroupBox;
    cbCurrentDST: TcxCheckBox;
    cbxCurrentZone: TcxComboBox;
    cbxAdditionalZone: TcxComboBox;
    cxGroupBox3: TcxGroupBox;
    cbUnbound: TcxCheckBox;
    cbBound: TcxCheckBox;
    tbsYear: TcxTabSheet;
    cbAllDayOnly: TcxCheckBox;
    cbxYearScale: TcxComboBox;
    cxLabel3: TcxLabel;
    tbsBound: TcxTabSheet;
    tbsHolidays: TcxTabSheet;
    tbsGantt: TcxTabSheet;
    tbsTimeZones: TcxTabSheet;
    tbsAggregated: TcxTabSheet;
    tbsTimeGridView: TcxTabSheet;
    cbShowDetailInfo: TcxCheckBox;
    cbxSnapEvents: TcxCheckBox;
    cbxEventsStyle: TcxComboBox;
    cxLabel5: TcxLabel;
    cbxExpandButton: TcxCheckBox;
    cbxProgress: TcxCheckBox;
    cbxSnapGanttEvents: TcxCheckBox;
    imgMain: TcxImageList;
    imgLargeMain: TcxImageList;
    tbsMonth: TcxTabSheet;
    cxCheckBox1: TcxCheckBox;
    tbsReminders: TcxTabSheet;
    cbxReminderByResource: TcxCheckBox;
    imgResources: TcxImageList;
    dxbtnGanttViewSnapEventsToTimeSlots: TdxBarButton;
    dxbtnTimeGridSnapEventsToTimeSlots: TdxBarButton;
    cbxTreeBrowser: TcxCheckBox;
    procedure ActionsExecute(Sender: TObject);
    procedure acViewTypeExecute(Sender: TObject);
    procedure btnDeleteAllClick(Sender: TObject);
    procedure btnGenerateMoreEventsClick(Sender: TObject);
    procedure cbxDataBaseClick(Sender: TObject);
    procedure cbxDBModeClick(Sender: TObject);
    procedure dxbtnInspectorClick(Sender: TObject);
    procedure dxbtnViewItemClick(Sender: TObject);
    procedure dxNavBarActiveGroupChanged(Sender: TObject);
    procedure dxNavBarGroupClick(Sender: TObject; AGroup: TdxNavBarGroup);
    procedure dxNavBarLinkPress(Sender: TObject; ALink: TdxNavBarItemLink);
    procedure dxNavBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dxNavBarMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure EventsClick(Sender: TObject);
    procedure ExportToExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GroupByClick(Sender: TObject);
    procedure OnDataBindingClick(Sender: TObject);
    procedure OptionsClick(Sender: TObject);
    procedure pbHintPanelPaint(Sender: TObject);
    procedure PrintingExecute(Sender: TObject);
    procedure RemindersOpenEvent(Sender: TcxSchedulerReminders; AEvent: TcxSchedulerControlEvent);
    procedure ResPerPageClick(Sender: TObject);
    procedure SchedulerInitEventImages(Sender: TcxCustomScheduler; AEvent: TcxSchedulerControlEvent; AImages: TcxSchedulerEventImages);
    procedure SchedulerViewTypeChanged(Sender: TObject; APrevView, ANewView: TcxSchedulerCustomView);
    procedure SynchronizeWithExecute(Sender: TObject);
    procedure SchedulerCustomDrawEvent(Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxSchedulerEventCellViewInfo; var ADone: Boolean);
    procedure SchedulerStylesGetEventStyle(Sender: TObject;
      AEvent: TcxSchedulerEvent; var AStyle: TcxStyle);
    procedure SchedulerDateNavigatorCustomDrawHeader(Sender: TObject;
      ACanvas: TcxCanvas;
      AViewInfo: TcxSchedulerDateNavigatorMonthHeaderViewInfo;
      var ADone: Boolean);
    procedure SchedulerDateNavigatorCustomDrawDayCaption(Sender: TObject;
      ACanvas: TcxCanvas;
      AViewInfo: TcxSchedulerDateNavigatorDayCaptionViewInfo;
      var ADone: Boolean);
    procedure SchedulerDateNavigatorCustomDrawDayNumber(Sender: TObject;
      ACanvas: TcxCanvas;
      AViewInfo: TcxSchedulerDateNavigatorDayNumberViewInfo;
      var ADone: Boolean);
    procedure SchedulerDateNavigatorCustomDrawContent(Sender: TObject;
      ACanvas: TcxCanvas;
      AViewInfo: TcxSchedulerDateNavigatorMonthContentViewInfo;
      var ADone: Boolean);
    procedure SchedulerCustomDrawGroupSeparator(Sender: TObject;
      ACanvas: TcxCanvas;
      AViewInfo: TcxSchedulerGroupSeparatorCellViewInfo;
      var ADone: Boolean);
    procedure SchedulerResourceNavigatorCustomDrawButton(
      Sender: TcxSchedulerResourceNavigator; ACanvas: TcxCanvas;
      AButton: TcxSchedulerNavigatorButton; var ADone: Boolean);
    procedure SchedulerViewDayCustomDrawTimeRuler(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxSchedulerTimeRulerCellViewInfo;
      var ADone: Boolean);
    procedure SchedulerCustomDrawDayHeader(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxSchedulerDayHeaderCellViewInfo;
      var ADone: Boolean);
    procedure SchedulerCustomDrawResourceHeader(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxSchedulerHeaderCellViewInfo;
      var ADone: Boolean);
    procedure SchedulerCustomDrawContent(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxSchedulerContentCellViewInfo;
      var ADone: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure dxbtnLayoutEditorClick(Sender: TObject);
    procedure dxbtnMajorUnitChange(Sender: TObject);
    procedure dxbtnMinorUnitChange(Sender: TObject);
    procedure acCustomDialogsExecute(Sender: TObject);
    procedure SchedulerGetEventEditProperties(Sender: TObject;
      AEvent: TcxSchedulerControlEvent;
      var AProperties: TcxCustomEditProperties);
    procedure SchedulerContentPopupMenuPopup(
      Sender: TcxSchedulerContentPopupMenu; ABuiltInMenu: TPopupMenu;
      var AHandled: Boolean);
    procedure SchedulerEventPopupMenuPopup(
      Sender: TcxSchedulerEventPopupMenu; ABuiltInMenu: TPopupMenu;
      var AHandled: Boolean);
    procedure SchedulerViewDayTimeRulerPopupMenuPopup(
      Sender: TcxSchedulerTimeRulerPopupMenu; ABuiltInMenu: TPopupMenu;
      var AHandled: Boolean);
    procedure ShowHolidaysEditorClick(Sender: TObject);
    procedure GenerateHolidaysEventsClick(Sender: TObject);
    procedure acHolidaysExecute(Sender: TObject);
    procedure btnGenerateHolidaysEventsClick(Sender: TObject);
    procedure SchedulerShowDateHint(Sender: TObject;
      const ADate: TDateTime; var AHintText: String; var AAllow: Boolean);
    procedure dxbtnExitClick(Sender: TObject);
    procedure AllDayAreaHeightClick(Sender: TObject);
    procedure AllDayAreaScrollBarClick(Sender: TObject);
    procedure acGridConnectionExecute(Sender: TObject);
    procedure AggregateStorageEventInserting(
      Sender: TcxSchedulerAggregateStorage; AEvent: TcxSchedulerEvent;
      var AStorage: TcxCustomSchedulerStorage);
    procedure lblURLClick(Sender: TObject);
    procedure GanttCollapseEvents(Sender: TObject);
    procedure cxLFControllerSkinForm(Sender: TObject; AForm: TCustomForm;
      var ASkinName: String; var UseSkin: Boolean);
    procedure cxLFControllerSkinControl(Sender: TObject;
      AControl: TWinControl; var UseSkin: Boolean);
    procedure cbAdditionalDSTClick(Sender: TObject);
    procedure cbxZonePropertiesChange(Sender: TObject);
    procedure AggregateLinkClick(Sender: TObject);
    procedure YearScaleChanged(Sender: TObject);
    procedure AllDayEventsOnlyClick(Sender: TObject);
    procedure SchedulerLayoutChanged(Sender: TObject);
    procedure cbTimeLineOptionsClick(Sender: TObject);
    procedure cbxProgressClick(Sender: TObject);
    procedure cbxEventsStylePropertiesChange(Sender: TObject);
    procedure cbxExpandButtonClick(Sender: TObject);
    procedure cbxSnapGanttEventsClick(Sender: TObject);
    procedure lstSchedulerActionsExecute(Action: TBasicAction;
      var Handled: Boolean);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cbxReminderByResourceClick(Sender: TObject);
    procedure cbxTreeBrowserClick(Sender: TObject);
  private
    FConverting: Boolean;
    FDaysOffIndexes: array[1..2] of Byte;
    FPrevStorage: TcxCustomSchedulerStorage;
    FPrevLink: TdxNavBarItemLink;
    FSkinsBarMenuItems: TcxObjectList;
    procedure CalcDaysOff;
    procedure CheckTemporaryBitmapSize(AImages: TImageList);
    function GetCaptionText: string;
    function GetSyncField: TcxCustomSchedulerStorageField;
    procedure ConvertPopupMenu(ASourceMenu: TMenu);
    procedure GridConnectionState(AActive: Boolean);
    procedure DrawParts(ACanvas: TcxCanvas; const R: TRect;
      AImages: TImageList; AState: Integer);
  protected
    AppDir: string;
    CurrentLink: TdxNavBarItemLink;
    PrevStorage: TcxCustomSchedulerStorage;
    LockUpdate: Boolean;
    function CanSchedulerFocus: Boolean;
    procedure CorrectGanttEvents;
    procedure DeleteEvents(ARefresh: Boolean);
    function FindTabByNavBarItem(AItem: TdxNavBarItem = nil): TcxTabSheet;
    procedure GenerateEvents(ACount: Integer);
    procedure GetResourceStream(const AName: string; AStream: TStream);
    procedure LinkTabsToNavBarItems;
    procedure LoadUnboundData;
    // inspector notifications
    procedure OnHideInspector(Sender: TObject);
    procedure OnInspectorChanged(Sender: TObject);
    //
    procedure SelectDataBase(AIndex: Integer);
    procedure SelectStorage(AIndex: Integer);
    procedure SetSchedulerFocused;
    procedure SetupTimeZonesInfo;
    procedure SyncCustomDraw(ASetHandlers: Boolean);
    procedure SyncCustomPopupMenus(ASetHandlers: Boolean);
    procedure SyncDBMode;
    procedure SyncEventsMenuItemsVisibility;
    procedure SyncEventsMenuWithScheduler;
    procedure SyncMenus;
    procedure SyncNavBarActiveViewIndex;
    procedure SyncNavBarDataBindingIndex;
    procedure SyncOptionsWithScheduler;
    procedure SyncScales;
    procedure SyncScheduler;
    procedure SyncSchedulerWithEventsMenu;
    procedure SyncSchedulerWithOptions;
    procedure SyncSchedulerWithViewMenuItems;
    procedure SyncStyles(ASelect: Boolean);
    procedure SyncViewMenuItemsWithScheduler;
    procedure ValidateActiveView;
  public
    property SyncField: TcxCustomSchedulerStorageField read GetSyncField;
    property CaptionText: string read GetCaptionText;
  end;

var
  frmMain: TfrmMain;

const
  GenerateCount: Integer = 10000;

implementation

uses
  dxProperties, dxProgress, ShellApi, cxGeometry, cxFormats, Types,
  dxCustomEditor, SelectStorageUnit, dxDemoUtils;

{$R *.dfm}
{$R cxSchedulerResources.res}
  
const
  StartIndexes: array[0..21] of Integer =
   (0, 12, 30, 44, 58, 80, 90, 106, 126, 157, 174, 196,
    208, 220, 226, 234, 238, 242, 249, 260, 267, 272);

  EventsCount: array[0..21] of integer =
   (12, 18, 14, 14, 22, 10, 16, 20, 31, 17,
    22, 12, 12, 6, 8, 4, 4, 7, 11, 7, 5, 8);

  SportEvents: array[0..279] of string =
   ('Basketball Qualifying - Men',
    'Basketball Qualifying - Women',
    'Basketball First Group Phase - Men',
    'Basketball First Group Phase - Women',
    'Basketball Quarterfinals - Men',
    'Basketball Quarterfinals - Women',
    'Basketball Semifinals - Men',
    'Basketball Semifinals - Women',
    'Basketball Places 3/4 - Men',
    'Basketball Places 3/4 - Women',
    'Basketball Finals - Men',
    'Basketball Finals - Women',

    'Boxing - Lamon Brewster (32-2) vs. Luan Krasniqi (28-1-1) (WBO heavyweight belt)',
    'Boxing - (PPV) Antonio Tarver (23-3) vs. Roy Jones (49-3) (IBO light heavyweight belt)',
    'Boxing - ((Showtime) James Toney (68-4-2) vs. Dominick Guinn (25-2-1)',
    'Boxing - (Nicolay Valuev (41-0) vs. TBA',
    'Boxing - (Danilo Haussler (25-3) vs. TBA',
    'Boxing - (Cengiz Koc (22-1) vs. TBA',
    'Boxing - ((PPV) Diego Corrales (40-2) vs. Jose Luis Castillo (52-7-1)',
    'Boxing - ((WBC and WBO lightweight belts) (PPV) Carlos Hernandez vs. Bobby Pacquiao',
    'Boxing - ((PPV) Jorge Arce vs. Hussein Hussein',
    'Boxing - (Vince Philips (47-9-1) vs. Reynaldo Pelonia (35-21-3)',
    'Boxing - (Kili Madrid (6-0-1) vs. Donny Fosmire (10-7)',
    'Boxing - (Nelson Zepeda (1-0-1) vs. Kaleo Padilla (0-0)',
    'Boxing - (Justin Mercado (1-1) vs. Waldo Rojas (0-0)',
    'Boxing - (Illima Vicente (0-0) vs. Jenny Houts (0-0)',
    'Boxing - (Tomasz Adamek (29-0) vs. Thomas Ulrich (28-1) (WBC light heavyweight belt)',
    'Boxing - ((Showtime) Jeff Lacy (20-0) vs. Joe Calzaghe (39-0) (IBF, IBO and WBO super middleweight belts)',
    'Boxing - (Jermain Taylor vs. Bernard Hopkins',
    'Boxing - (Ronald "Winky" Wright vs. TBA',

    'Tennis - Australian Open',
    'Tennis - Pacific Life Open',
    'Tennis - NASDAQ-100 Open',
    'Tennis - Tennis Masters Monte Carlo',
    'Tennis - Telecom Italia Masters Roma',
    'Tennis - Tennis Masters Hamburg',
    'Tennis - Roland Garros',
    'Tennis - Wimbledon',
    'Tennis - Tennis Masters Montreal',
    'Tennis - Western and Southern Financial Group Masters',
    'Tennis - US Open',
    'Tennis - Tennis Masters Madrid',
    'Tennis - BNP Paribas Masters',
    'Tennis - Tennis Masters Cup',

    'Weightlifting 48 Kg - Women  - Final',
    'Weightlifting 56 Kg - Men  - Final',
    'Weightlifting 53 Kg - Women  - Final',
    'Weightlifting 62 Kg - Men  - Final',
    'Weightlifting 63 Kg - Women  - Final',
    'Weightlifting 69 Kg - Men  - Final',
    'Weightlifting 69 Kg - Women  - Final',
    'Weightlifting 77 Kg - Men  - Final',
    'Weightlifting 75 Kg - Women  - Final',
    'Weightlifting 75kg - Women  - Final',
    'Weightlifting 85 Kg - Men  - Final',
    'Weightlifting 94 Kg - Men  - Final',
    'Weightlifting 105 Kg - Men  - Final',
    'Weightlifting 105kg - Men  - Final',

    'Fencing - Sabre - Men - 1st Round',
    'Fencing - Sabre - Men - Round 2',
    'Fencing - Sabre - Men - 3rd Round',
    'Fencing - Sabre - Men - Quarter final',
    'Fencing - Sabre - Men - Semi-finals',
    'Fencing - Sabre - Men - Final',
    'Fencing - Epee - Women - 1st Round',
    'Fencing - Epee - Women - Round 2',
    'Fencing - Epee - Women - 3rd Round',
    'Fencing - Epee - Women - Quarter final',
    'Fencing - Epee - Women - Semi-finals',
    'Fencing - Epee - Women - Final',
    'Fencing - Epee - Women/Team - 1st Round',
    'Fencing - Epee - Women/Team - Quarter final',
    'Fencing - Epee - Women/Team - Semi-finals',
    'Fencing - Epee - Women/Team - Final',
    'Fencing - Foil - Men - 1st Round',
    'Fencing - Foil - Men - Round 2',
    'Fencing - Foil - Men - 3rd Round',
    'Fencing - Foil - Men - Quarter final',
    'Fencing - Foil - Men - Semi-finals',
    'Fencing - Foil - Men - Final',

    'Soccer 1st Round - *Men''s Preliminaries - Men',
    'Soccer 1st Round - *Women''s Preliminaries - Women',
    'Soccer Quarter final - *Men''s Quarterfinal - Men',
    'Soccer Quarter final - *Women''s Quarterfinal - Women',
    'Soccer Semi-finals - *Women''s Semifinal - Men',
    'Soccer Semi-finals - *Women''s Semifinal - Women',
    'Soccer places 3/4 - *Men''s Bronze Medal Match - Men',
    'Soccer places 3/4 - *Women''s Bronze Medal Match - Women',
    'Soccer Final - *Men''s Gold Medal Match - Men',
    'Soccer Final - *Women''s Gold Medal Match - Women',

    'Artistic Gymnastics - Men - Qualifying',
    'Artistic Gymnastics - Women - Qualifying',
    'Artistic Gymnastics - Men/Team - Final',
    'Artistic Gymnastics - Women/Team - Final',
    'Artistic Gymnastics - Individual All-Around - Men - Final',
    'Artistic Gymnastics - Individual All-Around - Women - Final',
    'Artistic Gymnastics - Floor Exercise - Men - Final',
    'Artistic Gymnastics - Vault - Women - Final',
    'Artistic Gymnastics - Uneven Bars - Women - Final',
    'Artistic Gymnastics - Pommel Horse - Men - Final',
    'Artistic Gymnastics - Rings - Men - Final',
    'Artistic Gymnastics - Vault - Men - Final',
    'Artistic Gymnastics - Beam - Women - Final',
    'Artistic Gymnastics - Parallel Bars - Men - Final',
    'Artistic Gymnastics - Floor Exercise - Women - Final',
    'Artistic Gymnastics - Horizontal Bar - Men - Final',

    'Canoe - Slalom C1 - Men - Heats',
    'Canoe - Slalom C1 - Men - Heats',
    'Canoe - Slalom C1 - Men - Semi-finals',
    'Canoe - Slalom C1 - Men - Final',
    'Canoe - Slalom C2 - Men - Heats',
    'Canoe - Slalom C2 - Men - Heats',
    'Canoe - Slalom C2 - Men - Semi-finals',
    'Canoe - Slalom C2 - Men - Final',
    'Canoe - Flatwater C1 - 1000m - Men - Heats',
    'Canoe - Flatwater C2 - 1000m - Men - Heats',
    'Canoe - Flatwater C1 - 500m - Men - Heats',
    'Canoe - Flatwater C2 - 500m - Men - Heats',
    'Canoe - Flatwater C1 - 1000m - Men - Semi-finals',
    'Canoe - Flatwater C2 - 1000m - Men - Semi-finals',
    'Canoe - Flatwater C1 - 500m - Men - Semi-finals',
    'Canoe - Flatwater C2 - 500m - Men - Semi-finals',
    'Canoe - Flatwater C1 - 1000m - Men - Final',
    'Canoe - Flatwater C2 - 1000m - Men - Final',
    'Canoe - Flatwater C1 - 500m - Men - Final',
    'Canoe - Flatwater C2 - 500m - Men - Final',

    'Kayak - Slalom K1 - Women - Heats',
    'Kayak - Slalom K1 - Women - Heats',
    'Kayak - Slalom K1 - Women - Semi-finals',
    'Kayak - Slalom K1 - Women - Final',
    'Kayak - Slalom K2 - Men - Heats',
    'Kayak - Slalom K2 - Men - Heats',
    'Kayak - Slalom K2 - Men - Semi-finals',
    'Kayak - Slalom K1 - Men - Final',
    'Kayak - Flatwater K1 - 1000m - Men - Heats',
    'Kayak - Flatwater K4 - 500m - Women - Heats',
    'Kayak - Flatwater K2 - 1000m - Men - Heats',
    'Kayak - Flatwater K4 - 1000m - Men - Heats',
    'Kayak - Flatwater K1 - 500m - Men - Heats',
    'Kayak - Flatwater K2 - 500m - Men - Heats',
    'Kayak - Flatwater K2 - 500m - Women - Heats',
    'Kayak - Flatwater K1 - 1000m - Men - Semi-finals',
    'Kayak - Flatwater K4 - 500m - Women - Semi-finals',
    'Kayak - Flatwater K2 - 1000m - Men - Semi-finals',
    'Kayak - Flatwater K4 - 1000m - Men - Semi-finals',
    'Kayak - Flatwater K1 - 500m - Men - Semi-finals',
    'Kayak - Flatwater K1 - 500m - Women - Semi-finals',
    'Kayak - Flatwater K2 - 500m - Men - Semi-finals',
    'Kayak - Flatwater K2 - 500m - Women - Semi-finals',
    'Kayak - Flatwater K1 - 1000m - Men - Final',
    'Kayak - Flatwater K4 - 500m - Women - Final',
    'Kayak - Flatwater K2 - 1000m - Men - Final',
    'Kayak - Flatwater K4 - 1000m - Men - Final',
    'Kayak - Flatwater K1 - 500m - Men - Final',
    'Kayak - Flatwater K1 - 500m - Women - Final',
    'Kayak - Flatwater K2 - 500m - Men - Final',
    'Kayak - Flatwater K2 - 500m - Women - Final',

    'Wrestling - Greco-Roman 55kg - Men - Qualifying',
    'Wrestling - Greco-Roman 66kg - Men - Qualifying',
    'Wrestling - Greco-Roman 84kg - Men - Qualifying',
    'Wrestling - Greco-Roman 120kg - Men - Qualifying',
    'Wrestling - Greco-Roman 55kg - Men - Semi-finals',
    'Wrestling - Greco-Roman 66kg - Men - Semi-finals',
    'Wrestling - Greco-Roman 84kg - Men - Semi-finals',
    'Wrestling - Greco-Roman 120kg - Men - Semi-finals',
    'Wrestling - Greco-Roman 96kg - Men - Qualifying',
    'Wrestling - Greco-Roman 55kg - Men - Final',
    'Wrestling - Greco-Roman 66kg - Men - Final',
    'Wrestling - Greco-Roman 84kg - Men - Final',
    'Wrestling - Greco-Roman 120kg - Men - Final',
    'Wrestling - Greco-Roman 55kg - Men - Play Off',
    'Wrestling - Greco-Roman 66kg - Men - Play Off',
    'Wrestling - Greco-Roman 84kg - Men - Play Off',
    'Wrestling - Greco-Roman 120kg - Men - Play Off',

    'Equestrianism - Individual Eventing Dressage - 1st Day',
    'Equestrianism - Team Eventing Dressage - 1st Day',
    'Equestrianism - Individual Eventing Dressage - 2nd Day',
    'Equestrianism - Team Eventing Dressage - 2nd Day',
    'Equestrianism - Individual Eventing Cross Country - Final',
    'Equestrianism - Team Eventing Cross Country - Final',
    'Equestrianism - Team Eventing Jumping - Final',
    'Equestrianism - Individual Eventing Jumping - Qualifying',
    'Equestrianism - Individual Eventing Jumping - Final',
    'Equestrianism - Individual Dressage Grand Prix - 1st Day',
    'Equestrianism - Team Dressage Grand Prix - 1st Day',
    'Equestrianism - Individual Dressage Grand Prix - 2nd Day',
    'Equestrianism - Team Dressage Grand Prix - 2nd Day',
    'Equestrianism - Individual Jumping - Qualifying',
    'Equestrianism - Individual Dressage Grand Prix Special - Final',
    'Equestrianism - Team Jumping - Final',
    'Equestrianism - Individual Jumping - Qualifying',
    'Equestrianism - Individual Jumping - Qualifying',
    'Equestrianism - Team Jumping - Final',
    'Equestrianism - Individual Dressage Grand Prix Freestyle - Final',
    'Equestrianism - Individual Jumping - Final',
    'Equestrianism - Individual Jumping - Final',

    'Sailing - Men''s 470 - Race 01',
    'Sailing - Women''s 470 - Race 01',
    'Sailing - Men''s 470 - Race 02',
    'Sailing - Women''s 470 - Race 02',
    'Sailing - Finn - Race 1',
    'Sailing - Yngling - Race 1',
    'Sailing - Finn - Race 2',
    'Sailing - Yngling - Race 2',
    'Sailing - Laser - Race 1',
    'Sailing - Women''s Mistral - Race 01',
    'Sailing - Men''s Mistral - Race 02',
    'Sailing - 49er - Race 1',

    'Swimming - Men''s 400m Individual Medley - Heat 1',
    'Swimming - Men''s 400m Individual Medley - Heat 2',
    'Swimming - Women''s 100m Butterfly - Heat 1',
    'Swimming - Men''s 400m Freestyle - Heat 1',
    'Swimming - Women''s 400m Individual Medley - Heat 1',
    'Swimming - Women''s 400m Individual Medley - Heat 2',
    'Swimming - Men''s 100m Breaststroke - Heat 1',
    'Swimming - Men''s 100m Breaststroke - Heat 2',
    'Swimming - Women''s 4 x 100m Freestyle Relay - Heat 1',
    'Swimming - Women''s 4 x 100m Freestyle Relay - Heat 2',
    'Swimming - Women''s 100m Butterfly Semifinal 1',
    'Swimming - Women''s 4 x 100m Freestyle Relay Final',

    'Diving - Women''s Synchronised 3m Springboard Final',
    'Diving - Men''s Synchronised 3m Springboard Final',
    'Diving - Women''s Synchronised 10m Platform Final',
    'Diving - Men''s Synchronised 10m Platform Final',
    'Diving - Women''s 10m Platform Preliminary',
    'Diving - Men''s 10m Platform Semifinal',

    'Handball - Men''s Preliminaries - Pool A Match 1 - Spain - Korea',
    'Handball - Women''s Preliminaries - Pool A Match 1 - China - Hungary',
    'Handball - Men''s Classification 11-12 Match 31 - Slovenia - Egypt',
    'Handball - Women''s Classification 9-10 Match 21 - Greece - Angola',
    'Handball - Men''s Classification 9-10 Match 32 - Brazil - Iceland',
    'Handball - Women''s Quarterfinal Match 22 - Ukraine - Spain',
    'Handball - Men''s Semifinal Match 40 - Germany - Russia',
    'Handball - Women''s Semifinal Match 27 - France - Korea',

    'Gymnastics - Men - Qualifying',
    'Gymnastics - Women - Qualifying',
    'Gymnastics - Men/Team - Final',
    'Gymnastics - Women/Team - Final',

    'Athletics - Women''s 100m Round 1 - Heat 1',
    'Athletics - Men''s 100m Round 1 - Heat 1',
    'Athletics - Men''s 100m Semifinal 1',
    'Athletics - Women''s 100m Final',

    'Shooting - Men''s 10m Air Pistol Qualification',
    'Shooting - Men''s 10m Air Pistol Final',
    'Shooting - Women''s 10m Air Pistol Pre-event Training',
    'Shooting - Men''s 10m Air Pistol Medal Ceremony',
    'Shooting - Women''s 10m Air Pistol Qualification',
    'Shooting - Men''s 50m Pistol Qualification',
    'Shooting - Women''s 25m Pistol Final',

    'Archery - Women''s Individual 1/32 Eliminations',
    'Archery - Men''s Individual 1/32 Eliminations',
    'Archery - Women''s Individual 1/16 Eliminations',
    'Archery - Men''s Individual 1/16 Eliminations',
    'Archery - Women''s Individual 1/8 Eliminations',
    'Archery - Men''s Individual 1/8 Eliminations',
    'Archery - Women''s Individual Quarterfinal 1',
    'Archery - Men''s Individual Quarterfinal 1',
    'Archery - Men''s Individual Semifinal 1',
    'Archery - Men''s Individual Bronze Medal Match',
    'Archery - Women''s Team Gold Medal Match',

    'Cycling - Men''s Road Race',
    'Cycling - Women''s Road Race',
    'Cycling - Women''s Individual Time Trial',
    'Cycling - Men''s Individual Time Trial',
    'Cycling - Women''s Sprint 1/8 Finals',
    'Cycling - Women''s Individual Pursuit Final',
    'Cycling - Men''s Sprint 1/8 Finals',

    'Water Polo - Men''s Preliminaries - Group B - EGY - AUS',
    'Water Polo - Women''s Classification 7th-8th - KAZ - CAN',
    'Water Polo - Women''s Quarterfinal 02 - ITA - HUN',
    'Water Polo - Women Bronze Medal Game',
    'Water Polo - Men''s Semifinal 02',

    'Volleyball - Women''s Preliminaries - Pool B Match 1 - CUB - GER',
    'Volleyball - Men''s Preliminaries - Pool A Match 1 - SCG - POL',
    'Volleyball - Women''s Quarterfinal 04 - JPN - CHN',
    'Volleyball - Men''s Quarterfinal 03 - GRE - USA',
    'Volleyball - Women''s Semifinal 02 - CUB - CHN',
    'Volleyball - Men''s Semifinal 02 - USA - BRA',
    'Volleyball - Women''s Gold Medal Match - RUS - CHN',
    'Volleyball - Men''s Bronze Medal Match - RUS - USA');

procedure TfrmMain.DeleteEvents(ARefresh: Boolean);
begin
  try
    EventsCommand.CommandText := 'DELETE FROM Events';
    EventsCommand.Execute;
  finally
    SelectDataBase(1);
  end;
end;

function TfrmMain.FindTabByNavBarItem(AItem: TdxNavBarItem = nil): TcxTabSheet;
var
  I: Integer;
begin
  Result := tbsTemplate;
  if (AItem = nil) and (CurrentLink <> nil) then
    AItem := CurrentLink.Item; 
  for I := 0 to pcControlBox.PageCount - 1 do
    if pcControlBox.Pages[I].Tag = Integer(AItem) then
    begin
      Result := pcControlBox.Pages[I];
      Exit;
    end;
end;

procedure TfrmMain.GenerateEvents(ACount: Integer);
var
  I: Integer;
  ADate: TDateTime;
  AType: Integer;
  AEvent: TcxSchedulerEvent;
begin
  Randomize;
  Scheduler.Storage.Clear;
  Scheduler.Storage.BeginUpdate;
  try
    for I := 0 to ACount - 1 do
    begin
      AEvent := Scheduler.Storage.createEvent;
      ADate := EncodeDate(2008, 2, 28) + EncodeTime(Random(10), Random(60), 0, 0) + (Random(30) - 15);
      AEvent.Start := ADate + Scheduler.OptionsView.WorkStart;
      if not (I mod 10 = 0) then
        AEvent.Duration := Random(120) * MinuteToTime
      else
      begin
        AEvent.Start := Trunc(ADate);
        AEvent.Finish := Trunc(ADate) + 1;
        AEvent.AllDayEvent := True;
      end;
      AEvent.State := Random(4);
      AEvent.LabelColor := EventLabelColors[Random(11)];
      AType := Random(Length(StartIndexes));
      AEvent.Caption := SportEvents[StartIndexes[AType] + Random(EventsCount[AType])];
      AEvent.ResourceID := Random(Scheduler.Storage.ResourceCount);
      AEvent.Reminder := I mod 5 = 0;
      AEvent.SetCustomFieldValueByName('SportID', AType);
    end;
  finally
    Scheduler.Storage.EndUpdate;
  end;
end;

procedure TfrmMain.GetResourceStream(const AName: string; AStream: TStream);
var
  ASize: Integer;
  AHandle: HGLOBAL;
  AResInfo: HRSRC;
  AResPtr: Pointer;
  AResInstance: Integer;
begin
  AResInstance := FindResourceHInstance(hInstance);
  AResInfo := FindResource(AResInstance, PChar(AName), RT_RCDATA);
  ASize := SizeOfResource(AResInstance, AResInfo);
  if (AResInfo <> 0) and (ASize <> 0) then
  begin
    AHandle := LoadResource(AResInstance, AResInfo);
    AResPtr := LockResource(AHandle);
    AStream.WriteBuffer(AResPtr^, ASize);
  end;
end;

procedure TfrmMain.LinkTabsToNavBarItems;
begin
  tbsBound.Tag := Integer(mbiBound);
  tbsHolidays.Tag := Integer(nbiHolidays);
  tbsGantt.Tag := Integer(nbiGanttView);
  tbsTimeZones.Tag := Integer(nbiDifferentTimeZones);
  tbsAggregated.Tag := Integer(nbiAggregate);
  tbsTimeGridView.Tag := Integer(nbiTimeGrid);
  tbsYear.Tag := Integer(nbiYear);
  tbsMonth.Tag := Integer(nbiMonth);
  tbsReminders.Tag := Integer(nbiReminders);
end;

procedure TfrmMain.LoadUnboundData;
var
  I: Integer;
  AMemStream: TMemoryStream;
begin
  AMemStream := TMemoryStream.Create();
  try
    GetResourceStream('SCHEDULEREVENTS', AMemStream);
    AMemStream.Position := 0;
    UnboundStorage.LoadFromStream(AMemStream);
    AMemStream.Clear;
    GetResourceStream('SCHEDULERNICEEVENTS', AMemStream);
    AMemStream.Position := 0;
    UnboundStorageTwo.LoadFromStream(AMemStream);
    AMemStream.Clear;
    GetResourceStream('GANTTEVENTS', AMemStream);
    AMemStream.Position := 0;
    SchedulerGanttStorage.LoadFromStream(AMemStream);
    SchedulerGanttStorage.BeginUpdate;
    try
      for I := 1 to SchedulerGanttStorage.EventCount - 1 do
        SchedulerGanttStorage.Events[I].ParentGroup := SchedulerGanttStorage.Events[0];
    finally
      SchedulerGanttStorage.EndUpdate;
    end;
  finally
    AMemStream.Free;
  end;
  CorrectGanttEvents;
end;

procedure TfrmMain.OnHideInspector(Sender: TObject);
begin
  dxbtnInspector.Down := False;
end;

procedure TfrmMain.OnInspectorChanged(Sender: TObject);
begin
  SyncMenus;
end;

procedure TfrmMain.SelectDataBase(AIndex: Integer);
var
  AConnection: string;
const
  ABaseName: array[0..1] of string =
    ('Data\cxScheduler.mdb', 'Data\Temporary.mdb');
begin
  EventsTable.Active := False;
  DBConnection.Connected := False;
  AConnection := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' +
    AppDir + ABaseName[AIndex] + ';Persist Security Info=False';
  DBConnection.ConnectionString := AConnection;
  DBConnection.Connected := True;
  EventsTable.Active := True;
  if not cxGridEventsTableTableView.IsDestroying then
    cxGridEventsTableTableView.ApplyBestFit();
end;

procedure TfrmMain.SelectStorage(AIndex: Integer);
var
  AVisible: Boolean;
begin
  case AIndex of
    0:
    begin
     nbgDataBinding.SelectedLinkIndex := 0;
     Scheduler.Storage := UnboundStorage;
    end;
    1:
    Scheduler.Storage := DBStorage;
  else
    Scheduler.Storage := AggregateStorage;
  end;
  AVisible := (AIndex <> 0) or ((CurrentLink <> nil) and (CurrentLink.Item = nbiGridConnection));
  cxGridEventsTable.Visible := AVisible;
  cxGridSplitter.Visible := AVisible;
  pcControlBox.ActivePage := FindTabByNavBarItem;
  cbxReminderByResource.Checked := Scheduler.Storage.Reminders.ReminderByResource;
end;

procedure TfrmMain.SetSchedulerFocused;
begin
  if CanSchedulerFocus then
    Scheduler.SetFocus;
end;

procedure TfrmMain.SetupTimeZonesInfo;
var
  I: Integer;
begin
  cbxCurrentZone.Properties.Items.AddObject('System Default', TObject(-1));
  for I := 0 to TcxSchedulerDateTimeHelper.TimeZoneCount - 1 do
    cbxCurrentZone.Properties.Items.AddObject(TcxSchedulerDateTimeHelper.TimeZoneInfo(I).Display, TObject(I));
  cbxCurrentZone.ItemObject := TObject(Scheduler.OptionsView.CurrentTimeZone);
  cbxAdditionalZone.Properties.Items.AddObject('None', TObject(-1));
  for I := 0 to TcxSchedulerDateTimeHelper.TimeZoneCount - 1 do
    cbxAdditionalZone.Properties.Items.AddObject(TcxSchedulerDateTimeHelper.TimeZoneInfo(I).Display, TObject(I));
  cbxAdditionalZone.ItemObject := TObject(Scheduler.OptionsView.AdditionalTimeZone);
  cbAdditionalDST.Checked := Scheduler.OptionsView.AdditionalTimeZoneDaylightSaving;
  cbCurrentDST.Checked := Scheduler.OptionsView.CurrentTimeZoneDaylightSaving;
end;

procedure TfrmMain.SyncDBMode;
begin
  DBStorage.SmartRefresh := cbxSmartRefresh.Checked or (cbxDataBase.ItemIndex = 0);
end;

procedure TfrmMain.SyncEventsMenuItemsVisibility;
begin
  dxbarResourcesGroup.Enabled := Scheduler.Storage.ResourceCount > 0;
  dxbarEventsGroup.Enabled := not dxbtnReadOnly.Down;
end;

procedure TfrmMain.SyncEventsMenuWithScheduler;
begin
  with Scheduler.EventOperations do
  begin
    dxbtnCreating.Down := Creating;
    dxbtnDeleting.Down := Deleting;
    dxbtnDialogEditing.Down := DialogEditing and DialogShowing;
    dxbtnInplaceEditing.Down := InplaceEditing;
    dxbtnIntersection.Down := Intersection;
    dxbtnMoving.Down := Moving;
    dxbtnMovingBetweenResource.Down := MovingBetweenResources;
    dxbtnReadOnly.Down := ReadOnly;
    dxbtnRecurrence.Down := Recurrence;
    dxbtnSharing.Down := SharingBetweenResources;
    dxbtnSizing.Down := Sizing;
  end;
  SyncEventsMenuItemsVisibility;
end;

procedure TfrmMain.SyncMenus;
begin
  SyncEventsMenuWithScheduler;
  SyncOptionsWithScheduler;
  SyncScales;
end;

procedure TfrmMain.SyncNavBarActiveViewIndex;
begin
  if dxbtnDayView.Down then
    nbgLayoutFeatures.SelectedLinkIndex := 0;
  if dxbtnWorkWeek.Down then
    nbgLayoutFeatures.SelectedLinkIndex := 1;
  if dxbtnWeekView.Down then
    nbgLayoutFeatures.SelectedLinkIndex := 2;
  if dxbtnMonthView.Down then
    nbgLayoutFeatures.SelectedLinkIndex := 3;
  if dxbtnTimeGridView.Down then
    nbgLayoutFeatures.SelectedLinkIndex := 4;
  if dxbtnYearView.Down then
    nbgLayoutFeatures.SelectedLinkIndex := 5;
  if dxbtnGanttView.Down then
    nbgLayoutFeatures.SelectedLinkIndex := 6;
end;

procedure TfrmMain.SyncNavBarDataBindingIndex;
begin
  if Scheduler.Storage = AggregateStorage then
    nbgDataBinding.SelectedLinkIndex := 2
  else
    if Scheduler.Storage = DBStorage then
      nbgDataBinding.SelectedLinkIndex := 1
    else
      nbgDataBinding.SelectedLinkIndex := 0;
end;

procedure TfrmMain.SyncOptionsWithScheduler;
begin
  dxbtnAllDayEventsContainer.Down := Scheduler.ViewDay.HeaderContainer;
  dxbtnWorkTimeOnly.Down := Scheduler.ViewDay.WorkTimeOnly;
  dxbtnTimeRulerMinutes.Down := Scheduler.ViewDay.TimeRulerMinutes;
  dxbtnDayHeader.Down := Scheduler.ViewDay.DayHeaderArea;
  dxbtnSingleColumn.Down := Boolean(Scheduler.ViewWeek.DaysLayout);
  dxbtnWeekCompressWeekends.Down := Scheduler.ViewWeek.CompressWeekEnd;
  dxbtnWeekTimeAsClock.Down := Scheduler.ViewWeek.ShowTimeAsClock;
  dxbtnMonthCompressWeekends.Down := Scheduler.ViewWeeks.CompressWeekEnd;
  dxbtnMonthTimeAsClock.Down := Scheduler.ViewWeeks.ShowTimeAsClock;
  dxbtnWorkDaysOnly.Down := Scheduler.ViewTimeGrid.WorkDaysOnly;
  dxbtnTimeGridWorkTimeOnly.Down := Scheduler.ViewTimeGrid.WorkTimeOnly;
  dxbtnDetailInfo.Down := Scheduler.ViewTimeGrid.EventDetailInfo;
  dxbtnTimeGridSnapEventsToTimeSlots.Down := Scheduler.ViewTimeGrid.SnapEventsToTimeSlots;
  dxbtnAllDayEventsOnly.Down := Scheduler.ViewYear.AllDayEventsOnly;
  dxbtnAllDayAreaScrollBarDefault.Down := Scheduler.ViewDay.AllDayAreaScrollBar = adsbDefault;
  dxbtnAllDayAreaScrollBarNever.Down := Scheduler.ViewDay.AllDayAreaScrollBar = adsbNever;
  dxbtnAllDayAreaScrollBarAlways.Down := Scheduler.ViewDay.AllDayAreaScrollBar = adsbAlways;
  dxbtnSelectOnRightClick.Down := Scheduler.OptionsBehavior.SelectOnRightClick;
  dxbtnGanttHotTrack.Down := Scheduler.OptionsBehavior.HotTrack;
  dxbtnGanttShowAsProgress.Down := Scheduler.ViewGantt.EventsStyle = esProgress;
  dxbtnShowEvents.Down := not Scheduler.ViewDay.ShowAllDayEventsInContentArea;
  dxbtnGanttViewShowExpandButton.Down := Scheduler.ViewGantt.ShowExpandButtons;
  dxbtnGanttViewSnapEventsToTimeSlots.Down := Scheduler.ViewGantt.SnapEventsToTimeSlots;
  ccbHolidayColor.ColorValue := Scheduler.DateNavigator.HolidayColor;
  cbxEventsStyle.ItemIndex := Integer(Scheduler.ViewGantt.EventsStyle);
end;

procedure TfrmMain.SyncScheduler;
begin
  SyncSchedulerWithEventsMenu;
  if Assigned(frmInspector) then
    frmInspector.cxRTTIInspector.LayoutChanged;
end;

procedure TfrmMain.SyncScales;
const
  AMajorUnits: array[TcxSchedulerTimeGridScaleUnit] of Integer =
    (0, 0, 1, 2, 3, 4);
  AMinorUnits: array[TcxSchedulerTimeGridScaleUnit] of Integer =
    (0, 1, 2, 2, 3, 3);
begin
  with Scheduler.ViewTimeGrid.Scales do
  begin
    dxbtnMajorUnit.ItemIndex := AMajorUnits[MajorUnit];
    dxbtnMinorUnit.ItemIndex := AMinorUnits[MinorUnit];
  end;
end;

procedure TfrmMain.SyncSchedulerWithEventsMenu;
begin
  with Scheduler.EventOperations do
  begin
    Creating := dxbtnCreating.Down;
    Deleting := dxbtnDeleting.Down;
    DialogEditing := dxbtnDialogEditing.Down;
    DialogShowing := dxbtnDialogEditing.Down;
    InplaceEditing := dxbtnInplaceEditing.Down;
    Intersection := dxbtnIntersection.Down;
    Moving := dxbtnMoving.Down;
    MovingBetweenResources := dxbtnMovingBetweenResource.Down;
    ReadOnly := dxbtnReadOnly.Down;
    Recurrence := dxbtnRecurrence.Down;
    SharingBetweenResources := dxbtnSharing.Down;
    Sizing := dxbtnSizing.Down;
  end;
  SyncEventsMenuItemsVisibility;
end;

procedure TfrmMain.SyncSchedulerWithOptions;
const
  cxEventsStyle: array [Boolean] of TcxSchedulerGanttViewEventStyle = (esDefault, esProgress);

  function GetAllDayAreaScrollBarMenuState: TcxSchedulerAllDayAreaScrollBar;
  begin
    if dxbtnAllDayAreaScrollBarDefault.Down then
      Result := adsbDefault
    else
      if dxbtnAllDayAreaScrollBarNever.Down then
        Result := adsbNever
      else
        Result := adsbAlways;
  end;

begin
  Scheduler.ViewDay.HeaderContainer := dxbtnAllDayEventsContainer.Down;
  Scheduler.ViewDay.DayHeaderArea := dxbtnDayHeader.Down;
  Scheduler.ViewDay.WorkTimeOnly := dxbtnWorkTimeOnly.Down;
  Scheduler.ViewDay.TimeRulerMinutes := dxbtnTimeRulerMinutes.Down;
  Scheduler.ViewWeek.DaysLayout :=  TcxSchedulerWeekViewDaysLayout(dxbtnSingleColumn.Down);
  Scheduler.ViewWeek.CompressWeekEnd := dxbtnWeekCompressWeekends.Down;
  Scheduler.ViewWeek.ShowTimeAsClock := dxbtnWeekTimeAsClock.Down;
  Scheduler.ViewWeeks.CompressWeekEnd := dxbtnMonthCompressWeekends.Down;
  Scheduler.ViewWeeks.ShowTimeAsClock := dxbtnMonthTimeAsClock.Down;
  Scheduler.ViewTimeGrid.WorkDaysOnly := dxbtnWorkDaysOnly.Down;
  Scheduler.ViewTimeGrid.WorkTimeOnly := dxbtnTimeGridWorkTimeOnly.Down;
  Scheduler.ViewTimeGrid.EventDetailInfo := dxbtnDetailInfo.Down;
  Scheduler.ViewTimeGrid.SnapEventsToTimeSlots := dxbtnTimeGridSnapEventsToTimeSlots.Down;
  Scheduler.ViewYear.AllDayEventsOnly :=  dxbtnAllDayEventsOnly.Down;
  Scheduler.ViewDay.AllDayAreaScrollBar := GetAllDayAreaScrollBarMenuState;
  Scheduler.OptionsBehavior.SelectOnRightClick := dxbtnSelectOnRightClick.Down;
  Scheduler.OptionsBehavior.HotTrack := dxbtnGanttHotTrack.Down;
  Scheduler.ViewGantt.ShowExpandButtons := dxbtnGanttViewShowExpandButton.Down;
  Scheduler.ViewGantt.EventsStyle := cxEventsStyle[dxbtnGanttShowAsProgress.Down];
  Scheduler.ViewGantt.SnapEventsToTimeSlots := dxbtnGanttViewSnapEventsToTimeSlots.Down;
  Scheduler.ViewDay.ShowAllDayEventsInContentArea := not dxbtnShowEvents.Down;
  Scheduler.DateNavigator.HolidayColor := ccbHolidayColor.ColorValue;
end;

procedure TfrmMain.SyncSchedulerWithViewMenuItems;
begin
  Scheduler.ControlBox.Visible := dxbtnControlBox.Down;
  Scheduler.DateNavigator.Visible := dxbtnNavigator.Down;
end;

procedure TfrmMain.SyncStyles(ASelect: Boolean);

   function GetStyle(AStyle: TcxStyle): TcxStyle;
   begin
     Result := nil;
     if ASelect then
       Result := AStyle
   end;

begin
  Scheduler.Styles.Event := GetStyle(stEvents);
  Scheduler.Styles.DayHeader := GetStyle(stHeaders);
  Scheduler.Styles.Content := GetStyle(stContent);
  Scheduler.Styles.Selection := GetStyle(stContentSelection);
  Scheduler.Styles.ResourceHeader := GetStyle(stResources);
  Scheduler.Styles.GroupSeparator := GetStyle(stGroupSeparator);
  Scheduler.ViewDay.Styles.HeaderContainer := GetStyle(stContainer);
  Scheduler.ViewDay.Styles.TimeRuler := GetStyle(stTimeRuler);
  Scheduler.DateNavigator.Styles.Header := GetStyle(stHeaders);
  Scheduler.DateNavigator.Styles.Background := GetStyle(stBackground);
  Scheduler.DateNavigator.Styles.Content := GetStyle(stDateContent);
  Scheduler.ViewTimeGrid.Styles.MajorScale := GetStyle(stDateContent);
  Scheduler.ViewTimeGrid.Styles.MinorScale := GetStyle(stHeaders);
  Scheduler.ViewTimeGrid.Styles.MajorScaleUnitSeparator := GetStyle(stTimeRuler);
  Scheduler.ViewYear.Styles.MonthHeader := GetStyle(stHeaders);
  Scheduler.ViewYear.Styles.UnusedContent := GetStyle(stTimeRuler);
end;

procedure TfrmMain.SyncViewMenuItemsWithScheduler;
begin
  dxbtnControlBox.Down := Scheduler.ControlBox.Visible;
  dxbtnNavigator.Down := Scheduler.DateNavigator.Visible;
end;

procedure TfrmMain.ValidateActiveView;
begin
  if (CurrentLink = nil) or (CurrentLink.Item <> nbiGanttView) and Scheduler.ViewGantt.Active then
  begin
    Scheduler.ViewTimeGrid.Active := True;
    SelectStorage(0);
  end;
end;

function TfrmMain.CanSchedulerFocus: Boolean;
begin
  with Scheduler, Storage.Reminders do
    Result := CanFocusEx and not (IsReminderWindowShown and (ReminderWindow = Screen.ActiveForm));
end;

//  Event and Actions Handlers

procedure TfrmMain.FormCreate(Sender: TObject);
var
  ADate: TDateTime;
begin
  pcControlBox.HideTabs := True;
  LinkTabsToNavBarItems;
  SelectStorage(0);
  AppDir := GetCurrentDir + '\';
  SelectDataBase(0);
  ADate := EncodeDate(2008, 2, 28);
  Scheduler.GoToDate(ADate);
  ADate := ADate + Scheduler.OptionsView.WorkStart;
  Scheduler.SelectTime(ADate, ADate, nil);
  SyncNavBarActiveViewIndex;
  SyncNavBarDataBindingIndex;
  LoadUnboundData;
  SyncCustomDraw(False);
  SyncCustomPopupMenus(False);
  CalcDaysOff;
  Scheduler.FullRefresh;
  SetupTimeZonesInfo;
  nbgNew.SelectedLinkIndex := 0;
  dxNavBarLinkPress(dxNavBar, nbgNew.Links[0]);
  acAggregate.Execute;
  CreateSkinsMenuItems(dxBarManager, dxbtnStyle, cxLFController, dxNavBar);
  CreateHelpMenuItems(dxBarManager, dxbtnHelp);
end;

procedure TfrmMain.dxbtnInspectorClick(Sender: TObject);
var
  ABounds: TRect;
begin
  if (Sender as TdxBarButton).Down then
  begin
    ABounds := Screen.MonitorFromPoint(Point(Left, Top)).BoundsRect;
    frmInspector.OnHide := OnHideInspector;
    frmInspector.OnChanged := OnInspectorChanged;
    frmInspector.Left := ABounds.Right - frmInspector.Width;
    frmInspector.Top := ABounds.Bottom - frmInspector.Height;
    frmInspector.cxRTTIInspector.InspectedObject := Scheduler;
    frmInspector.Show;
  end
  else
  begin
    frmInspector.OnChanged := nil;
    frmInspector.OnHide := nil;
    frmInspector.Hide;
  end;
end;

procedure TfrmMain.CalcDaysOff;
var
  I, J: Integer;
begin
  I := Ord(cxFormatController.StartOfWeek)+ Ord(dSunday);
  J := Ord(dSunday) - I;
  if J < 0 then Inc(J, 7);
  FDaysOffIndexes[1] := J;
  J := Ord(dSaturday) - I;
  if J < 0 then Inc(J, 7);
  FDaysOffIndexes[2] := J;
end;

function TfrmMain.GetCaptionText: string;
var
  APos: Integer; 
const
  Views: array[0..6] of string =
    ('Day', 'Work Week', 'Week', 'Month', 'TimeGrid', 'Year', 'Gantt');
  Other: array[0..7] of string =
    ('Active Reminders', 'Different Time Zones', 'Custom Visual Styles',
     'Custom Draw', 'Custom Editors', 'Custom Pop-up Menus', 'Holidays', 'Grid Connection');
begin
  if (CurrentLink <> nil) and (CurrentLink.Group.Index = 2) and (dxNavBar.ActiveGroupIndex = 2) then
    Result := Other[CurrentLink.Index]
  else
    if (CurrentLink <> nil) and (CurrentLink.Group.Index = 0) and (dxNavBar.ActiveGroupIndex = 0) then
    begin
      Result := CurrentLink.Item.Caption;
      APos := Pos(' (New)', Result);
      if APos > 0 then
        Delete(Result, APos, 128);
      APos := Pos(' (Updated)', Result);
      if APos > 0 then
        Delete(Result, APos, 128);
    end
    else
    begin
      if Scheduler.ViewDay.Active then
        Result := Views[0]
      else
        if Scheduler.ViewWeek.Active then
          Result := Views[2]
        else
          if Scheduler.ViewWeeks.Active then
            Result := Views[3]
          else
            if Scheduler.ViewTimeGrid.Active then
              Result := Views[4]
            else
              if Scheduler.ViewYear.Active then
                Result := Views[5]
              else
                if Scheduler.ViewGantt.Active then
                  Result := Views[6];
       Result := Result + ' View';
    end;
end;

function TfrmMain.GetSyncField: TcxCustomSchedulerStorageField;
begin
  Result := Scheduler.Storage.GetFieldByName('SyncID');
end;

procedure TfrmMain.GridConnectionState(AActive: Boolean);
const
  scxGridConnectionMessage = 'The TcxSchedulerGridConnection component allows you ' +
    'to connect the ExpressScheduler and ExpressQuantumGrid controls,' +
    ' so the ExpressQuantumGrid can be used similarly to the Tasks pane ' +
    'in Microsoft Office® 2007.';
begin
  if AActive then
    MessageDlg(scxGridConnectionMessage, mtInformation, [mbOK], 0);
  Scheduler.BeginUpdate;
  try
    if AActive then
    begin
      FPrevStorage := Scheduler.Storage;
      SelectStorage(0);
      cxGridEventsTableLevel2.Active := True;
      cxGridEventsTable.Visible := AActive;
    end
    else
    begin
      SelectStorage(FPrevStorage.Tag);
      cxGridEventsTableLevel1.Active := True;
    end;
    GridConnection.Active := AActive;
  finally
    Scheduler.EndUpdate;
  end;
end;

procedure TfrmMain.dxNavBarGroupClick(Sender: TObject;
  AGroup: TdxNavBarGroup);
begin
  if AGroup = nbgStandaloneDateNavigator then
    cxDateNavigator1.Scheduler := Scheduler
  else
    cxDateNavigator1.Scheduler := nil;
end;

procedure TfrmMain.acViewTypeExecute(Sender: TObject);
var
  ADate: TDateTime;
  APrevView: TcxSchedulerCustomView;
begin
  if LockUpdate then Exit;
  APrevView := Scheduler.CurrentView;
  ADate := Trunc(Scheduler.SelStart);
  if (ADate > EncodeDate(2008, 2, 28)) or (ADate < EncodeDate(2008, 2, 28) - 30) then
    ADate := EncodeDate(2008, 2, 28);
  case TAction(Sender).Tag of
    0:
      Scheduler.GoToDate(ADate, vmDay);
    1:
      Scheduler.GoToDate(ADate, vmWorkWeek);
    2:
      Scheduler.GoToDate(ADate, vmWeek);
    3:
      Scheduler.GoToDate(ADate, vmMonth);
    4:
      begin
        Scheduler.SelectedDays.Clear;
        Scheduler.SelectedDays.Add(ADate);
        Scheduler.ViewTimeGrid.Active := True;
      end;
    5:
      Scheduler.ViewYear.Active := True;
    6:
      begin
        FPrevStorage := Scheduler.Storage;
        SelectStorage(0);
        Scheduler.Storage := SchedulerGanttStorage;
        if Scheduler.ViewGantt.VisibleStart = NullDate then
          Scheduler.SelectDays(Today - 10, Today - 10);
        Scheduler.ViewGantt.Active := True;
      end;
  end;
  if (TAction(Sender).Tag <> 6) and (APrevView is TcxSchedulerGanttView) then
  begin
    SelectStorage(FPrevStorage.Tag);
    Scheduler.Storage := FPrevStorage;
  end;
  Scheduler.LayoutChanged;
  SchedulerViewTypeChanged(Scheduler, APrevView, Scheduler.CurrentView);
end;

procedure TfrmMain.SchedulerViewTypeChanged(
  Sender: TObject; APrevView, ANewView: TcxSchedulerCustomView);

  function IsWorkWeekActive: Boolean;
  var
    I: Integer;
    ADays: TDays;
  begin
    with Scheduler do
    begin
      Result := SelectedDays.Count < 7;
      ADays := [];
      for I := 0 to SelectedDays.Count - 1 do
        ADays := ADays + [TDay(DayOfWeek(SelectedDays[I]) - 1)];
      Result := Result and (ADays * OptionsView.WorkDays = OptionsView.WorkDays);
    end;
  end;

begin
  if LockUpdate then Exit;
  LockUpdate := True;
  try
    if ANewView is TcxSchedulerDayView then
    begin
      dxbtnDayView.Down := not IsWorkWeekActive;
      dxbtnWorkWeek.Down := IsWorkWeekActive;
    end;
    dxbtnWeekView.Down := ANewView is TcxSchedulerWeekView;
    dxbtnMonthView.Down := ANewView is TcxSchedulerWeeksView;
    dxbtnTimeGridView.Down := (ANewView is TcxSchedulerTimeGridView) and not (ANewView is TcxSchedulerGanttView);
    dxbtnYearView.Down := ANewView is TcxSchedulerYearView;
    dxbtnGanttView.Down := ANewView is TcxSchedulerGanttView;
    SyncNavBarActiveViewIndex;
  finally
    LockUpdate := False;
  end;
  pbHintPanel.Invalidate;
end;

procedure TfrmMain.pbHintPanelPaint(Sender: TObject);
var
  R: TRect;
  DC: HDC;
  AColor: TColor;
  AInfo: TdxSkinInfo;
begin
  R := (Sender as TPaintBox).ClientRect;
  DC := (Sender as TPaintBox).Canvas.Handle;
  AColor := ColorToRgb(clWhite);
  if Scheduler.LookAndFeel.Painter.GetPainterData(AInfo) then
  begin
    AInfo.NavPaneGroupCaption.Draw(DC, R);
    if AInfo.NavPaneGroupCaption.TextColor <> clDefault then
      AColor := AInfo.NavPaneGroupCaption.TextColor;
  end
  else
    if (Scheduler.LookAndFeel.Kind = lfOffice11) or (Scheduler.LookAndFeel.NativeStyle) then
      FillGradientRect(DC, R, dxOffice11NavPaneHeaderColor1, dxOffice11NavPaneHeaderColor2, False)
    else
      FillRect(DC, R, GetStockObject(GRAY_BRUSH));
  FrameRect(DC, R, GetStockObject(BLACK_BRUSH));
  Inc(R.Left, cxTextOffset + 1);
  SetBkMode(DC, Transparent);
  SetTextColor(DC, AColor);
  DrawText(DC, PChar(CaptionText), Length(CaptionText), R, DT_VCENTER or DT_SINGLELINE);
end;

procedure TfrmMain.OnDataBindingClick(Sender: TObject);
var
  AView: TcxSchedulerCustomView;
begin
  with AggregateStorage.Links do
  begin
    Clear;
    if TAction(Sender).Tag = 2 then
    begin
      DefaultLink := AddStorageLink(UnboundStorage);
      AddStorageLink(DBStorage);
    end;
  end;
  SelectStorage(TAction(Sender).Tag);
  SyncNavBarDataBindingIndex;
  AView := Scheduler.CurrentView;
  if AView is TcxSchedulerGanttView then
  begin
    AView := Scheduler.ViewDay;
    AView.Active := True;
  end;
  SchedulerViewTypeChanged(Scheduler, AView, Scheduler.CurrentView);
end;

procedure TfrmMain.btnGenerateMoreEventsClick(Sender: TObject);
var
  I: Integer;
  ADate: TDateTime;
  AType: Integer;
  AEvent: TcxSchedulerEvent;
begin
  frmProgress := TfrmProgress.Create(nil);
  try
    frmProgress.Show;
    EventsTable.DisableControls;
    DBConnection.BeginTrans;
    try
      AEvent := TcxSchedulerControlEvent.Create(DBStorage);
      EventsCommand.CommandText := 'Insert Into Events ([Start], [Finish], [Caption],' +
         '[State], [LabelColor], [ActualStart], [ActualFinish], [SportID], [ResourceID]) Values(:Start, :Finish,' +
         ' :Caption, :State, :LabelColor, :ActualStart, :ActualFinish, :SportID, :ResourceID);';
      EventsCommand.Parameters.CreateParameter('Start', ftDateTime, pdInput, 4, varNull);
      EventsCommand.Parameters.CreateParameter('Finish', ftDateTime, pdInput, 4, varNull);
      EventsCommand.Parameters.CreateParameter('Caption', ftWideString, pdInput, 255, varNull);
      EventsCommand.Parameters.CreateParameter('State', ftInteger, pdInput, 4, varNull);
      EventsCommand.Parameters.CreateParameter('LabelColor', ftInteger, pdInput, 4, varNull);
      EventsCommand.Parameters.CreateParameter('ActualStart', ftDateTime, pdInput, 4, varNull);
      EventsCommand.Parameters.CreateParameter('ActualFinish', ftDateTime, pdInput, 4, varNull);
      EventsCommand.Parameters.CreateParameter('SportID', ftInteger, pdInput, 4, varNull);
      EventsCommand.Parameters.CreateParameter('ResourceID', ftInteger, pdInput, 4, varNull);
      EventsCommand.Prepared := True;
      Randomize;
      for I := 0 to GenerateCount - 1 do
      begin
        ADate := EncodeDate(2008, 2, 28) + EncodeTime(Random(11), Random(60), 0, 0) + Random(365 * 10);
        AEvent.Start := ADate;
        if not (I mod 100 = 0) then
           AEvent.Duration := Random(120) * MinuteToTime
        else
        begin
           AEvent.Start := Trunc(ADate);
           AEvent.Finish := Trunc(ADate) + 1;
           AEvent.AllDayEvent := True;
        end;
        AEvent.State := Random(4);
        AEvent.LabelColor := EventLabelColors[Random(11)];
        AType := Random(Length(StartIndexes));
        AEvent.Caption := SportEvents[StartIndexes[Atype] + Random(EventsCount[AType])];
        EventsCommand.Parameters[0].Value := Double(AEvent.Start);
        EventsCommand.Parameters[1].Value := Double(AEvent.Finish);
        EventsCommand.Parameters[2].Value := AEvent.Caption;
        EventsCommand.Parameters[3].Value :=  AEvent.State;
        EventsCommand.Parameters[4].Value := AEvent.LabelColor;
        EventsCommand.Parameters[5].Value := Trunc(ADate);
        EventsCommand.Parameters[6].Value := Trunc(ADate) + 1;
        EventsCommand.Parameters[7].Value := AType;
        EventsCommand.Parameters[8].Value := Random(DBStorage.ResourceCount);
        EventsCommand.Execute;
        frmProgress.UpdateProgress(MulDiv(I, 100, GenerateCount));
      end;
      AEvent.Free;
    finally
      DBConnection.CommitTrans;
      EventsTable.EnableControls;
      SelectDataBase(1);
    end;
  finally
    Scheduler.SetFocus;
    frmProgress.Free;
  end;
end;

procedure TfrmMain.cbxDataBaseClick(Sender: TObject);
begin
  btnGenerateMoreEvents.Enabled := cbxDataBase.ItemIndex <> 0;
  btnDeleteAll.Enabled := cbxDataBase.ItemIndex <> 0;
  cbxSmartRefresh.Enabled := cbxDataBase.ItemIndex <> 0;
  SyncDBMode;
  SelectDataBase(cbxDataBase.ItemIndex);
end;

procedure TfrmMain.cbxDBModeClick(Sender: TObject);
begin
  SyncDBMode;
end;

procedure TfrmMain.btnDeleteAllClick(Sender: TObject);
begin
  DeleteEvents(True);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
var
  AFileStream: TFileStream;
begin
  FSkinsBarMenuItems.Free;
  DBConnection.Connected := False;
  try
    AFileStream := TFileStream.Create(AppDir + 'Data\Temporary.mdb', fmCreate);
    try
      GetResourceStream('DATABASETEMPLATE', AFileStream);
    finally
      AFileStream.Free;
    end;
  except
    on EFCreateError do;
  end;
end;

procedure TfrmMain.ExportToExecute(Sender: TObject);
var
  AType: Integer;
  AExt, AFileName: string;
const
  AExtensions: array[0..3] of string = ('.html', '.xml', '.xls', '.txt');
begin
  AType := TAction(Sender).Tag;
  dlgExportTo.FilterIndex := AType + 1;
  dlgExportTo.FileName := 'ExpressScheduler' + AExtensions[AType];
  if not dlgExportTo.Execute then Exit;
  AFileName := dlgExportTo.FileName;
  AExt := UpperCase(ExtractFileExt(AFileName));
  if (AExt = '') and (dlgExportTo.FilterIndex <> (AType + 1)) and (dlgExportTo.FilterIndex in [1..4]) then
    AType := dlgExportTo.FilterIndex - 1;
  ChangeFileExt(AFileName, AExtensions[AType]);
  case AType of
    0:
      cxExportSchedulerToHTML(AFileName, Scheduler);
    1:
      cxExportSchedulerToXML(AFileName, Scheduler);
    2:
      cxExportSchedulerToExcel(AFileName, Scheduler);
    3:
      cxExportSchedulerToText(AFileName, Scheduler);
  end;
  if MessageDlg('Open File ' + AFileName + ' ?', mtConfirmation, [mbOK, mbCancel], 0) = mrOK then
    ShellExecute(Handle, PChar('OPEN'), PChar(AFileName), nil, nil, SW_SHOWMAXIMIZED);
end;

procedure TfrmMain.SynchronizeWithExecute(Sender: TObject);
begin
  if TAction(Sender).Tag = 0 then
    cxSchedulerSynchronizeOutlookWithStorage(Scheduler.Storage, SyncField)
  else
    cxSchedulerSynchronizeStorageWithOutlook(Scheduler.Storage, SyncField);
end;

procedure TfrmMain.PrintingExecute(Sender: TObject);
const
  sdxExpressPrintingMessage = 'The ExpressPrinting System allows you to render and ' +
    'print the contents of the ExpressScheduler, as well as a number of' +
    ' other Developer Express controls. This component library is not part of ' +
    'the ExpressScheduler Suite and can be acquired separately via our site at: www.devexpress.com.';
begin
  MessageDlg(sdxExpressPrintingMessage, mtInformation, [mbOK], 0);
  pslnkScheduler.Component := Scheduler;
  pslnkScheduler.Active := False;
  pslnkScheduler.Active := True;
  case TAction(Sender).Tag of
    0:
      pslnkScheduler.Preview();
    1:
      pslnkScheduler.Print(True, nil);
  end;
end;

procedure TfrmMain.EventsClick(Sender: TObject);
begin
  SyncScheduler;
end;

procedure TfrmMain.RemindersOpenEvent(
  Sender: TcxSchedulerReminders; AEvent: TcxSchedulerControlEvent);
begin
  Scheduler.EditEventUsingDialog(AEvent);
end;

procedure TfrmMain.GroupByClick(Sender: TObject);
const
  AKind: array[0..2] of TcxSchedulerGroupingKind = (gkNone, gkByDate, gkByResource);
begin
  Scheduler.OptionsView.GroupingKind := AKind[TdxBarButton(Sender).Tag];
end;

procedure TfrmMain.dxbtnViewItemClick(Sender: TObject);
begin
  SyncSchedulerWithViewMenuItems;
end;

procedure TfrmMain.SchedulerInitEventImages(Sender: TcxCustomScheduler;
  AEvent: TcxSchedulerControlEvent; AImages: TcxSchedulerEventImages);
var
  AField: TcxCustomSchedulerStorageField;
begin
  AField := Scheduler.Storage.GetFieldByName('SportID');
  if AField <> nil then
  begin
    if not VarIsNull(AEvent.Values[AField.Index]) and not VarIsEmpty(AEvent.Values[AField.Index]) then
      AImages.Add(AEvent.Values[AField.Index]);
  end;
end;

procedure TfrmMain.ResPerPageClick(Sender: TObject);
begin
  Scheduler.OptionsView.ResourcesPerPage := TdxBarButton(Sender).Tag;
  if TdxBarButton(Sender).Tag = 0 then
    Scheduler.ResourceNavigator.Visibility := snvNever
  else
    Scheduler.ResourceNavigator.Visibility := snvAuto;
end;

procedure TfrmMain.ActionsExecute(Sender: TObject);
begin
//
end;

procedure TfrmMain.dxNavBarLinkPress(Sender: TObject;
  ALink: TdxNavBarItemLink);

  function CheckItemLink(AItem: TdxNavBarItem): Boolean;
  begin
    Result := (FPrevLink <> nil) and
      (FPrevLink.Item = AItem) and (ALink.Item <> AItem);
  end;

begin
  Scheduler.LayoutChanged;
  if (ALink <> nil) and (ALink.Item = nbiAggregate) then
  begin
    UnboundStorage.Reminders.Active := False;
    DBStorage.Reminders.Active := False;
  end;
  CurrentLink := ALink;
  SyncStyles(ALink.Item = nbiStyles);
  SyncCustomDraw(ALink.Item = nbiCustomDraw);
  SyncCustomPopupMenus(ALink.Item = nbiCustomPopupMenus);
  Scheduler.OptionsView.ShowAdditionalTimeZone := ALink.Item = nbiDifferentTimeZones;
  if Scheduler.OptionsView.ShowAdditionalTimeZone then
  begin
    Scheduler.ViewDay.Active := True;
    Scheduler.SelectDays(Trunc(Scheduler.SelStart), Trunc(Scheduler.SelStart), True);
  end;
  if ALink.Item = nbiCustomEditors then
  begin
    PrevStorage := Scheduler.Storage;
    cxEventEditorClass := TcxSchedulerEventCustomEditor;
  end
  else
  begin
    if Scheduler.Storage = UnboundStorageTwo then
      SelectStorage(0);
    cxEventEditorClass := TcxSchedulerEventEditor;
  end;
  if CheckItemLink(nbiHolidays) then
  begin
    SelectStorage(FPrevStorage.Tag);
    Scheduler.Storage := FPrevStorage;
  end;
  if CheckItemLink(nbiGridConnection) then
    GridConnectionState(False);
  pcControlBox.ActivePage := FindTabByNavBarItem;
  FPrevLink := ALink;
  ValidateActiveView;
  Scheduler.Storage.Reminders.Active := ALink.Item = nbiReminders;
end;

procedure TfrmMain.dxNavBarMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  pbHintPanel.Invalidate;
end;

procedure TfrmMain.dxNavBarMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  pbHintPanel.Invalidate;
end;

procedure TfrmMain.OptionsClick(Sender: TObject);
begin
  SyncSchedulerWithOptions;
end;

procedure TfrmMain.dxNavBarActiveGroupChanged(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to dxNavBar.Groups.Count - 1 do
    dxNavBar.Groups.Items[I].Expanded := I = dxNavBar.ActiveGroupIndex;
  Scheduler.DateNavigator.Visible := dxNavBar.ActiveGroupIndex <> 3;
  Scheduler.ControlBox.Visible := (dxNavBar.ActiveGroupIndex <> 3) or (Scheduler.Storage = DBStorage);
  SyncViewMenuItemsWithScheduler;
  pbHintPanel.Invalidate;
end;

procedure TfrmMain.CorrectGanttEvents;
var
  I: Integer;
  ADate: TDateTime;
begin
  ADate := MaxInt;
  SchedulerGanttStorage.BeginUpdate;
  try
    for I := 0 to SchedulerGanttStorage.EventCount - 1 do
      ADate := Min(SchedulerGanttStorage.Events[I].Start, ADate);
    ADate := Today - ADate - 10;
    for I := SchedulerGanttStorage.EventCount - 1 downto 0 do
      with SchedulerGanttStorage.Events[I] do
        MoveTo(Start + ADate);
  finally
    SchedulerGanttStorage.EndUpdate;
  end;
end;

//------------------------------------------------------
//                  custom draw
//------------------------------------------------------
var
  TemporaryBitmap: TBitmap;
  GradientBitmap: TBitmap;
  W1, H1, C1, C2: Integer;

procedure FillGradientRect(ACanvas: TcxCanvas;
  const ARect: TRect; AColor1, AColor2: TColor; AHorizontal: Boolean);
begin
  with ARect do
  begin
    W1 := Right - Left;
    H1 := Bottom - Top;
    if (W1 < 1) or (H1 < 1) then Exit;
    if (GradientBitmap.Height <> H1) or (GradientBitmap.Width <> W1) or (AColor1 <> C1) or (AColor2 <> C2) then
    begin
      C1 := AColor1;
      C2 := AColor2;
      GradientBitmap.Height := H1;
      GradientBitmap.Width := W1;
      FillTubeGradientRect(GradientBitmap.Canvas.Handle, Rect(0, 0, W1, H1),
        AColor1, AColor2, AHorizontal);
    end;
    BitBlt(ACanvas.Handle, Left, Top, W1, H1, GradientBitmap.Canvas.Handle, 0, 0, srcCopy);
  end;
end;

procedure TfrmMain.SyncCustomDraw(ASetHandlers: Boolean);
begin
  if not ASetHandlers then
  begin
    Scheduler.OptionsView.DayBorderColor := clBlack;
    Scheduler.OptionsView.VertSplitterWidth := 5;
    Scheduler.Styles.VertSplitter := nil;
    Scheduler.Styles.HorzSplitter := nil;
    Scheduler.Styles.OnGetEventStyle := nil;
    Scheduler.ViewDay.Styles.HeaderContainer := nil;
    Scheduler.ViewDay.Styles.SelectedHeaderContainer := nil;
    Scheduler.ViewDay.EventShadows := True;
    Scheduler.OnCustomDrawBackground := nil;
    Scheduler.OnCustomDrawButton := nil;
    Scheduler.OnCustomDrawContent := nil;
    Scheduler.OnCustomDrawDayHeader := nil;
    Scheduler.OnCustomDrawEvent := nil;
    Scheduler.OnCustomDrawGroupSeparator := nil;
    Scheduler.OnCustomDrawResourceHeader := nil;
    Scheduler.ViewDay.OnCustomDrawContainer := nil;
    Scheduler.ViewDay.OnCustomDrawTimeRuler := nil;
    Scheduler.DateNavigator.OnCustomDrawBackground := nil;
    Scheduler.DateNavigator.OnCustomDrawContent := nil;
    Scheduler.DateNavigator.OnCustomDrawDayCaption := nil;
    Scheduler.DateNavigator.OnCustomDrawDayNumber := nil;
    Scheduler.DateNavigator.OnCustomDrawHeader := nil;
    Scheduler.ResourceNavigator.OnCustomDrawButton := nil;
  end
  else
  begin
    Scheduler.OptionsView.DayBorderColor := $B2A365;
    Scheduler.OptionsView.VertSplitterWidth := 8;
    Scheduler.Styles.VertSplitter := stCustomDrawVSeparator;
    Scheduler.Styles.HorzSplitter := stCustomDrawHSeparator;
    Scheduler.ViewDay.EventShadows := False;
    Scheduler.ViewDay.Styles.HeaderContainer := stCustomDrawContainer;
    Scheduler.ViewDay.Styles.SelectedHeaderContainer := stCustomDrawSelectedContainer;
    Scheduler.Styles.OnGetEventStyle := SchedulerStylesGetEventStyle;
    Scheduler.OnCustomDrawContent := SchedulerCustomDrawContent;
    Scheduler.OnCustomDrawEvent := SchedulerCustomDrawEvent;
    Scheduler.OnCustomDrawGroupSeparator := SchedulerCustomDrawGroupSeparator;
    Scheduler.OnCustomDrawDayHeader := SchedulerCustomDrawDayHeader;
    Scheduler.OnCustomDrawResourceHeader := SchedulerCustomDrawResourceHeader;
    Scheduler.DateNavigator.OnCustomDrawHeader := SchedulerDateNavigatorCustomDrawHeader;
    Scheduler.DateNavigator.OnCustomDrawDayCaption := SchedulerDateNavigatorCustomDrawDayCaption;
    Scheduler.DateNavigator.OnCustomDrawDayNumber := SchedulerDateNavigatorCustomDrawDayNumber;
    Scheduler.DateNavigator.OnCustomDrawContent := SchedulerDateNavigatorCustomDrawContent;
    Scheduler.ViewDay.OnCustomDrawTimeRuler := SchedulerViewDayCustomDrawTimeRuler;
    Scheduler.ResourceNavigator.OnCustomDrawButton := SchedulerResourceNavigatorCustomDrawButton;
  end;
end;

procedure TfrmMain.CheckTemporaryBitmapSize(AImages: TImageList);
begin
  if (TemporaryBitmap.Width <> AImages.Width) or (TemporaryBitmap.Height <> AImages.Height) then
  begin
    TemporaryBitmap.Width := AImages.Width;
    TemporaryBitmap.Height := AImages.Height;
  end;
end;

procedure TfrmMain.DrawParts(ACanvas: TcxCanvas; const R: TRect; AImages: TImageList; AState: Integer);


  procedure DrawPart(AIndex: Integer; ABounds: TRect; const ACheckBounds: TcxBorders = [];
    AHStretch: Boolean = False; AVStretch: Boolean = False);
  var
    ARgn: TcxRegion;
    ALeft, ATop: Integer;
  begin
    if (bLeft in ACheckBounds) then
      ABounds.Left := Max(ABounds.Left, R.Left + (R.Right - R.Left) div 2);
    if (bTop in ACheckBounds) then
      ABounds.Top := Max(ABounds.Top, R.Top + (R.Bottom - R.Top) div 2);
    if (bRight in ACheckBounds) then
      ABounds.Right := Min(ABounds.Right, R.Left + (R.Right - R.Left) div 2);
    if (bBottom in ACheckBounds) then
      ABounds.Bottom := Min(ABounds.Bottom, R.Top + (R.Bottom - R.Top) div 2);
    if not cxRectIsEmpty(ABounds) then
    begin
      ARgn := ACanvas.GetClipRegion;
      ACanvas.IntersectClipRect(ABounds);
      if AHStretch or AVStretch then
      begin
        if not AVStretch then
        begin
          if (bTop in ACheckBounds) then
            ABounds.Top := ABounds.Bottom - AImages.Height
          else
            ABounds.Bottom := ABounds.Top + AImages.Height;
        end;
        if not AHStretch then
        begin
          if (bLeft in ACheckBounds) then
            ABounds.Left := ABounds.Right - AImages.Width
          else
            ABounds.Right := ABounds.Left + AImages.Width;
        end;
        TemporaryBitmap.Canvas.Brush.Color := TemporaryBitmap.TransparentColor;
        TemporaryBitmap.Canvas.FillRect(cxRect(0, 0, AImages.Width, AImages.Height));
        AImages.GetBitmap(AIndex + (AState * 9), TemporaryBitmap);
        ACanvas.Canvas.StretchDraw(ABounds, TemporaryBitmap)
      end
      else
      begin
        if (bLeft in ACheckBounds) then
          ALeft := ABounds.Right - AImages.Width
        else
          ALeft := ABounds.Left;
        if (bTop in ACheckBounds) then
          ATop := ABounds.Bottom - AImages.Height
        else
          ATop := ABounds.Top;
        ACanvas.DrawImage(AImages, ALeft, ATop, AIndex + (AState * 9));
      end;
      ACanvas.SetClipRegion(ARgn, roSet);
    end;
  end;

begin
  CheckTemporaryBitmapSize(AImages);
  DrawPart(0, cxRect(R.Left, R.Top, R.Left + AImages.Width, R.Top + AImages.Height), [bRight, bBottom]);
  DrawPart(6, cxRect(R.Left, R.Bottom - AImages.Height, R.Left + AImages.Width, R.Bottom), [bRight, bTop]);
  DrawPart(2, cxRect(R.Right - AImages.Width, R.Top, R.Right, R.Top + AImages.Height), [bLeft, bBottom]);
  DrawPart(4, cxRect(R.Right - AImages.Width, R.Bottom - AImages.Height, R.Right, R.Bottom), [bLeft, bTop]);
  DrawPart(1, cxRect(R.Left + AImages.Width, R.Top, R.Right - AImages.Width, R.Top + AImages.Height), [bBottom], True, False);
  DrawPart(5, cxRect(R.Left + AImages.Width, R.Bottom - AImages.Height, R.Right - AImages.Width, R.Bottom), [bTop], True, False);
  DrawPart(8, cxRect(R.Left + AImages.Width, R.Top + AImages.Height, R.Right - AImages.Width, R.Bottom - AImages.Height), [], True, True);
  DrawPart(7, cxRect(R.Left, R.Top + AImages.Height, R.Left + AImages.Width, R.Bottom - AImages.Height), [bRight], False, True);
  DrawPart(3, cxRect(R.Right - AImages.Width, R.Top + AImages.Height, R.Right, R.Bottom - AImages.Height), [bLeft], False, True);
end;

procedure TfrmMain.SchedulerCustomDrawEvent(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxSchedulerEventCellViewInfo;
  var ADone: Boolean);
var
  AIsDetail: Boolean;
  AState: Integer;
  AColor: TColor;
begin
  if AViewInfo.Selected then Exit;
  AIsDetail := Scheduler.ViewDay.Active and not IsHeaderEvent(AViewInfo.Event);
  AState := AViewInfo.Event.Index mod 4;
  AColor := Dark(TcxStyle(srEventStyles.Items[AState]).Color, 70);
  if cxRectWidth(AViewInfo.Bounds) < 3 then
  begin
    ACanvas.Brush.Color := AColor;
    ACanvas.FillRect(AViewInfo.Bounds);
  end
  else
    DrawParts(ACanvas, AViewInfo.Bounds, imgEventImages, AState);
  if AIsDetail then
  begin
    AViewInfo.TimeLineRect := cxNullRect;
    ACanvas.Brush.Color := AColor;
    ACanvas.FillRect(cxRectInflate(AViewInfo.EventTimeRect, -2, 0));
  end;
  AViewInfo.Transparent := True;
  AViewInfo.Borders := [];
end;

procedure TfrmMain.SchedulerStylesGetEventStyle(Sender: TObject;
  AEvent: TcxSchedulerEvent; var AStyle: TcxStyle);
begin
  if (AEvent <> nil) and (AEvent.Index >= 0) then
    AStyle := TcxStyle(srEventStyles.Items[AEvent.Index mod 4]);
end;

procedure TfrmMain.SchedulerDateNavigatorCustomDrawHeader(Sender: TObject;
  ACanvas: TcxCanvas;
  AViewInfo: TcxSchedulerDateNavigatorMonthHeaderViewInfo;
  var ADone: Boolean);
begin
  DrawParts(ACanvas, AViewInfo.Bounds, imgParts, 0);
  AViewInfo.Transparent := True;
end;

procedure TfrmMain.SchedulerDateNavigatorCustomDrawDayCaption(
  Sender: TObject; ACanvas: TcxCanvas;
  AViewInfo: TcxSchedulerDateNavigatorDayCaptionViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.Index in [FDaysOffIndexes[1], FDaysOffIndexes[2]] then
    ACanvas.Font := stRed.Font;
end;

procedure TfrmMain.SchedulerDateNavigatorCustomDrawDayNumber(
  Sender: TObject; ACanvas: TcxCanvas;
  AViewInfo: TcxSchedulerDateNavigatorDayNumberViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.Selected then
    ACanvas.Brush.Color := clAppWorkSpace
  else
    if DayOfWeek(AViewInfo.Date) in [1, 7] then
      ACanvas.Font := stRed.Font;
end;

procedure TfrmMain.SchedulerDateNavigatorCustomDrawContent(Sender: TObject;
  ACanvas: TcxCanvas;
  AViewInfo: TcxSchedulerDateNavigatorMonthContentViewInfo;
  var ADone: Boolean);
var
  AColor: TColor;
  R: TRect;
begin
  R := AViewInfo.Bounds;
  case AViewInfo.Month of
    3..5: AColor := $D0FFD0;
    6..8: AColor := $D0D0FF;
    9..11: AColor := $D0FFFF;
  else
    AColor := $FFE7E7;
  end;
  with ACanvas do
  begin
    Brush.Color := AColor;
    FillRect(R);
    Font.Height := R.Bottom - R.Top;
    Font.Color := GetMiddleRGB(AColor, 0, 85);
    DrawText(IntToStr(AViewInfo.Month), R, cxAlignCenter);
  end;
  ACanvas.Font := AViewInfo.ViewParams.Font;
  AViewInfo.Transparent := True;
  ADone := True;
end;

procedure TfrmMain.SchedulerCustomDrawGroupSeparator(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxSchedulerGroupSeparatorCellViewInfo;
  var ADone: Boolean);
begin
  ACanvas.FrameRect(AViewInfo.Bounds, Scheduler.OptionsView.DayBorderColor);
  FillGradientRect(ACanvas, cxRectInflate(AViewInfo.Bounds, -1, -1), $E7D7A5, $D6C594, True);
  ADone := True;
end;

procedure TfrmMain.SchedulerResourceNavigatorCustomDrawButton(
  Sender: TcxSchedulerResourceNavigator; ACanvas: TcxCanvas;
  AButton: TcxSchedulerNavigatorButton; var ADone: Boolean);
var
  AcxOffice11LookAndFeelPainter: TcxOffice11LookAndFeelPainter;
begin
  with AButton do
  begin
    FillTubeGradientRect(ACanvas.Handle, Bounds, $E7D7A5, $D6C594, Rotated);
    if State in [cxbsHot, cxbsPressed] then
    begin
      AcxOffice11LookAndFeelPainter := TcxOffice11LookAndFeelPainter.Create;
      try
        AcxOffice11LookAndFeelPainter.DrawButton(ACanvas, Bounds, '', State);
      finally
        AcxOffice11LookAndFeelPainter.Free;
      end;
    end;
    if ActualImageList <> nil then
      ActualImageList.Draw(ACanvas.Canvas, Bounds.Left + 4 - 2 * Byte(Rotated),
        Bounds.Top + 3 + Byte(Rotated), ActualImageIndex, Enabled);
    ADone := True;
  end;
end;

procedure TfrmMain.SchedulerViewDayCustomDrawTimeRuler(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxSchedulerTimeRulerCellViewInfo;
  var ADone: Boolean);
begin
  AViewInfo.Transparent := True;
  FillGradientRect(ACanvas, AViewInfo.Bounds[True], $FFF9D6, $ECDDAD, True);
end;

procedure TfrmMain.SchedulerCustomDrawDayHeader(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxSchedulerDayHeaderCellViewInfo;
  var ADone: Boolean);
begin
  DrawParts(ACanvas, AViewInfo.Bounds, imgParts,
    2 - Ord((DateOf(AViewInfo.DateTime) <> Date)));
  AViewInfo.Transparent := True;
end;

procedure TfrmMain.SchedulerCustomDrawResourceHeader(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxSchedulerHeaderCellViewInfo;
  var ADone: Boolean);
begin
  DrawParts(ACanvas, AViewInfo.Bounds, imgEventImages, 4);
  AViewInfo.Transparent := True;
end;

procedure TfrmMain.SchedulerCustomDrawContent(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxSchedulerContentCellViewInfo;
  var ADone: Boolean);
var
  I: Integer;
begin
  AViewInfo.Transparent := True;
  ACanvas.Brush.Color := Light(AViewInfo.Color, 30);
  ACanvas.FillRect(AViewInfo.Bounds);
  ACanvas.Pen.Color := Light(AViewInfo.Color, 70);
  for I := 0 to cxRectHeight(AViewInfo.Bounds) div 2 do
  begin
    ACanvas.MoveTo(AViewInfo.Bounds.Left, AViewInfo.Bounds.Top + I * 2);
    ACanvas.LineTo(AViewInfo.Bounds.Right, AViewInfo.Bounds.Top + I * 2);
  end;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  GenerateEvents(Length(SportEvents) * Scheduler.Storage.ResourceCount);
  UnboundStorageTwo.SaveToFile('2.dat');
end;

procedure TfrmMain.dxbtnLayoutEditorClick(Sender: TObject);
begin
  cxShowResourcesLayoutEditor(Scheduler.Storage, Scheduler.DialogsLookAndFeel);
end;

procedure TfrmMain.dxbtnMajorUnitChange(Sender: TObject);
const
  AUnits: array[0..4] of TcxSchedulerTimeGridScaleUnit =
    (suDay, suWeek, suMonth, suQuarter, suYear);
begin
  Scheduler.ViewTimeGrid.Scales.MajorUnit :=
    AUnits[(Sender as TdxBarCombo).ItemIndex];
  SyncScales;
end;

procedure TfrmMain.dxbtnMinorUnitChange(Sender: TObject);
const
  AUnits: array[0..3] of TcxSchedulerTimeGridScaleUnit =
    (suHour, suDay, suMonth, suQuarter);
begin
  Scheduler.ViewTimeGrid.Scales.MinorUnit :=
    AUnits[(Sender as TdxBarCombo).ItemIndex];
  SyncScales;
end;

procedure TfrmMain.acCustomDialogsExecute(Sender: TObject);
begin
  Scheduler.Storage := UnboundStorageTwo;
  cxEventEditorClass := TcxSchedulerEventCustomEditor;
end;

procedure TfrmMain.SchedulerGetEventEditProperties(Sender: TObject;
  AEvent: TcxSchedulerControlEvent;
  var AProperties: TcxCustomEditProperties);
begin
  if Scheduler.Storage <> UnboundStorageTwo then Exit;
  if AEvent.IsEditing then
    AProperties := ComboboxItem.Properties
  else
    AProperties := RichItem.Properties;
end;

//------------------------------------------------------
//                  custom popup menu
//------------------------------------------------------
procedure TfrmMain.ConvertPopupMenu(ASourceMenu: TMenu);
var
  ACategoryName, APopupMenuName: string;
  ACategory: Integer;
  AItemLinks: TdxBarItemLinks;

  function FindItem(const ACaption: string; AOnClick: Pointer): TdxBarItem;
  var
    I: Integer;
  begin
    Result := nil;
    with dxBarManager do
      for I := 0 to ItemCount - 1 do
        with Items[I] do
          if (Items[I] is TdxBarButton) and
            (Caption = ACaption) and (@OnClick = AOnClick) then
          begin
            Result := Items[I];
            Break;
          end;
  end;

  procedure CheckItemState(AMenuItem: TMenuItem; ABarItem: TdxBarButton);
  begin
    with ABarItem do
    begin
      if AMenuItem.Checked or AMenuItem.RadioItem then
        ButtonStyle := bsChecked;
      if AMenuItem.RadioItem then
        GroupIndex := AMenuItem.GroupIndex;
      Down := AMenuItem.Checked;
    end;
  end;

  function ConvertItem(AMenuItem: TMenuItem; ACategory: Integer; CreateCategory: Boolean): TdxBarItem;
  var
    AItem, AChildItem: TdxBarItem;
    AItemLink: TdxBarItemLink;
    ABeginGroup: Boolean;
    ABitmap: TcxAlphaBitmap;
  begin
    if AMenuItem.Parent = nil then
      AItem := nil
    else
    begin
      if AMenuItem.Count > 0 then AItem := TdxBarSubItem.Create(nil)
      else
      begin
        AItem := FindItem(AMenuItem.Caption, @AMenuItem.OnClick);
        if AItem <> nil then
        begin
          Result := AItem;
          if AItem is TdxBarButton then
            CheckItemState(AMenuItem, TdxBarButton(AItem));
          AMenuItem.Free;
          Exit;
        end;
        AItem := TdxBarButton.Create(nil);
      end;
      AItem.Category := ACategory;
    end;

    with AMenuItem do
    begin
      if Parent <> nil then
      begin
        AItem.Action := Action;
        AItem.ImageIndex := -1;
        AItem.Caption := Caption;
        AItem.Enabled := Enabled;
        AItem.HelpContext := HelpContext;
        AItem.Hint := Hint;
        AItem.ShortCut := ShortCut;
        AItem.Tag := Tag;
        if (GetImageList <> nil) and (ImageIndex > -1) then
        begin
          AItem.Glyph.PixelFormat := pf24bit;
          TcxImageList.GetImageInfo(GetImageList.Handle, ImageIndex, AItem.Glyph, nil);
        end
        else
          if not Bitmap.Empty then
          begin
            ABitmap := TcxAlphaBitmap.CreateSize(Bitmap.Width, Bitmap.Height);
            try
              ABitmap.CopyBitmap(Bitmap);
              ABitmap.MakeOpaque;
              AItem.Glyph.Assign(ABitmap)
            finally
              ABitmap.Free;
            end;
          end;
        AItem.OnClick := OnClick;
        if AItem is TdxBarButton then
          CheckItemState(AMenuItem, TdxBarButton(AItem));

        if (Count > 0) and CreateCategory then
          with dxBarManager.Categories do
          begin
            ACategoryName := GetTextOf(Caption);
            if IndexOf(ACategoryName) < 0 then Add(ACategoryName);
            ACategory := IndexOf(ACategoryName);
          end;
      end;
      ABeginGroup := False;
      while Count > 0 do
        if Items[0].Caption = '-' then
        begin
          ABeginGroup := True;
          Items[0].Free;
        end
        else
        begin
          AChildItem := ConvertItem(Items[0], ACategory, False);
          if Parent = nil then AItemLink := AItemLinks.Add
          else
            AItemLink := TdxBarSubItem(AItem).ItemLinks.Add;
          AItemLink.Item := AChildItem;
          if ABeginGroup then
          begin
            AItemLink.BeginGroup := True;
            ABeginGroup := False;
          end;
        end;
    end;
    with AMenuItem do
      if Parent <> nil then Free;
    Result := AItem;
  end;

begin
  if FConverting or (ASourceMenu = nil) or (ASourceMenu.Items.Count = 0) then Exit;
  FConverting := True;
  try
    ACategoryName := APopupMenuName;
    dxBarPopupMenu.OnPopup := TPopupMenu(ASourceMenu).OnPopup;
    dxBarPopupMenu.ItemLinks.Clear;
    AItemLinks := dxBarPopupMenu.ItemLinks;
    with dxBarManager.Categories do
    begin
      if IndexOf(ACategoryName) < 0 then Add(ACategoryName);
      ACategory := IndexOf(ACategoryName);
    end;
    ConvertItem(ASourceMenu.Items, ACategory, False);

    with dxBarManager.Categories do
      Move(ACategory, Count - 1);
  finally
    FConverting := False;
  end;
end;

procedure TfrmMain.SyncCustomPopupMenus(ASetHandlers: Boolean);
begin
  if ASetHandlers then
  begin
    Scheduler.EventPopupMenu.OnPopup := SchedulerEventPopupMenuPopup;
    Scheduler.ContentPopupMenu.OnPopup := SchedulerContentPopupMenuPopup;
    Scheduler.ViewDay.TimeRulerPopupMenu.OnPopup := SchedulerViewDayTimeRulerPopupMenuPopup;
  end
  else
  begin
    Scheduler.EventPopupMenu.OnPopup := nil;
    Scheduler.ContentPopupMenu.OnPopup := nil;
    Scheduler.ViewDay.TimeRulerPopupMenu.OnPopup := nil;
  end;
end;

procedure TfrmMain.SchedulerContentPopupMenuPopup(
  Sender: TcxSchedulerContentPopupMenu; ABuiltInMenu: TPopupMenu;
  var AHandled: Boolean);
begin
  ConvertPopupMenu(ABuiltInMenu);
  dxBarPopupMenu.PopupFromCursorPos;
  AHandled := True;
end;

procedure TfrmMain.SchedulerEventPopupMenuPopup(
  Sender: TcxSchedulerEventPopupMenu; ABuiltInMenu: TPopupMenu;
  var AHandled: Boolean);
begin
  ConvertPopupMenu(ABuiltInMenu);
  dxBarPopupMenu.PopupFromCursorPos;
  AHandled := True;
end;

procedure TfrmMain.SchedulerViewDayTimeRulerPopupMenuPopup(
  Sender: TcxSchedulerTimeRulerPopupMenu; ABuiltInMenu: TPopupMenu;
  var AHandled: Boolean);
begin
  ConvertPopupMenu(ABuiltInMenu);
  dxBarPopupMenu.PopupFromCursorPos;
  AHandled := True;
end;

//procedure TfrmMain.GenerateEvents(ACount: Integer);
//var
//  I: Integer;
//  ADate: TDateTime;
//  AType: Integer;
//  AEvent: TcxSchedulerEvent;
//const
//  ACaptions: array[0..20] of string = (
//    'John Hillsborough',
//    'Jane Carmichael',
//    'Sam Frankfurt',
//    'Karen Holmes',
//    'Bobbie Valentine',
//    'Jennie Smithers',
//    'Ricardo Menendez',
//    'Frank Frankson',
//    'Christa Christie',
//    'Jimmie Jones',
//    'Alfred Newman',
//    'James Johnson',
//    'Robert James',
//    'June Alessandro',
//    'Mildred Johansson',
//    'Henry McAllister',
//    'Michael Jeffers',
//    'Scott Mathewson',
//    'Mickey Alcorn',
//    'Roger Michelson',
//    'Leticia Ford');
//var
//  AMessage: string;
//
//begin
//  Randomize;
////  Scheduler.Storage.Clear;
//  ACount := 2000;
//  AMessage := Scheduler.Storage.Events[0].Message;
//  Scheduler.Storage.BeginUpdate;
//  try
//    for I := 0 to ACount - 1 do
//    begin
//      AEvent := Scheduler.Storage.createEvent;
//      ADate := EncodeDate(2005, 9, 30) + EncodeTime(Random(10), Random(60), 0, 0) + (Random(300) - 15);
//      AEvent.Start := ADate + Scheduler.OptionsView.WorkStart;
//      AEvent.Duration := (30 + Random(120)) * MinuteToTime;
//      AEvent.Message := AMessage;
//      AEvent.State := Random(4);
//      AEvent.LabelColor := EventLabelColors[Random(11)];
//      AEvent.Caption := ACaptions[Random(21)];
////      AEvent.ResourceID := Random(Scheduler.Storage.ResourceCount);
//      AEvent.Reminder := I mod 5 = 0;
////      AEvent.SetCustomFieldValueByName('SportID', AType);
//    end;
//  finally
//    Scheduler.Storage.EndUpdate;
//  end;
//end;

procedure TfrmMain.ShowHolidaysEditorClick(Sender: TObject);
var
  AHolidays: TcxSchedulerHolidays;
begin
  AHolidays := SchedulerHolidays;
  cxShowHolidaysEditor(AHolidays, Scheduler.LookAndFeel);
end;

procedure TfrmMain.GenerateHolidaysEventsClick(Sender: TObject);
var
  I: Integer;
  AArrayVariant: array of Variant;
begin
  case TMenuItem(Sender).Tag of
    0:
      begin
        SetLength(AArrayVariant, SchedulerHolidaysStorage.ResourceCount);
        try
          for I := 0 to SchedulerHolidaysStorage.ResourceCount - 1 do
            AArrayVariant[I] := SchedulerHolidaysStorage.ResourceIDs[I];
          SchedulerHolidaysStorage.GenerateHolidayEvents(VarArrayOf(AArrayVariant));
        finally
          SetLength(AArrayVariant, 0);
        end;
      end;
    1:
      SchedulerHolidaysStorage.GenerateHolidayEvents(0);
    2:
      SchedulerHolidaysStorage.GenerateHolidayEvents(VarArrayOf([1, 2]));
  end;
end;

procedure TfrmMain.acHolidaysExecute(Sender: TObject);
begin
  pcControlBox.ActivePage := tbsHolidays;
  FPrevStorage := Scheduler.Storage;
  Scheduler.Storage := SchedulerHolidaysStorage;
end;

procedure TfrmMain.btnGenerateHolidaysEventsClick(Sender: TObject);
var
  APoint: TPoint;
begin
  APoint := btnGenerateHolidaysEvents.ClientToScreen(Point(0, 0));
  pmGenerageHolidaysEvents.Popup(APoint.X, APoint.Y);
end;

procedure TfrmMain.SchedulerShowDateHint(Sender: TObject;
  const ADate: TDateTime; var AHintText: String; var AAllow: Boolean);
begin
  AAllow := cbHolidaysHints.Checked;
end;

type
  TcxStorageAccess = class(TcxCustomSchedulerStorage);
procedure TfrmMain.dxbtnExitClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmMain.AllDayAreaHeightClick(Sender: TObject);
begin
  cxSchedulerAllDayEventContainerMaxLineCount := TdxBarButton(Sender).Tag;
  Scheduler.ViewDay.Refresh;
end;

procedure TfrmMain.AllDayAreaScrollBarClick(Sender: TObject);
begin
  Scheduler.ViewDay.AllDayAreaScrollBar := TcxSchedulerAllDayAreaScrollBar(TdxBarButton(Sender).Tag);
end;

procedure TfrmMain.acGridConnectionExecute(Sender: TObject);
begin
  GridConnectionState(True);
end;

procedure TfrmMain.AggregateStorageEventInserting(
  Sender: TcxSchedulerAggregateStorage; AEvent: TcxSchedulerEvent;
  var AStorage: TcxCustomSchedulerStorage);
var
  AEditor: TSelectStorage;
begin
  if Sender.Links.Count = 1 then Exit; 
  AEditor := TSelectStorage.Create(nil);
  try
    if AEditor.ShowModal = mrOk then
      if AEditor.rbDBStorage.Checked then
        AStorage := DBStorage
      else
        AStorage := UnboundStorage;
  finally
    AEditor.Free;
  end;
end;

procedure TfrmMain.lblURLClick(Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar(TLabel(Sender).Caption), nil, nil, SW_SHOWMAXIMIZED);
end;

procedure TfrmMain.GanttCollapseEvents(Sender: TObject);
var
  I: Integer;
begin
  with SchedulerGanttStorage do
    for I := 0 to EventCount - 1 do
      if TcxButton(Sender).Tag = 0 then
        Events[I].TaskLinks.Expanded := False
      else
        Events[I].TaskLinks.Expanded := True;
end;

procedure TfrmMain.cxLFControllerSkinForm(Sender: TObject;
  AForm: TCustomForm; var ASkinName: String; var UseSkin: Boolean);
begin
  UseSkin := True;
end;

procedure TfrmMain.cxLFControllerSkinControl(Sender: TObject;
  AControl: TWinControl; var UseSkin: Boolean);
begin
  UseSkin := True;
end;

procedure TfrmMain.cbAdditionalDSTClick(Sender: TObject);
begin
  if TComponent(Sender).Tag = 0 then
    Scheduler.OptionsView.CurrentTimeZoneDaylightSaving := TcxCheckBox(Sender).Checked
  else
    Scheduler.OptionsView.AdditionalTimeZoneDaylightSaving := TcxCheckBox(Sender).Checked;
  SyncOptionsWithScheduler;
  SetSchedulerFocused;
end;

procedure TfrmMain.cbxZonePropertiesChange(Sender: TObject);
begin
  with Scheduler.OptionsView do
  begin
    if TComponent(Sender).Tag = 0 then
    begin
      CurrentTimeZone := Integer(TcxCombobox(Sender).ItemObject);
      CurrentTimeZoneLabel := '';
    end
    else
    begin
      AdditionalTimeZone := Integer(TcxCombobox(Sender).ItemObject);
      AdditionalTimeZoneLabel := 'Additional';
    end;
  end;
  SyncOptionsWithScheduler;
  SetSchedulerFocused;
end;

procedure TfrmMain.AggregateLinkClick(Sender: TObject);
begin
  with AggregateStorage.Links do
  begin
    Clear;
    if cbBound.Checked then
      DefaultLink := AddStorageLink(DBStorage);
    if cbUnbound.Checked then
      DefaultLink := AddStorageLink(UnboundStorage);
  end;
  SetSchedulerFocused;
end;

procedure TfrmMain.YearScaleChanged(Sender: TObject);
const
  Scales: array[0..2] of Integer = (12, 6, 3);
begin
  Scheduler.ViewYear.Scale := Scales[TcxComboBox(Sender).ItemIndex];
  SetSchedulerFocused;
end;

procedure TfrmMain.AllDayEventsOnlyClick(Sender: TObject);
begin
  Scheduler.ViewYear.AllDayEventsOnly := TcxCheckBox(Sender).Checked;
  SyncOptionsWithScheduler;
  SetSchedulerFocused;
end;

procedure TfrmMain.SchedulerLayoutChanged(Sender: TObject);
begin
  if Scheduler.ViewYear.Scale = 12 then
    cbxYearScale.ItemIndex := 0
  else
    if Scheduler.ViewYear.Scale = 6 then
      cbxYearScale.ItemIndex := 1
    else
      cbxYearScale.ItemIndex := 2;
  SetSchedulerFocused;
end;

procedure TfrmMain.cbTimeLineOptionsClick(Sender: TObject);
begin
  if TcxCheckBox(Sender).Tag = 0 then
    Scheduler.ViewTimeGrid.SnapEventsToTimeSlots := TcxCheckBox(Sender).Checked
  else
    Scheduler.ViewTimeGrid.EventDetailInfo := TcxCheckBox(Sender).Checked;
  SyncOptionsWithScheduler;
  SetSchedulerFocused;
end;

procedure TfrmMain.cbxProgressClick(Sender: TObject);
begin
  Scheduler.ViewGantt.ShowTotalProgressLine := TcxCheckBox(Sender).Checked;
  SetSchedulerFocused;
end;

procedure TfrmMain.cbxEventsStylePropertiesChange(Sender: TObject);
begin
  Scheduler.ViewGantt.EventsStyle := TcxSchedulerGanttViewEventStyle(TcxComboBox(Sender).ItemIndex);
  SyncOptionsWithScheduler;
  SetSchedulerFocused;
end;

procedure TfrmMain.cbxExpandButtonClick(Sender: TObject);
begin
  Scheduler.ViewGantt.ShowExpandButtons := TcxCheckBox(Sender).Checked;
  SyncOptionsWithScheduler;
  SetSchedulerFocused;
end;

procedure TfrmMain.cbxSnapGanttEventsClick(Sender: TObject);
begin
  Scheduler.ViewGantt.SnapEventsToTimeSlots := TcxCheckBox(Sender).Checked;
  SyncOptionsWithScheduler;
  SetSchedulerFocused;
end;

procedure TfrmMain.lstSchedulerActionsExecute(Action: TBasicAction;
  var Handled: Boolean);
begin
  ValidateActiveView;
end;

procedure TfrmMain.cxCheckBox1Click(Sender: TObject);
begin
  Scheduler.ViewWeeks.HideWeekEnd := TcxCheckBox(Sender).Checked;
  SetSchedulerFocused;
end;

procedure TfrmMain.cbxReminderByResourceClick(Sender: TObject);
begin
  if Scheduler.Storage.Reminders.ReminderByResource <> TcxCheckBox(Sender).Checked then
    Scheduler.Storage.Reminders.ReminderByResource := TcxCheckBox(Sender).Checked;
end;

procedure TfrmMain.cbxTreeBrowserClick(Sender: TObject);
begin
  Scheduler.ViewGantt.TreeBrowser.Visible := cbxTreeBrowser.Checked; 
end;

initialization
  dxMegaDemoProductIndex := dxSchedulerIndex;
  TemporaryBitmap := TBitmap.Create;
  TemporaryBitmap.Width := 16;                
  TemporaryBitmap.Height := 16;
  TemporaryBitmap.TransparentMode := tmFixed;
  TemporaryBitmap.TransparentColor := clFuchsia;
  TemporaryBitmap.Transparent := True;
  GradientBitmap := TBitmap.Create;

finalization
  TemporaryBitmap.Free;
  GradientBitmap.Free;

end.

