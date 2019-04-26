object dmTipodeImpressao: TdmTipodeImpressao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 278
  Width = 422
  object nxDatabase1: TnxDatabase
    Session = nxSession1
    AliasPath = 'C:\nexcafe\PrintGuardDB'
    Left = 32
    Top = 16
  end
  object nxSession1: TnxSession
    ServerEngine = nxServerEngine1
    Left = 96
    Top = 16
  end
  object nxTableTipoImp: TnxTable
    Database = nxDatabase1
    TableName = 'TipoImp'
    Left = 32
    Top = 88
    object nxTableTipoImpID: TWordField
      FieldName = 'ID'
    end
    object nxTableTipoImpNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object nxTableTipoImpImpressora: TStringField
      FieldName = 'Impressora'
      Size = 500
    end
    object nxTableTipoImpValor: TCurrencyField
      FieldName = 'Valor'
    end
    object nxTableTipoImpContador: TIntegerField
      FieldName = 'Contador'
    end
    object nxTableTipoImpPrinterDevMode: TBlobField
      FieldName = 'PrinterDevMode'
    end
    object nxTableTipoImpasJson: TnxMemoField
      FieldName = 'asJson'
      BlobType = ftMemo
    end
    object nxTableTipoImpActive: TBooleanField
      FieldName = 'Active'
    end
  end
  object nxServerEngine1: TnxServerEngine
    SqlEngine = nxSqlEngine1
    Options = []
    TableExtension = 'nx1'
    Left = 168
    Top = 16
  end
  object dsTableTipoImp: TDataSource
    DataSet = nxTableTipoImp
    Left = 120
    Top = 88
  end
  object dsTablePrinters: TDataSource
    DataSet = nxTablePrinters
    Left = 120
    Top = 152
  end
  object nxTablePrinters: TnxTable
    Database = nxDatabase1
    TableName = 'Printers'
    Left = 32
    Top = 152
    object nxTablePrintersasJson: TnxMemoField
      FieldName = 'asJson'
      BlobType = ftMemo
    end
  end
  object nxQuery1: TnxQuery
    Database = nxDatabase1
    Left = 32
    Top = 216
  end
  object nxSqlEngine1: TnxSqlEngine
    StmtLogging = False
    StmtLogTableName = 'QueryLog'
    Left = 280
    Top = 16
  end
end
