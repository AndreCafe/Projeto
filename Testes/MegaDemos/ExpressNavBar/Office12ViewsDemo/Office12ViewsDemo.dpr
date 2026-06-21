program Office12ViewsDemo;

uses
  Forms,
  dxAboutDemo in '..\dxAboutDemo.pas',
  dxDemoUtils in '..\dxDemoUtils.pas',
  Office12ViewsMain in 'Office12ViewsMain.pas' {fmMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ExpressNavBar Demo';
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
