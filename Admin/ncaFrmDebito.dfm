object FrmDebito: TFrmDebito
  Left = 0
  Top = 0
  Caption = 'Pagamento de D'#233'bito'
  ClientHeight = 519
  ClientWidth = 775
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panCab2: TLMDSimplePanel
    Left = 0
    Top = 40
    Width = 775
    Height = 24
    Align = alTop
    Bevel.Mode = bmEdge
    Bevel.StandardStyle = lsNone
    TabOrder = 0
    object lbNomeCli: TcxLabel
      Left = 49
      Top = 2
      Align = alLeft
      Caption = 'Jo'#227'o Lucio Borges '
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      Properties.Alignment.Vert = taVCenter
      AnchorY = 12
    end
    object cxLabel2: TcxLabel
      Left = 2
      Top = 2
      Align = alLeft
      Caption = ' Cliente: '
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = True
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      Properties.Alignment.Vert = taVCenter
      AnchorY = 12
    end
    object LMDSimplePanel3: TLMDSimplePanel
      Left = 768
      Top = 2
      Width = 5
      Height = 20
      Align = alRight
      Bevel.BorderSides = [fsRight]
      Bevel.Mode = bmEdge
      TabOrder = 2
    end
  end
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 36
    Width = 775
    Height = 4
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 1
  end
  object LMDSimplePanel2: TLMDSimplePanel
    Left = 0
    Top = 68
    Width = 775
    Height = 192
    Align = alClient
    Bevel.Mode = bmCustom
    TabOrder = 2
    object dxBarDockControl2: TdxBarDockControl
      Left = 0
      Top = 0
      Width = 775
      Height = 28
      Align = dalTop
      BarManager = BarMgr
      SunkenBorder = True
      UseOwnSunkenBorder = True
    end
    object Grid: TcxGrid
      Left = 0
      Top = 28
      Width = 775
      Height = 164
      Align = alClient
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      object TV: TcxGridTableView
        OnDblClick = TVDblClick
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00'
            Kind = skSum
            Column = TVTotal
          end>
        DataController.Summary.SummaryGroups = <>
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
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object TVPagar: TcxGridColumn
          Caption = 'Pagar'
          DataBinding.ValueType = 'Boolean'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Items = <
            item
              Description = 'N'#227'o'
              ImageIndex = 0
              Value = False
            end
            item
              Description = 'Sim'
              Value = True
            end>
          OnCustomDrawCell = TVPagarCustomDrawCell
          HeaderAlignmentHorz = taCenter
          Width = 42
        end
        object TVDescr: TcxGridColumn
          Caption = 'Descri'#231#227'o'
          PropertiesClassName = 'TcxMaskEditProperties'
          Options.Editing = False
          Options.Focusing = False
          Width = 260
        end
        object TVDataHora: TcxGridColumn
          Caption = 'Data e Hora'
          DataBinding.ValueType = 'DateTime'
          PropertiesClassName = 'TcxMaskEditProperties'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Focusing = False
          SortIndex = 0
          SortOrder = soAscending
          Width = 120
        end
        object TVTotal: TcxGridColumn
          Caption = 'D'#233'bito'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          HeaderAlignmentHorz = taRightJustify
          Options.Editing = False
          Options.Focusing = False
          Width = 92
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
  end
  object LMDSimplePanel5: TLMDSimplePanel
    Left = 0
    Top = 64
    Width = 775
    Height = 4
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 3
  end
  object cbRecibo: TcxCheckBox
    Left = 163
    Top = 384
    AutoSize = False
    Caption = 'Emitir Recibo'
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 6
    Visible = False
    Height = 21
    Width = 86
  end
  object panTot: TLMDSimplePanel
    Left = 0
    Top = 260
    Width = 775
    Height = 259
    Align = alBottom
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 9
    object LMDSimplePanel4: TLMDSimplePanel
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 775
      Height = 25
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      Bevel.Mode = bmCustom
      ParentColor = True
      TabOrder = 0
      object pgValPontos: TcxPageControl
        AlignWithMargins = True
        Left = 528
        Top = 0
        Width = 247
        Height = 25
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alRight
        TabOrder = 0
        Properties.ActivePage = tsTotVal
        Properties.CustomButtons.Buttons = <>
        Properties.HideTabs = True
        LookAndFeel.NativeStyle = False
        ClientRectBottom = 25
        ClientRectRight = 247
        ClientRectTop = 0
        object tsTotVal: TcxTabSheet
          Caption = 'tsTotVal'
          ImageIndex = 0
          object panTot1: TLMDSimplePanel
            Left = 0
            Top = 0
            Width = 247
            Height = 25
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            Bevel.StyleInner = bvNormal
            Bevel.WidthInner = 0
            Bevel.BorderColor = 11645361
            Bevel.BorderSides = [fsLeft]
            Bevel.BorderInnerWidth = 1
            Bevel.Mode = bmCustom
            Bevel.StandardStyle = lsNone
            Color = clWhite
            TabOrder = 0
            object panSubTotal: TLMDSimplePanel
              Left = 1
              Top = 1
              Width = 245
              Height = 24
              Margins.Bottom = 0
              Align = alTop
              Bevel.Mode = bmCustom
              ParentColor = True
              TabOrder = 0
              object edTotalDebito: TcxCurrencyEdit
                Left = 125
                Top = 0
                Align = alRight
                AutoSize = False
                EditValue = 80.000000000000000000
                Enabled = False
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Style.BorderColor = 11645361
                Style.BorderStyle = ebsNone
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.IsFontAssigned = True
                StyleDisabled.BorderColor = 11645361
                StyleDisabled.Color = clWhite
                StyleDisabled.TextColor = clGray
                TabOrder = 0
                Height = 24
                Width = 120
              end
              object lbSubTotal: TcxLabel
                AlignWithMargins = True
                Left = 6
                Top = 0
                Margins.Left = 6
                Margins.Top = 0
                Margins.Bottom = 0
                Align = alClient
                AutoSize = False
                Caption = 'Total D'#233'bito'
                FocusControl = edTotalDebito
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clGray
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.HotTrack = False
                Style.IsFontAssigned = True
                Properties.Alignment.Horz = taLeftJustify
                Properties.Alignment.Vert = taVCenter
                Height = 24
                Width = 116
                AnchorY = 12
              end
            end
            object LMDSimplePanel7: TLMDSimplePanel
              AlignWithMargins = True
              Left = 4
              Top = 25
              Width = 239
              Height = 1
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              Bevel.Mode = bmCustom
              TabOrder = 1
            end
            object LMDSimplePanel8: TLMDSimplePanel
              AlignWithMargins = True
              Left = 4
              Top = 26
              Width = 239
              Height = 1
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              Bevel.Mode = bmCustom
              TabOrder = 2
            end
          end
        end
        object tsTotPontos: TcxTabSheet
          Caption = 'tsTotPontos'
          ImageIndex = 1
          object LMDSimplePanel9: TLMDSimplePanel
            Left = 0
            Top = 0
            Width = 247
            Height = 25
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            Bevel.StyleInner = bvNormal
            Bevel.WidthInner = 0
            Bevel.BorderColor = 11645361
            Bevel.BorderSides = [fsLeft]
            Bevel.BorderInnerWidth = 1
            Bevel.Mode = bmCustom
            Bevel.StandardStyle = lsNone
            Color = clWhite
            TabOrder = 0
            object LMDSimplePanel10: TLMDSimplePanel
              Left = 1
              Top = 26
              Width = 245
              Height = 24
              Margins.Left = 0
              Margins.Top = 2
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              Bevel.Mode = bmCustom
              ParentColor = True
              TabOrder = 0
              object cxLabel5: TcxLabel
                AlignWithMargins = True
                Left = 6
                Top = 0
                Margins.Left = 6
                Margins.Top = 0
                Margins.Bottom = 0
                Align = alLeft
                Caption = 'Pontos Dispon'#237'veis'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clBlack
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.HotTrack = False
                Style.IsFontAssigned = True
                StyleFocused.BorderStyle = ebsNone
                StyleHot.BorderStyle = ebsNone
                StyleHot.TextColor = clBlue
                StyleHot.TextStyle = [fsUnderline]
                Properties.Alignment.Horz = taLeftJustify
                Properties.Alignment.Vert = taVCenter
                AnchorY = 12
              end
              object lbDisp: TcxLabel
                Left = 152
                Top = 0
                Align = alRight
                AutoSize = False
                Caption = '0'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -16
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.IsFontAssigned = True
                Properties.Alignment.Horz = taRightJustify
                Properties.Alignment.Vert = taVCenter
                Height = 24
                Width = 93
                AnchorX = 245
                AnchorY = 12
              end
            end
            object LMDSimplePanel11: TLMDSimplePanel
              Left = 1
              Top = 1
              Width = 245
              Height = 24
              Margins.Bottom = 0
              Align = alTop
              Bevel.Mode = bmCustom
              ParentColor = True
              TabOrder = 1
              object cxLabel6: TcxLabel
                AlignWithMargins = True
                Left = 6
                Top = 0
                Margins.Left = 6
                Margins.Top = 0
                Margins.Bottom = 0
                Align = alLeft
                Caption = 'Pontos Necess'#225'rios'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clBlack
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.HotTrack = False
                Style.IsFontAssigned = True
                Properties.Alignment.Horz = taLeftJustify
                Properties.Alignment.Vert = taVCenter
                AnchorY = 12
              end
              object lbNec: TcxLabel
                Left = 152
                Top = 0
                Align = alRight
                AutoSize = False
                Caption = '0'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -16
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.IsFontAssigned = True
                Properties.Alignment.Horz = taRightJustify
                Properties.Alignment.Vert = taVCenter
                Height = 24
                Width = 93
                AnchorX = 245
                AnchorY = 12
              end
            end
            object LMDSimplePanel12: TLMDSimplePanel
              AlignWithMargins = True
              Left = 4
              Top = 25
              Width = 239
              Height = 1
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              Bevel.Mode = bmCustom
              TabOrder = 2
            end
            object LMDSimplePanel13: TLMDSimplePanel
              AlignWithMargins = True
              Left = 4
              Top = 50
              Width = 239
              Height = 1
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              Bevel.Mode = bmCustom
              TabOrder = 3
            end
          end
        end
        object tsCusto: TcxTabSheet
          Caption = 'tsCusto'
          ImageIndex = 2
          object panTotCusto: TLMDSimplePanel
            Left = 0
            Top = 0
            Width = 247
            Height = 26
            Margins.Left = 0
            Margins.Top = 2
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Bevel.BorderColor = 11645361
            Bevel.BorderInnerWidth = 1
            Bevel.Mode = bmStandard
            Bevel.StandardStyle = lsNone
            Color = clWhite
            TabOrder = 0
            object edCustoT: TcxCurrencyEdit
              Left = 126
              Top = 1
              TabStop = False
              Align = alRight
              EditValue = 80.000000000000000000
              Enabled = False
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.ReadOnly = True
              Style.BorderColor = 11645361
              Style.BorderStyle = ebsNone
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -13
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.IsFontAssigned = True
              StyleDisabled.Color = clWhite
              StyleDisabled.TextColor = clBlack
              StyleFocused.BorderStyle = ebsNone
              TabOrder = 0
              Width = 120
            end
            object lbTotCusto: TcxLabel
              AlignWithMargins = True
              Left = 7
              Top = 1
              Cursor = crHandPoint
              Margins.Left = 6
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alLeft
              Caption = 'Total'
              ParentColor = False
              ParentFont = False
              Style.Color = clWhite
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -13
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.TextColor = 6974058
              Style.IsFontAssigned = True
              StyleHot.TextColor = clBlue
              StyleHot.TextStyle = [fsBold, fsUnderline]
              Properties.Alignment.Horz = taLeftJustify
              Properties.Alignment.Vert = taVCenter
              AnchorY = 13
            end
            object cxLabel4: TcxLabel
              AlignWithMargins = True
              Left = 108
              Top = 1
              Cursor = crHandPoint
              Margins.Left = 10
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alRight
              Caption = '='
              ParentColor = False
              ParentFont = False
              Style.Color = clWhite
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -13
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.HotTrack = True
              Style.TextColor = 6118749
              Style.IsFontAssigned = True
              StyleFocused.BorderStyle = ebsNone
              StyleHot.BorderStyle = ebsNone
              StyleHot.TextColor = clBlue
              StyleHot.TextStyle = [fsBold, fsUnderline]
              Properties.Alignment.Horz = taLeftJustify
              Properties.Alignment.Vert = taVCenter
              AnchorY = 13
            end
          end
        end
      end
      object cxLabel3: TcxLabel
        AlignWithMargins = True
        Left = 0
        Top = 2
        Margins.Left = 0
        Margins.Top = 2
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Caption = 
          'D'#234' um duplo clique no item para marcar/desmarcar sua sele'#231#227'o par' +
          'a pagamento'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clGray
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taCenter
        Properties.WordWrap = True
        ExplicitHeight = 25
        Width = 523
        AnchorX = 262
      end
    end
  end
  object BarMgr: TdxBarManager
    AllowReset = False
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
    ImageOptions.Images = dmImagens.im16
    ImageOptions.LargeImages = dmImagens.im24
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 168
    Top = 208
    DockControlHeights = (
      0
      0
      36
      0)
    object BarMgrBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Controles'
      CaptionButtons = <>
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
          Visible = True
          ItemName = 'cmGravar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end
        item
          Visible = True
          ItemName = 'cmRecibo'
        end>
      MultiLine = True
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Controles'
      OneOnRow = True
      Row = 0
      ShowMark = False
      SizeGrip = False
      UseOwnFont = False
      UseRecentItems = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object BarMgrBar2: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 363
      FloatTop = 333
      FloatClientWidth = 84
      FloatClientHeight = 44
      ItemLinks = <
        item
          UserDefine = [udPaintStyle]
          Visible = True
          ItemName = 'cmTodos'
        end
        item
          BeginGroup = True
          UserDefine = [udPaintStyle]
          Visible = True
          ItemName = 'cmNenhum'
        end
        item
          BeginGroup = True
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'cmEditar'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Custom 1'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object cmTodos: TdxBarButton
      Align = iaRight
      Caption = 'Todos'
      Category = 0
      Hint = 'Marcar todos itens'
      Visible = ivAlways
      PaintStyle = psCaption
      UnclickAfterDoing = False
      OnClick = cmTodosClick
    end
    object cmNenhum: TdxBarButton
      Align = iaRight
      Caption = 'Nenhum'
      Category = 0
      Hint = 'Desmarcar todos itens'
      Visible = ivAlways
      UnclickAfterDoing = False
      OnClick = cmNenhumClick
    end
    object cmGravar: TdxBarLargeButton
      Caption = '&Salvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = cmGravarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      SyncImageIndex = False
      ImageIndex = 28
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmEditar: TdxBarButton
      Align = iaRight
      Caption = '&Detalhes do Item'
      Category = 0
      Hint = 'Detalhes do Item'
      Visible = ivNever
      ImageIndex = 29
      UnclickAfterDoing = False
    end
    object cmRecibo: TdxBarControlContainerItem
      Align = iaRight
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = cbRecibo
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 72
    Top = 208
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clWindowText
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clRed
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWindow
      TextColor = clBlue
    end
  end
end
