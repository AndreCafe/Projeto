program ImpCSV_Clientes;

uses
  Forms,
  uImpCSV_Clientes in 'uImpCSV_Clientes.pas' {Form16},
  uProxCampo in '..\..\nex\Utils\uProxCampo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
