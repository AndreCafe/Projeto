object Form1: TForm1
  Left = 286
  Top = 162
  Width = 511
  Height = 398
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 92
    Width = 33
    Height = 13
    Caption = 'Codigo'
  end
  object Label2: TLabel
    Left = 24
    Top = 124
    Width = 31
    Height = 13
    Caption = 'Senha'
  end
  object lbTotal: TLabel
    Left = 240
    Top = 264
    Width = 60
    Height = 13
    Caption = 'Tempo Total'
  end
  object lbRestante: TLabel
    Left = 240
    Top = 288
    Width = 79
    Height = 13
    Caption = 'Tempo Restante'
  end
  object Label3: TLabel
    Left = 24
    Top = 232
    Width = 71
    Height = 13
    Caption = 'Usu'#225'rio Cliente'
  end
  object btnConectar: TButton
    Left = 64
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Conecta'
    TabOrder = 0
    OnClick = btnConectarClick
  end
  object Button2: TButton
    Left = 104
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Login Usuario'
    Enabled = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 104
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Logout'
    Enabled = False
    TabOrder = 2
  end
  object edCod: TOvcNumericField
    Left = 63
    Top = 88
    Width = 130
    Height = 21
    Cursor = crIBeam
    DataType = nftLongInt
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Options = []
    PictureMask = 'iiiiiiiiiii'
    TabOrder = 3
    RangeHigh = {FFFFFF7F000000000000}
    RangeLow = {00000080000000000000}
  end
  object edSenha: TOvcSimpleField
    Left = 63
    Top = 120
    Width = 130
    Height = 21
    Cursor = crIBeam
    DataType = sftString
    CaretOvr.Shape = csBlock
    ControlCharColor = clRed
    DecimalPlaces = 0
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    PictureMask = 'X'
    TabOrder = 4
  end
  object edUsuario: TEdit
    Left = 104
    Top = 228
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'edUsuario'
  end
  object mwCli: TkbmMWSimpleClient
    Transport = mwTCPIP
    Left = 32
    Top = 152
  end
  object mwTCPIP: TkbmMWTCPIPIndyClientTransport
    Active = False
    Port = 3000
    Host = '127.0.0.1'
    StreamFormat = 'STANDARD'
    VerifyTransfer = False
    TransportStateOptions = []
    MaxRetries = 0
    MaxRetriesAlternative = 0
    RequestTimeout = 30
    OnConnectionLost = mwTCPIPConnectionLost
    OnDisconnected = mwTCPIPDisconnected
    MinClientPort = 0
    MaxClientPort = 0
    ConnectTimeout = 60
    StringConversion = mwscFixed
    Left = 80
    Top = 152
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = Timer1Timer
    Left = 312
    Top = 104
  end
  object Timer2: TTimer
    Left = 368
    Top = 208
  end
end
