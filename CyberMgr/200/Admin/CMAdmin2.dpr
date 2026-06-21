program CMAdmin2;

uses
  Forms,
  ucmaFrmPri in 'ucmaFrmPri.pas' {FrmPri};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
