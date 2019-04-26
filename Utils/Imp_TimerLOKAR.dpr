program Imp_TimerLOKAR;

uses
  Forms,
  uImp_TimerLokar in 'uImp_TimerLokar.pas' {FrmPri};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Importa dados do ODIN para NexCafé';
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
