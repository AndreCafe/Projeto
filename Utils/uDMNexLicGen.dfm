object dmKeyGen: TdmKeyGen
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 240
  Width = 378
  object H: TIdHTTPServer
    Bindings = <>
    CommandHandlers = <>
    DefaultPort = 16333
    Greeting.NumericCode = 0
    MaxConnectionReply.NumericCode = 0
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 0
    OnCommandGet = HCommandGet
    Left = 152
    Top = 64
  end
end
