program InPlaceEditorsDemo;

uses
  Forms,
  InPlaceEditorsDemoMain in 'InPlaceEditorsDemoMain.pas' {frmMain},
  InPlaceEditorsDemoComboBoxes in 'InPlaceEditorsDemoComboBoxes.pas' {frmComboBoxes},
  InPlaceEditorsDemoImage in 'InPlaceEditorsDemoImage.pas' {frmImageEditors},
  InPlaceEditorsDemoText in 'InPlaceEditorsDemoText.pas' {frmTextEditors},
  InPlaceEditorsDemoMultiLineText in 'InPlaceEditorsDemoMultiLineText.pas' {frmMultiLineTextEditors},
  InPlaceEditorsDemoValue in 'InPlaceEditorsDemoValue.pas' {frmValueEditors},
  InPlaceEditorsDemoCheckBoxes in 'InPlaceEditorsDemoCheckBoxes.pas' {frmCheckBoxes},
  InPlaceEditorsDemoSplash in 'InPlaceEditorsDemoSplash.pas' {frmLoading},
  InPlaceEditorsDemoFrameManager in 'InPlaceEditorsDemoFrameManager.pas' {EditorDemoBaseFrame},
  dxDemoUtils in '..\dxDemoUtils.pas',
  dxAboutDemo in '..\dxAboutDemo.pas' {dxAboutDemoForm};

{$R *.res}

begin
  Application.Title := 'ExpressBars InPlaceEditorsDemo';
  Application.Initialize;
  frmLoading := TfrmLoading.Create(nil);
  frmLoading.Show;
  frmLoading.Update;
  Application.CreateForm(TfrmMain, frmMain);
  frmLoading.Free;
  Application.Run;
end.
