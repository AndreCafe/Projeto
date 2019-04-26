program ImpDBF_LanManager;

uses
  Forms,
  uImpDBF_LanManager in 'uImpDBF_LanManager.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
