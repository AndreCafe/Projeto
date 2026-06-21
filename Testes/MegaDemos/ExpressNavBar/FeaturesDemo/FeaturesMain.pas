unit FeaturesMain;

interface

uses
{$I dxSkins.inc}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ImgList, ActnList, ComCtrls, Menus,
  dxNavBarStyles, dxNavBarCollns, dxNavBarBase, dxNavBar, dxNavBarSkinBasedViews,
  cxClasses, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinsdxNavBarPainter, dxSkinsdxBarPainter, dxBar, cxContainer,
  cxEdit, cxLabel, dxSkinsForm, cxGroupBox, cxPC, cxCheckBox, dxSkinscxPCPainter,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxButtons, cxTreeView, cxImageComboBox,
  Contnrs, dxBarSkinnedCustForm, cxPCdxBarPopupMenu;

type
  TfmFeaturesMain = class(TForm)
    nbMain: TdxNavBar;
    bgMail: TdxNavBarGroup;
    bgNews: TdxNavBarGroup;
    biInbox: TdxNavBarItem;
    biOutbox: TdxNavBarItem;
    biSentItems: TdxNavBarItem;
    biDeletedItems: TdxNavBarItem;
    biDrafts: TdxNavBarItem;
    biNews: TdxNavBarItem;
    imgSmall: TImageList;
    imgLarge: TImageList;
    bgOther: TdxNavBarGroup;
    biMyComputer: TdxNavBarItem;
    stThirdGroupBackGround: TdxNavBarStyleItem;
    stThirdGroupHeader: TdxNavBarStyleItem;
    stThirdGroupHeaderHotTracked: TdxNavBarStyleItem;
    stThirdGroupHeaderPressed: TdxNavBarStyleItem;
    alMain: TActionList;
    actShowCaptions: TAction;
    actShowSpecialGroup: TAction;
    actAllowSelectLinks: TAction;
    actEachGroupHasSelectedLink: TAction;
    actShowGroupHints: TAction;
    actShowLinkHints: TAction;
    lbNavBarHierarchy: TcxLabel;
    tvNavBar: TcxTreeView;
    btAddGroup: TcxButton;
    btDeleteGroup: TcxButton;
    btAddLink: TcxButton;
    btDeleteLink: TcxButton;
    Label3: TcxLabel;
    Label4: TcxLabel;
    Label5: TcxLabel;
    cbGExpanded: TcxCheckBox;
    cbGVisible: TcxCheckBox;
    cbGLinkUseSmallImages: TcxCheckBox;
    cbGUseSmallImages: TcxCheckBox;
    eGCaption: TcxTextEdit;
    cbGShowAsIconView: TcxCheckBox;
    cbGSmallImageIndex: TcxImageComboBox;
    cbGLargeImageIndex: TcxImageComboBox;
    Label6: TcxLabel;
    Label7: TcxLabel;
    Label8: TcxLabel;
    eICaption: TcxTextEdit;
    cbIEnabled: TcxCheckBox;
    cbIVisible: TcxCheckBox;
    cbILargeImageIndex: TcxImageComboBox;
    cbISmallImageIndex: TcxImageComboBox;
    bgCalendar: TdxNavBarGroup;
    bgJournal: TdxNavBarGroup;
    bgNotes: TdxNavBarGroup;
    bgTasks: TdxNavBarGroup;
    bgContacts: TdxNavBarGroup;
    bgShortcuts: TdxNavBarGroup;
    biMyDocuments: TdxNavBarItem;
    biFavorites: TdxNavBarItem;
    biJunkEmail: TdxNavBarItem;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    miExit: TdxBarButton;
    miFile: TdxBarSubItem;
    miShowCaptions: TdxBarButton;
    miShowSpecialGroup: TdxBarButton;
    miOptionsView: TdxBarSubItem;
    miAllowSelectLinks: TdxBarButton;
    miEachGroupHasSelectedLink: TdxBarButton;
    miShowGroupHints: TdxBarButton;
    miShowLinkHints: TdxBarButton;
    miOptionsBehavour: TdxBarSubItem;
    miOptions: TdxBarSubItem;
    miHelp: TdxBarSubItem;
    pmnuItems: TdxBarPopupMenu;
    cxLabel1: TcxLabel;
    dxSkinController1: TdxSkinController;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    gbProperties: TcxGroupBox;
    pcProperties: TcxPageControl;
    tsSelectedGroupProps: TcxTabSheet;
    tsSelectedItemProps: TcxTabSheet;
    dxBarManager1Bar2: TdxBar;
    miStyle: TdxBarSubItem;
    miColorScheme: TdxBarSubItem;
    procedure FormCreate(Sender: TObject);
    procedure btAddGroupClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btDeleteGroupClick(Sender: TObject);
    procedure btDeleteLinkClick(Sender: TObject);
    procedure btAddLinkClick(Sender: TObject);
    procedure nbMainEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure miStyleItemClick(Sender: TObject);
    procedure actShowCaptionsExecute(Sender: TObject);
    procedure actShowSpecialGroupExecute(Sender: TObject);
    procedure actAllowSelectLinksExecute(Sender: TObject);
    procedure actEachGroupHasSelectedLinkExecute(Sender: TObject);
    procedure actShowGroupHintsExecute(Sender: TObject);
    procedure actShowLinkHintsExecute(Sender: TObject);
    procedure pmnuItemClick(Sender: TObject);
    procedure tvNavBarChange(Sender: TObject; Node: TTreeNode);
    procedure cbGExpandedClick(Sender: TObject);
    procedure cbGVisibleClick(Sender: TObject);
    procedure cbGShowAsIconViewClick(Sender: TObject);
    procedure cbGLinkUseSmallImagesClick(Sender: TObject);
    procedure cbGUseSmallImagesClick(Sender: TObject);
    procedure eGCaptionChange(Sender: TObject);
    procedure cbGSmallImageIndexChange(Sender: TObject);
    procedure cbGLargeImageIndexChange(Sender: TObject);
    procedure cbIEnabledClick(Sender: TObject);
    procedure cbIVisibleClick(Sender: TObject);
    procedure eICaptionChange(Sender: TObject);
    procedure cbISmallImageIndexChange(Sender: TObject);
    procedure cbILargeImageIndexChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure NavBarItemClick(Sender: TObject);
    procedure nbMainActiveGroupChanged(Sender: TObject);
    procedure nbMainLinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
    procedure miExitClick(Sender: TObject);
  private
    FColorSchemeItems: TObjectList;
    function AddButton(AItemLinks: TdxBarItemLinks; ACaption: string;
      AImageIndex: Integer; ARadioItem: Boolean; AGroupIndex: Integer;
      AClickHandler: TNotifyEvent): TdxBarButton;
    procedure CheckColorSheme;
    procedure ColorSchemeClickHandler(Sender: TObject);
    procedure SelectDefaultGroup;
    procedure SetNodeImageIndex(ANode: TTreeNode; AImageIndex: Integer);
    procedure UpdateGroupProperties;
    procedure UpdateItemProperties;
    procedure UpdateItemsDropDownMenu;
    procedure UpdateGroupPropertiesState;
    procedure UpdateItemPropertiesState;
    procedure UpdateTreeView;
    function GetCurrentGroup: TdxNavBarGroup;
    function GetCurrentItem: TdxNavBarItem;
    function GetCurrentLink: TdxNavBarItemLink;
  public
    property CurrentGroup: TdxNavBarGroup read GetCurrentGroup;
    property CurrentItem: TdxNavBarItem read GetCurrentItem;
    property CurrentLink: TdxNavBarItemLink read GetCurrentLink;
  end;

