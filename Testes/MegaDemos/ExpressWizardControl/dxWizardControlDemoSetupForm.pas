unit dxWizardControlDemoSetupForm;

{$I cxVer.inc}
                
interface

uses
  dxSkinsForm,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, StdCtrls, cxButtons, cxCheckBox, cxListBox,
  dxCustomWizardControl, dxWizardControl, cxGroupBox, cxRadioGroup, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLabel, ComCtrls, cxTreeView,
  dxLayoutcxEditAdapters, dxLayoutContainer, dxLayoutControlAdapters,
  dxLayoutControl, dxLayoutLookAndFeels;

type
  TdxWizardControlDemoSetupForm = class(TForm)
    btnStartDemo: TcxButton;
    cbSkinForm: TcxCheckBox;
    lbChooseSkin: TcxLabel;
    rgTransitionEffect: TcxRadioGroup;
    rgViewStyle: TcxRadioGroup;
    tvSkins: TcxTreeView;
    dxSetupFormLayoutControlGroup_Root: TdxLayoutGroup;
    dxSetupFormLayoutControl: TdxLayoutControl;
    dxSetupFormLayoutControlItem1: TdxLayoutItem;
    dxSetupFormLayoutControlItem2: TdxLayoutItem;
    dxSetupFormLayoutControlItem3: TdxLayoutItem;
    dxSetupFormLayoutControlItem4: TdxLayoutItem;
    dxSetupFormLayoutControlItem5: TdxLayoutItem;
    dxSetupFormLayoutControlItem6: TdxLayoutItem;
    dxSetupFormLayoutControlGroup2: TdxLayoutGroup;
    dxSetupFormLayoutControlGroup4: TdxLayoutGroup;
    dxSetupFormLayoutControlGroup5: TdxLayoutGroup;
    dxSetupFormLayoutControlGroup3: TdxLayoutGroup;
    dxLayoutLookAndFeelList: TdxLayoutLookAndFeelList;
    dxLayoutStandardLookAndFeel: TdxLayoutStandardLookAndFeel;
    dxLayoutCxLookAndFeel: TdxLayoutCxLookAndFeel;
    procedure cbSkinFormClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tvSkinsChange(Sender: TObject; Node: TTreeNode);
    procedure tvSkinsCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
      State: TCustomDrawState; var DefaultDraw: Boolean);
  private
    FSkinController: TdxSkinController;
    function GetSkinForm: Boolean;
    function GetTransitionEffect: TdxWizardControlTransitionEffect;
    function GetViewStyle: TdxWizardControlViewStyle;
    procedure ChangeStyle(APainter: TcxCustomLookAndFeelPainter);
  public
    property SkinForm: Boolean read GetSkinForm;
    property TransitionEffect: TdxWizardControlTransitionEffect read GetTransitionEffect;
    property ViewStyle: TdxWizardControlViewStyle read GetViewStyle;
  end;

implementation

{$R *.dfm}

const
  sdxWizardControlDemoSetupFormNodeNameStandard = 'Standard';
  sdxWizardControlDemoSetupFormNodeNameSkins = 'Skins';

{ TdxWizardControlDemoSetupForm }

function TdxWizardControlDemoSetupForm.GetSkinForm: Boolean;
begin
  Result := cbSkinForm.Checked and cbSkinForm.Enabled;
end;
 
function TdxWizardControlDemoSetupForm.GetTransitionEffect:
  TdxWizardControlTransitionEffect;
const
  TransitionEffectMap: array [0..2] of TdxWizardControlTransitionEffect =
    (wcteNone, wcteFade, wcteSlide);
begin
  Result := TransitionEffectMap[rgTransitionEffect.ItemIndex];
end;

function TdxWizardControlDemoSetupForm.GetViewStyle: TdxWizardControlViewStyle;
const
  ViewStyleMap: array[0..1] of TdxWizardControlViewStyle = (wcvsAero, wcvsWizard97);
begin
  Result := ViewStyleMap[rgViewStyle.ItemIndex];
end;
 
procedure TdxWizardControlDemoSetupForm.ChangeStyle(APainter: TcxCustomLookAndFeelPainter);
begin
  cbSkinForm.Enabled := False;
  case APainter.LookAndFeelStyle of
    lfsNative:
      begin
        RootLookAndFeel.NativeStyle := True;
        dxSetupFormLayoutControlGroup_Root.LayoutLookAndFeel := dxLayoutCxLookAndFeel;
      end;
    lfsSkin:
      begin
        RootLookAndFeel.NativeStyle := False;
        RootLookAndFeel.SkinName := APainter.LookAndFeelName;
        cbSkinForm.Enabled := True;
        dxSetupFormLayoutControlGroup_Root.LayoutLookAndFeel := dxLayoutCxLookAndFeel;
      end;
  else
    begin
      RootLookAndFeel.NativeStyle := False;
      RootLookAndFeel.SkinName := '';
      RootLookAndFeel.SetStyle(APainter.LookAndFeelStyle);
      dxSetupFormLayoutControlGroup_Root.LayoutLookAndFeel := dxLayoutStandardLookAndFeel;
    end;
  end;
end;

procedure TdxWizardControlDemoSetupForm.cbSkinFormClick(Sender: TObject);
begin
  if cbSkinForm.Checked then
    FSkinController := TdxSkinController.Create(Self)
  else
    FreeAndNil(FSkinController);
end;

procedure TdxWizardControlDemoSetupForm.FormCreate(Sender: TObject);
var
  I: Integer;
  AStandartNode, ASkinsNode: TTreeNode;
  APainter: TcxCustomLookAndFeelPainter;
begin
  ASkinsNode := tvSkins.Items.Add(TTreeNode.Create(tvSkins.Items),
    sdxWizardControlDemoSetupFormNodeNameSkins);
  AStandartNode := tvSkins.Items.Add(TTreeNode.Create(tvSkins.Items),
    sdxWizardControlDemoSetupFormNodeNameStandard);
  for I := 0 to cxLookAndFeelPaintersManager.Count - 1 do
  begin
    APainter := cxLookAndFeelPaintersManager.Items[I];
    if APainter.LookAndFeelStyle = lfsSkin then
      tvSkins.Items.AddChildObject(ASkinsNode, APainter.LookAndFeelName, APainter)
    else
      tvSkins.Items.AddChildObject(AStandartNode, APainter.LookAndFeelName, APainter);
  end;
  tvSkins.FullExpand;

  if ASkinsNode.Count = 0 then
  begin
    AStandartNode.getFirstChild.Selected := True;
    ASkinsNode.Free;
  end
  else
    ASkinsNode.getFirstChild.Selected := True;

  ChangeStyle(TcxCustomLookAndFeelPainter(tvSkins.Selected.Data));
end;
 
procedure TdxWizardControlDemoSetupForm.tvSkinsChange(Sender: TObject; Node: TTreeNode);
begin
  if tvSkins.Selected.Data <> nil then
    ChangeStyle(TcxCustomLookAndFeelPainter(tvSkins.Selected.Data));
end;

procedure TdxWizardControlDemoSetupForm.tvSkinsCustomDrawItem(
  Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if Node.Data = nil then
    Sender.Canvas.Font.Style := [fsBold];
end;

end.


