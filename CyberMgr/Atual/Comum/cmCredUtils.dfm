object CredUtils: TCredUtils
  OldCreateOrder = False
  Height = 131
  Width = 231
  object T: TnxTable
    Database = dmServidorBD.nxDB
    TableName = 'CCTempo'
    Left = 24
    Top = 16
    object TNumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object TCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object TTransacao: TIntegerField
      FieldName = 'Transacao'
    end
    object TTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object TDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object TTempoAnt: TFloatField
      FieldName = 'TempoAnt'
    end
    object TTempo: TFloatField
      FieldName = 'Tempo'
    end
  end
end
