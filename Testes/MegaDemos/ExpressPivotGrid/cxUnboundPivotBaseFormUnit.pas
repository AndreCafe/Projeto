unit cxUnboundPivotBaseFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCustomPivotBaseFormUnit, cxClasses, cxGraphics, cxCustomData,
  cxStyles, cxEdit, cxControls, cxCustomPivotGrid, cxPivotGrid;

type
  TcxUnboundPivotGridDemoUnitForm = class(TcxCustomPivotGridDemoUnitForm)
    UnboundPivot: TcxPivotGrid;
  private
  protected
    function GetPivotGrid: TcxCustomPivotGrid; override;
  public

  end;

var
  cxUnboundPivotGridDemoUnitForm: TcxUnboundPivotGridDemoUnitForm;

implementation

{$R *.dfm}

{ TcxUnboundPivotGridDemoUnitForm }

function TcxUnboundPivotGridDemoUnitForm.GetPivotGrid: TcxCustomPivotGrid;
begin
  Result := UnboundPivot;
end;

end.
