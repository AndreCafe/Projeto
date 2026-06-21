program CMKBMCli;

uses
  Forms,
  uFrmTesteKBMCli in 'uFrmTesteKBMCli.pas' {Form12},
  cmDMKBMCli in '..\Cliente\cmDMKBMCli.pas' {dmKBMCli: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TdmKBMCli, dmKBMCli);
  Application.Run;
end.
