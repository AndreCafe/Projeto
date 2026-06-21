object dmTouche: TdmTouche
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 107
  Height = 242
  Width = 383
  object mwCCP: TkbmMWClientConnectionPool
    Transport = mwCT
    MaxConnections = 1
    MaxCacheAge = 0
    MaxCacheEntries = 100
    MaxCacheRecordCount = 0
    EnableCache = False
    ConnectionInactivityTimeout = 0
    GarbageInterval = 60
    GarbageCollection = True
    Left = 80
    Top = 16
  end
  object mwCT: TkbmMWTCPIPIndyClientTransport
    Active = False
    Port = 3000
    Host = '127.0.0.1'
    StreamFormat = 'STANDARD'
    VerifyTransfer = True
    MaxRetries = 0
    MaxRetriesAlternative = 0
    Left = 24
    Top = 16
  end
  object mwBinSF: TkbmMWBinaryStreamFormat
    Version = '1.00a alpha'
    sfLargeFields = []
    sfCalculated = []
    sfLookup = []
    LargeFieldSize = 0
    Left = 136
    Top = 16
  end
  object PS: TkbmMWPooledSession
    ConnectionPool = mwCCP
    AutoSessionName = False
    SessionName = 'mwPS'
    Left = 200
    Top = 16
  end
  object qForms: TkbmMWClientQuery
    Cached = False
    MaxCacheRecordCount = 0
    CacheParams = ptUnknown
    Sync = kbmMWpsAsync
    SessionName = 'mwPS'
    ConnectionWaitTimeout = 0
    Params = <>
    Query.Strings = (
      '@QFORMS')
    QueryService = 'KBMMW_QUERY'
    QueryServiceVersion = 'kbmMW_1.0'
    TransportStreamFormat = mwBinSF
    FetchRecordsOnDemand = -1
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    KeyFields = '*'
    ForceCacheUpdate = False
    RequeryDetails = True
    AutoResolveOnChange = True
    AutoResolveOnClose = True
    Active = False
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'DFM'
        DataType = ftMemo
      end
      item
        Name = 'PAS'
        DataType = ftMemo
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Descricao'
        DataType = ftMemo
      end
      item
        Name = 'Modulo'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CriadoEm'
        DataType = ftDateTime
      end>
    AutoReposition = True
    IndexFieldNames = 'Nome'
    IndexName = 'qFormsIndex1'
    IndexDefs = <
      item
        Name = 'qFormsIndex1'
        Fields = 'Nome'
        Options = [ixCaseInsensitive]
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    SaveLimit = 5
    EnableVersioning = True
    FilterOptions = []
    Version = '3.07'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 24
    Top = 80
    object qFormsDFM: TMemoField
      FieldName = 'DFM'
      BlobType = ftMemo
    end
    object qFormsPAS: TMemoField
      FieldName = 'PAS'
      BlobType = ftMemo
    end
    object qFormsNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object qFormsDescricao: TMemoField
      FieldName = 'Descricao'
      BlobType = ftMemo
    end
    object qFormsModulo: TStringField
      FieldName = 'Modulo'
      Size = 40
    end
    object qFormsCriadoEm: TDateTimeField
      FieldName = 'CriadoEm'
    end
  end
  object dsForms: TDataSource
    DataSet = qForms
    Left = 96
    Top = 80
  end
end
