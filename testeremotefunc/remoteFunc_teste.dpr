program RemoteFunc_teste;

uses
  Forms,
  uRemoteFunc_teste in 'uRemoteFunc_teste.pas' {FormRemoteFunc_teste},
  uVersion in '..\Utils\uVersion.pas',
  uLogs in '..\NexCafe\Guard\uLogs.pas',
  uRemoteFunc_dm in 'uRemoteFunc_dm.pas' {dmRemoteFunc: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormRemoteFunc_teste, FormRemoteFunc_teste);
  Application.Run;
end.
