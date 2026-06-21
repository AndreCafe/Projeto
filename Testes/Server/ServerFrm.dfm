object frmServer: TfrmServer
  Left = 0
  Top = 0
  Caption = 'Server stopped'
  ClientHeight = 205
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object bnStart: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Start Server'
    TabOrder = 0
    OnClick = bnStartClick
  end
  object bnStop: TButton
    Left = 89
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Stop Server'
    TabOrder = 1
    OnClick = bnStopClick
  end
  object Winsock: TnxWinsockTransport
    DisplayCategory = 'Transports'
    CommandHandler = SimpleCommandHandler
    Mode = nxtmListen
    RespondToBroadcasts = True
    ServerNameRuntime = 'NexusRemoteTest'
    ServerNameDesigntime = 'NexusRemoteTest'
    Left = 32
    Top = 144
  end
  object NamedPipe: TnxNamedPipeTransport
    DisplayCategory = 'Transports'
    CommandHandler = SimpleCommandHandler
    Mode = nxtmListen
    RespondToBroadcasts = True
    ServerNameRuntime = 'NexusRemoteTest'
    ServerNameDesigntime = 'NexusRemoteTest'
    Left = 32
    Top = 96
  end
  object SharedMemory: TnxSharedMemoryTransport
    DisplayCategory = 'Transports'
    CommandHandler = SimpleCommandHandler
    Mode = nxtmListen
    RespondToBroadcasts = True
    ServerNameRuntime = 'NexusRemoteTest'
    ServerNameDesigntime = 'NexusRemoteTest'
    Left = 32
    Top = 48
  end
  object SimpleCommandHandler: TnxSimpleCommandHandler
    Left = 144
    Top = 96
  end
  object RemotingCommandHandler: TnxRemotingCommandHandler
    ActiveRuntime = True
    ActiveDesigntime = True
    CommandHandler = SimpleCommandHandler
    PluginEngine = RemotingServer
    Left = 288
    Top = 96
  end
  object RemotingServer: TnxRemotingServer
    DisplayCategory = 'Plugins'
    ActiveRuntime = True
    ActiveDesigntime = True
    Left = 416
    Top = 96
  end
end
