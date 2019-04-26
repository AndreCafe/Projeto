program ImpCSV_produtos2;

uses
  Forms,
  uImpCSV_Produtos2 in 'uImpCSV_Produtos2.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
