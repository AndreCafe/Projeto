program RibbonNotepadDemo;
uses
  Forms,
  RibbonNotepadDemoMain in 'RibbonNotepadDemoMain.pas' {RibbonDemoMainForm},
  RibbonNotepadDemoOptions in 'RibbonNotepadDemoOptions.pas' {RibbonDemoOptionsForm},
  RibbonNotepadDemoGallerySetup in 'RibbonNotepadDemoGallerySetup.pas' {ColorDialogSetupForm},
  dxDemoUtils in '..\dxDemoUtils.pas',
  dxAboutDemo in '..\dxAboutDemo.pas' {dxAboutDemoForm};

{$R *.RES}

begin
  Application.Title := 'ExpressBars RibbonNotepadDemo';
  Application.Initialize;
  Application.CreateForm(TRibbonDemoMainForm, RibbonDemoMainForm);
  Application.CreateForm(TColorDialogSetupForm, ColorDialogSetupForm);
  Application.Run;
end.
