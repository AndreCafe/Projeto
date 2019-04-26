program ExpEmail;

uses
  Forms,
  uExpEmail in 'uExpEmail.pas' {frmPri},
  nrAutorizacao in '..\..\GS\nrAutorizacao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPri, frmPri);
  Application.Run;
end.
