program CMServer2;



uses
  nx1xAllEngines,
  Forms,
  uCMSPri in 'uCMSPri.pas' {FrmPri},
  cmDMServ in 'cmDMServ.pas' {DMServ: TDataModule},
  cmConst in '..\Comum\cmConst.pas',
  cmsConst in 'cmsConst.pas',
  cmmwsGuard in 'cmmwsGuard.pas' {mwsGuard: TkbmMWCustomQueryService},
  cmClassesBase in '..\Comum\cmClassesBase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPri, FrmPri);
  Application.CreateForm(TDMServ, DMServ);
  Application.Run;
end.
