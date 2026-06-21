unit cxTreeListDemoMainUnit;

interface

uses
{$I dxSkins.inc}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCustomTreeListBaseFormUnit, cxTL, cxDBTL, cxTLData,
  cxTreeListInspectorUnit, cxInplaceContainer, cxLookAndFeels, cxLookAndFeelPainters,
  dxGDIPlusClasses, ExtCtrls, cxSplitter, dxNavBarCollns, cxClasses,
  dxSkinsCore, dxSkinsdxBarPainter, dxBarSkinnedCustForm, dxSkinsdxNavBarPainter,
  dxNavBarBase, cxControls, dxNavBar, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSPrVwAdv, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, dxPScxCommon, dxPScxTLLnk,
  dxBar, dxSkinsForm, ImgList, cxGraphics, cxRadioGroup,
  cxBarEditItem, cxContainer, cxEdit, cxGroupBox, dxCore, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwRibbon, dxSkinsdxRibbonPainter,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer;

type
  TcxTreeListDemoUnitInfo = class;

  TTreeListFeaturesDemoMainForm = class(TForm)
    nbDemos: TdxNavBar;
    nbgNew: TdxNavBarGroup;
    nbgOld: TdxNavBarGroup;
    nbAppearance: TdxNavBarGroup;
    nbiHTML: TdxNavBarItem;
    nbiXML: TdxNavBarItem;
    nbiExcel: TdxNavBarItem;
    nbiText: TdxNavBarItem;
    nbiPrint: TdxNavBarItem;
    nbiPrintPreview: TdxNavBarItem;
    nbiPageSetup: TdxNavBarItem;
    nbiNestedBands: TdxNavBarItem;
    cxSplitter1: TcxSplitter;
    pbDemoHeader: TPaintBox;
    imgLogo: TImage;
    SaveDialog: TSaveDialog;
    dxComponentPrinter: TdxComponentPrinter;
    BarManager: TdxBarManager;
    BarManagerBar1: TdxBar;
    BarManagerBar2: TdxBar;
    bsiLookAndFeel: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    bsiAbout: TdxBarSubItem;
    bsiOptionsView: TdxBarSubItem;
    dxBarSubItem2: TdxBarSubItem;
    biShowColumnTotals: TdxBarButton;
    biShowRowTotals: TdxBarButton;
    biShowColumnGrandTotals: TdxBarButton;
    biShowRowGrandTotals: TdxBarButton;
    biShowTotalsForSingleValue: TdxBarButton;
    biShowGrandTotalsForSingleValue: TdxBarButton;
    biShowColumnFields: TdxBarButton;
    biShowDataFields: TdxBarButton;
    biShowFilterFields: TdxBarButton;
    biShowFilterSeparator: TdxBarButton;
    biShowRowFields: TdxBarButton;
    bbPrintPreview: TdxBarButton;
    bbPrint: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    bbPageSetup: TdxBarButton;
    dxBarButton8: TdxBarButton;
    bbInspector: TdxBarButton;
    siExport: TdxBarSubItem;
    dxBarButton16: TdxBarButton;
    dxBarButton17: TdxBarButton;
    dxBarButton18: TdxBarButton;
    dxBarButton19: TdxBarButton;
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
    dxSkinController: TdxSkinController;
    dxPSEngineController1: TdxPSEngineController;
    nbiExpandableBands: TdxNavBarItem;
    nbiQuickVisibilityCustomization: TdxNavBarItem;
    nbiGroupSummary: TdxNavBarItem;
    nbiMultipleFixedBands: TdxNavBarItem;
    nbiMultipleSummary: TdxNavBarItem;
    nbiSummaryCalculationBase: TdxNavBarItem;
    nbiImages: TdxNavBarItem;
    nbiDifferentSizesOfImages: TdxNavBarItem;
    nbiNodeHeight: TdxNavBarItem;
    nbiNodeVisibility: TdxNavBarItem;
    nbiExplorer: TdxNavBarItem;
    nbiDragAndDrop: TdxNavBarItem;
    nbiProviderMode: TdxNavBarItem;
    nbiIniEditor: TdxNavBarItem;
    nbiInplaceEditors: TdxNavBarItem;
    nbiCustomDraw: TdxNavBarItem;
    nbiCheckGroups: TdxNavBarItem;
    nbiStyles: TdxNavBarItem;
    nbiMenus: TdxNavBarItem;
    nbiPreview: TdxNavBarItem;
    nbiFullVirtual: TdxNavBarItem;
    nbiSearch: TdxNavBarItem;
    ilBarManager: TImageList;
    ilNavBar: TcxImageList;
    bbShowIndicator: TdxBarButton;
    bbShowRoot: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton11: TdxBarButton;
    cxBarEditItem1: TcxBarEditItem;
    cxBarEditItem2: TcxBarEditItem;
    bbGridLinesNone: TdxBarButton;
    bbGridLinesHorizontal: TdxBarButton;
    bbGridLinesVertical: TdxBarButton;
    bbGridLinesBoth: TdxBarButton;
    imgExplorer: TImageList;
    Panel1: TcxGroupBox;
    pnTreeListSite: TcxGroupBox;
    pnHeaderSite: TcxGroupBox;
    imgImages: TcxImageList;
    nbiInplaceEditorsValidation: TdxNavBarItem;
    procedure nbDemosLinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure biStyleClick(Sender: TObject);
    procedure pbDemoHeaderPaint(Sender: TObject);
    procedure PrintCommand(Sender: TObject);
    procedure dxBarButton8Click(Sender: TObject);
    procedure ExportToClick(Sender: TObject);
    procedure dxBarButton10Click(Sender: TObject);
    procedure dxSkinControllerSkinControl(Sender: TObject;
      AControl: TWinControl; var UseSkin: Boolean);
    procedure bbShowIndicatorClick(Sender: TObject);
    procedure bbShowRootClick(Sender: TObject);
    procedure bbGridLinesClick(Sender: TObject);
    procedure bbInspectorClick(Sender: TObject);
  private
    FDemoUnit: TcxTreeListDemoUnitInfo;
    FSkinsBarMenuItems: TcxObjectList;
    FHeaderFont: HFont;
    function GetActiveFrameID: Integer;
    function GetActiveTreeList: TcxCustomTreeList;
    function GetDemoCaption: string;
    procedure SelectUnit(AUnit: TcxTreeListDemoUnitInfo);
    procedure SetActiveFrameID(AValue: Integer);
    procedure SynchronizeMenuItems;
    procedure UpdateNavBarLookAndFeel;
    procedure OnIspectorChanged(Sender: TObject);
    procedure OnInspectorObjectChanged(Sender: TObject);
  protected
    LockUpdate: Boolean;
    Inspector: TfrmInspector;
    procedure DemoUnitChanged;
    procedure DoExportToFile(ACommand: Integer);
    procedure DoPrint(ACommand: Integer);
  public
    function FindDemoByID(ID: Integer; out ADemo: TcxTreeListDemoUnitInfo): Boolean;
    property ActiveFrameID: Integer read GetActiveFrameID write SetActiveFrameID;
    property ActiveTreeList: TcxCustomTreeList read GetActiveTreeList;
    property DemoCaption: string read GetDemoCaption;
    property DemoUnit: TcxTreeListDemoUnitInfo read FDemoUnit write SelectUnit;
  end;

  TcxTreeListDemoUnitInfo = class
  protected
    UnitClass: TcxCustomTreeListDemoUnitFormClass;
    UnitInstance: TcxCustomTreeListDemoUnitForm;
  public
    constructor Create(AClass: TcxCustomTreeListDemoUnitFormClass);
    destructor Destroy; override;
    procedure SetParent(AParent: TWinControl);
  end;

