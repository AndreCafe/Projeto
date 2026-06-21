unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Menus, cxLookAndFeelPainters, cxMaskEdit, cxSpinEdit, cxTimeEdit,
  StdCtrls, cxButtons, cxTextEdit, cxCurrencyEdit, cxLabel, cxControls,
  cxContainer, cxEdit, cxCheckBox, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrame2 = class(TFrame)
    LMDSimplePanel1: TLMDSimplePanel;
    cxCheckBox1: TcxCheckBox;
    cxLabel1: TcxLabel;
    cxCurrencyEdit1: TcxCurrencyEdit;
    cxButton1: TcxButton;
    cxCurrencyEdit2: TcxCurrencyEdit;
    cxTimeEdit1: TcxTimeEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
