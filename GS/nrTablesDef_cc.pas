(**********************************************************************************)
(* Code generated with NexusDB Enterprise Manager Data Dictionary Code Generator  *)
(*                                                                                *)
(* Version: 3,0101                                                                *)
(*                                                                                *)
(**********************************************************************************)

unit nrTablesDef_cc;

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

  procedure BuildAndEvolveDatabase(aDatabase : TnxDatabase;
    aProgressCallback : TnxcgProgressCallback = nil;
    const aPassword : String = '');

  procedure RestructureDatabase(aDatabase : TnxDatabase;
    aProgressCallback : TnxcgProgressCallback = nil;
    const aPassword : String = '');

  procedure PackDatabase(aDatabase : TnxDatabase;
    aProgressCallback : TnxcgProgressCallback = nil;
    const aPassword : String = '');

  function TableCount: Integer;
  function DatabaseVersion: Cardinal;
  function DatabaseVersionStr: String;
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

function __ChecaConta(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('DH', '', nxtDateTime, 10, 0, False);
        AddField('Versao', '', nxtNullString, 12, 0, False); 
        AddField('IP', '', nxtNulLString, 15, 0, False); 
        AddField('Loja', '', nxtWord32, 10, 0, False);
        AddField('UpdID', '', nxtInt64, 20, 0, False);
        AddField('AutID', '', nxtWord32, 10, 0, False);
        AddField('Maq', '', nxtWord16, 5, 0, False);   
        AddField('Admin', '', nxtBoolean, 3, 0, False);  
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('IUpdID', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('UpdID'));
          
        with AddIndex('ILoja', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('Loja'));
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
    ((TableName : 'ChecaConta'; Callback : __ChecaConta));

function TableCount: Integer;
begin
  Result := Length(TableInfos);
end;

function DatabaseVersion: Cardinal;
begin
  Result := Cardinal($01000000);
end;

function DatabaseVersionStr: String;
begin
  Result :=
    Format('%d.%d.%d.%d',
      [(DatabaseVersion and $ff000000) shr 24,
       (DatabaseVersion and $00ff0000) shr 16,
       (DatabaseVersion and $0000ff00) shr 8,
       (DatabaseVersion and $000000ff)]);
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
      if (aPassword <> ') and (aNewDict.EncryptionEngine = ') then
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

procedure BuildAndEvolveDatabase(aDatabase : TnxDatabase;
  aProgressCallback : TnxcgProgressCallback;
  const aPassword : String);
var
  I : Integer;
  CancelTask : Boolean;
begin
  CancelTask := False;
  for I := Low(TableInfos) to High(TableInfos) do begin
    BuildAndEvolveTable(aDatabase,
      TableInfos[I].TableName, aPassword,
      TableInfos[I].Callback, aProgressCallback, CancelTask);
    if CancelTask then
      Exit;
  end;
end;

procedure RestructureDatabase(aDatabase : TnxDatabase;
  aProgressCallback : TnxcgProgressCallback;
  const aPassword : String);
var
  I : Integer;
  CancelTask : Boolean;
begin
  CancelTask := False;
  for I := Low(TableInfos) to High(TableInfos) do begin
    RestructureTable(aDatabase,
      TableInfos[I].TableName, aPassword,
      TableInfos[I].Callback(aDatabase), aProgressCallback, CancelTask, True);
    if CancelTask then
      Exit;
  end;
end;

procedure PackDatabase(aDatabase : TnxDatabase;
  aProgressCallback : TnxcgProgressCallback;
  const aPassword : String);
var
  I : Integer;
  CancelTask : Boolean;
begin
  CancelTask := False;
  for I := Low(TableInfos) to High(TableInfos) do begin
    PackTable(aDatabase, TableInfos[I].TableName,
      aPassword, aProgressCallback, CancelTask);
    if CancelTask then
      Exit;
  end;
end;

end.

{
email_conta => email
proprietario=nome
cadastrocompletoem => dcadcom
loja = 
cidade
uf
Tel1=telefone
lictipo 
licvenc = dpremium
uversao = versao
campanha
cadastroem > dprecad
ativadoem > dconfemail
rediri > dprimredir
dinstalou > dobrigado
dbounce
dinativo
}


  Campos:
    Status      : Integer;
    StatusDesde : TDateTime;
    
    Recente: Boolean (True qdo cadastroem <= (date-2));
    Inativo: Boolean (UbtemLic < Date-5);
    ParouRedir: URedir < (Date-10);
    Premium: (LicTipo=5) and (LivVenc>=(Date-dias_premium));
    Usou: (RedirD >= 10)

    FezRedir: Boolean (True qdo URedir<>null);
    
    RedirU: Data do Ultimo Redir
    RedirD: Quantidades de dias em que houve redir  ... Quando alterar URedir somar 1
    Saiu: Boolean
    
    VaiVoltar      : Boolean;  call-center indicou que cliente informou que vai voltar;
    VaiVoltarAte   : TDateTime; 
    ContatoCCOk    : Boolean;
    ContatoCCFail  : Boolean;
    PContatoCCOk   : TDateTime;
    PContatoCCFail : TDateTime;
    UContatoCCOk   : TDateTime;
    UContatoCCFail : TDateTime;
    QContatoCCOK   : Word;
    QContatoCCFail : Word;
    AgenteCC       : Integer;    

Indices    
  IRecente : Recente, CadastroEm
  IInativo : Inativo, UObtemLic
  IParouRedir : ParouRedir, URedir
  IPremium : Premium, LicTipo, LicVenc
  IVaiVoltar : VaiVoltar, VaiVoltarEm 
  ISaiu   


Status 
 
  Novo:                 Recente, Premium=False, fezredir=false
  
  Entrante:             registrou a mais de 2 dias, nao tem redir, nao é premium e nao teve contato do call-center
  
  Em teste:             registrou a mais de 2 dias E não teve redir E nao é premium, MAS teve contato do call-center
  
  Em teste completo:    já fez redir E nao é premium
  
  Usando                premium OU redir por mais que 10 dias e não pode ficar 5 dias sem redir
  
  Limbo                 premium inativo OU (sem redir ou  parou redir) mas ativo
  
  Saindo                Inativo (5 dias ou mais sem contato) e nao é premium
  Saiu                  (Mais que 15 dias sem contato) e (VaiVoltar=False ou Null) 

  MotivoSaida: VaiVoltar, FechouLoja, TrocouPrograma, Recadastro, Desconhecido, BRANCO
  MotivoEm: 
  

    
