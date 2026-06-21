object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 169
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object bnCalc: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Open Calc'
    TabOrder = 0
    OnClick = bnCalcClick
  end
  object Button1: TButton
    Left = 272
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object NamedPipe: TnxNamedPipeTransport
    DisplayName = 'NamedPipeTransport'
    DisplayCategory = 'Transports'
    CommandHandler = SimpleCommandHandler
    HeartbeatInterval = 0
    OverlappedClient = True
    CallbackThreadCount = 2
    Left = 48
    Top = 112
  end
  object SharedMemory: TnxSharedMemoryTransport
    DisplayCategory = 'Transports'
    CommandHandler = SimpleCommandHandler
    ServerNameDesigntime = 'NexusRemoteTest'
    HeartbeatInterval = 0
    OverlappedClient = True
    CallbackThreadCount = 2
    Left = 48
    Top = 64
  end
  object SimpleSession: TnxSimpleSession
    Transport = SharedMemory
    Left = 160
    Top = 16
  end
  object WinsockTransport: TnxWinsockTransport
    DisplayCategory = 'Transports'
    CommandHandler = SimpleCommandHandler
    HeartbeatInterval = 0
    OverlappedClient = True
    CallbackThreadCount = 2
    Left = 48
    Top = 16
  end
  object RemotingClient: TnxRemotingClient
    DisplayCategory = 'Plugins'
    Session = SimpleSession
    Left = 264
    Top = 16
  end
  object SimpleCommandHandler: TnxSimpleCommandHandler
    Left = 160
    Top = 64
  end
  object RemotingCommandHandler: TnxRemotingCommandHandler
    ActiveRuntime = True
    CommandHandler = SimpleCommandHandler
    Left = 160
    Top = 112
  end
end
