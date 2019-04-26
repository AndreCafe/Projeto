program TesteExtImg;

uses
  Forms,
  uTesteExtImg in 'uTesteExtImg.pas' {Form20},
  ncPRExtractImgs in '..\PrintReview\ncPRExtractImgs.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm20, Form20);
  Application.Run;
end.
