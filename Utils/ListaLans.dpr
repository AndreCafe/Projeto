program ListaLans;

uses
  Forms,
  uListaLans in 'uListaLans.pas' {FrmPri};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
