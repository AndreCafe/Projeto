object dmPrintGuard: TdmPrintGuard
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 278
  Width = 422
  object nxDatabase1: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession1
    AliasPath = 'C:\nexcafe\PrintGuardDB'
    Left = 32
    Top = 16
  end
  object nxSession1: TnxSession
    ActiveDesigntime = True
    ServerEngine = nxServerEngine1
    Left = 96
    Top = 16
  end
  object nxServerEngine1: TnxServerEngine
    ActiveDesigntime = True
    SqlEngine = nxSqlEngine1
    Options = []
    TableExtension = 'nx1'
    Left = 168
    Top = 16
  end
  object dsTablePrintList: TDataSource
    DataSet = nxTablePrintList
    Left = 168
    Top = 88
  end
  object nxSqlEngine1: TnxSqlEngine
    ActiveDesigntime = True
    StmtLogging = False
    StmtLogTableName = 'QueryLog'
    Left = 272
    Top = 16
  end
  object nxTablePrintList: TnxTable
    Database = nxDatabase1
    TableName = 'PrintList'
    Left = 40
    Top = 88
    object nxTablePrintListid: TAutoIncField
      FieldName = 'id'
    end
    object nxTablePrintListFileName: TStringField
      FieldName = 'FileName'
      Size = 100
    end
    object nxTablePrintListmaquina: TStringField
      FieldName = 'maquina'
    end
    object nxTablePrintListIDPrinter: TSmallintField
      FieldName = 'IDPrinter'
    end
    object nxTablePrintListpaginas: TIntegerField
      FieldName = 'paginas'
    end
    object nxTablePrintListdatahora: TDateTimeField
      FieldName = 'datahora'
    end
  end
  object nxTableTipoImp: TnxTable
    Database = nxDatabase1
    TableName = 'TipoImp'
    Left = 40
    Top = 160
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
end
