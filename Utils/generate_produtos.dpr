program generate_produtos;

uses
  Forms,
  uGenerate_Produtos in 'uGenerate_Produtos.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
