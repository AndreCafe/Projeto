program MDIDemo;

uses
  Forms,
  MDIDemoMain in 'MDIDemoMain.pas' {frmMDIMain},
  MDIDemoChild in 'MDIDemoChild.pas' {frmMDIChild},
  dxDemoUtils in '..\dxDemoUtils.pas',
  dxAboutDemo in '..\dxAboutDemo.pas' {dxAboutDemoForm};

{$R *.RES}

begin
  Application.Title := 'ExpressBars MDI Demo';
  Application.Initialize;
  Application.CreateForm(TfrmMDIMain, frmMDIMain);
  Application.Run;
end.
