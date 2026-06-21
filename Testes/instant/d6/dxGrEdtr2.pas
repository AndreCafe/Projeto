unit dxGrEdtr2;

interface

{$I dxTLVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, ExtCtrls, dxTL, dxDBGrid, ComCtrls, Buttons, dxCntner, dxDBCtrl,
  dxGrWzrd, dcdsgnstuff;

type
  TForm1 = class(TForm)
    Panel4: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    PageControl: TPageControl;
    tsBands: TTabSheet;
    Panel12: TPanel;
    BAddBand: TButton;
    BDeleteBand: TButton;
    BUpBand: TButton;
    BDownBand: TButton;
    BRestoreDefault: TButton;
    Panel13: TPanel;
    Panel15: TPanel;
    Panel24: TPanel;
    LBands: TListBox;
    tsColumns: TTabSheet;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    pnButtons: TPanel;
    BAdd: TButton;
    BDelete: TButton;
    BUp: TButton;
    BDown: TButton;
    BWizard: TButton;
    BRestore: TButton;
    BChange: TButton;
    BRestoreWidths: TButton;
    CListBox: TListBox;
    tsSummaryGroups: TTabSheet;
    Panel9: TPanel;
    Panel10: TPanel;
    pnItems: TPanel;
    Panel11: TPanel;
    GroupBox2: TGroupBox;
    LItems: TListBox;
    Panel14: TPanel;
    Panel20: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    BAddItem: TButton;
    BDeleteItem: TButton;
    pnGroups: TPanel;
    Panel7: TPanel;
    Panel16: TPanel;
    GroupBox1: TGroupBox;
    LGroups: TListBox;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel21: TPanel;
    BAddGroup: TButton;
    BDeleteGroup: TButton;
    pmColumns: TPopupMenu;
    miAdd: TMenuItem;
    miDelete: TMenuItem;
    miChangetype: TMenuItem;
    miUp: TMenuItem;
    miDown: TMenuItem;
    miWizard: TMenuItem;
    miRestore: TMenuItem;
    miRestoreDefaultWidths: TMenuItem;
    miSelectAll: TMenuItem;
    pmGroups: TPopupMenu;
    miAddGroup: TMenuItem;
    miDeleteGroup: TMenuItem;
    N1: TMenuItem;
    miSellectGroup: TMenuItem;
    pmItems: TPopupMenu;
    miAddItem: TMenuItem;
    miDeleteItem: TMenuItem;
    MenuItem3: TMenuItem;
    miSelectItems: TMenuItem;
    pmBands: TPopupMenu;
    miAddBand: TMenuItem;
    miDeleteBand: TMenuItem;
    miUpBand: TMenuItem;
    miDownBand: TMenuItem;
    miRestoreBands: TMenuItem;
    miAllBands: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
