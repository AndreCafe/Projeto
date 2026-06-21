unit cxTreeListSearchFormUnit;

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
  cxLookAndFeelPainters, StdCtrls, ExtCtrls, cxContainer, cxEdit, cxGroupBox,
  cxInplaceContainer, cxControls, cxMaskEdit, cxDropDownEdit, cxCheckBox,
  cxLabel, Menus, cxButtons;

type
  TfrmSearch = class(TfrmPlanets)
    cxGroupBox3: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    chkExpandedOnly: TcxCheckBox;
    cxLabel2: TcxLabel;
    cbMode: TcxComboBox;
    edtText: TcxTextEdit;
    chkCaseSensitive: TcxCheckBox;
    btnFind: TcxButton;
    chkStartFromCurrent: TcxCheckBox;
    chkForward: TcxCheckBox;
    cxLabel3: TcxLabel;
    cbPreset: TcxComboBox;
    chkIgnoreStart: TcxCheckBox;
    procedure btnFindClick(Sender: TObject);
    procedure edtTextKeyPress(Sender: TObject; var Key: Char);
    procedure cbPresetPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure FindNode;
    procedure SetupControls(AText: string; AMode: TcxTreeListFindMode;
      ExpandedOnly, CaseSensitive, StartFromCurrentNode, ForwardDirection,
      IgnoreStartNode: Boolean; AStartNode: TcxTreeListNode = nil);
  public
    class function GetID: Integer; override;
  end;

implementation

uses
  cxTreeListFeaturesDemoStrConsts;

{$R *.dfm}

procedure TfrmSearch.btnFindClick(Sender: TObject);
begin
  FindNode;
end;

procedure TfrmSearch.cbPresetPropertiesChange(Sender: TObject);
begin
  case cbPreset.ItemIndex of
    0: SetupControls(cbPreset.Text, tlfmNormal, False, False, False, True, False);
    1: SetupControls(cbPreset.Text, tlfmLike, False, False, True, True, True);
    2: SetupControls(cbPreset.Text, tlfmExact, False, True, True, False, False,
         TreeList.Root.Items[0].Items[8]);
  end;
end;

procedure TfrmSearch.edtTextKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    FindNode;
end;

procedure TfrmSearch.FindNode;
var
  ACurrentNode, ANode, AParent: TcxTreeListNode;
begin
  ACurrentNode := nil;
  if chkStartFromCurrent.Checked then
    ACurrentNode := TreeList.FocusedNode;
  ANode := TreeList.FindNodeByText(edtText.Text, clName, ACurrentNode,
    chkExpandedOnly.Checked, chkForward.Checked, chkCaseSensitive.Checked,
    TcxTreeListFindMode(cbMode.ItemIndex), nil, chkIgnoreStart.Checked);
  if ANode <> nil then
  begin
    if not ANode.IsVisible then
    begin
      AParent := ANode.Parent;
      while AParent <> nil do
      begin
        AParent.Expand(False);
        AParent := AParent.Parent;
      end;
    end;
    TreeList.FocusedNode := ANode;
  end;
end;

procedure TfrmSearch.FormCreate(Sender: TObject);
begin
  cbPreset.ItemIndex := 0;
end;

procedure TfrmSearch.SetupControls(AText: string; AMode: TcxTreeListFindMode;
  ExpandedOnly, CaseSensitive, StartFromCurrentNode, ForwardDirection,
  IgnoreStartNode: Boolean; AStartNode: TcxTreeListNode = nil);
begin
  edtText.Text := AText;
  cbMode.ItemIndex := Ord(AMode);
  chkExpandedOnly.Checked := ExpandedOnly;
  chkCaseSensitive.Checked := CaseSensitive;
  chkStartFromCurrent.Checked := StartFromCurrentNode;
  chkForward.Checked := ForwardDirection;
  chkIgnoreStart.Checked := IgnoreStartNode;
  TreeList.FocusedNode := AStartNode;
end;

class function TfrmSearch.GetID: Integer;
begin
  Result := 14;
end;

initialization
  TfrmSearch.Register;

end.