var
  fmFeaturesMain: TfmFeaturesMain;

implementation

uses
  dxNavBarViewsFact, dxNavBarConsts, ShellAPI, dxDemoUtils;

{$R *.DFM}

procedure ClearPopupMenuItems(AMenuItem: TMenuItem);
var
  I: Integer;
begin
  for I := AMenuItem.Count - 1 downto 0 do
    AMenuItem.Items[I].Free;
end;

procedure TfmFeaturesMain.FormCreate(Sender: TObject);

  procedure AddImageComboBoxItem(ACombo: TcxImageComboBox; AIndex: Integer);
  var
    AImageComboItem: TcxImageComboBoxItem;
  begin
    AImageComboItem := ACombo.Properties.Items.Add;
    AImageComboItem.ImageIndex := AIndex;
    AImageComboItem.Value := AIndex;
    AImageComboItem.Description := IntToStr(AIndex);
  end;

  procedure InitImageIndexComoboBoxes;
  var
    I: Integer;
  begin
    for I := 0 to imgSmall.Count - 1 do
    begin
      AddImageComboBoxItem(cbGSmallImageIndex, I);
      AddImageComboBoxItem(cbISmallImageIndex, I);
    end;
    for I := 0 to imgLarge.Count - 1 do
    begin
      AddImageComboBoxItem(cbGLargeImageIndex, I);
      AddImageComboBoxItem(cbILargeImageIndex, I);
    end;
  end;

