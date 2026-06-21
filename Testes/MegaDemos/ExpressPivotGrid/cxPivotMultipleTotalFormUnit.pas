unit cxPivotMultipleTotalFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPivotSalesPersonFormUnit, cxCustomPivotGrid, cxDBPivotGrid,
  cxControls, cxGraphics, cxClasses, cxCustomData, cxStyles;

type
  TfrmMultipleTotals = class(TfrmSalesPerson)
  private
    { Private declarations }
  public
    class function GetID: Integer; override;
  end;

implementation

uses Math;

{$R *.dfm}

class function TfrmMultipleTotals.GetID: Integer;
begin
  Result := 4;
end;

initialization
  TfrmMultipleTotals.Register;

finalization

end.
