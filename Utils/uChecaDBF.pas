unit uChecaDBF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, uFrmImp;


procedure ChecaTabela(T: TTable; ImportaDados, MostraFrm: Boolean);


implementation

function TableIgual(T1, T2: TDBF): Boolean;
var 
  I : Integer;
  F : TFieldDef;
  X : TIndexDef;
begin
  Result := False;

  with T1 do 
  for I := 0 to pred(FieldDefs.Count) do 
  with FieldDefs.Items[I] do begin
    if T2.FieldDefs.IndexOf(Name)<0 then Exit;
    F := T2.FieldDefs.Find(Name);
    if F.DataType <> DataType then Exit;
    if F.Attributes <> Attributes then Exit;
    if F.Required <> Required then Exit;
    if F.Size <> Size then Exit;
    if F.Precision <> Precision then Exit;
  end;  

  with T2 do 
  for I := 0 to pred(FieldDefs.Count) do 
  with FieldDefs[I] do 
    if T1.FieldDefs.IndexOf(Name)<0 then Exit;

  with T1 do 
  for I := 0 to pred(IndexDefs.Count) do 
  with IndexDefs[I] do begin
    if T2.IndexDefs.IndexOf(Name)<0 then Exit;
    X := T2.IndexDefs.Find(Name);
    if X.FieldExpression <> FieldExpression then Exit;
    if X.CaseInsFields <> CaseInsFields then Exit;
    if X.DescFields <> DescFields then Exit;
    if X.Expression <> Expression then Exit;
    if X.Fields <> Fields then Exit;
    if X.Options <> Options then Exit;
    if X.Source <> Source then Exit;
    if X.GroupingLevel <> GroupingLevel then Exit;
  end;  

  with T2 do 
  for I := 0 to pred(IndexDefs.Count) do 
  with IndexDefs[I] do 
    if T1.IndexDefs.IndexOf(Name)<0 then Exit;
    
  Result := True;
end;

procedure TransfDados(TF, TD: TDataset);
var 
  F : TField;
  I : Integer;
begin
  TF.First;
  while not TF.Eof do begin
    TD.Insert;
    for I := 0 to pred(TD.Fields.Count) do with TD.Fields[I] do begin
      F := TF.FindField(FieldName);
      if F <> nil then
      try
        Value := F.Value;
      except
        Clear;
      end;  
    end;  
    TD.Post;  
    TF.Next;
  end;
end;


procedure ChecaTabela(T: TDBF; ImportaDados, MostraFrm: Boolean);
var 
  A: TDBF;
begin
  if not T.Exists then begin
    T.CreateTable;
    Exit;
  end;
    
  A := TDBF.Create(nil);
  try
    A.SessionName := T.SessionName;
    A.DatabaseName := T.DatabaseName;
    A.TableName := T.TableName;
    A.FieldDefs.Update;
    A.IndexDefs.Update;

    if not TableIgual(T, A) then begin
      A.TableName := '_' + A.TableName;
      if A.Exists then A.DeleteTable;
      A.TableName := T.TableName;
      A.RenameTable('_' + A.TableName);
      T.CreateTable;
      if ImportaDados then begin
        A.Open;
        T.Open;
        if MostraFrm then
          TFrmImp.Create(nil).TransfDados(A, T)
        else  
          TransfDados(A, T);
          
        T.Close;
        A.Close;
      end;  
    end;  
    
  finally
    A.Free;
  end;
end;


end.
