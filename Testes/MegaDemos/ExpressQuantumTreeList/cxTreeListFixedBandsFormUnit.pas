unit cxTreeListFixedBandsFormUnit;

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
  cxGroupBox, cxInplaceContainer, cxDBTL, cxControls, cxTLData;

type
  TfrmFixedBands = class(TfrmIssueList)
  private
    procedure RemoveNestedBands;
    procedure SetFixedBands;
  protected
    function GetFirstLevelImageList: TCustomImageList; override;
  public
    procedure FrameActivated; override;
    class function GetID: Integer; override;
  end;

implementation

{$R *.dfm}

uses
  cxTreeListFeaturesDemoStrConsts;

{ TfrmFixedBands }

procedure TfrmFixedBands.FrameActivated;
begin
  inherited FrameActivated;
  RemoveNestedBands;
  SetFixedBands;
end;

function TfrmFixedBands.GetFirstLevelImageList: TCustomImageList;
begin
  Result := nil;
end;

class function TfrmFixedBands.GetID: Integer;
begin
  Result := 3;
end;

procedure TfrmFixedBands.RemoveNestedBands;
var
  I: Integer;
begin
  for I := 0 to TreeList.Bands.Count - 1 do
    TreeList.Bands[I].Position.BandIndex := -1;
  TreeList.Bands.Delete(0);
  TreeList.Bands.Delete(4);
end;

procedure TfrmFixedBands.SetFixedBands;
var
  I: Integer;
begin
  for I := 0 to 1 do
    TreeList.Bands[I].FixedKind := tlbfLeft;
  for I := 2 to 3 do
    TreeList.Bands[I].FixedKind := tlbfRight;
end;

initialization
  TfrmFixedBands.Register;

end.
