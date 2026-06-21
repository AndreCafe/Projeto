program dxSpellCheckerFeaturesDemo;

uses
  Forms,
  MegaDemoMain in 'MegaDemoMain.pas' {fmMain},
  AddDictionaryForm in 'AddDictionaryForm.pas' {fmAddDictionary},
  dxDemoUtils in 'dxDemoUtils.pas',
  dxAboutDemo in 'dxAboutDemo.pas' {dxAboutDemoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressSpellChecker Features Demo';
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmAddDictionary, fmAddDictionary);
  Application.Run;
end.
