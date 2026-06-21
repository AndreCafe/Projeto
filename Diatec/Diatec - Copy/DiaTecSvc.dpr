program DiaTecSvc;

uses
  nxReplacementMemoryManager,
  SvcMgr,
  SysUtils,
  licClasses in '..\Licenca\licClasses.pas',
  uDTSvc in 'uDTSvc.pas' {DiaTec: TService},
  uDTSrvBDServ in 'uDTSrvBDServ.pas' {FFServ: TnxBaseEngineManager},
  uDTSrvProcessa in 'uDTSrvProcessa.pas' {DMProc: TDataModule},
  uDTSyncDef in 'uDTSyncDef.pas',
  uDTSUp in 'uDTSUp.pas' {kbmUp: TkbmMWCustomService},
  uDTSDown in 'uDTSDown.pas' {kbmDown: TkbmMWCustomService},
  uDTFmtTabs in 'uDTFmtTabs.pas';

{$R *.RES}

begin
  ShortDateFormat := 'dd/mm/yyyy';
  LicencaGlobal.LeSerialHD;
  LicencaGlobal.LeArquivoPadrao;
  LePortaFF;
  Application.Initialize;
  Application.Title := 'Diário do Técnico';
  Application.CreateForm(TDiaTec, DiaTec);
  Application.Run;
end.
