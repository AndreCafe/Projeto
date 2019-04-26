program TesteUpload;

uses
  Forms,
  utesteupload in 'utesteupload.pas' {Form7},
  ncKiteApi in '..\comp\ncKiteApi.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
