program ImpTXT_Lanma;

uses
  Forms,
  uImpTXT_Lanma in 'uImpTXT_Lanma.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
