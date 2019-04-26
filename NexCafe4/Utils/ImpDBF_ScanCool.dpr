program ImpDBF_ScanCool;

uses
  Forms,
  uImpDBF_ScanCool in 'uImpDBF_ScanCool.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
