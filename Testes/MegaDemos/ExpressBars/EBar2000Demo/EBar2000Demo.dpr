program EBar2000Demo;

uses
  Forms,
  EBar2000DemoMain in 'EBar2000DemoMain.pas' {EBar2000DemoMainForm},
  dxDemoUtils in '..\dxDemoUtils.pas',
  dxAboutDemo in '..\dxAboutDemo.pas' {dxAboutDemoForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ExpressBar Demo (Enchanced Style)';
  Application.CreateForm(TEBar2000DemoMainForm, EBar2000DemoMainForm);
  Application.Run;
end.
