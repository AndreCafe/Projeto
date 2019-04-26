program WebcamBob;
uses
  Forms,
  WebcamForm in 'WebcamForm.pas' {FrmWebcam},
  Webcam in 'Webcam.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmWebcam, FrmWebcam);
  Application.Run;
end.
