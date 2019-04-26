program ImpCSV_produtos_mercadinho_azul;

uses
  Forms,
  uImpCSV_Produtos_mercadinho_azul in 'uImpCSV_Produtos_mercadinho_azul.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
