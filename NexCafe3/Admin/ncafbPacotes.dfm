inherited fbPacotes: TfbPacotes
  Left = 224
  Top = 120
  Caption = 'fbPacotes'
  ClientHeight = 340
  ClientWidth = 620
  OldCreateOrder = True
  ExplicitWidth = 636
  ExplicitHeight = 376
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Width = 620
    Height = 340
    ExplicitWidth = 620
    ExplicitHeight = 340
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 620
      Height = 38
      ExplicitWidth = 620
      ExplicitHeight = 38
    end
    object Grid: TcxGrid
      Left = 0
      Top = 38
      Width = 620
      Height = 302
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      object TV: TcxGridDBTableView
        OnDblClick = cmEditarClick
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsTab
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.KeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <
          item
            Links = <>
            SummaryItems.Separator = ', '
            SummaryItems = <
              item
                Kind = skCount
              end>
          end>
        Filtering.ColumnPopup.MaxDropDownItemCount = 12
        OptionsBehavior.IncSearch = True
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        object TVCodigo1: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'ID'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Visible = False
          Width = 106
        end
        object TVHoras1: TcxGridDBColumn
          DataBinding.FieldName = 'Minutos'
          PropertiesClassName = 'TcxMaskEditProperties'
          HeaderAlignmentHorz = taCenter
          SortIndex = 0
          SortOrder = soAscending
          Width = 68
        end
        object TVValorTotal1: TcxGridDBColumn
          DataBinding.FieldName = 'Valor'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.AssignedValues.MaxValue = True
          Properties.AssignedValues.MinValue = True
          Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Properties.Nullable = False
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 76
        end
        object TVNome: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'Descr'
          Width = 165
        end
        object TVFidelidade: TcxGridDBColumn
          Caption = 'Pr'#234'mio ?'
          DataBinding.FieldName = 'Fidelidade'
          RepositoryItem = Dados.erSimNao
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000098CD290085BBA70082B7E7007EB3ED0078
            ABBA007DB5450000000000000000000000000000000000000000000000000000
            0000000000000000000000AAE248069CCEF42AC6EAFF4BE5FFFF4BE5FFFF0EB3
            E1FF0084B8FD0083BD6E00000000000000000000000000000000000000000000
            00000000000000B6F81B08A7D7F14DE9FFFF34CAECFF25B3DAFF20ADD6FF52CA
            E1FF36DCFDFF007FB5FB0089C12A000000000000000000000000000000000000
            00000000000000B3EA7F39D2F3FF1DC3EDFF2BC0E5FF4BE6FFFF32DFFFFF18AC
            D7FF2FB1D4FF08ABDBFF0083BA87000000000000000000000000000000000000
            00000000000000B9F2AC43DFFCFF2AD7FEFF43D6F3FF57EAFFFF42E4FFFF1CC1
            EBFF73ECF9FF20C5EDFF0085BFAB000000000000000000000000000000000000
            00000000000000BFF89F42DEFBFF10C6F3FF4EDCF5FF68EFFFFF52E9FFFF24C6
            EDFF28B1D7FF1CC0EAFF008DC794000000000000000000000000000000000000
            00000000000000C8FC5532D1F2FF26DBFFFF15CBF7FF45D7F5FF34CFF2FF36CC
            EFFF5FF2FFFF03A0D1FE009DD742000000000000000000000000000000000000
            0000000000000089FF0200BEEDB941DAF7FF2ED9FEFF28D7FEFF37DCFEFF45DE
            FBFF18B8E2FF00A3D8A000000000000000000000000000000000000000000000
            0000000000000000000000CAFF0A00BFF79B0DC8F7FA26D2FAFF20CCF6FF00B2
            E8ED00A8E37C0058BF0300000000000000000000000000000000000000000000
            0000000000000000000000000000A8615D3982585ACF646871FF665662FF8130
            39D7256C0E500000000000000000000000000000000000000000000000000000
            00000000000000000000B67F7F48A36E6DF9BE7876FFC47378FF5D8F47FF0D96
            15FF0E7A15FE088A185E00000000000000000000000000000000000000000000
            000000000000C1C9C903B07B7AE1DA8786FFD58183FFAA8670FF07B529FF11AD
            25FF0B9B16FF0B7F17EB00680008000000000000000000000000000000000000
            000000000000CA909031CB8C89FFF39091FFE9888BFF939A6BFF12BA38FF18B3
            31FF14B129FF0B8516FF0F901D3A000000000000000000000000000000000000
            000000000000D59E9E23C28F8EECBB8986F9B57F7EF8A07B71F5339F48F31BA1
            3AF1189B32F1149229DA108D2021000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          Width = 75
        end
        object TVFidPontos: TcxGridDBColumn
          AlternateCaption = 'Pontos Necess'#225'rios '
          Caption = 'Pontos Nec.'
          DataBinding.FieldName = 'FidPontos'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000098CD290085BBA70082B7E7007EB3ED0078
            ABBA007DB5450000000000000000000000000000000000000000000000000000
            0000000000000000000000AAE248069CCEF42AC6EAFF4BE5FFFF4BE5FFFF0EB3
            E1FF0084B8FD0083BD6E00000000000000000000000000000000000000000000
            00000000000000B6F81B08A7D7F14DE9FFFF34CAECFF25B3DAFF20ADD6FF52CA
            E1FF36DCFDFF007FB5FB0089C12A000000000000000000000000000000000000
            00000000000000B3EA7F39D2F3FF1DC3EDFF2BC0E5FF4BE6FFFF32DFFFFF18AC
            D7FF2FB1D4FF08ABDBFF0083BA87000000000000000000000000000000000000
            00000000000000B9F2AC43DFFCFF2AD7FEFF43D6F3FF57EAFFFF42E4FFFF1CC1
            EBFF73ECF9FF20C5EDFF0085BFAB000000000000000000000000000000000000
            00000000000000BFF89F42DEFBFF10C6F3FF4EDCF5FF68EFFFFF52E9FFFF24C6
            EDFF28B1D7FF1CC0EAFF008DC794000000000000000000000000000000000000
            00000000000000C8FC5532D1F2FF26DBFFFF15CBF7FF45D7F5FF34CFF2FF36CC
            EFFF5FF2FFFF03A0D1FE009DD742000000000000000000000000000000000000
            0000000000000089FF0200BEEDB941DAF7FF2ED9FEFF28D7FEFF37DCFEFF45DE
            FBFF18B8E2FF00A3D8A000000000000000000000000000000000000000000000
            0000000000000000000000CAFF0A00BFF79B0DC8F7FA26D2FAFF20CCF6FF00B2
            E8ED00A8E37C0058BF0300000000000000000000000000000000000000000000
            0000000000000000000000000000A8615D3982585ACF646871FF665662FF8130
            39D7256C0E500000000000000000000000000000000000000000000000000000
            00000000000000000000B67F7F48A36E6DF9BE7876FFC47378FF5D8F47FF0D96
            15FF0E7A15FE088A185E00000000000000000000000000000000000000000000
            000000000000C1C9C903B07B7AE1DA8786FFD58183FFAA8670FF07B529FF11AD
            25FF0B9B16FF0B7F17EB00680008000000000000000000000000000000000000
            000000000000CA909031CB8C89FFF39091FFE9888BFF939A6BFF12BA38FF18B3
            31FF14B129FF0B8516FF0F901D3A000000000000000000000000000000000000
            000000000000D59E9E23C28F8EECBB8986F9B57F7EF8A07B71F5339F48F31BA1
            3AF1189B32F1149229DA108D2021000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          Width = 90
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = FrmPri.im32
    LookAndFeel.Kind = lfStandard
    Left = 104
    Top = 120
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmNovo'
        end
        item
          Visible = True
          ItemName = 'cmEditar'
        end
        item
          Visible = True
          ItemName = 'cmApagar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmAtualizar'
        end
        item
          Visible = True
          ItemName = 'cmImprimir'
        end
        item
          Visible = True
          ItemName = 'cmExportar'
        end>
      OldName = 'BarraTabSheet1'
    end
    inherited cmNovo: TdxBarLargeButton
      OnClick = cmNovoClick
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      OnClick = cmEditarClick
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      OnClick = cmApagarClick
      ImageIndex = 12
    end
    inherited cmAtualizar: TdxBarLargeButton
      ShowCaption = False
    end
    inherited cmExportar: TdxBarLargeButton
      LargeImageIndex = 47
      ShowCaption = False
    end
    inherited cmImprimir: TdxBarLargeButton
      LargeImageIndex = 7
      ShowCaption = False
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 136
    Top = 121
  end
  inherited CP: TdxComponentPrinter
    Left = 168
    Top = 122
  end
  object Tab: TnxTable
    Database = Dados.db
    TableName = 'Pacote'
    IndexName = 'IID'
    Left = 32
    Top = 123
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabMinutos: TIntegerField
      FieldName = 'Minutos'
    end
    object TabValor: TCurrencyField
      FieldName = 'Valor'
    end
    object TabDescr: TStringField
      FieldName = 'Descr'
      Size = 30
    end
    object TabFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object TabFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 72
    Top = 123
  end
end
