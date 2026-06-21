unit cxPivotTotalsLocationFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPivotSalesPersonFormUnit, cxCustomPivotGrid, cxDBPivotGrid,
  cxControls, cxGraphics, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, StdCtrls, ExtCtrls, cxClasses, cxCustomData, cxStyles,
  cxLookAndFeels, cxLookAndFeelPainters;

type
  TfrmTotalsLocation = class(TfrmSalesPerson)
    pnlFilter: TPanel;
    lbTotalsLocation: TLabel;
    cbColumnTotalsLocation: TcxComboBox;
    cbRowTotalsLocation: TcxComboBox;
    Label1: TLabel;
    procedure cbTotalsLocationPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    class function GetID: Integer; override;
  end;

implementation

uses cxPivotBaseFormUnit;

{$R *.dfm}

class function TfrmTotalsLocation.GetID: Integer;
begin
  Result := 6;
end;

procedure TfrmTotalsLocation.cbTotalsLocationPropertiesChange(
  Sender: TObject);
begin
  PivotGrid.BeginUpdate;
  try
    PivotGrid.OptionsView.ColumnTotalsLocation := TcxPivotGridColumnTotalsLocation(cbColumnTotalsLocation.ItemIndex);
    PivotGrid.OptionsView.RowTotalsLocation := TcxPivotGridRowTotalsLocation(cbRowTotalsLocation.ItemIndex);
  finally
    PivotGrid.EndUpdate;
  end;
end;

initialization
  TfrmTotalsLocation.Register;

finalization

end.
