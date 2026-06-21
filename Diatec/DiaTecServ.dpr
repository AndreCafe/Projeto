program DiaTecServ;

uses
  nxReplacementMemoryManager,
  nx1xAllEngines,
  Forms,
  uDTSrvConsole in 'uDTSrvConsole.pas' {FrmPri},
  uDTSrvProcessa in 'uDTSrvProcessa.pas' {DMProc: TDataModule},
  uDTSyncDef in 'uDTSyncDef.pas',
  uDTTabelas in 'uDTTabelas.pas',
  uDTSrvBDServ in 'uDTSrvBDServ.pas' {dmBDServ: TDataModule},
  uDTSUp in 'uDTSUp.pas' {kbmUp: TkbmMWCustomService},
  uDTFrmChave in 'uDTFrmChave.pas' {FrmChave},
  uDTSDown in 'uDTSDown.pas' {kbmDown: TkbmMWCustomService},
  uDTDBFTabs in 'uDTDBFTabs.pas' {dmDBF: TDataModule},
  uDTFmtTabs in 'uDTFmtTabs.pas',
  licClasses in '..\Licenca\licClasses.pas';

{$R *.RES}

begin
  LePortaFF;
  Application.Initialize;
  LicencaGlobal.LeSerialHD;
  LicencaGlobal.LeArquivoPadrao;
  Application.Title := 'Servidor Diatec';
  Application.CreateForm(TdmBDServ, dmBDServ);
  Application.CreateForm(TDMProc, DMProc);
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
