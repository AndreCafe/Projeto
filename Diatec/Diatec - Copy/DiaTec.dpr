program DiaTec;

uses
  nx1xAllEngines,
  Forms,
  SysUtils,
  kbmmwZipStdTransStream,
  uDTFrmPri in 'uDTFrmPri.pas' {FrmPri},
  uDTDM in 'uDTDM.pas' {DM: TDataModule},
  uDTFrmAponta in 'uDTFrmAponta.pas' {FrmAponta},
  uFrmLogin in 'uFrmLogin.pas' {FrmLogin},
  uDTFrmOS in 'uDTFrmOS.pas' {FrmOS},
  uChecaTabelas in 'uChecaTabelas.pas' {FrmChecaBD},
  uDTFrmFase in 'uDTFrmFase.pas' {FrmFase},
  uDTDMSync in 'uDTDMSync.pas' {DMSync: TDataModule},
  uDTSyncDef in 'uDTSyncDef.pas',
  uDTFrmUp in 'uDTFrmUp.pas' {FrmUp},
  uDTFrmDown in 'uDTFrmDown.pas' {FrmDown},
  uFrmRepView in 'uFrmRepView.pas' {FrmRepView},
  uDTGrDsk in 'uDTGrDsk.pas' {FrmGrDsk},
  uDTFrmCGP in 'uDTFrmCGP.pas' {FrmCGP},
  uDTFrmRA in 'uDTFrmRA.pas' {FrmRA},
  uDTFrmItemRA in 'uDTFrmItemRA.pas' {FrmItemRA},
  uDTFmtTabs in 'uDTFmtTabs.pas',
  uDTRels in 'uDTRels.pas' {dmRels: TDataModule},
  uDTFrmExcluiOSServ in 'uDTFrmExcluiOSServ.pas' {FrmExcluiOSServ},
  uVersion in '..\Utils\uVersion.pas',
  uVersionInfo in '..\Utils\uVersionInfo.pas',
  uNovaFase in 'uNovaFase.pas' {FrmNovaFase},
  uDTFrmCorrigirOS in 'uDTFrmCorrigirOS.pas' {FrmCorrigirOS};

{$R *.RES}

begin
  Randomize;
  ShortDateFormat := 'dd/mm/yyyy';
  LePortaFF;
  Inicializando := True;
  DMSync := nil;
  Application.Initialize;
  Application.Title := 'Diário do Técnico';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmPri, FrmPri);
  Application.CreateForm(TFrmRepView, FrmRepView);
  Application.Run;
end.
