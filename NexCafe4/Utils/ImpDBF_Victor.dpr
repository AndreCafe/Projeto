program ImpDBF_Victor;

uses
  Forms,
  uImpDBF_Victor in 'uImpDBF_Victor.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
