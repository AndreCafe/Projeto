program TesteMoz;

uses
  Forms,
  uTesteMozPri in 'uTesteMozPri.pas' {Form24},
  ncShellStart in '..\Comp\ncShellStart.pas',
  uDMMoz in 'uDMMoz.pas' {dmMoz: TDataModule},
  VCLFixPack in '..\Comp\VCLFixPack.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmMoz, dmMoz);
  Application.CreateForm(TForm24, Form24);
  Application.Run;
end.
