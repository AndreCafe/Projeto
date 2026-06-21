unit Main;

interface

uses
{$I dxSkins.inc}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, ImgList, Menus, dxCore, dxBar, dxBarExtItems,
  dxBarDBNav, dxBarExtDBItems, dxNavBarConsts, dxOperations, dxOperationTypes,
  Db, dxPSGlbl, dxPSCore, dxPSUtl, dxPrnPg, dxPScxCommon, dxPScxExtCommon,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSPrVwAdv,
  dxPSEdgePatterns, dxPSEngn, dxPgsDlg, dxPSRes, cxLookAndFeels, dxSkinsForm,
  cxLookAndFeelPainters, dxNavBarBase, dxNavBarCollns, dxNavBar, dxFrame,
  cxStyles, cxControls, cxInplaceContainer, cxSplitter, ActnList, cxGraphics,
  cxProgressBar, dxStatusBar, cxContainer, cxEdit, cxClasses, dxSkinsCore,
  dxSkinsdxNavBarPainter, dxSkinsdxStatusBarPainter, dxSkinsdxBarPainter,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxSkinscxPCPainter, dxSkinsdxRibbonPainter, dxBarSkinnedCustForm, dxPScxGridLayoutViewLnk, 
  cxLabel, cxTextEdit, dxNavBarSkinBasedViews, dxNavBarViewsFact, cxDataUtils, dxHooks;

const
  NavBarDemoStyle = 1001;

