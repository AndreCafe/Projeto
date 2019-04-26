object dmImpNX: TdmImpNX
  OldCreateOrder = False
  Height = 298
  Width = 490
  object nxSEng: TnxServerEngine
    ActiveRuntime = True
    Options = []
    TableExtension = 'nx1'
    Left = 128
    Top = 40
  end
  object nx1xAllEngines1: Tnx1xAllEngines
    Left = 48
    Top = 160
  end
  object nxSE: TnxSession
    ActiveRuntime = True
    ServerEngine = nxSEng
    Left = 48
    Top = 40
  end
  object Tab: TnxTable
    Database = nxDB
    Left = 48
    Top = 96
  end
  object nxDB: TnxDatabase
    Session = nxSE
    AliasPath = 'c:\meus programas\nexcafe\dados'
    Left = 128
    Top = 96
  end
end
