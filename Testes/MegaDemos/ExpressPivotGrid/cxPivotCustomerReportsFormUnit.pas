unit cxPivotCustomerReportsFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPivotBaseFormUnit, cxControls, cxCustomPivotGrid, cxDBPivotGrid,
  cxPivotDataModule, StdCtrls, cxGraphics, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, ExtCtrls, cxRadioGroup, cxCustomData,
  cxGroupBox, cxClasses, cxStyles, dxCore, cxLookAndFeels, cxLookAndFeelPainters;

type
  TcxPivotCustomerReports = class(TcxPivotGridDemoUnitForm)
    PivotGridProductName: TcxDBPivotGridField;
    PivotGridCompanyName: TcxDBPivotGridField;
    PivotGridProductAmount: TcxDBPivotGridField;
    pgfOrderYear: TcxDBPivotGridField;
    pgfOrderQuarter: TcxDBPivotGridField;
    pnlCustRep: TPanel;
    rbCustomers: TcxRadioButton;
    rbProductsFiltering: TcxRadioButton;
    rbTopProd: TcxRadioButton;
    rbTopCust: TcxRadioButton;
    pnlFilter: TPanel;
    Bevel1: TBevel;
    lbOrderID: TLabel;
    cbYear: TcxComboBox;
    cbQuarter: TcxComboBox;
    Label1: TLabel;
    procedure pnlCustRepResize(Sender: TObject);
    procedure rbCustomersClick(Sender: TObject);
    procedure FilterChange(Sender: TObject);
  private
    procedure SelectLayout(ALayoutID: Integer);
    procedure SetFilterVisible(AValue: Boolean);
  public
    class function GetID: Integer; override;
  end;

implementation

uses cxCustomPivotBaseFormUnit;

{$R *.dfm}


procedure TcxPivotCustomerReports.SelectLayout(ALayoutID: Integer);
const
  Customers: array[0..4] of TLayoutInfo =
    ((Name: 'Product Amount'; Area: faData), (Name: 'Order Year'; Area: faColumn),
     (Name: 'Order Quarter'; Area: faColumn), (Name: 'Customer'; Area: faRow),
     (Name: 'Product Name'; Area: faRow));
  TopProducts: array[0..4] of TLayoutInfo =
    ((Name: 'Product Amount'; Area: faData), (Name: 'Order Year'; Area: faFilter),
     (Name: 'Order Quarter'; Area: faFilter), (Name: 'Customer'; Area: faRow),
     (Name: 'Product Name'; Area: faRow));
  TopCustomers: array[0..4] of TLayoutInfo =
    ((Name: 'Product Amount'; Area: faData), (Name: 'Product Name'; Area: faFilter),
     (Name: 'Order Year'; Area: faFilter), (Name: 'Order Quarter'; Area: faFilter),
     (Name: 'Customer'; Area: faRow));

begin
  PivotGrid.BeginUpdate;
  try
    SetFilterVisible(ALayoutID = 1);
    PivotGridCompanyName.TopValueCount := 0;
    PivotGridProductName.TopValueCount := 0;
    PivotGridCompanyName.SortBySummaryInfo.Field := nil;
    PivotGridProductName.SortBySummaryInfo.Field := nil;
    PivotGridCompanyName.SortOrder := soAscending;
    PivotGridProductName.SortOrder := soAscending;
    case ALayoutID of
      0, 1:
        SelectLayoutInfo(Customers);
      2:
      begin
        PivotGridProductName.SortOrder := soDescending;
        SelectLayoutInfo(TopProducts);
        with PivotGridProductName do
        begin
          SortBySummaryInfo.Field := PivotGridProductAmount;
          SortBySummaryInfo.SummaryType := PivotGridProductAmount.SummaryType;
          TopValueCount := 2;
        end;
      end;
      3:
      begin
        SelectLayoutInfo(TopCustomers);
        PivotGridCompanyName.SortOrder := soDescending;
        with PivotGridCompanyName do
        begin
          SortBySummaryInfo.Field := PivotGridProductAmount;
          SortBySummaryInfo.SummaryType := PivotGridProductAmount.SummaryType;
          TopValueCount := 10;
        end;
      end;
    end;
  finally
    PivotGrid.EndUpdate;
  end;
end;

procedure TcxPivotCustomerReports.SetFilterVisible(AValue: Boolean);
var
  I, AGroupValue: Integer;
begin
  if AValue = pnlFilter.Visible then Exit;
  if AValue then
  begin
    for I := 0 to pgfOrderYear.GroupValueList.Count - 1 do
    begin
      AGroupValue := pgfOrderYear.GroupValueList[I];
      cbYear.Properties.Items.AddObject(IntToStr(AGroupValue), TObject(AGroupValue));
    end;
    cbYear.Properties.Items.Insert(0, '(All)');
    if cbYear.ItemIndex = -1 then
      cbYear.ItemIndex := 1;
    for I := 0 to pgfOrderQuarter.GroupValueList.Count - 1 do
    begin
      AGroupValue := pgfOrderQuarter.GroupValueList[I];
      cbQuarter.Properties.Items.AddObject(
        pgfOrderQuarter.GetGroupValueDisplayText(AGroupValue), TObject(AGroupValue));
    end;
    cbQuarter.Properties.Items.Insert(0, '(All)');
    if cbQuarter.ItemIndex = -1 then
      cbQuarter.ItemIndex := 0;
  end
  else
  begin
    pgfOrderYear.Filter.FilterType := ftExcluded;
    pgfOrderQuarter.Filter.FilterType := ftExcluded;
  end;
  pgfOrderYear.Options.Filtering := not AValue;
  pgfOrderQuarter.Options.Filtering := not AValue;
  pnlFilter.Visible := AValue;
end;

procedure TcxPivotCustomerReports.pnlCustRepResize(Sender: TObject);
var
  I, W: Integer;
begin
  W := pnlCustRep.ClientWidth - 20;
  for I := 0 to pnlCustRep.ControlCount - 1 do
    pnlCustRep.Controls[I].Left := 10 + MulDiv(W, I, pnlCustRep.ControlCount);
end;

procedure TcxPivotCustomerReports.rbCustomersClick(Sender: TObject);
begin
  SelectLayout(TcxRadioButton(Sender).Tag);
end;

procedure TcxPivotCustomerReports.FilterChange(
  Sender: TObject);

  procedure SetFilter(AField: TcxPivotGridField; AComboBox: TcxCombobox);
  begin
    if AComboBox.ItemIndex = 0 then
      AField.Filter.FilterType := ftExcluded
    else
    begin
      AField.Filter.FilterType := ftIncluded;
      AField.Filter.Values.Add(Integer(AComboBox.ItemObject));
    end;
  end;

begin
  case TControl(Sender).Tag of
    0:
      SetFilter(pgfOrderYear, TcxCombobox(Sender));
    1:
      SetFilter(pgfOrderQuarter, TcxCombobox(Sender));
  end;
end;

class function TcxPivotCustomerReports.GetID: Integer;
begin
  Result := 0;
end;

initialization
  TcxPivotCustomerReports.Register;

finalization

end.
