unit ncaFrmWebCam;
{
    ResourceString: Dario 11/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ShellAPI, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, 
  dxBar, cxPCdxBarPopupMenu, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxClasses,
  cxLabel, cxPC, cxStyles, jpeg, cxImage;

type
  TFrmWebCam = class(TForm)
    Timer1: TTimer;
    barMgr: TdxBarManager;
    barMgrBar1: TdxBar;
    cmSalvar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cmArq: TdxBarLargeButton;
    cmStop: TdxBarLargeButton;
    cmPlay: TdxBarLargeButton;
    cmApagar: TdxBarLargeButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    barSemWebCam: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarDockControl1: TdxBarDockControl;
    Image1: TcxImage;
    OpenDlg: TOpenDialog;
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmPlayClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmStopClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmCancelarClick(Sender: TObject);
    procedure cmSalvarClick(Sender: TObject);
    procedure cmArqClick(Sender: TObject);
  private
    FAlterou : Boolean;
    FArq     : String;
    FDrivers : TStrings;
    FHDelta,
    FWDelta  : Integer;
    procedure SetArq(const Value: String);
    procedure InitWebCam;
    procedure LoadArq;
    { Private declarations }

    property Arq: String
      read FArq write SetArq;

  public
    function ObtemFoto(S: String): String;
    { Public declarations }
  end;

var
  FrmWebCam: TFrmWebCam;

implementation

{$R *.dfm}

uses
  ncaWebcam, ncaFrmPri, ufmImagens;

function IsNumber(s: string): Boolean;
var 
  i: Integer;
begin
  Result := False;
  for i := 1 to Length(s) do
    case s[i] of
      '0'..'9':;
      else 
        Exit;
    end;
  Result := True;
end;  

procedure TFrmWebCam.cmApagarClick(Sender: TObject);
begin
  Arq := 'clear'; // do not localize
  LoadArq;
end;

procedure TFrmWebCam.cmArqClick(Sender: TObject);
begin
  if OpenDlg.Execute then begin
    Arq := OpenDlg.FileName;
    LoadArq;
    cmSalvar.Click;
  end else
    cmCancelar.Click;
end;

procedure TFrmWebCam.cmCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmWebCam.cmPlayClick(Sender: TObject);
begin
  if IsNumber(Copy(FDrivers[0], 1, 1)) then
  begin
    ConnectWebcam(StrToInt(Copy(FDrivers[0], 1, 1)));
    Timer1.Enabled := True;
    cmPlay.Enabled := False;
    cmStop.Enabled := True;
  end;
end;

procedure TFrmWebCam.cmSalvarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmWebCam.cmStopClick(Sender: TObject);
begin
  Timer1.Enabled := False;
  cmStop.Enabled := False;
  cmPlay.Enabled := True;
end;

procedure TFrmWebCam.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmWebCam.FormCreate(Sender: TObject);
begin
  FDrivers := nil;
  FHDelta := Height - Image1.Height;
  FWDelta := Width - Image1.Width;
end;

procedure TFrmWebCam.FormDestroy(Sender: TObject);
begin
  if Assigned(FDrivers) then FDrivers.Free;
  try CloseWebcam; except end;
end;

procedure TFrmWebCam.FormShow(Sender: TObject);
begin
  if Assigned(FDrivers) and (FDrivers.Count>0) then
    cmPlay.Click else
    cmArq.Click;
end;

procedure TFrmWebCam.InitWebCam;
begin
  WebcamInit;
  FDrivers := WebcamList;
  if FDrivers.Count>0 then begin
    cmPlay.Visible := ivAlways;
    cmStop.Visible := ivAlways;
    barSemWebCam.Visible := False;
  end else begin
    cmPlay.Visible := ivNever;
    cmStop.Visible := ivNever;
    Height := Height + 26;
    barSemWebCam.Visible := True;
  end;
end;

procedure TFrmWebCam.LoadArq;
begin
  if Sametext(FArq, 'clear') then begin // do not localize
    cmStop.Click;
    Image1.Visible := False;
    cmApagar.Enabled := False;
  end else 
  if Trim(FArq)>'' then begin
    Image1.Picture.LoadFromFile(FArq);
    cmApagar.Enabled := True;
    if not Image1.Visible then
      Image1.Visible := True;
  end else
    cmApagar.Enabled := False;
end;

function TFrmWebCam.ObtemFoto(S: String): String;
var B: TBitmap; J: TJpegImage;
begin
  FArq := '';
  InitWebCam;
  Arq := S;
  Result := '';
  if (FDrivers.Count=0) and (S>'') then 
    LoadArq;
  
  ShowModal;
  
  if ModalResult=mrOk then
  if FArq<>S then begin

    if SameText(ExtractFileExt(FArq), '.bmp') then begin // do not localize
      B := TBitmap.Create;
      J := TJpegImage.Create;
      try
        B.LoadFromFile(FArq);
        J.Assign(B);
        FArq := ChangeFileExt(FArq, '.jpg'); // do not localize
        J.SaveToFile(FArq);
      finally
        J.Free;
        B.Free;
      end;
    end;
  
    Result := FArq;
  end;
end;

procedure TFrmWebCam.SetArq(const Value: String);
begin
  if SameText(FArq, Value) then Exit;
  FArq := Value;
  cmSalvar.Enabled := True;
end;

procedure TFrmWebCam.Timer1Timer(Sender: TObject);
var s: String;
begin
  S := ExtractFilePath(ParamStr(0))+'webcam.bmp'; // do not localize
  CaptureWebcam(S);
  try
    LoadArq;
    Arq := S;
  except 
  end;
end;

end.

