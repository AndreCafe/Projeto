inherited dmImpNX2: TdmImpNX2
  OldCreateOrder = True
  Height = 272
  Width = 311
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
    UserName = 'admin'
    Password = 'delphi9856'
    BeepOnLoginError = False
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
