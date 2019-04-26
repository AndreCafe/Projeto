object FrmDebito: TFrmDebito
  Left = 0
  Top = 0
  Caption = 'Pagamento de D'#233'bito'
  ClientHeight = 425
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panCab2: TLMDSimplePanel
    Left = 0
    Top = 48
    Width = 516
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
      Properties.Alignment.Vert = taVCenter
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
      ExplicitLeft = 123
    end
    object cxLabel2: TcxLabel
      Left = 2
      Top = 2
      Align = alLeft
      Caption = ' Cliente: '
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
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
    end
    object LMDSimplePanel3: TLMDSimplePanel
      Left = 509
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
    Top = 44
    Width = 516
    Height = 4
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 1
  end
  object LMDSimplePanel2: TLMDSimplePanel
    Left = 0
    Top = 76
    Width = 516
    Height = 349
    Align = alClient
    Bevel.Mode = bmCustom
    TabOrder = 2
    ExplicitTop = 32
    ExplicitHeight = 393
    object PngSpeedButton1: TPngSpeedButton
      Left = 272
      Top = 136
      Width = 23
      Height = 22
    end
    object dxBarDockControl2: TdxBarDockControl
      Left = 0
      Top = 0
      Width = 516
      Height = 28
      Align = dalTop
      BarManager = BarMgr
      SunkenBorder = True
      UseOwnSunkenBorder = True
    end
    object panTotais: TLMDSimplePanel
      Left = 0
      Top = 218
      Width = 516
      Height = 131
      Align = alBottom
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      TabOrder = 1
      object vgT: TcxVerticalGrid
        Left = 255
        Top = 4
        Width = 261
        Height = 123
        Align = alRight
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = True
        OptionsView.PaintStyle = psDelphi
        OptionsView.RowHeaderWidth = 165
        TabOrder = 0
        object vgTTotal: TcxEditorRow
          Options.Focusing = False
          Options.TabStop = False
          Properties.Caption = 'D'#233'bito Total'
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.Alignment.Horz = taRightJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.ReadOnly = False
          Properties.EditProperties.UseLeftAlignmentOnEditing = False
          Properties.DataBinding.ValueType = 'Currency'
          Properties.Value = 0c
        end
        object vgTSel: TcxEditorRow
          Options.Focusing = False
          Options.TabStop = False
          Properties.Caption = 'Selecionado p/ Pagamento'
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.Alignment.Horz = taRightJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.ReadOnly = False
          Properties.DataBinding.ValueType = 'Currency'
          Properties.Value = 0c
        end
        object vgTDesconto: TcxEditorRow
          Properties.Caption = 'Desconto'
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.Alignment.Horz = taRightJustify
          Properties.EditProperties.UseLeftAlignmentOnEditing = False
          Properties.EditProperties.OnChange = vgTDescontoEditPropertiesChange
          Properties.DataBinding.ValueType = 'Currency'
          Properties.Value = 0c
          Properties.OnGetEditingProperties = vgTDescontoPropertiesGetEditingProperties
          Styles.Content = cxStyle2
        end
        object vgTTotalF: TcxEditorRow
          Options.Focusing = False
          Options.TabStop = False
          Properties.Caption = 'Total-Final'
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.Alignment.Horz = taRightJustify
          Properties.EditProperties.ReadOnly = False
          Properties.EditProperties.UseLeftAlignmentOnEditing = False
          Properties.DataBinding.ValueType = 'Currency'
          Properties.Value = 0c
        end
        object vgTPagTotal: TcxEditorRow
          Properties.Caption = 'Pagamento Total ?'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
          Properties.EditProperties.Columns = 2
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.Items = <
            item
              Caption = 'Sim'
              Value = True
            end
            item
              Caption = 'N'#227'o'
              Value = False
            end>
          Properties.EditProperties.OnChange = vgTPagTotalEditPropertiesChange
          Properties.DataBinding.ValueType = 'Boolean'
          Properties.Value = True
        end
        object vgTPago: TcxEditorRow
          Properties.Caption = 'Valor Pago'
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.Alignment.Horz = taRightJustify
          Properties.EditProperties.UseLeftAlignmentOnEditing = False
          Properties.DataBinding.ValueType = 'Currency'
          Properties.Value = 0c
        end
      end
      object LMDSimplePanel4: TLMDSimplePanel
        Left = 0
        Top = 0
        Width = 516
        Height = 4
        Align = alTop
        Bevel.Mode = bmCustom
        TabOrder = 1
      end
      object LMDSimplePanel6: TLMDSimplePanel
        Left = 0
        Top = 127
        Width = 516
        Height = 4
        Align = alBottom
        Bevel.Mode = bmCustom
        TabOrder = 2
      end
    end
    object Grid: TcxGrid
      Left = 0
      Top = 28
      Width = 516
      Height = 190
      Align = alClient
      TabOrder = 2
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      ExplicitHeight = 188
      object TV: TcxGridTableView
        OnDblClick = TVDblClick
        NavigatorButtons.ConfirmDelete = False
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
          Properties.Alignment.Vert = taVCenter
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
          HeaderAlignmentVert = vaCenter
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
          HeaderAlignmentVert = vaCenter
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
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taRightJustify
          HeaderAlignmentVert = vaCenter
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
    Top = 72
    Width = 516
    Height = 4
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 3
  end
  object cbRecibo: TcxCheckBox
    Left = 8
    Top = 304
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
    TabOrder = 8
    Visible = False
    Height = 21
    Width = 86
  end
  object BarMgr: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmImagens.Imagens
    ImageOptions.LargeImages = FrmPri.im32
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 168
    Top = 208
    DockControlHeights = (
      0
      0
      44
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
      LargeImageIndex = 41
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
      LargeImageIndex = 49
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
