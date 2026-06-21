unit Main;

interface

uses
  {$I dxSkins.inc}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, ExtCtrls, dxdborgc, dxorgchr, ComCtrls,
  Menus, StdCtrls, Spin, cxGraphics, cxControls, cxLookAndFeels, cxClasses,
  cxLookAndFeelPainters, ImgList, cxPC, cxButtons, dxSkinsCore, dxBar, cxStyles,
  dxDemoUtils, dxSkinsForm, dxSkinsdxBarPainter, dxSkinscxPCPainter,
  cxEdit, cxMaskEdit, cxCalendar, cxSpinEdit, cxImageComboBox, cxColorComboBox,
  cxVGrid, cxDBVGrid, cxInplaceContainer, cxTextEdit, cxDropDownEdit, DBClient;

type
  TMainForm = class(TForm)
    ilTree: TcxImageList;
    DBTree: TdxDbOrgChart;
    dxBarManager1: TdxBarManager;
    dxbMain: TdxBar;
    Exit1: TdxBarButton;
    File1: TdxBarSubItem;
    AddNode1: TdxBarButton;
    AddChildeNode1: TdxBarButton;
    RenameNode1: TdxBarButton;
    DeleteNode1: TdxBarButton;
    Edit1: TdxBarSubItem;
    ItZoom: TdxBarButton;
    ItRotated: TdxBarButton;
    ItAnimated: TdxBarButton;
    miAntialiasing: TdxBarButton;
    It3D: TdxBarButton;
    miLooknFeel: TdxBarSubItem;
    ItFullExpand: TdxBarButton;
    ItFullCollapse: TdxBarButton;
    View1: TdxBarSubItem;
    Options1: TdxBarButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    miHelp: TdxBarSubItem;
    Button1: TButton;
    dxSkinController: TdxSkinController;
    cxPageControl1: TcxPageControl;
    tsDBOrgChart: TcxTabSheet;
    Splitter2: TSplitter;
    tsOrgChart: TcxTabSheet;
    Tree: TdxOrgChart;
    Panel1: TPanel;
    btnEdit: TcxButton;
    DataSource: TDataSource;
    cxDBVerticalGrid1: TcxDBVerticalGrid;
    cxDBVerticalGrid1NAME1: TcxDBEditorRow;
    cxDBVerticalGrid1CDATE1: TcxDBEditorRow;
    cxDBVerticalGrid1WIDTH1: TcxDBEditorRow;
    cxDBVerticalGrid1HEIGHT1: TcxDBEditorRow;
    cxDBVerticalGrid1TYPE1: TcxDBEditorRow;
    cxDBVerticalGrid1COLOR1: TcxDBEditorRow;
    cxDBVerticalGrid1IMAGE1: TcxDBEditorRow;
    cxDBVerticalGrid1IMAGEALIGN1: TcxDBEditorRow;
    cxDBVerticalGrid1ALIGN1: TcxDBEditorRow;
    Bevel3: TBevel;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1ID: TAutoIncField;
    ClientDataSet1PARENT: TIntegerField;
    ClientDataSet1NAME: TStringField;
    ClientDataSet1CDATE: TDateField;
    ClientDataSet1CBY: TStringField;
    ClientDataSet1WIDTH: TIntegerField;
    ClientDataSet1HEIGHT: TIntegerField;
    ClientDataSet1TYPE: TStringField;
    ClientDataSet1COLOR: TIntegerField;
    ClientDataSet1IMAGE: TIntegerField;
    ClientDataSet1IMAGEALIGN: TStringField;
    ClientDataSet1ORDER: TIntegerField;
    ClientDataSet1ALIGN: TStringField;
    procedure AddChildeNode1Click(Sender: TObject);
    procedure AddNode1Click(Sender: TObject);
    procedure DBTreeCreateNode(Sender: TObject; Node: TdxOcNode);
    procedure DeleteNode1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure It3DClick(Sender: TObject);
    procedure ItAnimatedClick(Sender: TObject);
    procedure ItFullCollapseClick(Sender: TObject);
    procedure ItFullExpandClick(Sender: TObject);
    procedure ItRotatedClick(Sender: TObject);
    procedure ItZoomClick(Sender: TObject);
    procedure Options1Click(Sender: TObject);
    procedure RenameNode1Click(Sender: TObject);
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure ClientDataSet1ALIGNChange(Sender: TField);
    procedure ClientDataSet1IMAGEALIGNChange(Sender: TField);
    procedure ClientDataSet1TYPEChange(Sender: TField);
    procedure TreeCreateNode(Sender: TObject; Node: TdxOcNode);
    procedure miAntialiasingClick(Sender: TObject);
    procedure ClientDataSet1HEIGHTChange(Sender: TField);
    procedure ClientDataSet1WIDTHChange(Sender: TField);
    procedure ClientDataSet1COLORChange(Sender: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxPageControl1Change(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    FAllowChanges: Boolean;
    function AddNode(AChild: Boolean): TdxOcNode;
    procedure UpdateOptions;
    function GetShape(const AShapeName: String): TdxOcShape;
    function GetNodeAlign(const AAlignName: string): TdxOcNodeAlign;
    function GetImageAlign(const AAlignName: string): TdxOcImageAlign;
  public
    function GetActiveOrgChart: TdxCustomOrgChart;
    //
    property ActiveOrgChart: TdxCustomOrgChart read GetActiveOrgChart;
  end;

var
  MainForm: TMainForm;

implementation

uses
  Options, dxorgcedadv;

{$R *.DFM}

type
  TdxCustomOrgChartAccess = class(TdxCustomOrgChart);

{ TMainForm }

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (ClientDataSet1.State = dsEdit) or (ClientDataSet1.State = dsInsert) then ClientDataSet1.Post;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ClientDataSet1.Open;
  DBTree.WidthFieldName  := 'Width';
  DBTree.HeightFieldName := 'Height';
  CreateHelpMenuItems(dxBarManager1, miHelp);
  CreateSkinsMenuItems(dxBarManager1, miLooknFeel, dxSkinController);
  UpdateOptions;
  FAllowChanges := True;
end;

function TMainForm.AddNode(AChild: Boolean): TdxOcNode;
var
  ATree: TdxCustomOrgChartAccess;
begin
  ATree := TdxCustomOrgChartAccess(ActiveOrgChart);
  if ATree.Selected = nil then
    Result := ATree.Add(nil, nil)
  else
  begin
    if AChild then
      Result := ATree.AddChild(ATree.Selected, nil)
    else
      Result := ATree.Insert(ATree.Selected, nil);
    DBTree.Selected.Expanded := True;
  end;
  Result.Text := 'New topic';
  Result.Color := clWhite;
  Result.Shape := shRectangle;
  ATree.Selected := Result;
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.AddNode1Click(Sender: TObject);
begin
  ClientDataSet1.DisableControls;
  try
    AddNode(False);
  finally
    ClientDataSet1.EnableControls;
  end;
end;

procedure TMainForm.btnEditClick(Sender: TObject);
begin
  ShowOrgChartEditor(Tree);
  UpdateOptions;
end;

procedure TMainForm.cxPageControl1Change(Sender: TObject);
begin
  UpdateOptions;
end;

procedure TMainForm.AddChildeNode1Click(Sender: TObject);
begin
  ClientDataSet1.DisableControls;
  try
    AddNode(True);
  finally
    ClientDataSet1.EnableControls;
  end;
end;

procedure TMainForm.RenameNode1Click(Sender: TObject);
begin
  if TdxCustomOrgChartAccess(ActiveOrgChart).Selected <> nil then
    TdxCustomOrgChartAccess(ActiveOrgChart).ShowEditor;
end;

procedure TMainForm.DeleteNode1Click(Sender: TObject);
var
  ATree: TdxCustomOrgChartAccess;
begin
  ATree := TdxCustomOrgChartAccess(ActiveOrgChart);
  if ATree.Selected <> nil then
    ATree.Delete(ATree.Selected);
end;

procedure TMainForm.UpdateOptions;
begin
  miAntialiasing.Down := DBTree.Antialiasing;
  ItAnimated.Down := ocAnimate in DBTree.Options;
  It3D.Down := ocRect3D in DBTree.Options;
  ItRotated.Down := DBTree.Rotated;
  ItZoom.Down := DBTree.Zoom;
end;

procedure TMainForm.ItZoomClick(Sender: TObject);
begin
  TdxCustomOrgChartAccess(ActiveOrgChart).Zoom := TdxBarButton(Sender).Down;
end;

procedure TMainForm.miAntialiasingClick(Sender: TObject);
begin
  TdxCustomOrgChartAccess(ActiveOrgChart).Antialiasing := TdxBarButton(Sender).Down;
end;

procedure TMainForm.ItRotatedClick(Sender: TObject);
begin
  TdxCustomOrgChartAccess(ActiveOrgChart).Rotated := TdxBarButton(Sender).Down;
end;

procedure TMainForm.ItAnimatedClick(Sender: TObject);
var
  ATree: TdxCustomOrgChartAccess;
begin
  ATree := TdxCustomOrgChartAccess(ActiveOrgChart);
  if TdxBarButton(Sender).Down then
    ATree.Options := ATree.Options + [ocAnimate]
  else
    ATree.Options := ATree.Options - [ocAnimate];
end;

procedure TMainForm.It3DClick(Sender: TObject);
var
  ATree: TdxCustomOrgChartAccess;
begin
  ATree := TdxCustomOrgChartAccess(ActiveOrgChart);
  if TdxBarButton(Sender).Down then
    ATree.Options := ATree.Options + [ocRect3D]
  else
    ATree.Options := ATree.Options - [ocRect3D];
end;

procedure TMainForm.ItFullExpandClick(Sender: TObject);
begin
  TdxCustomOrgChartAccess(ActiveOrgChart).FullExpand;
end;

procedure TMainForm.ItFullCollapseClick(Sender: TObject);
begin
  TdxCustomOrgChartAccess(ActiveOrgChart).FullCollapse;
end;

procedure TMainForm.Options1Click(Sender: TObject);
begin
  OptionsForm.ShowModal;
end;

procedure TMainForm.DBTreeCreateNode(Sender: TObject; Node: TdxOcNode);
begin
  if ClientDataSet1.FindField('width').AsInteger > 50 then
    Node.Width := ClientDataSet1.FindField('width').AsInteger;
  if ClientDataSet1.FindField('height').AsInteger > 50 then
    Node.Height := ClientDataSet1.FindField('height').AsInteger;
  Node.Shape := GetShape(ClientDataSet1.FindField('type').AsString);
  Node.Color := ClientDataSet1.FindField('color').AsInteger;
  Node.ChildAlign := GetNodeAlign(ClientDataSet1.FindField('Align').AsString);
  Node.ImageAlign := GetImageAlign(ClientDataSet1.FindField('ImageAlign').AsString);
end;

procedure TMainForm.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  ClientDataSet1.FindField('Height').AsInteger := DBTree.DefaultNodeHeight;
  ClientDataSet1.FindField('Width').AsInteger := DBTree.DefaultNodeWidth;
  ClientDataSet1.FindField('Type').AsString := 'Rectangle';
  ClientDataSet1.FindField('Color').AsInteger := clWhite;
  ClientDataSet1.FindField('Image').AsInteger := -1;
  ClientDataSet1.FindField('ImageAlign').AsString := 'Left-Top';
  ClientDataSet1.FindField('Align').AsString := 'Center';
end;

procedure TMainForm.ClientDataSet1TYPEChange(Sender: TField);
begin
  if ClientDataSet1.State = dsEdit then
    DBTree.Selected.Shape := TdxOcShape(Sender.AsInteger);
end;

procedure TMainForm.ClientDataSet1WIDTHChange(Sender: TField);
begin
  if ClientDataSet1.State = dsEdit then
    DBTree.Selected.Width := Sender.AsInteger
end;

procedure TMainForm.ClientDataSet1ALIGNChange(Sender: TField);
begin
  if ClientDataSet1.State = dsEdit then
    DBTree.Selected.ChildAlign := TdxOcNodeAlign(Sender.AsInteger);
end;

procedure TMainForm.ClientDataSet1COLORChange(Sender: TField);
begin
  if ClientDataSet1.State = dsEdit then
    DBTree.Selected.Color := Sender.AsInteger;
end;

procedure TMainForm.ClientDataSet1HEIGHTChange(Sender: TField);
begin
  if ClientDataSet1.State = dsEdit then
    DBTree.Selected.Height := Sender.AsInteger
end;

function TMainForm.GetActiveOrgChart: TdxCustomOrgChart;
begin
  if cxPageControl1.ActivePage = tsOrgChart then
    Result := Tree
  else
    Result := DBTree;
end;

procedure TMainForm.ClientDataSet1IMAGEALIGNChange(Sender: TField);
begin
  if ClientDataSet1.State = dsEdit then
    DBTree.Selected.ImageAlign := TdxOcImageAlign(Sender.AsInteger);
end;

function TMainForm.GetImageAlign(const AAlignName: string): TdxOcImageAlign;
const
  AlignMap: array[TdxOcImageAlign] of string = (
   'None',
   'Left-Top', 'Left-Center', 'Left-Bottom',
   'Right-Top', 'Right-Center', 'Right-Bottom',
   'Top-Left', 'Top-Center', 'Top-Right',
   'Bottom-Left', 'Bottom-Center', 'Bottom-Right');
var
  AIndex: TdxOcImageAlign;
begin
  Result := Low(TdxOcImageAlign);
  for AIndex := Low(TdxOcImageAlign) to High(TdxOcImageAlign) do
    if SameText(AlignMap[AIndex], AAlignName) then
    begin
      Result := AIndex;
      Break;
    end;
end;

function TMainForm.GetNodeAlign(const AAlignName: string): TdxOcNodeAlign;
const
  AlignMap: array[TdxOcNodeAlign] of string = ('Left', 'Center', 'Right');
var
  AIndex: TdxOcNodeAlign;
begin
  Result := Low(TdxOcNodeAlign);
  for AIndex := Low(TdxOcNodeAlign) to High(TdxOcNodeAlign) do
    if SameText(AlignMap[AIndex], AAlignName) then
    begin
      Result := AIndex;
      Break;
    end;
end;

function TMainForm.GetShape(const AShapeName: String): TdxOcShape;
const
  ShapeMap: array[TdxOcShape] of string = ('Rectange', 'Round Rect', 'Ellipse', 'Diamond');
var
  AIndex: TdxOcShape;
begin
  Result := Low(TdxOcShape);
  for AIndex := Low(TdxOcShape) to High(TdxOcShape) do
    if SameText(ShapeMap[AIndex], AShapeName) then
    begin
      Result := AIndex;
      Break;
    end;
end;

procedure TMainForm.TreeCreateNode(Sender: TObject; Node: TdxOcNode);
begin
  with Node do
  begin
    Shape := shRectangle;
    Color := clWhite;
    Node.ChildAlign := caCenter;
    Node.ImageAlign := iaLT;
  end;
end;

initialization
  dxMegaDemoProductIndex := dxOrgChartIndex;

end.
