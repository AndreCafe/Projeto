program Faixas;

uses
  Forms,
  uFrmPanFaixas in 'uFrmPanFaixas.pas' {FrmFaixas},
  uFrmPanFaixa in 'uFrmPanFaixa.pas' {FrmPanFaixa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmFaixas, FrmFaixas);
  Application.CreateForm(TFrmPanFaixa, FrmPanFaixa);
  Application.Run;
end.
