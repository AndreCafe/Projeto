unit ncaFrameValor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, LMDGraph;

type
  TFrame1 = class(TFrame)
    panValores: TLMDSimplePanel;
    LMDSimplePanel3: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    LMDSimplePanel1: TLMDSimplePanel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    LMDSimplePanel4: TLMDSimplePanel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
  private
    { Private declarations }
  public
    procedure Clear;
    procedure Add(aPrompt: String; aValor: Currency);
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrame1 }

procedure TFrame1.Add(aPrompt: String; aValor: Currency);
var P: TLMDSimplePanel;
begin
  P := TLMDSimplePanel.Create(panValores);
  P.Height := 40;
  P.Margins.Left := 3;
  P.Margins.Right := 3;
  P.Bevel.BorderSides := [fsBottom];
  P.Bevel.Mode := bmEdge;
  P.Bevel.EdgeStyle := etEtched;
  P.Align := alTop;
  P.Top := (panValores.ComponentCount-1) * 40;
  P.Parent := panValores;
end;

procedure TFrame1.Clear;
begin
  while panValores.ComponentCount>0 do panValores.Components[0].Free;
end;

end.
