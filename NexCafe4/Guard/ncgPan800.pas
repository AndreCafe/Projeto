unit ncgPan800;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxLabel, LMDPNGImage, PngImage,
  LMDSimplePanel, jpeg, ExtCtrls, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDCustomPanelFill, LMDPanelFill;

type
  TForm2 = class(TForm)
    panBar: TLMDPanelFill;
    Image2: TImage;
    panChat: TLMDSimplePanel;
    imChat: TImage;
    Image1: TImage;
    panTempo: TLMDSimplePanel;
    imTempo: TImage;
    cxLabel1: TcxLabel;
    panEncerrar: TLMDSimplePanel;
    Image5: TImage;
    lbEncerrar: TcxLabel;
    panNome: TLMDSimplePanel;
    Image9: TImage;
    lbNome: TcxLabel;
    panPontos: TLMDSimplePanel;
    imPontos: TImage;
    lbPontos: TcxLabel;
    cxLabel2: TcxLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

end.
