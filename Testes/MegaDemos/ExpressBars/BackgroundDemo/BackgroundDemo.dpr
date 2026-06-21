program BackgroundDemo;

uses
  Forms,
  BackgroundDemoMain in 'BackgroundDemoMain.pas' {BackgroundDemoMainForm},
  dxDemoUtils in '..\dxDemoUtils.pas',
  dxAboutDemo in '..\dxAboutDemo.pas' {dxAboutDemoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressBars Background Demo';
  Application.CreateForm(TBackgroundDemoMainForm, BackgroundDemoMainForm);
  Application.Run;
end.
