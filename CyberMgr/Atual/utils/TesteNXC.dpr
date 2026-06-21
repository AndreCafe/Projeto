program TesteNXC;

uses
  Forms,
  uTesteNXC in 'uTesteNXC.pas' {Form12},
  nxcKBMCli in '..\Cliente\nxcKBMCli.pas' {dmKBMCli: TDataModule},
  nxcCliente in '..\Cliente\nxcCliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TdmKBMCli, dmKBMCli);
  Application.Run;
end.
