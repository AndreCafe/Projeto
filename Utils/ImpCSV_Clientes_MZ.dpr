program ImpCSV_Clientes_MZ;

uses
  Forms,
  uImpCSV_Clientes_MZ in 'uImpCSV_Clientes_MZ.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
