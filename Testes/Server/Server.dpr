program Server;

uses
  Forms,
  ServerFrm in 'ServerFrm.pas' {frmServer},
  CalcIntf in '..\CalcIntf.pas',
  CalcImpl in 'CalcImpl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmServer, frmServer);
  Application.Run;
end.
