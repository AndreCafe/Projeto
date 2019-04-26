program nexCafe5PrintCommand;

uses
  Forms,
  Unit4 in 'Unit4.pas' {Form4},
  uVersionInfo in 'C:\Comp\varios\uVersionInfo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
