object FrmBase: TFrmBase
  Left = 312
  Top = 213
  Caption = 'FrmBase'
  ClientHeight = 351
  ClientWidth = 668
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FrmBasePaiCreate
  CacheInstance = True
  Modal = False
  PixelsPerInch = 96
  TextHeight = 13
  object panPri: TParentedPanel
    Left = 0
    Top = 0
    Width = 668
    Height = 351
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object dxBarDockControl1: TdxBarDockControl
      Left = 0
      Top = 0
      Width = 668
      Height = 28
      Align = dalTop
      BarManager = BarMgr
      Color = clBtnFace
      ParentColor = False
      SunkenBorder = True
      UseOwnColor = True
      UseOwnSunkenBorder = True
    end
  end
  object BarMgr: TdxBarManager
    AllowCallFromAnotherForm = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmImagens.im16
    ImageOptions.LargeImages = dmImagens.im32
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 64
    Top = 48
    DockControlHeights = (
      0
      0
      0
      0)
    object BarMgrBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'BarraTabSheet'
      CaptionButtons = <>
      Color = clBtnFace
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 276
      FloatTop = 216
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'BarraTabSheet'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object cmNovo: TdxBarLargeButton
      Caption = '&Novo'
      Category = 0
      Hint = 'Novo'
      Visible = ivAlways
      LargeImageIndex = 37
      AutoGrayScale = False
      GlyphLayout = glLeft
      ShowCaption = False
      SyncImageIndex = False
      ImageIndex = 0
    end
    object cmEditar: TdxBarLargeButton
      Caption = '&Editar'
      Category = 0
      Hint = 'Editar'
      Visible = ivAlways
      LargeImageIndex = 38
      AutoGrayScale = False
      GlyphLayout = glLeft
      ShowCaption = False
      SyncImageIndex = False
      ImageIndex = 20
    end
    object cmApagar: TdxBarLargeButton
      Caption = '&Apagar'
      Category = 0
      Hint = 'Apagar'
      Visible = ivAlways
      LargeImageIndex = 40
      AutoGrayScale = False
      GlyphLayout = glLeft
      ShowCaption = False
      SyncImageIndex = False
      ImageIndex = 12
    end
    object cmAtualizar: TdxBarLargeButton
      Caption = 'A&tualizar'
      Category = 0
      Hint = 'Atualizar'
      Visible = ivAlways
      LargeImageIndex = 46
      OnClick = cmAtualizarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmHoje: TdxBarButton
      Caption = '&Hoje'
      Category = 0
      Hint = 'Hoje'
      Visible = ivAlways
      OnClick = cmHojeClick
    end
    object cmEstaSemana: TdxBarButton
      Caption = 'Esta Semana'
      Category = 0
      Hint = 'Esta Semana'
      Visible = ivAlways
      OnClick = cmEstaSemanaClick
    end
    object cmEsteMes: TdxBarButton
      Caption = 'Este M'#234's'
      Category = 0
      Hint = 'Este M'#234's'
      Visible = ivAlways
      OnClick = cmEsteMesClick
    end
    object cmEsteAno: TdxBarButton
      Caption = 'Este Ano'
      Category = 0
      Hint = 'Este Ano'
      Visible = ivAlways
      OnClick = cmEsteAnoClick
    end
    object cmTudo: TdxBarButton
      Caption = 'Tudo'
      Category = 0
      Hint = 'Tudo'
      Visible = ivAlways
      OnClick = cmTudoClick
    end
    object cmDigitarPeriodo: TdxBarButton
      Caption = 'Digitar Per'#237'odo'
      Category = 0
      Hint = 'Digitar Per'#237'odo'
      Visible = ivAlways
      OnClick = cmDigitarPeriodoClick
    end
    object cmLayCustomize: TdxBarButton
      Caption = '&Adicionar/Remover Colunas'
      Category = 0
      Hint = 'Adicionar/Remover Colunas'
      Visible = ivAlways
      ImageIndex = 21
      OnClick = cmLayCustomizeClick
    end
    object cmLaySalvar: TdxBarButton
      Caption = '&Salvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      ImageIndex = 7
      OnClick = cmLaySalvarClick
    end
    object cmLayRestaurar: TdxBarButton
      Caption = '&Restaurar layout padr'#227'o'
      Category = 0
      Hint = 'Restaurar layout padr'#227'o'
      Visible = ivAlways
      ImageIndex = 33
      OnClick = cmLayRestaurarClick
    end
    object cmExportar: TdxBarLargeButton
      Caption = '&Exportar'
      Category = 0
      Hint = 'Exportar'
      Visible = ivAlways
      LargeImageIndex = 24
      OnClick = cmExportarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmImprimir: TdxBarLargeButton
      Caption = '&Imprimir'
      Category = 0
      Hint = 'Imprimir'
      Visible = ivAlways
      LargeImageIndex = 22
      OnClick = cmImprimirClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmLayout: TdxBarLargeButton
      Align = iaRight
      Caption = 'La&yout'
      Category = 0
      Hint = 'Layout'
      Visible = ivAlways
      LargeImageIndex = 54
      OnClick = cmLayoutClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmPeriodo: TdxBarLargeButton
      Caption = 'Per'#237'odo'
      Category = 0
      Hint = 'Per'#237'odo'
      Visible = ivAlways
      LargeImageIndex = 58
      OnClick = cmPeriodoClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmUltimas24h: TdxBarButton
      Caption = 'Ultimas 24h'
      Category = 0
      Hint = 'Ultimas 24h'
      Visible = ivAlways
      OnClick = cmUltimas24hClick
    end
    object cmCfg: TdxBarLargeButton
      Caption = 'Op'#231#245'es'
      Category = 0
      Hint = 'Op'#231#245'es'
      Visible = ivAlways
      LargeImageIndex = 124
      AutoGrayScale = False
      GlyphLayout = glLeft
      ShowCaption = False
    end
  end
  object MenuGrid: TcxGridPopupMenu
    PopupMenus = <
      item
        HitTypes = [gvhtGridNone, gvhtGridTab, gvhtNone, gvhtTab, gvhtCell, gvhtExpandButton, gvhtRecord, gvhtNavigator, gvhtPreview, gvhtColumnHeader, gvhtColumnHeaderFilterButton, gvhtFilter, gvhtFooter, gvhtFooterCell, gvhtGroupFooter, gvhtGroupFooterCell, gvhtGroupByBox, gvhtIndicator, gvhtRowIndicator, gvhtRowLevelIndent, gvhtBand, gvhtBandHeader, gvhtRowCaption, gvhtSeparator, gvhtGroupSummary]
        Index = 0
      end>
    Left = 16
    Top = 49
  end
  object CP: TdxComponentPrinter
    PreviewOptions.Caption = 'Visualiza'#231#227'o de Impress'#227'o'
    Version = 0
    Left = 144
    Top = 82
  end
  object dlgExp: TSaveDialog
    FileName = 'Exportar'
    Filter = 'Excel|*.xls|Html|*.htm|Texto|*.txt'
    FilterIndex = 0
    Left = 88
    Top = 145
  end
  object pmLay: TdxBarPopupMenu
    BarManager = BarMgr
    ItemLinks = <
      item
        Visible = True
        ItemName = 'cmLayCustomize'
      end
      item
        Visible = True
        ItemName = 'cmLaySalvar'
      end
      item
        Visible = True
        ItemName = 'cmLayRestaurar'
      end>
    UseOwnFont = False
    Left = 208
    Top = 58
  end
  object pmPeriodo: TdxBarPopupMenu
    BarManager = BarMgr
    ItemLinks = <
      item
        Visible = True
        ItemName = 'cmUltimas24h'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmHoje'
      end
      item
        Visible = True
        ItemName = 'cmEstaSemana'
      end
      item
        Visible = True
        ItemName = 'cmEsteMes'
      end
      item
        Visible = True
        ItemName = 'cmEsteAno'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmTudo'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmDigitarPeriodo'
      end>
    UseOwnFont = False
    Left = 200
    Top = 140
  end
end
