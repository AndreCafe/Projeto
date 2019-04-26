unit ncaFrmCaptura;
{
    ResourceString: Dario 10/03/13
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, jpeg, StdCtrls, Buttons, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  cxControls, cxContainer, cxEdit, cxLabel, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons;

type
  TFrmCapt = class(TForm)
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Panel1: TPanel;
    btnFechar: TcxButton;
    btnCapturar: TcxButton;
    btnSalvar: TcxButton;
    SaveDlg: TSaveDialog;
    Label1: TcxLabel;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCapturarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    procedure OnSalvaTela(Sender: TObject; aMaq: Word; aJpg: TMemoryStream);
    
  public
    Contador : Integer;
    FMaquina : Integer;
    Capturou : Boolean;
    procedure Capturar(aMaq: Integer);
    { Public declarations }
  end;

var
  FrmCapt: TFrmCapt;

implementation

uses ncaDM;

// START resource string wizard section
resourcestring
  SMáquina = 'Máquina ';
  SCapturando = 'Capturando';

// END resource string wizard section


{$R *.DFM}

{ TFrmCapt }

procedure TFrmCapt.Capturar(aMaq: Integer);
begin
  FMaquina := aMaq;
  Caption := SMáquina + IntToStr(aMaq);
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
  Dados.ServRem.OnSalvaTela := OnSalvaTela;
end;

procedure TFrmCapt.FormDestroy(Sender: TObject);
begin
  Dados.ServRem.OnSalvaTela := nil;
end;

procedure TFrmCapt.FormResize(Sender: TObject);
begin
  Label1.Top := (Height - Label1.Height) div 2;
  Label1.Left := (Width - Label1.Width) div 2;
end;

procedure TFrmCapt.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
  btnCapturarClick(nil);
end;

procedure TFrmCapt.OnSalvaTela(Sender: TObject; aMaq: Word;
  aJpg: TMemoryStream);
var J: TJpegImage;
begin
  if FMaquina<>aMaq then Exit;
  Timer1.Enabled := False;
  J := TJpegImage.Create;
  try
    J.LoadFromStream(aJpg);
    Image1.Picture.Assign(J);
  finally
    J.Free;
  end;
  ScrollBox1.VertScrollBar.Range := Image1.Height;
  ScrollBox1.HorzScrollBar.Range := Image1.Width;
  ScrollBox1.Visible := True;
  Panel1.BevelOuter := bvRaised;
  BorderStyle := bsSizeable;
  Panel1.Color := clBtnFace;
  Color := clBtnFace;
  Label1.Visible := False;
end;

procedure TFrmCapt.Timer1Timer(Sender: TObject);
var I : Integer; S: String;
begin
  Inc(Contador);
  S := '';
  for I := 1 to Contador do S := S + '.';
  Label1.Caption := S + ' ' + SCapturando + ' ' + S;
  if Contador=6 then Contador := 0;
end;

procedure TFrmCapt.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCapt.btnCapturarClick(Sender: TObject);
begin
  Timer1.Enabled := True;
  Label1.Caption := SCapturando;
  Label1.Visible := True;
  Contador := 0;
  try
    Dados.CM.CapturaTela(FMaquina);
  except
    Close;
  end;
end;

procedure TFrmCapt.btnSalvarClick(Sender: TObject);
begin
  if SaveDlg.Execute then
    Image1.Picture.SaveToFile(SaveDlg.FileName);
end;

end.


                                                                                  
                                                                                  
