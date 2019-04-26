object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Zerar Cr'#233'ditos de Clientes'
  ClientHeight = 257
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object PB: TProgressBar
    Left = 0
    Top = 0
    Width = 474
    Height = 16
    Align = alTop
    TabOrder = 0
  end
  object Button1: TButton
    Left = 28
    Top = 195
    Width = 75
    Height = 25
    Caption = 'ZERAR!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object edData: TcxDateEdit
    Left = 28
    Top = 134
    ParentFont = False
    Properties.ImmediateDropDownWhenActivated = True
    Properties.ImmediateDropDownWhenKeyPressed = True
    Properties.ImmediatePost = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfFlat
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 2
    Width = 161
  end
  object cxLabel1: TcxLabel
    Left = 28
    Top = 108
    Caption = 'Zerar cr'#233'ditos de clientes que n'#227'o vem na loja desde:'
  end
  object cbTempo: TcxCheckBox
    Left = 20
    Top = 28
    Cursor = crHandPoint
    Caption = 'Zerar cr'#233'dito de tempo'
    Style.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 4
    Width = 253
  end
  object cbValor: TcxCheckBox
    Left = 20
    Top = 52
    Cursor = crHandPoint
    Caption = 'Zerar cr'#233'dito de valor'
    Style.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 5
    Width = 253
  end
  object cbTodos: TcxCheckBox
    Left = 195
    Top = 134
    Cursor = crHandPoint
    Caption = 'Zerar todos'
    Style.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 6
    OnClick = cbTodosClick
    Width = 253
  end
  object nxSession1: TnxSession
    ActiveDesigntime = True
    UserName = 'admin'
    Password = 'delphi9856'
    ServerEngine = nxRemoteServerEngine1
    Left = 192
    Top = 200
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession1
    AliasName = 'NexCafe'
    Left = 216
    Top = 200
  end
  object tCli: TnxTable
    ActiveDesigntime = True
    Database = nxDB
    TableName = 'Cliente'
    IndexName = 'IUltVisita'
    Left = 280
    Top = 200
    object tCliID: TAutoIncField
      FieldName = 'ID'
    end
    object tCliNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tCliMinutos: TFloatField
      FieldName = 'Minutos'
    end
    object tCliUltVisita: TDateTimeField
      FieldName = 'UltVisita'
    end
    object tCliValorCred: TCurrencyField
      FieldName = 'ValorCred'
    end
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16200
    Left = 248
    Top = 200
  end
  object nxRemoteServerEngine1: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCP
    Left = 312
    Top = 200
  end
end
