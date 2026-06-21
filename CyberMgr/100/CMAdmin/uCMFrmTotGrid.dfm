object FrmTotGrid: TFrmTotGrid
  Left = 196
  Top = 136
  Width = 544
  Height = 375
  BorderWidth = 3
  Caption = 'Totalização'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 26
    Width = 530
    Height = 5
    UseDockManager = False
    Align = alTop
    Bevel.Mode = bmCustom
    Bevel.StandardStyle = lsSingleLowered
    TabOrder = 0
  end
  object Grid: TdxDBGrid
    Left = 0
    Top = 31
    Width = 530
    Height = 311
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'ChaveIndice'
    ShowGroupPanel = True
    ShowSummaryFooter = True
    SummaryGroups = <
      item
        DefaultGroup = False
        SummaryItems = <
          item
            ColumnName = 'GridChave1'
            SummaryField = 'Chave1'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave2'
            SummaryField = 'Chave2'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave3'
            SummaryField = 'Chave3'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave4'
            SummaryField = 'Chave4'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave5'
            SummaryField = 'Chave5'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave6'
            SummaryField = 'Chave6'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave7'
            SummaryField = 'Chave7'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave8'
            SummaryField = 'Chave8'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave9'
            SummaryField = 'Chave9'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave10'
            SummaryField = 'Chave10'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave11'
            SummaryField = 'Chave11'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave12'
            SummaryField = 'Chave12'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave13'
            SummaryField = 'Chave13'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave14'
            SummaryField = 'Chave14'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave15'
            SummaryField = 'Chave15'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave16'
            SummaryField = 'Chave16'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave17'
            SummaryField = 'Chave17'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave18'
            SummaryField = 'Chave18'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave19'
            SummaryField = 'Chave19'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave20'
            SummaryField = 'Chave20'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave21'
            SummaryField = 'Chave21'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave22'
            SummaryField = 'Chave22'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave23'
            SummaryField = 'Chave23'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave24'
            SummaryField = 'Chave24'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridChave25'
            SummaryField = 'Chave25'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridOutros'
            SummaryField = 'Outros'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridMedia'
            SummaryField = 'Media'
            SummaryType = cstSum
          end
          item
            ColumnName = 'GridTotal'
            SummaryField = 'Total'
            SummaryType = cstSum
          end>
        Name = 'GridSummaryGroup1'
      end>
    SummarySeparator = ', '
    Align = alClient
    TabOrder = 5
    Visible = False
    DataSource = dsTot
    Filter.Criteria = {00000000}
    LookAndFeel = lfFlat
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoIndicator, edgoRowSelect, edgoUseBitmap]
    ShowRowFooter = True
    object GridCampo1: TdxDBGridMaskColumn
      Visible = False
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Campo1'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridCampo2: TdxDBGridMaskColumn
      Visible = False
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Campo2'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridCampo3: TdxDBGridMaskColumn
      Visible = False
      Width = 72
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Campo3'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave1: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave1'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave1'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave2: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave2'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave2'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave3: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave3'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave3'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave4: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave4'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave4'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave5: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave5'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave5'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave6: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave6'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave6'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave7: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave7'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave7'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave8: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave8'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave8'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave9: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave9'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave9'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave10: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave10'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave10'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave11: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave11'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave11'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave12: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave12'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave12'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave13: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave13'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave13'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave14: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave14'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave14'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave15: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave15'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave15'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave16: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave16'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave16'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave17: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave17'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave17'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave18: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave18'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave18'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave19: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave19'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave19'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave20: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave20'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave20'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave21: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave21'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave21'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave22: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave22'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave22'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave23: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave23'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave23'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave24: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave24'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave24'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridChave25: TdxDBGridMaskColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 69
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Chave25'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Chave25'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridOutros: TdxDBGridColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Outros'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Outros'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridMedia: TdxDBGridColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      Visible = False
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Media'
      SummaryFooterType = cstAvg
      SummaryFooterField = 'Media'
      SummaryFooterFormat = '0.00'
      SummaryType = cstAvg
      SummaryField = 'Media'
      SummaryFormat = '0.00'
      SummaryGroupName = 'GridSummaryGroup1'
    end
    object GridTotal: TdxDBGridColumn
      DisableCustomizing = True
      DisableDragging = True
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      DisableGrouping = True
      FieldName = 'Total'
      SummaryFooterType = cstSum
      SummaryFooterField = 'Total'
      SummaryFormat = '0'
      SummaryGroupName = 'GridSummaryGroup1'
    end
  end
  object BarMgr: TdxBarManager
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Custom 1'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 164
        FloatTop = 132
        FloatClientWidth = 23
        FloatClientHeight = 22
        IsMainMenu = True
        ItemLinks = <
          item
            Item = cmFechar
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmImprimir
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            Item = cmExcel
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmOpcoes
            Visible = True
          end>
        MultiLine = True
        Name = 'Custom 1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Progresso'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 26
        DockingStyle = dsTop
        FloatLeft = 164
        FloatTop = 132
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmProgresso
            Visible = True
          end>
        Name = 'Custom 2'
        OneOnRow = True
        Row = 1
        UseOwnFont = False
        Visible = False
        WholeRow = True
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 56
    Top = 128
    DockControlHeights = (
      0
      0
      26
      0)
    object cmFechar: TdxBarButton
      Caption = '&Fechar'
      Category = 0
      Hint = 'Fechar'
      Visible = ivAlways
      OnClick = cmFecharClick
    end
    object cmProgresso: TdxBarProgressItem
      Align = iaClient
      Caption = 'Somando'
      Category = 0
      Hint = 'Somando'
      Visible = ivAlways
      Width = 300
      Max = 0
    end
    object cmImprimir: TdxBarButton
      Caption = 'Imprimir'
      Category = 0
      Hint = 'Imprimir'
      Visible = ivAlways
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDDD7777777777DDDDD0000DDDD
        000000000007DDDD0000DDD07878787870707DDD0000DD0000000000000707DD
        0000DD0F8F8F8AAA8F0007DD0000DD08F8F8F999F80707DD0000DD0000000000
        0008707D0000DD08F8F8F8F8F080807D0000DDD0000000000F08007D0000DDDD
        0BFFFBFFF0F080DD0000DDDDD0F00000F0000DDD0000DDDDD0FBFFFBFF0DDDDD
        0000DDDDDD0F00000F0DDDDD0000DDDDDD0FFBFFFBF0DDDD0000DDDDDDD00000
        0000DDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDD
        DDDDDDDDDDDDDDDD0000}
      OnClick = cmImprimirClick
    end
    object cmOpcoes: TdxBarButton
      Caption = 'Opções'
      Category = 0
      Hint = 'Opções'
      Visible = ivAlways
      OnClick = cmOpcoesClick
    end
    object cmExcel: TdxBarButton
      Caption = 'Excel'
      Category = 0
      Hint = 'Excel'
      Visible = ivAlways
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888000000827272727272727278000000872727272727272728000000827F
        FFFFFFFFFFF278000000872FFFFFFF72727728000000827F2727272F27227800
        0000872F727272F272F728000000827F27272F2727F278000000872FF272F272
        72F728000000827FFF2F2727FFF278000000872FF2F272727FF728000000827F
        2F27272727F278000000872F72727F7272F728000000827F2727FFF727F27800
        0000872FFFFFFFFFFFF728000000827272727272727278000000872727272727
        272728000000888888888888888888000000}
      OnClick = cmExcelClick
    end
  end
  object mtCalc: TkbmMemTable
    Active = True
    AttachedAutoRefresh = True
    AutoIncMinValue = -1
    FieldDefs = <
      item
        Name = 'Campo1'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Campo2'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Campo3'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Chave'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Total'
        DataType = ftFloat
      end
      item
        Name = 'ChaveIndice'
        DataType = ftString
        Size = 255
      end>
    EnableIndexes = True
    AutoReposition = False
    IndexFieldNames = 'ChaveIndice'
    IndexName = 'mtCalcIndex1'
    IndexDefs = <
      item
        Name = 'mtCalcIndex1'
        Fields = 'ChaveIndice'
        Options = [ixPrimary, ixCaseInsensitive]
      end
      item
        Name = 'mtCalcIndex2'
        Fields = 'Chave'
      end
      item
        Name = 'mtCalcIndex3'
        Fields = 'Total'
        Options = [ixDescending]
      end>
    RecalcOnIndex = False
    RecalcOnFetch = True
    SortOptions = []
    AllDataOptions = [mtfSaveData, mtfSaveNonVisible, mtfSaveBlobs, mtfSaveFiltered, mtfSaveIgnoreRange, mtfSaveIgnoreMasterDetail, mtfSaveDeltas]
    StoreDataOnForm = False
    CommaTextOptions = [mtfSaveData]
    CSVQuote = '"'
    CSVFieldDelimiter = ','
    CSVRecordDelimiter = ','
    PersistentSaveOptions = [mtfSaveData, mtfSaveNonVisible, mtfSaveIgnoreRange, mtfSaveIgnoreMasterDetail]
    PersistentSaveFormat = mtsfBinary
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadLimit = -1
    EnableJournal = False
    EnableVersioning = False
    VersioningMode = mtvm1SinceCheckPoint
    FilterOptions = [foCaseInsensitive]
    Version = '2.49'
    AfterInsert = mtCalcAfterInsert
    Left = 112
    Top = 96
    object mtCalcCampo1: TStringField
      FieldName = 'Campo1'
      Size = 40
    end
    object mtCalcCampo2: TStringField
      FieldName = 'Campo2'
      Size = 40
    end
    object mtCalcCampo3: TStringField
      FieldName = 'Campo3'
      Size = 40
    end
    object mtCalcChave: TStringField
      FieldName = 'Chave'
      Size = 40
    end
    object mtCalcTotal: TFloatField
      FieldName = 'Total'
    end
    object mtCalcChaveIndice: TStringField
      FieldName = 'ChaveIndice'
      Size = 255
    end
  end
  object mtTot: TkbmMemTable
    Active = True
    AttachedAutoRefresh = True
    AutoIncMinValue = -1
    FieldDefs = <
      item
        Name = 'Chave1'
        DataType = ftFloat
      end
      item
        Name = 'Chave2'
        DataType = ftFloat
      end
      item
        Name = 'Chave3'
        DataType = ftFloat
      end
      item
        Name = 'Chave4'
        DataType = ftFloat
      end
      item
        Name = 'Chave5'
        DataType = ftFloat
      end
      item
        Name = 'Chave6'
        DataType = ftFloat
      end
      item
        Name = 'Chave7'
        DataType = ftFloat
      end
      item
        Name = 'Chave8'
        DataType = ftFloat
      end
      item
        Name = 'Chave9'
        DataType = ftFloat
      end
      item
        Name = 'Chave10'
        DataType = ftFloat
      end
      item
        Name = 'Chave11'
        DataType = ftFloat
      end
      item
        Name = 'Chave12'
        DataType = ftFloat
      end
      item
        Name = 'Chave13'
        DataType = ftFloat
      end
      item
        Name = 'Chave14'
        DataType = ftFloat
      end
      item
        Name = 'Chave15'
        DataType = ftFloat
      end
      item
        Name = 'Chave16'
        DataType = ftFloat
      end
      item
        Name = 'Chave17'
        DataType = ftFloat
      end
      item
        Name = 'Chave18'
        DataType = ftFloat
      end
      item
        Name = 'Chave19'
        DataType = ftFloat
      end
      item
        Name = 'Chave20'
        DataType = ftFloat
      end
      item
        Name = 'Chave21'
        DataType = ftFloat
      end
      item
        Name = 'Chave22'
        DataType = ftFloat
      end
      item
        Name = 'Chave23'
        DataType = ftFloat
      end
      item
        Name = 'Chave24'
        DataType = ftFloat
      end
      item
        Name = 'Chave25'
        DataType = ftFloat
      end
      item
        Name = 'Total'
        DataType = ftFloat
      end
      item
        Name = 'Media'
        DataType = ftFloat
      end
      item
        Name = 'Campo1'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Campo2'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Campo3'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Outros'
        DataType = ftFloat
      end
      item
        Name = 'ChaveIndice'
        DataType = ftString
        Size = 120
      end>
    EnableIndexes = True
    AutoReposition = False
    IndexFieldNames = 'ChaveIndice'
    IndexName = 'mtTotIndex1'
    IndexDefs = <
      item
        Name = 'mtTotIndex1'
        Fields = 'ChaveIndice'
        Options = [ixPrimary]
      end>
    RecalcOnIndex = False
    RecalcOnFetch = True
    SortOptions = []
    AllDataOptions = [mtfSaveData, mtfSaveNonVisible, mtfSaveBlobs, mtfSaveFiltered, mtfSaveIgnoreRange, mtfSaveIgnoreMasterDetail, mtfSaveDeltas]
    StoreDataOnForm = False
    CommaTextOptions = [mtfSaveData]
    CSVQuote = '"'
    CSVFieldDelimiter = ','
    CSVRecordDelimiter = ','
    PersistentSaveOptions = [mtfSaveData, mtfSaveNonVisible, mtfSaveIgnoreRange, mtfSaveIgnoreMasterDetail]
    PersistentSaveFormat = mtsfBinary
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadLimit = -1
    EnableJournal = False
    EnableVersioning = False
    VersioningMode = mtvm1SinceCheckPoint
    FilterOptions = []
    Version = '2.49'
    AfterInsert = mtTotAfterInsert
    OnCalcFields = mtTotCalcFields
    Left = 176
    Top = 104
    object mtTotChave1: TFloatField
      FieldName = 'Chave1'
    end
    object mtTotChave2: TFloatField
      FieldName = 'Chave2'
    end
    object mtTotChave3: TFloatField
      FieldName = 'Chave3'
    end
    object mtTotChave4: TFloatField
      FieldName = 'Chave4'
    end
    object mtTotChave5: TFloatField
      FieldName = 'Chave5'
    end
    object mtTotChave6: TFloatField
      FieldName = 'Chave6'
    end
    object mtTotChave7: TFloatField
      FieldName = 'Chave7'
    end
    object mtTotChave8: TFloatField
      FieldName = 'Chave8'
    end
    object mtTotChave9: TFloatField
      FieldName = 'Chave9'
    end
    object mtTotChave10: TFloatField
      FieldName = 'Chave10'
    end
    object mtTotChave11: TFloatField
      FieldName = 'Chave11'
    end
    object mtTotChave12: TFloatField
      FieldName = 'Chave12'
    end
    object mtTotChave13: TFloatField
      FieldName = 'Chave13'
    end
    object mtTotChave14: TFloatField
      FieldName = 'Chave14'
    end
    object mtTotChave15: TFloatField
      FieldName = 'Chave15'
    end
    object mtTotChave16: TFloatField
      FieldName = 'Chave16'
    end
    object mtTotChave17: TFloatField
      FieldName = 'Chave17'
    end
    object mtTotChave18: TFloatField
      FieldName = 'Chave18'
    end
    object mtTotChave19: TFloatField
      FieldName = 'Chave19'
    end
    object mtTotChave20: TFloatField
      FieldName = 'Chave20'
    end
    object mtTotChave21: TFloatField
      FieldName = 'Chave21'
    end
    object mtTotChave22: TFloatField
      FieldName = 'Chave22'
    end
    object mtTotChave23: TFloatField
      FieldName = 'Chave23'
    end
    object mtTotChave24: TFloatField
      FieldName = 'Chave24'
    end
    object mtTotChave25: TFloatField
      FieldName = 'Chave25'
    end
    object mtTotTotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total'
      Calculated = True
    end
    object mtTotMedia: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Media'
      Calculated = True
    end
    object mtTotCampo1: TStringField
      FieldName = 'Campo1'
      Size = 40
    end
    object mtTotCampo2: TStringField
      FieldName = 'Campo2'
      Size = 40
    end
    object mtTotCampo3: TStringField
      FieldName = 'Campo3'
      Size = 40
    end
    object mtTotOutros: TFloatField
      FieldName = 'Outros'
    end
    object mtTotChaveIndice: TStringField
      FieldName = 'ChaveIndice'
      Size = 120
    end
  end
  object dsTot: TDataSource
    DataSet = mtTot
    Left = 160
    Top = 160
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer1Timer
    Left = 280
    Top = 112
  end
  object CompPrinter: TdxComponentPrinter
    CurrentLink = cplGrid
    PreviewOptions.RegistryPath = 'Software\Developer Express\PrintingSystem\DesignTime'
    PrintTitle = 'Testando'
    Left = 248
    Top = 184
    object cplGrid: TdxDBGridReportLink
      Active = True
      Component = Grid
      DateTime = 37245.663664294
      DesignerHelpContext = 0
      PrinterPage.Background.Brush.Style = bsClear
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 25400
      PrinterPage.Margins.Left = 25400
      PrinterPage.Margins.Right = 10000
      PrinterPage.Margins.Top = 25400
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageFooter.Font.Color = clWindowText
      PrinterPage.PageFooter.Font.Height = -11
      PrinterPage.PageFooter.Font.Name = 'Tahoma'
      PrinterPage.PageFooter.Font.Style = []
      PrinterPage.PageHeader.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageHeader.Font.Color = clWindowText
      PrinterPage.PageHeader.Font.Height = -11
      PrinterPage.PageHeader.Font.Name = 'Tahoma'
      PrinterPage.PageHeader.Font.Style = []
      PrinterPage.PageSize.X = 279400
      PrinterPage.PageSize.Y = 215900
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportTitle.Font.Charset = DEFAULT_CHARSET
      ReportTitle.Font.Color = clWindowText
      ReportTitle.Font.Height = -19
      ReportTitle.Font.Name = 'Times New Roman'
      ReportTitle.Font.Style = [fsBold]
      BandColor = clBtnFace
      BandFont.Charset = DEFAULT_CHARSET
      BandFont.Color = clWindowText
      BandFont.Height = -11
      BandFont.Name = 'MS Sans Serif'
      BandFont.Style = []
      Color = clWindow
      EvenFont.Charset = DEFAULT_CHARSET
      EvenFont.Color = clWindowText
      EvenFont.Height = -11
      EvenFont.Name = 'Times New Roman'
      EvenFont.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      GridLineColor = clBtnFace
      GroupNodeFont.Charset = DEFAULT_CHARSET
      GroupNodeFont.Color = clWindowText
      GroupNodeFont.Height = -11
      GroupNodeFont.Name = 'Times New Roman'
      GroupNodeFont.Style = []
      GroupNodeColor = clBtnFace
      HeaderColor = clBtnFace
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -11
      HeaderFont.Name = 'MS Sans Serif'
      HeaderFont.Style = []
      OddColor = clWindow
      OddFont.Charset = DEFAULT_CHARSET
      OddFont.Color = clWindowText
      OddFont.Height = -11
      OddFont.Name = 'Times New Roman'
      OddFont.Style = []
      Options = [tlpoBands, tlpoHeaders, tlpoFooters, tlpoRowFooters, tlpoPreview, tlpoPreviewGrid, tlpoGrid, tlpoFlatCheckMarks, tlpoImages, tlpoStateImages]
      PreviewFont.Charset = DEFAULT_CHARSET
      PreviewFont.Color = clBlue
      PreviewFont.Height = -11
      PreviewFont.Name = 'MS Sans Serif'
      PreviewFont.Style = []
      RowFooterColor = cl3DLight
      RowFooterFont.Charset = DEFAULT_CHARSET
      RowFooterFont.Color = clWindowText
      RowFooterFont.Height = -11
      RowFooterFont.Name = 'MS Sans Serif'
      RowFooterFont.Style = []
    end
  end
  object mtCalc2: TkbmMemTable
    Active = True
    AttachedAutoRefresh = True
    AutoIncMinValue = -1
    FieldDefs = <
      item
        Name = 'Chave'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Total'
        DataType = ftFloat
      end>
    EnableIndexes = True
    AutoReposition = False
    IndexFieldNames = 'Chave'
    IndexName = 'mtCalc2Index1'
    IndexDefs = <
      item
        Name = 'mtCalc2Index1'
        Fields = 'Chave'
      end
      item
        Name = 'mtCalc2Index2'
        Fields = 'Total'
        Options = [ixDescending]
      end>
    RecalcOnIndex = False
    RecalcOnFetch = True
    SortOptions = []
    AllDataOptions = [mtfSaveData, mtfSaveNonVisible, mtfSaveBlobs, mtfSaveFiltered, mtfSaveIgnoreRange, mtfSaveIgnoreMasterDetail, mtfSaveDeltas]
    StoreDataOnForm = False
    CommaTextOptions = [mtfSaveData]
    CSVQuote = '"'
    CSVFieldDelimiter = ','
    CSVRecordDelimiter = ','
    PersistentSaveOptions = [mtfSaveData, mtfSaveNonVisible, mtfSaveIgnoreRange, mtfSaveIgnoreMasterDetail]
    PersistentSaveFormat = mtsfBinary
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadLimit = -1
    EnableJournal = False
    EnableVersioning = False
    VersioningMode = mtvm1SinceCheckPoint
    FilterOptions = []
    Version = '2.49'
    AfterInsert = mtCalc2AfterInsert
    Left = 104
    Top = 144
    object mtCalc2Chave: TStringField
      FieldName = 'Chave'
      Size = 40
    end
    object mtCalc2Total: TFloatField
      FieldName = 'Total'
    end
  end
  object SaveDlgXLS: TSaveDialog
    DefaultExt = 'XLS'
    Filter = 'Arquivos Excel|*.XLS'
    Left = 278
    Top = 229
  end
end
