program ImpLagoaWeb;

uses
  Forms,
  uImpLagoaWeb in 'uImpLagoaWeb.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
