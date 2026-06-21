program FeaturesDemo;

uses
  dxGDIPlusAPI,
  Forms,
  FeaturesDialog in 'FeaturesDialog.pas' {fmFeaturesDailog},
  dxDemoUtils in '..\dxDemoUtils.pas',
  FeaturesMain in 'FeaturesMain.pas' {fmFeaturesMain},
  dxAboutDemo in '..\dxAboutDemo.pas' {dxAboutDemoForm};

{$R *.RES}

var
  ADialog: TForm;
begin
  Application.Initialize;
  Application.Title := 'ExpressNavBar Demo';
  if not CheckGdiPlus then
  begin
    ADialog := TfmFeaturesDailog.Create(Application);
    ADialog.ShowModal;
    ADialog.Free;
  end;
  Application.CreateForm(TfmFeaturesMain, fmFeaturesMain);
  Application.Run;
end.
