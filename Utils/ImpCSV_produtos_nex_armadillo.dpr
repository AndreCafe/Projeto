program ImpCSV_produtos_nex_armadillo;

uses
  Forms,
  uImpCSV_Produtos_NEX_armadillo in 'uImpCSV_Produtos_NEX_armadillo.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
