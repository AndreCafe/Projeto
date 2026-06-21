program RemoteFunc_Svc;

uses
  SvcMgr,
  SysUtils,
  uRemoteFunc_Svc in 'uRemoteFunc_Svc.pas' {RemoteFunc: TService},
  uVersion in '..\Utils\uVersion.pas',
  uLogs in '..\NexCafe\Guard\uLogs.pas',
  uRemoteFunc_dm in 'uRemoteFunc_dm.pas' {dmRemoteFunc: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'nexus REST Server';
  Application.CreateForm(TRemoteFunc, RemoteFunc);
  Application.Run;
end.
