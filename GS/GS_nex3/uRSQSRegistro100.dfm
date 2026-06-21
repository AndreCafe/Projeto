object qsRegistro100: TqsRegistro100
  OldCreateOrder = True
  OnCreate = kbmMWQueryServiceCreate
  OnDestroy = kbmMWQueryServiceDestroy
  GatherStatistics = False
  AllowClientStatement = True
  AllowClientKeyFields = True
  AllowClientNamedQuery = True
  AllowClientTableName = True
  TransportStreamFormat = BSF
  Height = 217
  Width = 359
  object BSF: TkbmMWBinaryStreamFormat
    Version = '1.04'
    sfLargeFields = [sfSaveLargeFields]
    sfCalculated = []
    sfLookup = []
    LargeFieldSize = 0
    Left = 144
    Top = 16
  end
  object nxDB: TnxDatabase
    Session = nxSession
    AliasName = 'Registro'
    Left = 224
    Top = 80
  end
  object nxSession: TnxSession
    Timeout = 60000
    ServerEngine = dmServidorBD.ServerEngine
    Left = 224
    Top = 16
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'cliente'
    IndexName = 'ICodigo'
    Left = 56
    Top = 144
  end
  object MT: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    DefaultFormat = MTBSF
    PersistentFormat = MTBSF
    AllDataFormat = MTBSF
    Left = 144
    Top = 144
    object MTCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object MTSenha: TStringField
      FieldName = 'Senha'
      Size = 30
    end
    object MTCadastroEm: TDateTimeField
      FieldName = 'CadastroEm'
    end
    object MTCadastroPor: TStringField
      FieldName = 'CadastroPor'
      Size = 30
    end
    object MTAtualizadoEm: TDateTimeField
      FieldName = 'AtualizadoEm'
    end
    object MTAtualizadoPor: TStringField
      FieldName = 'AtualizadoPor'
      Size = 30
    end
    object MTLoja: TStringField
      FieldName = 'Loja'
      Size = 50
    end
    object MTRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 50
    end
    object MTPais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
    object MTCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object MTUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object MTEndereco: TMemoField
      FieldName = 'Endereco'
      BlobType = ftMemo
    end
    object MTCEP: TStringField
      FieldName = 'CEP'
      Size = 50
    end
    object MTBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object MTSerieHD: TStringField
      FieldName = 'SerieHD'
      Size = 60
    end
    object MTNumMaq: TWordField
      FieldName = 'NumMaq'
    end
    object MTCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 19
    end
    object MTIE: TStringField
      FieldName = 'IE'
      Size = 15
    end
    object MTObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object MTTelefones: TMemoField
      FieldName = 'Telefones'
      BlobType = ftMemo
    end
    object MTEmailReg: TMemoField
      FieldName = 'EmailReg'
      BlobType = ftMemo
    end
    object MTFormaPagto: TMemoField
      FieldName = 'FormaPagto'
      BlobType = ftMemo
    end
    object MTLicMaq: TWordField
      FieldName = 'LicMaq'
    end
    object MTLicTipo: TWordField
      FieldName = 'LicTipo'
    end
    object MTLicVenc: TDateField
      FieldName = 'LicVenc'
    end
    object MTManInicio: TDateField
      FieldName = 'ManInicio'
    end
    object MTManVenc: TDateField
      FieldName = 'ManVenc'
    end
    object MTProprietarios: TMemoField
      FieldName = 'Proprietarios'
      BlobType = ftMemo
    end
    object MTGerente: TStringField
      FieldName = 'Gerente'
      Size = 50
    end
    object MTTipoLoja: TWordField
      FieldName = 'TipoLoja'
    end
    object MTEmailTec: TMemoField
      FieldName = 'EmailTec'
      BlobType = ftMemo
    end
  end
  object MTBSF: TkbmBinaryStreamFormat
    Version = '3.00'
    sfUsingIndex = [sfSaveUsingIndex]
    sfData = [sfSaveData, sfLoadData]
    sfCalculated = []
    sfLookup = []
    sfNonVisible = [sfSaveNonVisible, sfLoadNonVisible]
    sfBlobs = [sfSaveBlobs, sfLoadBlobs]
    sfDef = [sfSaveDef, sfLoadDef]
    sfIndexDef = [sfSaveIndexDef, sfLoadIndexDef]
    sfFiltered = [sfSaveFiltered]
    sfIgnoreRange = [sfSaveIgnoreRange]
    sfIgnoreMasterDetail = [sfSaveIgnoreMasterDetail]
    sfDeltas = []
    sfDontFilterDeltas = []
    sfAppend = []
    sfFieldKind = [sfSaveFieldKind]
    sfFromStart = [sfLoadFromStart]
    sfDataTypeHeader = [sfSaveDataTypeHeader, sfLoadDataTypeHeader]
    BufferSize = 16384
    Left = 144
    Top = 80
  end
  object tLog: TnxTable
    Database = nxDB
    TableName = 'Log'
    IndexName = 'INum'
    Left = 224
    Top = 144
    object tLogNum: TAutoIncField
      FieldName = 'Num'
    end
    object tLogDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tLogLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tLogDetalhes: TMemoField
      FieldName = 'Detalhes'
      BlobType = ftMemo
    end
    object tLogIP: TStringField
      FieldName = 'IP'
    end
    object tLogOperID: TWordField
      FieldName = 'OperID'
    end
    object tLogOK: TBooleanField
      FieldName = 'OK'
    end
    object tLogSerieHD: TStringField
      FieldName = 'SerieHD'
      Size = 60
    end
  end
  object tCorpo: TnxTable
    Database = nxDB
    TableName = 'EmailCorpo'
    IndexName = 'IProcessou'
    Left = 296
    Top = 144
    object tCorpoID: TAutoIncField
      FieldName = 'ID'
    end
    object tCorpoCorpo: TMemoField
      FieldName = 'Corpo'
      BlobType = ftMemo
    end
    object tCorpoAssunto: TStringField
      FieldName = 'Assunto'
      Size = 100
    end
    object tCorpoInclusao: TDateTimeField
      FieldName = 'Inclusao'
    end
    object tCorpoTipo: TWordField
      FieldName = 'Tipo'
    end
    object tCorpoEnviarEm: TDateTimeField
      FieldName = 'EnviarEm'
    end
    object tCorpoProcessou: TBooleanField
      FieldName = 'Processou'
    end
    object tCorpoDestino: TMemoField
      FieldName = 'Destino'
      BlobType = ftMemo
    end
  end
  object tAut: TnxTable
    Database = nxDB
    TableName = 'Autorizacao'
    IndexName = 'ILoja'
    Left = 56
    Top = 80
  end
end
