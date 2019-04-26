program ImpTXT_ODIN;

uses
  Forms,
  uImpTXT_odin in 'uImpTXT_odin.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
