program ImpVS;

uses
  Forms,
  uImpVS in 'uImpVS.pas' {FrmPri};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
