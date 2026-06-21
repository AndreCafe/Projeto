program NR_DBServ_Svc;

uses
  nxReplacementMemoryManager,
  SvcMgr,
  nxllZipCompressor,
  uNR_DBServ_Svc in 'uNR_DBServ_Svc.pas' {RegistroNextar_DBServ: TService},
  uRSServBD in 'uRSServBD.pas' {dmServidorBD: TDataModule},
  nrDebug in 'nrDebug.pas',
  nrTablesDef in 'nrTablesDef.pas',
  nr_status in 'nr_status.pas',
  nrTablesDef_cc in 'nrTablesDef_cc.pas';

{$R *.RES}

begin
  nomearqdebug := 'nr_debug_dbserv.txt';
  DebugAtivo := True;
  Application.Initialize;
  Application.Title := 'Registro Nextar - DB Server';
  Application.CreateForm(TRegistroNextar_DBServ, RegistroNextar_DBServ);
  Application.Run;
end.
