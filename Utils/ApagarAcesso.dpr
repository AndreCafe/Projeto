program ApagarAcesso;

uses
  Vcl.Forms,
  uApagarAcesso in 'uApagarAcesso.pas' {FrmPri};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
