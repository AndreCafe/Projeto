program NR_CC_Svc;

uses
  nxReplacementMemoryManager,
  SvcMgr,
  SysUtils,
  uNR_CC_Svc in 'uNR_CC_Svc.pas' {RegistroNextar_SalvaChecaConta: TService},
  nr_consts in 'nr_consts.pas',
  nrDebug in 'nrDebug.pas',
  nr_db_conn in 'nr_db_conn.pas' {dm_conn: TDataModule},
  nr_cc_dm in 'nr_cc_dm.pas' {dm_cc: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  CurrencyString := 'R$';
  ThousandSeparator := '.';
  DecimalSeparator := ',';
  ShortDateFormat := 'dd/mm/yyyy';
  nomearqdebug := 'NR_CC_Debug.txt';
  DebugAtivo := True;
  Application.Title := 'Registro Nextar - Salva Checa Conta';
  Application.CreateForm(TRegistroNextar_SalvaChecaConta, RegistroNextar_SalvaChecaConta);
  Application.Run;
end.
