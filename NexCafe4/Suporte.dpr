program Suporte;

uses
  Forms,
  uSuporte in 'uSuporte.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Suporte Remoto';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
