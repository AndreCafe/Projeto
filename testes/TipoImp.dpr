program TipoImp;

uses
  Forms,
  ncImgImp in '..\Comp\ncImgImp.pas' {dmImgImp: TDataModule},
  ncgPrintTipo in '..\Guard\ncgPrintTipo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmImgImp, dmImgImp);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
