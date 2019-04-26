program WebcamExample;

uses
  Forms,
  ncaFrmWebCam in '..\Admin\ncaFrmWebCam.pas' {FrmWebCam},
  ncaWebcam in '..\Admin\ncaWebcam.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmWebCam, FrmWebCam);
  Application.Run;
end.
