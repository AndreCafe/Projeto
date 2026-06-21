object dm_autoconn: Tdm_autoconn
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 83
  Width = 206
  object nxSession: TnxSession
    ActiveDesigntime = True
    Timeout = 60000
    ServerEngine = dm_conn.nxRSE
    Left = 24
    Top = 8
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession
    AliasPath = 'c:\meus programas\nexreg\dados\ac'
    Left = 80
    Top = 8
  end
  object tAC: TnxTable
    Database = nxDB
    TableName = 'autoconn'
    IndexName = 'IIPPub'
    Left = 136
    Top = 8
    object tACID: TAutoIncField
      FieldName = 'ID'
    end
    object tACComputerName: TStringField
      FieldName = 'ComputerName'
      Size = 50
    end
    object tACIPPub: TStringField
      FieldName = 'IPPub'
      Size = 15
    end
    object tACIPLocal: TnxMemoField
      FieldName = 'IPLocal'
      BlobType = ftMemo
    end
  end
end
