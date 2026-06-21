program NewProject;

{#ROGEN:NewLibrary.rodl} // RemObjects: Careful, do not remove!

uses
  uROComInit,
  Forms,
  fServerForm in 'fServerForm.pas' {ServerForm},
  NewService_Impl in 'NewService_Impl.pas' {NewService: TDARemoteService},
  fServerDataModule in 'fServerDataModule.pas' {ServerDataModule: TDataModule};

{$R *.res}
{$R RODLFile.res}

begin
  Application.Initialize;
  Application.CreateForm(TServerDataModule, ServerDataModule);
  Application.CreateForm(TServerForm, ServerForm);
  Application.Run;
end.
