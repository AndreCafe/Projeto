unit ncaPanBaseAlertaTopo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel, LMDPNGImage, ExtCtrls, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel;

type
  TpanAlertaTopo = class(TFrame)
    panPri: TLMDSimplePanel;
    Img: TImage;
    lbMensagem: TcxLabel;
    LMDSimplePanel1: TLMDSimplePanel;
    Image3: TImage;
  private
    { Private declarations }
  public
    { Public declarations }

    procedure Mostrar(aParent: TWincontrol);
    procedure Fechar;
  end;

implementation

{$R *.dfm}

{ TpanAlertaTopo }

procedure TpanAlertaTopo.Fechar;
begin
  panPri.Parent := Self;
  Free;
end;

procedure TpanAlertaTopo.Mostrar(aParent: TWincontrol);
begin
  panPri.Parent := aParent;
  panPri.Top := 0;
end;

end.
