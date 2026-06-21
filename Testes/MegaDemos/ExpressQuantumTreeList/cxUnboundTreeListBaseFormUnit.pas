unit cxUnboundTreeListBaseFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCustomTreeListBaseFormUnit, cxGraphics, cxCustomData, cxStyles,
  cxTL, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxControls, cxInplaceContainer,
  cxTLdxBarBuiltInMenu, StdCtrls, ExtCtrls, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxGroupBox, cxLabel;

type
  TcxUnboundTreeListDemoUnitForm = class(TcxCustomTreeListDemoUnitForm)
    gbTreeListPlace: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    tlUnbound: TcxTreeList;
  private
    function GetShowBands: Boolean;
    procedure SetShowBands(Value: Boolean);
    function GetUnboundTreeList: TcxTreeList;
  protected
    function GetTreeList: TcxCustomTreeList; override;
  public
    property ShowBands: Boolean read GetShowBands write SetShowBands;
    property UnboundTreeList: TcxTreeList read GetUnboundTreeList;
  end;

implementation

{$R *.dfm}

{ TcxCustomTreeListDemoUnitForm1 }

function TcxUnboundTreeListDemoUnitForm.GetShowBands: Boolean;
begin
  Result := TreeList.OptionsView.Bands;
end;

procedure TcxUnboundTreeListDemoUnitForm.SetShowBands(Value: Boolean);
begin
  TreeList.OptionsView.Bands := Value;
end;

function TcxUnboundTreeListDemoUnitForm.GetTreeList: TcxCustomTreeList;
begin
  Result := tlUnbound;
end;

function TcxUnboundTreeListDemoUnitForm.GetUnboundTreeList: TcxTreeList;
begin
  Result := tlUnbound;
end;

end.
