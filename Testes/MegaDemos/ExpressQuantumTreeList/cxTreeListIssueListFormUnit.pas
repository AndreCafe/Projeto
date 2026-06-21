unit cxTreeListIssueListFormUnit;

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
  cxControls, cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit, cxCalendar,
  cxCheckBox, cxProgressBar, cxCalc, cxHyperLinkEdit, cxButtonEdit,
  cxImageComboBox, ImgList, cxCurrencyEdit, StdCtrls, ExtCtrls,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxGroupBox, cxLabel, Grids,
  DBGrids;

type
  TfrmIssueList = class(TcxDBTreeListDemoUnitForm)
    clnTaskName: TcxDBTreeListColumn;
    clnPriority: TcxDBTreeListColumn;
    clnStartDate: TcxDBTreeListColumn;
    clnEndDate: TcxDBTreeListColumn;
    clnDone: TcxDBTreeListColumn;
    clnComplete: TcxDBTreeListColumn;
    clnTotalCost: TcxDBTreeListColumn;
    clnTotalRevenues: TcxDBTreeListColumn;
    clnFirstName: TcxDBTreeListColumn;
    clnMiddleName: TcxDBTreeListColumn;
    clnLastName: TcxDBTreeListColumn;
    clnCountry: TcxDBTreeListColumn;
    clnPostalCode: TcxDBTreeListColumn;
    clnCity: TcxDBTreeListColumn;
    clnAddress: TcxDBTreeListColumn;
    clnPhone: TcxDBTreeListColumn;
    clnFax: TcxDBTreeListColumn;
    clnEMail: TcxDBTreeListColumn;
    clnHomepage: TcxDBTreeListColumn;
    ImageList: TImageList;
    clnImageIndex: TcxDBTreeListColumn;
    ilFirstLevel: TcxImageList;
    procedure clnEMailPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure tlDBGetLevelImages(Sender: TcxCustomTreeList; ALevel: Integer;
      var AImages, AStateImages: TCustomImageList);
    procedure tlDBGetNodeImageIndex(Sender: TcxCustomTreeList;
      ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType;
      var AIndex: TImageIndex);
  private
  protected
    function GetOverlayIndex(ANode: TcxTreeListNode): Integer; virtual;
    function GetOverlayStateIndex(ANode: TcxTreeListNode): Integer; virtual;
    function GetStateIndex(ANode: TcxTreeListNode): Integer; virtual;
    function GetFirstLevelImageList: TCustomImageList; virtual;
    function GetStateImageList: TCustomImageList; virtual;
  public
    //class function GetID: Integer; override;
    procedure FrameActivated; override;
  end;

implementation

{$R *.dfm}

uses
  ShellAPI, Math;

{ TfrmIssueList }

procedure TfrmIssueList.clnEMailPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar('mailto:' +
    VarToStr(TreeList.FocusedNode.Values[clnEmail.ItemIndex])),
    nil, nil, SW_SHOWMAXIMIZED);
end;

procedure TfrmIssueList.FrameActivated;
begin
  inherited FrameActivated;
  TreeList.StateImages := GetStateImageList;
end;

{class function TfrmIssueList.GetID: Integer;
begin
  Result := 53;
end;}

procedure TfrmIssueList.tlDBGetLevelImages(Sender: TcxCustomTreeList;
  ALevel: Integer; var AImages, AStateImages: TCustomImageList);
begin
  if ALevel = 0 then
    AImages := GetFirstLevelImageList;
end;

procedure TfrmIssueList.tlDBGetNodeImageIndex(Sender: TcxCustomTreeList;
  ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType;
  var AIndex: TImageIndex);
begin
  AIndex := -1;
  case AIndexType of
    tlitImageIndex, tlitSelectedIndex: AIndex := clnImageIndex.Values[ANode];
    tlitStateIndex: AIndex := GetStateIndex(ANode);
    tlitOverlayIndex: AIndex := GetOverlayIndex(ANode);
    tlitOverlayStateIndex: AIndex := GetOverlayStateIndex(ANode);
  end;
end;

function TfrmIssueList.GetOverlayIndex(ANode: TcxTreeListNode): Integer;
begin
  Result := -1;
end;

function TfrmIssueList.GetOverlayStateIndex(ANode: TcxTreeListNode): Integer;
begin
  Result := -1;
end;

function TfrmIssueList.GetStateIndex(ANode: TcxTreeListNode): Integer;
begin
  Result := -1;
end;

function TfrmIssueList.GetFirstLevelImageList: TCustomImageList;
begin
  Result := ilFirstLevel;
end;

function TfrmIssueList.GetStateImageList: TCustomImageList;
begin
  Result := nil;
end;

{initialization
  TfrmIssueList.Register;}

end.
