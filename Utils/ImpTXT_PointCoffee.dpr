program ImpTXT_PointCoffee;

uses
  Forms,
  uImpTXT_PointCoffee in 'uImpTXT_PointCoffee.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
