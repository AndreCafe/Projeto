unit Main;

interface

uses
{$I dxSkins.inc}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, ImgList, Menus, dxCore,
  dxBar, dxBarExtItems, dxBarDBNav, dxBarExtDBItems, dxNavBarConsts,
  dxOperations, dxOperationTypes,
  Db, dxPSGlbl, dxPSCore, dxPSUtl, dxPrnPg, dxPScxCommon, dxPScxExtCommon,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSPrVwAdv,
  dxPSEdgePatterns, dxPSEngn, dxPgsDlg, dxPSRes, cxLookAndFeels, 
  cxLookAndFeelPainters, dxNavBarBase, dxNavBarCollns, dxNavBar, dxFrame,
  cxStyles, cxControls, cxInplaceContainer, cxSplitter, cxGraphics, 
  cxProgressBar, dxStatusBar, cxContainer, cxEdit, cxClasses, dxSkinsForm,
  dxSkinsCore, dxSkinsdxNavBarPainter, dxSkinsdxStatusBarPainter,
  dxSkinsdxBarPainter, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxSkinsdxRibbonPainter, dxSkinscxPCPainter, dxPScxPageControlProducer,
  dxBarSkinnedCustForm, ActnList;

type
  TfrmMain = class(TForm, IdxgdEventSubscriber, IcxLookAndFeelNotificationListener)
    dxBarManager: TdxBarManager;
    dxBarSubItemFile: TdxBarSubItem;
    biPrint: TdxBarButton;
    biExit: TdxBarButton;
    dxBarSubItemHelp: TdxBarSubItem;
    biView: TdxBarSubItem;
    btnGo: TdxBarSubItem;
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
    biExportToExcel: TdxBarButton;
    biExportToText: TdxBarButton;
    biOptions: TdxBarSubItem;
    biAutoSearch: TdxBarButton;
    biAutoExpandOnSearch: TdxBarButton;
    biSearchColor: TdxBarColorCombo;
    biSearchTextColor: TdxBarColorCombo;
    biViews: TdxBarListItem;
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
    NavBar: TdxNavBar;
    nvgGrid: TdxNavBarGroup;
    nvgEditors: TdxNavBarGroup;
    biNative: TdxBarButton;
    nvgExport: TdxNavBarGroup;
    nbiExportHTML: TdxNavBarItem;
    nbiExportXML: TdxNavBarItem;
    nbiExportXLS: TdxNavBarItem;
    nbiExportText: TdxNavBarItem;
    pnlHintText: TPanel;
    biTreeListAddNode: TdxBarButton;
    biTreeListAddChildNode: TdxBarButton;
    biTreeListPost: TdxBarButton;
    biTreeListCancel: TdxBarButton;
    biTreeListDelete: TdxBarButton;
    biTreeListAddSection: TdxBarButton;
    biTreeListAddValue: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    StatusBar: TdxStatusBar;
    StatusBarContainer2: TdxStatusBarContainerControl;
    dxBarDockControl: TdxBarDockControl;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    nvgTreeList: TdxNavBarGroup;
    nvgVertGrid: TdxNavBarGroup;
    nvgExpressControls: TdxNavBarGroup;
    nvgStandardControls: TdxNavBarGroup;
    biFileNew: TdxBarButton;
    biFileOpen: TdxBarButton;
    biFileSave: TdxBarButton;
    actUndo: TdxBarCombo;
    actRedo: TdxBarCombo;
    biUndo: TdxBarButton;
    biRedo: TdxBarButton;
    bsiEdit: TdxBarSubItem;
    biCut: TdxBarButton;
    biCopy: TdxBarButton;
    biPast: TdxBarButton;
    biDeleteCells: TdxBarButton;
    biInsertCells: TdxBarButton;
    biFontName: TdxBarFontNameCombo;
    biFontColor: TdxBarColorCombo;
    biFontSize: TdxBarSpinEdit;
    biAlignRight: TdxBarButton;
    biAlignCenter: TdxBarButton;
    biAlignLeft: TdxBarButton;
    biFontItalic: TdxBarButton;
    biFontBold: TdxBarButton;
    biFontUnderLine: TdxBarButton;
    biFontStrikeOut: TdxBarButton;
    biCellMerge: TdxBarButton;
    biCellUnMerge: TdxBarButton;
    bsiInsert: TdxBarSubItem;
    dxBarButton2: TdxBarButton;
    biInsertRow: TdxBarButton;
    biInsertColumn: TdxBarButton;
    biInsertSheet: TdxBarButton;
    biSelectionText: TdxBarCombo;
    biCellText: TdxBarEdit;
    bpmSpreadSheet: TdxBarPopupMenu;
    biCellShow: TdxBarButton;
    biCellHide: TdxBarButton;
    biCellProperties: TdxBarButton;
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
    procedure nbiExportHTMLClick(Sender: TObject);
    procedure nbiExportXMLClick(Sender: TObject);
    procedure nbiExportXLSClick(Sender: TObject);
    procedure nbiExportTextClick(Sender: TObject);
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
    procedure RegisterPopupMenus;

    procedure SetNavBarWidth;
    
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
  uStrsConst, dxOffice11, dxDemoUtils, cxVerticalGridDemoUtils;

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
  dxOperationManager.RegisterSubscriber(Self);
  RootLookAndFeel.AddChangeListener(self);
  RegisterBarItems;
  RegisterBars;
  RegisterPopupMenus;
  InitNavBar;
  CreateProgressBar;
  dxBarManager.Style := bmsUseLookAndFeel;
  StatusBar.PaintStyle := stpsUseLookAndFeel;
  CreateSkinsMenuItems(dxBarManager, biStyle, dxSkinController1);
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
end;


