unit cxTreeListQuickVisibilityCustomization;

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
  cxInplaceContainer, cxControls, cxLookAndFeelPainters, StdCtrls, ExtCtrls,
  cxContainer, cxEdit, cxGroupBox;

type
  TfrmQuickVisibilityCustomization = class(TfrmPlanets)
    Timer: TTimer;
    procedure TimerTimer(Sender: TObject);
  private
    procedure CustomizationSetup;
  public
    procedure FrameActivated; override;
    class function GetID: Integer; override;
  end;

implementation

uses
  cxTreeListFeaturesDemoUtils, cxTreeListFeaturesDemoStrConsts;

{$R *.dfm}

{ TfrmQuickVisibilityCustomization }

procedure TfrmQuickVisibilityCustomization.FrameActivated;
begin
  inherited FrameActivated;
  ShowBands := True;
  CustomizationSetup;
end;

class function TfrmQuickVisibilityCustomization.GetID: Integer;
begin
  Result := 2;
end;

procedure TfrmQuickVisibilityCustomization.TimerTimer(Sender: TObject);
begin
  Timer.Enabled := False;
  SmoothMouseMove(TreeList, 4, 4);
end;

procedure TfrmQuickVisibilityCustomization.CustomizationSetup;
begin
  TreeList.OptionsCustomizing.BandsQuickCustomization := True;
  TreeList.OptionsCustomizing.ColumnsQuickCustomization := True;
end;

initialization
  TfrmQuickVisibilityCustomization.Register;

end.
