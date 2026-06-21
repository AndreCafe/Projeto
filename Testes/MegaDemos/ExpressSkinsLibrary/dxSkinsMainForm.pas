unit dxSkinsMainForm;

interface

{$I cxVer.inc}

uses
{$I dxSkins.inc}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinEditorPreview, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxRibbonSkins, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxClasses, Menus, cxScheduler,
  cxSchedulerStorage, cxSchedulerCustomControls, cxSchedulerCustomResourceView,
  cxSchedulerDayView, cxSchedulerDateNavigator, cxSchedulerHolidays,
  cxSchedulerTimeGridView, cxSchedulerUtils, cxSchedulerWeekView,
  cxSchedulerYearView, cxSchedulerGanttView, cxContainer, cxTL, cxTextEdit,
  dxLayoutcxEditAdapters, dxLayoutContainer, ComCtrls, ShlObj, cxShellCommon,
  cxGridCustomPopupMenu, cxGridPopupMenu, dxLayoutLookAndFeels, dxBar,
  dxBarApplicationMenu, dxRibbon, dxSkinsForm, dxDockControl, ImgList,
  dxNavBarCollns, dxNavBarBase, dxNavBar, dxDockPanel, cxGroupBox,
  cxShellComboBox, cxDropDownEdit, cxSpinEdit, cxMemo, cxBlobEdit, cxCalc,
  StdCtrls, cxButtons, cxTrackBar, cxProgressBar, cxCalendar, cxNavigator,
  cxTimeEdit, cxButtonEdit, cxCheckGroup, cxCurrencyEdit, cxDBEdit,
  cxDBNavigator, cxImage, cxCheckBox, cxMaskEdit, cxHyperLinkEdit,
  dxLayoutControl, cxVGrid, cxInplaceContainer, cxRadioGroup, cxCustomPivotGrid,
  cxPivotGrid, cxGridLevel, cxGridLayoutView, cxGridDBLayoutView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomTableView, cxGridCardView, cxGridDBCardView,
  cxGridCustomView, cxGridCustomLayoutView, cxGrid, cxPC, ExtCtrls,
  dxRibbonBackstageView, dxStatusBar, dxRibbonStatusBar, dxRibbonGallery,
  dxSkinChooserGallery, dxCore, cxDateUtils, dxAlertWindow, dxCustomTileControl,
  dxTileControl, dxGallery, dxGalleryControl, cxLabel, dxBreadcrumbEdit,
  dxShellBreadcrumbEdit, dxBevel;

type
  TdxSkinsDemoMainForm = class(TdxSkinEditorPreviewForm)
    dxbLookAndFeel: TdxBarSubItem;
    procedure dxRibbonHelpButtonClick(Sender: TdxCustomRibbon);
    procedure dxbtnAboutClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  dxSkinsDemoMainForm: TdxSkinsDemoMainForm;

implementation

{$R *.dfm}

uses
  dxDemoUtils, dxAboutDemo;

{ TdxSkinsDemoMainForm }

constructor TdxSkinsDemoMainForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  CreateSkinsMenuItems(dxBarManager, dxbLookAndFeel, dxSkinController);
end;

procedure TdxSkinsDemoMainForm.dxbtnAboutClick(Sender: TObject);
begin
  dxShowAboutForm;
end;

procedure TdxSkinsDemoMainForm.dxRibbonHelpButtonClick(Sender: TdxCustomRibbon);
begin
  dxbtnAbout.Click;
end;

end.
