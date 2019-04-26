unit ncaPanAlertaFid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaPanBaseAlertaTopo, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, LMDPNGImage, cxLabel,
  dxGDIPlusClasses, ExtCtrls, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel;

type
  TpanAlertaFid = class(TpanAlertaTopo)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  panAlertaFid: TpanAlertaFid;

implementation

{$R *.dfm}

end.
