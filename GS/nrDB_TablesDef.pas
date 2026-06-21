(**********************************************************************************)
(* Code generated with NexusDB Enterprise Manager Data Dictionary Code Generator  *)
(*                                                                                *)
(* Version: 3,0101                                                                *)
(*                                                                                *)
(**********************************************************************************)

unit nrDB_TablesDef;

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

function __ContaEmail(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('ID', '', nxtAutoInc, 10, 0, False);
        AddField('Nome', '', nxtNulLString, 20, 0, False);
        AddField('Host', '', nxtNullString, 50, 0, False);
        AddField('Username', '', nxtNullString, 50, 0, False);
        AddField('Senha', '', nxtNullString, 20, 0, False);
        AddField('Porta', '', nxtWord16, 5, 0, False);
        AddField('IOHandler', '', nxtBoolean, 0, 0, False);
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('IID', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('ID'));
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;
  

// Atendimento
function __Atendimento(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('ID', '', nxtAutoInc, 10, 0, False);
        AddField('Fila', '', nxtInt32, 10, 0, False);
        AddField('InicioFila', '', nxtDateTime, 0, 0, False);
        AddField('InicioAtend', '', nxtDateTime, 0, 0, False);
        AddField('FimAtend', '', nxtDateTime, 0, 0, False);
        AddField('Func', '', nxtNullString, 20, 0, False);
        AddField('DescrCli', '', nxtBLOBMemo, 0, 0, False);
        AddField('DescrFunc', '', nxtBLOBMemo, 0, 0, False);
        AddField('Sessao', '', nxtInt32, 10, 0, False);
        AddField('Loja', '', nxtInt32, 10, 0, False);
        AddField('Pendente', '', nxtBoolean, 0, 0, False);
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('IID', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('ID'));
        with AddIndex('IFilaIDInicio', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Fila'));
          Add(GetFieldFromName('ID'));
          Add(GetFieldFromName('InicioAtend'));
        end;
        with AddIndex('IInicioAtend', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('InicioAtend'));
        with AddIndex('ILoja', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Loja'));
          Add(GetFieldFromName('InicioFila'));
        end;
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

// Autorizacao
function __Autorizacao(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('ID', '', nxtAutoInc, 10, 0, False);
        AddField('Programa', '', nxtByte, 3, 0, False);
        AddField('Loja', '', nxtWord32, 10, 0, False);
        AddField('Autorizacao', '', nxtNullString, 30, 0, False);
        AddField('Vencimento', '', nxtDate, 0, 0, False);
        AddField('CodigoEquip', '', nxtNullString, 30, 0, False);
        AddField('Maquinas', '', nxtWord16, 5, 0, False);
        AddField('Tipo', '', nxtByte, 3, 0, False);
        AddField('CriadaEm', '', nxtDateTime, 0, 0, False);
        AddField('CriadaPor', '', nxtNullString, 30, 0, False);
        AddField('InativadaEm', '', nxtDateTime, 0, 0, False);
        AddField('InativadaPor', '', nxtNullString, 30, 0, False);
        with AddField('Ativa', '', nxtBoolean, 0, 0, False) do
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
            AsVariant := False;
        AddField('Obs', '', nxtBLOBMemo, 0, 0, False);
        with AddField('Gerar', '', nxtBoolean, 0, 0, False) do
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
            AsVariant := False;
        with AddField('EnviouCli', '', nxtBoolean, 0, 0, False) do
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
            AsVariant := False;
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('IID', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('ID'));
        with AddIndex('ILoja', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Loja'));
          with Add(GetFieldFromName('Ativa')) do
            Ascend := False;
          Add(GetFieldFromName('ID'));
        end;
        with AddIndex('IEquip', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          with Add(GetFieldFromName('CodigoEquip'), TnxExtTextKeyFieldDescriptor) as TnxExtTextKeyFieldDescriptor do begin
            IgnoreCase := True;
            with AddLocaleDescriptor do begin
              Locale := $00000416; { Portuguese }
              Flags := $00030002;
              IgnoreKanaType := True;
              IgnoreNonSpace := True;
              Ignorewidth := True;
            end;
          end;
          Add(GetFieldFromName('ID'));
        end;
        with AddIndex('IInclusao', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('CriadaEm'));
        with AddIndex('IGerar', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Gerar'));
          Add(GetFieldFromName('ID'));
        end;
        with AddIndex('ILojaID', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Loja'));
          with Add(GetFieldFromName('ID')) do
            Ascend := False;
        end;
        with AddIndex('IVencimento', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Vencimento'));
          Add(GetFieldFromName('ID'));
        end;
        with AddIndex('IEnviou', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('EnviouCli'));
          Add(GetFieldFromName('ID'));
        end;
        with AddIndex('ICodigoEquipTipo', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          with Add(GetFieldFromName('CodigoEquip'), TnxExtTextKeyFieldDescriptor) as TnxExtTextKeyFieldDescriptor do begin
            IgnoreCase := True;
            with AddLocaleDescriptor do begin
              Locale := $00000416; { Portuguese }
              Flags := $00030002;
              IgnoreKanaType := True;
              IgnoreNonSpace := True;
              Ignorewidth := True;
            end;
          end;
          Add(GetFieldFromName('Tipo'));
        end;
        with AddIndex('IEnviouAtiva', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('EnviouCli'));
          Add(GetFieldFromName('Ativa'));
          with Add(GetFieldFromName('ID')) do
            Ascend := False;
        end;
        with AddIndex('IAtiva', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Ativa'));
          with Add(GetFieldFromName('ID')) do
            Ascend := False;
        end;
        with AddIndex('IAtivaVencimento', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Ativa'));
          Add(GetFieldFromName('Vencimento'));
        end;
        with AddIndex('IAtivaTipoVencimento', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Ativa'));
          Add(GetFieldFromName('Tipo'));
          Add(GetFieldFromName('Vencimento'));
        end;
        with AddIndex('ILojaTipoVenc', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Loja'));
          Add(GetFieldFromName('Tipo'));
          Add(GetFieldFromName('Vencimento'));
        end;
        with AddIndex('ILojaAtivaID', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Loja'));
          Add(GetFieldFromName('Ativa'));
          Add(GetFieldFromName('ID'));
        end;
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

// cliente
function __cliente(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('Codigo', '', nxtAutoInc, 10, 0, False);
        with AddField('Tipo', '', nxtByte, 3, 0, False) do
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
            AsVariant := 0;
        AddField('Senha', '', nxtNullString, 30, 0, False);
        AddField('CadastroEm', '', nxtDateTime, 0, 0, False);
        AddField('CadastroPor', '', nxtNullString, 30, 0, False);
        AddField('AtualizadoEm', '', nxtDateTime, 0, 0, False);
        AddField('AtualizadoPor', '', nxtNullString, 30, 0, False);
        AddField('Loja', '', nxtNullString, 50, 0, False);
        AddField('RazaoSocial', '', nxtNullString, 50, 0, False);
        AddField('Pais', '', nxtNullString, 50, 0, False);
        AddField('Cidade', '', nxtNullString, 30, 0, False);
        AddField('UF', '', nxtNullString, 2, 0, False);
        AddField('Endereco', '', nxtBLOBMemo, 0, 0, False);
        AddField('CEP', '', nxtNullString, 50, 0, False);
        AddField('Bairro', '', nxtNullString, 50, 0, False);
        AddField('SerieHD', '', nxtNullString, 60, 0, False);
        AddField('CodEquip', '', nxtNullString, 60, 0, False);
        AddField('NumMaq', '', nxtWord16, 5, 0, False);
        AddField('CNPJ', '', nxtNullString, 19, 0, False);
        AddField('IE', '', nxtNullString, 15, 0, False);
        AddField('Obs', '', nxtBLOBMemo, 0, 0, False);
        AddField('Telefones', '', nxtBLOBMemo, 0, 0, False);
        AddField('EmailReg', '', nxtBLOBMemo, 0, 0, False);
        AddField('FormaPagto', '', nxtBLOBMemo, 0, 0, False);
        AddField('LicMaq', '', nxtWord16, 5, 0, False);
        AddField('LicTipo', '1=Temporária, 2=Definitiva, 3=Teste', nxtByte, 3, 0, False);
        AddField('LicVenc', '', nxtDate, 0, 0, False);
        AddField('ManInicio', '', nxtDate, 0, 0, False);
        AddField('ManVenc', '', nxtDate, 0, 0, False);
        AddField('Proprietarios', '', nxtBLOBMemo, 0, 0, False);
        AddField('Gerente', '', nxtNullString, 50, 0, False);
        AddField('TipoLoja', '', nxtByte, 3, 0, False);
        AddField('EmailTec', '', nxtBLOBMemo, 0, 0, False);
        AddField('Valor', '', nxtCurrency, 16, 0, False);
        AddField('ValorRec', '', nxtCurrency, 16, 0, False);
        AddField('EmitirNF', '', nxtBoolean, 0, 0, False);
        AddField('Messenger', '', nxtBLOBMemo, 0, 0, False);
        AddField('ICQ', '', nxtBLOBMemo, 0, 0, False);
        AddField('UObtemLic', '', nxtDateTime, 0, 0, False);
        AddField('UVersao', '', nxtNullString, 10, 0, False);
        with AddField('Negociacao', '', nxtByte, 3, 0, False) do
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
            AsVariant := 0;
        AddField('Status', '', nxtInt32, 3, 0, False);
        AddField('ContatarEm', '', nxtDateTime, 0, 0, False);
        with AddField('Programa', '0=CyberManager, 1=NexCafé', nxtByte, 3, 0, False) do
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
            AsVariant := 0;
        with AddField('Bloqueado', '', nxtBoolean, 0, 0, False) do
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
            AsVariant := False;
        with AddField('Cliente', '', nxtBoolean, 0, 0, False) do
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
            AsVariant := False;
        with AddField('Ativado', '', nxtBoolean, 0, 0, False) do
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
            AsVariant := False;
        AddField('CodAtivacao', '', nxtNullString, 10, 0, False);
        AddField('EmailConta', '', nxtNullString, 200, 0, False);
        AddField('AtivadoEm', '', nxtDateTime, 0, 0, False);
        with AddField('TipoConta', '', nxtByte, 3, 0, False) do
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do begin
            AsVariant := 0;
            ApplyOnModify := True;
          end;
        AddField('PremiumAte', '', nxtDateTime, 0, 0, False);
        AddField('CodDesc', '', nxtNullString, 10, 0, False);
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('ICodigo', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('Codigo'));
        with AddIndex('IUObtemLic', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('UObtemLic'));
        with AddIndex('ILicTipoUObtemLic', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('LicTipo'));
          Add(GetFieldFromName('UObtemLic'));
        end;
        with AddIndex('ILoja', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          with Add(GetFieldFromName('Loja'), TnxExtTextKeyFieldDescriptor) as TnxExtTextKeyFieldDescriptor do begin
            IgnoreCase := True;
            with AddLocaleDescriptor do begin
              Locale := $00000416; { Portuguese }
              Flags := $00030002;
              IgnoreKanaType := True;
              IgnoreNonSpace := True;
              Ignorewidth := True;
            end;
          end;
        with AddIndex('IStatusNome', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Status'));
          with Add(GetFieldFromName('Loja'), TnxExtTextKeyFieldDescriptor) as TnxExtTextKeyFieldDescriptor do begin
            IgnoreCase := True;
            with AddLocaleDescriptor do begin
              Locale := $00000416; { Portuguese }
              Flags := $00030002;
              IgnoreKanaType := True;
              IgnoreNonSpace := True;
              Ignorewidth := True;
            end;
          end;
        end;
        with AddIndex('ISerieHD', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          with Add(GetFieldFromName('SerieHD'), TnxExtTextKeyFieldDescriptor) as TnxExtTextKeyFieldDescriptor do begin
            IgnoreCase := True;
            with AddLocaleDescriptor do begin
              Locale := $00000416; { Portuguese }
              Flags := $00030002;
              IgnoreKanaType := True;
              IgnoreNonSpace := True;
              Ignorewidth := True;
            end;
          end;
        with AddIndex('ICodEquip', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          with Add(GetFieldFromName('CodEquip'), TnxExtTextKeyFieldDescriptor) as TnxExtTextKeyFieldDescriptor do begin
            IgnoreCase := True;
            with AddLocaleDescriptor do begin
              Locale := $00000416; { Portuguese }
              Flags := $00030002;
              IgnoreKanaType := True;
              IgnoreNonSpace := True;
              Ignorewidth := True;
            end;
          end;
        with AddIndex('IEmailConta', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          with Add(GetFieldFromName('EmailConta'), TnxTextKeyFieldDescriptor) as TnxTextKeyFieldDescriptor do
            IgnoreCase := True;
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

// EmailCorpo
function __EmailCorpo(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('ID', '', nxtAutoInc, 10, 0, False);
        with AddField('Conta', '', nxtWord32, 10, 0, False) do
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do begin
            AsVariant := 1;
            ApplyOnModify := True;
          end;
        AddField('Corpo', '', nxtBLOBMemo, 0, 0, False);
        AddField('Destino', '', nxtBLOBMemo, 0, 0, False);
        AddField('Assunto', '', nxtNullString, 100, 0, False);
        AddField('Inclusao', '', nxtDateTime, 0, 0, False);
        AddField('Tipo', '', nxtByte, 3, 0, False);
        AddField('EnviarEm', '', nxtDateTime, 0, 0, False);
        AddField('Processou', '', nxtBoolean, 0, 0, False);
        AddField('CType', '', nxtNullString, 100, 0, False);
        AddField('Anexos', '', nxtBLOBMemo, 0, 0, False);
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('IID', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('ID'));
        with AddIndex('IProcessou', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Processou'));
          Add(GetFieldFromName('EnviarEm'));
        end;
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

// EmailEnvio
function __EmailEnvio(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('ID', '', nxtAutoInc, 10, 0, False);
        AddField('Corpo', '', nxtInt32, 10, 0, False);
        AddField('Destino', '', nxtBLOBMemo, 0, 0, False);
        AddField('Inclusao', '', nxtDateTime, 0, 0, False);
        AddField('Envio', '', nxtDateTime, 0, 0, False);
        AddField('Tentativas', '', nxtWord16, 5, 0, False);
        AddField('Enviar', '', nxtBoolean, 0, 0, False);
        AddField('MsgErro', '', nxtBLOBMemo, 0, 0, False);
        AddField('OK', '', nxtBoolean, 0, 0, False);
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('IID', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('ID'));
        with AddIndex('ICorpo', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Corpo'));
          Add(GetFieldFromName('ID'));
        end;
        with AddIndex('IEnviar', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Enviar'));
          Add(GetFieldFromName('OK'));
          Add(GetFieldFromName('ID'));
        end;
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

// Est
function __Est(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('ID', '', nxtAutoInc, 10, 0, False);
        AddField('Loja', '', nxtInt32, 10, 0, False);
        AddField('Data', '', nxtDate, 0, 0, False);
        AddField('Caixa', '', nxtInt32, 10, 0, False);
        AddField('DataAtu', '', nxtDateTime, 0, 0, False);
        AddField('SessoesQtd', '', nxtInt32, 10, 0, False);
        AddField('SessoesTempo', '', nxtDouble, 0, 0, False);
        AddField('URLs', '', nxtInt32, 10, 0, False);
        AddField('CodEquip', '', nxtNullString, 20, 0, False);
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('ILojaData', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Loja'));
          Add(GetFieldFromName('Data'));
          Add(GetFieldFromName('Caixa'));
        end;
        with AddIndex('IDataLoja', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Data'));
          Add(GetFieldFromName('Loja'));
          Add(GetFieldFromName('Caixa'));
        end;
        with AddIndex('ICodEquipData', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          with Add(GetFieldFromName('CodEquip'), TnxExtTextKeyFieldDescriptor) as TnxExtTextKeyFieldDescriptor do begin
            IgnoreCase := True;
            with AddLocaleDescriptor do begin
              Locale := $00000416; { Portuguese }
              Flags := $00030002;
              IgnoreKanaType := True;
              IgnoreNonSpace := True;
              Ignorewidth := True;
            end;
          end;
          Add(GetFieldFromName('Data'));
          Add(GetFieldFromName('Caixa'));
        end;
        with AddIndex('ILojaCaixa', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Loja'));
          Add(GetFieldFromName('Caixa'));
        end;
        with AddIndex('ICodEquipCaixa', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          with Add(GetFieldFromName('CodEquip'), TnxExtTextKeyFieldDescriptor) as TnxExtTextKeyFieldDescriptor do begin
            IgnoreCase := True;
            with AddLocaleDescriptor do begin
              Locale := $00000416; { Portuguese }
              Flags := $00030002;
              IgnoreKanaType := True;
              IgnoreNonSpace := True;
              Ignorewidth := True;
            end;
          end;
          Add(GetFieldFromName('Caixa'));
        end;
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

// EstRes
function __EstRes(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('Loja', '', nxtInt32, 10, 0, False);
        AddField('CodEquip', '', nxtNullString, 20, 0, False);
        AddField('Res', '', nxtNullString, 10, 0, False);
        AddField('Qtd', '', nxtInt32, 10, 0, False);
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('ILojaRes', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Loja'));
          with Add(GetFieldFromName('Res'), TnxExtTextKeyFieldDescriptor) as TnxExtTextKeyFieldDescriptor do begin
            IgnoreCase := True;
            with AddLocaleDescriptor do begin
              Locale := $00000416; { Portuguese }
              Flags := $00030002;
              IgnoreKanaType := True;
              IgnoreNonSpace := True;
              Ignorewidth := True;
            end;
          end;
        end;
        with AddIndex('ICodEquipRes', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('CodEquip'));
          with Add(GetFieldFromName('Res'), TnxExtTextKeyFieldDescriptor) as TnxExtTextKeyFieldDescriptor do begin
            IgnoreCase := True;
            with AddLocaleDescriptor do begin
              Locale := $00000416; { Portuguese }
              Flags := $00030002;
              IgnoreKanaType := True;
              IgnoreNonSpace := True;
              Ignorewidth := True;
            end;
          end;
        end;
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

// EstSearch
function __EstSearch(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('ID', '', nxtAutoInc, 10, 0, False);
        AddField('Loja', '', nxtInt32, 10, 0, False);
        AddField('Data', '', nxtDate, 0, 0, False);
        AddField('Caixa', '', nxtInt32, 10, 0, False);
        AddField('CodEquip', '', nxtNullString, 20, 0, False);
        AddField('DataAtu', '', nxtDateTime, 0, 0, False);
        AddField('Eng', '', nxtNullString, 2, 0, False);
        AddField('Qtd', '', nxtInt32, 10, 0, False);
        AddField('Pag', '', nxtInt32, 10, 0, False);
        AddField('Est', '', nxtInt32, 10, 0, False);
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('ILojaData', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Loja'));
          Add(GetFieldFromName('Data'));
          Add(GetFieldFromName('Caixa'));
        end;
        with AddIndex('IDataLoja', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Data'));
          Add(GetFieldFromName('Loja'));
          Add(GetFieldFromName('Caixa'));
        end;
        with AddIndex('ICodEquipData', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          with Add(GetFieldFromName('CodEquip'), TnxExtTextKeyFieldDescriptor) as TnxExtTextKeyFieldDescriptor do begin
            IgnoreCase := True;
            with AddLocaleDescriptor do begin
              Locale := $00000416; { Portuguese }
              Flags := $00030002;
              IgnoreKanaType := True;
              IgnoreNonSpace := True;
              Ignorewidth := True;
            end;
          end;
          Add(GetFieldFromName('Data'));
          Add(GetFieldFromName('Caixa'));
        end;
        with AddIndex('IEstEng', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Est'));
          with Add(GetFieldFromName('Eng'), TnxExtTextKeyFieldDescriptor) as TnxExtTextKeyFieldDescriptor do begin
            IgnoreCase := True;
            with AddLocaleDescriptor do begin
              Locale := $00000416; { Portuguese }
              Flags := $00030002;
              IgnoreKanaType := True;
              IgnoreNonSpace := True;
              Ignorewidth := True;
            end;
          end;
        end;
        with AddIndex('ILojaCaixa', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Loja'));
          Add(GetFieldFromName('Caixa'));
        end;
        with AddIndex('ICodEquipCaixa', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          with Add(GetFieldFromName('CodEquip'), TnxExtTextKeyFieldDescriptor) as TnxExtTextKeyFieldDescriptor do begin
            IgnoreCase := True;
            with AddLocaleDescriptor do begin
              Locale := $00000416; { Portuguese }
              Flags := $00030002;
              IgnoreKanaType := True;
              IgnoreNonSpace := True;
              Ignorewidth := True;
            end;
          end;
          Add(GetFieldFromName('Caixa'));
        end;
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

// HistCon
function __HistCon(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('ID', '', nxtAutoInc, 10, 0, False);
        AddField('Tipo', '', nxtNullString, 10, 0, False);
        AddField('Loja', '', nxtInt32, 10, 0, False);
        AddField('DataHora', '', nxtDateTime, 0, 0, False);
        AddField('Por', '', nxtNullString, 15, 0, False);
        AddField('Texto', '', nxtBLOBMemo, 0, 0, False);
        AddField('Meio', '', nxtNullString, 10, 0, False);
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('IID', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('ID'));
        with AddIndex('ILoja', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Loja'));
          Add(GetFieldFromName('DataHora'));
        end;
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

// IPLoja
function __IPLoja(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('IP', '', nxtNullString, 15, 0, False);
        AddField('Loja', '', nxtWord32, 10, 0, False);
        AddField('DH', '', nxtDateTime, 0, 0, False);
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('IIP', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('IP'));
          Add(GetFieldFromName('Loja'));
        end;
        with AddIndex('ILoja', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Loja'));
          Add(GetFieldFromname('DH')).Ascend := False;
        end;
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;


// Log
function __Log(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('Num', '', nxtAutoInc, 10, 0, False);
        AddField('DataHora', '', nxtDateTime, 0, 0, False);
        AddField('Loja', '', nxtInt32, 10, 0, False);
        AddField('Detalhes', '', nxtBLOBMemo, 0, 0, False);
        AddField('IP', '', nxtNullString, 20, 0, False);
        AddField('OperID', '', nxtByte, 3, 0, False);
        AddField('OK', '', nxtBoolean, 0, 0, False);
        AddField('SerieHD', '', nxtNullString, 60, 0, False);
        AddField('IP2', '', nxtNullString, 20, 0, False);
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('INum', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('Num'));
        with AddIndex('ILoja', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Loja'));
          Add(GetFieldFromName('DataHora'));
        end;
        with AddIndex('IDataHora', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('DataHora'));
        with AddIndex('IOperID', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('OperID'));
        with AddIndex('IHDOper', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          with Add(GetFieldFromName('SerieHD'), TnxExtTextKeyFieldDescriptor) as TnxExtTextKeyFieldDescriptor do begin
            IgnoreCase := True;
            with AddLocaleDescriptor do begin
              Locale := $00000416; { Portuguese }
              Flags := $00030002;
              IgnoreKanaType := True;
              IgnoreNonSpace := True;
              Ignorewidth := True;
            end;
          end;
          Add(GetFieldFromName('OperID'));
          Add(GetFieldFromName('DataHora'));
        end;
        with AddIndex('IIPOper', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          with Add(GetFieldFromName('IP2'), TnxExtTextKeyFieldDescriptor) as TnxExtTextKeyFieldDescriptor do begin
            IgnoreCase := True;
            with AddLocaleDescriptor do begin
              Locale := $00000416; { Portuguese }
              Flags := $00030002;
              IgnoreKanaType := True;
              IgnoreNonSpace := True;
              Ignorewidth := True;
            end;
          end;
          Add(GetFieldFromName('OperID'));
        end;
        with AddIndex('IHDOperOk', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          with Add(GetFieldFromName('SerieHD'), TnxExtTextKeyFieldDescriptor) as TnxExtTextKeyFieldDescriptor do begin
            IgnoreCase := True;
            with AddLocaleDescriptor do begin
              Locale := $00000416; { Portuguese }
              Flags := $00030002;
              IgnoreKanaType := True;
              IgnoreNonSpace := True;
              Ignorewidth := True;
            end;
          end;
          Add(GetFieldFromName('OperID'));
          Add(GetFieldFromName('OK'));
          Add(GetFieldFromName('Num'));
        end;
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

//openstat

function __OpenStat(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('Data', '', nxtDate, 0, 0, False);
        AddField('IP', '', nxtNullString, 15, 0, False);
        AddField('H', '', nxtByte, 3, 0, False);
        AddField('Loja', '', nxtWord32, 10, 0, False);
        AddField('W', '', nxtByte, 3, 0, False);
        AddField('Qtd', '', nxtWord32, 10, 0, False);
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('IDataIPH', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Data'));
          Add(GetFieldFromName('IP'));
          Add(GetFieldFromName('H'));
        end;
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

// Precos
function __Precos(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('CodDesc', '', nxtNullString, 10, 0, False);
        AddField('Meses', '', nxtByte, 3, 0, False);
        AddField('Descr', '', nxtNullString, 200, 0, False);
        AddField('Obs', '', nxtNullString, 50, 0, False);
        AddField('Valor', '', nxtCurrency, 10, 0, False);
        AddField('DispCli', '', nxtBoolean, 0, 0, False);
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('IMeses', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('CodDesc'));
          Add(GetFieldFromName('Meses'));
        end;
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

// receber
function __receber(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('ID', '', nxtAutoInc, 10, 0, False);
        AddField('Loja', '', nxtInt32, 10, 0, False);
        AddField('Vencimento', '', nxtDate, 0, 0, False);
        AddField('Pagamento', '', nxtDate, 0, 0, False);
        AddField('Valor', '', nxtCurrency, 16, 0, False);
        AddField('ValorPago', '', nxtCurrency, 16, 0, False);
        AddField('Obs', '', nxtBLOBMemo, 0, 0, False);
        AddField('Doc', '', nxtNullString, 60, 0, False);
        AddField('Descricao', '', nxtNullString, 50, 0, False);
        AddField('Lancamento', '', nxtDateTime, 0, 0, False);
        with AddField('ClienteLancou', '', nxtBoolean, 0, 0, False) do
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
            AsVariant := False;
        with AddField('Premium', '', nxtBoolean, 0, 0, False) do
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
            AsVariant := False;
        AddField('PremiumDias', '', nxtWord16, 5, 0, False);
        with AddField('Cancelado', '', nxtBoolean, 0, 0, False) do
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
            AsVariant := False;
        AddField('CanceladoEm', '', nxtDateTime, 0, 0, False);
        AddField('CanceladoPor', '', nxtNullString, 20, 0, False);
        with AddField('Baixou', '', nxtBoolean, 0, 0, False) do
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
            AsVariant := False;
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('IID', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('ID'));
        with AddIndex('ILoja', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Loja'));
          Add(GetFieldFromName('Pagamento'));
          Add(GetFieldFromName('Vencimento'));
        end;
        with AddIndex('IVenc', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('Vencimento'));
        with AddIndex('IPagto', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('Pagamento'));
        with AddIndex('IPremiumLojaBaixou', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Premium'));
          Add(GetFieldFromName('Loja'));
          Add(GetFieldFromName('Baixou'));
          Add(GetFieldFromName('Vencimento'));
        end;
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

// Tarefas
function __Tarefas(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('ID', '', nxtAutoInc, 10, 0, False);
        AddField('DataHora', '', nxtDateTime, 0, 0, False);
        AddField('Por', '', nxtNullString, 10, 0, False);
        AddField('Para', '', nxtNullString, 10, 0, False);
        AddField('Loja', '', nxtInt32, 10, 0, False);
        AddField('Texto', '', nxtBLOBMemo, 0, 0, False);
        AddField('Pendente', '', nxtBoolean, 0, 0, False);
        AddField('ResolvidoEm', '', nxtDateTime, 0, 0, False);
        AddField('RealizarEm', '', nxtDateTime, 0, 0, False);
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('IID', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('ID'));
        with AddIndex('IPara', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          with Add(GetFieldFromName('Para'), TnxExtTextKeyFieldDescriptor) as TnxExtTextKeyFieldDescriptor do begin
            IgnoreCase := True;
            with AddLocaleDescriptor do begin
              Locale := $00000416; { Portuguese }
              Flags := $00030002;
              IgnoreKanaType := True;
              IgnoreNonSpace := True;
              Ignorewidth := True;
            end;
          end;
          Add(GetFieldFromName('Pendente'));
          Add(GetFieldFromName('DataHora'));
        end;
        with AddIndex('IDataHora', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          Add(GetFieldFromName('DataHora'));
        with AddIndex('ILoja', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Loja'));
          Add(GetFieldFromName('DataHora'));
        end;
        with AddIndex('IPendente', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Pendente'));
          Add(GetFieldFromName('DataHora'));
        end;
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

// Usuario
function __Usuario(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('Username', '', nxtNullString, 20, 0, False);
        AddField('Senha', '', nxtNullString, 20, 0, False);
        AddField('Nome', '', nxtNullString, 50, 0, False);
        AddField('Admin', '', nxtBoolean, 0, 0, False);
        AddField('Direitos', '', nxtBLOBMemo, 0, 0, False);
        AddField('NomeCHAT', '', nxtNullString, 50, 0, False);
        AddField('StatusCHAT', '', nxtNullString, 30, 0, False);
        AddField('CHAT', '', nxtBoolean, 0, 0, False);
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('IUsername', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          with Add(GetFieldFromName('Username'), TnxExtTextKeyFieldDescriptor) as TnxExtTextKeyFieldDescriptor do begin
            IgnoreCase := True;
            with AddLocaleDescriptor do begin
              Locale := $00000416; { Portuguese }
              Flags := $00030002;
              IgnoreKanaType := True;
              IgnoreNonSpace := True;
              Ignorewidth := True;
            end;
          end;
        with AddIndex('INome', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
          with Add(GetFieldFromName('Nome'), TnxExtTextKeyFieldDescriptor) as TnxExtTextKeyFieldDescriptor do begin
            IgnoreCase := True;
            with AddLocaleDescriptor do begin
              Locale := $00000416; { Portuguese }
              Flags := $00030002;
              IgnoreKanaType := True;
              IgnoreNonSpace := True;
              Ignorewidth := True;
            end;
          end;
      end;
      CheckValid(False);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

// WebMsg
function __WebMsg(aDatabase : TnxDatabase): TnxDataDictionary;
begin
  Result := TnxDataDictionary.Create;
  try
    with Result do begin
      AddRecordDescriptor(TnxBaseRecordDescriptor);
      with FieldsDescriptor do begin
        AddField('ID', '', nxtAutoInc, 10, 0, False);
        AddField('Loja', '', nxtInt32, 10, 0, False);
        AddField('Titulo', '' ,nxtNullString, 100, 0, False);
        
        with AddField('Status', '0=pendente, 1=lida, 2=respondida', nxtByte, 5, 0, False) do 
          with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
            AsVariant := 0;
        
        AddField('Arq', '', nxtNullString, 200, 0, False);
        AddField('IncluidoEm', '', nxtDateTime, 0, 0, False);
        AddField('Leituras', '', nxtWord16, 0, 0, False);
        AddField('LidaEm', '', nxtDateTime, 0, 0, False);
        AddField('RespondidaEm', '', nxtDateTime, 0, 0, False);
        AddField('Resposta', '', nxtBLOBMemo, 0, 0, False);
      end;
      with EnsureIndicesDescriptor do begin
        with AddIndex('IID', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do 
          Add(GetFieldFromName('ID'));
        with AddIndex('ILojaStatusID', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do begin
          Add(GetFieldFromName('Loja'));
          Add(GetFieldFromName('Status'));
          Add(GetFieldFromName('ID'));
        end;  
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
  TableInfos : array[0..17] of TnxcgTableInfo =
    ((TableName : 'Atendimento'; Callback : __Atendimento),
     (TableName : 'Autorizacao'; Callback : __Autorizacao),
     (TableName : 'cliente'; Callback : __cliente),
     (TableName : 'EmailCorpo'; Callback : __EmailCorpo),
     (TableName : 'EmailEnvio'; Callback : __EmailEnvio),
     (TableName : 'Est'; Callback : __Est),
     (TableName : 'EstRes'; Callback : __EstRes),
     (TableName : 'EstSearch'; Callback : __EstSearch),
     (TableName : 'HistCon'; Callback : __HistCon),
     (TableName : 'IPLoja'; Callback : __IPLoja),
     (TableName : 'Log'; Callback : __Log),
     (TableName : 'OpenStat'; CallBack : __OpenStat),
     (TableName : 'Precos'; Callback : __Precos),
     (TableName : 'receber'; Callback : __receber),
     (TableName : 'Tarefas'; Callback : __Tarefas),
     (TableName : 'Usuario'; Callback : __Usuario),
     (TableName : 'WebMsg'; Callback : __WebMsg),
     (TableName : 'ContaEmail'; Callback : __ContaEmail));

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
