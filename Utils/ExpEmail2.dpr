program ExpEmail2;

uses
  Forms,
  uExpEmail2 in 'uExpEmail2.pas' {frmPri},
  nrAutorizacao in '..\..\GS\nrAutorizacao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPri, frmPri);
  Application.Run;
end.
