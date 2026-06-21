unit DevExUtil;

interface

uses
  DB,
  Classes,
  Forms,
  Dialogs,
  SysUtils,
  Controls,
  Windows,
  dxTL,
  dxDBCtrl,
  dxDBGrid,
  dxLayout,
  dxDBTLCl,
  dxGrClms;
  
Procedure SaveLayoutToDataSet(ADataSet: TDataSet; AFieldName: String;
  AGrid: TdxDBGrid; AParent: TWinControl);

Procedure LoadLayoutFromDataSet(ADataSet: TDataSet; AFieldName: String;
  AGrid: TdxDBGrid; AParent: TWinControl);
  
implementation

Procedure LoadLayoutFromDataSet(ADataSet: TDataSet; AFieldName: String;
  AGrid: TdxDBGrid; AParent: TWinControl);
Var
  Field: TBlobField;
Begin
  If ADataSet = Nil Then Exit;
  Field := ADataSet.FindField(AFieldName) As TBlobField;
  If Not ADataSet.CanModify Or (Field = Nil) Or (Field.DataType <>
    ftBlob) Then Exit;
  If (AGrid = Nil) Or (Field = nil) Or (Field.DataType <> ftBlob) Then Exit;
  Try
    LockWindowUpdate(AParent.Handle);
    Field.SaveToFile('temp.lay');
    AGrid.LoadFromIniFile('temp.lay');
  Finally
    LockWindowUpdate(0);
  End;
End;

Procedure SaveLayoutToDataSet(ADataSet: TDataSet; AFieldName: String;
  AGrid: TdxDBGrid; AParent: TWinControl);
Var
  Field: TBlobField;
  DataSetIsEdited: Boolean;
Begin
  If ADataSet = Nil Then Exit;
  Field := ADataSet.FindField(AFieldName) As TBlobField;

  If Not ADataSet.CanModify Or (Field = Nil) Or
    (Field.DataType <> ftBlob) Then Exit;
  DataSetIsEdited := ADataSet.State <> dsBrowse;
  Try
    LockWindowUpdate(AParent.Handle);
    AGrid.SaveToIniFile('temp.lay');
    Field.LoadFromFile('temp.lay');
    If Not DataSetIsEdited Then ADataSet.Post;
  Finally
    LockWindowUpdate(0);
  End;
End;

end.
 