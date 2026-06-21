unit uGridBuildInNavigator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uGridCustomSummaries, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxEdit, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, ExtCtrls, cxNavigator,
  cxLookAndFeels, cxLookAndFeelPainters, cxDataStorage, cxSpinEdit,
  cxContainer, cxLabel;

type
  TfrmGridBuildInNavigator = class(TfrmCustomGridSummaries)
    pnlNavigator: TPanel;
    cxNavigator1: TcxNavigator;
    lblExternalNavigator: TcxLabel;
  private
    { Private declarations }
  protected
    function GetDescription: string; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  dxFrames, FrameIDs, mainData, uStrsConst;


{ TfrmGridBuildInNavigator }

function TfrmGridBuildInNavigator.GetDescription: String;
begin
  Result := sdxFrameBuildInNavigatorDescription;
end;

initialization
  dxFrameManager.RegisterFrame(GridBuildInNavigatorFrameID, TfrmGridBuildInNavigator,
    GridBuildInNavigatorFrameName, GridBuildInNavigatorImageIndex, TableBandedTableGroupIndex,
    HighlightedFeaturesGroupIndex, -1);


end.