var
  TreeListFeaturesDemoMainForm: TTreeListFeaturesDemoMainForm;

  procedure cxTreeListRegisterDemoUnit(ADemoClass: TcxCustomTreeListDemoUnitFormClass);

implementation

{$R *.dfm}
{$R 'About.res'}


uses
  ShellApi, cxTLExportLink, dxNavBarConsts, dxSkinInfo, dxSkinsStrs,
  dxDemoUtils;

type
  TcxTreeListViewInfoAccess = class(TcxTreeListViewInfo);
  TcxCustomTreeListAccess = class(TcxCustomTreeList);
  TcxCustomControlControllerAccess = class(TcxCustomControlController);
  TdxSkinLookAndFeelPainterInfo = class(TdxSkinInfo);

var
  ADemoUnits: TcxObjectList;
  FImageListHandle: Cardinal;
  AInfo: TSHFileInfo;

procedure cxTreeListRegisterDemoUnit(ADemoClass: TcxCustomTreeListDemoUnitFormClass);
var
  ADemoInfo: TcxTreeListDemoUnitInfo;
begin
  ADemoInfo := TcxTreeListDemoUnitInfo.Create(ADemoClass);
  ADemoInfo.SetParent(nil);
  ADemoUnits.Add(ADemoInfo);
end;

