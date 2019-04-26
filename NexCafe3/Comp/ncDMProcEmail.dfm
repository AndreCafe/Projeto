inherited dmProcEmail: TdmProcEmail
  OldCreateOrder = True
  Height = 290
  Width = 346
  object tCriar: TnxTable
    Database = nxDB
    TableName = 'EmailCriar'
    IndexName = 'IID'
    Left = 152
    Top = 144
    object tCriarID: TAutoIncField
      FieldName = 'ID'
    end
    object tCriarTipo: TIntegerField
      FieldName = 'Tipo'
    end
    object tCriarParametros: TMemoField
      FieldName = 'Parametros'
      BlobType = ftMemo
    end
    object tCriarDestino: TMemoField
      FieldName = 'Destino'
      BlobType = ftMemo
    end
  end
end
