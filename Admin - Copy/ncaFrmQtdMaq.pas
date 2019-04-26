unit ncaFrmQtdMaq;
{
    ResourceString: Dario 11/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, StdCtrls, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  LMDPNGImage, ExtCtrls;

type
  TFrmQtdMaq = class(TForm)
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
  FrmQtdMaq: TFrmQtdMaq;

implementation

// START resource string wizard section
resourcestring
  SVocêNãoInformouAQuantidadeDeMáqu = 'Você não informou a quantidade de máquinas.';

// END resource string wizard section


{$R *.dfm}

procedure TFrmQtdMaq.Button1Click(Sender: TObject);
begin
  if edQtd.Value=0 then
    Raise Exception.Create(SVocêNãoInformouAQuantidadeDeMáqu);
  ModalResult := mrOk;
end;

procedure TFrmQtdMaq.Button2Click(Sender: TObject);
begin
  Close;
end;

function TFrmQtdMaq.Editar: Integer;
begin
  ShowModal;
  if ModalResult=mrOk then
    Result := edQtd.Value else
    Result := 0;
end;

procedure TFrmQtdMaq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.

