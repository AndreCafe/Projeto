unit CaptureForm;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TForm1 = class(TForm)
    btnConnect: TButton;
    Timer1: TTimer;
    btnGrab: TButton;
    Memo1: TMemo;
    CaptureImage: TImage;
    PreviousImage: TImage;
    cbMotion: TCheckBox;
    btnCapture: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnGrabClick(Sender: TObject);
    procedure btnCaptureClick(Sender: TObject);
  private
    CaptureWnd: THandle;
  end;

var
  Form1: TForm1 = nil;

implementation
{$R *.dfm}
uses
  IniFiles, JPeg;

const
  CaptureLeft = 8;
  CaptureTop = 8;
  CaptureWidth = 2 * 320;
  CaptureHeight = 2 * 240;

{$J+}
const
  Quality: Integer = 75;

function capCreateCaptureWindowA(WindowName: PChar;
  dwStyle: Cardinal; x,y, nWidth,nHeight: Integer;
  ParentWin: HWnd; nID: Integer): HWnd; stdcall
  external 'AVICAP32.DLL';

const
  WM_CAP_DRIVER_CONNECT    = WM_USER + 10;
  WM_CAP_DRIVER_DISCONNECT = WM_USER + 11;
  WM_CAP_SAVEDIB           = WM_USER + 25;
  WM_CAP_GRAB_FRAME        = WM_USER + 60;

const
  BmpFilename = 'c:\Inetpub\wwwroot\webcam\'; // webcam.jpg';

const
  MaxDiff = 2121;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CaptureWnd := 0;
end;

procedure TForm1.btnConnectClick(Sender: TObject);
const
  str_Connect = 'Connect';
  str_Disconn = 'Disconnect';
begin
  Timer1.Enabled := False;
  if (Sender as TButton).Caption = str_Connect then
  begin
    CaptureWnd := capCreateCaptureWindowA('Dr.Bob''s webcam',
      WS_CHILD or WS_VISIBLE , CaptureLeft, CaptureTop,
      CaptureWidth, CaptureHeight, Handle, 0);
    if CaptureWnd <> 0 then
    begin
      btnGrab.Enabled := True;
      SendMessage(CaptureWnd, WM_CAP_DRIVER_CONNECT, 0, 0);
      SendMessage(CaptureWnd, WM_CAP_SAVEDIB, 0, Cardinal(PChar(BmpFileName + 'savedib.bmp')));
    end;
    (Sender as TButton).Caption := str_Disconn;
  end
  else
  begin
    if CaptureWnd <> 0 then
      SendMessage(CaptureWnd, WM_CAP_DRIVER_DISCONNECT, 0, 0);
    CaptureWnd := 0;
    (Sender as TButton).Caption := str_Connect;
    btnGrab.Enabled := False
  end
end;

procedure TForm1.btnCaptureClick(Sender: TObject);
begin
  if CaptureWnd <> 0 then
    SendMessage(CaptureWnd, WM_CAP_SAVEDIB, 0, Cardinal(PChar('savedib.bmp')))
end;

procedure TForm1.btnGrabClick(Sender: TObject);
type
  TRGB = record
           case Boolean of
             True: (RGBColor: Longint);
             False: (R,G,B: Byte)
           end;
var
  PanelDC: HDC;
  Stream: TFileStream;
  OldRGB,NewRGB: TRGB;
  diff,x,y: Integer;
  TimeStamp: Double;
  TimeStr: String;
  DateStr: String;
begin
  Timer1.Enabled := False;
  ShortDateFormat := 'yyyy-mm-dd';
  if CaptureWnd <> 0 then
  begin
    SendMessage(CaptureWnd, WM_CAP_GRAB_FRAME, 0, 0);
//  SendMessage(CaptureWnd, WM_CAP_SAVEDIB, 0, longint(PChar(BmpFileName)));
    DateStr := DateToStr(Now) + #32;
    TimeStr := TimeToStr(Now) + #32;
    if CaptureImage.Picture.Bitmap.Width <> CaptureWidth then // image doesn't exist, yet
      CaptureImage.Picture.Bitmap := TBitMap.Create;
    try
      CaptureImage.Picture.Bitmap.Width := CaptureWidth;
      CaptureImage.Picture.Bitmap.Height := CaptureHeight;
      PanelDC := GetDC(Handle);
      try
        BitBlt(CaptureImage.Picture.Bitmap.Canvas.Handle, 0, 0,
          CaptureWidth, CaptureHeight, PanelDC, CaptureLeft, CaptureTop, SRCCOPY);
        CaptureImage.Picture.Bitmap.Canvas.Font := Font;
        CaptureImage.Picture.Bitmap.Canvas.Brush.Style := bsClear;
