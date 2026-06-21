program DragDropDemo;

uses
  Forms,
  DragDropMain in 'DragDropMain.pas' {fmDragDropMain},
  dxDemoUtils in '..\dxDemoUtils.pas',
  dxAboutDemo in '..\dxAboutDemo.pas' {dxAboutDemoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressNavBar Demo';
  Application.CreateForm(TfmDragDropMain, fmDragDropMain);
  Application.Run;
end.
