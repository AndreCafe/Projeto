unit cxTreeListCarsFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTreeListDataModule, cxDBTreeListBaseFormUnit, cxGraphics,
  cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  cxControls, cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit, cxCurrencyEdit,
  cxDropDownEdit, cxRadioGroup, cxSpinEdit, cxBlobEdit, cxHyperLinkEdit,
  cxCheckGroup, cxLookAndFeelPainters, StdCtrls, ExtCtrls, cxContainer, cxEdit,
  cxGroupBox, cxCheckBox;

type
  TfrmCars = class(TcxDBTreeListDemoUnitForm)
    clnModel: TcxDBTreeListColumn;
    clnPrice: TcxDBTreeListColumn;
    clnHP: TcxDBTreeListColumn;
    clnDisplacement: TcxDBTreeListColumn;
    clnCylinders: TcxDBTreeListColumn;
    clnSpeed: TcxDBTreeListColumn;
    clnAutomatic: TcxDBTreeListColumn;
    clnCity: TcxDBTreeListColumn;
    clnHighway: TcxDBTreeListColumn;
    clnDescription: TcxDBTreeListColumn;
    clnHyperlink: TcxDBTreeListColumn;
    clnPicture: TcxDBTreeListColumn;
    cxStyleRepository1: TcxStyleRepository;
    stNavy: TcxStyle;
    stMaroon: TcxStyle;
    procedure tlDBStylesGetContentStyle(Sender: TcxCustomTreeList;
      AColumn: TcxTreeListColumn; ANode: TcxTreeListNode; var AStyle: TcxStyle);
  private
    { Private declarations }
  public
    procedure FrameActivated; override;
  end;

implementation

{$R *.dfm}

{ TfrmCars }

procedure TfrmCars.FrameActivated;
begin
  inherited FrameActivated;
end;

procedure TfrmCars.tlDBStylesGetContentStyle(Sender: TcxCustomTreeList;
  AColumn: TcxTreeListColumn; ANode: TcxTreeListNode; var AStyle: TcxStyle);
begin
  if (ANode <> nil) and (ANode.Level < 2) then
  begin
    if ANode.Level = 0 then
       AStyle := stMaroon
    else
      if ANode.Level = 1 then
        AStyle := stNavy;
  end;
end;

end.
