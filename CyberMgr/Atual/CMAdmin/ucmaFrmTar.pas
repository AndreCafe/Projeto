unit ucmaFrmTar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxGroupBox, cxRadioGroup, StdCtrls, cxButtons, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, cxPC, cxControls,
  cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems, ExtCtrls;

type
  TFrmBase1 = class(TFrmBase)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    LMDSimplePanel1: TLMDSimplePanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    dxBarSubItem1: TdxBarSubItem;
    cxTabSheet3: TcxTabSheet;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBase1: TFrmBase1;

implementation

{$R *.dfm}

end.
