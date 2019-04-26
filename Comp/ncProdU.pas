(**********************************************************************************)
(* Code generated with NexusDB Enterprise Manager Data Dictionary Code Generator  *)
(*                                                                                *)
(* Version: 3,0401                                                                *)
(*                                                                                *)
(**********************************************************************************)

unit ncProdU;

interface

uses
  nxdb,
  nxsdTypes,
  nxsdDataDictionary;

type
  TnxcgProgressCallback = 
    procedure(const aTableName : String;
      var aStatus : TnxTaskStatus;
      var aCancel : Boolean) of object;

  procedure BuildAndEvolveProduComIndices(aDatabase : TnxDatabase;
    aProgressCallback : TnxcgProgressCallback = nil;
    const aPassword : String = '');

  procedure RestructureProduComIndices(aDatabase : TnxDatabase;
    aProgressCallback : TnxcgProgressCallback = nil;
    const aPassword : String = '');

  procedure RestructureProduSemIndices(aDatabase : TnxDatabase;
    aProgressCallback : TnxcgProgressCallback = nil;
    const aPassword : String = '');

  procedure PackProdu(aDatabase : TnxDatabase;
    aProgressCallback : TnxcgProgressCallback = nil;
    const aPassword : String = '');


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

// produ
function __produComIndices(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      with FilesDescriptor do
        AddFile('idx', nxbs4K, 'indices');
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('id', '', nxtAutoInc, 10, 0, False);
        AddField('codbar', '', nxtShortString, 14, 0, True);
        AddField('descricao', '', nxtShortString, 55, 0, False);
        AddField('unid', '', nxtShortString, 5, 0, False);
        AddField('imagem', '', nxtBLOBGraphic, 0, 0, False);
        AddField('md5', '', nxtShortString, 32, 0, False);
        AddField('categoria', '', nxtShortString, 35, 0, False);
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('pk', 1, idNone), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('id'));
        with AddIndex('idx_codbar', 1, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('codbar'));
        if GetIndexFromName('Sequential Access Index') >= 0 then
          RemoveIndex(GetIndexFromName('Sequential Access Index'));
        DefaultIndex := GetIndexFromName('pk');
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function __produSemIndices(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('id', '', nxtAutoInc, 10, 0, False);
        AddField('codbar', '', nxtShortString, 14, 0, True);
        AddField('descricao', '', nxtShortString, 55, 0, False);
        AddField('unid', '', nxtShortString, 5, 0, False);
        AddField('imagem', '', nxtBLOBGraphic, 0, 0, False);
        AddField('md5', '', nxtShortString, 32, 0, False);
        AddField('categoria', '', nxtShortString, 35, 0, False);
      end;
      with EnsureIndicesDescriptor do begin
        if GetIndexFromName('pk') >= 0 then
          RemoveIndex(GetIndexFromName('pk'));
        if GetIndexFromName('idx_codbar') >= 0 then
          RemoveIndex(GetIndexFromName('idx_codbar'));
      end;
      with FilesDescriptor do
        if GetFileFromExt('idx') >= 0 then
            RemoveFile(GetFileFromExt('idx'));
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

procedure RestructureTable(aDatabase : TnxDatabase;
  const aTableName, aPassword : String;
  aNewDict : TnxDataDictionary;
  aProgressCallback : TnxcgProgressCallback;
  var aCancelTask : Boolean;
  aFreeDict : Boolean = False);
var
  OldDict : TnxDataDictionary;
  Mapper : TnxTableMapperDescriptor;
  TaskInfo : TnxAbstractTaskInfo;
  Completed : Boolean;
  TaskStatus : TnxTaskStatus;
begin
  try
    OldDict := TnxDataDictionary.Create;
    try
      nxCheck(aDatabase.GetDataDictionaryEx(aTableName, aPassword, OldDict));
      if (aPassword <> '') and (aNewDict.EncryptionEngine = '') then
        aNewDict.EncryptionEngine := OldDict.EncryptionEngine;
      if OldDict.IsEqual(aNewDict) then
        Exit;
      Mapper := TnxTableMapperDescriptor.Create;
      try
        Mapper.MapAllTablesAndFieldsByName(OldDict, aNewDict);
        nxCheck(aDatabase.RestructureTableEx(aTableName, aPassword, aNewDict, Mapper, TaskInfo));
        if Assigned(TaskInfo) then
          try
            while True do begin
              TaskInfo.GetStatus(Completed, TaskStatus);
              if Assigned(aProgressCallback) then
                aProgressCallback(aTableName, TaskStatus, aCancelTask);
              if Completed then
                break;
              if aCancelTask then
                nxCheck(TaskInfo.Cancel);
            end;
          finally
            TaskInfo.Free;
          end;
      finally
        Mapper.Free;
      end;
    finally
      OldDict.Free;
    end;
  finally
    if aFreeDict then
      aNewDict.Free;
  end;
end;

procedure PackTable(aDatabase : TnxDatabase;
  const aTableName, aPassword : String;
  aProgressCallback : TnxcgProgressCallback;
  var aCancelTask : Boolean);
var
  TaskInfo : TnxAbstractTaskInfo;
  Completed : Boolean;
  TaskStatus : TnxTaskStatus;
begin
  nxCheck(aDatabase.PackTableEx(aTableName, aPassword, TaskInfo));
  if Assigned(TaskInfo) then
    try
      while True do begin
        TaskInfo.GetStatus(Completed, TaskStatus);
        if Assigned(aProgressCallback) then
          aProgressCallback(aTableName, TaskStatus, aCancelTask);
        if Completed then
          break;
        if aCancelTask then
          nxCheck(TaskInfo.Cancel);
      end;
    finally
      TaskInfo.Free;
    end;
end;

procedure BuildAndEvolveTable(aDatabase : TnxDatabase;
  const aTableName, aPassword : String;
  aCreateDictCallback : TnxcgCreateDictCallback;
  aProgressCallback : TnxcgProgressCallback;
  var aCancelTask : Boolean);
var
  Dict : TnxDataDictionary;
begin
  Dict := aCreateDictCallback(aDatabase);
  if Assigned(Dict) then
    try
      if not aDatabase.TableExists(aTableName, aPassword) then
        aDatabase.CreateTable(False, aTableName, aPassword, Dict)
      else
        RestructureTable(aDatabase, aTableName,
          aPassword, Dict, aProgressCallback, aCancelTask);
    finally
      Dict.Free;
    end;
end;

procedure BuildAndEvolveProduComIndices(aDatabase : TnxDatabase;
  aProgressCallback : TnxcgProgressCallback;
  const aPassword : String);
var
  CancelTask : Boolean;
begin
  CancelTask := False;
    BuildAndEvolveTable(aDatabase,
      'produ', aPassword,
      __produComIndices, aProgressCallback, CancelTask);
    if CancelTask then
      Exit;
end;

procedure RestructureProduComIndices(aDatabase : TnxDatabase;
  aProgressCallback : TnxcgProgressCallback;
  const aPassword : String);
var
  CancelTask : Boolean;
begin
  CancelTask := False;
    RestructureTable(aDatabase,
      'produ', aPassword,
      __produComIndices(aDatabase), aProgressCallback, CancelTask, True);
    if CancelTask then
      Exit;
end;

procedure RestructureProduSemIndices(aDatabase : TnxDatabase;
  aProgressCallback : TnxcgProgressCallback;
  const aPassword : String);
var
  CancelTask : Boolean;
begin
  CancelTask := False;
    RestructureTable(aDatabase,
      'produ', aPassword,
      __produSemIndices(aDatabase), aProgressCallback, CancelTask, True);
    if CancelTask then
      Exit;
end;

procedure PackProdu(aDatabase : TnxDatabase;
  aProgressCallback : TnxcgProgressCallback;
  const aPassword : String);
var
  CancelTask : Boolean;
begin
  CancelTask := False;
    PackTable(aDatabase, 'produ',
      aPassword, aProgressCallback, CancelTask);
    if CancelTask then
      Exit;
end;

end.

