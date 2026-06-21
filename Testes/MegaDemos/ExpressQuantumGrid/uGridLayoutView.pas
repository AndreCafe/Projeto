unit uGridLayoutView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxGridFrame, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxContainer, cxEdit, cxCustomData,
  cxFilter, cxData, cxDataStorage, dxLayoutContainer, cxGridCustomView,
  cxGridCustomTableView, cxGridCustomLayoutView, cxGridLayoutView,
  cxClasses, cxGridLevel, cxLabel, cxGrid, ExtCtrls, DB, cxDBData, Menus,
  ImgList, dxmdaset, cxEditRepositoryItems, StdCtrls, cxButtons,
  cxCheckBox, cxGroupBox, cxRadioGroup, cxGridDBLayoutView, cxGridCardView,
  cxGridTableView, ComCtrls;

type
  TfrmGridLayoutView = class(TdxGridFrame)
    GridLevel1: TcxGridLevel;
    sbMain: TStatusBar;
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miView: TMenuItem;
    miCustomize: TMenuItem;
    miAbout: TMenuItem;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    stValues: TcxStyle;
    stItems: TcxStyle;
    stHeader: TcxStyle;
    stRecordCaption: TcxStyle;
    stRecordSelected: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridCardViewStyleSheetDevExpress: TcxGridCardViewStyleSheet;
    LayoutView: TcxGridDBLayoutView;
    LayoutViewRecId: TcxGridDBLayoutViewItem;
    LayoutViewID: TcxGridDBLayoutViewItem;
    LayoutViewTrademark: TcxGridDBLayoutViewItem;
    LayoutViewModel: TcxGridDBLayoutViewItem;
    LayoutViewHP: TcxGridDBLayoutViewItem;
    LayoutViewLiter: TcxGridDBLayoutViewItem;
    LayoutViewCyl: TcxGridDBLayoutViewItem;
    LayoutViewTransmissSpeedCount: TcxGridDBLayoutViewItem;
    LayoutViewTransmissAutomatic: TcxGridDBLayoutViewItem;
    LayoutViewMPG_City: TcxGridDBLayoutViewItem;
    LayoutViewMPG_Highway: TcxGridDBLayoutViewItem;
    LayoutViewCategory: TcxGridDBLayoutViewItem;
    LayoutViewDescription: TcxGridDBLayoutViewItem;
    LayoutViewHyperlink: TcxGridDBLayoutViewItem;
    LayoutViewPicture: TcxGridDBLayoutViewItem;
    LayoutViewPrice: TcxGridDBLayoutViewItem;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    LayoutViewGroup2: TdxLayoutGroup;
    LayoutViewGroup3: TdxLayoutGroup;
    cxGridLayoutItem1: TcxGridLayoutItem;
    LayoutViewLayoutItem2: TcxGridLayoutItem;
    LayoutViewLayoutItem3: TcxGridLayoutItem;
    LayoutViewLayoutItem4: TcxGridLayoutItem;
    LayoutViewLayoutItem5: TcxGridLayoutItem;
    LayoutViewLayoutItem6: TcxGridLayoutItem;
    LayoutViewLayoutItem7: TcxGridLayoutItem;
    LayoutViewLayoutItem8: TcxGridLayoutItem;
    LayoutViewLayoutItem9: TcxGridLayoutItem;
    LayoutViewLayoutItem10: TcxGridLayoutItem;
    LayoutViewLayoutItem11: TcxGridLayoutItem;
    LayoutViewLayoutItem12: TcxGridLayoutItem;
    LayoutViewLayoutItem13: TcxGridLayoutItem;
    LayoutViewLayoutItem14: TcxGridLayoutItem;
    LayoutViewLayoutItem15: TcxGridLayoutItem;
    LayoutViewLayoutItem16: TcxGridLayoutItem;
    LayoutViewGroup4: TdxLayoutGroup;
    LayoutViewGroup5: TdxLayoutGroup;
    LayoutViewGroup6: TdxLayoutGroup;
    LayoutViewGroup7: TdxLayoutGroup;
    LayoutViewGroup8: TdxLayoutGroup;
    dxLayoutEmptySpaceItem1: TdxLayoutEmptySpaceItem;
    LayoutViewGroup10: TdxLayoutGroup;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    LayoutViewGroup9: TdxLayoutGroup;
    LayoutViewSpaceItem2: TdxLayoutEmptySpaceItem;
    LayoutViewSpaceItem3: TdxLayoutEmptySpaceItem;
    LayoutViewSpaceItem4: TdxLayoutEmptySpaceItem;
    LayoutViewSpaceItem5: TdxLayoutEmptySpaceItem;
    LayoutViewGroup11: TdxLayoutGroup;
    GroupBox: TcxGroupBox;
    rgViewMode: TcxRadioGroup;
    cbRecordCaptions: TcxCheckBox;
    cbCenterRecords: TcxCheckBox;
    cbShowOnlyEntireRecords: TcxCheckBox;
    cbExpandableRecords: TcxCheckBox;
    cbMultiSelectRecords: TcxCheckBox;
    btnCustomize: TcxButton;
    dsCars: TDataSource;
    EditRepository: TcxEditRepository;
    EditRepositoryImage: TcxEditRepositoryImageItem;
    EditRepositoryMemo: TcxEditRepositoryMemoItem;
    EditRepositoryHyperLink: TcxEditRepositoryHyperLinkItem;
    EditRepositoryPrice: TcxEditRepositoryCurrencyItem;
    EditRepositoryAutomatic: TcxEditRepositoryCheckBoxItem;
    mdCars: TdxMemData;
    mdCarsID: TAutoIncField;
    mdCarsTrademark: TStringField;
    mdCarsModel: TStringField;
    mdCarsHP: TSmallintField;
    mdCarsLiter: TFloatField;
    mdCarsCyl: TSmallintField;
    mdCarsTransmissSpeedCount: TSmallintField;
    mdCarsTransmissAutomatic: TStringField;
    mdCarsMPG_City: TSmallintField;
    mdCarsMPG_Highway: TSmallintField;
    mdCarsCategory: TStringField;
    mdCarsDescription: TMemoField;
    mdCarsHyperlink: TStringField;
    mdCarsPicture: TBlobField;
    mdCarsPrice: TFloatField;
    Images: TcxImageList;
    cxButton1: TcxButton;
    procedure btnCustomizeClick(Sender: TObject);
    procedure cbCenterRecordsClick(Sender: TObject);
    procedure cbExpandableRecordsClick(Sender: TObject);
    procedure cbMultiSelectRecordsClick(Sender: TObject);
    procedure cbShowOnlyEntireRecordsClick(Sender: TObject);
    procedure LayoutViewTrademarkStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure rgViewModeClick(Sender: TObject);
    procedure cbRecordCaptionsClick(Sender: TObject);
  private
    { Private declarations }
  public
    function GetDescription: string; override;
  end;