//      CaptureImage.Picture.Bitmap.Canvas.Brush.Color := clSilver;
//      CaptureImage.Picture.Bitmap.Canvas.Font.Color := clWhite;
        CaptureImage.Picture.Bitmap.Canvas.Font.Color := clWhite;
        TextOut(CaptureImage.Picture.Bitmap.Canvas.Handle, 0, 0, PChar(DateStr), Length(DateStr));
        TextOut(CaptureImage.Picture.Bitmap.Canvas.Handle, 320 + 251, 0, PChar(TimeStr), Length(TimeStr));
        CaptureImage.Picture.Bitmap.Canvas.Font.Color := clBlack;
        TextOut(CaptureImage.Picture.Bitmap.Canvas.Handle, 2, 2, PChar(DateStr), Length(DateStr));
        TextOut(CaptureImage.Picture.Bitmap.Canvas.Handle, 320 + 253, 2, PChar(TimeStr), Length(TimeStr));
        CaptureImage.Picture.Bitmap.Canvas.Font.Color := Font.Color;
        TextOut(CaptureImage.Picture.Bitmap.Canvas.Handle, 1, 1, PChar(DateStr), Length(DateStr));
        TextOut(CaptureImage.Picture.Bitmap.Canvas.Handle, 320 + 252, 1, PChar(TimeStr), Length(TimeStr));
      finally
        ReleaseDC(Handle, PanelDC)
      end;

    { case CaptureImage.Picture.Bitmap.PixelFormat of
       pfDevice: Memo1.Lines.Add('pfDevice');
       pf1bit:   Memo1.Lines.Add('pf1bit');
       pf4bit:   Memo1.Lines.Add('pf4bit');
       pf8bit:   Memo1.Lines.Add('pf8bit');
       pf15bit:  Memo1.Lines.Add('pf15bit');
       pf16bit:  Memo1.Lines.Add('pf16bit');
       pf24bit:  Memo1.Lines.Add('pf24bit');
       pf32bit:  Memo1.Lines.Add('pf32bit');
       pfCustom: Memo1.Lines.Add('pfCustom');
      end; }
      Memo1.Lines.Clear;
      Memo1.Lines.Add(DateTimeToStr(Now));

      diff := 0;
      if not cbMotion.Checked then
      begin
        TimeStamp := Now;
        // Motion Detect between Bitmap and Image1.Picture
        for y:=0 to CaptureHeight-1 do
        begin
          for x:=0 to CaptureWidth-1 do
          begin
            NewRGB.RGBColor := ColorToRGB(CaptureImage.Picture.Bitmap.Canvas.Pixels[x,y]);
            OldRGB.RGBColor := ColorToRGB(PreviousImage.Picture.Bitmap.Canvas.Pixels[x,y]);
            if (abs(NewRGB.R - OldRGB.R) > $F) and
               (abs(NewRGB.G - OldRGB.G) > $F) and
               (abs(NewRGB.B - OldRGB.B) > $F) then Inc(diff);
          end
        end;
        Memo1.Lines.Add(Format('Difference: %d (in %.2n sec.)',[diff,(Now - TimeStamp) * 24 * 60 * 60]));
      end;

      with TIniFile.Create(ChangeFileExt(ParamStr(0),'.ini')) do
      try
        Timer1.Interval := ReadInteger('timer','interval',60000);
        Quality := ReadInteger('image','quality',75);
        if not cbMotion.Checked then
          if diff > ReadInteger('motion','maxdiff',maxdiff) then Timer1.Interval := 500;
        if Timer1.Interval <= 0 then Close // exit
      finally
        Free
      end;

      if cbMotion.Checked or (Timer1.Interval = 500) then // only save when movement detected !!
      with TJPEGImage.Create do
      try
        Assign(CaptureImage.Picture.Bitmap);
        CompressionQuality := Quality;
        try
          Stream := TFileStream.Create(BmpFileName + 'bitmap.jpg',fmCreate);
          try
            try
              SaveToStream(Stream)
            except
            end
          finally
            Stream.Free
          end;
          Memo1.Lines.Add('snapshot taken')
        except
          on E: Exception do
            Memo1.Lines.Add(E.Message)
        end
      finally
        Free // TJPEGImage
      end;
    finally
      PreviousImage.Picture.Assign(CaptureImage.Picture)
    end
  end;
  Timer1.Enabled := Timer1.Interval > 0
end;

{
procedure TForm1.btnMovieClick(Sender: TObject);
begin
  if (Sender as TButton).Caption = 'Movie' then
  begin
    if CaptureWnd <> 0 then
    begin
      NextFilename(AviFilename);
      SendMessage(CaptureWnd, WM_CAP_FILE_SET_CAPTURE_FILEA, 0, Longint(PChar(AviFileName)));
      SendMessage(CaptureWnd, WM_CAP_SEQUENCE, 0, 0)
    end;
    (Sender as TButton).Caption := 'End Movie';
  end
  else
  begin
    if CaptureWnd <> 0 then
      SendMessage(CaptureWnd, WM_CAP_STOP, 0, 0);
    (Sender as TButton).Caption := 'Movie'
  end
end;
}

initialization
end.
