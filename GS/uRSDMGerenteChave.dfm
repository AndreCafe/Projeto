object dmGerente: TdmGerente
  OldCreateOrder = False
  Height = 159
  Width = 220
  object nxSession: TnxSession
    ServerEngine = dmServidorBD.ServerEngine
    Left = 32
    Top = 24
  end
  object nxDB: TnxDatabase
    Session = nxSession
    AliasName = 'Registro'
    Left = 88
    Top = 24
  end
  object tChave: TnxTable
    Database = nxDB
    TableName = 'Chaves'
    IndexName = 'IEquip'
    Left = 144
    Top = 24
    object tChaveID: TAutoIncField
      FieldName = 'ID'
    end
    object tChaveLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tChaveChave: TStringField
      FieldName = 'Chave'
      Size = 30
    end
    object tChaveVencimento: TDateField
      FieldName = 'Vencimento'
    end
    object tChaveCodigoEquip: TStringField
      FieldName = 'CodigoEquip'
      Size = 30
    end
    object tChaveMaquinas: TWordField
      FieldName = 'Maquinas'
    end
    object tChaveTipo: TWordField
      FieldName = 'Tipo'
    end
    object tChaveCriadaEm: TDateTimeField
      FieldName = 'CriadaEm'
    end
    object tChaveCriadaPor: TStringField
      FieldName = 'CriadaPor'
      Size = 30
    end
    object tChaveStatus: TWordField
      FieldName = 'Status'
    end
  end
end
