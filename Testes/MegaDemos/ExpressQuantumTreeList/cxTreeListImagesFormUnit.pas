unit cxTreeListImagesFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTreeListIssueListFormUnit, cxGraphics, cxCustomData, cxStyles,
  cxTL, cxMaskEdit, cxImageComboBox, cxCalendar, cxProgressBar, cxCurrencyEdit,
  cxButtonEdit, cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  cxLookAndFeelPainters, ImgList, StdCtrls, ExtCtrls, cxContainer, cxEdit,
  cxGroupBox, cxInplaceContainer, cxDBTL, cxControls, cxTLData, cxCheckBox,
  Grids, DBGrids;

type
  TfrmImages = class(TfrmIssueList)
    ilState: TcxImageList;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    chkDynamicState: TcxCheckBox;
    chkOverlay: TcxCheckBox;
    procedure chkDynamicStateClick(Sender: TObject);
    procedure chkOverlayClick(Sender: TObject);
  private
    function GetComplete(ANode: TcxTreeListNode): Integer;
  protected
    function GetOverlayIndex(ANode: TcxTreeListNode): Integer; override;
    function GetOverlayStateIndex(ANode: TcxTreeListNode): Integer; override;
    function GetStateIndex(ANode: TcxTreeListNode): Integer; override;
    function GetStateImageList: TCustomImageList; override;
    procedure LayoutSetup;
  public
    procedure DoInspectedObjectChanged; override;
    class function GetID: Integer; override;
    procedure FrameActivated; override;
  end;

implementation


{$R *.dfm}

uses
  Math, cxTreeListFeaturesDemoStrConsts;

procedure TfrmImages.DoInspectedObjectChanged;
begin
  chkDynamicState.Checked := TreeList.OptionsView.DynamicFocusedStateImages;
end;

class function TfrmImages.GetID: Integer;
begin
  Result := 8;
end;

procedure TfrmImages.chkDynamicStateClick(Sender: TObject);
begin
  TreeList.OptionsView.DynamicFocusedStateImages := chkDynamicState.Checked;
end;

procedure TfrmImages.chkOverlayClick(Sender: TObject);
begin
  TreeList.FullRefresh;
end;

procedure TfrmImages.FrameActivated;
begin
  inherited FrameActivated;
  LayoutSetup;
end;

function TfrmImages.GetComplete(ANode: TcxTreeListNode): Integer;
var
  Value: Variant;
begin
  Value := clnComplete.Values[ANode];
  if Value = NULL then
    Result := 0
  else
    Result := Value;
end;

function TfrmImages.GetOverlayIndex(ANode: TcxTreeListNode): Integer;
begin
  Result := IfThen(chkOverlay.Checked, IfThen(clnDone.Values[ANode], 7, -1), -1);
end;

function TfrmImages.GetOverlayStateIndex(ANode: TcxTreeListNode): Integer;
begin
  Result := IfThen(chkOverlay.Checked, 11 + clnPriority.Values[ANode], -1);
end;

function TfrmImages.GetStateIndex(ANode: TcxTreeListNode): Integer;
begin
  Result := Max(0, GetComplete(ANode) div 10);
end;

function TfrmImages.GetStateImageList: TCustomImageList;
begin
  Result := ilState;
end;

procedure TfrmImages.LayoutSetup;
begin
  TreeList.OptionsView.ColumnAutoWidth := True;
end;

initialization
  TfrmImages.Register;

end.
