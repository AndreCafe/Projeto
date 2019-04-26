unit ncaAlertaClonarProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaPanBaseAlertaTopo, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxLabel, LMDPNGImage, ExtCtrls,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel;

type
  TpanAlertaClonarProduto = class(TpanAlertaTopo)
    lbFechar: TcxLabel;
    cxLabel1: TcxLabel;
    procedure lbFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  panAlertaClonarProduto: TpanAlertaClonarProduto;

implementation

{$R *.dfm}

procedure TpanAlertaClonarProduto.lbFecharClick(Sender: TObject);
begin
  inherited;
  Fechar;
end;

end.
