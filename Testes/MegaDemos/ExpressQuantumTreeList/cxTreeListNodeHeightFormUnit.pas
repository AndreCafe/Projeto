unit cxTreeListNodeHeightFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTreeListDepartmentsFormUnit, cxGraphics, cxCustomData, cxStyles,
  cxTL, cxTextEdit, cxCurrencyEdit, cxDropDownEdit, cxMaskEdit,
  cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  cxLookAndFeelPainters, cxSpinEdit, ImgList, StdCtrls, ExtCtrls, cxContainer,
  cxEdit, cxGroupBox, cxInplaceContainer, cxControls, cxLabel, Spin, cxTrackBar;

type
  TfrmNodeHeight = class(TfrmDepartments)
    Timer: TTimer;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    seHeight: TcxSpinEdit;
    seDefaultHeight: TcxSpinEdit;
    cxLabel2: TcxLabel;
    procedure TimerTimer(Sender: TObject);
    procedure cxSpinEdit1PropertiesChange(Sender: TObject);
    procedure seDefaultHeightPropertiesChange(Sender: TObject);
  private
    procedure LayoutSetup;
    procedure ReturnDefaultNodeHeight;
    procedure ReturnFirstNodeHeight;
    procedure SetDefaultNodeHeight;
    procedure SetNodeHeight;
  public
    procedure DoInspectedObjectChanged; override;
    procedure FrameActivated; override;
    class function GetID: Integer; override;
  end;

implementation

uses
  cxTreeListFeaturesDemoStrConsts;

{$R *.dfm}

procedure TfrmNodeHeight.cxSpinEdit1PropertiesChange(Sender: TObject);
begin
  SetNodeHeight;
end;

procedure TfrmNodeHeight.DoInspectedObjectChanged;
begin
  ReturnFirstNodeHeight;
  ReturnDefaultNodeHeight;
end;

procedure TfrmNodeHeight.FrameActivated;
begin
  inherited FrameActivated;
  LayoutSetup;
end;

class function TfrmNodeHeight.GetID: Integer;
begin
  Result := 9;
end;

procedure TfrmNodeHeight.LayoutSetup;
begin
  UnboundTreeList.OptionsCustomizing.NodeSizing := True;
  UnboundTreeList.OptionsView.Indicator := True;
  SetNodeHeight;
end;

procedure TfrmNodeHeight.ReturnDefaultNodeHeight;
begin
  seDefaultHeight.Value := UnboundTreeList.DefaultRowHeight;
end;

procedure TfrmNodeHeight.ReturnFirstNodeHeight;
begin
  if UnboundTreeList.Root.Count > 0 then
  begin
    if UnboundTreeList.Root.Items[0].Height = 0 then
      seHeight.Value := UnboundTreeList.DefaultRowHeight
    else
      seHeight.Value := UnboundTreeList.Root.Items[0].Height;
  end;
end;

procedure TfrmNodeHeight.seDefaultHeightPropertiesChange(Sender: TObject);
begin
  SetDefaultNodeHeight;
end;

procedure TfrmNodeHeight.SetDefaultNodeHeight;
begin
  UnboundTreeList.DefaultRowHeight := seDefaultHeight.Value;
end;

procedure TfrmNodeHeight.SetNodeHeight;
begin
  UnboundTreeList.Root.Items[0].Height := seHeight.Value;
end;

procedure TfrmNodeHeight.TimerTimer(Sender: TObject);
begin
  if not seHeight.Focused then
    ReturnFirstNodeHeight;
  if not seDefaultHeight.Focused then
    ReturnDefaultNodeHeight;
end;

initialization
  TfrmNodeHeight.Register;

end.
