object kbmUp: TkbmUp
  OldCreateOrder = False
  OnCreate = kbmMWCustomServiceCreate
  OnDestroy = kbmMWCustomServiceDestroy
  GatherStatistics = False
  Height = 183
  Width = 345
  object dbUpload: TnxDatabase
    Session = nxSession
    AliasPath = 'C:\Meus Programas\DiaTec\30\Servidor\Tabelas\Upload'
    Left = 120
    Top = 8
  end
  object nxSession: TnxSession
    ServerEngine = dmBDServ.nxRSE
    Left = 64
    Top = 8
  end
  object BSF: TkbmMWBinaryStreamFormat
    Version = '1.04'
    sfLargeFields = [sfSaveLargeFields]
    sfCalculated = []
    sfLookup = []
    LargeFieldSize = 0
    Left = 12
    Top = 8
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
    PersistentFormat = BSF
    AllDataFormat = BSF
    Left = 184
    Top = 8
  end
  object tTec: TnxTable
    Database = dbDown
    TableName = 'Tecnico'
    IndexName = 'IID'
    Left = 240
    Top = 8
    object tTecID: TStringField
      FieldName = 'ID'
      Size = 6
    end
    object tTecNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object tTecSenha: TStringField
      FieldName = 'Senha'
      Size = 6
    end
  end
  object Tab: TnxTable
    Database = dbUpload
    Options = [dsoCacheBlobs]
    TableName = 'Tecnico'
    Left = 16
    Top = 64
  end
  object dbDown: TnxDatabase
    Session = nxSession
    AliasPath = 'c:\meus programas\diatecserv\tabelas\upload'
    Left = 64
    Top = 64
  end
  object mtLog: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'Tecnico'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Data'
        DataType = ftDateTime
      end
      item
        Name = 'Detalhes'
        DataType = ftMemo
      end
      item
        Name = 'Oper'
        DataType = ftWord
      end
      item
        Name = 'OK'
        DataType = ftBoolean
      end
      item
        Name = 'Duracao'
        DataType = ftDateTime
      end
      item
        Name = 'UUpload'
        DataType = ftInteger
      end>
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
    DefaultFormat = BSF
    AllDataFormat = BSF
    Left = 120
    Top = 64
    object mtLogID: TAutoIncField
      FieldName = 'ID'
    end
    object mtLogTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object mtLogData: TDateTimeField
      FieldName = 'Data'
    end
    object mtLogDetalhes: TMemoField
      FieldName = 'Detalhes'
      BlobType = ftMemo
    end
    object mtLogOper: TWordField
      FieldName = 'Oper'
    end
    object mtLogOK: TBooleanField
      FieldName = 'OK'
    end
    object mtLogDuracao: TDateTimeField
      FieldName = 'Duracao'
    end
    object mtLogUUpload: TIntegerField
      FieldName = 'UUpload'
    end
  end
  object tOS: TnxTable
    Database = dbDown
    TableName = 'OS'
    IndexName = 'IID'
    Left = 184
    Top = 64
  end
  object dbPar: TnxDatabase
    Session = nxSession
    AliasPath = 'c:\meus programas\diatecserv\tabelas\par'
    Left = 240
    Top = 64
  end
  object tParametro: TnxTable
    Database = dbPar
    TableName = 'Parametro'
    Left = 24
    Top = 120
    object tParametroMaxDiasUpload: TWordField
      FieldName = 'MaxDiasUpload'
    end
    object tParametroMaxDiasDown: TWordField
      FieldName = 'MaxDiasDown'
    end
    object tParametroDataDown: TDateTimeField
      FieldName = 'DataDown'
    end
    object tParametroNomeFranquia: TStringField
      FieldName = 'NomeFranquia'
      Size = 40
    end
    object tParametroBitMap: TGraphicField
      FieldName = 'BitMap'
      BlobType = ftGraphic
    end
    object tParametroObedeceListaProj: TBooleanField
      FieldName = 'ObedeceListaProj'
    end
    object tParametroListaProjDefault: TStringField
      FieldName = 'ListaProjDefault'
      Size = 1
    end
    object tParametroRestringeDiurno: TBooleanField
      FieldName = 'RestringeDiurno'
    end
    object tParametroTravarTranslado: TBooleanField
      FieldName = 'TravarTranslado'
    end
    object tParametroCampoLocalOS: TBooleanField
      FieldName = 'CampoLocalOS'
    end
    object tParametroInicioDiurno: TDateTimeField
      FieldName = 'InicioDiurno'
    end
    object tParametroFimDiurno: TDateTimeField
      FieldName = 'FimDiurno'
    end
    object tParametroUploadApontamentoSemOS: TBooleanField
      FieldName = 'UploadApontamentoSemOS'
    end
    object tParametroPermitirRateio: TBooleanField
      FieldName = 'PermitirRateio'
    end
    object tParametroConflitoHoraTodosCli: TBooleanField
      FieldName = 'ConflitoHoraTodosCli'
    end
    object tParametroExigeAutorizadoPor: TBooleanField
      FieldName = 'ExigeAutorizadoPor'
    end
    object tParametroMostraReemb: TBooleanField
      FieldName = 'MostraReemb'
    end
    object tParametroForcaTransladoProj: TBooleanField
      FieldName = 'ForcaTransladoProj'
    end
    object tParametroTransladoUnicoPorCliente: TBooleanField
      FieldName = 'TransladoUnicoPorCliente'
    end
    object tParametroChecarVersaoProj: TBooleanField
      FieldName = 'ChecarVersaoProj'
    end
    object tParametroPermiteApagarOSSincronizada: TBooleanField
      FieldName = 'PermiteApagarOSSincronizada'
    end
    object tParametroTodaHorasNoFeriado: TBooleanField
      FieldName = 'TodaHorasNoFeriado'
    end
  end
  object tRAOS: TnxTable
    Database = dbUpload
    TableName = 'RAOS'
    IndexName = 'IOS'
    Left = 144
    Top = 120
  end
  object tRAF: TnxTable
    Database = dbUpload
    TableName = 'RAF'
    IndexName = 'IDataF'
    Left = 200
    Top = 120
  end
  object tProj: TnxTable
    Database = dbDown
    TableName = 'Projeto'
    IndexName = 'IID'
    Left = 296
    Top = 16
  end
  object Q: TnxQuery
    Database = dbUpload
    Left = 248
    Top = 120
  end
  object tUOS: TnxTable
    Database = dbUpload
    TableName = 'UOS'
    IndexName = 'IID'
    Left = 88
    Top = 120
  end
end
