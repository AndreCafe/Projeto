unit cxTreeListDepartmentsFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxUnboundTreeListBaseFormUnit, cxGraphics, cxCustomData, cxStyles,
  cxTL, cxTextEdit, cxCurrencyEdit, cxDropDownEdit, cxMaskEdit,
  cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  cxInplaceContainer, cxControls, ImgList, cxLookAndFeelPainters, StdCtrls,
  ExtCtrls, cxContainer, cxEdit, cxGroupBox;

type
  TfrmDepartments = class(TcxUnboundTreeListDemoUnitForm)
    clnDepartment: TcxTreeListColumn;
    clnBudget: TcxTreeListColumn;
    clnLocation: TcxTreeListColumn;
    clnPhone1: TcxTreeListColumn;
    clnPhone2: TcxTreeListColumn;
    imgTreeList: TImageList;
    procedure tlUnboundGetNodeImageIndex(Sender: TcxCustomTreeList;
      ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType;
      var AIndex: TImageIndex);
  private
    procedure InitData;
  public
    procedure ActivateDataSet; override;
    //class function GetID: Integer; override;
    procedure FrameActivated; override;
  end;

implementation

{$R *.dfm}

{ TfrmDepartments }

procedure TfrmDepartments.ActivateDataSet;
begin
  InitData;
end;

procedure TfrmDepartments.FrameActivated;
begin
  inherited FrameActivated;
  TreeList.Root.Expand(True);
end;

{class function TfrmDepartments.GetID: Integer;
begin
  Result := 50;
end;}

procedure TfrmDepartments.InitData;

   function AddNode(AParent: TcxTreeListNode; const AValues: Array of Variant; AImageIndex: Integer): TcxTreeListNode;
   begin
     Result := TcxTreeList(TreeList).AddChild(AParent);
     Result.AssignValues(AValues);
     Result.Imageindex := AImageIndex;
   end;

var
  ARootNode, ASalesMarketingNode, AEngineeringNode, ANode: TcxTreeListNode;
begin
  ARootNode := AddNode(nil, ['Corporate Headquarters', 1000000, 'Monterey', '(408) 555-1234', '(408) 555-1234'], 8);
  ASalesMarketingNode := AddNode(ARootNode, ['Sales and Marketing', 22000, 'San Francisco', '(415) 555-1234', '(415) 555-1234'], 1);
  AddNode(ASalesMarketingNode, ['Field Office: Canada', 500000, 'Toronto', '(416) 677-1000', '(416) 555-1234'], 4);
  AddNode(ASalesMarketingNode, ['Field Office: East Coast', 500000, 'Boston', '(617) 555-1234', '(415) 555-1234'], 4);
  ANode := AddNode(ASalesMarketingNode, ['Field Office: East Coast', 600000, 'Kuaui', '(808) 555-1234', '(808) 555-1234'], 4);
  AddNode(ANode, ['Field Office: Singapore', 300000, 'Singapore', '355-1234', '355-1234'], 6);
  AddNode(ANode, ['Field Office: Japan', 500000, 'Tokyo', '5350-0901', '5350-0901'], 6);
  AddNode(ASalesMarketingNode, ['Marketing', 1500000, 'San Francisco', '(415) 555-1234', '(415) 555-1234'], 4);
  AddNode(ARootNode, ['Finance', 40000, 'Monterey', '(408) 555-1234', '(408) 555-1234'], 3);
  AEngineeringNode := AddNode(ARootNode, ['Engineering', 1100000, 'Monterey', '(408) 555-1234', '(408) 555-1234'], 2);
  ANode := AddNode(AEngineeringNode, ['Consumer Electronics Div.', 1150000, 'Burlington, VT', '(802) 555-1234', '(802) 555-1234'], 5);
  AddNode(ANode, ['Software Development', 400000, 'Monterey', '(408) 555-1234', '(408) 555-1234'], 6);
  ANode := AddNode(AEngineeringNode, ['Software Products Div.', 1200000, 'Monterey', '(408) 555-1234', '(408) 555-1234'], 5);
  AddNode(ANode, ['Quality Assurance', 88000, 'Monterey', '(408) 555-1234', '(408) 555-1234'], 6);
  AddNode(ANode, ['Customer Support', 120000, 'Monterey', '(408) 555-1234', '(408) 555-1234'], 6);
  AddNode(ANode, ['Research and Development', 460000, 'Burlington, VT', '(802) 555-1234', '(802) 555-1234'], 6);
  AddNode(ANode, ['Customer Services', 850000, 'Burlington, VT', '(802) 555-1234', '(802) 555-1234'], 6);
end;

procedure TfrmDepartments.tlUnboundGetNodeImageIndex(Sender: TcxCustomTreeList;
  ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType;
  var AIndex: TImageIndex);
begin
  if AIndexType = tlitSelectedIndex then
    AIndex := ANode.ImageIndex;
end;

{initialization
  TfrmDepartments.Register;}

end.
