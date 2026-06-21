unit cxTreeListExplorerFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxUnboundTreeListBaseFormUnit, cxGraphics, cxCustomData, cxStyles,
  cxTL, cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  cxLookAndFeelPainters, StdCtrls, ExtCtrls, cxContainer, cxEdit, cxGroupBox,
  cxControls, cxInplaceContainer, cxTextEdit, cxCalendar, ImgList, cxMaskEdit,
  cxDropDownEdit, cxColorComboBox, cxCheckBox, cxLabel, dxCore, cxLookAndFeels,
  cxClasses;

type
  TfrmTreeListExplorer = class(TcxUnboundTreeListDemoUnitForm)
    clnName: TcxTreeListColumn;
    clnExtension: TcxTreeListColumn;
    clnSize: TcxTreeListColumn;
    clnDateTime: TcxTreeListColumn;
    StyleRepository: TcxStyleRepository;
    styleIncSearch: TcxStyle;
    cxLabel1: TcxLabel;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    chkIncSearch: TcxCheckBox;
    cbSearchColor: TcxColorComboBox;
    cbSearchTextColor: TcxColorComboBox;
    cxLabel2: TcxLabel;
    procedure tlUnboundExpanding(Sender: TcxCustomTreeList;
      ANode: TcxTreeListNode; var Allow: Boolean);
    procedure tlUnboundGetNodeImageIndex(Sender: TcxCustomTreeList;
      ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType;
      var AIndex: TImageIndex);
    procedure clnSizeGetDisplayText(Sender: TcxTreeListColumn;
      ANode: TcxTreeListNode; var Value: string);
    procedure tlUnboundCompare(Sender: TcxCustomTreeList; ANode1,
      ANode2: TcxTreeListNode; var ACompare: Integer);
    procedure cbSearchColorPropertiesEditValueChanged(Sender: TObject);
    procedure cbSearchTextColorPropertiesEditValueChanged(Sender: TObject);
    procedure chkIncSearchPropertiesEditValueChanged(Sender: TObject);
    procedure tlUnboundExpanded(Sender: TcxCustomTreeList;
      ANode: TcxTreeListNode);
  private
    DiskDrives: TcxTreeListNode;
    procedure DoCreateDriversList;
    procedure DoScanDir(ANode: TcxTreeListNode); overload;
    procedure DoScanDir(ANode: TcxTreeListNode; const APath: string); overload;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ActivateDataSet; override;
    procedure DoInspectedObjectChanged; override;
    procedure FrameActivated; override;
    class function GetID: Integer; override;
  end;

implementation

{$R *.dfm}

uses
  ShellApi, Math, cxVariants, cxTreeListDemoMainUnit, cxTreeListFeaturesDemoStrConsts;

function DoRestorePath(ANode: TcxTreeListNode): string;
begin
  Result := '';
  while (ANode.Parent <> nil) and (ANode.Parent.Parent <> nil) do
  begin
    if ANode.HasChildren or (Result <> '') then
      Result := '\' + Result;
    if ANode.Texts[1] <> '' then
      Result := '.' + ANode.Texts[1] + Result;
    Result := ANode.Texts[0] + Result;
    ANode := ANode.Parent;
  end;
end;

function GetIconIndex(const AName: string; AExpanded: Boolean = False): Integer;
var
  Flags: Integer;
  AInfo: TSHFileInfo;
begin
  FillChar(AInfo, SizeOf(AInfo), 0);
  Flags := SHGFI_SYSICONINDEX or SHGFI_SMALLICON;
  if AExpanded then
    Flags := Flags or SHGFI_OPENICON;
  SHGetFileInfo(PChar(AName), 0, AInfo, SizeOf(AInfo), Flags);
  Result := AInfo.iIcon;
  DestroyIcon(AInfo.hIcon);
end;

procedure cxSetExplorerNodeInfo(ANode: TcxTreeListNode; 
  const AData: TSearchRec; const APath: string);
var
  AValue: string;
