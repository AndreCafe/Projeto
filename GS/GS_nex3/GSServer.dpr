program GSServer;

uses
  Forms,
  uGSSPri in 'uGSSPri.pas' {FrmPri},
  uGSSDM in 'uGSSDM.pas' {DM: TDataModule},
  uGSSCadastro in 'uGSSCadastro.pas' {qsCadastro: TkbmMWQueryService};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPri, FrmPri);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
