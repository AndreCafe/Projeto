program corrige_deb;

uses
  Forms,
  uCorrigeDeb in 'uCorrigeDeb.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
