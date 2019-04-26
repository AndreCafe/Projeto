program ImpHabitus;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  uImpHabitus in 'uImpHabitus.pas' {FrmPri};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Importa dados do ODIN para NexCafé';
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
