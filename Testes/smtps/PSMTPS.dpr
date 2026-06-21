program PSMTPS;

uses
  Forms,
  usmtps in 'usmtps.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
