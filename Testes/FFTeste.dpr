program FFTeste;

uses
  Forms,
  uFFTeste in 'uFFTeste.pas' {Form1},
  uFFSEMgr in 'uFFSEMgr.pas' {FFEngineManager1: TffBaseEngineManager};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFFEngineManager1, FFEngineManager1);
  Application.Run;
end.
