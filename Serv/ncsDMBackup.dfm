object dmBackup: TdmBackup
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 339
  Width = 524
  object nxDBD: TnxDatabase
    Session = nxSession
    AliasPath = 'c:\meus programas\nex\sync\temp'
    Left = 232
    Top = 24
  end
  object nxDBO: TnxDatabase
    Session = nxSession
    AliasName = 'nexcafe'
    Left = 168
    Top = 24
  end
  object nxSession: TnxSession
    UserName = 'admin'
    Password = 'delphi9856'
    Left = 96
    Top = 24
  end
  object nxBackup: TnxBackupController
    DisplayName = 'Backup'
    OriginalDatabase = nxDBO
    CloneDatabase = nxDBD
    Options = []
    SourceThreadPriority = NORMAL
    TargetThreadPriority = NORMAL
    SkippedTablesCount = 0
    Left = 32
    Top = 24
  end
end
