program Discador;

uses
  Forms,
  uFrmPri in 'uFrmPri.pas' {FrmPri},
  uConfig in 'uConfig.pas' {FrmConfig},
  uFrmDiscar in 'uFrmDiscar.pas' {FrmDiscar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Discador CRM Nextar';
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
