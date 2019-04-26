program ImpV5;

uses
  nxReplacementMemoryManager,
  nxReplacementMove,
  Forms,
  uFrmImpV5 in 'uFrmImpV5.pas' {FrmImpFromV5};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Downgrade de versão';
  Application.CreateForm(TFrmImpFromV5, FrmImpFromV5);
  Application.Run;
end.
