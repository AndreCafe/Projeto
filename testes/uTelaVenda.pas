unit uTelaVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, LMDPNGImage, ExtCtrls, cxTextEdit, Menus,
  StdCtrls, cxButtons, cxPCdxBarPopupMenu, cxPC, dxGDIPlusClasses, ImgList,
  ncMyImage;

type
  TForm1 = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    LMDSimplePanel3: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    Image1: TImage;
    LMDSimplePanel5: TLMDSimplePanel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxLabel10: TcxLabel;
    Image4: TImage;
    cxLabel6: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel11: TcxLabel;
    LMDSimplePanel4: TLMDSimplePanel;
    Image2: TImage;
    cxTextEdit1: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxLabel7: TcxLabel;
    cxTextEdit2: TcxTextEdit;
    cxLabel8: TcxLabel;
    lbDigite: TcxLabel;
    cxLabel2: TcxLabel;
    panObs: TLMDSimplePanel;
    LMDSimplePanel6: TLMDSimplePanel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel12: TcxLabel;
    lbDesconto: TcxLabel;
    cxLabel14: TcxLabel;
    lbPagamento: TcxLabel;
    MyImage1: TMyImage;
    cxImageList1: TcxImageList;
    procedure LMDSimplePanel2DblClick(Sender: TObject);
    procedure cxLabel4Click(Sender: TObject);
    procedure cxLabel2Click(Sender: TObject);
    procedure cxTextEdit1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.cxLabel2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.cxLabel4Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.cxTextEdit1PropertiesChange(Sender: TObject);
begin
  cxTextEdit1.PostEditValue;
  lbDigite.Visible := (cxTextEdit1.Text='');
end;

procedure TForm1.LMDSimplePanel2DblClick(Sender: TObject);
begin
  Close;
end;

end.
