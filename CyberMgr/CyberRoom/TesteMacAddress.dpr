program TesteMacAddress;

uses
  Forms,
  uTesteMacAddress in 'uTesteMacAddress.pas' {Form1},
  MACAdress in 'MACAdress.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