implementation

uses maindata, dxFrames, FrameIDs, uStrsConst;

{$R *.dfm}

procedure TfrmGridLayoutView.btnCustomizeClick(Sender: TObject);
begin
  LayoutView.Controller.Customization := True;
end;

procedure TfrmGridLayoutView.cbCenterRecordsClick(Sender: TObject);
begin
  LayoutView.OptionsView.CenterRecords := cbCenterRecords.Checked;
end;

procedure TfrmGridLayoutView.cbExpandableRecordsClick(Sender: TObject);
begin
  LayoutView.OptionsCustomize.RecordExpanding := cbExpandableRecords.Checked;
end;

procedure TfrmGridLayoutView.cbMultiSelectRecordsClick(Sender: TObject);
begin
  LayoutView.OptionsSelection.MultiSelect := cbMultiSelectRecords.Checked;
end;

procedure TfrmGridLayoutView.cbShowOnlyEntireRecordsClick(Sender: TObject);
begin
  LayoutView.OptionsView.ShowOnlyEntireRecords := cbShowOnlyEntireRecords.Checked;
end;

procedure TfrmGridLayoutView.LayoutViewTrademarkStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  AStyle := stHeader;
end;

procedure TfrmGridLayoutView.cbRecordCaptionsClick(Sender: TObject);
begin
  LayoutView.OptionsView.RecordCaption.Visible := cbRecordCaptions.Checked;
end;

procedure TfrmGridLayoutView.rgViewModeClick(Sender: TObject);
begin
  LayoutView.OptionsView.ViewMode := TcxGridLayoutViewViewMode(rgViewMode.ItemIndex);
end;


function TfrmGridLayoutView.GetDescription: string;
begin
  Result := sdxFrameLayoutViewDescription;
end;

initialization
  dxFrameManager.RegisterFrame(GridLayoutViewFrameID, TfrmGridLayoutView,
    GridLayoutViewFrameName, GridLayoutViewImageIndex, LayoutFeaturesGroupIndex, HighlightedFeaturesGroupIndex, -1);

end.
