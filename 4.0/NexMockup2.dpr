program NexMockup2;

uses
  Forms,
  uNGPriYahoo2 in 'uNGPriYahoo2.pas' {Form1},
  Unit2 in 'C:\comp\AppBar\Demo\Unit2.pas' {Form2},
  ncAppUrlLog in '..\Comp\ncAppUrlLog.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Sky fulltime';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
