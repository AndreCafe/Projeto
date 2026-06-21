object Form1: TForm1
  Left = 169
  Top = 163
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 41
    Align = alTop
    TabOrder = 0
    object btnConectar: TButton
      Left = 8
      Top = 6
      Width = 50
      Height = 25
      Caption = 'jlborges'
      TabOrder = 0
      OnClick = btnConectarClick
    end
    object Button1: TButton
      Left = 68
      Top = 6
      Width = 45
      Height = 25
      Caption = 'fran'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 128
      Top = 8
      Width = 75
      Height = 25
      Caption = 'AJ'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object chFramePadrao1: TchFramePadrao
    Left = 0
    Top = 41
    Width = 688
    Height = 405
    Align = alClient
    TabOrder = 1
    ClienteChat = CHAT
  end
  object Client: TkbmMWSimpleClient
    Transport = Transp
    Left = 128
    Top = 88
  end
  object Transp: TkbmMWTCPIPIndyMessagingClientTransport
    Port = 5000
    Host = '127.0.0.1'
    StreamFormat = 'STANDARD'
    VerifyTransfer = False
    MaxRetries = 0
    MaxRetriesAlternative = 0
    RequestTimeout = 30
    MinClientPort = 0
    MaxClientPort = 0
    ConnectTimeout = 60
    Direction = [mwmdSubscribe, mwmdPublish]
    InboundMessageQueue = msgQIn
    OutboundMessageQueue = msgQOut
    Subscriptions.Strings = (
      'MSG.CHAT.TODOS.>'
      'MSG.CHAT.73M50346T.>'
      'MSG.CHAT.TODOS.>'
      'MSG.CHAT.73M50346T.>'
      'MSG.CHAT.TODOS.>'
      'MSG.CHAT.73M50346T.>'
      'MSG.CHAT.TODOS.>'
      'MSG.CHAT.73M50346T.>'
      'MSG.CHAT.TODOS.>'
      'MSG.CHAT.73M50346T.>'
      'MSG.CHAT.TODOS.>'
      'MSG.CHAT.73M50346T.>'
      'MSG.CHAT.TODOS.>'
      'MSG.CHAT.73M50346T.>'
      'MSG.CHAT.TODOS.>'
      'MSG.CHAT.73M50346T.>'
      'MSG.CHAT.TODOS.>'
      'MSG.CHAT.73M50346T.>'
      'MSG.CHAT.TODOS.>'
      'MSG.CHAT.73M50346T.>'
      'MSG.CHAT.TODOS.>'
      'MSG.CHAT.73M50346T.>'
      'MSG.CHAT.TODOS.>'
      'MSG.CHAT.73M50346T.>'
      'MSG.CHAT.TODOS.>'
      'MSG.CHAT.MRG305K3HAEV5H.>'
      'MSG.CHAT.TODOS.>'
      'MSG.CHAT.MRG305K3HAEV5H.>'
      'MSG.CHAT.TODOS.>'
      'MSG.CHAT.MRG305K3HAEV5H.>'
      'MSG.CHAT.TODOS.>'
      'MSG.CHAT.MRG305K3HAEV5H.>')
    Active = False
    Left = 160
    Top = 88
  end
  object msgQIn: TkbmMWMemoryMessageQueue
    Left = 192
    Top = 89
  end
  object msgQOut: TkbmMWMemoryMessageQueue
    Left = 224
    Top = 89
  end
  object kbmMWMessageAction1: TkbmMWMessageAction
    Left = 312
    Top = 153
  end
  object CHAT: TchKBMMW
    Conectado = False
    NodeID = 'MRG305K3HAEV5H'
    Status = 'Off-Line'
    Client = Client
    HelpDesk = True
    Left = 144
    Top = 161
  end
end
