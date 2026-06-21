program Registro;

uses
  Forms,
  uFrmRegistro in 'uFrmRegistro.pas' {FrmRegistro},
  uLicenca in 'uLicenca.pas',
  uScsi in 'uScsi.pas',
  uFrmTesteReg in 'uFrmTesteReg.pas' {FrmTeste};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmTeste, FrmTeste);
  Application.Run;
end.
