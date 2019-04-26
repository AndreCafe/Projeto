object Form14: TForm14
  Left = 0
  Top = 0
  Caption = 'Ajustar tempo'
  ClientHeight = 208
  ClientWidth = 284
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 43
    Width = 72
    Height = 25
    Caption = 'Minutos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edMin: TcxSpinEdit
    Left = 136
    Top = 32
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.UseLeftAlignmentOnEditing = False
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -29
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 0
    Value = 15
    Width = 121
  end
  object Button1: TButton
    Left = 24
    Top = 144
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = Button1Click
  end
  object PB: TProgressBar
    Left = 24
    Top = 98
    Width = 233
    Height = 16
    TabOrder = 2
  end
  object nxRSE: TnxRemoteServerEngine
    Transport = nxTCP
    Left = 160
    Top = 24
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'Cliente'
    IndexName = 'IID'
    Left = 128
    Top = 24
    object tCliID: TAutoIncField
      FieldName = 'ID'
    end
    object tCliMinutos: TFloatField
      FieldName = 'Minutos'
    end
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16200
    Left = 88
    Top = 24
  end
  object nxDB: TnxDatabase
    Session = nxSession1
    AliasName = 'NexCafe'
    Left = 56
    Top = 24
  end
  object nxSession1: TnxSession
    UserName = 'admin'
    Password = 'delphi9856'
    ServerEngine = nxRSE
    Left = 24
    Top = 24
  end
  object PopupMenu1: TPopupMenu
    Left = 152
    Top = 136
  end
end
