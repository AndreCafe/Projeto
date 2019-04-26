unit ncaFrmConta;
{
    ResourceString: Dario 11/03/13
    Nada para para fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, LMDPNGImage, ExtCtrls, cxLabel, StdCtrls, cxButtons;

type
  TFrmInfConta = class(TForm)
    btnOkConta: TcxButton;
    cxLabel30: TcxLabel;
    btnInformarConta: TcxButton;
    cxLabel20: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    Image4: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInfConta: TFrmInfConta;

implementation

{$R *.dfm}

procedure TFrmInfConta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
