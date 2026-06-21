unit cxPivotGridInplaceEditorsFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPivotSalesPersonFormUnit, cxClasses, cxGraphics, cxCustomData,
  cxStyles, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxCustomPivotGrid,
  cxDBPivotGrid, cxControls, cxProgressBar;

type
  TfrmInplaceEditors = class(TfrmSalesPerson)
    pgfPercentsOfColumn: TcxDBPivotGridField;
  private
    { Private declarations }
  public
    class function GetID: Integer; override;
  end;

implementation

{$R *.dfm}

{ TfrmInplaceEditors }

class function TfrmInplaceEditors.GetID: Integer;
begin
  Result := 26;
end;

initialization
  TfrmInplaceEditors.Register;

finalization

end.
