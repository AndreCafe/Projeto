unit ncaFrameValor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrameValor = class(TFrame)
    panValor: TLMDSimplePanel;
    lbPrompt: TcxLabel;
    lbValor: TcxLabel;
  private
    { Private declarations }
  public
    procedure Init(aPrompt: String; aValor: Currency; aColor: TColor);
    { Public declarations }
  end;

implementation

uses ncClassesBase;

{$R *.dfm}

{ TFrame2 }

procedure TFrameValor.Init(aPrompt: String; aValor: Currency;
  aColor: TColor);
begin
  Name := 'FrameValor'+IntToStr(Integer(Self));
  panValor.Parent := TWinControl(Owner);
  lbPrompt.Caption := aPrompt;
  lbPrompt.Style.Color := aColor;
  lbValor.Caption := CurrencyToStr(aValor);
  lbValor.Style.Color := aColor;
  panValor.Top := (Owner.ComponentCount-1) * 40;
end;

end.
