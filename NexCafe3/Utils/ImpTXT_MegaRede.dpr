program ImpTXT_MegaRede;

uses
  Forms,
  uImpTXT in 'uImpTXT.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