{ TcxTreeListDemoUnitInfo }

constructor TcxTreeListDemoUnitInfo.Create(AClass: TcxCustomTreeListDemoUnitFormClass);
begin
  UnitClass := AClass;
end;

destructor TcxTreeListDemoUnitInfo.Destroy;
begin
  SetParent(nil);
  inherited Destroy;
end;

procedure TcxTreeListDemoUnitInfo.SetParent(AParent: TWinControl);
begin
  if (AParent <> nil) and (UnitInstance = nil) then
  begin
    UnitInstance := UnitClass.Create(nil);
    UnitInstance.Visible := False;
  end;
  if (AParent <> nil) and (UnitInstance.TreeList <> nil) then
    UnitInstance.TreeList.BeginUpdate;
  if UnitInstance <> nil then
    UnitInstance.Parent := AParent;
  if AParent = nil then
    FreeAndNil(UnitInstance)
  else
  begin
    UnitInstance.ActivateDataSet;
    UnitInstance.SendToBack;
    UnitInstance.Visible := True;
    if UnitInstance.TreeList <> nil then
    begin
      UnitInstance.TreeList.EndUpdate;
      TcxCustomControlControllerAccess(TcxCustomTreeListAccess(
        UnitInstance.TreeList).Controller).BeforePaint;
    end;
    UnitInstance.BringToFront;
    UnitInstance.FrameActivated;
  end;
end;

{ TTreeListDemoMainForm }

function TTreeListFeaturesDemoMainForm.FindDemoByID(
  ID: Integer; out ADemo: TcxTreeListDemoUnitInfo): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 0 to ADemoUnits.Count - 1 do
  begin
    ADemo := TcxTreeListDemoUnitInfo(ADemoUnits[I]);
    if ID = ADemo.UnitClass.GetID then
      Exit;
  end;
  Result := False;
end;

