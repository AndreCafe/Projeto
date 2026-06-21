object dm_cc_add: Tdm_cc_add
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 83
  Width = 206
  object nxSession: TnxSession
    ActiveDesigntime = True
    BeepOnLoginError = False
    Timeout = 60000
    ServerEngine = dm_conn.nxRSE
    Left = 24
    Top = 8
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession
    AliasPath = 'c:\meus programas\nexreg\dados\cc'
    Left = 80
    Top = 8
  end
  object tCC: TnxTable
    Database = nxDB
    TableName = 'ChecaConta'
    IndexName = 'ILoja'
    Left = 136
    Top = 8
    object tCCDH: TDateTimeField
      FieldName = 'DH'
    end
    object tCCVersao: TStringField
      FieldName = 'Versao'
      Size = 12
    end
    object tCCIP: TStringField
      FieldName = 'IP'
      Size = 15
    end
    object tCCLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tCCMaq: TWordField
      FieldName = 'Maq'
    end
    object tCCAutID: TIntegerField
      FieldName = 'AutID'
    end
    object tCCAdmin: TBooleanField
      FieldName = 'Admin'
    end
  end
end
