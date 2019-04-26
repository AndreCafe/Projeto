inherited panItensVendaGrid: TpanItensVendaGrid
  Caption = 'panItensVendaGrid'
  ClientHeight = 389
  ClientWidth = 1016
  ExplicitWidth = 1024
  ExplicitHeight = 416
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TLMDSimplePanel
    Width = 1016
    Height = 389
    ExplicitWidth = 1016
    ExplicitHeight = 389
    object Grid: TcxGrid
      Left = 0
      Top = 18
      Width = 1016
      Height = 323
      Margins.Left = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      BorderStyle = cxcbsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = False
      OnEnter = GridEnter
      OnExit = GridExit
      OnResize = GridResize
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      object TV: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        OnCustomDrawCell = TVCustomDrawCell
        DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Kind = skSum
            Column = TVTotal
          end
          item
            Kind = skSum
            Position = spFooter
            Column = TVTotal
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'R$ 0.00'
            Kind = skSum
            Column = TVTotal
          end>
        DataController.Summary.SummaryGroups = <>
        DataController.OnAfterDelete = TVDataControllerAfterDelete
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.HideSelection = True
        OptionsView.CellAutoHeight = True
        OptionsView.GridLineColor = 15461355
        OptionsView.GridLines = glHorizontal
        OptionsView.GroupByBox = False
        object TVItem: TcxGridColumn
          Caption = 'Item'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = TVItemGetDisplayText
          BestFitMaxWidth = 43
          Options.Sorting = False
          Styles.Content = cxStyle3
          Width = 43
        end
        object TVCodigo: TcxGridColumn
          Caption = 'C'#243'digo'
          PropertiesClassName = 'TcxMaskEditProperties'
          Visible = False
          VisibleForCustomization = False
          Width = 112
        end
        object TVDescr: TcxGridColumn
          Caption = 'Descri'#231#227'o'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Vert = taVCenter
          Styles.Header = cxStyle2
          Width = 242
        end
        object TVQuant: TcxGridColumn
          Caption = 'Quantidade'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          OnCustomDrawCell = TVQuantCustomDrawCell
          OnGetDisplayText = TVQuantGetDisplayText
          HeaderAlignmentHorz = taCenter
          Styles.Header = cxStyle2
          Width = 140
        end
        object TVvezes: TcxGridColumn
          Caption = 'X'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = TVvezesGetDisplayText
          HeaderAlignmentHorz = taCenter
          Styles.Content = FrmPri.cxStyle39
          Styles.Header = cxStyle2
          Width = 20
        end
        object TVUnitario: TcxGridColumn
          Caption = '  Valor Unit'#225'rio'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentVert = vaCenter
          Styles.Header = cxStyle2
          Width = 156
        end
        object TVFidPontos: TcxGridColumn
          Caption = 'Pontos'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taRightJustify
          Options.Editing = False
          Options.Focusing = False
          Width = 56
        end
        object TVIgual: TcxGridColumn
          Caption = '='
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = TVIgualGetDisplayText
          HeaderAlignmentHorz = taCenter
          Styles.Content = FrmPri.cxStyle39
          Styles.Header = cxStyle2
          Width = 22
        end
        object TVTotal: TcxGridColumn
          Caption = 'Total'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taRightJustify
          HeaderAlignmentVert = vaCenter
          Styles.Header = cxStyle2
          Width = 146
        end
        object TVFidPontosTotal: TcxGridColumn
          Caption = 'Total'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Visible = False
          HeaderAlignmentHorz = taRightJustify
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taRightJustify
          Width = 47
        end
        object TVIDProduto: TcxGridColumn
          DataBinding.ValueType = 'LargeInt'
          Visible = False
          VisibleForCustomization = False
        end
        object TVCancelado: TcxGridColumn
          Visible = False
          VisibleForCustomization = False
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
    object dxBarDockControl1: TdxBarDockControl
      Left = 0
      Top = 341
      Width = 1016
      Height = 48
      Align = dalBottom
      BarManager = BarMgr
    end
    object LMDSimplePanel1: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 1016
      Height = 18
      Align = alTop
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      Color = 15724527
      TabOrder = 2
      object btnFontUp: TcxButton
        Left = 970
        Top = 0
        Width = 23
        Height = 18
        Cursor = crHandPoint
        Align = alRight
        Caption = 'Aumentar a Fonte'
        TabOrder = 0
        OnClick = btnFontUpClick
        OptionsImage.Glyph.Data = {
          E6010000424DE60100000000000036000000280000000C000000090000000100
          200000000000B001000000000000000000000000000000000000222222AA0606
          061C0000000000000000000000001D1D1D8D0C0C0C3800000000000000000000
          00FF0000000000000000222222AA1717177100000000000000000606061C3333
          33FF000000000000000000000000000000FF0000000000000000111111552E2E
          2EE2222222AA222222AA282828C6222222AA0000000000000000000000000000
          00FF000000000000000000000000333333FF17171771111111552E2E2EE21111
          1155000000000000000000000000000000FF0000000000000000000000002222
          22AA1111115500000000333333FF000000000000000000000000000000000000
          00FF00000000000000000000000011111155222222AA11111155222222AA0000
          000000000000000000FF00000000000000FF00000000000000FF000000000000
          0000333333FF222222AA11111155000000000000000000000000000000FF0000
          00FF000000FF000000000000000000000000222222AA333333FF000000000000
          0000000000000000000000000000000000FF0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000}
        PaintStyle = bpsGlyph
        SpeedButtonOptions.CanBeFocused = False
        SpeedButtonOptions.AllowAllUp = True
        SpeedButtonOptions.Flat = True
        SpeedButtonOptions.Transparent = True
      end
      object cxLabel1: TcxLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Align = alClient
        AutoSize = False
        Caption = 'Itens'
        ParentColor = False
        Style.Color = 15724527
        Style.TextColor = clGray
        Style.TextStyle = [fsBold]
        Style.TransparentBorder = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Height = 12
        Width = 941
        AnchorY = 9
      end
      object btnFontDown: TcxButton
        Left = 993
        Top = 0
        Width = 23
        Height = 18
        Cursor = crHandPoint
        Align = alRight
        Caption = 'Diminuir a Fonte'
        TabOrder = 2
        OnClick = btnFontDownClick
        OptionsImage.Glyph.Data = {
          E6010000424DE60100000000000036000000280000000C000000090000000100
          200000000000B001000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000FF00000000000000000000001C0000
          008D000000AA00000038000000AA000000000000000000000000000000FF0000
          00FF000000FF000000000000008D000000AA000000550000008D000000FF0000
          000000000000000000FF00000000000000FF00000000000000FF0000008D0000
          00AA0000001C00000000000000FF000000000000000000000000000000000000
          00FF00000000000000000000001C0000008D000000E2000000FF000000FF0000
          0000000000000000000000000000000000FF00000000000000000000001C0000
          001C000000000000001C000000FF000000000000000000000000000000000000
          00FF000000000000000000000038000000FF000000FF000000FF000000550000
          0000000000000000000000000000000000FF0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00FF0000000000000000}
        PaintStyle = bpsGlyph
        SpeedButtonOptions.CanBeFocused = False
        SpeedButtonOptions.AllowAllUp = True
        SpeedButtonOptions.Flat = True
        SpeedButtonOptions.Transparent = True
      end
      object btnBold: TcxButton
        Left = 947
        Top = 0
        Width = 23
        Height = 18
        Cursor = crHandPoint
        Align = alRight
        Caption = 'B'
        TabOrder = 3
        OnClick = btnBoldClick
        PaintStyle = bpsCaption
        SpeedButtonOptions.CanBeFocused = False
        SpeedButtonOptions.AllowAllUp = True
        SpeedButtonOptions.Flat = True
        SpeedButtonOptions.Transparent = True
      end
    end
  end
  object BarMgr: TdxBarManager
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clWhite
    ImageOptions.Images = dmImagens.im16
    ImageOptions.LargeImages = dmImagens.im24
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    Style = bmsStandard
    UseSystemFont = True
    Left = 184
    Top = 88
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
      BorderStyle = bbsNone
      Caption = 'Custom 1'
      CaptionButtons = <>
      Color = 15724527
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 669
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmRemover'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end
        item
          Visible = True
          ItemName = 'cmTotal'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object cmRemover: TdxBarLargeButton
      Caption = 'Remover item'
      Category = 0
      Enabled = False
      Hint = 'Remover item'
      Visible = ivNever
      LargeImageIndex = 7
      OnClick = cmRemoverClick
      GlyphLayout = glLeft
    end
    object cmCancelar: TdxBarLargeButton
      Caption = 'Cancelar Item'
      Category = 0
      Enabled = False
      Hint = 'Cancelar Item'
      Visible = ivNever
      LargeImageIndex = 4
      OnClick = cmCancelarClick
      GlyphLayout = glLeft
    end
    object cmTotal: TdxBarButton
      Align = iaRight
      Caption = 'R$ 10,00'
      Category = 0
      Hint = 'R$ 10,00'
      Style = cxStyle1
      Visible = ivAlways
    end
  end
  object LMDAlphaImageList1: TLMDAlphaImageList
    Left = 248
    Top = 168
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 32
    Top = 104
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -35
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clRed
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15724527
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clGray
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = 4079166
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 544
    Top = 88
  end
end
