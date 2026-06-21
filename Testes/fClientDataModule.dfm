object ClientDataModule: TClientDataModule
  OldCreateOrder = True
  RemoteService = RORemoteService
  Adapter = DABinAdapter
  SchemaCall.MethodName = 'GetSchemaAsXML'
  SchemaCall.Params = <
    item
      Name = 'Result'
      ParamType = fResult
      DataType = rtString
    end>
  Left = 439
  Top = 220
  Height = 300
  Width = 300
  object ROChannel: TROIndyTCPChannel
    Left = 40
    Top = 8
  end
  object ROMessage: TROBinMessage
    Left = 40
    Top = 52
  end
  object RORemoteService: TRORemoteService
    Message = ROMessage
    Channel = ROChannel
    ServiceName = 'NewService'
    Left = 40
    Top = 96
  end
  object DABinAdapter: TDABINAdapter
    Left = 40
    Top = 142
  end
end
