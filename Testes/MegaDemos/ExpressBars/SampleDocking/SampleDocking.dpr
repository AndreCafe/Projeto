program SampleDocking;

uses
  Forms,
  SampleDockingMain in 'SampleDockingMain.pas' {SampleDockingMainForm},
  SampleDockingRichText in 'SampleDockingRichText.pas' {SampleDockingRichTextFrame: TForm},
  SampleDockingRadioGroup in 'SampleDockingRadioGroup.pas' {SampleDockingRadioGroupFrame: TForm},
  SampleDockingTreeView in 'SampleDockingTreeView.pas' {SampleDockingTreeViewFrame: TForm},
  SampleDockingListBox in 'SampleDockingListBox.pas' {SampleDockingListBoxFrame: TForm},
  dxDemoUtils in '..\dxDemoUtils.pas',
  dxAboutDemo in '..\dxAboutDemo.pas' {dxAboutDemoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressBars SampleDocking Demo';
  Application.CreateForm(TSampleDockingMainForm, SampleDockingMainForm);
  Application.Run;
end.
