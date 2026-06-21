object qsRegistro: TqsRegistro
  OldCreateOrder = True
  GatherStatistics = False
  AllowClientStatement = False
  AllowClientKeyFields = False
  AllowClientNamedQuery = False
  AllowClientTableName = False
  Left = 192
  Top = 133
  Height = 188
  Width = 425
  object nxResolver: TkbmMWNexusDBResolver
    Left = 64
    Top = 16
  end
  object qRegistro: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'WIZARDSESSION'
    ConnectionPool = DM.mwNXDBCP
    Resolver = nxResolver
    TableName = 'Cliente'
    KeyFieldNames = 'Codigo'
    Published = True
    Active = True
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = True
    EnableVersioning = True
    IndexDefs = <>
    SortOptions = []
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    SQL.Strings = (
      'select * from cliente'
      'where codigo = :codigo')
    Params = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = -1
      end>
    Left = 64
    Top = 80
  end
  object kbmMWBinaryStreamFormat1: TkbmMWBinaryStreamFormat
    Version = '1.04'
    sfLargeFields = []
    sfCalculated = []
    sfLookup = []
    LargeFieldSize = 0
    Left = 284
    Top = 16
  end
end
