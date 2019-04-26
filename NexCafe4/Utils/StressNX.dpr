program StressNX;

uses
  Forms,
  uStressNexServ in 'uStressNexServ.pas' {Form5},
  uDMStressNX in 'uDMStressNX.pas' {dm: TDataModule},
  ncErros in '..\Comp\ncErros.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
