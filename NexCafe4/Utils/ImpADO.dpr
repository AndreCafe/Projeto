program ImpADO;

uses
  Forms,
  uImpADO in 'uImpADO.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
