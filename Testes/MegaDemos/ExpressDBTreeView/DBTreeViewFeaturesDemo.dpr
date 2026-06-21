program DBTreeViewFeaturesDemo;

uses
  Forms,
  main in 'main.pas' {MainForm},
  Grid in 'Grid.pas' {GridForm},
  More in 'More.pas' {MoreForm},
  Find in 'Find.pas' {FindForm},
  dxDemoUtils in 'dxDemoUtils.pas',
  dxAboutDemo in 'dxAboutDemo.pas' {dxAboutDemoForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ExpressDBTree Demo';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TGridForm, GridForm);
  Application.CreateForm(TMoreForm, MoreForm);
  Application.CreateForm(TFindForm, FindForm);
  Application.Run;
end.
