program ImpCSV_produtos_APSO;

uses
  Forms,
  uImpCSV_Produtos_Apso in 'uImpCSV_Produtos_Apso.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
