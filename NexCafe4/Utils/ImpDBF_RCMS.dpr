program ImpDBF_RCMS;

uses
  Forms,
  uImpDBF_RCMS in 'uImpDBF_RCMS.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
