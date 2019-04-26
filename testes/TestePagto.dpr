program TestePagto;

uses
  Forms,
  uTestePagto in 'uTestePagto.pas' {Form6},
  ncaFrmPagEspecie in '..\Admin\ncaFrmPagEspecie.pas' {FrmPagEspecie},
  ncEspecie in '..\comp\ncEspecie.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TFrmPagEspecie, FrmPagEspecie);
  Application.Run;
end.
