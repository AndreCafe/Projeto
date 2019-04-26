program Project18;

uses
  Forms,
  Unit25 in 'Unit25.pas' {Form25},
  ncProtecao98 in 'ncProtecao98.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm25, Form25);
  Application.Run;
end.
