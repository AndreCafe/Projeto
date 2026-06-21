inherited fbProdutos: TfbProdutos
  Left = 252
  Top = 186
  Caption = 'fbProdutos'
  ClientHeight = 360
  ClientWidth = 549
  OldCreateOrder = True
  ExplicitWidth = 557
  ExplicitHeight = 387
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 58
    Width = 549
    Height = 302
    ExplicitTop = 58
    ExplicitWidth = 549
    ExplicitHeight = 302
    object Grid: TcxGrid
      Left = 0
      Top = 21
      Width = 549
      Height = 281
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object TV: TcxGridDBTableView
        OnDblClick = cmEditarClick
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsTab
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.KeyFieldNames = 'Codigo'
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
        Filtering.ColumnPopupMaxDropDownItemCount = 12
        OptionsBehavior.IncSearch = True
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        object TVDescricao: TcxGridDBColumn
          DataBinding.FieldName = 'Descricao'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 40
          Properties.ReadOnly = True
          SortIndex = 0
          SortOrder = soAscending
          Width = 221
        end
        object TVCodigo: TcxGridDBColumn
          DataBinding.FieldName = 'Codigo'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 15
          Properties.ReadOnly = True
          Options.Grouping = False
        end
        object TVEstoqueAtual: TcxGridDBColumn
          Caption = 'Estoque'
          DataBinding.FieldName = 'EstoqueAtual'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Width = 88
        end
        object TVEstoqueACE: TcxGridDBColumn
          Caption = 'Aguard. Entrada'
          DataBinding.FieldName = 'EstoqueACE'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Visible = False
          Width = 111
        end
        object TVEstoqueACS: TcxGridDBColumn
          Caption = 'Aguard. Sa'#237'da'
          DataBinding.FieldName = 'EstoqueACS'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Visible = False
          Width = 112
        end
        object TVPreco: TcxGridDBColumn
          DataBinding.FieldName = 'Preco'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Properties.Nullable = False
          Properties.ReadOnly = True
        end
        object TVCategoria: TcxGridDBColumn
          DataBinding.FieldName = 'Categoria'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 20
          Properties.ReadOnly = True
        end
        object TVCustoUnitario: TcxGridDBColumn
          DataBinding.FieldName = 'CustoUnitario'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Properties.Nullable = False
          Properties.ReadOnly = True
          Visible = False
          Width = 82
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
    object PB: TcxProgressBar
      Left = 0
      Top = 0
      Align = alTop
      TabOrder = 1
      Visible = False
      Width = 549
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
            Visible = True
          end
          item
            Item = cmEditar
            Visible = True
          end
          item
            Item = cmApagar
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmEstoque
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmAtualizar
            Visible = True
          end
          item
            Item = cmImprimir
            Visible = True
          end
          item
            Item = cmExportar
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmLayout
            Visible = True
          end>
        Name = 'BarraTabSheet'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
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
    Left = 168
    Top = 136
    DockControlHeights = (
      0
      0
      58
      0)
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
      Align = iaRight
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object cmReprocessar: TdxBarButton
      Caption = 'Reprocessar Estoque'
      Category = 0
      Hint = 'Reprocessar Estoque'
      Visible = ivAlways
      OnClick = cmReprocessarClick
    end
    object cmVendaAvulsa: TdxBarLargeButton
      Caption = '&Venda Avulsa'
      Category = 0
      Hint = 'Venda Avulsa'
      Visible = ivAlways
      OnClick = cmVendaAvulsaClick
      AutoGrayScale = False
      LargeImageIndex = 12
      ShowCaption = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmEstoque: TdxBarLargeButton
      Caption = 'Mov. Estoque'
      Category = 0
      Hint = 
        'Movimentar Estoque: Venda, Compra, Entrada e Sa'#237'da de Produtos d' +
        'o Estoque'
      Visible = ivAlways
      OnClick = cmEstoqueClick
      AutoGrayScale = False
      LargeImageIndex = 10
      ShowCaption = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmCompra: TdxBarButton
      Caption = 'Compra'
      Category = 0
      Hint = 'Compra'
      Visible = ivAlways
      OnClick = cmCompraClick
    end
    object cmEntrada: TdxBarButton
      Caption = 'Entrada'
      Category = 0
      Hint = 'Entrada'
      Visible = ivAlways
      OnClick = cmEntradaClick
    end
    object cmSaida: TdxBarButton
      Caption = 'Sa'#237'da'
      Category = 0
      Hint = 'Sa'#237'da'
      Visible = ivAlways
      OnClick = cmSaidaClick
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 32
    Top = 73
  end
  object Tab: TnxTable
    Database = Dados.db
    Timeout = 10000
    TableName = 'Produto'
    IndexName = 'IDescricao'
    Left = 56
    Top = 88
    object TabCodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      Size = 15
    end
    object TabUnid: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'Unid'
      Size = 5
    end
    object TabPreco: TCurrencyField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'Preco'
    end
    object TabObs: TMemoField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TabImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object TabEstoqueAtual: TFloatField
      FieldName = 'EstoqueAtual'
    end
    object TabCustoUnitario: TCurrencyField
      FieldName = 'CustoUnitario'
    end
    object TabEstoqueACE: TFloatField
      FieldName = 'EstoqueACE'
    end
    object TabEstoqueACS: TFloatField
      FieldName = 'EstoqueACS'
    end
    object TabEstoqueFinal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'EstoqueFinal'
      Calculated = True
    end
    object TabDescricao: TStringField
      FieldName = 'Descricao'
      Size = 55
    end
    object TabCategoria: TStringField
      FieldName = 'Categoria'
      Size = 35
    end
    object TabSubCateg: TStringField
      FieldName = 'SubCateg'
      Size = 35
    end
    object TabPodeAlterarPreco: TBooleanField
      FieldName = 'PodeAlterarPreco'
    end
    object TabNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 104
    Top = 88
  end
  object pmEstoque: TdxBarPopupMenu
    BarManager = BarMgr
    ItemLinks = <
      item
        Item = cmVendaAvulsa
        Visible = True
      end
      item
        Item = cmCompra
        Visible = True
      end
      item
        Item = cmEntrada
        Visible = True
      end
      item
        Item = cmSaida
        Visible = True
      end
      item
        BeginGroup = True
        Item = cmReprocessar
        Visible = True
      end>
    UseOwnFont = False
    Left = 248
    Top = 130
  end
end
