program ImpVS_Firebird;

uses
  Forms,
  uImpVS_Firebird in 'uImpVS_Firebird.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
