program RegistroServ;

uses
  Forms,
  uRSFrmPri in 'uRSFrmPri.pas' {FrmPri},
  uRSDM in 'uRSDM.pas' {DM: TDataModule},
  uLicenca in 'uLicenca.pas',
  uRSLogInfo in 'uRSLogInfo.pas',
  uRSQSAdmin100 in 'uRSQSAdmin100.pas' {qsAdmin100: TkbmMWQueryService},
  ursCHAT100 in 'ursCHAT100.pas' {qsCHAT100: TkbmMWQueryService},
  uMWChatConst in 'uMWChatConst.pas',
  uRSQSRegistro100 in 'uRSQSRegistro100.pas',
  uRSGerenteChave in 'uRSGerenteChave.pas',
  uRSDMGerenteChave in 'uRSDMGerenteChave.pas' {dmGerente: TDataModule},
  kbmMWZipStdTransStream in 'C:\comp\kbmMW25\Source\kbmMWZipStdTransStream.pas',
  uRSQSRegistro200 in 'uRSQSRegistro200.pas' {qsRegistro200: TkbmMWQueryService};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPri, FrmPri);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TdmGerente, dmGerente);
  Application.Run;
end.
