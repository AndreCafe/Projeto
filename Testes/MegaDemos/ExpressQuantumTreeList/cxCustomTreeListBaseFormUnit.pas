unit cxCustomTreeListBaseFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTL, StdCtrls, ExtCtrls, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, cxGroupBox, cxLabel,
  cxTreeListFeaturesDemoStrConsts;

type
  TcxCustomTreeListDemoUnitForm = class(TForm)
    pnlDescription: TcxGroupBox;
    cxGroupBox6: TcxGroupBox;
    pnlHintInternal: TPanel;
    lblLeft2: TLabel;
    lblRight2: TLabel;
    lblTop2: TLabel;
    lblBottom2: TLabel;
    lblDescription: TLabel;
  private
    procedure CheckDescription;
  protected
    function GetDescription: string;
    function GetTreeList: TcxCustomTreeList; virtual;
  public
    class procedure Register;
    class function GetID: Integer; virtual;
    procedure ActivateDataSet; virtual; abstract;
    procedure DoInspectedObjectChanged; virtual;
    procedure FrameActivated; virtual;
    property TreeList: TcxCustomTreeList read GetTreeList;
  end;

  TcxCustomTreeListDemoUnitFormClass = class of TcxCustomTreeListDemoUnitForm;

implementation

{$R *.dfm}

uses
  cxTreeListDemoMainUnit;

{ TcxCustomTreeListDemoUnitForm }

class procedure TcxCustomTreeListDemoUnitForm.Register;
begin
  cxTreeListRegisterDemoUnit(Self);
end;

function TcxCustomTreeListDemoUnitForm.GetDescription: string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to High(DescriptionsInfo) do
    if DescriptionsInfo[I].ID = GetID then
    begin
      Result := DescriptionsInfo[I].Description;
      Break;
    end;
end;

class function TcxCustomTreeListDemoUnitForm.GetID: Integer;
begin
  Result := 0;
end;

procedure TcxCustomTreeListDemoUnitForm.CheckDescription;

  procedure UpdateDescriptionHeight;
  var
    ARect: TRect;
  begin
    if not pnlDescription.Visible or (lblDescription.Caption = '') then exit;
    ARect := lblDescription.BoundsRect;
    InflateRect(ARect, -3, 0);
    lblDescription.Canvas.Font.Assign(lblDescription.Font);
    DrawText(lblDescription.Canvas.Handle, PChar(lblDescription.Caption),
      Length(lblDescription.Caption), ARect, DT_CALCRECT or DT_WORDBREAK);
    InflateRect(ARect, 0, 2);
    pnlDescription.Height := ARect.Bottom - ARect.Top + pnlDescription.Height - lblDescription.Height;
  end;

begin
  if GetDescription <> '' then
  begin
    lblDescription.Caption := GetDescription;
    pnlDescription.Visible := True;
    UpdateDescriptionHeight;
  end
  else
    pnlDescription.Visible := False;
end;

procedure TcxCustomTreeListDemoUnitForm.DoInspectedObjectChanged;
begin
end;

procedure TcxCustomTreeListDemoUnitForm.FrameActivated;
begin
  CheckDescription;
end;

function TcxCustomTreeListDemoUnitForm.GetTreeList: TcxCustomTreeList;
begin
  Result := nil;
end;

end.
