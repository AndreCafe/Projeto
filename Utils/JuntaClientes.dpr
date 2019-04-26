program JuntaClientes;

uses
  Forms,
  uJuntaClientes in 'uJuntaClientes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm18, Form18);
  Application.Run;
end.
