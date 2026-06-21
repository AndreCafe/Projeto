inherited fbTitulos: TfbTitulos
  Left = 224
  Top = 230
  Caption = 'Pagar / Receber - T'#237'tulos'
  ClientHeight = 475
  ClientWidth = 795
  OldCreateOrder = True
  OnCreate = FormCreate
  ExplicitWidth = 803
  ExplicitHeight = 503
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 44
    Width = 795
    Height = 431
    ExplicitTop = 44
    ExplicitWidth = 795
    ExplicitHeight = 310
    object Grid: TcxGrid
      Left = 0
      Top = 121
      Width = 795
      Height = 310
      Align = alClient
      TabOrder = 0
      ExplicitTop = 0
      object tvFin: TcxGridDBTableView
        OnDblClick = tvFinDblClick
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.Insert.Visible = False
        NavigatorButtons.Delete.Visible = False
        NavigatorButtons.Edit.Visible = False
        NavigatorButtons.Post.Visible = False
        NavigatorButtons.Cancel.Visible = False
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.Filter.SupportedLike = False
        DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00'
            Kind = skSum
            FieldName = 'Valor'
            Column = tvFinValor
          end
          item
            Format = '0.00'
            Kind = skSum
            FieldName = 'ValorPago'
            Column = tvFinValorPago
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.Navigator = True
        OptionsView.Footer = True
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        OptionsView.NewItemRowInfoText = 'Clique aqui para adicionar um novo item'
        Preview.Column = tvFinObs
        Styles.StyleSheet = FrmPri.GridTableViewStyleSheetDevExpress
        object tvFinNomedaLoja: TcxGridDBColumn
          DataBinding.FieldName = 'Nome da Loja'
          Width = 246
        end
        object tvFinVencimento: TcxGridDBColumn
          DataBinding.FieldName = 'Vencimento'
          Width = 82
        end
        object tvFinPagamento: TcxGridDBColumn
          DataBinding.FieldName = 'Pagamento'
          Width = 91
        end
        object tvFinValor: TcxGridDBColumn
          DataBinding.FieldName = 'Valor'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.UseThousandSeparator = True
          FooterAlignmentHorz = taRightJustify
        end
        object tvFinValorPago: TcxGridDBColumn
          Caption = 'Valor Pago'
          DataBinding.FieldName = 'ValorPago'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          FooterAlignmentHorz = taRightJustify
          Width = 86
        end
        object tvFinObs: TcxGridDBColumn
          DataBinding.FieldName = 'Obs'
        end
        object tvFinDoc: TcxGridDBColumn
          DataBinding.FieldName = 'Doc'
        end
        object tvFinDescricao: TcxGridDBColumn
          DataBinding.FieldName = 'Descricao'
          Width = 289
        end
        object tvFinLancamento: TcxGridDBColumn
          DataBinding.FieldName = 'Lancamento'
          Width = 101
        end
        object tvFinTipo: TcxGridDBColumn
          DataBinding.FieldName = 'Tipo'
          Visible = False
          Width = 55
        end
        object tvFinPC: TcxGridDBColumn
          DataBinding.FieldName = 'PC'
          Visible = False
        end
      end
      object glFin: TcxGridLevel
        GridView = tvFin
      end
    end
    object LMDSimplePanel1: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 795
      Height = 121
      UseDockManager = False
      Align = alTop
      Bevel.Mode = bmEdge
      TabOrder = 1
      object cbPag: TcxComboBox
        Left = 152
        Top = 11
        Properties.DropDownListStyle = lsFixedList
        Properties.ImmediatePost = True
        Properties.Items.Strings = (
          'Vencidos'
          'A Vencer'
          'Vencidos e A Vencer'
          'Pagos'
          '')
        Style.BorderStyle = ebsFlat
        TabOrder = 0
        Text = 'Vencidos'
        Width = 168
      end
      object cbSitPag: TcxCheckBox
        Left = 10
        Top = 11
        Caption = 'Situa'#231#227'o de Pagamento'
        Properties.ImmediatePost = True
        State = cbsChecked
        Style.BorderStyle = ebsFlat
        TabOrder = 1
        Width = 138
      end
      object cxCheckBox1: TcxCheckBox
        Left = 10
        Top = 38
        Caption = 'C'#243'digo de Cliente'
        Properties.ImmediatePost = True
        Style.BorderStyle = ebsFlat
        TabOrder = 2
        Width = 119
      end
      object edCod: TcxSpinEdit
        Left = 152
        Top = 38
        Style.BorderStyle = ebsFlat
        TabOrder = 3
        Width = 65
      end
    end
    object cxNavigator1: TcxNavigator
      Left = 48
      Top = 264
      Width = 225
      Height = 25
      TabOrder = 2
    end
  end
  inherited BarMgr: TdxBarManager
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'BarraTabSheet'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmNovo
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            Item = cmEditar
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton1
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmMostrar
            UserDefine = [udWidth]
            UserWidth = 222
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmAtualizar
            UserDefine = [udPaintStyle]
            Visible = True
          end
          item
            Item = cmImprimir
            Visible = True
          end
          item
            Item = cmExportar
            Visible = True
          end>
        Name = 'BarraTabSheet'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    LargeImages = FrmPri.im32
    Left = 208
    Top = 233
    DockControlHeights = (
      0
      0
      44
      0)
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      OnClick = cmEditarClick
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
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
    object cmMostrar: TdxBarCombo
      Caption = 'Mostrar'
      Category = 0
      Hint = 'Mostrar'
      Visible = ivAlways
      Text = 'N'#227'o pagos'
      OnChange = cmMostrarChange
      ShowCaption = True
      Width = 100
      Items.Strings = (
        'N'#227'o pagos'
        'Pagos'
        'Todos')
      ItemIndex = 0
    end
    object cmBaixar: TdxBarButton
      Caption = '&Baixar'
      Category = 0
      Hint = 'Baixar'
      Visible = ivAlways
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = '&Editar Cliente'
      Category = 0
      Hint = 'Editar Cliente'
      Visible = ivAlways
      OnClick = dxBarLargeButton1Click
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 30
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 48
    Top = 233
  end
  inherited CP: TdxComponentPrinter
    Left = 112
    Top = 233
  end
  inherited dlgExp: TSaveDialog
    Left = 80
    Top = 233
  end
  inherited pmLay: TdxBarPopupMenu
    Left = 176
    Top = 233
  end
  inherited pmPeriodo: TdxBarPopupMenu
    Left = 144
    Top = 233
  end
  object nxQuery1: TnxQuery
    Left = 104
    Top = 280
  end
end
