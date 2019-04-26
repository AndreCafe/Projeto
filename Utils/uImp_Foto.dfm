object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar Fotos'
  ClientHeight = 244
  ClientWidth = 348
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
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 342
    Height = 19
    Align = alTop
    Alignment = taCenter
    Caption = 'Importar fotos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 0
    ExplicitTop = 8
    ExplicitWidth = 348
  end
  object Label2: TLabel
    Left = 16
    Top = 53
    Width = 180
    Height = 13
    Caption = 'Informa a pasta onde est'#227'o as fotos:'
  end
  object PB: TProgressBar
    Left = 0
    Top = 228
    Width = 348
    Height = 16
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 8
  end
  object Button1: TButton
    Left = 17
    Top = 97
    Width = 120
    Height = 25
    Caption = 'Importar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object edPasta: TLMDBrowseEdit
    Left = 16
    Top = 70
    Width = 304
    Height = 21
    Bevel.Mode = bmWindows
    Caret.BlinkRate = 530
    TabOrder = 2
    CustomButtons = <
      item
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000D0000000E0000000100
          0400000000007000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          300000000000000000007777777777770000FB8B8B8BB8B70000F8B8B8B88B87
          0000F8B8B8B88B870000FB8B8B8BB8B70000F8B8B8B88B870000FB8B8B8BB8B7
          0000FFFFFFFFFFF700003B8B8B877777300078B8B87333333000333333333333
          30003333333333333000}
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Index = 0
        DisplayName = 'TLMDSpecialButton'
        ImageIndex = 0
        ListIndex = 0
      end>
    CustomButtonWidth = 18
    CustomButtonParentCtlXP = False
  end
  object nxSession1: TnxSession
    ActiveDesigntime = True
    UserName = 'admin'
    Password = 'delphi9856'
    ServerEngine = nxRSE
    Left = 24
    Top = 24
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession1
    AliasName = 'NexCafe'
    Left = 64
    Top = 24
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'Cliente'
    IndexName = 'IID'
    Left = 24
    Top = 64
    object tCliID: TAutoIncField
      FieldName = 'ID'
    end
    object tCliFoto: TGraphicField
      FieldName = 'Foto'
      BlobType = ftGraphic
    end
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16200
    Left = 104
    Top = 24
  end
  object nxRSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCP
    Left = 80
    Top = 64
  end
end
