(**********************************************************************************)
(* Code generated with NexusDB Enterprise Manager Data Dictionary Code Generator  *)
(*                                                                                *)
(* Version: 3,0401                                                                *)
(*                                                                                *)
(**********************************************************************************)

unit ncProdD;

interface

uses
  nxdb,
  nxsdTypes,
  nxsdDataDictionary;

  procedure BuildDatabase(aDatabase : TnxDatabase;
    const aPassword : String = '');

  function TableCount: Integer;
  function GetTableDictionary(aDatabase : TnxDatabase; const aTableName : String): TnxDataDictionary;

implementation

uses
  {$IFDEF NXWINAPI}nxWinAPI{$ELSE}Windows{$ENDIF},
  Classes,
  Math,
  SysUtils,
  StrUtils,
  Variants,
  DBCommon,
  nxllTypes,
  nxllBde,
  nxllException,
  nxllWideString,
  nxsdConst,
  nxsdDataDictionaryStrings,
  nxsdDataDictionaryRefInt,
  nxsdDataDictionaryFulltext,
  nxsdFilterEngineSimpleExpression,
  nxsdFilterEngineSql,
  nxsdServerEngine,
  nxsdTableMapperDescriptor;

type
  TnxcgCreateDictCallback = function(aDatabase : TnxDatabase): TnxDataDictionary;

// prodd
function __prodd(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('codbar', '', nxtShortString, 14, 0, True);
        AddField('fk_user', '', nxtInt32, 10, 0, False);
        AddField('descricao', '', nxtShortString, 55, 0, False);
        AddField('unid', '', nxtShortString, 5, 0, False);
        AddField('imagem', '', nxtBLOBGraphic, 0, 0, False);
        AddField('md5', '', nxtShortString, 32, 0, False);
        AddField('categoria', '', nxtShortString, 35, 0, False);
        with AddField('id_upd', '', nxtWord32, 10, 0, True) do
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
            AsVariant := 1;
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('pk', 0, idNone), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('codbar'));
        with AddIndex('fk_user', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('fk_user'));
        with AddIndex('uq_codbar', 0, idNone), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('codbar'));
          Add(GetFieldFromName('fk_user'));
        end;
        with AddIndex('ix_descricao', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('descricao'));
        with AddIndex('ix_unid', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('unid'));
        with AddIndex('ix_categoria', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('categoria'));
        with AddIndex('ix_md5', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('md5'));
        with AddIndex('ix_upd', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          with Add(GetFieldFromName('id_upd')) do begin
            Ascend := False;
            NullBehaviour := nbBottom;
          end;
        if GetIndexFromName('Sequential Access Index') >= 0 then
          RemoveIndex(GetIndexFromName('Sequential Access Index'));
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

type
  TnxcgTableInfo = record
    TableName : String;
    Callback : TnxcgCreateDictCallback;
  end;

const
  TableInfos : array[0..0] of TnxcgTableInfo =
    ((TableName : 'prodd'; Callback : __prodd));

function TableCount: Integer;
begin
  Result := Length(TableInfos);
end;

function GetTableDictionary(aDatabase : TnxDatabase; const aTableName : String): TnxDataDictionary;
var
  I : Integer;
begin
  Result := nil;
  for I := Low(TableInfos) to High(TableInfos) do
    if SameText(aTableName, TableInfos[I].TableName) then begin
      Result := TableInfos[I].Callback(aDatabase);
      break;
    end;
end;

procedure BuildTable(aDatabase : TnxDatabase;
  const aTableName, aPassword : String;
  aCreateDictCallback : TnxcgCreateDictCallback);
var
  Dict : TnxDataDictionary;
begin
  Dict := aCreateDictCallback(aDatabase);
  if Assigned(Dict) then
    try
      if not aDatabase.TableExists(aTableName, aPassword) then
        aDatabase.CreateTable(False, aTableName, aPassword, Dict);
    finally
      Dict.Free;
    end;
end;

procedure BuildDatabase(aDatabase : TnxDatabase;
  const aPassword : String);
var
  I : Integer;
begin
  for I := Low(TableInfos) to High(TableInfos) do
    BuildTable(aDatabase,
      TableInfos[I].TableName, aPassword,
      TableInfos[I].Callback);
end;

end.
