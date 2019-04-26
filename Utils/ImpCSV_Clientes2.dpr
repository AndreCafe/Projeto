program ImpCSV_Clientes2;

uses
  Forms,
  uImpCSV_Clientes2 in 'uImpCSV_Clientes2.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
