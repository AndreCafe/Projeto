program imp_dario;

uses
  Forms,
  uImp_Dario1 in 'uImp_Dario1.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