type
  TfrmMain = class(TForm, IdxgdEventSubscriber, IcxLookAndFeelNotificationListener)
    dxBarManager: TdxBarManager;
    dxBarSubItemFile: TdxBarSubItem;
    biPrint: TdxBarButton;
    biExit: TdxBarButton;
    dxBarSubItemHelp: TdxBarSubItem;
    btnLinkMain: TdxBarButton;
    btnLinkProducts: TdxBarButton;
    btnLinkDownloads: TdxBarButton;
    biView: TdxBarSubItem;
    btnLinkForum: TdxBarButton;
    biFullCollapse: TdxBarButton;
    biFullExpand: TdxBarButton;
    biGrouping: TdxBarButton;
    biShowIndicator: TdxBarButton;
    biShowSummaryFooter: TdxBarButton;
    biShowHeaders: TdxBarButton;
    biAutoWidth: TdxBarButton;
    biShowGrid: TdxBarButton;
    biAutoPreview: TdxBarButton;
    biShowButtonAlways: TdxBarButton;
    biInvertSelected: TdxBarButton;
    biCustomization: TdxBarButton;
    biShowBands: TdxBarButton;
    biLast: TdxBarButton;
    biFirst: TdxBarButton;
    biPrior: TdxBarButton;
    biNext: TdxBarButton;
    biInsert: TdxBarButton;
    biDelete: TdxBarButton;
    biPost: TdxBarButton;
    biCancel: TdxBarButton;
    biRefresh: TdxBarButton;
    biEdit: TdxBarButton;
    biPrintPreview: TdxBarButton;
    biStyleList: TdxBarListItem;
    biBestFitAll: TdxBarButton;
    biAutoFormat: TdxBarButton;
    biExportTo: TdxBarSubItem;
    biExportToHTML: TdxBarButton;
    biExportToXML: TdxBarButton;
    biExportToExcel97: TdxBarButton;
    biExportToText: TdxBarButton;
    biOptions: TdxBarSubItem;
    biAutoSearch: TdxBarButton;
    biAutoExpandOnSearch: TdxBarButton;
    biSearchColor: TdxBarColorCombo;
    biSearchTextColor: TdxBarColorCombo;
    pnlAllArea: TPanel;
    plClient: TPanel;
    SplitterNavBar: TcxSplitter;
    dxComponentPrinter: TdxComponentPrinter;
    biStyle: TdxBarSubItem;
    biHintContainer: TdxBarControlContainerItem;
    pnlHintContainer: TPanel;
    bvlHint: TBevel;
    dxPrintStyleManager1: TdxPrintStyleManager;
    dxPrintStyleManager1Style1: TdxPSPrintStyle;
    dxPrintStyleManager1Style2: TdxPSPrintStyle;
    dxPrintStyleManager1Style3: TdxPSPrintStyle;
    biPageSetup: TdxBarSubItem;
    biPrintStyles: TdxBarListItem;
    biDefinePrintStyles: TdxBarButton;
    biShowInspector: TdxBarButton;
    biNative: TdxBarButton;
    pnlHintText: TPanel;
    StatusBar: TdxStatusBar;
    StatusBarContainer2: TdxStatusBarContainerControl;
    dxBarDockControl: TdxBarDockControl;
    dxPageSetupDialog1: TdxPageSetupDialog;
    biColumnDiagram: TdxBarButton;
    biBarDiagram: TdxBarButton;
    biCategoriesInReverseOrder: TdxBarButton;
    biValueAxisAtMaxCategory: TdxBarButton;
    dxSkinController1: TdxSkinController;
    alMain: TActionList;
    actDownloads: TAction;
    actSupport: TAction;
    actDXOnTheWeb: TAction;
    actProducts: TAction;
    actFeatures: TAction;
    biExportToPDF: TdxBarButton;
    biExportToExcel: TdxBarButton;
    NavBarSite: TPanel;
    NavBar: TdxNavBar;
    Panel2: TPanel;
    edtNavBarFilterText: TcxTextEdit;
    cxLabel1: TcxLabel;
    ImageList1: TImageList;
    nvgNewUpdated: TdxNavBarGroup;
    nvgHighlightedFeatures: TdxNavBarGroup;
    nvgLayoutFeatures: TdxNavBarGroup;
    nvgEditing: TdxNavBarGroup;
    nvgFiltering: TdxNavBarGroup;
    nvgSortingGrouping: TdxNavBarGroup;
    nvgPreviewAndView: TdxNavBarGroup;
    nvgDataBinding: TdxNavBarGroup;
    nvgMasterDetail: TdxNavBarGroup;
    nvgTableBandedTable: TdxNavBarGroup;
    nvgEntertainment: TdxNavBarGroup;
    nvgAppearance: TdxNavBarGroup;
    nvgSummaries: TdxNavBarGroup;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure biViewsGetData(Sender: TObject);
    procedure dxComponentPrinterPrintDeviceError(Sender: TObject;
      var ADone: Boolean);
    procedure dxComponentPrinterPrintDeviceBusy(Sender: TObject;
      var ADone: Boolean);
    procedure FormShow(Sender: TObject);
    procedure dxPrintStyleManager1ChangeCurrentStyle(Sender: TObject);
    procedure dxPrintStyleManager1StyleListChanged(Sender: TObject);
    procedure NavBarLinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
    procedure dxComponentPrinterStartGenerateReport(Sender: TObject;
      AReportLink: TBasedxReportLink);
    procedure dxComponentPrinterEndGenerateReport(Sender: TObject;
      AReportLink: TBasedxReportLink);
    procedure dxComponentPrinterGenerateReportProgress(Sender: TObject;
      AReportLink: TBasedxReportLink; APercentDone: Double);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actDownloadsExecute(Sender: TObject);
    procedure actSupportExecute(Sender: TObject);
    procedure actDXOnTheWebExecute(Sender: TObject);
    procedure actProductsExecute(Sender: TObject);
    procedure actFeaturesExecute(Sender: TObject);
    procedure cxTextEdit1PropertiesChange(Sender: TObject);
  private
    FFrameUpdating: Boolean;
    FProgressBar: TcxProgressBar;
    FProgressStatusPanel: TdxStatusBarPanel;
    FTopPanel: TPanel;
    FSupportNativeStyle: Boolean;

    function GetActiveReportLink: TBasedxReportLink;
    function GetFrameHasHint: Boolean;
    function GetFrameHint: string;
    function IsSupportExport(AExportType: TSupportedExportType): Boolean;

    procedure InitNavBar;
    procedure PSPrintDeviceBusy;
    procedure PSPrintDeviceError;
    procedure ShowMessageAboutPrintingSystem;

    procedure RegisterBarItems;
    procedure RegisterBars;

    procedure SetNavBarWidth;
    procedure SetNavBarFilter(AFilterText: string);
    
    procedure ChangeStatusHintVisibility(Value: Boolean);
    procedure CreateProgressBar;
    function NeedReflectProgressStage: Boolean;
  protected

    // IdxgdEventSubscriber
    procedure ProcessEvent(AOperationType: TdxgdOperationType);
    // IcxLookAndFeelNotificationListener = interface
    function GetObject: TObject;
    procedure MasterLookAndFeelChanged(Sender: TcxLookAndFeel; AChangedValues: TcxLookAndFeelValues);
    procedure MasterLookAndFeelDestroying(Sender: TcxLookAndFeel);

    procedure LookAndFeelChanged;
    procedure UpdateNavBarLookAndFeel;

    procedure DoExecuteApplication(const AFileName: string);
    procedure DoExport(AExportType: TSupportedExportType);
    procedure RegisterBarItem(ABarItem: TdxBarItem; AOperationType: TdxgdOperationType);
    procedure ShowFrame(FrameID: Integer);
    procedure SynchronizeFrameChoosers(FrameID: Integer);

    property ActiveReportLink: TBasedxReportLink read GetActiveReportLink;
    property FrameHint: string read GetFrameHint;
    property FrameHasHint: Boolean read GetFrameHasHint;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}

uses
  ShellAPI, FrameIDs, dxFrames, maindata, dxThemeManager,
  uStrsConst, dxOffice11, dxDemoUtils;

const
  StartHintCoordinateX = 0;
  HintCoordinateXDelta = 1;
  EmptySpaceWidth = 100;

type
  TDummyBarControl = class(TdxBarControl);
  TDummyDockControl = class(TdxDockControl);
  TdxNavBarViewInfoAccess = class(TdxNavBarViewInfo);

