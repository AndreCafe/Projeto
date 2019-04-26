unit ncaAlertaAutocad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaPanBaseAlertaTopo, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxLabel, LMDPNGImage, ExtCtrls,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel;

type
  TpanAlertaAutocad = class(TpanAlertaTopo)
    cxLabelAutoCadSaibaMais: TcxLabel;
    procedure cxLabelAutoCadSaibaMaisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  panAlertaAutocad: TpanAlertaAutocad;

implementation

uses ncaFrmConfigAutoCad;

{$R *.dfm}

procedure TpanAlertaAutocad.cxLabelAutoCadSaibaMaisClick(Sender: TObject);
begin
  inherited;
  TFrmConfigAutoCad.Create(Self).ShowModal;
end;

end.
