program DockingMegaDemo;

uses
  Forms,
  DockingMegaDemoMain in 'DockingMegaDemoMain.pas' {DockingMegaDemoMainForm},
  dxDemoUtils in '..\dxDemoUtils.pas',
  dxAboutDemo in '..\dxAboutDemo.pas' {dxAboutDemoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressBars DockingMega Demo';
  Application.CreateForm(TDockingMegaDemoMainForm, DockingMegaDemoMainForm);
  Application.Run;
end.
