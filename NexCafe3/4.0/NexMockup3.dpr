program NexMockup3;

uses
  Forms,
  uNGPriYahoo3 in 'uNGPriYahoo3.pas' {Form1},
  uSuperBanner in 'C:\comp\AppBar\Demo\uSuperBanner.pas' {Form2},
  uWinPopUp in 'uWinPopUp.pas' {FormWinPopUp},
  ncAppUrlLog in '..\Comp\ncAppUrlLog.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Sky fulltime';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TFormWinPopUp, FormWinPopUp);
  Application.Run;
end.
