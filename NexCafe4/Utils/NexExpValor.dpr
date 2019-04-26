program NexExpValor;

uses
  Forms,
  uExpPri in 'uExpPri.pas' {FrmPri};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'NexCafé: Exportação de valores pagos por clientes';
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
