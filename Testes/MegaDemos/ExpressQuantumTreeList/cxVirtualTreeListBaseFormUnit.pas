unit cxVirtualTreeListBaseFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCustomTreeListBaseFormUnit, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, ComCtrls, StdCtrls, ExtCtrls, cxControls, cxContainer,
  cxEdit, cxGroupBox, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxTLdxBarBuiltInMenu, cxInplaceContainer, cxTLData, cxCheckBox, Menus,
  dxSkinscxPCPainter, cxButtons, cxTextEdit, cxCalendar, cxSpinEdit,
  dxSkinsdxStatusBarPainter, dxStatusBar, cxLookAndFeels;

const
  WM_TREELISTEXPANDED = WM_USER + 1;

type
  TcxVirtualTreeListDemoUnitForm = class(TcxCustomTreeListDemoUnitForm)
    gbTreeListPlace: TcxGroupBox;
    cxVirtualTreeList: TcxVirtualTreeList;
    clnID: TcxTreeListColumn;
    clnName: TcxTreeListColumn;
    clnDate: TcxTreeListColumn;
    cxGroupBox4: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    chkSmartLoadMode: TcxCheckBox;
    btFullExpand: TcxButton;
    sbMain: TdxStatusBar;
    cxGroupBox2: TcxGroupBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure chkSmartLoadModeClick(Sender: TObject);
    procedure cxVirtualTreeListExpanding(Sender: TcxCustomTreeList;
      ANode: TcxTreeListNode; var Allow: Boolean);
    procedure WMTreeListExpanded(var AMessage: TMEssage); message WM_TREELISTEXPANDED;
    procedure btFullExpandClick(Sender: TObject);
  private
    FNodeCount: Integer;
    FStartExpanding: Boolean;
    FStartExpandingTick: Cardinal;
    function GetVirtualTreeList: TcxVirtualTreeList;
    procedure ShowPerformance(AExpanded: Boolean);
    function MsecToStr(AMsec: Integer): string;
  protected
    function GetTreeList: TcxCustomTreeList; override;
    function GetSmartLoad: Boolean;
    procedure SetSmartLoad(AValue: Boolean); virtual;
    procedure ShowLoadingTime(ALoadingTime: Integer);
  public
    property SmartLoad: Boolean read GetSmartLoad write SetSmartLoad;
    procedure ActivateDataSet; override;
    procedure DoInspectedObjectChanged; override;
    procedure FrameActivated; override;
    class function GetID: Integer; override;
    property VirtualTreeList: TcxVirtualTreeList read GetVirtualTreeList;
  end;

implementation

{$R *.dfm}

uses
  cxProviderModeDemoClasses, cxTreeListFeaturesDemoStrConsts;

procedure TcxVirtualTreeListDemoUnitForm.ActivateDataset;
{var
  ALoadingTime: Cardinal;}
begin
  SmartLoad := True;
{  sbMain.AutoHint := False;
  TreeList.OptionsData.SmartLoad := True;
  ALoadingTime := GetTickCount;
  RecreateDemoDataSource(TreeList);
  ShowLoadingTime(GetTickCount - ALoadingTime);}
//  chkSmartLoadMode.Checked := True;
end;

procedure TcxVirtualTreeListDemoUnitForm.DoInspectedObjectChanged;
begin
  chkSmartLoadMode.Checked := VirtualTreeList.OptionsData.SmartLoad;
end;

procedure TcxVirtualTreeListDemoUnitForm.FrameActivated;
begin
  inherited FrameActivated;
//  chkSmartLoadMode.Checked := True;
end;

class function TcxVirtualTreeListDemoUnitForm.GetID: Integer;
begin
  Result := 22;
end;

procedure TcxVirtualTreeListDemoUnitForm.btFullExpandClick(Sender: TObject);
begin
  TreeList.FullExpand;
end;

procedure TcxVirtualTreeListDemoUnitForm.chkSmartLoadModeClick(Sender: TObject);
begin
  SmartLoad := chkSmartLoadMode.Checked;
end;

procedure TcxVirtualTreeListDemoUnitForm.FormCreate(Sender: TObject);
{var
  ALoadingTime: Cardinal;}
begin
  chkSmartLoadMode.Checked := True;
  //sbMain.AutoHint := False;
  {VirtualTreeList.OptionsData.SmartLoad := True;
  ALoadingTime := GetTickCount;
  RecreateDemoDataSource(VirtualTreeList);
  ShowLoadingTime(GetTickCount - ALoadingTime);}
end;

procedure TcxVirtualTreeListDemoUnitForm.FormDestroy(Sender: TObject);
begin
  VirtualTreeList.DataController.CustomDataSource.Free;
  VirtualTreeList.DataController.CustomDataSource := nil;
end;

function TcxVirtualTreeListDemoUnitForm.GetTreeList: TcxCustomTreeList;
begin
  Result := cxVirtualTreeList;
end;

function TcxVirtualTreeListDemoUnitForm.GetSmartLoad: Boolean;
begin
  Result := VirtualTreeList.OptionsData.SmartLoad;
end;

procedure TcxVirtualTreeListDemoUnitForm.SetSmartLoad(AValue: Boolean);
var
  ALoadingTime: Cardinal;
begin
  VirtualTreeList.OptionsData.SmartLoad := AValue;
  ALoadingTime := GetTickCount;
  RecreateDemoDataSource(VirtualTreeList);
  ShowLoadingTime(GetTickCount - ALoadingTime);
end;

procedure TcxVirtualTreeListDemoUnitForm.ShowLoadingTime(ALoadingTime: Integer);
begin
  sbMain.Panels[1].Text := 'Loaded in ' + MsecToStr(ALoadingTime) + ' s';
  ShowPerformance(False);
end;

function TcxVirtualTreeListDemoUnitForm.GetVirtualTreeList: TcxVirtualTreeList;
begin
  Result := cxVirtualTreeList;
end;

procedure TcxVirtualTreeListDemoUnitForm.ShowPerformance(AExpanded: Boolean);
begin
  sbMain.Panels[0].Text := 'Total nodes: ' + IntToStr(TreeList.AbsoluteCount);
  if AExpanded then
  begin
    sbMain.Panels[2].Text := 'Expanded in ' + MsecToStr(FStartExpandingTick) + ' s';
    if SmartLoad then
      sbMain.Panels[2].Text := sbMain.Panels[2].Text + ', ' +
        IntToStr(TreeList.AbsoluteCount - FNodeCount) +
        ' nodes have been created'
  end
  else
    SbMain.Panels[2].Text := '';
end;

procedure TcxVirtualTreeListDemoUnitForm.cxVirtualTreeListExpanding(
  Sender: TcxCustomTreeList; ANode: TcxTreeListNode; var Allow: Boolean);
begin
  if not FStartExpanding then
  begin
    FStartExpanding := True;
    FNodeCount := TreeList.AbsoluteCount;
    FStartExpandingTick := GetTickCount;
    PostMessage(Handle, WM_TREELISTEXPANDED, 0, 0);
  end;
end;

procedure TcxVirtualTreeListDemoUnitForm.WMTreeListExpanded(
  var AMessage: TMEssage);
begin
  FStartExpanding := False;
  FStartExpandingTick := GetTickCount - FStartExpandingTick;
  ShowPerformance(True);
end;

function TcxVirtualTreeListDemoUnitForm.MsecToStr(AMsec: Integer): string;
begin
  Result := Format('%2.3f', [AMsec / 1000]);
end;

initialization
  TcxVirtualTreeListDemoUnitForm.Register;

end.