constructor TfrmMain.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTopPanel := TPanel.Create(self);
  FTopPanel.Parent := pnlAllArea;
  FTopPanel.Align := alTop;
  FTopPanel.BevelInner := bvNone;
  FTopPanel.BevelOuter := bvNone;
  FTopPanel.Height := 3;
  FTopPanel.ParentBackground := False;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Caption := 'The ExpressQuantumGrid - Features Demo';
  Application.Title := Caption;
  dxOperationManager.RegisterSubscriber(Self);
  RootLookAndFeel.AddChangeListener(self);
  RegisterBarItems;
  RegisterBars;
  InitNavBar;
  CreateProgressBar;
  CreateSkinsMenuItems(dxBarManager, biStyle, dxSkinController1, NavBar);
  CreateHelpMenuItems(dxBarManager, dxBarSubItemHelp);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  RootLookAndFeel.RemoveChangeListener(self);
  dxOperationManager.UnregisterSubscriber(Self);
end;

function TfrmMain.GetActiveReportLink: TBasedxReportLink;
begin
  with dxFrameManager do 
    if ActiveFrame <> nil then 
      Result := ActiveFrame.ReportLink
    else
      Result := nil;
end;

function TfrmMain.GetFrameHasHint: Boolean;
begin
  Result := FrameHint <> '';
end;

function TfrmMain.GetFrameHint: string;
begin
  Result := biHintContainer.Caption;
end;

function TfrmMain.IsSupportExport(AExportType: TSupportedExportType): Boolean;
begin
  Result := (dxFrameManager.ActiveFrame <> nil) and dxFrameManager.ActiveFrame.IsSupportExport(AExportType);
  if not result then
    Result := (dxFrameManager.ActiveFrame <> nil) and dxFrameManager.ActiveFrame.IsSupportExport(AExportType);
end;

procedure TfrmMain.InitNavBar;
var
  I: Integer;
  AFrameInfo: TdxFrameInfo;
  AItem: TdxNavBarItem;

  procedure CheckSideBarGroup(AGroupIndex: Integer);
  begin
    if (AGroupIndex < NavBar.Groups.Count) and (AGroupIndex > -1) then
      NavBar.Groups[AGroupIndex].CreateLink(AItem);
  end;

begin
  for I := 0 to dxFrameManager.Count - 1 do
  begin
    AFrameInfo := dxFrameManager[I];
    AItem := NavBar.Items.Add;
    AItem.Caption := AFrameInfo.Caption;
    AItem.SmallImageIndex := AFrameInfo.ImageIndex;
    AItem.Tag := AFrameInfo.ID;
    CheckSideBarGroup(AFrameInfo.SideBarGroupIndex);
    CheckSideBarGroup(AFrameInfo.SideBarFirstAdditionalGroupIndex);
    CheckSideBarGroup(AFrameInfo.SideBarSecondAdditionalGroupIndex);
  end;
  SetNavBarWidth;
  for I := NavBar.Groups.Count - 1 downto 0 do
    if not NavBar.Groups[I].Visible then
      NavBar.Groups[I].Free;
  NavBar.ActiveGroupIndex := 0;

{  //Add MineSweeper
  AItem := NavBar.Items.Add;
  AItem.Caption := GridWinMinerFrameName;
  AItem.LargeImageIndex := GridWinMinerImageIndex;
  AItem.SmallImageIndex := GridWinMinerImageIndex;
  NavBar.Groups[GridSideBarGroupIndex].CreateLink(AItem);
  AItem.OnClick := DoWinMinerGame;}
end;

