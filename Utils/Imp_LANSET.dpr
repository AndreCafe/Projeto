program Imp_LANSET;

uses
  Forms,
  uImp_LANSET in 'uImp_LANSET.pas' {FrmPri};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Importa dados do ODIN para NexCafé';
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
