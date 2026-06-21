program TesteAmbiente;

uses
  Forms,
  uTesteAmb in 'uTesteAmb.pas' {FrmPri};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
