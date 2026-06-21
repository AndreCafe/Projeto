unit uGridSummaries;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uGridCustomSummaries, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxEdit, DB, cxDBData, cxClasses, cxDataStorage, cxSpinEdit, cxLabel,
  cxContainer, cxCheckBox, cxLookAndFeels, cxLookAndFeelPainters;

type
  TfrmGridSummaries = class(TfrmCustomGridSummaries)
    Panel1: TPanel;
    cbColumnsQuickCustomizing: TcxCheckBox;
    pnlFeatureDescription: TPanel;
    lblCaptionDescription: TcxLabel;
    procedure cbColumnsQuickCustomizingPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetDescription: String; override;
  public
  end;

implementation

{$R *.dfm}
uses
  dxFrames, FrameIDs, mainData, uStrsConst;

{ TfrmGridSummaries }

function TfrmGridSummaries.GetDescription: String;
begin
  Result := sdxFrameSummariesDescription;
end;

procedure TfrmGridSummaries.cbColumnsQuickCustomizingPropertiesChange(
  Sender: TObject);
begin
  GridDBTableView.OptionsCustomize.ColumnsQuickCustomization := cbColumnsQuickCustomizing.Checked;
  GridDBTableView.OptionsView.Indicator := cbColumnsQuickCustomizing.Checked;
end;

initialization
  dxFrameManager.RegisterFrame(GridSummaryFrameID, TfrmGridSummaries,
    GridDataSummariesFrameName, GridSummaryImageIndex, TableBandedTableGroupIndex,
    HighlightedFeaturesGroupIndex, SummariesGroupIndex);

end.
