program Setup_NexCafe_Plus;

uses
  Forms,
  unxInst_Pri_plus in 'unxInst_Pri_plus.pas' {FrmPri},
  unxInst_Folder in 'unxInst_Folder.pas' {FrmFolder},
  ncFirewall in '..\Comp\ncFirewall.pas';

{$R *.res}
{$R uacs.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'NexCafé - Programa de Instalação';
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