begin
  with AData do
  begin
    AValue := ExtractFileExt(Name);
    ANode.Values[0] := Copy(Name, 1, Length(Name) - Length(AValue));
    if Length(AValue) > 0 then Delete(AValue, 1, 1);
    ANode.Values[1] := AnsiLowerCase(AValue);
    ANode.Data := Pointer(Attr);
    if (Attr and faDirectory = 0) then
    begin
      ANode.Values[3] := FileDateToDateTime(Time);
      ANode.Values[2] := Size;
    end
    else
        ANode.Values[2] := -1;
  end;
  ANode.ImageIndex := GetIconIndex(DoRestorePath(ANode), ANode.Expanded);
  ANode.SelectedIndex := ANode.ImageIndex;
end;

procedure cxScanDir(ATreeList: TcxTreeList;
  AParent: TcxTreeListNode; const APath: string);
var
 ASubNode: TcxTreeListNode;
 ASearchData: TSearchRec;
begin
  ATreeList.BeginUpdate;
  try
    if FindFirst(APath + '*.*', faAnyFile, ASearchData) = 0 then
    begin
      with ASearchData do
      begin
        repeat
          if (Name <> '.') and (Name <> '..') then
          begin
            if (ASearchData.Attr and faDirectory <> 0) then
            begin
              ASubNode := ATreeList.AddNode(nil, AParent, nil, tlamAddChildFirst);
              ASubNode.HasChildren := True;
            end
            else
              ASubNode := ATreeList.AddNode(nil, AParent, nil, tlamAddChild);
            cxSetExplorerNodeInfo(ASubNode, ASearchData, APath);
          end;
        until FindNext(ASearchData) <> 0;
      end;
    end;
  finally
    FindClose(ASearchData);
    ATreeList.EndUpdate;
  end;
end;