procedure TfrmMain.RegisterBarItems;

  procedure RegisterFileItems;
  begin
    RegisterBarItem(biExportTo, otExportTo);
    RegisterBarItem(biExportToHTML, otExportToHTML);
    RegisterBarItem(biExportToXML, otExportToXML);
    RegisterBarItem(biExportToExcel97, otExportToExcel);
    RegisterBarItem(biExportToExcel, otExportToExcel2007);
    RegisterBarItem(biExportToPDF, otExportToPDF);
    RegisterBarItem(biExportToText, otExportToText);
    RegisterBarItem(biPrint, otPrint);
    RegisterBarItem(biPrintStyles, otPrintStyles);
    RegisterBarItem(biDefinePrintStyles, otDefinePrintStyles);
    RegisterBarItem(biPrintPreview, otPrintPreview);
    RegisterBarItem(biExit, otExit);
    RegisterBarItem(biHintContainer, otHint);
    RegisterBarItem(biShowInspector, otShowInspector);
  end;

  procedure RegisterHelpItems;
  begin
    RegisterBarItem(btnLinkProducts, otLinkProducts);
    RegisterBarItem(btnLinkDownloads, otLinkDownloads);
    RegisterBarItem(btnLinkForum, otLinkForum);
    RegisterBarItem(btnLinkMain, otLinkMain);
  end;

  procedure RegisterDBNavigatorItems;
  begin
    RegisterBarItem(biFirst, otFirst);
    RegisterBarItem(biPrior, otPrior);
    RegisterBarItem(biNext, otNext);
    RegisterBarItem(biLast, otLast);
    RegisterBarItem(biInsert,otInsert);
    RegisterBarItem(biDelete,otDelete);
    RegisterBarItem(biEdit, otEdit);
    RegisterBarItem(biPost, otPost);
    RegisterBarItem(biCancel, otCancel);
    RegisterBarItem(biRefresh, otRefresh);
  end;

  procedure RegisterStatusBarItems;
  begin
    RegisterBarItem(biHintContainer, otHint);
  end;

  procedure RegisterViewItems;
  begin
    RegisterBarItem(biView, otGridView);
    RegisterBarItem(biGrouping, otGrouping);
    RegisterBarItem(biShowIndicator, otShowIndicator);
    RegisterBarItem(biShowSummaryFooter, otShowSummaryFooter);
    RegisterBarItem(biShowHeaders, otShowHeaders);
    RegisterBarItem(biAutoWidth, otAutoWidth);
    RegisterBarItem(biShowGrid, otShowGrid);
    RegisterBarItem(biAutoPreview, otAutoPreview);
    RegisterBarItem(biShowButtonAlways, otShowButtonsAlways);
    RegisterBarItem(biInvertSelected, otInvertSelected);
    RegisterBarItem(biFullCollapse, otFullCollapse);
    RegisterBarItem(biFullExpand, otFullExpand);
    RegisterBarItem(biAutoFormat, otAutoFormat);
    RegisterBarItem(biCustomization, otCustomization);
    RegisterBarItem(biShowBands, otShowBands);
    RegisterBarItem(biStyle, otStyles);
    RegisterBarItem(biStyleList, otStyleList);
  end;

  procedure RegisterOptionsItems;
  begin
    RegisterBarItem(biOptions, otOptions);
    RegisterBarItem(biAutoSearch, otAutoSearch);
    RegisterBarItem(biAutoExpandOnSearch, otAutoExpandOnSearch);
    RegisterBarItem(biSearchColor, otSearchColor);
    RegisterBarItem(biSearchTextColor, otSearchTextColor);
  end;

  procedure RegisterDiagramOperations;
  begin
    RegisterBarItem(biColumnDiagram, otColumnDiagram);
    RegisterBarItem(biBarDiagram, otBarDiagram);
    RegisterBarItem(biCategoriesInReverseOrder, otCategoriesInReverseOrder);
    RegisterBarItem(biValueAxisAtMaxCategory, otValueAxisAtMaxCategory);
  end;

begin
  RegisterFileItems;
  RegisterHelpItems;
  RegisterDBNavigatorItems;
  RegisterStatusBarItems;
  RegisterViewItems;
  RegisterOptionsItems;
  RegisterDiagramOperations;
end;

procedure TfrmMain.RegisterBars;
begin
  with dxOperationManager do
  begin
    RegisterBar(dxBarManager.BarByCaption('Main Menu'), btMainMenu);
    RegisterBar(dxBarManager.BarByCaption('Standard'), btStandard);
    RegisterBar(dxBarManager.BarByCaption('Properties'), btFormat);
    RegisterBar(dxBarManager.BarByCaption('Font Format'), btFontFormat);
    RegisterBar(dxBarManager.BarByCaption('Options'), btOptions);
    RegisterBar(dxBarManager.BarByCaption('DB Navigator'), btDBNavigator);
    RegisterBar(dxBarManager.BarByCaption('Status Bar'), btStatusBar);
    RegisterBar(dxBarManager.BarByCaption('Editing'), btTreeList);
    RegisterBar(dxBarManager.BarByCaption('SpreadSheet'), btSpreadSheet);
    RegisterBar(dxBarManager.BarByCaption('Diagrams'), btDiagrams);
  end;
end;

procedure TfrmMain.SetNavBarWidth;
const
 OffSet = 45;
var
  I: Integer;
  AMaxWidth, AWidth: Integer;
begin
  AMaxWidth := 0;
  try
    Canvas.Font.Assign(NavBar.DefaultStyles.GroupHeader.Font);
    for I := 0 to NavBar.Groups.Count - 1 do
    begin
      AWidth := Canvas.TextWidth(NavBar.Groups[I].Caption) + dmMain.NavBarLargeImages.Width + OffSet;
      if AWidth > AMaxWidth then
        AMaxWidth := AWidth;
    end;
    Canvas.Font.Assign(NavBar.DefaultStyles.Item.Font);
    for I := 0 to NavBar.Items.Count - 1 do
    begin
      AWidth := Canvas.TextWidth(NavBar.Items[I].Caption) + dmMain.NavBarSmallImages.Width + OffSet;
      if AWidth > AMaxWidth then
        AMaxWidth := AWidth;
    end;
  finally
    Canvas.Font.Assign(Font);
  end;
  NavBarSite.Width := AMaxWidth;
end;

procedure TfrmMain.SetNavBarFilter(AFilterText: string);
var
  I, J: Integer;
  AGroup: TdxNavBarGroup;
