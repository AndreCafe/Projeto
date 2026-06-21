unit uMainUnit;

interface

uses
{$I dxSkins.inc}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwRibbon, dxPSPrVwAdv,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxPSCore, dxBar, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxNavBar, dxSkinsForm, dxSkinsCore, dxSkinsdxBarPainter,
  dxSkinscxPCPainter, dxBarApplicationMenu, dxSkinsdxRibbonPainter,
  dxBarSkinnedCustForm, dxSkinsdxNavBarPainter, cxClasses, dxRibbon,
  dxRibbonForm, ImgList, dxNavBarBase, dxNavBarCollns, dxPSContainerLnk,
  ExtCtrls, cxDropDownEdit, cxBarEditItem, ActnList, dxPSDemoCommon,
  cxContainer, cxEdit, cxGroupBox, dxSkinsStrs, dxPScxDBEditorLnks, dxPSTextLnk,
  dxPSFileBasedXplorer, dxRibbonSkins, dxRibbonGallery, dxSkinChooserGallery,
  cxLabel;

const
  dxCaption = 'ExpressPrinting System Features Demo';

type

  { TdxPrintingSystemDemoMainForm }

  TdxPrintingSystemDemoMainForm = class(TdxRibbonForm)
    actAbout: TAction;
    actClose: TAction;
    actDesign: TAction;
    actImageAntiAliasing: TAction;
    ActionList: TActionList;
    actPageSetup: TAction;
    actPreview: TAction;
    actPrint: TAction;
    BarManager: TdxBarManager;
    bbClose: TdxBarButton;
    bbDesign: TdxBarButton;
    bbFile: TdxBarSubItem;
    bbHelp: TdxBarSubItem;
    bbLargeDesign: TdxBarLargeButton;
    bbLargePageSetup: TdxBarLargeButton;
    bbLargePreview: TdxBarLargeButton;
    bbLargePrint: TdxBarLargeButton;
    bbLookAndFeelFlat: TdxBarButton;
    bbLookAndFeelNativeStyle: TdxBarButton;
    bbLookAndFeelOffice11: TdxBarButton;
    bbLookAndFeelStandard: TdxBarButton;
    bbLookAndFeelUltraFlat: TdxBarButton;
    bbMainMenu: TdxBar;
    bbOptions: TdxBarSubItem;
    bbPageSetup: TdxBarButton;
    bbPreview: TdxBarButton;
    bbPrint: TdxBarButton;
    bbRibbon2010: TdxBarLargeButton;
    bbRibbonStyle: TdxBarLargeButton;
    bbSkinList: TdxBarListItem;
    bbSkins: TdxBarSubItem;
    bbToolbar: TdxBar;
    bcSkinList: TdxBarCombo;
    ComponentPrinter: TdxComponentPrinter;
    dxBarButton4: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxbReport: TdxBar;
    dxbReportLinks: TdxBar;
    dxbRibbonSettings: TdxBar;
    dxbSkin: TdxBar;
    dxNavBar: TdxNavBar;
    EngineController: TdxPSEngineController;
    FileBasedExplorer: TdxPSFileBasedExplorer;
    ilLargeImages: TcxImageList;
    ilSmallImages: TcxImageList;
    nbgReportLinks: TdxNavBarGroup;
    pnlFrameHost: TcxGroupBox;
    QuickAccessToolBar: TdxBar;
    Ribbon: TdxRibbon;
    RibbonApplicationMenu: TdxBarApplicationMenu;
    rtAppearance: TdxRibbonTab;
    rtPrintReport: TdxRibbonTab;
    scSkins: TdxSkinChooserGalleryItem;
    SkinController: TdxSkinController;
    procedure actAboutExecute(Sender: TObject);
    procedure actDesignExecute(Sender: TObject);
    procedure actDesignUpdate(Sender: TObject);
    procedure actImageAntiAliasingExecute(Sender: TObject);
    procedure actPageSetupExecute(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure bbCloseClick(Sender: TObject);
    procedure bbLookAndFeelFlatClick(Sender: TObject);
    procedure bbRibbon2010Click(Sender: TObject);
    procedure bbRibbonStyleClick(Sender: TObject);
    procedure bbSkinListClick(Sender: TObject);
    procedure bcSkinListChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure scSkinsPopulate(Sender: TObject);
    procedure scSkinsSkinChanged(Sender: TObject; const ASkinName: string);
    procedure SkinControllerSkinForm(Sender: TObject; AForm: TCustomForm; var ASkinName: string; var UseSkin: Boolean);
    procedure RibbonHelpButtonClick(Sender: TdxCustomRibbon);
  private
    FReportLinkFrame: TdxPrintingSystemDemoFrameInfo;
    FRibbonStyle: Boolean;
    FSkinName: string;
    procedure DoLoadUserSkin(const S: string);
    procedure SetReportLinkFrame(AValue: TdxPrintingSystemDemoFrameInfo);
    procedure SetRibbonStyle(AValue: Boolean);
    procedure SetSkinName(const S: string);
  protected
    procedure ActivateFirstReportLink;
    procedure DoSelectFrameInBar(AFrameIndex: Integer);
    procedure DoSelectReportLinkFrame(Sender: TObject);
    procedure DoReportLinkFrameChanged;
    procedure PopulateReportLinks;
    procedure UpdateCaption;
    procedure UpdateLookAndFeelButtonsState;
    procedure UpdatePreviewDialogStyle;
  public
    constructor Create(AOwner: TComponent); override;
    //
    property ReportLinkFrame: TdxPrintingSystemDemoFrameInfo read FReportLinkFrame write SetReportLinkFrame;
    property RibbonStyle: Boolean read FRibbonStyle write SetRibbonStyle;
    property SkinName: string read FSkinName write SetSkinName;
  end;

var
  dxPrintingSystemDemoMainForm: TdxPrintingSystemDemoMainForm;

implementation

{$R *.dfm}

uses
  StrUtils, ShellAPI, dxAboutDemo;

{ TdxPrintingSystemDemoMainForm }

constructor TdxPrintingSystemDemoMainForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSmoothlyStretchImages := True;
end;

procedure TdxPrintingSystemDemoMainForm.FormCreate(Sender: TObject);
begin
  RibbonStyle := True;
  PopulateReportLinks;
  SkinName := 'DevExpressStyle';
  ActivateFirstReportLink;
end;

procedure TdxPrintingSystemDemoMainForm.FormDestroy(Sender: TObject);
begin
  ReportLinkFrame := nil;
end;

procedure TdxPrintingSystemDemoMainForm.DoLoadUserSkin(const S: string);
var
  AStream: TResourceStream;
begin
  if S <> '' then
  begin
    AStream := TResourceStream.Create(HInstance, S, sdxResourceType);
    try
      dxSkinsUserSkinLoadFromStream(AStream);
    finally
      AStream.Free;
    end;
  end;
end;

procedure TdxPrintingSystemDemoMainForm.SetReportLinkFrame(AValue: TdxPrintingSystemDemoFrameInfo);
begin
  if AValue <> FReportLinkFrame then
  begin
    if FReportLinkFrame <> nil then
    begin
      FReportLinkFrame.FreeFrame;
      FReportLinkFrame := nil;
    end;
    if AValue <> nil then
    begin
      FReportLinkFrame := AValue;
      FReportLinkFrame.CreateFrame(pnlFrameHost, ComponentPrinter);
    end;
    DoReportLinkFrameChanged;
    UpdateCaption;
  end;
end;

procedure TdxPrintingSystemDemoMainForm.SetRibbonStyle(AValue: Boolean);
var
  ASavedState: Boolean;
begin
  if AValue <> FRibbonStyle then
  begin
    ASavedState := SkinController.UseSkins;
    try
      FRibbonStyle := AValue;
      SkinController.UseSkins := False;
      UpdatePreviewDialogStyle;
      bbMainMenu.Visible := not RibbonStyle;
      bbToolbar.Visible := not RibbonStyle;
      dxNavBar.Visible := not RibbonStyle;
      Ribbon.Visible := RibbonStyle;
    finally
      SkinController.UseSkins := ASavedState;
      SkinController.Refresh;
    end;
  end;
end;

procedure TdxPrintingSystemDemoMainForm.SetSkinName(const S: string);
begin
  if FSkinName <> S then
  begin
    FSkinName := S;
    DoLoadUserSkin(S);
    Ribbon.ColorSchemeName := IfThen(S = '', 'Blue', 'UserSkin');
    scSkins.SelectedSkinName := S;
    SkinController.NativeStyle := False;
    SkinController.UseSkins := S <> '';
    UpdateLookAndFeelButtonsState;
  end;
end;

procedure TdxPrintingSystemDemoMainForm.SkinControllerSkinForm(Sender: TObject;
  AForm: TCustomForm; var ASkinName: string; var UseSkin: Boolean);
begin
  if AForm is TdxPrintingSystemDemoFrame then
    UseSkin := False;
end;

procedure TdxPrintingSystemDemoMainForm.actDesignUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(ReportLinkFrame);
end;

procedure TdxPrintingSystemDemoMainForm.actImageAntiAliasingExecute(Sender: TObject);
begin
  FSmoothlyStretchImages := actImageAntiAliasing.Checked;
end;

procedure TdxPrintingSystemDemoMainForm.ActivateFirstReportLink;
begin
  if PrintingSystemDemoFrames.Count > 0 then
    ReportLinkFrame := PrintingSystemDemoFrames[0];
end;

procedure TdxPrintingSystemDemoMainForm.UpdateCaption;
begin
  if Assigned(ReportLinkFrame) then
    Caption := dxCaption + ' - ' + ReportLinkFrame.Caption + ' ReportLink'
  else
    Caption := dxCaption;
end;

procedure TdxPrintingSystemDemoMainForm.DoSelectFrameInBar(AFrameIndex: Integer);
var
  AButtonItem: TdxBarLargeButton;
  I: Integer;
begin
  for I := 0 to dxbReportLinks.ItemLinks.Count - 1 do
  begin
    AButtonItem := dxbReportLinks.ItemLinks[I].Item as TdxBarLargeButton;
    AButtonItem.Down := AButtonItem.Tag = AFrameIndex;
  end;
end;

procedure TdxPrintingSystemDemoMainForm.DoSelectReportLinkFrame(Sender: TObject);
begin
  ReportLinkFrame := PrintingSystemDemoFrames.FrameInfo[(Sender as TComponent).Tag];
end;

procedure TdxPrintingSystemDemoMainForm.bbRibbon2010Click(Sender: TObject);
const
  RibbonStyleMap: array[Boolean] of TdxRibbonStyle = (rs2007, rs2010);
begin
  Ribbon.Style := RibbonStyleMap[bbRibbon2010.Down];
  UpdatePreviewDialogStyle;
end;

procedure TdxPrintingSystemDemoMainForm.DoReportLinkFrameChanged;
var
  AFrameIndex: Integer;
begin
  AFrameIndex := PrintingSystemDemoFrames.IndexOf(ReportLinkFrame);
  nbgReportLinks.SelectedLinkIndex := AFrameIndex;
  DoSelectFrameInBar(AFrameIndex);
end;

procedure TdxPrintingSystemDemoMainForm.PopulateReportLinks;

  procedure AddToBar(AFrameInfo: TdxPrintingSystemDemoFrameInfo; AIndex: Integer);
  var
    AButtonItem: TdxBarLargeButton;
  begin
    AButtonItem := dxbReportLinks.ItemLinks.AddItem(TdxBarLargeButton).Item as TdxBarLargeButton;
    AButtonItem.ButtonStyle := bsChecked;
    AButtonItem.GroupIndex := 1;
    AButtonItem.LargeImageIndex := AFrameInfo.ImageIndex;
    AButtonItem.ImageIndex := AFrameInfo.ImageIndex;
    AButtonItem.OnClick := DoSelectReportLinkFrame;
    AButtonItem.Caption := AFrameInfo.Caption;
    AButtonItem.Hint := AFrameInfo.Caption;
    AButtonItem.Tag := AIndex;
  end;

  procedure AddToNavBar(AFrameInfo: TdxPrintingSystemDemoFrameInfo; AIndex: Integer);
  var
    ANavBarItem: TdxNavBarItem;
  begin
    ANavBarItem := dxNavBar.Items.Add;
    ANavBarItem.Hint := AFrameInfo.Caption;
    ANavBarItem.Caption := AFrameInfo.Caption;
    ANavBarItem.SmallImageIndex := AFrameInfo.ImageIndex;
    ANavBarItem.OnClick := DoSelectReportLinkFrame;
    ANavBarItem.Tag := AIndex;
    nbgReportLinks.CreateLink(ANavBarItem);
  end;

var
  I: Integer;
begin
  for I := 0 to PrintingSystemDemoFrames.Count - 1 do
  begin
    AddToBar(PrintingSystemDemoFrames.FrameInfo[I], I);
    AddToNavBar(PrintingSystemDemoFrames.FrameInfo[I], I);
  end;
end;

procedure TdxPrintingSystemDemoMainForm.RibbonHelpButtonClick(Sender: TdxCustomRibbon);
begin
  actAbout.Execute;
end;

procedure TdxPrintingSystemDemoMainForm.scSkinsPopulate(Sender: TObject);
begin
  scSkins.AddSkinsFromResources(HInstance);
end;

procedure TdxPrintingSystemDemoMainForm.scSkinsSkinChanged(Sender: TObject; const ASkinName: string);
begin
  SkinName := ASkinName;
end;

procedure TdxPrintingSystemDemoMainForm.UpdateLookAndFeelButtonsState;
var
  ACustomStyleSelected: Boolean;
begin
  ACustomStyleSelected := (SkinName = '') and not SkinController.NativeStyle;
  bbLookAndFeelFlat.Down := ACustomStyleSelected and (SkinController.Kind = lfFlat);
  bbLookAndFeelOffice11.Down := ACustomStyleSelected and (SkinController.Kind = lfOffice11);
  bbLookAndFeelStandard.Down := ACustomStyleSelected and (SkinController.Kind = lfStandard);
  bbLookAndFeelUltraFlat.Down := ACustomStyleSelected and (SkinController.Kind = lfUltraFlat);
  bbLookAndFeelNativeStyle.Down := SkinController.NativeStyle;
  bbSkinList.ItemIndex := bbSkinList.Items.IndexOf(SkinName);
  bcSkinList.ItemIndex := bcSkinList.Items.IndexOf(SkinName);
end;

procedure TdxPrintingSystemDemoMainForm.UpdatePreviewDialogStyle;
const
  PreviewWindowMap: array[Boolean, TdxRibbonStyle] of string =
    (('Advanced', 'Advanced'), ('Ribbon', 'Ribbon2010'));
begin
  EngineController.PreviewDialogStyle := PreviewWindowMap[RibbonStyle, Ribbon.Style];
end;

procedure TdxPrintingSystemDemoMainForm.actAboutExecute(Sender: TObject);
begin
  dxShowAboutForm;
end;

procedure TdxPrintingSystemDemoMainForm.actDesignExecute(Sender: TObject);
begin
  ComponentPrinter.DesignReport;
end;

procedure TdxPrintingSystemDemoMainForm.bbCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TdxPrintingSystemDemoMainForm.actPageSetupExecute(Sender: TObject);
begin
  ComponentPrinter.PageSetup;
end;

procedure TdxPrintingSystemDemoMainForm.actPreviewExecute(Sender: TObject);
begin
  ComponentPrinter.Preview;
end;

procedure TdxPrintingSystemDemoMainForm.actPrintExecute(Sender: TObject);
begin
  ComponentPrinter.Print(True, nil);
end;

procedure TdxPrintingSystemDemoMainForm.bbLookAndFeelFlatClick(Sender: TObject);
begin
  SkinName := '';
  SkinController.NativeStyle := False;
  case TComponent(Sender).Tag of
    0: SkinController.Kind := lfFlat;
    1: SkinController.Kind := lfUltraFlat;
    2: SkinController.Kind := lfStandard;
    3: SkinController.Kind := lfOffice11;
    else
      SkinController.NativeStyle := True;
  end;
  UpdateLookAndFeelButtonsState;
end;

procedure TdxPrintingSystemDemoMainForm.bbRibbonStyleClick(Sender: TObject);
begin
  RibbonStyle := bbRibbonStyle.Down;
end;

procedure TdxPrintingSystemDemoMainForm.bbSkinListClick(Sender: TObject);
begin
  SkinName := bbSkinList.Items[bbSkinList.ItemIndex];
end;

procedure TdxPrintingSystemDemoMainForm.bcSkinListChange(Sender: TObject);
begin
  SkinName := bcSkinList.Text;
end;

end.
