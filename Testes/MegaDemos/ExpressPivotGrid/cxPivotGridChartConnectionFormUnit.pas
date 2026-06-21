unit cxPivotGridChartConnectionFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPivotBaseFormUnit, cxClasses, cxGraphics, cxCustomData,
  cxStyles, cxCustomPivotGrid, cxDBPivotGrid, cxControls,
  cxPivotGridChartConnection, cxGridCustomView, cxGridChartView,
  cxGridLevel, cxGrid, cxSplitter, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxGroupBox, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLabel,
  cxMemo, cxRichEdit, StdCtrls;

type
  TfmPivotGridChartConnection = class(TcxPivotGridDemoUnitForm)
    pgfProductName: TcxDBPivotGridField;
    pgfOrderDate: TcxDBPivotGridField;
    pgfQuantity: TcxDBPivotGridField;
    GridLevel: TcxGridLevel;
    Grid: TcxGrid;
    ChartView: TcxGridChartView;
    ChartConnection: TcxPivotGridChartConnection;
    cxSplitter1: TcxSplitter;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cbSourceData: TcxComboBox;
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    lblURL: TLabel;
    cxLabel3: TcxLabel;
    cbSourceForCategorites: TcxComboBox;
    procedure cbSourceDataPropertiesChange(Sender: TObject);
    procedure lblURLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbSourceForCategoritesPropertiesChange(Sender: TObject);
  public
    class function GetID: Integer; override;
  end;

implementation

uses
  cxPivotDataModule, ShellAPI;

{$R *.dfm}

{ TcxPivotGridChartConnection }

class function TfmPivotGridChartConnection.GetID: Integer;
begin
  Result := 24;
end;

procedure TfmPivotGridChartConnection.cbSourceDataPropertiesChange(
  Sender: TObject);
begin
  ChartConnection.SourceData := TcxPivotGridChartViewSourceData(cbSourceData.ItemIndex);
end;

procedure TfmPivotGridChartConnection.lblURLClick(Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar(lblURL.Caption), nil, nil, SW_SHOWMAXIMIZED);
end;

procedure TfmPivotGridChartConnection.FormCreate(Sender: TObject);
begin
  ChartConnection.Refresh;
end;

procedure TfmPivotGridChartConnection.cbSourceForCategoritesPropertiesChange(
  Sender: TObject);
begin
  case cbSourceForCategorites.ItemIndex of
    1:
      ChartConnection.SourceForCategories := sfcRows;
    0:
      ChartConnection.SourceForCategories := sfcColumns;
  end;
end;

initialization
  TfmPivotGridChartConnection.Register;

end.
