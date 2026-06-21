program GridFeaturesDemo;
uses
  Forms,
  Dialogs,
  dxFrame in 'dxFrame.pas' {dxFrame: TFrame},
  dxFrames in 'dxFrames.pas',
  dxOperations in 'dxOperations.pas',
  dxOperationTypes in 'dxOperationTypes.pas',
  maindata in 'maindata.pas' {dmMain: TDataModule},
  dxDBFrame in 'dxDBFrame.pas' {dxDBFrame: TFrame},
  Main in 'Main.pas' {frmMain},
  uGridCustomMasterDetail in 'uGridCustomMasterDetail.pas' {frmGridCustomMasterDetail: TFrame},
  dxGridFrame in 'dxGridFrame.pas' {dxGridFrame: TFrame},
  uGridViews in 'uGridViews.pas' {frmViewsGrid: TFrame},
  uGridMasterDetail in 'uGridMasterDetail.pas' {frmGridMasterDetail: TFrame},
  uGridCardView in 'uGridCardView.pas' {frmCardViewGrid: TFrame},
  uGridBandedView in 'uGridBandedView.pas' {frmGridBandedView: TFrame},
  uGridLayoutView in 'uGridLayoutView.pas' {frmGridLayoutView: TFrame},
  uGridUnbound in 'uGridUnbound.pas' {frmGridUnbound: TFrame},
  uGridCustomSummaries in 'uGridCustomSummaries.pas' {frmCustomGridSummaries: TFrame},
  uCustomEditorsProperties in 'uCustomEditorsProperties.pas' {frameCustomEditorsProperties: TFrame},
  uGridFiltering in 'uGridFiltering.pas' {frmFitleringGrid: TFrame},
  uGridSummaries in 'uGridSummaries.pas' {frmGridSummaries: TFrame},
  uGridPreview in 'uGridPreview.pas' {frmGridPreview: TFrame},
  uGridRowAutoHeight in 'uGridRowAutoHeight.pas' {frmGridAutoHeight: TFrame},
  uGridFixedBands in 'uGridFixedBands.pas' {frmGridFixedBands: TFrame},
  uGridIncSearch in 'uGridIncSearch.pas' {frmIncSearchGrid: TFrame},
  uGridStyles in 'uGridStyles.pas' {frmStyleGrid: TFrame},
  uGridNewItemRow in 'uGridNewItemRow.pas' {frmNewItemRowGrid: TFrame},
  uGridMultipleEditors in 'uGridMultipleEditors.pas' {frmMultiEditorsGrid: TFrame},
  dxfrmInspector in 'dxfrmInspector.pas' {frmInspector},
  uGridFileExplorer in 'uGridFileExplorer.pas' {frmGridFileExplorer: TFrame},
  uGridAdvancedFiltering in 'uGridAdvancedFiltering.pas' {frmAdvancedFilteringGrid: TFrame},
  uGridDragDrop in 'uGridDragDrop.pas' {frmDragDropGrid: TFrame},
  uGridInplaceEditors in 'uGridInplaceEditors.pas' {frmInplaceEditorsGrid: TFrame},
  uGridInplaceEditorsValidation in 'uGridInplaceEditorsValidation.pas' {frmInplaceEditorsGridValidation: TFrame},
  uStrsConst in 'uStrsConst.pas',
  uGridBuildInNavigator in 'uGridBuildInNavigator.pas' {frmGridBuildInNavigator: TFrame},
  uGridBackgroundMasterDetail in 'uGridBackgroundMasterDetail.pas' {frmGridBackgroundMasterDetail: TFrame},
  uGridCellSelection in 'uGridCellSelection.pas' {frmGridCellSelection: TFrame},
  uGridMergeCells in 'uGridMergeCells.pas' {frmGridMergeCells: TFrame},
  uGridUnboundColumns in 'uGridUnboundColumns.pas' {frmGridUnboundColumns: TFrame},
  uGridNestedBands in 'uGridNestedBands.pas' {frmGridNestedBands: TFrame},
  uGridOffice11 in 'uGridOffice11.pas' {frmGridOffice11: TFrame},
  FrameIDs in 'FrameIDs.pas',
  cxGridDemoUtils in 'cxGridDemoUtils.pas',
  uGridCustomDrawFrame in 'uGridCustomDrawFrame.pas' {dxCustomDrawFrame: TFrame},
  dxDemoUtils in '..\Common\dxDemoUtils.pas',
  uGridChartView in 'uGridChartView.pas' {dxGridChartViewFrame: TFrame},
  uGridServerMode in 'uGridServerMode.pas' {dxGridServerMode: TFrame},
  uGridServerModeQuery in 'uGridServerModeQuery.pas' {dxGridServerModeQuery: TFrame},
  dxAboutDemo in '..\Common\dxAboutDemo.pas' {dxAboutDemoForm};

{$R *.res}
{$R WindowsXP.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