constructor TfrmTreeListExplorer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  if styleIncSearch.Color <> clDefault then
    cbSearchColor.ColorValue := styleIncSearch.Color;
  if styleIncSearch.TextColor <> clDefault then
    cbSearchTextColor.ColorValue := styleIncSearch.TextColor;
  {FImageListHandle := SHGetFileInfo('C:\', 0, AInfo, SizeOf(AInfo),
    SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
  imgExplorer.Handle := FImageListHandle;}
  TreeList.Images := TreeListFeaturesDemoMainForm.imgExplorer;
  with TreeList do
  begin
    BeginUpdate;
    DoCreateDriversList;
    EndUpdate;
  end;
end;

procedure TfrmTreeListExplorer.ActivateDataSet;
begin
end;

procedure TfrmTreeListExplorer.DoInspectedObjectChanged;
begin
  inherited DoInspectedObjectChanged;
  chkIncSearch.Checked := TreeList.OptionsBehavior.IncSearch;
end;

procedure TfrmTreeListExplorer.FrameActivated;
begin
  inherited FrameActivated;

end;

class function TfrmTreeListExplorer.GetID: Integer;
begin
  Result := 28;
end;

procedure TfrmTreeListExplorer.tlUnboundCompare(Sender: TcxCustomTreeList;
  ANode1, ANode2: TcxTreeListNode; var ACompare: Integer);

  function GetNodeType(ANode: tcxTreeListNode): Integer;
  var
    AValue: Variant;
  begin
    AValue := ANode.Values[clnSize.ItemIndex];
      if VarIsNull(AValue) then
        Result := -3
      else
        if(AValue < 0) then
          Result := AValue
        else Result := 0;
  end;

var
  I: Integer;
begin
  ACompare := CompareValue(GetNodeType(ANode1), GetNodeType(ANode2));
  if(ACompare = 0) then
  begin
    for I := 0 to TreeList.SortedColumnCount - 1 do
    begin
      ACompare := VarCompare(ANode1.Values[TreeList.SortedColumns[I].ItemIndex], ANode2.Values[TreeList.SortedColumns[I].ItemIndex]);
      if (TreeList.SortedColumns[I].SortOrder = soDescending) then
        ACompare := ACompare * -1;
      if(ACompare <> 0) then break;
    end;
  end;
end;

procedure TfrmTreeListExplorer.tlUnboundExpanded(Sender: TcxCustomTreeList;
  ANode: TcxTreeListNode);
begin
  ANode.HasChildren := ANode.Count > 0;
end;

procedure TfrmTreeListExplorer.tlUnboundExpanding(Sender: TcxCustomTreeList;
  ANode: TcxTreeListNode; var Allow: Boolean);
begin
  if ANode.Count = 0 then DoScanDir(ANode);
end;

procedure TfrmTreeListExplorer.tlUnboundGetNodeImageIndex(
  Sender: TcxCustomTreeList; ANode: TcxTreeListNode;
  AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
begin
  if ANode.Expanded then
    AIndex := GetIconIndex(DoRestorePath(ANode), ANode.Expanded);
end;

procedure TfrmTreeListExplorer.cbSearchColorPropertiesEditValueChanged(
  Sender: TObject);
begin
  styleIncSearch.Color := cbSearchColor.ColorValue;
end;

procedure TfrmTreeListExplorer.cbSearchTextColorPropertiesEditValueChanged(
  Sender: TObject);
begin
  styleIncSearch.TextColor := cbSearchTextColor.ColorValue;
end;

procedure TfrmTreeListExplorer.chkIncSearchPropertiesEditValueChanged(
  Sender: TObject);
begin
  TreeList.OptionsBehavior.IncSearch := chkIncSearch.Checked;
end;

procedure TfrmTreeListExplorer.clnSizeGetDisplayText(Sender: TcxTreeListColumn;
  ANode: TcxTreeListNode; var Value: string);
var
  ASize: Integer;
begin
  if(Value = '-1') then
    Value := 'DIR\'
  else
    if (Value = '-2') or (Value = '-3') then
      Value := ''
    else
    begin
      if not VarIsNull(ANode.Values[clnSize.ItemIndex]) then
        ASize := ANode.Values[clnSize.ItemIndex]
      else ASize := 0;
      if(ASize < 1024) then
        Value := Value + ' Bytes'
      else Value := IntToStr(ASize div 1024) + ' KB';
    end;
end;

procedure TfrmTreeListExplorer.DoCreateDriversList;
var
//  AType: Integer;
  I, ALen: Integer;
  S, Value: string;
  ANode: TcxTreeListNode;

const
  DriversDescription: array[0..6] of string =
  ('UNKNOWN', 'ROOT_DIR', 'REMOVABLE', 'FIXED', 'REMOTE', 'CDROM', 'RAMDISK');

begin
  TreeList.BeginUpdate;
  try
    ALen := GetLogicalDriveStrings(0, nil);
    SetLength(Value, ALen);
    GetLogicalDriveStrings(ALen, @Value[1]);
    I := 1;
    DiskDrives := UnboundTreeList.Add(nil);
    DiskDrives.Values[0] := 'All hard drives...';
    DiskDrives.Values[2] := -3;
    while I < ALen do
    begin
      S := Copy(Value, I, 3);
      Inc(I, Length(S) + 1);
//      AType := GetDriveType(PChar(S));
      if Pos('\', S) <> 0 then Delete(S, Pos('\', S), 1);
      ANode := UnboundTreeList.AddChild(DiskDrives, Pointer(1));
      with  ANode do
      begin
        HasChildren := True;
        Values[0] := S;
        Values[2] := -2;//DriversDescription[AType];
      end;
      ANode.ImageIndex := GetIconIndex(DoRestorePath(ANode), ANode.Expanded);
      ANode.SelectedIndex := ANode.ImageIndex;
    end;
    DiskDrives.Expanded := True;
  finally
    TreeList.EndUpdate;
  end;
end;

procedure TfrmTreeListExplorer.DoScanDir(ANode: TcxTreeListNode);
begin
  if (ANode.Count > 0) or not ANode.HasChildren then Exit;
  DoScanDir(ANode, DoRestorePath(ANode));
end;

procedure TfrmTreeListExplorer.DoScanDir(ANode: TcxTreeListNode; const APath: string);
begin
  cxScanDir(UnboundTreeList, ANode, APath);
end;

initialization
  TfrmTreeListExplorer.Register;

end.
