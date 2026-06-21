program NewProjectClient;

uses
  uROComInit,
  Forms,
  fClientForm in 'fClientForm.pas' {ClientForm},
  fClientDataModule in 'fClientDataModule.pas' {ClientDataModule: TDAClientDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClientDataModule, ClientDataModule);
  Application.CreateForm(TClientForm, ClientForm);
  Application.Run;
end.
