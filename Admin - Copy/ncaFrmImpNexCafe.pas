unit ncaFrmImpNexCafe;
{
    ResourceString: Dario 11/03/13
    Nada pra fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, cxLabel, PngImage, ExtCtrls, StdCtrls, cxButtons,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel;

type
  TFrmImpNexCafe = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    cxButton1: TcxButton;
    imgImpressoraNex: TImage;
    LMDSimplePanel2: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    lbInfoImpNex: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImpNexCafe: TFrmImpNexCafe;

implementation

{$R *.dfm}

procedure TFrmImpNexCafe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
