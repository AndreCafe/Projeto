program TesteImp;

uses
  Forms,
  uTesteImp in 'uTesteImp.pas' {FrmPri},
  uDMBaseImpNX2 in 'uDMBaseImpNX2.pas' {dmImpNX: TDataModule},
  nrAutorizacao in '..\..\GS\nrAutorizacao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
