program NexLicGen;

uses
  Forms,
  uFrmPriNexLicGen in 'uFrmPriNexLicGen.pas' {Form8},
  uDMNexLicGen in 'uDMNexLicGen.pas' {dmKeyGen: TDataModule},
  ncClassesBase in '..\comp\ncClassesBase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TdmKeyGen, dmKeyGen);
  Application.Run;
end.
