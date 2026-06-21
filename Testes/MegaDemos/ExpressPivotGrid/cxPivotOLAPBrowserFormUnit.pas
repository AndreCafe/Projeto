unit cxPivotOLAPBrowserFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPivotBaseFormUnit, cxClasses, cxGraphics, cxCustomData,
  cxStyles, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxControls,
  cxCustomPivotGrid, cxDBPivotGrid, cxPivotGridOLAPDataSource,
  cxCustomPivotBaseFormUnit, cxUnboundPivotBaseFormUnit, cxPivotGrid,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  StdCtrls, ExtCtrls, Menus, cxLookAndFeelPainters, cxButtons,
  cxPivotGridOLAPConnectionDesigner, cxPivotLoadingSplash, cxPivotDrillDownFormUnit;

type
  TfrmOLAPBrowser = class(TcxUnboundPivotGridDemoUnitForm)
    OLAPDataSource: TcxPivotGridOLAPDataSource;
    pnlFilter: TPanel;
    cxButton1: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure UnboundPivotDblClick(Sender: TObject);
  private
    procedure SetFieldPos(const AFieldName: string; AArea: TcxPivotGridFieldArea);
  public
    class function GetID: Integer; override;
    procedure ActivateDataSet; override;
  end;

implementation

{$R *.dfm}

var
  CubePath: string;

{ TfrmOLAPBrowser }

class function TfrmOLAPBrowser.GetID: Integer;
begin
  Result := 27;
end;

procedure TfrmOLAPBrowser.ActivateDataSet;
var
  ConnectionString: string;
begin
  if not FileExists(CubePath) then Exit;
  ConnectionString := 'Provider=MSOLAP;Integrated Security=SSPI;Persist Security Info=False;Data Source=';
  cxSetSplashVisibility(True, 'Northwind.cub');
  UnboundPivot.BeginUpdate;
  try
    OLAPDataSource.ConnectionString := ConnectionString + CubePath;
    OLAPDataSource.Active := True;
    PivotGrid.DeleteAllFields;
    OLAPDataSource.RetrieveFields(PivotGrid);
    SetFieldPos('Country', faColumn);
    SetFieldPos('City', faColumn);
    SetFieldPos('Category Name', faRow);
    SetFieldPos('Products', faRow);
    SetFieldPos('Quantity', faData);
    SetFieldPos('Discount', faData);
  finally
    UnboundPivot.EndUpdate;
    cxSetSplashVisibility(False, '');
  end;
end;

procedure TfrmOlapBrowser.SetFieldPos(
  const AFieldName: string; AArea: TcxPivotGridFieldArea);
var
  AField: TcxPivotGridField;
begin
  AField := PivotGrid.GetFieldByName(AFieldName);
  if AField = nil then Exit;
  AField.Area := AArea;
  AField.Visible := True;
end;

procedure TfrmOLAPBrowser.cxButton1Click(Sender: TObject);
var
  I, J: Integer;
  ACubeName: string;
  AConnection, ACube: WideString;
begin
  AConnection := cxPivotGridOLAPCreateConnectionString(ACube, PivotGrid.LookAndFeel);
  if AConnection = '' then Exit;
  ACubeName := ACube;
  if ACubeName = '' then
  begin
    ACubeName := ExtractFileName(AConnection);
  end;
  cxSetSplashVisibility(True, ACubeName);
  PivotGrid.BeginUpdate;
  try
    OLAPDataSource.ConnectionString := AConnection;
    OLAPDataSource.Cube := ACube;
    OLAPDataSource.Active := True;
    PivotGrid.DeleteAllFields;
    OLAPDataSource.RetrieveFields(PivotGrid);
    for I := 0 to PivotGrid.Groups.Count - 1 do
      for J := 1 to PivotGrid.Groups[I].FieldCount - 1 do
        PivotGrid.Groups[I].Fields[J].Visible := True;
  finally
    PivotGrid.EndUpdate;
    cxSetSplashVisibility(False);
    PivotGrid.Customization.Visible := True;
  end;
end;

procedure TfrmOLAPBrowser.UnboundPivotDblClick(Sender: TObject);
var
  ACrossCell: TcxPivotGridCrossCell;
begin
  with PivotGrid.HitTest do
  begin
    if HitAtDataCell then
    begin
      ACrossCell := (HitObject as TcxPivotGridDataCellViewInfo).CrossCell;
      cxShowDrillDownDataSource(ACrossCell);
    end;
  end;
end;

initialization
  CubePath := GetCurrentDir + '\Data\Northwind.cub';
  TfrmOLAPBrowser.Register;

finalization

end.
