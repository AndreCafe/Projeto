program Imp_Geto;

uses
  Forms,
  uImp_Geto in 'uImp_Geto.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
