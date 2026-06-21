program EstMovimento;

uses
  Forms,
  uEstMovimento in 'uEstMovimento.pas' {Form42};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm42, Form42);
  Application.Run;
end.
