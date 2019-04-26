object FrmPri: TFrmPri
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'NexCaf'#233': Exporta valores gastos por cliente'
  ClientHeight = 378
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 16
    Top = 24
    Caption = 'Servidor'
  end
  object edServ: TcxTextEdit
    Left = 98
    Top = 23
    Style.BorderStyle = ebsFlat
    TabOrder = 1
    Text = 'edServ'
    Width = 207
  end
  object edDataI: TcxDateEdit
    Left = 98
    Top = 50
    Properties.ImmediatePost = True
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 2
    Width = 207
  end
  object edDataF: TcxDateEdit
    Left = 98
    Top = 77
    Properties.ImmediatePost = True
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 3
    Width = 207
  end
  object cxLabel2: TcxLabel
    Left = 16
    Top = 78
    Caption = 'Data Final'
  end
  object cxLabel3: TcxLabel
    Left = 16
    Top = 52
    Caption = 'Data Inicial'
  end
  object btnExp: TcxButton
    Left = 16
    Top = 179
    Width = 129
    Height = 25
    Caption = 'Exportar'
    TabOrder = 6
    OnClick = btnExpClick
  end
  object btnFechar: TcxButton
    Left = 224
    Top = 179
    Width = 81
    Height = 25
    Caption = '&Fechar'
    TabOrder = 7
    OnClick = btnFecharClick
  end
  object PB: TcxProgressBar
    Left = 16
    Top = 120
    TabOrder = 8
    Width = 289
  end
  object lbArq: TcxLabel
    Left = 16
    Top = 140
    Caption = 'lbArq'
  end
  object LB: TListBox
    Left = 0
    Top = 224
    Width = 326
    Height = 154
    Align = alBottom
    ItemHeight = 13
    TabOrder = 10
    ExplicitLeft = -8
  end
  object nxRSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCP
    Left = 48
    Top = 96
  end
  object nxSession: TnxSession
    ActiveDesigntime = True
    Timeout = 120000
    ServerEngine = nxRSE
    Left = 80
    Top = 96
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    MaxBytesPerSecond = 0
    PingTime = 0
    Port = 16200
    Left = 16
    Top = 96
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession
    AliasName = 'NexCafe'
    Left = 112
    Top = 96
  end
  object Q: TnxQuery
    Database = nxDB
    SQL.Strings = (
      'select cliente, pago, datahora from tran'
      
        'where (datahora>=:datai) and (datahora<:dataf) and (cliente>0) a' +
        'nd (cancelado=false) and (pago>0)'
      'order by datahora')
    Left = 144
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datai'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'dataf'
        ParamType = ptInput
      end>
  end
  object DS: TDataSource
    DataSet = Q
    Left = 176
    Top = 160
  end
end
