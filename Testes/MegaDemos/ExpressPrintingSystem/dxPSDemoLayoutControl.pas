unit dxPSDemoLayoutControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls, cxLookAndFeels,
  cxBlobEdit, dxPSDemoCommon, cxLookAndFeelPainters, dxLayoutControl,
  dxLayoutLookAndFeels, cxContainer, cxEdit, dxLayoutcxEditAdapters,
  dxLayoutContainer, dxPSdxLCLnk, cxTextEdit, cxDBEdit, cxNavigator,
  cxDBNavigator, cxMemo, cxImage, cxMaskEdit, cxSpinEdit, cxHyperLinkEdit,
  cxCheckBox, DB, dxmdaset, ImgList, cxCurrencyEdit, cxCalc, cxDropDownEdit,
  cxTimeEdit, cxCalendar;

type

  { TfrLayoutControlFrame }

  TfrLayoutControlFrame = class(TdxPrintingSystemDemoFrame)
    dxLayoutLookAndFeelList: TdxLayoutLookAndFeelList;
    dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel;
    lcMain: TdxLayoutControl;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBTimeEdit1: TcxDBTimeEdit;
    cxDBComboBox1: TcxDBComboBox;
    cxDBCalcEdit1: TcxDBCalcEdit;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBMaskEdit1: TcxDBMaskEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBMaskEdit2: TcxDBMaskEdit;
    cxDBMaskEdit3: TcxDBMaskEdit;
    cxDBHyperLinkEdit1: TcxDBHyperLinkEdit;
    cxDBTextEdit12: TcxDBTextEdit;
    cxDBTextEdit11: TcxDBTextEdit;
    cxDBHyperLinkEdit2: TcxDBHyperLinkEdit;
    cxDBCurrencyEdit2: TcxDBCurrencyEdit;
    cxDBSpinEdit1: TcxDBSpinEdit;
    cxDBSpinEdit2: TcxDBSpinEdit;
    cxDBSpinEdit3: TcxDBSpinEdit;
    cxDBSpinEdit4: TcxDBSpinEdit;
    cxDBSpinEdit5: TcxDBSpinEdit;
    cxDBSpinEdit6: TcxDBSpinEdit;
    cxDBCheckBox2: TcxDBCheckBox;
    cxDBImage1: TcxDBImage;
    cxDBMemo1: TcxDBMemo;
    cxDBNavigator1: TcxDBNavigator;
    lcMainGroup_Root1: TdxLayoutGroup;
    lcMainGroup2: TdxLayoutGroup;
    lcMainGroup7: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    lcMainItem2: TdxLayoutItem;
    lcMainGroup8: TdxLayoutGroup;
    lcMainItem3: TdxLayoutItem;
    lcMainItem4: TdxLayoutItem;
    lcMainItem24: TdxLayoutItem;
    lcMainItem5: TdxLayoutItem;
    dxLayoutGroup2: TdxLayoutGroup;
    lcMainGroup18: TdxLayoutGroup;
    lcMainGroup17: TdxLayoutGroup;
    lcMainItem8: TdxLayoutItem;
    lcMainItem6: TdxLayoutItem;
    lcMainItem7: TdxLayoutItem;
    lcMainSeparatorItem2: TdxLayoutSeparatorItem;
    lcMainItem9: TdxLayoutItem;
    dxLayoutSplitterItem1: TdxLayoutSplitterItem;
    lcMainGroup10: TdxLayoutGroup;
    lcMainItem14: TdxLayoutItem;
    lcMainItem15: TdxLayoutItem;
    lcMainItem16: TdxLayoutItem;
    lcMainSplitterItem2: TdxLayoutSplitterItem;
    lcMainGroup16: TdxLayoutGroup;
    lcMainItem12: TdxLayoutItem;
    lcMainItem10: TdxLayoutItem;
    lcMainItem13: TdxLayoutItem;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    lcMainItem17: TdxLayoutItem;
    lcMainGroup13: TdxLayoutGroup;
    lcMainItem18: TdxLayoutItem;
    lcMainItem19: TdxLayoutItem;
    lcMainItem20: TdxLayoutItem;
    lcMainGroup3: TdxLayoutGroup;
    lcMainGroup4: TdxLayoutGroup;
    lcMainItem21: TdxLayoutItem;
    lcMainItem22: TdxLayoutItem;
    lcMainItem23: TdxLayoutItem;
    lcMainGroup5: TdxLayoutGroup;
    lcMainGroup14: TdxLayoutGroup;
    lcMainItem25: TdxLayoutItem;
    lcMainItem26: TdxLayoutItem;
    lcMainItem27: TdxLayoutItem;
    lcMainGroup15: TdxLayoutGroup;
    lcMainItem31: TdxLayoutItem;
    lcMainItem30: TdxLayoutItem;
    lcMainGroup6: TdxLayoutGroup;
    lcMainItem32: TdxLayoutItem;
    lcMainItem33: TdxLayoutItem;
    lcMainItem34: TdxLayoutItem;
    lcMainItem11: TdxLayoutItem;
    lcMainItem28: TdxLayoutItem;
    lcMainItem29: TdxLayoutItem;
    cxImageList1: TcxImageList;
  protected
    function GetReportLinkComponent: TComponent; override;
  end;

implementation

uses
  dxPSDemoData;

{$R *.dfm}

type
  { TdxPSLayoutControlFrameInfo }

  TdxPSLayoutControlFrameInfo = class(TdxPrintingSystemDemoFrameInfo)
  protected
    function GetFrameClass: TdxPrintingSystemDemoFrameClass; override;
    function GetImageIndex: Integer; override;
  public
    constructor Create;
  end;

{ TdxPSLayoutControlFrameInfo }

constructor TdxPSLayoutControlFrameInfo.Create;
begin
  inherited Create;
  Caption := 'LayoutControl';
end;

function TdxPSLayoutControlFrameInfo.GetFrameClass: TdxPrintingSystemDemoFrameClass;
begin
  Result := TfrLayoutControlFrame;
end;

function TdxPSLayoutControlFrameInfo.GetImageIndex: Integer;
begin
  Result := 17;
end;

{ TfrLayoutControlFrame }

function TfrLayoutControlFrame.GetReportLinkComponent: TComponent;
begin
  Result := lcMain;
end;

initialization
  PrintingSystemDemoFrames.Register(TdxPSLayoutControlFrameInfo.Create);

end.
