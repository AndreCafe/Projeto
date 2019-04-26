unit ncgPan1024;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxLabel, LMDPNGImage,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel,
  PngImage, ExtCtrls, LMDSimplePanel, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDCustomPanelFill,
  LMDPanelFill, jpeg, OleCtrls, SHDocVw_EWB, EwbCore, EmbeddedWB;

type
  TForm1 = class(TForm)
    panBar: TLMDPanelFill;
    panChat: TLMDSimplePanel;
    imChat: TImage;
    Image1: TImage;
    panTempo: TLMDSimplePanel;
    imTempo: TImage;
    lbTempoValor: TcxLabel;
    panEncerrar: TLMDSimplePanel;
    imEncerrar: TImage;
    Image5: TImage;
    lbEncerrar: TcxLabel;
    panNome: TLMDSimplePanel;
    imNome: TImage;
    Image9: TImage;
    lbNome: TcxLabel;
    panPontos: TLMDSimplePanel;
    imPontos: TImage;
    lbPontos: TcxLabel;
    cxLabel2: TcxLabel;
    panConfig: TLMDSimplePanel;
    imConfig: TImage;
    Image4: TImage;
    lbConfig: TcxLabel;
    procedure panChatMouseEnter(Sender: TObject);
    procedure panChatMouseExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.panChatMouseEnter(Sender: TObject);
begin
  TLMDSimplePanel(Sender).Color := $009D7135;
end;

procedure TForm1.panChatMouseExit(Sender: TObject);
begin
  TLMDSimplePanel(Sender).Color := $0059401E;
end;

end.
