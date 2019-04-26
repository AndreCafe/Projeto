program ImpCSV_produtos_Lepetit;

uses
  Forms,
  uImpCSV_Produtos_LePetit in 'uImpCSV_Produtos_LePetit.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
