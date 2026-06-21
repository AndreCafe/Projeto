unit cxTreeListMenusFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTreeListCarsFormUnit, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxMaskEdit, cxCurrencyEdit, cxDropDownEdit, cxCheckBox, cxSpinEdit,
  cxBlobEdit, cxHyperLinkEdit, cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  cxLookAndFeelPainters, StdCtrls, ExtCtrls, cxContainer, cxEdit, cxGroupBox,
  cxInplaceContainer, cxDBTL, cxControls, cxTLData;

type
  TfrmMenus = class(TfrmCars)
    Timer: TTimer;
    cxGroupBox3: TcxGroupBox;
    gbMenus: TcxGroupBox;
    chkHeader: TcxCheckBox;
    chkGroupFooter: TcxCheckBox;
    chkFooter: TcxCheckBox;
    procedure chkHeaderClick(Sender: TObject);
    procedure chkGroupFooterClick(Sender: TObject);
    procedure chkFooterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  public
    procedure DoInspectedObjectChanged; override;
    class function GetID: Integer; override;
  end;

implementation

uses
  cxTreeListFeaturesDemoUtils, cxTreeListFeaturesDemoStrConsts;

{$R *.dfm}

{ TfrmMenus }

procedure TfrmMenus.chkFooterClick(Sender: TObject);
begin
  TreeList.PopupMenus.FooterMenu.UseBuiltInMenu := chkFooter.Checked;
end;

procedure TfrmMenus.chkGroupFooterClick(Sender: TObject);
begin
  TreeList.PopupMenus.GroupFooterMenu.UseBuiltInMenu := chkGroupFooter.Checked;
end;

procedure TfrmMenus.chkHeaderClick(Sender: TObject);
begin
  TreeList.PopupMenus.ColumnHeaderMenu.UseBuiltInMenu := chkHeader.Checked;
end;

procedure TfrmMenus.FormCreate(Sender: TObject);
begin
  chkHeader.Checked := True;
  chkGroupFooter.Checked := True;
  chkFooter.Checked := True;
end;

procedure TfrmMenus.DoInspectedObjectChanged;
begin
  chkFooter.Checked := TreeList.PopupMenus.FooterMenu.UseBuiltInMenu;
  chkGroupFooter.Checked := TreeList.PopupMenus.GroupFooterMenu.UseBuiltInMenu;
  chkHeader.Checked := TreeList.PopupMenus.ColumnHeaderMenu.UseBuiltInMenu;
end;

class function TfrmMenus.GetId: Integer;
begin
  Result := 12;
end;

procedure TfrmMenus.TimerTimer(Sender: TObject);
begin
  Timer.Enabled := False;
  SmoothMouseMove(TreeList, TreeList.Columns[0].Width + 8, 36);
end;

initialization
  TfrmMenus.Register;

end.