begin
  NavBar.BeginUpdate;
  try
    for I := 0 to NavBar.Items.Count - 1 do
      NavBar.Items[I].Visible := (AFilterText = '') or
        (Pos(AnsiUpperCase(AFilterText), AnsiUpperCase(NavBar.Items[I].Caption)) <> 0);
    for I := 0 to NavBar.Groups.Count - 1 do
    begin
      AGroup := NavBar.Groups[I];
      AGroup.Visible := False;
      for J := 0 to AGroup.LinkCount - 1 do
        AGroup.Visible := AGroup.Visible or AGroup.Links[J].Item.Visible;
    end; 
  finally
    NavBar.EndUpdate;
  end;
end;

procedure TfrmMain.ChangeStatusHintVisibility(Value: Boolean);
begin
  with StatusBar do
    Panels[Panels.Count - 1].Visible := Value;
end;

procedure TfrmMain.CreateProgressBar;
begin
  FProgressBar := TcxProgressBar.Create(Self);
  FProgressBar.Properties.BorderWidth := 3;
  FProgressBar.Align := alClient;
  FProgressBar.Properties.Max := 100;
end;

function TfrmMain.NeedReflectProgressStage: Boolean;
begin
  Result := not dxComponentPrinter.PreviewExists;
end;

procedure TfrmMain.ProcessEvent(AOperationType: TdxgdOperationType);
const
  GridExportTypes: array[otExportToHTML..otExportToText] of TSupportedExportType =
    (exHTML, exXML, exExcel97, exExcel, exPDF, exText);
  WebSiteAddress = 'http://www.devexpress.com';
  Links: array[otLinkProducts..otLinkMain] of string =
    (WebSiteAddress + '/products/vcl/',
     WebSiteAddress + '/downloads/vcl/',
     'http://24.234.251.34/dxforum/dxforumisapi.dll/',
     WebSiteAddress);
var
  ALookAndFeelStyle: TcxLookAndFeelStyle;
  AItemIndex: Integer;
begin
  case AOperationType of
    otPrint:
      if ActiveReportLink <> nil then
      begin
        ShowMessageAboutPrintingSystem;
        ActiveReportLink.Print(True, nil);
        ActiveReportLink.Active := False;
      end;
    otPrintPreview:
      if ActiveReportLink <> nil then
      begin
        ShowMessageAboutPrintingSystem;
        ActiveReportLink.Preview(True);
        ActiveReportLink.Active := False;
      end;
    otExit:
      Close;
    otExportToHTML, otExportToXML, otExportToExcel, otExportToExcel2007, otExportToText:
      DoExport(GridExportTypes[AOperationType]);
    otExportToPDF:
      dxPSExportToPDF(ActiveReportLink);
    otGoToView:
      with dxOperationManager.BarItems[otGoToView] as TdxBarListItem do
        ShowFrame(TdxFrameInfo(Items.Objects[ItemIndex]).ID);
    otLinkProducts, otLinkDownloads, otLinkForum, otLinkMain:
      DoExecuteApplication(Links[AOperationType]);
    otStyleList:
      begin
        AItemIndex := (dxOperationManager.BarItems[otStyleList] as TdxBarListItem).ItemIndex;
        ALookAndFeelStyle := TcxLookAndFeelStyle(AItemIndex);
        if not FSupportNativeStyle and (ALookAndFeelStyle = lfsNative) then
          ALookAndFeelStyle := lfsOffice11;
        if ALookAndFeelStyle = lfsNative then
          RootLookAndFeel.NativeStyle := True
        else
        begin
          if (ALookAndFeelStyle = lfsOffice11) and FSupportNativeStyle then
            Dec(AItemIndex);
          RootLookAndFeel.Kind := TcxLookAndFeelKind(AItemIndex);
          RootLookAndFeel.NativeStyle := False;
        end;
      end;
  end;
end;

function TfrmMain.GetObject: TObject;
begin
  Result := self;
end;

procedure TfrmMain.MasterLookAndFeelChanged(Sender: TcxLookAndFeel; AChangedValues: TcxLookAndFeelValues);
begin
  LookAndFeelChanged;
end;

procedure TfrmMain.MasterLookAndFeelDestroying(Sender: TcxLookAndFeel);
begin
end;

procedure TfrmMain.LookAndFeelChanged;
const
  BevelHintShape: array[TcxLookAndFeelStyle] of TBevelShape = (bsBox, bsBox, bsFrame, bsFrame, bsFrame, bsFrame);
  BevelHintStyle: array[TcxLookAndFeelStyle] of TBevelStyle = (bsLowered, bsLowered, bsLowered, bsLowered, bsLowered, bsLowered);
begin
  UpdateNavBarLookAndFeel;
  bvlHint.Shape := BevelHintShape[RootLookAndFeel.ActiveStyle];
  bvlHint.Style := BevelHintStyle[RootLookAndFeel.ActiveStyle];
  if RootLookAndFeel.ActiveStyle = lfsOffice11 then
  begin
    SplitterNavBar.Color := dxOffice11ToolbarsColor1;
    Color  := dxOffice11ToolbarsColor1;
  end else
  begin
    SplitterNavBar.Color := clBtnFace;
    Color := clBtnFace;
  end;
  FTopPanel.Color := SplitterNavBar.Color;
