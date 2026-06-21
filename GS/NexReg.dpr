program NexReg;

uses
  Forms,
  uNexRegPri in 'uNexRegPri.pas' {FrmPri},
  uNRFrmCli in 'uNRFrmCli.pas' {FrmCli},
  uNRfbClientes in 'uNRfbClientes.pas' {fbClientes},
  uNexRegDM in 'uNexRegDM.pas' {DM: TDataModule},
  uNRFrmTitulo in 'uNRFrmTitulo.pas' {FrmTitulo},
  ufmFormBase in '..\FormMgr\ufmFormBase.pas' {FrmBase},
  ufmImagens in '..\FormMgr\ufmImagens.pas' {dmImagens: TDataModule},
  uNRFrmLogin in 'uNRFrmLogin.pas' {FrmLogin},
  uNRFrmSenha in 'uNRFrmSenha.pas' {FrmAlteraSenha},
  kbmMWZipStdTransStream in 'C:\comp\kbmMW25\Source\kbmMWZipStdTransStream.pas',
  uNRfbTitulos in 'uNRfbTitulos.pas' {fbTitulos: TFrmBasePai},
  uFrmHC in 'uFrmHC.pas' {FrmHC},
  uFrmAutorizacao in 'uFrmAutorizacao.pas' {FrmAut},
  nrAutorizacao in 'nrAutorizacao.pas',
  uLicenca in 'uLicenca.pas',
  uNRfbAut in 'uNRfbAut.pas' {fbAut: TFrmBasePai},
  uLicEXECryptor in 'uLicEXECryptor.pas',
  uLinkBol in 'uLinkBol.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'NexReg';
  Application.CreateForm(TdmImagens, dmImagens);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
