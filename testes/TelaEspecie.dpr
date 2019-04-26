program TelaEspecie;

uses
  Forms,
  ncaFrmPagEspecie in '..\Admin\ncaFrmPagEspecie.pas' {FrmPagEspecie},
  Unit1 in 'Unit1.pas' {Frame1: TFrame},
  ncEspecie in '..\Comp\ncEspecie.pas',
  uTesteEspeciePri in 'uTesteEspeciePri.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
