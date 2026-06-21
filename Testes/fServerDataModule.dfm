object ServerDataModule: TServerDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 362
  Top = 208
  Height = 207
  Width = 352
  object ROServer: TROIndyTCPServer
    Dispatchers = <
      item
        Name = 'ROMessage'
        Message = ROMessage
        Enabled = True
      end>
    Left = 32
    Top = 8
  end
  object ROMessage: TROBinMessage
    Left = 34
    Top = 56
  end
  object ConnectionManager: TDAConnectionManager
    MaxPoolSize = 10
    PoolTimeoutSeconds = 60
    PoolBehaviour = pbWait
    WaitIntervalSeconds = 1
    Connections = <>
    DriverManager = DriverManager
    PoolingEnabled = True
    Left = 136
    Top = 56
  end
  object DriverManager: TDADriverManager
    DriverDirectory = '%SYSTEM%\'
    AutoLoad = False
    TraceActive = False
    TraceFlags = []
    Left = 136
    Top = 10
  end
  object ADODriver: TDAADODriver
    Left = 256
    Top = 8
  end
  object IBXDriver: TDAIBXDriver
    Left = 256
    Top = 56
  end
  object DBXDriver: TDADBXDriver
    Left = 256
    Top = 104
  end
end
