program GuardAR;

uses
  Forms,
  uNexAR in 'uNexAR.pas' {Form19},
  ncAcessoRemoto in 'ncAcessoRemoto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm19, Form19);
  Application.Run;
end.
