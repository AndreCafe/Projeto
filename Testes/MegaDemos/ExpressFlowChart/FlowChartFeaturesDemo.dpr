program FlowChartFeaturesDemo;

uses
  Forms,
  main in 'main.pas' {MainForm},
  ChartName in 'ChartName.pas' {ChartNameForm},
  dxDemoUtils in 'dxDemoUtils.pas',
  dxAboutDemo in 'dxAboutDemo.pas' {dxAboutDemoForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ExpressFlowChart Demo';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
