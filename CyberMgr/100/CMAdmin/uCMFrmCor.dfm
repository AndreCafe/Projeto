object FrmCor: TFrmCor
  Left = 246
  Top = 164
  Width = 440
  Height = 305
  Caption = 'FrmCor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 22
    Width = 432
    Height = 256
    UseDockManager = False
    Align = alClient
    Bevel.BorderInnerWidth = 5
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 4
    object Grid: TdxDBGrid
      Left = 5
      Top = 5
      Width = 422
      Height = 246
      Bands = <
        item
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'Item'
      SummaryGroups = <>
      SummarySeparator = ', '
      Align = alClient
      TabOrder = 0
      DataSource = dsCores
      Filter.Criteria = {00000000}
      LookAndFeel = lfFlat
      OptionsDB = [edgoCanNavigation, edgoConfirmDelete, edgoUseBookmarks]
      OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
      OnChangeNode = GridChangeNode
      object GridItem: TdxDBGridMaskColumn
        Width = 144
        BandIndex = 0
        RowIndex = 0
        FieldName = 'Item'
      end
      object GridCorFundo: TdxDBGridPopupColumn
        HeaderAlignment = taCenter
        Width = 98
        BandIndex = 0
        RowIndex = 0
        OnCustomDrawCell = GridCorFundoCustomDrawCell
        FieldName = 'CorFundo'
        PopupControl = cbCor
        OnInitPopup = GridCorFundoInitPopup
      end
      object GridCorFonte: TdxDBGridPopupColumn
        HeaderAlignment = taCenter
        Width = 91
        BandIndex = 0
        RowIndex = 0
        OnCustomDrawCell = GridCorFundoCustomDrawCell
        FieldName = 'CorFonte'
        PopupControl = cbCor
        OnInitPopup = GridCorFundoInitPopup
      end
      object GridNegrito: TdxDBGridCheckColumn
        Alignment = taCenter
        HeaderAlignment = taCenter
        Width = 71
        BandIndex = 0
        RowIndex = 0
        FieldName = 'Negrito'
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
    end
    object cbCor: TLMDColorComboBox
      Left = 56
      Top = 112
      Width = 121
      Height = 21
      DlgOptions = []
      DlgHelpContext = 0
      DisplayStyle = csColor
      TabOrder = 1
      Visible = False
      OnChange = cbCorChange
    end
  end
  object BarMgr: TdxBarManager
    AllowReset = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'Controles'
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
            Item = cmGravar
            Visible = True
          end
          item
            Item = cmCancelar
            Visible = True
          end>
        MultiLine = True
        Name = 'Controles'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    Style = bmsFlat
    UseSystemFont = True
    Left = 176
    Top = 80
    DockControlHeights = (
      0
      0
      22
      0)
    object cmGravar: TdxBarButton
      Caption = '&Gravar'
      Category = 0
      Hint = 'Gravar'
      Visible = ivAlways
      Glyph.Data = {
        02060000424D0206000000000000360400002800000013000000170000000100
        080000000000CC010000000000000000000000010000000000001C3404002434
        1C00242424001C3C0400243C0C00244404002C5C04003C5C240044543C005C5C
        54005C5C5C00646464006C6C6C0054743C007474740044840400747C74007C7C
        7C0084848400449404006C8C540054AC0400000000008C8C8C008C948C009494
        94009C9C9C00A4A4A400ACACAC00B4B4B4006CD404006CDC040074F404007CFC
        040084FC0C0084FC14007CDC24008CFC1C008CFC240094FC240094EC3C0094FC
        2C009CFC3C0094D45C009CF44C009CFC4400A4FC4C00A4FC5400ACFC6400B4FC
        6C00B4F47400BCF48400BCFC7C00B4C4A400ACCC9400BCCCAC00BCC4B400BCCC
        B400B4E48C00BCE49400BCDCA400C4F49400C4FC8C00C0C0C000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000003F3F3F3F3F3F
        191717193F3F3F3F3F3F3F3F3F003F3F3F3F3F1712111112193F3F3F3F3F3F3F
        3F003F3F3F3F19120E0C0C0E123F3F3F3F3F3F3F3F003F3F3F3F120E0C0B0B0C
        11173F3F3F3F3F3F3F003F3F3F17110C0B0A0A0B0E123F3F3F3F3F3F3F003F3F
        3F12140702010B0B0C11173F3F3F3F3F3F003F3F3F181E1E0F03100C0C0E1219
        3F3F3F3F3F003F3F3F2422231F06080C0C0C11173F3F3F3F3F003F3F2B212223
        221305170C0C0E11173F3F3F3F003F3521222323231E06090E0C0C0E12193F3F
        3F003F2B2223272726221304180E0C0C0E123F3F3F003F2926252A2F2F261F06
        08110E0C0E11173F3F0038302D232C39332E23150311110E0C0E11173F003F39
        2E28383F37312A220F0117110E0E0E1219003F3F373F3F3F3F3A30261E060917
        110E0E1117003F3F3F3F3F3F3F3F322E2315030C1712111217003F3F3F3F3F3F
        3F3F37342D2313001819171719003F3F3F3F3F3F3F3F3F3B342E231300193F3F
        3F003F3F3F3F3F3F3F3F3F3F3C3330230F011D3F3F003F3F3F3F3F3F3F3F3F3F
        3F393E31250F0D3F3F003F3F3F3F3F3F3F3F3F3F3F3F383D312320353F003F3F
        3F3F3F3F3F3F3F3F3F3F3F3F3C2A23363F003F3F3F3F3F3F3F3F3F3F3F3F3F3F
        3F3F373F3F00}
      PaintStyle = psCaptionGlyph
      ShortCut = 16455
      OnClick = cmGravarClick
    end
    object cmCancelar: TdxBarButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777778888887
        777770000000777885555558877770000000778555DDDD555877700000007D55
        DD7777555587700000007D5577777855558770000000D55877778555D5587000
        0000D5877778555D7D5870000000D587778555D77D5870000000D58778555D77
        7D5870000000D5878555D7777D5870000000D558555D7777D558700000007D55
        55D77777D587700000007D555877778555877000000077D55588885558777000
        0000777DD555555DD7777000000077777DDDDDD7777770000000777777777777
        777770000000}
      PaintStyle = psCaptionGlyph
      ShortCut = 16451
      OnClick = cmCancelarClick
    end
  end
  object mtCores: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = -1
    FieldDefs = <
      item
        Name = 'Item'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CorFundo'
        DataType = ftInteger
      end
      item
        Name = 'CorFonte'
        DataType = ftInteger
      end
      item
        Name = 'Negrito'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '3.08'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 72
    Top = 94
    object mtCoresItem: TStringField
      FieldName = 'Item'
      Size = 15
    end
    object mtCoresCorFundo: TIntegerField
      DisplayLabel = 'Cor de Fundo'
      FieldName = 'CorFundo'
      OnGetText = mtCoresCorFundoGetText
    end
    object mtCoresCorFonte: TIntegerField
      DisplayLabel = 'Cor da Fonte'
      FieldName = 'CorFonte'
      OnGetText = mtCoresCorFonteGetText
    end
    object mtCoresNegrito: TBooleanField
      FieldName = 'Negrito'
    end
  end
  object dsCores: TDataSource
    DataSet = mtCores
    Left = 72
    Top = 174
  end
end
