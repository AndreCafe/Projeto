object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 206
  Width = 329
  object nxSession: TnxSession
    ActiveDesigntime = True
    ServerEngine = dmServidorBD.ServerEngine
    Left = 24
    Top = 16
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession
    AliasPath = 'c:\meus programas\nexcafe\dados'
    Left = 88
    Top = 16
  end
  object tTran: TnxTable
    Database = nxDB
    TableName = 'Tran'
    IndexName = 'ISessao'
    Left = 24
    Top = 88
    object tTranID: TAutoIncField
      FieldName = 'ID'
    end
    object tTranDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tTranCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tTranTipo: TWordField
      FieldName = 'Tipo'
    end
    object tTranFunc: TStringField
      FieldName = 'Func'
      Size = 30
    end
    object tTranTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tTranDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tTranPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tTranObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tTranCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tTranCanceladoPor: TStringField
      FieldName = 'CanceladoPor'
      Size = 30
    end
    object tTranCanceladoEm: TDateTimeField
      FieldName = 'CanceladoEm'
    end
    object tTranCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tTranMaq: TWordField
      FieldName = 'Maq'
    end
    object tTranNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object tTranSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tTranDescr: TStringField
      FieldName = 'Descr'
      Size = 50
    end
    object tTranGeraDeb: TBooleanField
      FieldName = 'GeraDeb'
    end
    object tTranPendente: TBooleanField
      FieldName = 'Pendente'
    end
  end
  object nxTable4: TnxTable
    Left = 240
    Top = 40
  end
end
