unit uChecaTDBF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBF, DB, StdCtrls, uFrmImp, DBF_Fields;


procedure ChecaTabela(T: TDBF; ImportaDados, MostraFrm: Boolean);


implementation

function GetFieldDefIndex(FD: TDBFFieldDefs; FieldName: String): Integer;
begin
  with FD do
  for Result := 0 to Count-1 do 
  if Items[Result].FieldName=FieldName then 
    Exit;
  Result := -1;
end;

function GetFieldDef(FD: TDBFFieldDefs; Name: String): TDBFFieldDef;
var I : Integer;
begin
  I := GetFieldDefIndex(FD, Name);
  if I<>-1 then
    Result := FD.Items[I]
  else
    Result := nil;  
end;


function TableIgual(T1, T2: TDBF): Boolean;
var 
  I, Ix : Integer;
  F : TField;
  X : TIndexDef;
  S : String;
begin
  Result := False;
  with T1 do
  for I := 0 to pred(FieldList.Count) do
  with FieldList[I] do begin
    S := FieldName;
    F := T2.FieldList.Find(S);
    if F=nil then Exit;
    if F.DataType <> DataType then Exit;
    if F.Required <> Required then Exit;
    if F.DataSize <> DataSize then Exit;
  end;

{  with T2 do
  for I := 0 to pred(FieldDefs.Count) do
  with FieldDefs.Items[I] do
    if GetFieldDefIndex(T1.FieldDefs, Name)<0 then Exit;}

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
  if not FileExists(T.FilePath + T.TableName) then begin
    T.CreateTable;
    Exit;
  end;
    
  A := TDBF.Create(nil);
  try
    A.FilePath  := T.FilePath;
    A.TableName := T.TableName;
    try
      A.Active := True;
    except
      DeleteFile(T.FilePath + T.TableName);
      T.CreateTable;
      Exit;
    end;    

    if not TableIgual(T, A) then begin
      A.Active := False;
      A.TableName := '_' + A.TableName;
      if FileExists(A.FilePath + A.TableName) then 
        DeleteFile(A.FilePath + A.TableName);
        
      RenameFile(T.FilePath + T.TableName, A.FilePath + A.TableName);
      T.CreateTable;
      if ImportaDados then begin
        A.Open;
        T.Open;
        if MostraFrm then
          TFrmImp.Create(nil).TransfDados(A, T, T.TableName)
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