var
  I: Integer;
begin
  FColorSchemeItems := TObjectList.Create;
  for I := 0 to dxNavBarViewsFactory.Count - 1 do
    AddButton(miStyle.ItemLinks, dxNavBarViewsFactory.Names[I], -1, True,
      2, miStyleItemClick);
  TdxBarButton(miStyle.ItemLinks[dxNavBarViewsFactory.IndexOfID(nbMain.View)].Item).Click;
  gbProperties.Height := 200;
  actShowCaptions.Checked := nbMain.ShowGroupCaptions;
  actAllowSelectLinks.Checked := nbMain.AllowSelectLinks;
  actEachGroupHasSelectedLink.Checked := nbMain.EachGroupHasSelectedLink;
  actShowGroupHints.Checked := nbMain.ShowGroupsHint;
  actShowLinkHints.Checked := nbMain.ShowLinksHint;

  InitImageIndexComoboBoxes;
  UpdateTreeView;
  SelectDefaultGroup;
  UpdateGroupProperties;
  UpdateItemProperties;
  UpdateItemsDropDownMenu;
  CreateHelpMenuItems(dxBarManager1, miHelp);
end;

procedure TfmFeaturesMain.btAddGroupClick(Sender: TObject);
var
  AGroup: TdxNavBarGroup;
  AParentNode, ANode: TTreeNode;
begin
  AGroup := nbMain.Groups.Add;
  AGroup.OnClick := NavBarItemClick;
  if CurrentGroup <> nil then
  begin
    if TObject(tvNavBar.Selected.Data) is TdxNavBarGroup then
      AParentNode := tvNavBar.Selected
    else AParentNode := tvNavBar.Selected.Parent;
    ANode := tvNavBar.Items.InsertObject(AParentNode, AGroup.Caption, AGroup);
    AGroup.Index := CurrentGroup.Index;
  end
  else
    ANode := tvNavBar.Items.AddObject(nil, AGroup.Caption, AGroup);
  ANode.ImageIndex := AGroup.SmallImageIndex;
  ANode.SelectedIndex := ANode.ImageIndex;
  tvNavBar.Selected := ANode;
  tvNavBar.FullExpand;
  UpdateGroupProperties;
  UpdateItemProperties;
end;

procedure TfmFeaturesMain.btDeleteGroupClick(Sender: TObject);
var
  AGroup: TdxNavBarGroup;
begin
  if CurrentGroup <> nil then
  begin
    AGroup := CurrentGroup;
    if TObject(tvNavBar.Selected.Data) is TdxNavBarGroup then
      tvNavBar.Items.Delete(tvNavBar.Selected)
    else tvNavBar.Items.Delete(tvNavBar.Selected.Parent);
    nbMain.Groups.Delete(AGroup.Index);

    SelectDefaultGroup;
    UpdateGroupProperties;
    UpdateItemProperties
  end;
end;

procedure TfmFeaturesMain.btAddLinkClick(Sender: TObject);
begin
  if CurrentGroup <> nil then
    with TcxButton(Sender).ClientToScreen(Point(0, TcxButton(Sender).Height)) do
      pmnuItems.Popup(X, Y);
end;

procedure TfmFeaturesMain.btDeleteLinkClick(Sender: TObject);
var
  ALink: TdxNavBarItemLink;
begin
  if CurrentLink <> nil then
  begin
    ALink := CurrentLink;
    if TObject(tvNavBar.Selected.Data) is TdxNavBarItemLink then
      tvNavBar.Items.Delete(tvNavBar.Selected);
    ALink.Group.RemoveLink(ALink.Index);

    SelectDefaultGroup;
    UpdateGroupProperties;
    UpdateItemProperties
  end;
end;

function TfmFeaturesMain.GetCurrentGroup: TdxNavBarGroup;
begin
  if tvNavBar.Selected <> nil then
  begin
    if TObject(tvNavBar.Selected.Data) is TdxNavBarGroup then
      Result := TdxNavBarGroup(tvNavBar.Selected.Data)
    else Result := TdxNavBarGroup(tvNavBar.Selected.Parent.Data);
  end
  else Result := nil;
