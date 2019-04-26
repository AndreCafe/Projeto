object dmProdClient: TdmProdClient
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 330
  Width = 302
  object nxServerEngineDnld: TnxServerEngine
    SqlEngine = nxSqlEngineDnld
    Options = []
    TableExtension = 'nx1'
    Left = 56
    Top = 40
  end
  object nxSqlEngineDnld: TnxSqlEngine
    ActiveDesigntime = True
    StmtLogging = False
    StmtLogTableName = 'QueryLog'
    UseFieldCache = False
    Left = 176
    Top = 39
  end
  object nxSessionDnld: TnxSession
    ServerEngine = nxServerEngineDnld
    Left = 56
    Top = 88
  end
  object nxDatabaseDnld: TnxDatabase
    Session = nxSessionDnld
    Left = 176
    Top = 88
  end
  object nxSqlEngineUpld: TnxSqlEngine
    ActiveDesigntime = True
    StmtLogging = False
    StmtLogTableName = 'QueryLog'
    UseFieldCache = False
    Left = 176
    Top = 143
  end
  object nxServerEngineUpld: TnxServerEngine
    SqlEngine = nxSqlEngineUpld
    Options = []
    TableExtension = 'nx1'
    Left = 56
    Top = 144
  end
  object nxSessionUpld: TnxSession
    ServerEngine = nxServerEngineUpld
    Left = 56
    Top = 208
  end
  object nxDatabaseUpld: TnxDatabase
    Session = nxSessionUpld
    Left = 176
    Top = 208
  end
end
