program Ajusta_MovEst;

uses
  Forms,
  uAjustaMovEst in 'uAjustaMovEst.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
