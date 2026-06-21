object NewService: TNewService
  AcquireConnection = True
  OldCreateOrder = True
  ServiceSchema = Schema
  ServiceAdapter = BinAdapter
  Left = 357
  Top = 213
  Height = 212
  Width = 216
  object BinAdapter: TDABINAdapter
    Left = 32
    Top = 8
  end
  object Schema: TDASchema
    ConnectionManager = ServerDataModule.ConnectionManager
    DataDictionary = DataDictionary
    Datasets = <>
    Commands = <>
    Left = 32
    Top = 56
  end
  object DataDictionary: TDADataDictionary
    Fields = <>
    Left = 32
    Top = 104
  end
end