end;

procedure TfrmMain.UpdateNavBarLookAndFeel;
begin
  NavBar.View := NavBarDemoStyle;
  with NavBar.OptionsStyle.DefaultStyles do
  begin
    NavBar.OptionsStyle.DefaultStyles.GroupHeader;
    GroupHeader.Font.Style := [];
    GroupHeaderActive.Font.Style := [];
    GroupHeaderActiveHotTracked.Font.Style := [];
    GroupHeaderActivePressed.Font.Style := [];
    GroupHeaderHotTracked.Font.Style := [];
    GroupHeaderPressed.Font.Style := [];
  end;
end;

procedure TfrmMain.DoExecuteApplication(const AFileName: string);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar(AFileName), nil, nil, SW_SHOWMAXIMIZED);
end;

procedure TfrmMain.DoExport(AExportType: TSupportedExportType);
var
  AFileName: string;

  function GetFileName(var AFileName: string): Boolean;
  const
    DefaultExtensions: array[TSupportedExportType] of string =
      ('html', 'xml', 'xls', 'xlsx', 'pdf', 'txt');
    Filters: array[TSupportedExportType] of string =
      ('HTML File (*.html)|*.html',
       'XML File (*.xml)|*.xml',
       'Microsoft Excel 97-2003 Worksheet (*.xls)|*.xls',
       'Microsoft Excel 2007-2010 (*.xlsx)|*.xlsx',
       'Adobe Reader (*.pdf)|*.pdf',
       'Text file (*.txt)|*.txt');
  begin
    with TSaveDialog.Create(Self) do
    try
      DefaultExt := DefaultExtensions[AExportType];
      Filter := Filters[AExportType];
      FileName := dxFrameManager.ActiveFrame.ExportFileName;
      InitialDir := ExtractFilePath(Application.ExeName);
      Options := Options + [ofOverwritePrompt];
      Result := Execute;
      if Result then AFileName := FileName;
    finally
      Free;
    end;
  end;

begin
  if not IsSupportExport(AExportType) then
  begin
    Application.MessageBox(PChar(sdxExportGridMessage), PChar(sdxExportGridMessageCaption),
        MB_ICONINFORMATION);
    Exit;
  end;
  if not GetFileName(AFileName) then Exit;
  dxFrameManager.ActiveFrame.DoExport(AExportType, AFileName);
  if (Application.MessageBox(PChar(sdxOpenFile + AFileName +' ?'), PChar(sdxConfirm),
    MB_ICONQUESTION + MB_YESNO) = ID_YES) then
   DoExecuteApplication(AFileName);
end;

procedure TfrmMain.RegisterBarItem(
  ABarItem: TdxBarItem; AOperationType: TdxgdOperationType);
begin
  dxOperationManager.RegisterBarItem(ABarItem, AOperationType);
end;

procedure TfrmMain.ShowFrame(FrameID: Integer);
var
  ANavBarDragDropFlags: TdxNavBarDragDropFlags;
begin
  if FFrameUpdating or (dxFrameManager.ActiveFrame <> nil) and not dxFrameManager.ActiveFrame.CanDeactivate then
    Exit;
  FFrameUpdating := True;
  try
    if (dxFrameManager.ActiveFrameInfo = nil) or
      (dxFrameManager.ActiveFrameInfo.ID <> FrameID) then
    begin
      ANavBarDragDropFlags := NavBar.DragDropFlags;
      NavBar.DragDropFlags := [];
      try
        LockWindowUpdate(Handle);
        dxFrameManager.ShowFrame(FrameID, plClient);
      finally
        LockWindowUpdate(0);
        NavBar.DragDropFlags := ANavBarDragDropFlags;
      end;
      if dxFrameManager.ActiveFrame <> nil then
      begin
        Application.ProcessMessages;
        dxFrameManager.ActiveFrame.AfterShow;
      end;
      pnlHintText.Caption := GetFrameHint;
      Statusbar.Panels[1].Text := GetFrameHint;
      StatusBar.Panels[0].Width := dxBarManager.Bars[1].ItemLinks.CanVisibleItemCount * 23 + 5;

      biPageSetup.Enabled := ActiveReportLink <> nil;
      biPrintStyles.Enabled := ActiveReportLink <> nil;
      biDefinePrintStyles.Enabled := ActiveReportLink <> nil;
      biPrint.Enabled := ActiveReportLink <> nil;
      biPrintPreview.Enabled := ActiveReportLink <> nil;

      biExportToHTML.Enabled := IsSupportExport(exHTML);
      biExportToXML.Enabled := IsSupportExport(exXML);
      biExportToExcel97.Enabled := IsSupportExport(exExcel97);
      biExportToExcel.Enabled := IsSupportExport(exExcel);
      biExportToExcel.Enabled := IsSupportExport(exExcel);
      biExportToText.Enabled := IsSupportExport(exText);
    end;
    dxComponentPrinter.CurrentLink := ActiveReportLink;
    dxPrintStyleManager1StyleListChanged(nil);
    SynchronizeFrameChoosers(FrameID);
  finally
    FFrameUpdating := False;
  end;
