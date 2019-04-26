unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, StdCtrls, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  LMDPNGImage, ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edQtd: TcxSpinEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    function Editar: Integer;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if edQtd.Value=0 then
    Raise Exception.Create('Você não informou a quantidade de máquinas.');
  ModalResult := mrOk;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Close;
end;

function TForm1.Editar: Integer;
begin
  ShowModal;
  if ModalResult=mrOk then
    Result := edQtd.Value else
    Result := 0;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