end;

function TfmFeaturesMain.GetCurrentItem: TdxNavBarItem;
begin
  if CurrentLink <> nil then
    Result := CurrentLink.Item
  else Result := nil;
end;

function TfmFeaturesMain.GetCurrentLink: TdxNavBarItemLink;
begin
  if tvNavBar.Selected <> nil then
  begin
    if TObject(tvNavBar.Selected.Data) is TdxNavBarGroup then
      Result := nil
    else Result := TdxNavBarItemLink(tvNavBar.Selected.Data);
  end
  else Result := nil;
end;

procedure TfmFeaturesMain.UpdateGroupProperties;
begin
  if CurrentGroup <> nil then
  begin
    eGCaption.Text := CurrentGroup.Caption;
    cbGExpanded.Checked := CurrentGroup.Expanded;
    cbGVisible.Checked := CurrentGroup.Visible;
    cbGLinkUseSmallImages.Checked := CurrentGroup.LinksUseSmallImages;
    cbGUseSmallImages.Checked := CurrentGroup.UseSmallImages;
    cbGShowAsIconView.Checked := CurrentGroup.ShowAsIconView;
    cbGSmallImageIndex.ItemIndex := CurrentGroup.SmallImageIndex;
    cbGLargeImageIndex.ItemIndex := CurrentGroup.LargeImageIndex;
  end;
  UpdateGroupPropertiesState
end;

procedure TfmFeaturesMain.UpdateItemProperties;
begin
  if CurrentItem <> nil then
  begin
    eICaption.Text := CurrentItem.Caption;
    cbIEnabled.Checked := CurrentItem.Enabled;
    cbIVisible.Checked := CurrentItem.Visible;
    cbISmallImageIndex.ItemIndex := CurrentItem.SmallImageIndex;
    cbILargeImageIndex.ItemIndex := CurrentItem.LargeImageIndex;
  end;
  UpdateItemPropertiesState;
end;

procedure TfmFeaturesMain.UpdateItemsDropDownMenu;
var
  I: Integer;
begin
  for I := 0 to nbMain.Items.Count - 1 do
    AddButton(pmnuItems.ItemLinks, nbMain.Items[I].Caption,
      nbMain.Items[I].SmallImageIndex, False, 0, pmnuItemClick);
end;

procedure TfmFeaturesMain.UpdateGroupPropertiesState;
begin
  btDeleteGroup.Enabled := CurrentGroup <> nil;
  eGCaption.Enabled := CurrentGroup <> nil;
  if not eGCaption.Enabled then
    eGCaption.Text := '';
  cbGExpanded.Enabled := CurrentGroup <> nil;
  if not cbGExpanded.Enabled then
    cbGExpanded.Checked := False;
  cbGVisible.Enabled := CurrentGroup <> nil;
  if not cbGVisible.Enabled then
    cbGVisible.Checked := False;
  cbGLinkUseSmallImages.Enabled := CurrentGroup <> nil;
  if not cbGLinkUseSmallImages.Enabled then
    cbGLinkUseSmallImages.Checked := False;
  cbGUseSmallImages.Enabled := CurrentGroup <> nil;
  if not cbGUseSmallImages.Enabled then
    cbGUseSmallImages.Checked := False;
  cbGShowAsIconView.Enabled := CurrentGroup <> nil;
  if not cbGShowAsIconView.Enabled then
    cbGShowAsIconView.Checked := False;
end;

procedure TfmFeaturesMain.UpdateItemPropertiesState;
begin
  btAddLink.Enabled := CurrentGroup <> nil;
  btDeleteLink.Enabled := CurrentLink <> nil;
  eICaption.Enabled := CurrentLink <> nil;
  if not eICaption.Enabled then
    eICaption.Text := '';
  cbIEnabled.Enabled := CurrentLink <> nil;
  if not cbIEnabled.Enabled then
    cbIEnabled.Checked := False;
  cbIVisible.Enabled := CurrentLink <> nil;
  if not cbIVisible.Enabled then
    cbIVisible.Checked := False;
end;

procedure TfmFeaturesMain.UpdateTreeView;
var
  ANode, AChildNode: TTreeNode;
  I, J: Integer;
