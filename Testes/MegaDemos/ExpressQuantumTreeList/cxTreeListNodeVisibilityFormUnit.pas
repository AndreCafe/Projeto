unit cxTreeListNodeVisibilityFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTreeListCarsFormUnit, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxMaskEdit, cxCurrencyEdit, cxDropDownEdit, cxSpinEdit, cxBlobEdit,
  cxHyperLinkEdit, cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  cxLookAndFeelPainters, cxCheckBox, StdCtrls, ExtCtrls, cxContainer, cxEdit,
  cxGroupBox, cxInplaceContainer, cxDBTL, cxControls, cxTLData;

type
  TfrmNodeVisibility = class(TfrmCars)
    cxGroupBox3: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    chkManual: TcxCheckBox;
    chkAutomatic: TcxCheckBox;
    procedure chkManualClick(Sender: TObject);
  private
    procedure SetNodesVisibility;
  public
    procedure FrameActivated; override;
    class function GetID: Integer; override;
  end;

implementation

{$R *.dfm}

uses
  cxTreeListFeaturesDemoStrConsts;

{ TfrmNodeVisibility }

procedure TfrmNodeVisibility.chkManualClick(Sender: TObject);
begin
  SetNodesVisibility;
end;

procedure TfrmNodeVisibility.FrameActivated;
begin
  inherited FrameActivated;
  SetNodesVisibility;
end;

class function TfrmNodeVisibility.GetID: Integer;
begin
  Result := 10;
end;

procedure TfrmNodeVisibility.SetNodesVisibility;

  procedure ShowParents;
  var
    I: Integer;
    ANode: TcxTreeListNode;
  begin
    for I := 0 to TreeList.AbsoluteCount  - 1 do
    begin
      ANode := TreeList.AbsoluteItems[I];
      if ANode.Level < 2 then
        ANode.Visible := True;
    end;
  end;

  procedure HideParents;
  var
    I: Integer;
    ANode: TcxTreeListNode;
  begin
    for I := 0 to TreeList.AbsoluteCount  - 1 do
    begin
      ANode := TreeList.AbsoluteItems[I];
      if ANode.Level < 2 then
        ANode.Visible := ANode.HasChildren;
      if ANode.Parent <> nil then
        ANode.Parent.Visible := ANode.Parent.HasChildren;
    end;
  end;

var
  I: Integer;
  ANode: TcxTreeListNode;
begin
  ShowParents;
  for I := 0 to TreeList.AbsoluteCount  - 1 do
  begin
    ANode := TreeList.AbsoluteItems[I];
    if ANode.Level < 2 then
      Continue;
    if clnAutomatic.Values[ANode] = True then
      ANode.Visible := chkAutomatic.Checked
    else
      ANode.Visible := chkManual.Checked;
  end;
  HideParents;
end;

initialization
  TfrmNodeVisibility.Register;

end.
