program ImpTXT;

uses
  Forms,
  uImpTXT in 'uImpTXT.pas' {FrmPri};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