begin
  tvNavBar.Items.BeginUpdate;
  try
    tvNavBar.Items.Clear;
    tvNavBar.Images := nbMain.SmallImages;
    for I := 0 to nbMain.Groups.Count - 1 do
    begin
      ANode := tvNavBar.Items.AddObject(nil, nbMain.Groups[I].Caption, nbMain.Groups[I]);
      SetNodeImageIndex(ANode, nbMain.Groups[I].SmallImageIndex);
      for J := 0 to nbMain.Groups[I].LinkCount - 1 do
        if nbMain.Groups[I].Links[J].Item <> nil then
        begin
          AChildNode := tvNavBar.Items.AddChildObject(ANode,
            nbMain.Groups[I].Links[J].Item.Caption, nbMain.Groups[I].Links[J]);
          SetNodeImageIndex(AChildNode, nbMain.Groups[I].Links[J].Item.SmallImageIndex);
        end;
    end;
    tvNavBar.FullExpand;
  finally
    tvNavBar.Items.EndUpdate;
  end;
end;

function TfmFeaturesMain.AddButton(AItemLinks: TdxBarItemLinks;
  ACaption: string; AImageIndex: Integer; ARadioItem: Boolean; AGroupIndex: Integer;
  AClickHandler: TNotifyEvent): TdxBarButton;
begin
  Result := dxBarManager1.AddButton;
  Result.Caption := ACaption;
  Result.ImageIndex := AImageIndex;
  if ARadioItem then
  begin
    Result.ButtonStyle := bsChecked;
    Result.GroupIndex := AGroupIndex;
  end;
  if Assigned(AClickHandler) then
    Result.OnClick := AClickHandler
  else
    Result.Enabled := False;
  Result.Tag := AItemLinks.Add(Result).Index;
end;

procedure TfmFeaturesMain.CheckColorSheme;
var
  ASchemes: IdxNavBarColorSchemes;
  I, ASelectedIndex: Integer;
  ANameList: TStringList;
begin
  ASchemes := GetNavBarColorSchemes(nbMain.Painter);
  FColorSchemeItems.Clear;
  ANameList := TStringList.Create;
  try
    if ASchemes <> nil then
      ASchemes.PopulateNames(ANameList);
    if (ASchemes <> nil) and (ANameList.Count > 1) then
    begin
      ASelectedIndex := 0;
      for I := 0 to ANameList.Count - 1 do
      begin
        FColorSchemeItems.Add(AddButton(miColorScheme.ItemLinks, ANameList[I], -1,
          True, 3, ColorSchemeClickHandler));
        if SameText(ANameList[I], sdxFirstSelectedSkinName) then
          ASelectedIndex := I;
      end;
      miColorScheme.Visible := ivAlways;

      TdxBarButton(FColorSchemeItems[ASelectedIndex]).Click;
    end
    else
    begin
      miColorScheme.Visible := ivNever;
      dxSkinController1.NativeStyle := False;
      dxSkinController1.UseSkins := False;
      case nbMain.View of
        dxNavBarXPExplorerBarView, dxNavBarVistaExplorerBarView,
        dxNavBarAdvExplorerBarView, dxNavBarXP1View, dxNavBarXP2View:
          begin
            dxSkinController1.NativeStyle := True;
          end;
        dxNavBarBaseView:
          begin
            dxSkinController1.Kind := lfStandard;
          end;
        dxNavBarExplorerBarView, dxNavBarUltraFlatExplorerView:
          begin
            dxSkinController1.Kind := lfUltraFlat;
          end;
        dxNavBarFlatView, dxNavBarOffice1View, dxNavBarOffice2View,
        dxNavBarOffice3View, dxNavBarVSToolBoxView:
          begin
            dxSkinController1.Kind := lfFlat;
          end;
        dxNavBarOffice11NavigatorPaneView, dxNavBarOffice11TaskPaneView,
        dxNavBarOffice11ExplorerBarView:
          begin
            dxSkinController1.Kind := lfOffice11;
          end;
      end;
    end;
  finally
    ANameList.Free;
  end;
end;

procedure TfmFeaturesMain.ColorSchemeClickHandler(Sender: TObject);
var
  ASchemes: IdxNavBarColorSchemes;
  ANameList: TStringList;
