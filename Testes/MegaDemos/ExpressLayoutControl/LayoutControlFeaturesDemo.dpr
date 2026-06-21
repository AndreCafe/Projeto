program LayoutControlFeaturesDemo;

uses
  Forms,
  AboutDemoForm in 'AboutDemoForm.pas' {frmAboutDemoForm},
  cxEditorsDemoMain in 'cxEditorsDemoMain.pas' {frmEditorsDemoMain},
  dxDemoUtils in 'dxDemoUtils.pas',
  dxAboutDemo in 'dxAboutDemo.pas' {dxAboutDemoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressLayout Control';
  Application.CreateForm(TfrmEditorsDemoMain, frmEditorsDemoMain);
  Application.Run;
end.
