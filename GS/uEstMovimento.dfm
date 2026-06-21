object Form42: TForm42
  Left = 0
  Top = 0
  Caption = 'Form42'
  ClientHeight = 532
  ClientWidth = 856
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TcxGrid
    Left = 0
    Top = 41
    Width = 856
    Height = 491
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 200
    ExplicitTop = 56
    ExplicitWidth = 250
    ExplicitHeight = 200
    object TV: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DS
      DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = '0'
          Kind = skSum
          Position = spFooter
          Column = TVQtd
        end
        item
          Format = '0'
          Kind = skSum
          Column = TVQtd
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0'
          Kind = skSum
          Column = TVQtd
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      object TVLoja: TcxGridDBColumn
        DataBinding.FieldName = 'Loja'
        Width = 75
      end
      object TVAno: TcxGridDBColumn
        DataBinding.FieldName = 'Ano'
      end
      object TVMes: TcxGridDBColumn
        DataBinding.FieldName = 'Mes'
      end
      object TVDia: TcxGridDBColumn
        DataBinding.FieldName = 'Dia'
      end
      object TVH: TcxGridDBColumn
        DataBinding.FieldName = 'H'
      end
      object TVW: TcxGridDBColumn
        DataBinding.FieldName = 'W'
      end
      object TVQtd: TcxGridDBColumn
        DataBinding.FieldName = 'Qtd'
        Width = 74
      end
    end
    object GL: TcxGridLevel
      GridView = TV
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 856
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    ExplicitLeft = 72
    ExplicitTop = 288
    ExplicitWidth = 185
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object nx1xAllEngines1: Tnx1xAllEngines
    Left = 168
    Top = 120
  end
  object nxseAllEngines1: TnxseAllEngines
    Left = 96
    Top = 120
  end
  object nxServerEngine1: TnxServerEngine
    Options = []
    TableExtension = 'nx1'
    Left = 232
    Top = 120
  end
  object nxSession1: TnxSession
    ServerEngine = nxServerEngine1
    Left = 304
    Top = 120
  end
  object nxDB: TnxDatabase
    Session = nxSession1
    AliasPath = 'c:\meus programas\nexreg\dados'
    Left = 376
    Top = 128
  end
  object Tab: TnxTable
    Database = nxDB
    Filter = 'Loja<>0'
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    OnCalcFields = TabCalcFields
    TableName = 'OpenStat'
    IndexName = 'IDataIPH'
    Left = 120
    Top = 208
    object TabData: TDateField
      FieldName = 'Data'
    end
    object TabIP: TStringField
      FieldName = 'IP'
      Size = 15
    end
    object TabH: TWordField
      FieldName = 'H'
    end
    object TabLoja: TIntegerField
      FieldName = 'Loja'
    end
    object TabW: TWordField
      FieldName = 'W'
    end
    object TabQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object TabAno: TWordField
      FieldKind = fkCalculated
      FieldName = 'Ano'
      Calculated = True
    end
    object TabMes: TWordField
      FieldKind = fkCalculated
      FieldName = 'Mes'
      Calculated = True
    end
    object TabDia: TWordField
      FieldKind = fkCalculated
      FieldName = 'Dia'
      Calculated = True
    end
  end
  object DS: TDataSource
    DataSet = Tab
    Left = 168
    Top = 208
  end
end
