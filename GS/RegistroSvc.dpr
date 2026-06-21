program RegistroSvc;

uses
  SvcMgr,
  uRegistroSvc in 'uRegistroSvc.pas' {RegistroNextar: TService},
  uRSDM in 'uRSDM.pas' {DM: TDataModule},
  uRSQSRegistro100 in 'uRSQSRegistro100.pas' {qsRegistro100: TkbmMWQueryService},
  uRSQSAdmin100 in 'uRSQSAdmin100.pas' {qsAdmin100: TkbmMWQueryService};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Registro Nextar';
  Application.CreateForm(TRegistroNextar, RegistroNextar);
  Application.Run;
end.
