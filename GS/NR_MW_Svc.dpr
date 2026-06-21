program NR_MW_Svc;

uses
  SvcMgr,
  uNR_MW_Svc in 'uNR_MW_Svc.pas' {RegistroNextar_MWServer: TService},
  NR_MW_DM in 'NR_MW_DM.pas' {DM: TDataModule},
  kbmMWZipStdTransStream in 'C:\comp\kbmMW25\Source\kbmMWZipStdTransStream.pas',
  uRSQSRegistro100 in 'uRSQSRegistro100.pas' {qsRegistro100: TkbmMWQueryService},
  uRSQSAdmin100 in 'uRSQSAdmin100.pas' {qsAdmin100: TkbmMWQueryService},
  uRSQSRegistro200 in 'uRSQSRegistro200.pas' {qsRegistro200: TkbmMWQueryService},
  uRSQSRegistro300 in 'uRSQSRegistro300.pas' {qsRegistro300: TkbmMWQueryService},
  nr_consts in 'nr_consts.pas',
  nr_db_conn in 'nr_db_conn.pas' {dm_conn: TDataModule},
  nrDebug in 'nrDebug.pas';

{$R *.RES}

begin
  NomeArqDebug := 'NR_MW_Debug.txt';
  DebugAtivo := True;
  Application.Initialize;
  Application.Title := 'Registro Nextar';
  Application.CreateForm(TRegistroNextar_MWServer, RegistroNextar_MWServer);
  Application.Run;
end.
