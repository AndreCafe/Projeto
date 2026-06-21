object dm_cc: Tdm_cc
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 232
  Width = 265
  object nxSession: TnxSession
    ActiveDesigntime = True
    BeepOnLoginError = False
    Timeout = 60000
    ServerEngine = dm_conn.nxRSE
    Left = 24
    Top = 8
  end
  object nxDBcc: TnxDatabase
    Session = nxSession
    AliasPath = 'c:\meus programas\nexreg\dados\cc'
    Left = 80
    Top = 8
  end
  object tCC: TnxTable
    Database = nxDBcc
    TableName = 'ChecaConta'
    IndexName = 'IUpdID'
    Left = 24
    Top = 72
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
    object tCCUpdID: TLargeintField
      FieldName = 'UpdID'
    end
    object tCCAdmin: TBooleanField
      FieldName = 'Admin'
    end
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession
    AliasPath = 'c:\meus programas\nexreg\dados'
    Left = 128
    Top = 8
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'cliente'
    IndexName = 'ILastCC'
    Left = 72
    Top = 72
    object tCliCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object tCliUObtemLic: TDateTimeField
      FieldName = 'UObtemLic'
    end
    object tCliUVersao: TStringField
      FieldName = 'UVersao'
      Size = 10
    end
    object tCliXVersao: TWordField
      FieldName = 'XVersao'
    end
    object tCliLastCC: TLargeintField
      FieldName = 'LastCC'
    end
    object tCliLastIP: TStringField
      FieldName = 'LastIP'
      Size = 15
    end
    object tCliNumMaq: TWordField
      FieldName = 'NumMaq'
    end
    object tCliLastAdminPopup: TDateTimeField
      FieldName = 'LastAdminPopup'
    end
  end
  object tAut: TnxTable
    Database = nxDB
    TableName = 'Autorizacao'
    IndexName = 'IID'
    Left = 128
    Top = 72
    object tAutID: TAutoIncField
      FieldName = 'ID'
    end
    object tAutEnviouCli: TBooleanField
      FieldName = 'EnviouCli'
    end
  end
  object Timer1: TTimer
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 32
    Top = 136
  end
end
