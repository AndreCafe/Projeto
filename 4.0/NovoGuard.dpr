program NovoGuard;

uses
  Forms,
  uNGPri in 'uNGPri.pas' {Form1},
  Unit2 in 'C:\comp\AppBar\Demo\Unit2.pas' {Form2},
  uWinPopUp in 'uWinPopUp.pas' {FormWinPopUp};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TFormWinPopUp, FormWinPopUp);
  Application.Run;
end.
