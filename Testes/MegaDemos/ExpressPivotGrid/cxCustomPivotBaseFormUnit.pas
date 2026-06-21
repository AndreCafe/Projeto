unit cxCustomPivotBaseFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCustomPivotGrid;

type
  TLayoutInfo = record
    Name: string;
    Area: TcxPivotGridFieldArea;
  end;

  TcxCustomPivotGridDemoUnitForm = class(TForm)
  private
  protected
    function GetPivotGrid: TcxCustomPivotGrid; virtual;
    procedure SelectLayoutInfo(ALayout: array of TLayoutInfo);
  public
    class procedure Register;
    class function GetID: Integer; virtual;
    procedure ActivateDataSet; virtual; abstract;
    procedure FrameActivated; virtual;

    property PivotGrid: TcxCustomPivotGrid read GetPivotGrid;
  end;

  TcxCustomPivotGridDemoUnitFormClass = class of TcxCustomPivotGridDemoUnitForm;

implementation

{$R *.dfm}

uses
  cxPivotDemoMainUnit;

{ TcxCustomPivotGridDemoUnitForm }

class function TcxCustomPivotGridDemoUnitForm.GetID: Integer;
begin
  Result := 0;
end;

procedure TcxCustomPivotGridDemoUnitForm.FrameActivated;
begin
end;

class procedure TcxCustomPivotGridDemoUnitForm.Register;
begin
  cxPivotGridRegisterDemoUnit(Self);
end;

function TcxCustomPivotGridDemoUnitForm.GetPivotGrid: TcxCustomPivotGrid;
begin
  Result := nil;
end;

procedure TcxCustomPivotGridDemoUnitForm.SelectLayoutInfo(ALayout: array of TLayoutInfo);
var
  I: Integer;
  AField: TcxPivotGridField;
  AIndexes: array[TcxPivotGridFieldArea] of Integer;
begin
  PivotGrid.BeginUpdate;
  try
    FillChar(AIndexes, SizeOf(AIndexes), 0);
    for I := 0 to PivotGrid.FieldCount - 1 do
      PivotGrid.Fields[I].Visible := False;
    for I := 0 to High(ALayout) do
    begin
      AField := PivotGrid.GetFieldByName(ALayout[I].Name);
      AField.Area := ALayout[I].Area;
      AField.AreaIndex := AIndexes[ALayout[I].Area];
      AField.Visible := True;
      Inc(AIndexes[ALayout[I].Area]);
    end;
  finally
    PivotGrid.EndUpdate;
  end;
end;

end.
