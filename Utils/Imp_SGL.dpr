program Imp_SGL;

uses
  Forms,
  uImp_SGL in 'uImp_SGL.pas' {FrmPri};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Importa dados do ODIN para NexCafé';
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
