program RegistroSvc;

uses
  SvcMgr,
  uRegistroSvc in 'uRegistroSvc.pas' {RegistroServ: TService},
  uRSDM in 'uRSDM.pas' {DM: TDataModule},
  uRSqsRegistro100 in 'uRSQSRegistro100.pas' {qsRegistro100: TkbmMWQueryService},
  uRSQSAdmin100 in 'uRSQSAdmin100.pas' {qsAdmin100: TkbmMWQueryService};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Servidor de Registro CyberSoft-BR';
  Application.CreateForm(TRegistroServ, RegistroServ);
  Application.Run;
end.
