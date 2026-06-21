unit cxPivotDemoMainUnit;

interface

uses
{$I dxSkins.inc}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  cxClasses, Dialogs, dxBar, ImgList, dxNavBarCollns, dxNavBarBase, ExtCtrls,
  dxNavbarXPViews, dxNavBar, cxPivotBaseFormUnit, cxLookAndFeels,
  cxLookAndFeelPainters, cxControls, cxSplitter, StdCtrls, cxContainer, cxListBox, cxCustomPivotGrid,
  dxOffice11, DB, cxExportPivotGridLink, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, dxPScxCommon, dxPScxPivotGridLnk,
  cxPivotInspectorUnit, dxPSPrVwAdv,
  dxSkinsCore, cxGraphics, dxSkinsForm, dxSkinsdxNavBarPainter,
  dxSkinsdxBarPainter, cxCustomPivotBaseFormUnit,
  dxGDIPlusClasses, dxBarSkinnedCustForm, dxCore, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwRibbon,
  dxSkinsdxRibbonPainter,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer;

type
  TcxPivotGridDemoUnitInfo = class;
  TcxPivotGridAccess = class(TcxCustomPivotGrid);
  TcxPivotGridViewInfoAccess = class(TcxPivotGridViewInfo);

  TPivotGridFeaturesDemoMainForm = class(TForm)
    nbDemos: TdxNavBar;
    nbgSampleReports: TdxNavBarGroup;
    nbiCustomerReports: TdxNavBarItem;
    nbiOrderReports: TdxNavBarItem;
    nbiProductReports: TdxNavBarItem;
    BarManager: TdxBarManager;
    bsiLookAndFeel: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    bsiAbout: TdxBarSubItem;
    bsiOptionsView: TdxBarSubItem;
    cxSplitter1: TcxSplitter;
    nbiSingleTotal: TdxNavBarItem;
    nbiMultipleTotals: TdxNavBarItem;
    nbiTotalsLocation: TdxNavBarItem;
    nbiSortBySummary: TdxNavBarItem;
    nbiTopValues: TdxNavBarItem;
    nbiIntervalGrouping: TdxNavBarItem;
    nbiFieldsCustomization: TdxNavBarItem;
    nbiGroups: TdxNavBarItem;
    nbgSummary: TdxNavBarGroup;
    nbiCustomDraw: TdxNavBarItem;
    nbiHTML: TdxNavBarItem;
    nbiXML: TdxNavBarItem;
    nbiExcel: TdxNavBarItem;
    nbiText: TdxNavBarItem;
    nbiStyles: TdxNavBarItem;
    nbiPrintPreview: TdxNavBarItem;
    nbiPageSetup: TdxNavBarItem;
    nbiPrint: TdxNavBarItem;
    Panel1: TPanel;
    pnPivotSite: TPanel;
    nbiSummaryVariation: TdxNavBarItem;
    SaveDialog: TSaveDialog;
    dxComponentPrinter: TdxComponentPrinter;
    dxComponentPrinterPivotReportLink: TcxPivotGridReportLink;
    dxBarSubItem1: TdxBarSubItem;
    dxBarSubItem2: TdxBarSubItem;
    biShowColumnTotals: TdxBarButton;
    biShowRowTotals: TdxBarButton;
    biShowTotalsForSingleValue: TdxBarButton;
    biShowGrandTotalsForSingleValue: TdxBarButton;
    biShowColumnGrandTotals: TdxBarButton;
    biShowRowGrandTotals: TdxBarButton;
    biShowColumnFields: TdxBarButton;
    biShowFilterFields: TdxBarButton;
    biShowDataFields: TdxBarButton;
    biShowFilterSeparator: TdxBarButton;
    biShowRowFields: TdxBarButton;
    bbPrintPreview: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    dxBarButton5: TdxBarButton;
    dxBarButton8: TdxBarButton;
    bbInspector: TdxBarButton;
    siExport: TdxBarSubItem;
    dxBarButton16: TdxBarButton;
    dxBarButton17: TdxBarButton;
    dxBarButton18: TdxBarButton;
    dxBarButton19: TdxBarButton;
    dxPSEngineController1: TdxPSEngineController;
    nbiChartConnection: TdxNavBarItem;
    nbgHighlighted: TdxNavBarGroup;
    dxSkinController: TdxSkinController;
    nbiPrefilter: TdxNavBarItem;
    nbiInplaceEditors: TdxNavBarItem;
    dxBarSubItem5: TdxBarSubItem;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarSubItem6: TdxBarSubItem;
    dxBarSubItem7: TdxBarSubItem;
    biColumnFar: TdxBarButton;
    biColumnNear: TdxBarButton;
    biRowFar: TdxBarButton;
    biRowNear: TdxBarButton;
    dxBarSubItem8: TdxBarSubItem;
    dxBarSubItem9: TdxBarSubItem;
    biCrossCells: TdxBarButton;
    biGrandTotalsCells: TdxBarButton;
    biTotalsCells: TdxBarButton;
    dxBarButton15: TdxBarButton;
    biMultiSelect: TdxBarButton;
    biHideFocus: TdxBarButton;
    biHideSelection: TdxBarButton;
    nbiOLAPBrowser: TdxNavBarItem;
    nbiSummaryDataSet: TdxNavBarItem;
    imgLinkImages: TcxImageList;
    nbDataShaping: TdxNavBarGroup;
    nbOLAPFeatures: TdxNavBarGroup;
    nbAppearance: TdxNavBarGroup;
    nbiOLAPDrillDown: TdxNavBarItem;
    nbiOLAPMultipleTotals: TdxNavBarItem;
    pnHeaderSite: TPanel;
    pbDemoHeader: TPaintBox;
    imgLogo: TImage;
    imgImages: TcxImageList;
    biRowTree: TdxBarButton;
    nbgNew: TdxNavBarGroup;
    nbgEditing: TdxNavBarGroup;
    nbgCharts: TdxNavBarGroup;
    nbiCompactLayout: TdxNavBarItem;
    procedure nbDemosLinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
    procedure FormDestroy(Sender: TObject);
    procedure biStyleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pbDemoHeaderPaint(Sender: TObject);
    procedure OnTotalsVisibilityItemClick(Sender: TObject);
    procedure OnItemVisibilityClick(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure PrintCommand(Sender: TObject);
    procedure bbInspectorClick(Sender: TObject);
    procedure ExportToClick(Sender: TObject);
    procedure biTotalsLocationClick(Sender: TObject);
    procedure biSelectionOptionsClick(Sender: TObject);
    procedure dxBarButton10Click(Sender: TObject);
    procedure dxSkinControllerSkinControl(Sender: TObject;
      AControl: TWinControl; var UseSkin: Boolean);
  private
    FDemoUnit: TcxPivotGridDemoUnitInfo;
    FSkinsBarMenuItems: TcxObjectList;
    FHeaderFont: HFont;
    function GetActiveFrameID: Integer;
    function GetActivePivotGrid: TcxCustomPivotGrid;
    function GetDemoCaption: string;
    procedure SelectUnit(AUnit: TcxPivotGridDemoUnitInfo);
    procedure SetActiveFrameID(AValue: Integer);
    procedure SynchronizeMenuItems;
    procedure OnIspectorChanged(Sender: TObject);
    procedure OnInspectorObjectChanged(Sender: TObject);
  protected
    LockUpdate: Boolean;
    Inspector: TfrmInspector;
    procedure DemoUnitChanged;
    procedure DoExportToFile(ACommand: Integer);
    procedure DoPrint(ACommand: Integer);
    procedure SyncSelectionOptionsWithMenu;
    procedure SyncMenuWithSelectionOptions;
    procedure SyncTotalsVisibilityWithMenu;
    procedure SyncMenuWithTotalsVisibility;
    procedure SyncItemsVisibilityWithMenu;
    procedure SyncMenuWithItemsVisibility;
  public
    function FindDemoByID(ID: Integer; out ADemo: TcxPivotGridDemoUnitInfo): Boolean;

    property ActiveFrameID: Integer read GetActiveFrameID write SetActiveFrameID;
    property ActivePivotGrid: TcxCustomPivotGrid read GetActivePivotGrid;
    property DemoCaption: string read GetDemoCaption;
    property DemoUnit: TcxPivotGridDemoUnitInfo read FDemoUnit write SelectUnit;
  end;

  { TcxPivotGridDemoUnitInfo }

  TcxPivotGridDemoUnitInfo = class
  protected
    UnitClass: TcxCustomPivotGridDemoUnitFormClass;
    UnitInstance: TcxCustomPivotGridDemoUnitForm;
  public
    constructor Create(AClass: TcxCustomPivotGridDemoUnitFormClass);
    destructor Destroy; override;
    procedure SetParent(AParent: TWinControl);
  end;

var
  PivotGridFeaturesDemoMainForm: TPivotGridFeaturesDemoMainForm;

procedure cxPivotGridRegisterDemoUnit(ADemoClass: TcxCustomPivotGridDemoUnitFormClass);


implementation

{$R *.dfm}

uses
  ShellApi, cxPivotLoadingSplash, dxSkinsLookAndFeelPainter, dxSkinsStrs,
  dxNavBarConsts, dxDemoUtils;

var
  ADemoUnits: TcxObjectList;

{  TcxPivotGridDemoUnitInfo }

constructor TcxPivotGridDemoUnitInfo.Create(AClass: TcxCustomPivotGridDemoUnitFormClass);
begin
  UnitClass := AClass;
end;

destructor TcxPivotGridDemoUnitInfo.Destroy;
begin
  SetParent(nil);
  inherited Destroy;
end;

procedure TcxPivotGridDemoUnitInfo.SetParent(AParent: TWinControl);
begin
  if (AParent <> nil) and (UnitInstance = nil) then
  begin
    UnitInstance := UnitClass.Create(nil);
    UnitInstance.Visible := False;
  end;
  if (AParent <> nil) and (UnitInstance.PivotGrid <> nil) then
    UnitInstance.PivotGrid.BeginUpdate;
  if UnitInstance <> nil then
    UnitInstance.Parent := AParent;
  if AParent = nil then
    FreeAndNil(UnitInstance)
  else
  begin
    UnitInstance.ActivateDataSet;
    UnitInstance.SendToBack;
    UnitInstance.Visible := True;
    if UnitInstance.PivotGrid <> nil then
    begin
      UnitInstance.PivotGrid.EndUpdate;
      TcxPivotGridViewInfoAccess(
        TcxPivotGridAccess(UnitInstance.PivotGrid).ViewInfo).BeforePaint;
    end;
    UnitInstance.BringToFront;
    UnitInstance.FrameActivated;
  end;
end;

{ TPivotGridFeaturesDemoMainForm }

function TPivotGridFeaturesDemoMainForm.FindDemoByID(
  ID: Integer; out ADemo: TcxPivotGridDemoUnitInfo): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 0 to ADemoUnits.Count - 1 do
  begin
    ADemo := TcxPivotGridDemoUnitInfo(ADemoUnits[I]);
    if ID = ADemo.UnitClass.GetID then
      Exit;
  end;
  Result := False;
end;

procedure TPivotGridFeaturesDemoMainForm.DemoUnitChanged;
begin
  pbDemoHeader.Refresh;
  LockUpdate := True;
  if Inspector <> nil then
    Inspector.InspectedObject := ActivePivotGrid;
  if ActivePivotGrid <> nil then
  begin
    ActivePivotGrid.BeginUpdate;
    try
      SyncMenuWithTotalsVisibility;
      SyncMenuWithItemsVisibility;
      SyncMenuWithSelectionOptions;
    finally
      LockUpdate := False;
      ActivePivotGrid.EndUpdate;
    end;
  end; 
end;

procedure TPivotGridFeaturesDemoMainForm.DoExportToFile(ACommand: Integer);
var
  AFileName: string;
const
  Exts: array[0..3] of string =
    ('html', 'xml', 'xls', 'txt');
  scxConfirm  = 'Confirm';
  scxSaveTo   = 'Save to';
  scxFileExist = 'File %s already exists.'#13#10'Do you whant to replace it?';
  scxOpenFile = 'Open file %s?';
begin
  SaveDialog.FileName := 'EPivotGrid.' + Exts[ACommand];
  SaveDialog.Filter := '*.' + Exts[ACommand] + '| *.' + Exts[ACommand];
  if SaveDialog.Execute then
  begin
    AFileName := ChangeFileExt(SaveDialog.FileName, '.' + Exts[ACommand]);
    if FileExists(AFileName) and (MessageBox(0, PChar(Format(scxFileExist, [AFileName])),
      scxSaveTo, MB_ICONWARNING or MB_YESNO) = mrNo) then Exit;
    case ACommand of
      0:
       cxExportPivotGridToHtml(AFileName, ActivePivotGrid);
      1:
       cxExportPivotGridToHtml(AFileName, ActivePivotGrid);
      2:
       cxExportPivotGridToExcel(AFileName, ActivePivotGrid);
      3:
       cxExportPivotGridToText(AFileName, ActivePivotGrid);
    end;
    if MessageBox(0, PChar(Format(scxOpenFile, [AFileName])),
      scxConfirm, MB_ICONINFORMATION or MB_YESNO) = mrYes then
      ShellExecute(Handle, PChar('OPEN'), PChar(AFileName), nil, nil, SW_SHOWMAXIMIZED);
  end;
end;

procedure TPivotGridFeaturesDemoMainForm.DoPrint(ACommand: Integer);
const
  sdxExpressPrintingMessage = 'The ExpressPrinting System allows you to render and ' +
    'print the contents of the ExpressPivotGrid, as well as a number of' +
    ' other Developer Express controls. This component library is not part of ' +
    'the ExpressPivotGrid Suite and can be acquired separately via our site at: www.devexpress.com.';
begin
  Application.MessageBox(PChar(sdxExpressPrintingMessage),
      'ExpressPrinting System', MB_ICONINFORMATION);
  dxComponentPrinterPivotReportLink.RebuildReport;
  case ACommand of
    0:
      dxComponentPrinter.Print(False, nil);
    1:
      dxComponentPrinter.PageSetup();
    2:
      dxComponentPrinter.Preview();
  end;
end;

procedure TPivotGridFeaturesDemoMainForm.SyncSelectionOptionsWithMenu;
var
  AIncludeCells: TcxPivotGridOptionsSelectionIncludes;
begin
  if ActivePivotGrid  = nil then
    Exit;
  with ActivePivotGrid.OptionsSelection do
  begin
    AIncludeCells := [];
    if biCrossCells.Down then
      AIncludeCells := AIncludeCells + [osiCrossCells];
    if biGrandTotalsCells.Down then
      AIncludeCells := AIncludeCells + [osiGrandTotalCells];
    if biTotalsCells.Down then
      AIncludeCells := AIncludeCells + [osiTotalCells];
    IncludeCells := AIncludeCells;
    MultiSelect := biMultiSelect.Down;
    HideFocusRect := biHideFocus.Down;
    HideSelection := biHideSelection.Down;
  end;
end;

procedure TPivotGridFeaturesDemoMainForm.SyncMenuWithSelectionOptions;
begin
  if ActivePivotGrid  = nil then
    Exit;
  with ActivePivotGrid.OptionsSelection do
  begin
    biCrossCells.Down := osiCrossCells in IncludeCells;
    biGrandTotalsCells.Down := osiGrandTotalCells in IncludeCells;
    biTotalsCells.Down := osiGrandTotalCells in IncludeCells;
    biMultiSelect.Down := MultiSelect;
    biHideFocus.Down := HideFocusRect;
    biHideSelection.Down := HideSelection;
  end;
end;

procedure TPivotGridFeaturesDemoMainForm.SyncTotalsVisibilityWithMenu;
begin
  if ActivePivotGrid  = nil then
    Exit;
  with ActivePivotGrid.OptionsView do
  begin
    ColumnTotals := biShowColumnTotals.Down;
    RowTotals := biShowRowTotals.Down;
    TotalsForSingleValues := biShowTotalsForSingleValue.Down;
    GrandTotalsForSingleValues := biShowGrandTotalsForSingleValue.Down;
    ColumnGrandTotals := biShowColumnGrandTotals.Down;
    RowGrandTotals := biShowRowGrandTotals.Down;
    ColumnTotalsLocation := TcxPivotGridColumnTotalsLocation(biColumnNear.Down);
    RowTotalsLocation := TcxPivotGridRowTotalsLocation(Byte(biRowNear.Down) + Byte(biRowTree.Down) * 2);
  end;
end;

procedure TPivotGridFeaturesDemoMainForm.SyncMenuWithTotalsVisibility;
begin
  if ActivePivotGrid  = nil then
    Exit;
  with ActivePivotGrid.OptionsView do
  begin
    biShowColumnTotals.Down := ColumnTotals;
    biShowRowTotals.Down := RowTotals;
    biShowTotalsForSingleValue.Down := TotalsForSingleValues;
    biShowGrandTotalsForSingleValue.Down := GrandTotalsForSingleValues;
    biShowColumnGrandTotals.Down := ColumnGrandTotals;
    biShowRowGrandTotals.Down := RowGrandTotals;
    biColumnNear.Down := ColumnTotalsLocation = ctlNear;
    biColumnFar.Down := ColumnTotalsLocation = ctlFar;
    biRowNear.Down := RowTotalsLocation = rtlNear;
    biRowFar.Down := RowTotalsLocation = rtlFar;
    biRowTree.Down := RowTotalsLocation = rtlTree;
  end;
end;

procedure TPivotGridFeaturesDemoMainForm.SyncItemsVisibilityWithMenu;
begin
  if ActivePivotGrid  = nil then
    Exit;
  with ActivePivotGrid.OptionsView do
  begin
    ColumnFields := biShowColumnFields.Down;
    DataFields := biShowDataFields.Down;
    FilterFields := biShowFilterFields.Down;
    FilterSeparator := biShowFilterSeparator.Down;
    RowFields := biShowRowFields.Down;
  end;
end;

procedure TPivotGridFeaturesDemoMainForm.SyncMenuWithItemsVisibility;
begin
  if ActivePivotGrid  = nil then
    Exit;
  with ActivePivotGrid.OptionsView do
  begin
    biShowColumnFields.Down := ColumnFields;
    biShowDataFields.Down := DataFields;
    biShowFilterFields.Down := FilterFields;
    biShowFilterSeparator.Down := FilterSeparator;
    biShowRowFields.Down := RowFields;
  end;
end;

function TPivotGridFeaturesDemoMainForm.GetActiveFrameID: Integer;
begin
  if DemoUnit <> nil then
    Result := DemoUnit.UnitClass.GetID
  else
    Result := -MaxInt; 
end;

function TPivotGridFeaturesDemoMainForm.GetActivePivotGrid: TcxCustomPivotGrid;
begin
  Result := nil;
  if (DemoUnit <> nil) and (DemoUnit.UnitInstance <> nil) then
    Result := DemoUnit.UnitInstance.PivotGrid;
end;

function TPivotGridFeaturesDemoMainForm.GetDemoCaption: string;
begin
  if DemoUnit <> nil then
    Result := DemoUnit.UnitInstance.Caption
  else
    Result := Application.Title
end;

procedure TPivotGridFeaturesDemoMainForm.SelectUnit(
  AUnit: TcxPivotGridDemoUnitInfo);
var
  APrevUnit: TcxPivotGridDemoUnitInfo;
begin
  if DemoUnit = AUnit then Exit;
  APrevUnit := FDemoUnit;
  FDemoUnit := AUnit;
  if FDemoUnit <> nil then
    DemoUnit.SetParent(pnPivotSite);
  if APrevUnit <> nil then
    APrevUnit.SetParent(nil);
  if FDemoUnit <> nil then
    dxComponentPrinterPivotReportLink.Component := AUnit.UnitInstance.PivotGrid
  else
    dxComponentPrinterPivotReportLink.Component := nil; 
  SynchronizeMenuItems;
  DemoUnitChanged;
end;

procedure TPivotGridFeaturesDemoMainForm.SetActiveFrameID(AValue: Integer);
var
  ADemo: TcxPivotGridDemoUnitInfo;
begin
  if (ActiveFrameID <> AValue) and FindDemoByID(AValue, ADemo) then
    DemoUnit := ADemo;
end;

procedure TPivotGridFeaturesDemoMainForm.SynchronizeMenuItems;
begin
  if (ActivePivotGrid = nil) then
  begin
    nbDemos.DeSelectLinks;
    if bbInspector.Down then
      bbInspector.Click;
  end;
  bbPrintPreview.Enabled := ActivePivotGrid <> nil;
  bbInspector.Enabled := ActivePivotGrid <> nil;
  siExport.Enabled := ActivePivotGrid <> nil;

  dxBarButton5.Enabled := ActivePivotGrid <> nil;
  bbPrintPreview.Enabled := ActivePivotGrid <> nil;
  dxBarButton3.Enabled := ActivePivotGrid <> nil;
  bbInspector.Enabled := ActivePivotGrid <> nil;
  dxBarButton16.Enabled := ActivePivotGrid <> nil;
  dxBarButton17.Enabled := ActivePivotGrid <> nil;
  dxBarButton18.Enabled := ActivePivotGrid <> nil;
  dxBarButton19.Enabled := ActivePivotGrid <> nil;
end;

procedure TPivotGridFeaturesDemoMainForm.OnIspectorChanged(
  Sender: TObject);
begin
  bbInspector.Down := (Inspector <> nil) and Inspector.Visible;
end;

procedure TPivotGridFeaturesDemoMainForm.OnInspectorObjectChanged(
  Sender: TObject);
begin

end;

procedure TPivotGridFeaturesDemoMainForm.nbDemosLinkClick(Sender: TObject;
  ALink: TdxNavBarItemLink);
begin
  ActiveFrameID := ALink.Item.Tag;
end;

procedure cxPivotGridRegisterDemoUnit(ADemoClass: TcxCustomPivotGridDemoUnitFormClass);
var
  ADemoInfo: TcxPivotGridDemoUnitInfo;
begin
  ADemoInfo := TcxPivotGridDemoUnitInfo.Create(ADemoClass);
  ADemoInfo.SetParent(nil);
  ADemoUnits.Add(ADemoInfo);
end;

procedure TPivotGridFeaturesDemoMainForm.FormDestroy(Sender: TObject);
begin
  DeleteObject(FHeaderFont);
  DemoUnit := nil;
  FSkinsBarMenuItems.Free;
end;

procedure TPivotGridFeaturesDemoMainForm.biStyleClick(Sender: TObject);

  procedure UpdateNavBarLookAndFeel;
  begin
    if dxSkinController.NativeStyle then
      if IsWinVista then
        nbDemos.View := dxNavBarVistaExplorerBarView
      else
        nbDemos.View := dxNavBarXPExplorerBarView
    else
      case dxSkinController.Kind of
        lfStandard, lfFlat:
          nbDemos.View := dxNavBarExplorerBarView;
        lfUltraFlat:
          nbDemos.View := dxNavBarUltraFlatExplorerView;
        lfOffice11:
          nbDemos.View := dxNavBarOffice11ExplorerBarView;
      end;
  end;

var
  AKind: TcxLookAndFeelKind;
begin
  if not TdxBarButton(Sender).Down then Exit;
  dxSkinController.UseSkins := False;
  AKind := dxSkinController.Kind;
  case (Sender as TdxBarButton).Tag of
    0:
      AKind := lfFlat;
    1:
      AKind := lfStandard;
    2:
      AKind := lfUltraFlat;
    4:
      AKind := lfOffice11;
  end;
  dxSkinController.Kind := AKind;
  dxSkinController.NativeStyle := (Sender as TdxBarButton).Tag = 3;
  UpdateNavBarLookAndFeel;
  DemoUnitChanged;
end;

procedure TPivotGridFeaturesDemoMainForm.FormCreate(Sender: TObject);
var
  ALogFont: TLogFont;
begin
  Panel1.DoubleBuffered := True;
  ActiveFrameID := -1;
  if GetObject(pbDemoHeader.Font.Handle, SizeOf(ALogFont), @ALogFont) <> 0 then
  begin
    ALogFont.lfQuality := ANTIALIASED_QUALITY;
    FHeaderFont := CreateFontIndirect(ALogFont);
  end;
  if FHeaderFont = 0 then
    FHeaderFont := pbDemoHeader.Font.Handle;
  CreateSkinsMenuItems(BarManager, bsiLookAndFeel, dxSkinController, nbDemos);
  CreateHelpMenuItems(BarManager, bsiAbout);
end;

procedure TPivotGridFeaturesDemoMainForm.pbDemoHeaderPaint(
  Sender: TObject);
var
  R: TRect;
  DC: HDC;
  APrevFont: HFont;
begin
  R := (Sender as TPaintBox).ClientRect;
  DC := (Sender as TPaintBox).Canvas.Handle;
  SetBkMode(DC, Transparent);
  APrevFont := SelectObject(DC, FHeaderFont); 
  SetTextColor(DC, ColorToRgb((Sender as TPaintBox).Font.Color));
  DrawText(DC, PChar(DemoCaption), Length(DemoCaption), R, DT_VCENTER or DT_SINGLELINE);
  SelectObject(DC, APrevFont); 
end;

procedure TPivotGridFeaturesDemoMainForm.OnTotalsVisibilityItemClick(
  Sender: TObject);
begin
  if LockUpdate then Exit;
  SyncTotalsVisibilityWithMenu;
end;

procedure TPivotGridFeaturesDemoMainForm.OnItemVisibilityClick(
  Sender: TObject);
begin
  if LockUpdate then Exit;
  SyncItemsVisibilityWithMenu;
end;

procedure TPivotGridFeaturesDemoMainForm.ExitClick(
  Sender: TObject);
begin
  Application.Terminate;
end;

procedure TPivotGridFeaturesDemoMainForm.PrintCommand(Sender: TObject);
begin
  DoPrint(TComponent(Sender).Tag);
end;

procedure TPivotGridFeaturesDemoMainForm.bbInspectorClick(
  Sender: TObject);
begin
  if Inspector = nil then
  begin
    Inspector := TfrmInspector.Create(nil);
    Inspector.OnInspectedObjectChanged := OnInspectorObjectChanged;
    Inspector.OnShow := OnIspectorChanged;
    Inspector.OnHide := OnIspectorChanged;
    if Application.MainForm.WindowState = wsMaximized then
    begin
      with Application.MainForm.BoundsRect do
      begin
        Inspector.Left := Right - Inspector.Width;
        Inspector.Top := Bottom - Inspector.Height;
      end;
    end
    else
    begin
      Inspector.Left := Screen.Width - Inspector.Width;
      Inspector.Top := Screen.Height - Inspector.Height;
    end;
  end;
  if bbInspector.Down then
  begin
    Inspector.InspectedObject := ActivePivotGrid;
    Inspector.Show;
  end
  else
    Inspector.Hide;
end;

procedure TPivotGridFeaturesDemoMainForm.ExportToClick(
  Sender: TObject);
begin
  DoExportToFile(TComponent(Sender).Tag);
end;

procedure TPivotGridFeaturesDemoMainForm.biTotalsLocationClick(
  Sender: TObject);
begin
  if LockUpdate then Exit;
  SyncTotalsVisibilityWithMenu;
end;

procedure TPivotGridFeaturesDemoMainForm.biSelectionOptionsClick(
  Sender: TObject);
begin
  if LockUpdate then Exit;
  SyncSelectionOptionsWithMenu;
end;

procedure TPivotGridFeaturesDemoMainForm.dxBarButton10Click(
  Sender: TObject);
begin
  ActiveFrameID := -1;
end;

procedure TPivotGridFeaturesDemoMainForm.dxSkinControllerSkinControl(
  Sender: TObject; AControl: TWinControl; var UseSkin: Boolean);
begin
  UseSkin := UseSkin or (AControl is TPanel); 
end;

initialization
  dxMegaDemoProductIndex := dxPivotGridIndex;
  ADemoUnits := TcxObjectList.Create();

finalization
  ADemoUnits.Free;

end.
