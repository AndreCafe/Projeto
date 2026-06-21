unit cxTreeListLevelImagesFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTreeListPlanetsFormUnit, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxTextEdit, cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  ImgList, cxInplaceContainer, cxControls, cxLookAndFeelPainters, cxCheckBox,
  cxContainer, cxEdit, cxGroupBox, StdCtrls, ExtCtrls;

type
  TfrmLevelImages = class(TfrmPlanets)
    LargeImages: TImageList;
    ilPlanets: TImageList;
    cxGroupBox3: TcxGroupBox;
    gbLargePictures: TcxGroupBox;
    chkFirstLevel: TcxCheckBox;
    chkSecondLevel: TcxCheckBox;
    chkThirdLevel: TcxCheckBox;
    procedure tlUnboundGetLevelImages(Sender: TcxCustomTreeList;
      ALevel: Integer; var AImages, AStateImages: TCustomImageList);
    procedure chkSecondLevelClick(Sender: TObject);
  private
    procedure RemoveBands;
  public
    procedure DoInspectedObjectChanged; override;
    procedure FrameActivated; override;
    class function GetID: Integer; override;
  end;

implementation

uses
  cxTreeListFeaturesDemoStrConsts;

{$R *.dfm}

procedure TfrmLevelImages.chkSecondLevelClick(Sender: TObject);
begin
  TreeList.FullRefresh;
end;

procedure TfrmLevelImages.DoInspectedObjectChanged;
begin

end;

procedure TfrmLevelImages.FrameActivated;
begin
  inherited FrameActivated;
  TreeList.BeginUpdate;
  try
    TreeList.OptionsView.ColumnAutoWidth := False;
    RemoveBands;
    chkSecondLevel.Checked := True;
    //chkTHirdLevel.Checked := True;
    TreeList.Root.Expand(True);
  finally
    TreeList.EndUpdate;
  end;
end;

class function TfrmLevelImages.GetID: Integer;
begin
  Result := 7;
end;

procedure TfrmLevelImages.RemoveBands;
var
  I: Integer;
begin
  for I := TreeList.ColumnCount - 1 downto 0 do
    TreeList.Columns[I].Position.BandIndex := 0;
  for I := TreeList.Bands.Count - 1 downto 1 do
    TreeList.Bands.Delete(I);
end;

procedure TfrmLevelImages.tlUnboundGetLevelImages(Sender: TcxCustomTreeList;
  ALevel: Integer; var AImages, AStateImages: TCustomImageList);
begin
  if (ALevel = 0) and chkFirstLevel.Checked or
    (ALevel = 1) and chkSecondLevel.Checked or
    (ALevel = 2) and chkThirdLevel.Checked then
    AImages := LargeImages
  else
    AImages := ilPlanets;
end;

initialization
  TfrmLevelImages.Register;

end.
