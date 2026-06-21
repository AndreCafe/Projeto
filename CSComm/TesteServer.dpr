program TesteServer;

uses
  Forms,
  uTestServer in 'uTestServer.pas' {Form1},
  uDefMsg in 'uDefMsg.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
