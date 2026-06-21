unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner, dxTL, dxDBCtrl, dxDBGrid, DB, DBTables,
  dxDBTLCl, dxGrClms, StdCtrls, Buttons, dxLayout;

type
  TfrmMain = class(TForm)
    tblCustomers: TTable;
    tblLayouts: TTable;
    dsCustomers: TDataSource;
    dsLayouts: TDataSource;
    pnlTop: TPanel;
    grdMain: TdxDBGrid;
    Splitter: TSplitter;
    pnlLayouts: TPanel;
    grdLayouts: TdxDBGrid;
    grdLayoutsName: TdxDBGridMaskColumn;
    Panel1: TPanel;
    grdMainCustNo: TdxDBGridMaskColumn;
    grdMainCompany: TdxDBGridMaskColumn;
    grdMainAddr1: TdxDBGridMaskColumn;
    grdMainAddr2: TdxDBGridMaskColumn;
    grdMainCity: TdxDBGridMaskColumn;
    grdMainState: TdxDBGridMaskColumn;
    grdMainZip: TdxDBGridMaskColumn;
    grdMainCountry: TdxDBGridMaskColumn;
    grdMainPhone: TdxDBGridMaskColumn;
    grdMainFAX: TdxDBGridMaskColumn;
    grdMainTaxRate: TdxDBGridMaskColumn;
    grdMainContact: TdxDBGridMaskColumn;
    grdMainLastInvoiceDate: TdxDBGridDateColumn;
    btnLoad: TBitBtn;
    btnSave: TBitBtn;
    btnDelete: TBitBtn;
    Image1: TImage;
    Label1: TLabel;
    btnCustomize: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnCustomizeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

Procedure LoadLayoutFromDataSet(ADataSet: TDataSet; AFieldName: String;
  AGrid: TdxDBGrid; AParent: TWinControl);
Var
  Field: TBlobField;
  Stream: TMemoryStream;
  Layout: TdxDBGridLayout;
Begin
  If ADataSet = Nil Then Exit;
  Field := ADataSet.FindField(AFieldName) As TBlobField;
  If Not ADataSet.CanModify Or (Field = Nil) Or (Field.DataType <>
    ftBlob) Then Exit;
  If (AGrid = Nil) Or (Field = nil) Or (Field.DataType <> ftBlob) Then Exit;
  Layout := TdxDBGridLayout.Create(Application);
  Stream := TMemoryStream.Create;
  Try
    Field.SaveToStream(Stream);
    // Load memory stream into layout
    Stream.Position := 0;
    Layout.Active := False;
    Layout.Clear;
    Stream.ReadComponent(Layout);
    LockWindowUpdate(AParent.Handle);
    Layout.Active := False;
    AGrid.Assign(Layout);
  Finally
    Stream.Free;
    Layout.Free;
    LockWindowUpdate(0);
  End;
End;

Procedure SaveLayoutToDataSet(ADataSet: TDataSet; AFieldName: String;
  AGrid: TdxDBGrid; AParent: TWinControl);
Var
  Field: TBlobField;
  Stream: TMemoryStream;
  Layout: TdxDBGridLayout;
  DataSetIsEdited: Boolean;
Begin
  If ADataSet = Nil Then Exit;
  Field := ADataSet.FindField(AFieldName) As TBlobField;

  If Not ADataSet.CanModify Or (Field = Nil) Or
    (Field.DataType <> ftBlob) Then Exit;
  DataSetIsEdited := ADataSet.State <> dsBrowse;
  Layout := TdxDBGridLayout.Create(Application);
  Stream := TMemoryStream.Create;
  Try
    LockWindowUpdate(AParent.Handle);
    Layout.Active := False;
    Layout.DBGridParent := AGrid.Parent;
    Layout.Assign(AGrid);
    Layout.Active := False;
    Stream.WriteComponent(Layout);
    Field.LoadFromStream(Stream);
    If Not DataSetIsEdited Then ADataSet.Post;
  Finally
    Stream.Free;
    Layout.Free;
    LockWindowUpdate(0);
  End;
End;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  tblLayouts.Active := False;
  tblLayouts.DatabaseName := ExtractFilePath(Application.ExeName);
  tblLayouts.Active := True;
  tblCustomers.Active := True;
end;

procedure TfrmMain.btnCustomizeClick(Sender: TObject);
begin
  If grdMain.IsCustomizing Then
    grdMain.EndColumnsCustomizing
  Else
    grdMain.ColumnsCustomizing;
end;

procedure TfrmMain.btnDeleteClick(Sender: TObject);
begin
  If tblLayouts.RecordCount > 0 Then
    tblLayouts.Delete;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  grdMain.SetFocus;
  grdMain.TopNode.Focused := True;
  grdLayouts.TopNode.Focused := True;
end;

procedure TfrmMain.btnSaveClick(Sender: TObject);
Var
  AName: String;
begin
  AName := '';
  If InputQuery(Application.Title, 'Please enter a name for the layout:',
    AName) Then Begin
    tblLayouts.Append;
    tblLayouts.FieldByName('Name').AsString := AName;
    SaveLayoutToDataSet(tblLayouts, 'Data', grdMain, frmMain);
    tblLayouts.Post;
  End;
end;

procedure TfrmMain.btnLoadClick(Sender: TObject);
begin
  LoadLayoutFromDataSet(tblLayouts, 'Data', grdMain, frmMain);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  tblCustomers.Active := False;
  tblLayouts.Active := False;
end;

end.
