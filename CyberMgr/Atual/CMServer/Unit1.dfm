object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 247
  Width = 351
  object nxBackup: TnxBackupController
    DisplayName = 'Backup'
    OriginalDatabase = nxDBO
    CloneDatabase = nxDBD
    KeepIndexes = True
    Left = 16
    Top = 16
  end
  object nxDBO: TnxDatabase
    AliasName = 'cybermgr'
    Left = 16
    Top = 80
  end
  object nxDBD: TnxDatabase
    Session = nxSession
    Left = 72
    Top = 80
  end
  object nxSession: TnxSession
    Left = 72
    Top = 16
  end
end
