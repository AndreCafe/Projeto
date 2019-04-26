program NexMockup1;

uses
  Forms,
  uNGPriYahoo in 'uNGPriYahoo.pas' {Form1},
  uM1Frm2 in 'C:\comp\AppBar\Demo\uM1Frm2.pas' {Form2},
  uWinPopUp in 'uWinPopUp.pas' {FormWinPopUp},
  ncAppUrlLog in '..\Comp\ncAppUrlLog.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'LRECT/SKY';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TFormWinPopUp, FormWinPopUp);
  Application.Run;
end.