end;

procedure TfrmMain.SynchronizeFrameChoosers(FrameID: Integer);
var
  AGroupIndex, ALinkIndex: Integer;
  AGroup: TdxNavBarGroup;
  ALink: TdxNavBarItemLink;
begin
exit;
  for AGroupIndex := 0 to NavBar.Groups.Count - 1 do
  begin
    AGroup := NavBar.Groups[AGroupIndex];
    for ALinkIndex := 0 to AGroup.LinkCount - 1 do
    begin
      ALink := AGroup.Links[ALinkIndex];
      ALink.Selected := ALink.Item.Tag = FrameID;
      if ALink.Selected then
      begin
        TdxNavBarViewInfoAccess(NavBar.ViewInfo).MakeLinkVisible(ALink, False);
      end;
    end;
  end;
end;

procedure TfrmMain.actDownloadsExecute(Sender: TObject);
begin
  Browse(spDownloads);
end;

procedure TfrmMain.actDXOnTheWebExecute(Sender: TObject);
begin
  Browse(spMyDX);
end;

procedure TfrmMain.actFeaturesExecute(Sender: TObject);
begin
  Browse(spFeatures);
end;

procedure TfrmMain.actProductsExecute(Sender: TObject);
begin
  Browse(spProducts);
end;

procedure TfrmMain.actSupportExecute(Sender: TObject);
begin
  Browse(spSupport);
end;

procedure TfrmMain.biViewsGetData(Sender: TObject);
var
  I: Integer;
  ALastSideBarGroupIndex: Integer;
  ASeparatorCount: Integer;
begin
  with Sender as TdxBarListItem do
  begin
    Items.Clear;
    if dxFrameManager.Count = 0 then exit;
    ALastSideBarGroupIndex := dxFrameManager[0].SideBarGroupIndex;
    ASeparatorCount := 0;
    for I := 0 to dxFrameManager.Count - 1 do
    begin
      if dxFrameManager[I].SideBarGroupIndex > -1 then
      begin
        if ALastSideBarGroupIndex <> dxFrameManager[I].SideBarGroupIndex then
        begin
          Items.Add('-');
          Inc(ASeparatorCount);
        end;
        ALastSideBarGroupIndex := dxFrameManager[I].SideBarGroupIndex;
        Items.AddObject(dxFrameManager[I].Caption, dxFrameManager[I]);
        if dxFrameManager[I].Active then ItemIndex := I + ASeparatorCount;
      end;
    end;
  end;
end;

procedure WarningMessage(const Message: string);
begin
  MessageBeep(MB_ICONEXCLAMATION);
  MessageBox(Application.Handle, PChar(Message),
    PChar('ExpressPrinting System 2'), MB_OK or MB_ICONEXCLAMATION);
end;

procedure TfrmMain.PSPrintDeviceBusy;
begin
  WarningMessage(sdxPrinterIsBusy);
end;

procedure TfrmMain.PSPrintDeviceError;
begin
  WarningMessage(sdxPrinterError);
end;

procedure TfrmMain.ShowMessageAboutPrintingSystem;
begin
  {$IFNDEF PS3}
    {$IFDEF TREELIST4}
    Application.MessageBox(PChar(sdxExpressPrintingMessageTreeList),
      'ExpressPrinting System', MB_ICONINFORMATION);
    {$ELSE}
      {$IFDEF VERTGRID}
      Application.MessageBox(PChar(sdxExpressPrintingMessageVerticalGrid),
        'ExpressPrinting System', MB_ICONINFORMATION);
      {$ELSE}
      Application.MessageBox(PChar(sdxExpressPrintingMessage),
        'ExpressPrinting System', MB_ICONINFORMATION);
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
end;

procedure TfrmMain.dxComponentPrinterPrintDeviceError(Sender: TObject;
  var ADone: Boolean);
begin
  PSPrintDeviceError;
end;

procedure TfrmMain.dxComponentPrinterPrintDeviceBusy(Sender: TObject;
  var ADone: Boolean);
begin
  PSPrintDeviceBusy;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  ShowFrame(StartFrameID);
end;

procedure TfrmMain.dxPrintStyleManager1ChangeCurrentStyle(Sender: TObject);
begin
  GetActiveReportLink;
  biPrintStyles.ItemIndex := dxPrintStyleManager1.CurrentStyleIndex;
end;

procedure TfrmMain.dxPrintStyleManager1StyleListChanged(Sender: TObject);
begin
  GetActiveReportLink;
  if dxComponentPrinter.CurrentLink <> nil then 
    dxComponentPrinter.CurrentLink.BuildPageSetupMenu(biPrintStyles, biDefinePrintStyles, True);
