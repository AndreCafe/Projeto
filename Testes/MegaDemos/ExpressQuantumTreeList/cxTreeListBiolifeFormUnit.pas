unit cxTreeListBiolifeFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxDBTreeListBaseFormUnit, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  cxControls, cxInplaceContainer, cxTLData, cxDBTL, cxTreeListDataModule,
  cxMaskEdit, cxCheckBox, cxCalendar, cxMemo, cxImage, cxBlobEdit, ImgList,
  cxLookAndFeelPainters, StdCtrls, ExtCtrls, cxContainer, cxEdit, cxGroupBox;

type
  TfrmBiolife = class(TcxDBTreeListDemoUnitForm)
    clnCategory: TcxDBTreeListColumn;
    tlDBcxDBTreeListColumn2: TcxDBTreeListColumn;
    clnLength: TcxDBTreeListColumn;
    clnMark: TcxDBTreeListColumn;
    clnSpeciesName: TcxDBTreeListColumn;
    clnSpeciesNo: TcxDBTreeListColumn;
    ImageList: TImageList;
    procedure tlDBGetNodeImageIndex(Sender: TcxCustomTreeList;
      ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType;
      var AIndex: TImageIndex);
  private
    procedure SetupImages;
  public
    procedure FrameActivated; override;
  end;

implementation

{$R *.dfm}

uses
  Math;

{ TfrmBiolife }

procedure TfrmBiolife.FrameActivated;
begin
  inherited FrameActivated;
  SetupImages;
end;

procedure TfrmBiolife.SetupImages;
begin
  TreeList.OptionsView.DynamicFocusedStateImages := False;
  TreeList.Images := ImageList;
end;

procedure TfrmBiolife.tlDBGetNodeImageIndex(Sender: TcxCustomTreeList;
  ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType;
  var AIndex: TImageIndex);
begin
  AIndex := 0;
  if AIndexType = tlitImageIndex then
    AIndex := IfThen(ANode.Focused, 1, 0);
end;

end.
