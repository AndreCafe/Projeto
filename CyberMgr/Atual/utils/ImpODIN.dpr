program ImpODIN;

uses
  Forms,
  uImpODIN in 'uImpODIN.pas' {FrmPri};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
