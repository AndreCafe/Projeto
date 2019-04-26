unit WebcamForm;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Webcam;

type
  TFrmWebcam = class(TForm)
    pnlWebcam: TPanel;
    btnConnect: TButton;
    btnDisconnect: TButton;
    btnGrabFrame: TButton;
    btnConfiguration: TButton;
    edtWebcamImageFileName: TEdit;
    btnSave: TButton;
    cbPreview: TCheckBox;
    Image1: TImage;
    btnCopy: TButton;
    Timer1: TTimer;
    OldImage: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure btnGrabFrameClick(Sender: TObject);
    procedure btnConfigurationClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure cbPreviewClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
  private
    { Private declarations }
    camera: TWebcam;
  public
    { Public declarations }
  end;

var
  FrmWebcam: TFrmWebcam;

implementation
uses
  JPEG;


{$R *.dfm}

procedure TFrmWebcam.btnConfigurationClick(Sender: TObject);
begin
  camera.Configure;
end;

procedure TFrmWebcam.btnConnectClick(Sender: TObject);
begin
  camera.Connect;
  Timer1.Enabled := True;
end;

procedure TFrmWebcam.btnCopyClick(Sender: TObject);
type
  TRGB = record
    case Boolean of
      True: (RGBColor: TColor);
      False: (R,G,B: Byte);
  end;
var
  PanelDC: HDC;
  FileName: String;
  Diff,x,y: Integer;
  CurrentRGB,OldRGB: TRGB;

begin
  Timer1.Enabled := False;

  OldImage.Picture.Bitmap := Image1.Picture.Bitmap;
  if not Assigned(Image1.Picture.Bitmap) then
    Image1.Picture.Bitmap := TBitmap.Create
  else
  begin
    Image1.Picture.Bitmap.Free;
    Image1.picture.Bitmap := TBitmap.Create;
  end;
  Image1.Picture.Bitmap.Height := pnlWebcam.Height;
  Image1.Picture.Bitmap.Width := pnlWebcam.Width;
  Image1.Stretch := True;

  PanelDC := GetDC(Handle);
  try
    BitBlt(Image1.Picture.Bitmap.Canvas.Handle,
      0,0,pnlWebcam.Width, pnlWebcam.Height, PanelDC, 0,0, SRCCOPY);
  finally
    ReleaseDC(Handle, PanelDC);
  end;

  Diff := 0;
  for x:=1 to pnlWebcam.Width do
  begin
    for y:=1 to pnlWebcam.Height do
    begin
      CurrentRGB.RGBColor :=
        Image1.Picture.Bitmap.Canvas.Pixels[x,y];
      OldRGB.RGBColor :=
        OldImage.Picture.Bitmap.Canvas.Pixels[x,y];
      if (abs(CurrentRGB.R - OldRGB.R) > $F) and
         (abs(CurrentRGB.B - OldRGB.B) > $F) and
         (abs(CurrentRGB.G - OldRGB.G) > $F) then Inc(Diff);
    end;
  end;

  if Diff > 600 then with TJpegImage.Create do
  try
    ShortDateFormat := 'YYYYmmDD';
    ShortTimeFormat := 'HHMMSS';
    Assign(Image1.Picture.Bitmap);
    FileName := DateTimeToStr(Now) + '.jpg';
    Caption := FileName + #32 + IntToStr(Diff);
    while Pos(':',FileName) > 0 do
      Delete(FileName,Pos(':',FileName),1);
    SaveToFile(FileName);
    if Timer1.Interval > 1000 then
      Timer1.Interval := Timer1.Interval div 2;
  finally
    Free;
  end
  else
    Timer1.Interval := 8000;

  Timer1.Enabled := True;
end;

procedure TFrmWebcam.btnDisconnectClick(Sender: TObject);
begin
  Timer1.Enabled := False;
  camera.Disconnect;
end;

procedure TFrmWebcam.btnGrabFrameClick(Sender: TObject);
begin
  camera.GrabFrame;
end;

procedure TFrmWebcam.btnSaveClick(Sender: TObject);
begin
  camera.SaveDIB(edtWebcamImageFileName.Text);
end;

procedure TFrmWebcam.cbPreviewClick(Sender: TObject);
begin
  if cbPreview.Checked then Camera.PreviewRate(4);
  Camera.Preview(cbPreview.Checked);
end;

procedure TFrmWebcam.FormCreate(Sender: TObject);
begin
  camera := TWebcam.Create('eBob42', pnlWebcam.Handle, 0, 0,
    pnlWebcam.Width, pnlWebcam.Height);
end;

end.
