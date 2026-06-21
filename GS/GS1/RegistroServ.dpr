program RegistroServ;

uses
  Forms,
  uRSFrmPri in 'uRSFrmPri.pas' {FrmPri},
  uRSDM in 'uRSDM.pas' {DM: TDataModule},
  uRSQSRegistro100 in 'uRSQSRegistro100.pas' {qsRegistro100: TkbmMWQueryService},
  uLicenca in 'uLicenca.pas',
  uRSLogInfo in 'uRSLogInfo.pas',
  uRSQSAdmin100 in 'uRSQSAdmin100.pas' {qsAdmin100: TkbmMWQueryService},
  ursCHAT100 in 'ursCHAT100.pas' {qsCHAT100: TkbmMWQueryService},
  uMWChatConst in 'uMWChatConst.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPri, FrmPri);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
