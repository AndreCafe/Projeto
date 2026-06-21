program DiatecAdmin;

uses
  Forms,
  uDiatecAdmin in 'uDiatecAdmin.pas' {FrmPri},
  uDTSyncDef in 'uDTSyncDef.pas',
  uDTAFrmApagar in 'uDTAFrmApagar.pas' {FrmApagar},
  uDMA in 'uDMA.pas' {DM: TDataModule},
  kbmMWZipStdTransStream,
  uAFrmFecha in 'uAFrmFecha.pas' {FrmRAF},
  uAFrmData in 'uAFrmData.pas' {FrmData},
  uAFrmItemRA in 'uAFrmItemRA.pas' {FrmRA},
  uAFrmAprov in 'uAFrmAprov.pas' {FrmAprov},
  uAFrmExp in 'uAFrmExp.pas' {FrmExp},
  uDMARels in 'uDMARels.pas' {dmRels: TDataModule},
  uAFrmRel in 'uAFrmRel.pas' {FrmTipoRel},
  uVersionInfo in '..\Utils\uVersionInfo.pas',
  uDebug in 'uDebug.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Diatec Admin';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmPri, FrmPri);
  Application.CreateForm(TFrmRAF, FrmRAF);
  Application.CreateForm(TFrmRA, FrmRA);
  Application.CreateForm(TFrmExp, FrmExp);
  Application.Run;
end.
