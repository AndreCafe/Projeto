program cxPivotGridFeaturesDemo;

uses
  Forms,
  Dialogs,
  cxPivotDataModule in 'cxPivotDataModule.pas' {dmPivot: TDataModule},
  cxPivotDemoMainUnit in 'cxPivotDemoMainUnit.pas' {PivotGridFeaturesDemoMainForm},
  cxPivotBaseFormUnit in 'cxPivotBaseFormUnit.pas' {cxPivotGridDemoUnitForm},
  cxPivotCustomerReportsFormUnit in 'cxPivotCustomerReportsFormUnit.pas' {cxPivotCustomerReports},
  cxPivotProductReportsFormUnit in 'cxPivotProductReportsFormUnit.pas' {cxPivotProductReports},
  cxPivotOrderReportsFormUnit in 'cxPivotOrderReportsFormUnit.pas' {cxPivotOrderReports},
  cxPivotSalesPersonFormUnit in 'cxPivotSalesPersonFormUnit.pas' {frmSalesPerson},
  cxPivotSingleTotalFormUnit in 'cxPivotSingleTotalFormUnit.pas' {frmSingleTotal},
  cxPivotMultipleTotalFormUnit in 'cxPivotMultipleTotalFormUnit.pas' {frmMultipleTotals},
  cxPivotSummaryVariationFormUnit in 'cxPivotSummaryVariationFormUnit.pas' {frmSummaryVariation},
  cxPivotTotalsLocationFormUnit in 'cxPivotTotalsLocationFormUnit.pas' {frmTotalsLocation},
  cxPivotCompactLayouFormUnit in 'cxPivotCompactLayouFormUnit.pas' {frmCompactLayout},
  cxPivotSortBySummaryFormUnit in 'cxPivotSortBySummaryFormUnit.pas' {frmSortBySummary},
  cxPivotTopValuesFormUnit in 'cxPivotTopValuesFormUnit.pas' {frmTopValues},
  cxPivotIntervalGroupingFormUnit in 'cxPivotIntervalGroupingFormUnit.pas' {frmIntervalGrouping},
  cxPivotFieldsCustomizationFormUnit in 'cxPivotFieldsCustomizationFormUnit.pas' {frmFieldsCustomization},
  cxPivotFieldsGroupsFormUnit in 'cxPivotFieldsGroupsFormUnit.pas' {frmGroups},
  cxPivotVisualStylesFormUnit in 'cxPivotVisualStylesFormUnit.pas' {frmVisualStyles},
  cxPivotCustomDrawFormUnit in 'cxPivotCustomDrawFormUnit.pas' {frmCustomDraw},
  cxPivotInspectorUnit in 'cxPivotInspectorUnit.pas' {frmInspector},
  cxPivotLoadingSplash in 'cxPivotLoadingSplash.pas' {frmLoading},
  cxPivotDrillDownFormUnit in 'cxPivotDrillDownFormUnit.pas' {frmDrillDown},
  cxPivotGridChartConnectionFormUnit in 'cxPivotGridChartConnectionFormUnit.pas' {fmPivotGridChartConnection},
  cxPivotPrefilterFormUnit in 'cxPivotPrefilterFormUnit.pas' {frmPrefilter},
  cxPivotGridInplaceEditorsFormUnit in 'cxPivotGridInplaceEditorsFormUnit.pas' {frmInplaceEditors},
  cxPivotOLAPBrowserFormUnit in 'cxPivotOLAPBrowserFormUnit.pas' {frmOLAPBrowser},
  cxCustomPivotBaseFormUnit in 'cxCustomPivotBaseFormUnit.pas' {cxCustomPivotGridDemoUnitForm},
  cxUnboundPivotBaseFormUnit in 'cxUnboundPivotBaseFormUnit.pas' {cxUnboundPivotGridDemoUnitForm},
  cxPivoGridSummaryDataSetFormUnit in 'cxPivoGridSummaryDataSetFormUnit.pas' {frmSummaryDataSet},
  cxPivotGridAboutFormUnit in 'cxPivotGridAboutFormUnit.pas' {frmAbout},
  cxPivotOLAPMultipleTotalsFormUnit in 'cxPivotOLAPMultipleTotalsFormUnit.pas' {frmOLAPMultipleTotals},
  cxPivotOLAPDrillDownFormUnit in 'cxPivotOLAPDrillDownFormUnit.pas' {frmOLAPDrillDown},
  dxDemoUtils in 'dxDemoUtils.pas',
  dxAboutDemo in 'dxAboutDemo.pas' {dxAboutDemoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressPivotGrid Features Demo';
  if HasJet then
  begin
    Application.CreateForm(TdmPivot, dmPivot);
    Application.CreateForm(TPivotGridFeaturesDemoMainForm, PivotGridFeaturesDemoMainForm);
    Application.Run;
  end
  else
    ShowMessage(ThereisNoMDACMessage);
end.
