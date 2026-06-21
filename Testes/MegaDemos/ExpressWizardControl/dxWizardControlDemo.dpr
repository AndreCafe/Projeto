program dxWizardControlDemo;

uses
  Forms,
  dxWizardControlDemoMainForm in 'dxWizardControlDemoMainForm.pas' {frmWizardControlDemoMain},
  dxWizardControlDemoSetupForm in 'dxWizardControlDemoSetupForm.pas' {frmWizardControlDemoSetup};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmWizardControlDemoMain, frmWizardControlDemoMain);
  Application.Run;
end.
