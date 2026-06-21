program PrintingSystemFeaturesDemo;

uses
  Forms,
  uMainUnit in 'uMainUnit.pas' {dxPrintingSystemDemoMainForm},
  dxPSDemoCommon in 'dxPSDemoCommon.pas',
  dxPSDemoGrid in 'dxPSDemoGrid.pas' {frGridFrame: TFrame},
  dxPSDemoPivotGrid in 'dxPSDemoPivotGrid.pas' {frPivotGridFrame: TFrame},
  dxPSDemoVerticalGrid in 'dxPSDemoVerticalGrid.pas' {frVerticalGridFrame: TFrame},
  dxPSDemoTreeList in 'dxPSDemoTreeList.pas' {frTreeListFrame: TFrame},
  dxPSDemoScheduler in 'dxPSDemoScheduler.pas' {frSchedulerFrame: TFrame},
  dxPSDemoLayoutControl in 'dxPSDemoLayoutControl.pas' {frLayoutControlFrame: TFrame},
  dxPSDemoSpreadSheet in 'dxPSDemoSpreadSheet.pas' {frSpreadSheetFrame: TFrame},
  dxPSDemoTeeChart in 'dxPSDemoTeeChart.pas' {frTeeChartFrame: TFrame},
  dxPSDemoRichEdit in 'dxPSDemoRichEdit.pas' {frRichEditFrame: TFrame},
  dxPSDemoOrgChart in 'dxPSDemoOrgChart.pas' {frOrgChartFrame: TFrame},
  dxPSDemoFlowChart in 'dxPSDemoFlowChart.pas' {frFlowChartFrame: TFrame},
  dxPSDemoStandardControls in 'dxPSDemoStandardControls.pas' {frStandardControlsFrame: TFrame},
  dxPSDemoData in 'dxPSDemoData.pas' {dmPrinting: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ExpressPrinting System Features Demo';
  Application.CreateForm(TdmPrinting, dmPrinting);
  Application.CreateForm(TdxPrintingSystemDemoMainForm, dxPrintingSystemDemoMainForm);
  Application.Run;
end.
