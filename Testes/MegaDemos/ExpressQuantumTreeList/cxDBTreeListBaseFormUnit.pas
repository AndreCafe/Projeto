unit cxDBTreeListBaseFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCustomTreeListBaseFormUnit, cxGraphics, cxCustomData, cxStyles,
  cxTL, cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  cxControls, cxInplaceContainer, cxTLData, cxDBTL, StdCtrls, ExtCtrls,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxGroupBox, cxLabel;

type
  TcxDBTreeListDemoUnitForm = class(TcxCustomTreeListDemoUnitForm)
    gbTreeListPlace: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    tlDB: TcxDBTreeList;
  private
  protected
    function GetTreeList: TcxCustomTreeList; override;
    function GetDBTreeList: TcxDBTreeList;
  public
    procedure ActivateDataSet; override;
    property DBTreeList: TcxDBTreeList read GetDBTreeList;
  end;

implementation

{$R *.dfm}

{ TcxDBTreeListDemoUnitForm }

procedure TcxDBTreeListDemoUnitForm.ActivateDataSet;
begin
  DBTreeList.DataController.DataSet.Open;
end;

function TcxDBTreeListDemoUnitForm.GetTreeList: TcxCustomTreeList;
begin
  Result := tlDB;
end;

function TcxDBTreeListDemoUnitForm.GetDBTreeList: TcxDBTreeList;
begin
  Result := tlDB;
end;

end.
