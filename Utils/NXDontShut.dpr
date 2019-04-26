program NXDontShut;

uses
  Forms,
  uFrmDontShut in 'uFrmDontShut.pas' {FrmDontShut},
  uDMNXDontShut in 'uDMNXDontShut.pas' {dm: TDataModule},
  ncErros in '..\Comp\ncErros.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmDontShut, FrmDontShut);
  Application.Run;
end.
