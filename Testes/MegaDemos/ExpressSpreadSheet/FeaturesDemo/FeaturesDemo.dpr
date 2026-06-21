program FeaturesDemo;

uses
  Forms,
  cxSpreadSheetMain in 'cxSpreadSheetMain.pas' {cxSpreadSheetMainForm},
  cxSpreadSheetModify in 'cxSpreadSheetModify.pas' {cxSpreadSheetModifyForm},
  dxDemoUtils in 'dxDemoUtils.pas',
  dxAboutDemo in 'dxAboutDemo.pas' {dxAboutDemoForm};

{Form1}

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressSpreadSheet Demo';
  Application.CreateForm(TcxSpreadSheetMainForm, cxSpreadSheetMainForm);
  Application.Run;
end.
