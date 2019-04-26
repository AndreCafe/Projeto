program ImpTXT_RCMS;

uses
  Forms,
  uImpTXT_RCMS in 'uImpTXT_RCMS.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
