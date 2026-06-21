object Form1: TForm1
  Left = 87
  Top = 189
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
  object Label1: TLabel
    Left = 384
    Top = 128
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Button1: TButton
    Left = 272
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 272
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Login'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 272
    Top = 88
    Width = 75
    Height = 25
    Caption = 'KeepAlive'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 272
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Logout'
    TabOrder = 3
    OnClick = Button4Click
  end
  object mwTCPIP: TkbmMWTCPIPIndyClientTransport
    Active = False
    Port = 3005
    Host = '200.215.37.27'
    StreamFormat = 'STANDARD'
    VerifyTransfer = False
    TransportStateOptions = []
    MaxRetries = 0
    MaxRetriesAlternative = 0
    RequestTimeout = 10
    MinClientPort = 0
    MaxClientPort = 0
    ConnectTimeout = 20
    StringConversion = mwscFixed
    Left = 184
    Top = 80
  end
  object mwCli: TkbmMWSimpleClient
    Transport = mwTCPIP
    Username = '222'
    Password = 'dudu'
    Left = 152
    Top = 80
  end
end
