object QS100: TQS100
  OldCreateOrder = True
  GatherStatistics = False
  AllowClientStatement = True
  AllowClientKeyFields = True
  AllowClientNamedQuery = True
  AllowClientTableName = True
  TransportStreamFormat = BSF
  Left = 260
  Top = 205
  Height = 203
  Width = 400
  object BSF: TkbmMWBinaryStreamFormat
    Version = '1.04'
    sfLargeFields = [sfSaveLargeFields]
    sfCalculated = []
    sfLookup = []
    LargeFieldSize = 0
    Left = 156
    Top = 16
  end
  object nxDB: TnxDatabase
    Session = nxSession
    AliasName = 'Registro'
    Left = 224
    Top = 80
  end
  object nxRSE: TnxRemoteServerEngine
    Transport = nxTCPIP
    Left = 296
    Top = 16
  end
  object nxTCPIP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '200.215.37.27'
    ServerNameDesigntime = '200.215.37.27'
    MaxBytesPerSecond = 0
    PingTime = 0
    Left = 296
    Top = 80
  end
  object nxSession: TnxSession
    Timeout = 60000
    ServerEngine = nxRSE
    Left = 224
    Top = 16
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
    Left = 160
    Top = 80
  end
  object mySQLDB: TmySQLDatabase
    DatabaseName = 'dbradius'
    UserName = 'cybermgr'
    UserPassword = '0o9i8u7y6t'
    Host = 'mysql.cbroom.com.br'
    ConnectOptions = []
    Params.Strings = (
      'Port=3306'
      'TIMEOUT=30'
      'PWD=0o9i8u7y6t'
      'UID=cybermgr'
      'Host=mysql.cbroom.com.br'
      'DatabaseName=dbradius')
    Left = 88
    Top = 16
  end
  object qMySql: TmySQLQuery
    Database = mySQLDB
    SQL.Strings = (
      '')
    Left = 88
    Top = 80
  end
  object tSessao: TnxTable
    Database = nxDB
    TableName = 'SessaoCyberroom'
    IndexName = 'IThreadIDStop'
    Left = 16
    Top = 16
  end
end
