unit cxPivotOLAPDrillDownFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPivotOLAPBrowserFormUnit, cxClasses, cxGraphics, cxCustomData,
  cxStyles, cxEdit, Menus, cxLookAndFeelPainters, cxCustomPivotGrid,
  cxPivotGridOLAPDataSource, StdCtrls, cxButtons, ExtCtrls, cxControls,
  cxPivotGrid, cxPivotDrillDownFormUnit;

const
  WM_SHOWDRILLDOWN = WM_APP + 2;

type
  TfrmOLAPDrillDown = class(TfrmOLAPBrowser)
  private
    procedure WMShowDrillDown(var AMsg: TMessage); message WM_SHOWDRILLDOWN;
  public
    procedure ActivateDataSet; override;
    class function GetID: Integer; override;
  end;

implementation

uses cxCustomPivotBaseFormUnit;

{$R *.dfm}

{ TfrmOLAPDrillDown }

procedure TfrmOLAPDrillDown.ActivateDataSet;
begin
  inherited ActivateDataSet;
  PostMessage(Handle, WM_SHOWDRILLDOWN, 0, 0);
end;

class function TfrmOLAPDrillDown.GetID: Integer;
begin
  Result := 34;
end;

procedure TfrmOLAPDrillDown.WMShowDrillDown(var AMsg: TMessage);
begin
  with PivotGrid.ViewData do
  begin
    if ColumnCount * RowCount > 0 then
       cxShowDrillDownDataSource(Cells[0, 0].Owner);
  end;
end;

initialization
  TfrmOLAPDrillDown.Register;

end.
