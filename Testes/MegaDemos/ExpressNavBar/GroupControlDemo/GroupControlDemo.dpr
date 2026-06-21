program GroupControlDemo;

uses
  Forms,
  dxAboutDemo in '..\dxAboutDemo.pas',
  dxDemoUtils in '..\dxDemoUtils.pas',
  GroupControlMain in 'GroupControlMain.pas' {fmGroupControlMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ExpressNavBar Demo';
  Application.CreateForm(TfmGroupControlMain, fmGroupControlMain);
  Application.Run;
end.
