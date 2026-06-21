program NR_WebServ_Svc;

uses
  nxReplacementMemoryManager,
  SvcMgr,
  SysUtils,
  uNR_WebServ_Svc in 'uNR_WebServ_Svc.pas' {RegistroNextar_WebServer: TService},
  NR_WebServ_DM in 'NR_WebServ_DM.pas' {DM: TDataModule},
  uDMContas in 'uDMContas.pas' {dmContas: TDataModule},
  nr_consts in 'nr_consts.pas',
  nrDebug in 'nrDebug.pas',
  nr_db_conn in 'nr_db_conn.pas' {dm_conn: TDataModule},
  ursDMOpen in 'ursDMOpen.pas' {dmOpen: TDataModule},
  uRSdmEmail in 'uRSdmEmail.pas' {dmEmail: TDataModule},
  uNR_chaveseg in 'uNR_chaveseg.pas',
  nr_checaconta in 'nr_checaconta.pas',
  nr_autoconn in 'nr_autoconn.pas' {dm_autoconn: TDataModule},
  nr_cc_add in 'nr_cc_add.pas' {dm_cc_add: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  InicializaGChaves;
  CurrencyString := 'R$';
  ThousandSeparator := '.';
  DecimalSeparator := ',';
  ShortDateFormat := 'dd/mm/yyyy';
  nomearqdebug := 'NR_WebServ_Debug.txt';
  DebugAtivo := True;
  Application.Title := 'Registro Nextar - WEB Server';
  Application.CreateForm(TRegistroNextar_WebServer, RegistroNextar_WebServer);
  Application.Run;
end.
