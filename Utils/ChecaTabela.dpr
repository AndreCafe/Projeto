program ChecaTabela;

uses
  Forms,
  uChecaTabela in 'uChecaTabela.pas' {Form1},
  uFrmImp in 'uFrmImp.pas' {FrmImp};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
