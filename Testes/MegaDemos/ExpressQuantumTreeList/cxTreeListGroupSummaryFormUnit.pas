unit cxTreeListGroupSummaryFormUnit;

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
  cxInplaceContainer, cxControls, cxLookAndFeelPainters, StdCtrls, cxRadioGroup,
  cxContainer, cxEdit, cxGroupBox, ExtCtrls;

type
  TfrmGroupSummary = class(TfrmPlanets)
    Timer: TTimer;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    rbAlways: TcxRadioButton;
    rbVisibleWhenExpanded: TcxRadioButton;
    rbInvisible: TcxRadioButton;
    procedure rbAlwaysClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    procedure GroupSummarySetup;
  public
    procedure DoInspectedObjectChanged; override;
    procedure FrameActivated; override;
    class function GetID: Integer; override;
  end;

implementation

uses
  cxTreeListFeaturesDemoStrConsts;

{$R *.dfm}

{ TfrmGroupSummary }

procedure TfrmGroupSummary.DoInspectedObjectChanged;
begin
  case TreeList.OptionsView.GroupFooters of
    tlgfAlwaysVisible: rbAlways.Checked := True;
    tlgfVisibleWhenExpanded: rbVisibleWhenExpanded.Checked := True;
  else
    rbInvisible.Checked := True;
  end;
end;

procedure TfrmGroupSummary.FrameActivated;
begin
  inherited FrameActivated;
  GroupSummarySetup;
  TreeList.Root.Items[0].Expand(False);
end;

class function TfrmGroupSummary.GetID: Integer;
begin
  Result := 4;
end;

procedure TfrmGroupSummary.GroupSummarySetup;
begin
  rbAlways.Checked := True;
  clOrbitNumb.Summary.GroupFooterSummaryItems.Add.Kind := skCount;
  clDistance.Summary.GroupFooterSummaryItems.Add.Kind := skMax;
  clRadius.Summary.GroupFooterSummaryItems.Add.Kind := skAverage;
end;

procedure TfrmGroupSummary.rbAlwaysClick(Sender: TObject);
begin
  if rbAlways.Checked then
    TreeList.OptionsView.GroupFooters := tlgfAlwaysVisible
  else
    if rbVisibleWhenExpanded.Checked then
      TreeList.OptionsView.GroupFooters := tlgfVisibleWhenExpanded
    else
      TreeList.OptionsView.GroupFooters := tlgfInvisible;
end;

procedure TfrmGroupSummary.TimerTimer(Sender: TObject);
begin
  case TreeList.OptionsView.GroupFooters of
    tlgfAlwaysVisible: rbAlways.Checked := True;
    tlgfVisibleWhenExpanded: rbVisibleWhenExpanded.Checked := True;
  else
    rbInvisible.Checked := True;
  end;
end;

initialization
  TfrmGroupSummary.Register;

end.