procedure TfrmMain.InitNavBar;
var
  I: Integer;
  AFrameInfo: TdxFrameInfo;
  AItem: TdxNavBarItem;
begin
  nvgVertGrid.Visible := True;
  for I := 0 to dxFrameManager.Count - 1 do
  begin
    AFrameInfo := dxFrameManager[I];
    AItem := NavBar.Items.Add;
    AItem.Caption := AFrameInfo.Caption;
    AItem.LargeImageIndex := AFrameInfo.LargeImageIndex;
    AItem.SmallImageIndex := AFrameInfo.SmallImageIndex;
    AItem.Tag := AFrameInfo.ID;
    if (AFrameInfo.SideBarGroupIndex < NavBar.Groups.Count) and (AFrameInfo.SideBarGroupIndex > -1) then
      NavBar.Groups[AFrameInfo.SideBarGroupIndex].CreateLink(AItem);
  end;
  SetNavBarWidth;

  for I := NavBar.Groups.Count - 1 downto 0 do
    if not NavBar.Groups[I].Visible then
      NavBar.Groups[I].Free;
  NavBar.ActiveGroupIndex := 0;

end;

procedure TfrmMain.RegisterBarItems;

  procedure RegisterFileItems;
  begin
    with dxOperationManager do
    begin
      RegisterBarItem(biExportTo, otExportTo);
      RegisterBarItem(biExportToHTML, otExportToHTML);
      RegisterBarItem(biExportToXML, otExportToXML);
      RegisterBarItem(biExportToExcel, otExportToExcel);
      RegisterBarItem(biExportToText, otExportToText);
      RegisterBarItem(biPrint, otPrint);
      RegisterBarItem(biPrintStyles, otPrintStyles);
      RegisterBarItem(biDefinePrintStyles, otDefinePrintStyles);
      RegisterBarItem(biPrintPreview, otPrintPreview);
      RegisterBarItem(biExit, otExit);
      RegisterBarItem(biHintContainer, otHint);
      RegisterBarItem(biShowInspector, otShowInspector);
    end;
  end;

  procedure RegisterDBNavigatorItems;
  begin
    with dxOperationManager do
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
  end;

  procedure RegisterStatusBarItems;
  begin
    with dxOperationManager do
    begin
      RegisterBarItem(biHintContainer, otHint);
    end;
  end;

  procedure RegisterViewItems;
  begin
    with dxOperationManager do
    begin
      RegisterBarItem(biViews, otGoToView);
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
  end;

  procedure RegisterOptionsItems;
  begin
    with dxOperationManager do
    begin
      RegisterBarItem(biOptions, otOptions);
      RegisterBarItem(biAutoSearch, otAutoSearch);
      RegisterBarItem(biAutoExpandOnSearch, otAutoExpandOnSearch);
      RegisterBarItem(biSearchColor, otSearchColor);
      RegisterBarItem(biSearchTextColor, otSearchTextColor);
    end;
  end;

  procedure RegisterTreeListItems;
  begin
    with dxOperationManager do
    begin
      RegisterBarItem(biTreeListAddNode, otTreeListAddNode);
      RegisterBarItem(biTreeListAddChildNode, otTreeListAddChildNode);
      RegisterBarItem(biTreeListPost, otTreeListPost);
      RegisterBarItem(biTreeListCancel, otTreeListCancel);
      RegisterBarItem(biTreeListDelete, otTreeListDelete);
      RegisterBarItem(biTreeListAddSection, otTreeListAddSection);
      RegisterBarItem(biTreeListAddValue, otTreeListAddValue);
    end;
  end;

  procedure RegisterFileOperations;
  begin
    with dxOperationManager do
    begin
      RegisterBarItem(biFileNew, otFileNew);
      RegisterBarItem(biFileOpen, otFileOpen);
      RegisterBarItem(biFileSave, otFileSave);
      RegisterBarItem(biUndo, otUndo);
      RegisterBarItem(biRedo, otRedo);
    end;
  end;

  procedure RegisterEditOperations;
  begin
    with dxOperationManager do
    begin
      RegisterBarItem(bsiEdit, otEditOperations);
      RegisterBarItem(biCut, otCut);
      RegisterBarItem(biCopy, otCopy);
      RegisterBarItem(biPast, otPast);
      RegisterBarItem(biDeleteCells, otDeleteCells);
      RegisterBarItem(biInsertCells, otInsertCells);
    end;
  end;

  procedure RegisterFontFormatOperations;
  begin
    with dxOperationManager do
    begin
      RegisterBarItem(biFontName, otFontName);
      RegisterBarItem(biFontColor, otFontColor);
      RegisterBarItem(biFontSize, otFontSize);
      RegisterBarItem(biFontItalic, otFontItalic);
      RegisterBarItem(biFontBold, otFontBold);
      RegisterBarItem(biFontUnderLine, otFontUnderLine);
      RegisterBarItem(biFontStrikeOut, otFontStrikeOut);
      RegisterBarItem(biAlignLeft, otAlignLeft);
      RegisterBarItem(biAlignCenter, otAlignCenter);
      RegisterBarItem(biAlignRight, otAlignRight);
      RegisterBarItem(biCellMerge, otCellMerge);
      RegisterBarItem(biCellUnMerge, otCellUnMerge);
    end;
  end;

  procedure RegisterSheetOperations;
  begin
    with dxOperationManager do
    begin
       RegisterBarItem(bsiInsert, otInsertOperations);
       RegisterBarItem(biInsertRow, otInsertRow);
       RegisterBarItem(biInsertColumn, otInsertColumn);
       RegisterBarItem(biInsertSheet, otInsertSheet);
       RegisterBarItem(biSelectionText, otSelectionText);
       RegisterBarItem(biCellText, otCellText);
       RegisterBarItem(biCellShow, otCellShow);
       RegisterBarItem(biCellHide, otCellHide);
       RegisterBarItem(biCellProperties, otCellProperties);
    end;
  end;

  procedure RegisterDiagramOperations;
  begin
    with dxOperationManager do
    begin
      RegisterBarItem(biColumnDiagram, otColumnDiagram);
      RegisterBarItem(biBarDiagram, otBarDiagram);
      RegisterBarItem(biCategoriesInReverseOrder, otCategoriesInReverseOrder);
      RegisterBarItem(biValueAxisAtMaxCategory, otValueAxisAtMaxCategory);
    end;
  end;

