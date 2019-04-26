unit ncaFrmConfigRec_Serial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxLayoutcxEditAdapters, Menus, StdCtrls, cxButtons,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, cxSpinEdit, dxLayoutContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, dxLayoutControl;

type
  TFrmConfigRec_Serial = class(TForm)
    LCGroup_Root: TdxLayoutGroup;
    LC: TdxLayoutControl;
    LCItem1: TdxLayoutItem;
    cbCortaFolha: TcxComboBox;
    LCItem2: TdxLayoutItem;
    edRecSalto: TcxSpinEdit;
    LCItem3: TdxLayoutItem;
    edRecLargura: TcxSpinEdit;
    LCItem4: TdxLayoutItem;
    cbRecPorta: TcxComboBox;
    LMDSimplePanel1: TLMDSimplePanel;
    btnOk: TcxButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfigRec_Serial: TFrmConfigRec_Serial;

implementation

uses ncaFrmPri;

{$R *.dfm}

end.