begin
  ASchemes := GetNavBarColorSchemes(nbMain.Painter);
  ANameList := TStringList.Create;
  try
    ASchemes.PopulateNames(ANameList);
    ASchemes.SetName(ANameList[TComponent(Sender).Tag]);
    if nbMain.View in [dxNavBarSkinExplorerBarView, dxNavBarSkinNavigatorPaneView] then
    begin
      dxSkinController1.NativeStyle := False;
      dxSkinController1.UseSkins := True;
      dxSkinController1.SkinName := ANameList[TComponent(Sender).Tag];
    end
    else
      dxSkinController1.NativeStyle := True;
  finally
    ANameList.Free;
  end;
end;

procedure TfmFeaturesMain.SelectDefaultGroup;
begin
  if tvNavBar.Items.Count > 0 then
    tvNavBar.Selected := tvNavBar.Items.Item[0];
end;

procedure TfmFeaturesMain.SetNodeImageIndex(ANode: TTreeNode; AImageIndex: Integer);
begin
  ANode.ImageIndex := AImageIndex;
  ANode.StateIndex := AImageIndex;
  ANode.SelectedIndex := AImageIndex;
end;

procedure TfmFeaturesMain.FormActivate(Sender: TObject);
begin
  UpdateGroupProperties;
  UpdateItemProperties;
end;

procedure TfmFeaturesMain.nbMainEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
  UpdateTreeView;
end;

procedure TfmFeaturesMain.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFeaturesMain.miStyleItemClick(Sender: TObject);
begin
  nbMain.View := dxNavBarViewsFactory.IDs[TdxBarItem(Sender).Tag];
  CheckColorSheme;
end;

procedure TfmFeaturesMain.actShowCaptionsExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  nbMain.ShowGroupCaptions := TAction(Sender).Checked;
end;

procedure TfmFeaturesMain.actShowSpecialGroupExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  nbMain.ShowSpecialGroup := TAction(Sender).Checked;
end;

procedure TfmFeaturesMain.actAllowSelectLinksExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  nbMain.AllowSelectLinks := TAction(Sender).Checked;
end;

