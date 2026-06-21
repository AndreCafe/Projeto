program NR_Email_Svc;

uses
  SvcMgr,
  uNR_Email_Svc in 'uNR_Email_Svc.pas' {RegistroNextar_Email: TService},
  nrDebug in 'nrDebug.pas',
  nr_db_conn in 'nr_db_conn.pas' {dm_conn: TDataModule};

{$R *.RES}

begin
  nomearqdebug := 'NR_Email_Debug.txt';
  DebugAtivo := True;
  Application.Initialize;
  Application.Title := 'Registro Nextar';
  Application.CreateForm(TRegistroNextar_Email, RegistroNextar_Email);
  Application.Run;
end.
