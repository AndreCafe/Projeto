unit ucmaFrmCaptura;

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
    Label1: TLabel;
    btnFechar: TPngSpeedButton;
    btnCapturar: TPngSpeedButton;
    btnSalvar: TPngSpeedButton;
    SaveDlg: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCapturarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure TentaCapturar;
  public
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

uses ucmaDM;

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
  WindowState := wsMaximized;
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
  Capturou := False;
  Height := Panel1.Height + 27;
  Width  := 305;
  ScrollBox1.Visible := False;
  FStream := TMemoryStream.Create;
  J := TJpegImage.Create;
end;

procedure TFrmCapt.FormDestroy(Sender: TObject);
begin
  FStream.Free;
  J.Free;
end;

procedure TFrmCapt.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TFrmCapt.Timer1Timer(Sender: TObject);
begin
  if Timer1.Enabled then 
  try
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
  Capturou := False;
end;

procedure TFrmCapt.btnSalvarClick(Sender: TObject);
begin
  if SaveDlg.Execute then
    Image1.Picture.SaveToFile(SaveDlg.FileName);
end;

end.


                                                                                  
