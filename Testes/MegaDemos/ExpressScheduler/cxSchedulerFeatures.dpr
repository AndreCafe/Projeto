program cxSchedulerFeatures;

uses
  Forms,
  Windows,
  Classes,
  SysUtils,
  Registry,
  dxMainUnit in 'dxMainUnit.pas' {frmMain},
  dxProperties in 'dxProperties.pas' {frmInspector},
  dxProgress in 'dxProgress.pas' {frmProgress},
  dxCustomEditor in 'dxCustomEditor.pas' {cxSchedulerEventCustomEditor},
  SelectStorageUnit in 'SelectStorageUnit.pas' {SelectStorage},
  dxDemoUtils in 'dxDemoUtils.pas',
  dxAboutDemo in 'dxAboutDemo.pas' {dxAboutDemoForm};

{$R *.res}

begin
  if not HasJet then
  begin
    MessageBox(0, PChar(ThereIsNoMDACMessage), nil, MB_ICONERROR);
    Halt;
  end;
  Application.Initialize;
  Application.Title := 'ExpressScheduler Features Demo';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmInspector, frmInspector);
  Application.Run;
end.
