unit cxPivotIntervalGroupingFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPivotSalesPersonFormUnit, cxCustomPivotGrid, cxDBPivotGrid,
  cxControls, cxGraphics, cxCheckBox, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, StdCtrls, ExtCtrls, cxStyles, cxClasses,
  cxCustomData;

type
  TfrmIntervalGrouping = class(TfrmSalesPerson)
    pgfProductAlphabetical: TcxDBPivotGridField;
    pnlFilter: TPanel;
    lbGroupIntervalType: TLabel;
    cbGroupType: TcxComboBox;
    cbxShowProductAlphabetically: TcxCheckBox;
    procedure PivotGridStylesGetFieldHeaderStyle(
      Sender: TcxCustomPivotGrid; AField: TcxPivotGridField;
      var AStyle: TcxStyle);
    procedure cbxShowProductAlphabeticallyPropertiesChange(
      Sender: TObject);
    procedure cbGroupTypePropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Initialize;
  public
    class function GetID: Integer; override; 
  end;

implementation

uses cxPivotDataModule;

{$R *.dfm}

procedure TfrmIntervalGrouping.Initialize;
begin
  pgfProductAlphabetical.Visible :=  cbxShowProductAlphabetically.Checked;
  cbGroupType.ItemIndex := Integer(pgfOrderDate.GroupInterval) - Integer(giDate);
end;

class function TfrmIntervalGrouping.GetID: Integer;
begin
  Result := 9;
end;

procedure TfrmIntervalGrouping.PivotGridStylesGetFieldHeaderStyle(
  Sender: TcxCustomPivotGrid; AField: TcxPivotGridField;
  var AStyle: TcxStyle);
begin
  if AField = pgfOrderDate then
    AStyle := dmPivot.stBoldFont;
end;

procedure TfrmIntervalGrouping.cbxShowProductAlphabeticallyPropertiesChange(
  Sender: TObject);
begin
  pgfProductAlphabetical.Visible := cbxShowProductAlphabetically.Checked;
end;

procedure TfrmIntervalGrouping.cbGroupTypePropertiesChange(
  Sender: TObject);
var
  S: string;
begin
   pgfOrderDate.GroupInterval :=
     TcxPivotGridGroupInterval(cbGroupType.ItemIndex + Integer(giDate));
   S := cbGroupType.Text;
   if cbGroupType.ItemIndex <> 0 then
     S := Copy(S, 5, 128);
   pgfOrderDate.Caption := 'Order Date (' + S + ')';
end;

procedure TfrmIntervalGrouping.FormCreate(Sender: TObject);
begin
  Initialize;
end;

initialization
  TfrmIntervalGrouping.Register;

finalization

end.
