program ImpTXT2;

uses
  Forms,
  uImpTXT2 in 'uImpTXT2.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
