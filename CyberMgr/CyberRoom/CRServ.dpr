program CRServ;

uses
  Forms,
  uCRFrmPri in 'uCRFrmPri.pas' {FrmPri},
  uCRDM in 'uCRDM.pas' {DM: TDataModule},
  uCRQS100 in 'uCRQS100.pas' {QS100: TkbmMWQueryService},
  uLicenca in '..\GS\uLicenca.pas',
  uRSLogInfo in '..\GS\uRSLogInfo.pas';

{$R *.res}

var 
  TE : TThreadEnter;

begin
  TE := TThreadEnter.Create(False);
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
  TE.Terminate;
end.