end;

procedure TfrmMain.NavBarLinkClick(Sender: TObject;
  ALink: TdxNavBarItemLink);
begin
  if ALink.Item.Tag > 0 then
    ShowFrame(ALink.Item.Tag);
end;

procedure TfrmMain.dxComponentPrinterStartGenerateReport(Sender: TObject;
  AReportLink: TBasedxReportLink);
begin
  if NeedReflectProgressStage then
  begin
    ChangeStatusHintVisibility(False);  

    FProgressStatusPanel := StatusBar.Panels.Add;
    FProgressStatusPanel.PanelStyleClass := TdxStatusBarContainerPanelStyle;
    FProgressBar.Parent := TdxStatusBarContainerPanelStyle(FProgressStatusPanel.PanelStyle).Container;
    StatusBar.Update;
  end;  
end;

procedure TfrmMain.dxComponentPrinterEndGenerateReport(Sender: TObject;
  AReportLink: TBasedxReportLink);
begin
  if NeedReflectProgressStage then
  begin
    FProgressBar.Parent := nil;
    FProgressBar.Position := 0;
    FreeAndNil(FProgressStatusPanel);
    
    ChangeStatusHintVisibility(True);
  end;  
end;

procedure TfrmMain.dxComponentPrinterGenerateReportProgress(Sender: TObject; 
  AReportLink: TBasedxReportLink; APercentDone: Double);
begin
  if NeedReflectProgressStage then
  begin
    FProgressBar.Position := Round(APercentDone);
    FProgressBar.Parent.Update;
  end;
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if NeedReflectProgressStage and (cpsBuilding in dxComponentPrinter.State) and (Key = VK_ESCAPE) then
    dxComponentPrinter.AbortBuilding := True;
end;

type
  TcxGridDemoNavBarViewPainter = class(TdxNavBarSkinExplorerBarPainter)
  protected
    class function GetViewInfoClass: TdxNavBarViewInfoClass; override;
  end;

  TcxGridDemoNavBarViewInfo = class(TdxNavBarSkinBasedExplorerBarViewInfo)
  protected
    procedure DoCalculateBounds(X, Y: Integer); override;
  end;

{ TcxGridDemoNavBarViewPainter }

class function TcxGridDemoNavBarViewPainter.GetViewInfoClass: TdxNavBarViewInfoClass;
begin
  Result := TcxGridDemoNavBarViewInfo;
end;

{ TcxGridDemoNavBarViewInfo }

procedure TcxGridDemoNavBarViewInfo.DoCalculateBounds(X, Y: Integer);
begin
  inherited DoCalculateBounds(X, 1);
end;

procedure TfrmMain.cxTextEdit1PropertiesChange(Sender: TObject);
begin
  SetNavBarFilter(edtNavBarFilterText.Text);
end;

type
 PdxMouseHookStructEx = ^TdxMouseHookStructEx;
 TdxMouseHookStructEx = packed record
   pt: TPoint;
   hwnd: HWND;
   wHitTestCode: UINT;
   dwExtraInfo: DWORD;
   MouseData: DWord;
 end;

procedure MouseHook(ACode: Integer; wParam: WPARAM; lParam: LPARAM; var AHookResult: LRESULT);
var
  I: Integer; 
  APoint: TPoint;
  ANavBar: TdxNavBar;
  ADelta: SmallInt;
  AInfo: PdxMouseHookStructEx;
begin
  if not IsWin2KOrLater or (frmMain = nil) or not frmMain.HandleAllocated then Exit;
  ANavBar := frmMain.NavBar;
  AInfo := PdxMouseHookStructEx(lParam);
  APoint :=  frmMain.NavBar.ScreenToClient(AInfo.pt);
  if (wParam = WM_MOUSEWHEEL) and PtInRect(ANavBar.ClientBounds, APoint) and (AInfo.hwnd <> ANavBar.Handle) then
  begin
    ADelta := HiWord(AInfo.MouseData);
    SendMessage(ANavbar.Handle, WM_SETREDRAW, 0, 0);
    for I := 0 to 1 do
      ANavbar.Controller.MouseWheel([], ADelta * Mouse.WheelScrollLines, APoint);
    SendMessage(ANavbar.Handle, WM_SETREDRAW, 1, 0);
    Windows.RedrawWindow(ANavbar.Handle, nil, 0, RDW_ERASE or RDW_INVALIDATE or RDW_FRAME or RDW_ALLCHILDREN or RDW_UPDATENOW);
    AHookResult := 1;
  end;
end;

procedure InitializeDemo;
begin
  dxMegaDemoProductIndex := dxGridIndex;
  dxNavBarViewsFactory.RegisterView(NavBarDemoStyle, 'DemoView', TcxGridDemoNavBarViewPainter);
  dxSetHook(htMouse, MouseHook);
end;

procedure FinalizeDemo;
begin
  dxReleaseHook(MouseHook);
end;

initialization
  InitializeDemo;

finalization
  FinalizeDemo;

end.