procedure TTreeListFeaturesDemoMainForm.FormCreate(Sender: TObject);
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

  FImageListHandle := SHGetFileInfo('C:\', 0, AInfo, SizeOf(AInfo),
    SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
  imgExplorer.Handle := FImageListHandle;
  CreateSkinsMenuItems(BarManager, bsiLookAndFeel, dxSkinController, nbDemos);
  CreateHelpMenuItems(BarManager, bsiAbout);
end;

procedure TTreeListFeaturesDemoMainForm.FormDestroy(Sender: TObject);
begin
  DeleteObject(FHeaderFont);
  DemoUnit := nil;
  FSkinsBarMenuItems.Free;

  imgExplorer.Handle := 0;
  DestroyIcon(AInfo.hIcon);
  FreeResource(FImageListHandle);
end;

procedure TTreeListFeaturesDemoMainForm.pbDemoHeaderPaint(Sender: TObject);
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

procedure TTreeListFeaturesDemoMainForm.PrintCommand(Sender: TObject);
begin
  DoPrint(TComponent(Sender).Tag);
end;

procedure TTreeListFeaturesDemoMainForm.ExportToClick(Sender: TObject);
begin
  DoExportToFile(TComponent(Sender).Tag);
end;

procedure TTreeListFeaturesDemoMainForm.biStyleClick(Sender: TObject);
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

procedure TTreeListFeaturesDemoMainForm.DemoUnitChanged;
begin
  pbDemoHeader.Refresh;
  if Inspector <> nil then
    Inspector.InspectedObject := ActiveTreeList;
end;

procedure TTreeListFeaturesDemoMainForm.DoExportToFile(ACommand: Integer);
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
  if ActiveTreeList = nil then
    Exit;
  SaveDialog.FileName := 'ETreeList.' + Exts[ACommand];
  SaveDialog.Filter := '*.' + Exts[ACommand] + '| *.' + Exts[ACommand];
  if SaveDialog.Execute then
  begin
    AFileName := ChangeFileExt(SaveDialog.FileName, '.' + Exts[ACommand]);
    if FileExists(AFileName) and (MessageBox(0, PChar(Format(scxFileExist, [AFileName])),
      scxSaveTo, MB_ICONWARNING or MB_YESNO) = mrNo) then Exit;
    case ACommand of
      0:
       cxExportTLToHtml(AFileName, ActiveTreeList);
      1:
       cxExportTLToHtml(AFileName, ActiveTreeList);
      2:
       cxExportTLToExcel(AFileName, ActiveTreeList);
      3:
       cxExportTLToText(AFileName, ActiveTreeList);
    end;
    if MessageBox(0, PChar(Format(scxOpenFile, [AFileName])),
      scxConfirm, MB_ICONINFORMATION or MB_YESNO) = mrYes then
      ShellExecute(Handle, PChar('OPEN'), PChar(AFileName), nil, nil, SW_SHOWMAXIMIZED);
  end;
end;

procedure TTreeListFeaturesDemoMainForm.DoPrint(ACommand: Integer);
const
  sdxExpressPrintingMessage = 'The ExpressPrinting System allows you to render and ' +
    'print the contents of the ExpressQuantumTreeList, as well as a number of' +
    ' other Developer Express controls. This component library is not part of ' +
    'the ExpressQuantumTreeList Suite and can be acquired separately via our site at: www.devexpress.com.';
var
  ALink: TObject;
begin
  if ActiveTreeList = nil then
    Exit;
  Application.MessageBox(PChar(sdxExpressPrintingMessage),
      'ExpressPrinting System', MB_ICONINFORMATION);

  ALink := dxComponentPrinter.FindLinkByComponent(ActiveTreeList, True);
  try
    case ACommand of
      0:
        dxComponentPrinter.Print(False, nil);
      1:
        dxComponentPrinter.PageSetup();
      2:
        dxComponentPrinter.Preview();
    end;
  finally
    ALink.Free;
  end;
end;

procedure TTreeListFeaturesDemoMainForm.dxBarButton10Click(Sender: TObject);
begin
  ActiveFrameID := -1;
end;

procedure TTreeListFeaturesDemoMainForm.bbGridLinesClick(Sender: TObject);
begin
  if ActiveTreeList <> nil then
  begin
    case TComponent(Sender).Tag of
      0: ActiveTreeList.OptionsView.GridLines := tlglNone;
      1: ActiveTreeList.OptionsView.GridLines := tlglHorz;
      2: ActiveTreeList.OptionsView.GridLines := tlglVert;
      3: ActiveTreeList.OptionsView.GridLines := tlglBoth;
    end;
    SynchronizeMenuItems;
  end;
end;

procedure TTreeListFeaturesDemoMainForm.bbInspectorClick(Sender: TObject);
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
    Inspector.InspectedObject := ActiveTreeList;
    if ActiveTreeList <> nil then
      Inspector.Show;
  end
  else
    Inspector.Hide;
end;

procedure TTreeListFeaturesDemoMainForm.bbShowIndicatorClick(Sender: TObject);
begin
  if ActiveTreeList <> nil then
  begin
    ActiveTreeList.OptionsView.Indicator := not ActiveTreeList.OptionsView.Indicator;
    SynchronizeMenuItems;
  end;
end;

procedure TTreeListFeaturesDemoMainForm.bbShowRootClick(Sender: TObject);
begin
  if ActiveTreeList <> nil then
  begin
    ActiveTreeList.OptionsView.ShowRoot := not ActiveTreeList.OptionsView.ShowRoot;
    SynchronizeMenuItems;
  end;
end;

procedure TTreeListFeaturesDemoMainForm.dxBarButton8Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TTreeListFeaturesDemoMainForm.dxSkinControllerSkinControl(
  Sender: TObject; AControl: TWinControl; var UseSkin: Boolean);
begin
  UseSkin := UseSkin or (AControl is TPanel);
end;

function TTreeListFeaturesDemoMainForm.GetActiveTreeList: TcxCustomTreeList;
begin
  Result := nil;
  if (DemoUnit <> nil) and (DemoUnit.UnitInstance <> nil) then
    Result := DemoUnit.UnitInstance.TreeList;
end;

function TTreeListFeaturesDemoMainForm.GetActiveFrameID: Integer;
begin
  if DemoUnit <> nil then
    Result := DemoUnit.UnitClass.GetID
  else
    Result := -MaxInt;
end;

function TTreeListFeaturesDemoMainForm.GetDemoCaption: string;
begin
  if DemoUnit <> nil then
    Result := DemoUnit.UnitInstance.Caption
  else
    Result := Application.Title;
end;

procedure TTreeListFeaturesDemoMainForm.nbDemosLinkClick(Sender: TObject;
  ALink: TdxNavBarItemLink);
begin
  ActiveFrameID := ALink.Item.Tag;
end;

procedure TTreeListFeaturesDemoMainForm.SelectUnit(AUnit: TcxTreeListDemoUnitInfo);
var
  APrevUnit: TcxTreeListDemoUnitInfo;
begin
  if DemoUnit = AUnit then Exit;
  APrevUnit := FDemoUnit;
  FDemoUnit := AUnit;
  if DemoUnit <> nil then
    DemoUnit.SetParent(pnTreeListSite);
  if APrevUnit <> nil then
    APrevUnit.SetParent(nil);
  DemoUnitChanged;
end;

procedure TTreeListFeaturesDemoMainForm.SetActiveFrameID(AValue: Integer);
var
  ADemo: TcxTreeListDemoUnitInfo;
begin
  if (ActiveFrameID <> AValue) and FindDemoByID(AValue, ADemo) then
  begin
    DemoUnit := ADemo;
    SynchronizeMenuItems;
  end;
end;

procedure TTreeListFeaturesDemoMainForm.SynchronizeMenuItems;
begin
  bbShowIndicator.Down := (ActiveTreeList <> nil) and ActiveTreeList.OptionsView.Indicator;
  bbShowRoot.Down := (ActiveTreeList <> nil) and ActiveTreeList.OptionsView.ShowRoot;
  if ActiveTreeList <> nil then
    case ActiveTreeList.OptionsView.GridLines of
      tlglNone: bbGridLinesNone.Down := True;
      tlglHorz: bbGridLinesHorizontal.Down := True;
      tlglVert: bbGridLinesVertical.Down := True;
      tlglBoth: bbGridLinesBoth.Down := True;
    end
  else
  begin
    nbDemos.DeSelectLinks;
    if bbInspector.Down then
      bbInspector.Click;
  end;
  bbPrint.Enabled := ActiveTreeList <> nil;
  bbPrintPreview.Enabled := ActiveTreeList <> nil;
  bbPageSetup.Enabled := ActiveTreeList <> nil;
  bbInspector.Enabled := ActiveTreeList <> nil;
  siExport.Enabled := ActiveTreeList <> nil;
end;

procedure TTreeListFeaturesDemoMainForm.UpdateNavBarLookAndFeel;
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

procedure TTreeListFeaturesDemoMainForm.OnIspectorChanged(Sender: TObject);
begin
  bbInspector.Down := (Inspector <> nil) and Inspector.Visible;
end;

procedure TTreeListFeaturesDemoMainForm.OnInspectorObjectChanged(Sender: TObject);
begin
  DemoUnit.UnitInstance.DoInspectedObjectChanged;
  SynchronizeMenuItems;
end;

initialization
  dxMegaDemoProductIndex := dxTreeListIndex;
  ADemoUnits := TcxObjectList.Create();

finalization
  ADemoUnits.Free;


end.
