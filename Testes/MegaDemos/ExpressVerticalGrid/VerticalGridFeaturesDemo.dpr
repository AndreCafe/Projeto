program VerticalGridFeaturesDemo;
{$DEFINE DXVER500}

uses
  Forms,
  Dialogs,
  uStrsConst in 'uStrsConst.pas',
  dxDBFrame in 'dxDBFrame.pas',
  dxFrame in 'dxFrame.pas' {dxFrame: TFrame},
  dxFrames in 'dxFrames.pas',
  dxfrmInspector in 'dxfrmInspector.pas' {frmInspector},
  dxOperations in 'dxOperations.pas',
  dxOperationTypes in 'dxOperationTypes.pas',
  FrameIDs in 'FrameIDs.pas',
  Main in 'Main.pas' {frmMain},
  maindata in 'maindata.pas' {dmMain: TDataModule},
  Propertiespopup in 'Propertiespopup.pas' {fmPopupTree},
  PropertiesPreview in 'PropertiesPreview.pas' {fmPreview},
  uCustomEditorsProperties in 'uCustomEditorsProperties.pas' {frameCustomEditorsProperties: TFrame},
  uEditors in 'uEditors.pas',
  uEditorsFlat in 'uEditorsFlat.pas',
  uEditorsProperties in 'uEditorsProperties.pas' {frameEditorsProperties: TFrame},
  uEditorsShadowed in 'uEditorsShadowed.pas',
  UEditorsStd in 'UEditorsStd.pas',
  uEditorsUltraFlat in 'uEditorsUltraFlat.pas',
  uEditorsWeb in 'uEditorsWeb.pas',
  dxTopPanel in 'dxTopPanel.pas',
  dxVertGridFrame in 'dxVertGridFrame.pas' {VerticalGridFrame: TFrame},
  uVertGridCustomMultiRecords in 'uVertGridCustomMultiRecords.pas' {frmCustomVertGridMultiRecords: TFrame},
  uVertGridMultiRecords in 'uVertGridMultiRecords.pas' {frmVertGridMultiRecords: TFrame},
  uVertGridStyles in 'uVertGridStyles.pas' {frmVertGridStyles: TFrame},
  uVertGridIncSearch in 'uVertGridIncSearch.pas' {frmVerticalGridIncSearch: TFrame},
  uVertGridFilterControl in 'uVertGridFilterControl.pas' {frmVerticalGridFilterControl: TFrame},
  uVertGridNavigator in 'uVertGridNavigator.pas' {frmVertGridNavigator: TFrame},
  uVertGridInplaceEditors in 'uVertGridInplaceEditors.pas' {frmVertGridInplaceEditors: TFrame},
  uVertGridInplaceEditorsValidation in 'uVertGridInplaceEditorsValidation.pas' {frmVertGridInplaceEditorsValidation: TFrame},
  uVertGridCustomDraw in 'uVertGridCustomDraw.pas' {frmVertGridCustomDraw: TFrame},
  uVertGridRTTI in 'uVertGridRTTI.pas' {frmVerticalGridRTTI: TFrame},
  uVertGridBitmap in 'uVertGridBitmap.pas' {frmVertGridBitmap: TFrame},
  cxVerticalGridDemoUtils in 'cxVerticalGridDemoUtils.pas',
  dxDemoUtils in 'dxDemoUtils.pas',
  dxAboutDemo in 'dxAboutDemo.pas' {dxAboutDemoForm};

{$R *.res}
{$R WindowsXP.res}
begin
  Application.Initialize;
  Application.Title := 'ExpressVerticalGrid Features Demo';
  if HasJet then
  begin
    Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
  end
  else
    ShowMessage(ThereisNoMDACMessage);
end.
