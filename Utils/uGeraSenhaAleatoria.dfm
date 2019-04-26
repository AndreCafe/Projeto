object FrmPri: TFrmPri
  Left = 0
  Top = 0
  Caption = 'Gerar senha aleat'#243'ria'
  ClientHeight = 137
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Button1: TButton
    Left = 24
    Top = 88
    Width = 185
    Height = 33
    Caption = 'Gerar senha aleat'#243'ria'
    TabOrder = 0
    OnClick = Button1Click
  end
  object PB: TProgressBar
    Left = 24
    Top = 16
    Width = 377
    Height = 17
    TabOrder = 1
  end
  object nxSession1: TnxSession
    UserName = 'admin'
    Password = 'delphi9856'
    ServerEngine = nxRSE
    Left = 80
    Top = 16
  end
  object nxDB: TnxDatabase
    Session = nxSession1
    AliasName = 'NexCafe'
    Left = 112
    Top = 16
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'Cliente'
    IndexName = 'IID'
    Left = 184
    Top = 16
    object tCliID: TAutoIncField
      FieldName = 'ID'
    end
    object tCliSenha: TStringField
      FieldName = 'Senha'
    end
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16200
    Left = 144
    Top = 16
  end
  object nxRSE: TnxRemoteServerEngine
    Transport = nxTCP
    Left = 216
    Top = 16
  end
end
