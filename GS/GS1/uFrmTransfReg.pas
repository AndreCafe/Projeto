unit uFrmTransfReg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, PngBitBtn, pngimage, ExtCtrls, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel;

type
  TFrmTransfReg = class(TForm)
    cxLabel1: TcxLabel;
    edSenhaLj: TcxTextEdit;
    lbSenha: TcxLabel;
    Panel1: TPanel;
    Image1: TImage;
    cxLabel2: TcxLabel;
    PngBitBtn1: TPngBitBtn;
    PngBitBtn2: TPngBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTransfReg: TFrmTransfReg;

implementation

{$R *.dfm}

end.
