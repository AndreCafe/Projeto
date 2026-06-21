unit cxPivotCompactLayouFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPivotSalesPersonFormUnit, cxCustomPivotGrid, cxDBPivotGrid,
  cxControls, cxGraphics, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, StdCtrls, ExtCtrls, cxClasses, cxCustomData, cxStyles,
  cxLookAndFeels, cxLookAndFeelPainters, cxSplitter, cxGroupBox, cxRadioGroup,
  cxLabel;

type
  TfrmCompactLayout = class(TfrmSalesPerson)
    pnlCustomize: TPanel;
    splCustomizationForm: TcxSplitter;
    cxLabel1: TcxLabel;
    rbCompactLayout: TcxRadioButton;
    rbFullLayout: TcxRadioButton;
    procedure FormShow(Sender: TObject);
    procedure DBPivotGridCustomization(Sender: TObject);
    procedure rbLayoutClick(Sender: TObject);
  private
    { Private declarations }
  public
    class function GetID: Integer; override;
  end;

implementation

uses cxPivotBaseFormUnit;

{$R *.dfm}

procedure TfrmCompactLayout.DBPivotGridCustomization(Sender: TObject);
begin
  inherited;
  if PivotGrid.Customization.Visible then
  begin
    PivotGrid.Customization.Form.Align := alLeft;
    PivotGrid.Customization.Site := Self;
  end
  else
    PivotGrid.Customization.Site := nil;
  splCustomizationForm.Control := PivotGrid.Customization.Form;
  splCustomizationForm.Visible := PivotGrid.Customization.Visible;
end;

procedure TfrmCompactLayout.FormShow(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  rbCompactLayout.Checked := True;
  PivotGrid.Customization.Visible := True;
  for I := 0 to PivotGrid.FieldCount - 1 do
    PivotGrid.Fields[I].ExpandAll;
end;

class function TfrmCompactLayout.GetID: Integer;
begin
  Result := 35;
end;

procedure TfrmCompactLayout.rbLayoutClick(Sender: TObject);
begin
  inherited;
  PivotGrid.OptionsView.RowTotalsLocation := TcxPivotGridRowTotalsLocation(TComponent(Sender).Tag);
end;

initialization
  TfrmCompactLayout.Register;

finalization

end.
