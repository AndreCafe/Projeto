unit uFrmCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxLabel, LMDPNGImage, ExtCtrls,
  cxTextEdit;

type
  TFrmCompra = class(TForm)
    Image1: TImage;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    lbProduto: TcxLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCompra: TFrmCompra;

implementation

{$R *.dfm}

end.