begin
  RegisterFileItems;
  RegisterFileOperations;
  RegisterEditOperations;
  RegisterFontFormatOperations;
  RegisterDBNavigatorItems;
  RegisterStatusBarItems;
  RegisterViewItems;
  RegisterOptionsItems;
  RegisterTreeListItems;
  RegisterSheetOperations;
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

procedure TfrmMain.RegisterPopupMenus;
begin
  with dxOperationManager do
  begin
    RegisterPopupMenu(bpmSpreadSheet, pmSpreadSheet);
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
  NavBar.Width := AMaxWidth;
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
    (exHTML, exXML, exExcel, exText);
  WebSiteAddress = 'http://www.devexpress.com';
  Links: array[otLinkProducts..otLinkMain] of string =
    (WebSiteAddress + '/products/vcl/',
     {$IFDEF TREELIST4}
     WebSiteAddress + '/downloads/vcl/treelist.asp',
     {$ELSE}
       {$IFDEF VERTGRID}
       WebSiteAddress + '/downloads/vcl/vertgrid.asp',
       {$ELSE}
       WebSiteAddress + '/downloads/vcl/',
       {$ENDIF}
     {$ENDIF}
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
    otExportToHTML, otExportToXML, otExportToExcel, otExportToText:
      DoExport(GridExportTypes[AOperationType]);
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
  SetNavBarStyle(NavBar, dxSkinController1);
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
      ('html', 'xml', 'xls', 'txt');
    Filters: array[TSupportedExportType] of string =
      ('HTML File (*.html)|*.html',
       'XML File (*.xml)|*.xml',
       'Microsoft Excel 4.0 Worksheet (*.xls)|*.xls',
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
        if(dxFrameManager.ActiveFrame <> nil) then
        begin
          dxFrameManager.ActiveFrame.Images := NavBar.SmallImages;
          dxFrameManager.ActiveFrame.ImageIndex := dxFrameManager.ActiveFrameInfo.SmallImageIndex;
        end;
      finally
        LockWindowUpdate(0);
        NavBar.DragDropFlags := ANavBarDragDropFlags;
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
      biExportToExcel.Enabled := IsSupportExport(exExcel);
      biExportToText.Enabled := IsSupportExport(exText);

      nbiExportHTML.Enabled := biExportToHTML.Enabled;
      nbiExportXML.Enabled := biExportToXML.Enabled;
      nbiExportXLS.Enabled := biExportToExcel.Enabled;
      nbiExportText.Enabled := biExportToText.Enabled;
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
  for AGroupIndex := 0 to NavBar.Groups.Count - 1 do
  begin
    AGroup := NavBar.Groups[AGroupIndex];
    for ALinkIndex := 0 to AGroup.LinkCount - 1 do
    begin
      ALink := AGroup.Links[ALinkIndex];
      ALink.Selected := ALink.Item.Tag = FrameID;
      if ALink.Selected then
        TdxNavBarViewInfoAccess(NavBar.ViewInfo).MakeLinkVisible(ALink, False);
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

procedure TfrmMain.nbiExportHTMLClick(Sender: TObject);
begin
  DoExport(exHTML);
end;

procedure TfrmMain.nbiExportXMLClick(Sender: TObject);
begin
  DoExport(exXML);
end;

procedure TfrmMain.nbiExportXLSClick(Sender: TObject);
begin
  DoExport(exExcel);
end;

procedure TfrmMain.nbiExportTextClick(Sender: TObject);
begin
  DoExport(exText);
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

initialization
  dxMegaDemoProductIndex := dxVerticalGridIndex;

end.
