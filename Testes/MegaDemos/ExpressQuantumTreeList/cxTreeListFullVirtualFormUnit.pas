unit cxTreeListFullVirtualFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxVirtualTreeListBaseFormUnit, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxGraphics, cxCustomData, cxStyles, cxTL, cxSpinEdit,
  cxTextEdit, cxCalendar, cxTLdxBarBuiltInMenu, Menus,
  dxSkinsdxStatusBarPainter, dxStatusBar, StdCtrls, cxButtons, cxCheckBox,
  cxInplaceContainer, cxTLData, ExtCtrls, cxControls, cxContainer, cxEdit,
  cxGroupBox;

type
  TfrmFullVirtual = class(TcxVirtualTreeListDemoUnitForm)
    procedure cxVirtualTreeListGetChildCount(Sender: TcxCustomTreeList;
      AParentNode: TcxTreeListNode; var ACount: Integer);
    procedure cxVirtualTreeListGetNodeValue(Sender: TcxCustomTreeList;
      ANode: TcxTreeListNode; AColumn: TcxTreeListColumn; var AValue: Variant);
  private
  protected
    procedure SetSmartLoad(AValue: Boolean); override;
  public
    class function GetID: Integer; override;
  end;

implementation

{$R *.dfm}

{ TcxVirtualTreeListDemoUnitForm1 }

procedure TfrmFullVirtual.cxVirtualTreeListGetChildCount(
  Sender: TcxCustomTreeList; AParentNode: TcxTreeListNode; var ACount: Integer);
begin
  if AParentNode.Level < 5 then
    ACount := 10;
end;

procedure TfrmFullVirtual.cxVirtualTreeListGetNodeValue(
  Sender: TcxCustomTreeList; ANode: TcxTreeListNode; AColumn: TcxTreeListColumn;
  var AValue: Variant);
begin
  case AColumn.ItemIndex of
    0:
      AValue := ANode.VisibleIndex;
    1:
      AValue := 'Level:' + IntToStr(ANode.Level);
    2:
      AValue := Now + ANode.VisibleIndex * 0.001
  else
    AValue := Null
  end;
end;

class function TfrmFullVirtual.GetID: Integer;
begin
  Result := 13;
end;

procedure TfrmFullVirtual.SetSmartLoad(AValue: Boolean);
var
  ALoadingTime: Cardinal;
begin
  VirtualTreeList.OnGetChildCount := nil;
  VirtualTreeList.OptionsData.SmartLoad := AValue;
  VirtualTreeList.OnGetChildCount := cxVirtualTreeListGetChildCount;
  ALoadingTime := GetTickCount;
  VirtualTreeList.FullRefresh;
  ShowLoadingTime(GetTickCount - ALoadingTime);
end;

initialization
  TfrmFullVirtual.Register;

end.
