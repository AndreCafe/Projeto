program prj_logoff;

uses
  Forms,
  uLogoff in 'uLogoff.pas' {Form35},
  JwsclTerminalServer in 'C:\Comp\jwscl\branches\0.9.3\source\JwsclTerminalServer.pas',
  JwaWtsApi32 in 'C:\Comp\jwa\branches\2.3\Win32API\JwaWtsApi32.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm35, Form35);
  Application.Run;
end.