procedure TfmFeaturesMain.actEachGroupHasSelectedLinkExecute(
  Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  nbMain.EachGroupHasSelectedLink := TAction(Sender).Checked;
end;

procedure TfmFeaturesMain.actShowGroupHintsExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  nbMain.ShowGroupsHint := TAction(Sender).Checked;
end;

procedure TfmFeaturesMain.actShowLinkHintsExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  nbMain.ShowLinksHint := TAction(Sender).Checked;
end;

procedure TfmFeaturesMain.pmnuItemClick(Sender: TObject);
var
  AItem: TdxNavBarItem;
  ALink: TdxNavBarItemLink;
  ANode: TTreeNode;
begin
  if CurrentGroup <> nil then
  begin
    AItem := nbMain.Items[TdxBarItem(Sender).Tag];
    ALink := CurrentGroup.CreateLink(AItem);
    if TObject(tvNavBar.Selected.Data) is TdxNavBarGroup then
      ANode := tvNavBar.Selected
    else ANode := tvNavBar.Selected.Parent;
    ANode := tvNavBar.Items.AddChildObject(ANode, AItem.Caption, ALink);
    SetNodeImageIndex(ANode, AItem.SmallImageIndex);
    ANode.Selected := True;
    tvNavBar.FullExpand;
  end;
end;

procedure TfmFeaturesMain.tvNavBarChange(Sender: TObject; Node: TTreeNode);
begin
 UpdateGroupProperties;
 UpdateItemProperties;
 if Node.Level = 0 then
   pcProperties.ActivePage := tsSelectedGroupProps
 else
   pcProperties.ActivePage := tsSelectedItemProps;
end;

procedure TfmFeaturesMain.cbGExpandedClick(Sender: TObject);
begin
  if CurrentGroup <> nil then
    CurrentGroup.Expanded := TcxCheckBox(Sender).Checked;
end;

procedure TfmFeaturesMain.cbGVisibleClick(Sender: TObject);
begin
  if CurrentGroup <> nil then
    CurrentGroup.Visible := TcxCheckBox(Sender).Checked;
end;

procedure TfmFeaturesMain.cbGShowAsIconViewClick(Sender: TObject);
begin
  if CurrentGroup <> nil then
    CurrentGroup.ShowAsIconView := TcxCheckBox(Sender).Checked;
end;

procedure TfmFeaturesMain.cbGLinkUseSmallImagesClick(Sender: TObject);
begin
  if CurrentGroup <> nil then
    CurrentGroup.LinksUseSmallImages := TcxCheckBox(Sender).Checked;
end;

procedure TfmFeaturesMain.cbGUseSmallImagesClick(Sender: TObject);
begin
  if CurrentGroup <> nil then
    CurrentGroup.UseSmallImages := TcxCheckBox(Sender).Checked;
end;

procedure TfmFeaturesMain.eGCaptionChange(Sender: TObject);
begin
  if CurrentGroup <> nil then
  begin
    CurrentGroup.Caption := eGCaption.Text;
    tvNavBar.Selected.Text := CurrentGroup.Caption;
  end;  
end;

procedure TfmFeaturesMain.cbGSmallImageIndexChange(Sender: TObject);
begin
  if CurrentGroup = nil then
    Exit;
  CurrentGroup.SmallImageIndex := cbGSmallImageIndex.ItemIndex;
  tvNavBar.Selected.ImageIndex := CurrentGroup.SmallImageIndex;
  tvNavBar.Selected.StateIndex := CurrentGroup.SmallImageIndex;
  tvNavBar.Selected.SelectedIndex := CurrentGroup.SmallImageIndex;
end;

procedure TfmFeaturesMain.cbGLargeImageIndexChange(Sender: TObject);
begin
  if CurrentGroup <> nil then
    CurrentGroup.LargeImageIndex := cbGLargeImageIndex.ItemIndex;
end;

procedure TfmFeaturesMain.cbIEnabledClick(Sender: TObject);
begin
  if CurrentItem <> nil then
    CurrentItem.Enabled := TcxCheckBox(Sender).Checked;
end;

procedure TfmFeaturesMain.cbIVisibleClick(Sender: TObject);
begin
  if CurrentItem <> nil then
    CurrentItem.Visible := TcxCheckBox(Sender).Checked;
end;

procedure TfmFeaturesMain.eICaptionChange(Sender: TObject);
var
  I: Integer;
begin
  if CurrentItem <> nil then
  begin
    CurrentItem.Caption := eICaption.Text;
    for I := 0 to tvNavBar.Items.Count - 1 do
      if (TObject(tvNavBar.Items[I].Data) is TdxNavBarItemLink) and
        (TdxNavBarItemLink(tvNavBar.Items[I].Data).Item = CurrentItem) then
        begin
          tvNavBar.Items[I].Text := CurrentItem.Caption;
          Break;
        end;
  end;
end;

procedure TfmFeaturesMain.cbISmallImageIndexChange(Sender: TObject);
begin
  if CurrentItem <> nil then
  begin
    CurrentItem.SmallImageIndex := cbISmallImageIndex.ItemIndex;
    tvNavBar.Selected.ImageIndex := CurrentItem.SmallImageIndex;
    tvNavBar.Selected.StateIndex := CurrentItem.SmallImageIndex;
    tvNavBar.Selected.SelectedIndex := CurrentItem.SmallImageIndex;
  end;
end;

procedure TfmFeaturesMain.cbILargeImageIndexChange(Sender: TObject);
begin
  if CurrentItem <> nil then
    CurrentItem.LargeImageIndex := cbILargeImageIndex.ItemIndex;
end;

procedure TfmFeaturesMain.FormDestroy(Sender: TObject);
begin
  tsSelectedItemProps.Parent := pcProperties;
  tsSelectedGroupProps.Parent := pcProperties;
  FreeAndNil(FColorSchemeItems);
end;

procedure TfmFeaturesMain.NavBarItemClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to tvNavBar.Items.Count - 1 do
    if tvNavBar.Items[I].Data = Sender then
    begin
      tvNavBar.Items[I].Selected := True;
      Break;
    end
    else
      if (TObject(tvNavBar.Items[I].Data) is TdxNavBarItemLink) and
        (TdxNavBarItemLink(tvNavBar.Items[I].Data).Item = Sender) and
        (tvNavBar.Items[I].Data = nbMain.PressedLink) then
      begin
        tvNavBar.Items[I].Selected := True;
        Break;
      end;
end;

procedure TfmFeaturesMain.nbMainActiveGroupChanged(Sender: TObject);
begin
  NavBarItemClick(nbMain.ActiveGroup);
end;

procedure TfmFeaturesMain.nbMainLinkClick(Sender: TObject;
  ALink: TdxNavBarItemLink);
begin
  NavBarItemClick(ALink);
end;

initialization
  dxMegaDemoProductIndex := dxNavBarIndex;

end.
