unit uGridFiltering;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uGridSummaries, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, ExtCtrls, uGridCustomSummaries, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxEdit, DB, cxDBData, cxClasses,
  cxDataStorage, cxSpinEdit, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxImageComboBox, cxLabel, cxCheckBox, cxLookAndFeels,
  cxLookAndFeelPainters;

type
  TfrmFitleringGrid = class(TfrmCustomGridSummaries)
    pnlTop: TPanel;
    Label1: TcxLabel;
    cbFilterPanelLocation: TcxImageComboBox;
    cbDropDownColumnMRUList: TcxCheckBox;
    cbDropDownTableViewMRUList: TcxCheckBox;
    procedure cbFilterPanelLocationPropertiesChange(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cbDropDownTableViewMRUListPropertiesChange(Sender: TObject);
  private
    procedure AddFilterToMRUItems(AItemLink: TObject;
      AOperatorKind: TcxFilterOperatorKind; const AValue: Variant; const ADisplayValue: string);
    procedure AddComplexFilterToMRUItems;
  protected
    function GetDescription: string; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses
  FrameIDs, dxFrames, uStrsConst, mainData;

constructor TfrmFitleringGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  GridDBTableView.DataController.Filter.AddItem(nil, GridDBTableViewCOPIES, foGreater, 3, '3');
  GridDBTableView.DataController.Filter.Active := True;
  AddFilterToMRUItems(GridDBTableViewCOPIES, foGreater, 3, '3');
  AddFilterToMRUItems(GridDBTableViewCOPIES, foEqual, 3, '3');
  AddFilterToMRUItems(GridDBTableViewCOPIES, foNotEqual, 3, '3');
  AddFilterToMRUItems(GridDBTableViewCOPIES, foLess, 3, '3');
  AddComplexFilterToMRUItems;
end;

procedure TfrmFitleringGrid.AddFilterToMRUItems(AItemLink: TObject;
  AOperatorKind: TcxFilterOperatorKind; const AValue: Variant; const ADisplayValue: string);
var
  AFilter : TcxDataFilterCriteria;
begin
  AFilter := GridDBTableView.DataController.CreateFilter;
  try
    AFilter.AddItem(nil, AItemLink, AOperatorKind, AValue, ADisplayValue);
    GridDBTableView.Filtering.AddFilterToMRUItems(AFilter);
  finally
    AFilter.Free;
  end;
end;

procedure TfrmFitleringGrid.AddComplexFilterToMRUItems;
var
  AFilter : TcxDataFilterCriteria;
begin
  AFilter := GridDBTableView.DataController.CreateFilter;
  try
    AFilter.AddItem(nil, GridDBTableViewPAYMENTTYPE , foEqual, 2, dmMain.edrepDXPaymentTypeImageCombo.Properties.GetDisplayText(2));
    AFilter.AddItem(nil, GridDBTableViewPAYMENTAMOUNT, foGreater, 300, '300');
    GridDBTableView.Filtering.AddFilterToMRUItems(AFilter);
  finally
    AFilter.Free;
  end;
end;

function TfrmFitleringGrid.GetDescription: string;
begin
  Result := sdxFrameFilteringDescription;
end;

procedure TfrmFitleringGrid.cbFilterPanelLocationPropertiesChange(
  Sender: TObject);
begin
  GridDBTableView.Filtering.Position := TcxGridFilterPosition(cbFilterPanelLocation.EditValue);
end;

procedure TfrmFitleringGrid.cxCheckBox1PropertiesChange(Sender: TObject);
begin
  GridDBTableView.Filtering.ColumnMRUItemsList := cbDropDownColumnMRUList.Checked;
end;

procedure TfrmFitleringGrid.cbDropDownTableViewMRUListPropertiesChange(
  Sender: TObject);
begin
  GridDBTableView.Filtering.MRUItemsList := cbDropDownTableViewMRUList.Checked;
end;

initialization
  dxFrameManager.RegisterFrame(GridFilteringFrameID, TfrmFitleringGrid,
    GridDataFilteringFrameName, GridFilteringImageIndex, FilteringGroupIndex, -1, -1);


end.
