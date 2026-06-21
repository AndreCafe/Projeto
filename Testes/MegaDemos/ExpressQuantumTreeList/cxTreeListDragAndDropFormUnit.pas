unit cxTreeListDragAndDropFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTreeListBiolifeFormUnit, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxMaskEdit, cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  cxLookAndFeelPainters, ImgList, StdCtrls, ExtCtrls, cxContainer, cxEdit,
  cxGroupBox, cxInplaceContainer, cxDBTL, cxControls, cxTLData, cxCheckBox;

type
  TfrmDragAndDrop = class(TfrmBiolife)
    procedure tlDBDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
  public
    procedure FrameActivated; override;
    class function GetID: Integer; override;
  end;

implementation

{$R *.dfm}

uses
  cxTreeListFeaturesDemoStrConsts;

procedure TfrmDragAndDrop.FrameActivated;
begin
  inherited FrameActivated;
  DBTreeList.DragMode := dmAutomatic;
  TreeList.OptionsBehavior.AutoDragCopy := True;
end;

class function TfrmDragAndDrop.GetID: Integer;
begin
  Result := 21;
end;


procedure TfrmDragAndDrop.tlDBDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  inherited;
  //
end;

initialization
  TfrmDragAndDrop.Register;

end.
