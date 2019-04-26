program setup_nexcafe_w8;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  unxInst_w8_Pri in 'unxInst_w8_Pri.pas' {FrmPri},
  unxInst_Folder in 'unxInst_Folder.pas' {FrmFolder},
  ncFirewall in '..\Comp\ncFirewall.pas',
  ncDebug in '..\comp\ncDebug.pas';

{$R *.res}
{$R uacs.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'NexCafé - Programa de Instalação';
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
