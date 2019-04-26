program ImpCSV_estoque;

uses
  Forms,
  uImpCSV_Estoque in 'uImpCSV_Estoque.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
