program ImportaMovEst;

uses
  Forms,
  uImpMovEst in 'uImpMovEst.pas' {FrmPri},
  cmDMImpMovEst in 'cmDMImpMovEst.pas' {dmConv15: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPri, FrmPri);
  Application.CreateForm(TdmConv15, dmConv15);
  Application.Run;
end.
