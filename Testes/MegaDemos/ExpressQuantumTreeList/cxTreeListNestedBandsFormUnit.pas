unit cxTreeListNestedBandsFormUnit;

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
  StdCtrls, ExtCtrls, ImgList, cxInplaceContainer, cxDBTL, cxControls, cxTLData,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxGroupBox, cxLabel, Grids,
  DBGrids;

type
  TfrmNestedBands = class(TfrmIssueList)
  private
  public
    procedure FrameActivated; override;
    class function GetID: Integer; override;
  end;

implementation

{$R *.dfm}

uses
  cxTreeListFeaturesDemoStrConsts;

{ TfrmNestedBands }

procedure TfrmNestedBands.FrameActivated;
begin
  inherited FrameActivated;
end;

class function TfrmNestedBands.GetID: Integer;
begin
  Result := 0;
end;

initialization
  TfrmNestedBands.Register;

end.
