program NexMockup4;

uses
  Forms,
  uNGPriYahoo4 in 'uNGPriYahoo4.pas' {Form1},
  uM4Frm2 in 'C:\comp\AppBar\Demo\uM4Frm2.pas' {Form2},
  uWinPopUp in 'uWinPopUp.pas' {FormWinPopUp},
  ncAppUrlLog in '..\Comp\ncAppUrlLog.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'LRECT/SKY';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormWinPopUp, FormWinPopUp);
  Application.Run;
end.
