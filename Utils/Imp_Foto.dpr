program Imp_Foto;

uses
  Forms,
  uImp_Foto in 'uImp_Foto.pas' {Form16},
  ncClassesBase in '..\Comp\ncClassesBase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
