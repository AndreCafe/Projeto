unit ncaFrmCaptura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, jpeg, StdCtrls, Buttons, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  PngSpeedButton;

type
  TFrmCapt = class(TForm)
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Timer1: TTimer;
    Panel1: TPanel;
    btnFechar: TPngSpeedButton;
    btnCapturar: TPngSpeedButton;
    btnSalvar: TPngSpeedButton;
    SaveDlg: TSaveDialog;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCapturarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    procedure TentaCapturar;
  public
    Contador : Integer;
    J        : TJpegImage;
    FStream  : TMemoryStream;
    FMaquina : Integer;
    Capturou : Boolean;
    procedure Capturar(aMaq: Integer);
    { Public declarations }
  end;

var
  FrmCapt: TFrmCapt;

implementation

uses ncaDM;

{$R *.DFM}

{ TFrmCapt }

procedure TFrmCapt.TentaCapturar;
begin
  Timer1.Enabled := False;
  FStream.Clear;
  if Capturou then Exit;
  if not Dados.CM.CapturaTela(FMaquina, FStream) then begin
    Timer1.Interval := 100;
    Timer1.Enabled := True;
    Exit;
  end;  
  Capturou := True;
  Image1.Visible := True;
  Label1.Visible := True;
  FStream.Position := 0;
  J.LoadFromStream(FStream);
  Image1.Picture.Assign(J);
  ScrollBox1.VertScrollBar.Range := Image1.Height;
  ScrollBox1.HorzScrollBar.Range := Image1.Width;
  ScrollBox1.Visible := True;
  Panel1.BevelOuter := bvRaised;
  BorderStyle := bsSizeable;
  Panel1.Color := clBtnFace;
  Color := clBtnFace;
  Label1.Visible := False;
//  WindowState := wsMaximized;
end;

procedure TFrmCapt.Capturar(aMaq: Integer);
begin
  FMaquina := aMaq;
  Caption := 'Máquina ' + IntToStr(aMaq);
  ShowModal;
end;

procedure TFrmCapt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCapt.FormCreate(Sender: TObject);
begin
  Contador := 0;
  Capturou := False;
  ScrollBox1.Visible := False;
  FStream := TMemoryStream.Create;
  J := TJpegImage.Create;
end;

procedure TFrmCapt.FormDestroy(Sender: TObject);
begin
  FStream.Free;
  J.Free;
end;

procedure TFrmCapt.FormResize(Sender: TObject);
begin
  Label1.Top := (Height - Label1.Height) div 2;
  Label1.Left := (Width - Label1.Width) div 2;
end;

procedure TFrmCapt.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
  WindowState := wsMaximized;
end;

procedure TFrmCapt.Timer1Timer(Sender: TObject);
begin
  if Timer1.Enabled then 
  try
    Inc(Contador);
    if (Contador mod 6) = 0  then
    if Label1.Font.Color = clBlue then
      Label1.Font.Color := clNavy else
      Label1.Font.Color := clBlue;
    TentaCapturar;
  except
    Close;
  end;    
end;

procedure TFrmCapt.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCapt.btnCapturarClick(Sender: TObject);
begin
  Timer1.Enabled := True;
  Image1.Visible := False;
  Label1.Visible := True;
  Capturou := False;
end;

procedure TFrmCapt.btnSalvarClick(Sender: TObject);
begin
  if SaveDlg.Execute then
    Image1.Picture.SaveToFile(SaveDlg.FileName);
end;

end.


                                                                                  
