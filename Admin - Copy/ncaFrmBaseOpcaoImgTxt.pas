unit ncaFrmBaseOpcaoImgTxt;
{
    ResourceString: Dario 09/03/13   Nada pra fazer
}


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaFrmBaseOpcao, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls, StdCtrls,
  cxButtons, LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel;

type
  TFrmBaseOpcaoImgTxt = class(TFrmBaseOpcao)
    panTopo: TLMDSimplePanel;
    img: TImage;
    lbDescr: TcxLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBaseOpcaoImgTxt: TFrmBaseOpcaoImgTxt;

implementation

{$R *.dfm}

end.
