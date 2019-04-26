object FrmPri: TFrmPri
  Left = 0
  Top = 0
  Caption = 'FrmPri'
  ClientHeight = 473
  ClientWidth = 702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 702
    Height = 41
    HelpType = htKeyword
    Align = alTop
    TabOrder = 0
    object Button1: TButton
      Left = 10
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
    object PB: TProgressBar
      Left = 112
      Top = 11
      Width = 377
      Height = 17
      TabOrder = 1
    end
  end
  object Grid: TcxGrid
    Left = 0
    Top = 41
    Width = 702
    Height = 432
    Align = alClient
    TabOrder = 1
    object TV: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataModeController.GridMode = True
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object TVCodigo: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'Codigo'
      end
      object TVLoja: TcxGridDBColumn
        DataBinding.FieldName = 'Loja'
        Width = 196
      end
      object TVCidade: TcxGridDBColumn
        DataBinding.FieldName = 'Cidade'
      end
      object TVUF: TcxGridDBColumn
        DataBinding.FieldName = 'UF'
        Width = 38
      end
    end
    object GL: TcxGridLevel
      GridView = TV
    end
  end
  object nxSession1: TnxSession
    ActiveDesigntime = True
    BeepOnLoginError = False
    ServerEngine = nxRemoteServerEngine1
    Left = 88
    Top = 40
  end
  object nxDatabase1: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession1
    AliasName = 'Registro'
    Left = 128
    Top = 40
  end
  object tCli: TnxTable
    Database = nxDatabase1
    Filter = '(Ativado = True)'
    Filtered = True
    TableName = 'cliente'
    IndexName = 'ILicTipoUObtemLic'
    Left = 168
    Top = 40
    object tCliCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object tCliLoja: TStringField
      FieldName = 'Loja'
      Size = 50
    end
    object tCliCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object tCliUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tCliLicVenc: TDateField
      FieldName = 'LicVenc'
    end
    object tCliUObtemLic: TDateTimeField
      FieldName = 'UObtemLic'
    end
    object tCliAtivado: TBooleanField
      FieldName = 'Ativado'
    end
    object tCliLicTipo: TWordField
      FieldName = 'LicTipo'
    end
  end
  object DataSource1: TDataSource
    DataSet = tCli
    Left = 216
    Top = 40
  end
  object nxWinsockTransport1: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    ServerNameRuntime = 'servidor'
    ServerNameDesigntime = 'servidor'
    Port = 16300
    Left = 184
    Top = 128
  end
  object nxRemoteServerEngine1: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxWinsockTransport1
    Left = 304
    Top = 160
  end
end
