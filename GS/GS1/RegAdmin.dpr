program RegAdmin;

uses
  Forms,
  uRAPri in 'uRAPri.pas' {FrmPri},
  uRSFrmCli in 'uRSFrmCli.pas' {FrmCli},
  uRAfbClientes in 'uRAfbClientes.pas' {fbClientes},
  uRADM in 'uRADM.pas' {DM: TDataModule},
  uRAfbLog in 'uRAfbLog.pas' {fbLog},
  uRAfbPlanoContas in 'uRAfbPlanoContas.pas' {fbPC},
  uRAFrmTitulo in 'uRAFrmTitulo.pas' {FrmTitulo},
  urafbStatus in 'urafbStatus.pas' {fbStatus},
  uRAFrmMenu in 'uRAFrmMenu.pas' {FrmMenu},
  urafrmStatus in 'urafrmStatus.pas' {FrmStatus},
  uRAFrmPC in 'uRAFrmPC.pas' {FrmPC},
  ufmFormBase in '..\FormMgr\ufmFormBase.pas' {FrmBase},
  ufmImagens in '..\FormMgr\ufmImagens.pas' {dmImagens: TDataModule},
  uRAfbTitulos in 'uRAfbTitulos.pas' {fbTitulos: TFrmBasePai},
  uRAfbPREstat in 'uRAfbPREstat.pas' {fbPREstat: TFrmBasePai},
  uRAFrmLogin in 'uRAFrmLogin.pas' {FrmLogin},
  uRAFrmAlteraSenha in 'uRAFrmAlteraSenha.pas' {FrmAlteraSenha},
  uRAfbUsuario in 'uRAfbUsuario.pas' {fbUsuario: TFrmBasePai},
  uRAFrmUsuario in 'uRAFrmUsuario.pas' {FrmUsuario};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Reg-Admin';
  Application.CreateForm(TdmImagens, dmImagens);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
