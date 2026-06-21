unit DockingMegaDemoMain;

interface

uses
{$I dxSkins.inc}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, dxDockPanel, Menus, StdCtrls, ExtCtrls, ImgList,
  Clipbrd, dxBar, ActnList, dxDockControl, StdActns, dxBarExtItems,
  cxClasses, cxLookAndFeels, dxSkinsForm, dxSkinsCore,
  dxSkinsdxDockControlPainter, dxSkinsdxBarPainter, dxBarSkinnedCustForm,
  cxGraphics, cxControls, cxLookAndFeelPainters, cxContainer, cxEdit, cxGroupBox,
  cxLabel, cxTextEdit, cxMemo, cxTreeView, cxListView, dxSkinsdxNavBarPainter,
  dxNavBarCollns, dxNavBarBase, dxNavBar, cxButtons, cxCheckBox, cxMaskEdit,
  cxDropDownEdit, cxPC, cxScrollBox;

type
  TDockingMegaDemoMainForm = class(TForm)
    dsHost: TdxDockSite;
    dpStartPage: TdxDockPanel;
    dpOutput: TdxDockPanel;
    dpToolbox: TdxDockPanel;
    dxDockingManager1: TdxDockingManager;
    dpProperties: TdxDockPanel;
    dxLayoutDockSite1: TdxLayoutDockSite;
    dpClassView: TdxDockPanel;
    dxLayoutDockSite4: TdxLayoutDockSite;
    dxLayoutDockSite2: TdxLayoutDockSite;
    dpCallStack: TdxDockPanel;
    dxTabContainerDockSite1: TdxTabContainerDockSite;
    dpSolutionExplorer: TdxDockPanel;
    dxTabContainerDockSite2: TdxTabContainerDockSite;
    dpWatch: TdxDockPanel;
    BarManager: TdxBarManager;
    dxBarButtonLoad: TdxBarLargeButton;
    dxBarButtonSave: TdxBarLargeButton;
    dxBarSubItemFile: TdxBarSubItem;
    dxBarSubItemInsert: TdxBarSubItem;
    dxBarSubItemWindow: TdxBarSubItem;
    dxBarButtonExit: TdxBarLargeButton;
    siHelp: TdxBarSubItem;
    imBarIcons: TImageList;
    dxBarButtonToolBox: TdxBarLargeButton;
    dxBarButtonWatch: TdxBarLargeButton;
    dxBarButtonOutput: TdxBarLargeButton;
    dxBarButtonCallStack: TdxBarLargeButton;
    dxBarButtonProperties: TdxBarLargeButton;
    dxBarButtonClassView: TdxBarLargeButton;
    dxBarButtonSolutionExplorer: TdxBarLargeButton;
    dxBarSubItemOtherWindows: TdxBarSubItem;
    ColorDialog1: TColorDialog;
    FontDialog1: TFontDialog;
    ilDockIcons: TImageList;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButtonDockable: TdxBarButton;
    dxBarButtonHide: TdxBarButton;
    dxBarButtonFloating: TdxBarButton;
    dxBarButtonAutoHide: TdxBarButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    dxLayoutDockSite3: TdxLayoutDockSite;
    dxBarButtonStartPage: TdxBarLargeButton;
    dxBarButton1: TdxBarLargeButton;
    dxBarButton2: TdxBarLargeButton;
    dxBarButton3: TdxBarLargeButton;
    dxBarButton4: TdxBarLargeButton;
    dxBarButton5: TdxBarLargeButton;
    dxBarButton6: TdxBarLargeButton;
    dxBarButton7: TdxBarLargeButton;
    ilDisabledImages: TImageList;
    ilHotImages: TImageList;
    ListView1: TcxListView;
    Memo1: TcxMemo;
    ListView2: TcxListView;
    tvSolutionExplorer: TcxTreeView;
    tvClassView: TcxTreeView;
    iComponentsIcons: TImageList;
    ScrollBox1: TcxScrollBox;
    Panel2: TcxGroupBox;
    Image2: TImage;
    Panel3: TcxGroupBox;
    Label4: TcxLabel;
    Image3: TImage;
    Image4: TImage;
    Label5: TcxLabel;
    Panel4: TcxGroupBox;
    btnApply: TcxButton;
    btnCancel: TcxButton;
    Panel5: TcxGroupBox;
    Image1: TImage;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    siStyles: TdxBarSubItem;
    dxSkinController1: TdxSkinController;
    dxNavBar1: TdxNavBar;
    dxNavBar1Group1: TdxNavBarGroup;
    dxNavBar1Group2: TdxNavBarGroup;
    dxNavBar1Group3: TdxNavBarGroup;
    dxNavBar1Group4: TdxNavBarGroup;
    dxNavBar1Item1: TdxNavBarItem;
    dxNavBar1Item2: TdxNavBarItem;
    dxNavBar1Item3: TdxNavBarItem;
    dxNavBar1Item4: TdxNavBarItem;
    dxNavBar1Item5: TdxNavBarItem;
    dxNavBar1Item6: TdxNavBarItem;
    dxNavBar1Item7: TdxNavBarItem;
    dxNavBar1Item8: TdxNavBarItem;
    dxNavBar1Item9: TdxNavBarItem;
    dxNavBar1Item10: TdxNavBarItem;
    dxNavBar1Item11: TdxNavBarItem;
    dxNavBar1Item12: TdxNavBarItem;
    dxNavBar1Item13: TdxNavBarItem;
    dxNavBar1Item14: TdxNavBarItem;
    Panel1: TcxGroupBox;
    ComboBox1: TcxComboBox;
    cxGroupBox1: TcxGroupBox;
    cbAllowDockBottom: TcxCheckBox;
    cbAllowDockClient: TcxCheckBox;
    cbAllowDockClientsBottom: TcxCheckBox;
    cbAllowDockClientsClient: TcxCheckBox;
    cbAllowDockClientsLeft: TcxCheckBox;
    cbAllowDockClientsRight: TcxCheckBox;
    cbAllowDockClientsTop: TcxCheckBox;
    cbAllowDockLeft: TcxCheckBox;
    cbAllowDockRight: TcxCheckBox;
    cbAllowDockTop: TcxCheckBox;
    cbAllowFloating: TcxCheckBox;
    cbShowCaption: TcxCheckBox;
    cbShowCloseButton: TcxCheckBox;
    cbShowHideButton: TcxCheckBox;
    cbShowMaxButton: TcxCheckBox;
    eCaption: TcxTextEdit;
    Label1: TcxLabel;
    Label2: TcxLabel;
    Label3: TcxLabel;
    Panel6: TcxGroupBox;
    cbTabsScrollable: TcxCheckBox;
    cxLabel1: TcxLabel;
    cbTabsPosition: TcxComboBox;
    cbCloseButtonMode: TcxComboBox;
    cbTabsRotate: TcxCheckBox;
    cxLabel2: TcxLabel;
    cbManagerColor: TcxCheckBox;
    cxLabel3: TcxLabel;
    cbVisible: TcxCheckBox;
    cbManagerFont: TcxCheckBox;
    dxVertContainerDockSite1: TdxVertContainerDockSite;
    dxBarDockStyle: TdxBarSubItem;
    dxBarDockStyleStandard: TdxBarButton;
    dxBarDockStyleVS2005: TdxBarButton;
    procedure dxBarButtonExitClick(Sender: TObject);
    procedure dxBarButtonSolutionExplorerClick(Sender: TObject);
    procedure dxBarButtonClassViewClick(Sender: TObject);
    procedure dxBarButtonPropertiesClick(Sender: TObject);
    procedure dxBarButtonToolBoxClick(Sender: TObject);
    procedure dxBarButtonCallStackClick(Sender: TObject);
    procedure dxBarButtonOutputClick(Sender: TObject);
    procedure dxBarButtonFontClick(Sender: TObject);
    procedure dxBarButtonColorClick(Sender: TObject);
    procedure frSolutionExplorer1TreeView1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dxBarButtonWatchClick(Sender: TObject);
    procedure dpContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure dxBarButtonDockableClick(Sender: TObject);
    procedure dxBarButtonHideClick(Sender: TObject);
    procedure dxBarButtonFloatingClick(Sender: TObject);
    procedure dxBarButtonAutoHideClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxBarButtonLoadClick(Sender: TObject);
    procedure dxBarButtonSaveClick(Sender: TObject);
    procedure dxBarButtonStartPageClick(Sender: TObject);
    procedure dxDockingManager1LayoutChanged(Sender: TdxCustomDockControl);
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure tvSolutionExplorerChange(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure dxBarDockStyleStandardClick(Sender: TObject);
  private
    FDockControl: TdxCustomDockControl;
    procedure ApplyProperties;
    procedure UpdateProperties;
    //
    procedure SetDockControl(const Value: TdxCustomDockControl);
    procedure SetEnableState(AContainer: TWinControl; AValue: Boolean);
  private
    FPopupMenuDockControl: TdxCustomDockControl;
    procedure UpdateClassViewTreeView;
    procedure UpdateSolutionTreeView;
    //
    property DockControl: TdxCustomDockControl read FDockControl write SetDockControl;
  end;

var
  DockingMegaDemoMainForm: TDockingMegaDemoMainForm;

implementation

uses dxDemoUtils;

{$R *.dfm}

procedure TDockingMegaDemoMainForm.UpdateSolutionTreeView;

  procedure CheckSite(AControl: TdxCustomDockControl; ANode: TTreeNode);
  var
    I: Integer;
    AChild: TTreeNode;
    ANodeName: string;
  begin
    if AControl.Name <> '' then
      ANodeName := AControl.Name
    else
      ANodeName := AControl.ClassName;
    AChild := tvSolutionExplorer.Items.AddChildObject(ANode, ANodeName, AControl);
    AChild.StateIndex := AControl.ImageIndex;
    for I := 0 to AControl.ChildCount - 1 do
       CheckSite(AControl.Children[I], AChild);
  end;

var
  I: Integer;
begin
  if not tvSolutionExplorer.HandleAllocated then exit;
  tvSolutionExplorer.Items.BeginUpdate;
  try
    tvSolutionExplorer.Items.Clear;
    CheckSite(dsHost, nil);
    tvSolutionExplorer.FullExpand;
  finally
    tvSolutionExplorer.Items.EndUpdate;
  end;
  tvSolutionExplorer.Selected := nil;
  for I := 0 to tvSolutionExplorer.Items.Count - 1 do
    if TdxCustomDockControl(tvSolutionExplorer.Items[I].Data) = DockControl then
      tvSolutionExplorer.Selected := tvSolutionExplorer.Items[I];
  UpdateProperties;
end;

procedure TDockingMegaDemoMainForm.UpdateClassViewTreeView;
var
  ANode: TTreeNode;
begin
  if not tvClassView.HandleAllocated then Exit;
  tvClassView.Items.BeginUpdate;
  try
    tvClassView.Items.Clear;
    ANode := tvClassView.Items.AddChild(nil, 'TdxCustomDockControl');
    ANode := tvClassView.Items.AddChild(ANode, 'TdxCustomDockSite');
    tvClassView.Items.AddChild(ANode, 'TdxLayoutDockSite');
    ANode := tvClassView.Items.AddChild(ANode, 'TdxContainerDockSite');
    tvClassView.Items.AddChild(ANode, 'TdxTabContainerDockSite');
    ANode := tvClassView.Items.AddChild(ANode, 'TdxSideContainerDockSite');
    tvClassView.Items.AddChild(ANode, 'TdxHorizContainerDockSite');
    tvClassView.Items.AddChild(ANode, 'TdxVertContainerDockSite');
    tvClassView.Items.AddChild(tvClassView.Items[1], 'TdxFloatDockSite');
    tvClassView.Items.AddChild(tvClassView.Items[1], 'TdxDockSite');
    tvClassView.Items.AddChild(tvClassView.Items[0], 'TdxDockPanel');
    tvClassView.FullExpand;
  finally
    tvClassView.Items.EndUpdate;
  end;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonExitClick(Sender: TObject);
begin
  Close;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonStartPageClick(Sender: TObject);
begin
  if (dpStartPage = nil) then exit;
  if not dpStartPage.Visible then
    dpStartPage.Visible := True;
  dxDockingController.ActiveDockControl := dpStartPage;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonSolutionExplorerClick(Sender: TObject);
begin
  if (dpSolutionExplorer = nil) then exit;
  if not dpSolutionExplorer.Visible then
    dpSolutionExplorer.Visible := True;
  dxDockingController.ActiveDockControl := dpSolutionExplorer;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonClassViewClick(Sender: TObject);
begin
  if (dpClassView = nil) then exit;
  if not dpClassView.Visible then
    dpClassView.Visible := True;
  dxDockingController.ActiveDockControl := dpClassView;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonPropertiesClick(Sender: TObject);
begin
  if (dpProperties = nil) then exit;
  if not dpProperties.Visible then
    dpProperties.Visible := True;
  dxDockingController.ActiveDockControl := dpProperties;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonToolBoxClick(Sender: TObject);
begin
  if (dpToolbox = nil) then exit;
  if not dpToolbox.Visible then
    dpToolbox.Visible := True;
  dxDockingController.ActiveDockControl := dpToolbox;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonCallStackClick(Sender: TObject);
begin
  if (dpCallStack = nil) then exit;
  if not dpCallStack.Visible then
    dpCallStack.Visible := True;
  dxDockingController.ActiveDockControl := dpCallStack;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonOutputClick(Sender: TObject);
begin
  if (dpOutput = nil) then exit;
  if not dpOutput.Visible then
    dpOutput.Visible := True;
  dxDockingController.ActiveDockControl := dpOutput;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonWatchClick(Sender: TObject);
begin
  if (dpWatch = nil) then exit;
  if not dpWatch.Visible then
    dpWatch.Visible := True;
  dxDockingController.ActiveDockControl := dpWatch;
end;

procedure TDockingMegaDemoMainForm.dxBarDockStyleStandardClick(Sender: TObject);
begin
  if dxBarDockStyleVS2005.Down then
  begin
    dxDockingManager1.DockStyle := dsVS2005;
    dxDockingManager1.Options := dxDockingManager1.Options + [doFillDockingSelection];
  end
  else
  begin
    dxDockingManager1.DockStyle := dsStandard;
    dxDockingManager1.Options := dxDockingManager1.Options - [doFillDockingSelection];
  end;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonFontClick(Sender: TObject);
begin
  FontDialog1.Font := dxDockingManager1.Font;
  if FontDialog1.Execute then
    dxDockingManager1.Font := FontDialog1.Font;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonColorClick(Sender: TObject);
begin
  ColorDialog1.Color := dxDockingManager1.Color;
  if ColorDialog1.Execute then
    dxDockingManager1.Color := ColorDialog1.Color;
end;

procedure TDockingMegaDemoMainForm.frSolutionExplorer1TreeView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ANode: TTreeNode;
begin
  ANode := tvSolutionExplorer.GetNodeAt(X, Y);
  if ANode <> nil then
    DockControl := TdxCustomDockControl(ANode.Data)
  else DockControl := dsHost;
end;

procedure TDockingMegaDemoMainForm.dpContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  pt: TPoint;
  AControl: TdxCustomDockControl;
begin
  GetCursorPos(pt);
  AControl := dxDockingController.GetDockControlAtPos(pt);
  if AControl <> nil then
  begin
    FPopupMenuDockControl := AControl;
    dxBarButtonDockable.Down := FPopupMenuDockControl.Dockable;
    dxBarButtonFloating.Down := FPopupMenuDockControl.FloatDockSite <> nil;
    dxBarButtonAutoHide.Enabled := FPopupMenuDockControl.CanAutoHide;
    dxBarButtonAutoHide.Down := FPopupMenuDockControl.AutoHide;
    dxBarPopupMenu1.PopupFromCursorPos;
    Handled := True;
  end;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonDockableClick(Sender: TObject);
begin
  if FPopupMenuDockControl <> nil then
  begin
    FPopupMenuDockControl.Dockable := (Sender as TdxBarButton).Down;
    FPopupMenuDockControl := nil;
  end;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonHideClick(Sender: TObject);
begin
  if FPopupMenuDockControl <> nil then
  begin
    FPopupMenuDockControl.Visible := False;
    FPopupMenuDockControl := nil;
  end;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonFloatingClick(Sender: TObject);
var
  pt: TPoint;
begin
  if (FPopupMenuDockControl <> nil) and (FPopupMenuDockControl.DockState <> dsFloating) then
  begin
    GetCursorPos(pt);
    FPopupMenuDockControl.MakeFloating(pt.X, pt.Y);
    FPopupMenuDockControl := nil;
  end;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonAutoHideClick(Sender: TObject);
begin
  if FPopupMenuDockControl <> nil then
  begin
    FPopupMenuDockControl.AutoHide := (Sender as TdxBarButton).Down;
    FPopupMenuDockControl := nil;
  end;
end;

procedure TDockingMegaDemoMainForm.FormShow(Sender: TObject);
begin
  DockControl := dsHost;
  UpdateSolutionTreeView;
  UpdateClassViewTreeView;
  ComboBox1.Align := alClient;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonLoadClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    dxDockingManager1.LoadLayoutFromIniFile(OpenDialog1.FileName);
end;

procedure TDockingMegaDemoMainForm.dxBarButtonSaveClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    dxDockingManager1.SaveLayoutToIniFile(SaveDialog1.FileName);
end;

procedure TDockingMegaDemoMainForm.dxDockingManager1LayoutChanged(Sender: TdxCustomDockControl);
begin
  UpdateSolutionTreeView;
end;

procedure TDockingMegaDemoMainForm.SetDockControl(const Value: TdxCustomDockControl);
begin
  if FDockControl <> Value then
  begin
    FDockControl := Value;
    UpdateProperties;
  end;
end;

procedure TDockingMegaDemoMainForm.SetEnableState(AContainer: TWinControl; AValue: Boolean);
var
  I: Integer;
begin
  for I := 0 to AContainer.ControlCount - 1 do
  begin
    AContainer.Controls[I].Enabled := AValue;
    if AContainer.Controls[I] is TWinControl then
      SetEnableState(TWinControl(AContainer.Controls[I]), AValue);
  end;
end;

procedure TDockingMegaDemoMainForm.ApplyProperties;
var
  ADockTypes: TdxDockingTypes;
  ACaptionButtons: TdxCaptionButtons;
begin
  if (FDockControl = nil) or (csDestroying in FDockControl.ComponentState) then exit;

  FDockControl.ManagerColor := cbManagerColor.Checked;
  FDockControl.ManagerFont := cbManagerFont.Checked;
  FDockControl.Caption := eCaption.Text;
  FDockControl.ShowCaption := cbShowCaption.Checked;
  FDockControl.Visible := cbVisible.Checked;

  ACaptionButtons := [];
  if cbShowCloseButton.Checked then
    ACaptionButtons := ACaptionButtons + [cbClose];
  if cbShowMaxButton.Checked then
    ACaptionButtons := ACaptionButtons + [cbMaximize];
  if cbShowHideButton.Checked then
    ACaptionButtons := ACaptionButtons + [cbHide];

  FDockControl.CaptionButtons := ACaptionButtons;

  ADockTypes := [];
  if cbAllowDockLeft.Checked then ADockTypes := ADockTypes + [dtLeft];
  if cbAllowDockTop.Checked then ADockTypes := ADockTypes + [dtTop];
  if cbAllowDockRight.Checked then ADockTypes := ADockTypes + [dtRight];
  if cbAllowDockBottom.Checked then ADockTypes := ADockTypes + [dtBottom];
  if cbAllowDockClient.Checked then ADockTypes := ADockTypes + [dtClient];
  FDockControl.AllowDock := ADockTypes;

  FDockControl.AllowFloating := cbAllowFloating.Checked;

  ADockTypes := [];
  if cbAllowDockClientsLeft.Checked then ADockTypes := ADockTypes + [dtLeft];
  if cbAllowDockClientsTop.Checked then ADockTypes := ADockTypes + [dtTop];
  if cbAllowDockClientsRight.Checked then ADockTypes := ADockTypes + [dtRight];
  if cbAllowDockClientsBottom.Checked then ADockTypes := ADockTypes + [dtBottom];
  if cbAllowDockClientsClient.Checked then ADockTypes := ADockTypes + [dtClient];
  FDockControl.AllowDockClients := ADockTypes;

  if FDockControl is TdxTabContainerDockSite then
  begin
    TdxTabContainerDockSite(FDockControl).TabsProperties.TabPosition := TcxTabPosition(cbTabsPosition.ItemIndex);
    TdxTabContainerDockSite(FDockControl).TabsProperties.CloseButtonMode := TcxPCButtonMode(cbCloseButtonMode.ItemIndex);
    TdxTabContainerDockSite(FDockControl).TabsProperties.Rotate := cbTabsRotate.Checked;
    TdxTabContainerDockSite(FDockControl).TabsProperties.TabsScroll := cbTabsScrollable.Checked;
  end;
end;

procedure TDockingMegaDemoMainForm.UpdateProperties;
var
  AHasDockControl: Boolean;
begin
  AHasDockControl := (FDockControl <> nil) and not (csDestroying in FDockControl.ComponentState);
  SetEnableState(ScrollBox1, AHasDockControl);
  SetEnableState(Panel4, AHasDockControl);
  if AHasDockControl then
  begin
    cbManagerColor.Checked := FDockControl.ManagerColor;
    cbManagerFont.Checked := FDockControl.ManagerFont;
    eCaption.Text := FDockControl.Caption;
    cbShowCaption.Checked := FDockControl.ShowCaption;
    cbShowCloseButton.Checked := cbClose in FDockControl.CaptionButtons;
    cbShowMaxButton.Checked := cbMaximize in FDockControl.CaptionButtons;
    cbShowHideButton.Checked := cbHide in FDockControl.CaptionButtons;

    cbAllowDockLeft.Checked := dtLeft in FDockControl.AllowDock;
    cbAllowDockTop.Checked := dtTop in FDockControl.AllowDock;
    cbAllowDockRight.Checked := dtRight in FDockControl.AllowDock;
    cbAllowDockBottom.Checked := dtBottom in FDockControl.AllowDock;
    cbAllowDockClient.Checked := dtClient in FDockControl.AllowDock;
    cbAllowFloating.Checked := FDockControl.AllowFloating;
    cbAllowDockClientsLeft.Checked := dtLeft in FDockControl.AllowDockClients;
    cbAllowDockClientsTop.Checked := dtTop in FDockControl.AllowDockClients;
    cbAllowDockClientsRight.Checked := dtRight in FDockControl.AllowDockClients;
    cbAllowDockClientsBottom.Checked := dtBottom in FDockControl.AllowDockClients;
    cbAllowDockClientsClient.Checked := dtClient in FDockControl.AllowDockClients;
    cbVisible.Checked := FDockControl.Visible;

    SetEnableState(Panel6, FDockControl is TdxTabContainerDockSite);
    if FDockControl is TdxTabContainerDockSite then
    begin
      cbTabsPosition.ItemIndex := Integer(TdxTabContainerDockSite(FDockControl).TabsProperties.TabPosition);
      cbTabsRotate.Checked := TdxTabContainerDockSite(FDockControl).TabsProperties.Rotate;
      cbCloseButtonMode.ItemIndex := Integer(TdxTabContainerDockSite(FDockControl).TabsProperties.CloseButtonMode);
      cbTabsScrollable.Checked := TdxTabContainerDockSite(FDockControl).TabsProperties.TabsScroll;
    end;
  end;
end;

procedure TDockingMegaDemoMainForm.btnApplyClick(Sender: TObject);
begin
  ApplyProperties;
  UpdateProperties;
end;

procedure TDockingMegaDemoMainForm.btnCancelClick(Sender: TObject);
begin
  UpdateProperties;
end;

procedure TDockingMegaDemoMainForm.tvSolutionExplorerChange(Sender: TObject; Node: TTreeNode);
begin
  Node := tvSolutionExplorer.Selected;
  if Node <> nil then
    DockControl := TdxCustomDockControl(Node.Data)
  else
    DockControl := dsHost;
end;

procedure TDockingMegaDemoMainForm.FormCreate(Sender: TObject);
begin
  dpStartPage.OnContextPopup := dpContextPopup;
  dpProperties.OnContextPopup := dpContextPopup;
  dpSolutionExplorer.OnContextPopup := dpContextPopup;
  dpClassView.OnContextPopup := dpContextPopup;
  dpOutput.OnContextPopup := dpContextPopup;
  dpCallStack.OnContextPopup := dpContextPopup;
  dpWatch.OnContextPopup := dpContextPopup;
  dpToolbox.OnContextPopup := dpContextPopup;
  CreateSkinsMenuItems(BarManager, siStyles, dxSkinController1, dxNavBar1);
  CreateHelpMenuItems(BarManager, siHelp);
end;

initialization
  dxMegaDemoProductIndex := dxDockingIndex;

end.
