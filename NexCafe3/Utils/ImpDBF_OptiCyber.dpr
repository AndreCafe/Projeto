program ImpDBF_OptiCyber;

uses
  Forms,
  uImpDBF2 in 'uImpDBF2.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
