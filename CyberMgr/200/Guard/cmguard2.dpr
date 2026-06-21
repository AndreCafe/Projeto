program cmguard2;

uses
  Forms,
  uCMGPri in 'uCMGPri.pas' {FrmPri},
  cmDMClient in 'cmDMClient.pas' {dmClient: TDataModule},
  cmConst in '..\Comum\cmConst.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmClient, dmClient);
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
