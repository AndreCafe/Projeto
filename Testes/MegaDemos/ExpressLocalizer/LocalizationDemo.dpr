program LocalizationDemo;

uses
  Forms,
  LocalizationDemoMain in 'LocalizationDemoMain.pas' {Form1},
  LocalizationDemoRes in 'LocalizationDemoRes.pas',
  dxDemoUtils in 'dxDemoUtils.pas',
  dxAboutDemo in 'dxAboutDemo.pas' {dxAboutDemoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
