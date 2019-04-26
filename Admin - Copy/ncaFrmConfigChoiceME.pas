unit ncaFrmConfigChoiceME;
{
    ResourceString: Dario 11/03/13
    Nada para para fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, cxLabel, LMDPNGImage, ExtCtrls, StdCtrls, cxButtons,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, cxTextEdit, cxCurrencyEdit, cxCheckBox, PngImage;

type
  TFrmConfigChoiceME = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    btnOk: TcxButton;
    Image1: TImage;
    cxLabel2: TcxLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    panelOpcao2: TLMDSimplePanel;
    LMDSimplePanel3: TLMDSimplePanel;
    cxLabel3: TcxLabel;
    cxLabel5: TcxLabel;
    LMDSimplePanel4: TLMDSimplePanel;
    cxLabel4: TcxLabel;
    cxLabel1: TcxLabel;
    panelOpcao1: TLMDSimplePanel;
    LMDSimplePanel6: TLMDSimplePanel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    LMDSimplePanel7: TLMDSimplePanel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxLabel6Click(Sender: TObject);
    procedure cxLabel3Click(Sender: TObject);
    
  private
    { Private declarations }
  end;

var
  FrmConfigChoiceME: TFrmConfigChoiceME;

implementation

uses ncClassesBase, ncaDM,
   ncaFrmConfigQuickCad,
   ncaFrmConfigCodProdutoDuplicado;

{$R *.dfm}

procedure TFrmConfigChoiceME.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfigChoiceME.cxLabel3Click(Sender: TObject);
begin
  TFrmConfigCodProdutoDuplicado.Create(Self).ShowModal;
end;

procedure TFrmConfigChoiceME.cxLabel6Click(Sender: TObject);
begin
  TFrmConfigQuickCad.Create(Self).ShowModal;
end;

procedure TFrmConfigChoiceME.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;
{
}
end.
