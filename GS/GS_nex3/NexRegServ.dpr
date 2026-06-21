program NexRegServ;

uses
  Forms,
  uRSFrmPri in 'uRSFrmPri.pas' {FrmPri},
  uRSDM in 'uRSDM.pas' {DM: TDataModule},
  uLicenca in 'uLicenca.pas',
  uRSLogInfo in 'uRSLogInfo.pas',
  uRSQSAdmin100 in 'uRSQSAdmin100.pas' {qsAdmin100: TkbmMWQueryService},
  ursCHAT100 in 'ursCHAT100.pas' {qsCHAT100: TkbmMWQueryService},
  uMWChatConst in 'uMWChatConst.pas',
  uRSGerenteChave in 'uRSGerenteChave.pas',
  uRSDMGerenteChave in 'uRSDMGerenteChave.pas' {dmGerente: TDataModule},
  kbmMWZipStdTransStream in 'C:\comp\kbmMW25\Source\kbmMWZipStdTransStream.pas',
  uRSQSRegistro300 in 'uRSQSRegistro300.pas' {qsRegistro300: TkbmMWQueryService},
  uLicEXECryptor in 'uLicEXECryptor.pas',
  uRSServBD in 'uRSServBD.pas' {dmServidorBD: TDataModule},
  nrAutorizacao in 'nrAutorizacao.pas',
  uRSQSRegistro100 in 'uRSQSRegistro100.pas' {qsRegistro100: TkbmMWQueryService},
  uRSQSRegistro200 in 'uRSQSRegistro200.pas' {qsRegistro200: TkbmMWQueryService},
  uRSAss in 'uRSAss.pas',
  nrTablesDef in 'nrTablesDef.pas';

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Registro Nextar';
  Application.CreateForm(TdmServidorBD, dmServidorBD);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmPri, FrmPri);
  Application.CreateForm(TdmGerente, dmGerente);
  Application.Run;
end.
