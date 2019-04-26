program ImpDBF_SmartLaunch;

uses
  Forms,
  uImpDBF_SmartLaunch in 'uImpDBF_SmartLaunch.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
