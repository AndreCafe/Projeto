program TesteEmail;

uses
  Forms,
  uFrmPri in 'uFrmPri.pas' {FrmPri},
  uDMEmail in 'uDMEmail.pas' {dmEmail: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPri, FrmPri);
  Application.CreateForm(TdmEmail, dmEmail);
  Application.Run;
end.
