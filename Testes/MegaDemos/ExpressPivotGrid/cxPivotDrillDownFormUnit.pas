unit cxPivotDrillDownFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cxCustomPivotGrid, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxContainer, cxTextEdit, cxMemo, cxRichEdit, RichEdit, cxHyperLinkEdit,
  cxLabel;

type
  TfrmDrillDown = class(TForm)
    Panel1: TPanel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    TableView: TcxGridTableView;
    cxHyperLinkEdit1: TcxHyperLinkEdit;
    cxLabel1: TcxLabel;
    procedure cxHyperLinkEdit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure cxShowDrillDownDataSource(ACrossCell: TcxPivotGridCrossCell);

implementation

{$R *.dfm}

procedure cxShowDrillDownDataSource(ACrossCell: TcxPivotGridCrossCell);
var
  AForm: TfrmDrillDown;
  ADataSource: TcxCustomDataSource;

  procedure CreateColumns(APivotGrid: TcxCustomPivotGrid; AGrid: TcxGridTableView);
  var
    I: Integer;
    AField: TcxPivotGridField;
  begin
    for I := 0 to TcxPivotGridCrossCellDataSource(ADataSource).FieldCount - 1 do
    begin
      AField := TcxPivotGridCrossCellDataSource(ADataSource).PivotGridFields[I];
      with AGrid.CreateColumn do
      begin
        Caption := AField.Caption;
        Hidden := AField.Hidden;
        Visible := AField.Visible;
      end;
    end;
  end;

begin
  AForm := TfrmDrillDown.Create(nil);
  try
    ADataSource := ACrossCell.CreateDrillDownDataSource;
    CreateColumns(ACrossCell.PivotGrid, AForm.TableView);
    try
      AForm.TableView.DataController.CustomDataSource := ADataSource;
      AForm.TableView.ApplyBestFit();
      AForm.ShowModal;
    finally
      ADataSource.Free;
    end;
  finally
    AForm.Free;
  end;
end;

procedure TfrmDrillDown.cxHyperLinkEdit1Click(Sender: TObject);
begin
  cxGrid1.SetFocus;
end;

end.
