unit cxTreeListCheckGroupsFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxUnboundTreeListBaseFormUnit, cxGraphics, cxCustomData, cxStyles,
  cxTL, cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  cxLookAndFeelPainters, StdCtrls, ExtCtrls, cxContainer, cxEdit, cxGroupBox,
  cxControls, cxInplaceContainer, cxTextEdit, ImgList, cxEditRepositoryItems;

type
  TfrmCheckGroups = class(TcxUnboundTreeListDemoUnitForm)
    cxImageList1: TcxImageList;
    cxEditRepository1: TcxEditRepository;
    cxEditRepository1TextItem1: TcxEditRepositoryTextItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxTreeList1Column1: TcxTreeListColumn;
  public
    procedure ActivateDataSet; override;
    class function GetID: Integer; override;
  end;

implementation

uses
  cxTreeListFeaturesDemoStrConsts;

{$R *.dfm}

{ TfrmCheckGroups }

procedure TfrmCheckGroups.ActivateDataSet;
begin
end;

class function TfrmCheckGroups.GetID: Integer;
begin
  Result := 11;
end;

initialization
  TfrmCheckGroups.Register;
  
end.
