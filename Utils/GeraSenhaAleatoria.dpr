program GeraSenhaAleatoria;

uses
  Forms,
  uGeraSenhaAleatoria in 'uGeraSenhaAleatoria.pas' {FrmPri};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'NexCafé: Gerador de senhas aleatórias';
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
