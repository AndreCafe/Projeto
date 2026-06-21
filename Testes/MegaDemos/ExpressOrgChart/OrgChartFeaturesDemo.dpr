program OrgChartFeaturesDemo;

uses
  Forms,
  main in 'main.pas' {MainForm},
  Options in 'Options.pas' {OptionsForm},
  dxDemoUtils in 'dxDemoUtils.pas',
  dxAboutDemo in 'dxAboutDemo.pas' {dxAboutDemoForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ExpressOrgChart Demo';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TOptionsForm, OptionsForm);
  Application.Run;
end.
