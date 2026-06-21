inherited fbTran: TfbTran
  Left = 47
  Top = 116
  Caption = 'Transa'#231#245'es'
  ClientHeight = 379
  ClientWidth = 804
  OldCreateOrder = True
  OnCreate = FrmBasePaiCreate
  ExplicitWidth = 812
  ExplicitHeight = 407
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 58
    Width = 804
    Height = 321
    ExplicitTop = 58
    ExplicitWidth = 804
    ExplicitHeight = 321
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 804
      Height = 165
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object TV: TcxGridDBTableView
        OnDblClick = TVDblClick
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.Insert.Visible = False
        NavigatorButtons.Delete.Enabled = False
        NavigatorButtons.Delete.Visible = False
        NavigatorButtons.Edit.Enabled = False
        NavigatorButtons.Edit.Visible = False
        NavigatorButtons.Cancel.Enabled = False
        NavigatorButtons.Cancel.Visible = False
        DataController.DataModeController.GridMode = True
        DataController.DataSource = dsTab
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.Filter.SupportedLike = False
        DataController.KeyFieldNames = 'Numero'
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
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.Navigator = True
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        object TVMaquina: TcxGridDBColumn
          Caption = 'Maq'
          DataBinding.FieldName = 'Maquina'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Width = 51
        end
        object TVData: TcxGridDBColumn
          DataBinding.FieldName = 'Data'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ShowTime = False
          Width = 95
        end
        object TVInicio: TcxGridDBColumn
          Caption = 'Hora'
          DataBinding.FieldName = 'Inicio'
          PropertiesClassName = 'TcxTimeEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Width = 79
        end
        object TVTempo: TcxGridDBColumn
          DataBinding.FieldName = 'Tempo'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DateButtons = [btnClear, btnToday]
          Properties.DateOnError = deToday
          HeaderAlignmentHorz = taCenter
          Width = 71
        end
        object TVTipo: TcxGridDBColumn
          Caption = 'Tipo de Transa'#231#227'o'
          DataBinding.FieldName = 'Tipo'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownRows = 7
          Properties.Items = <
            item
              Description = 'Acesso'
              ImageIndex = 0
              Value = '0'
            end
            item
              Description = 'Venda de Pacote'
              ImageIndex = 1
              Value = '1'
            end
            item
              Description = 'Cr'#233'dito de Tempo'
              ImageIndex = 2
              Value = '2'
            end
            item
              Description = 'Manuten'#231#227'o'
              ImageIndex = 3
              Value = '3'
            end
            item
              Description = 'Acesso + Venda'
              ImageIndex = 4
              Value = '4'
            end
            item
              Description = 'D'#233'bito de Tempo'
              ImageIndex = 5
              Value = '5'
            end
            item
              Description = 'Sinal'
              ImageIndex = 6
              Value = '6'
            end
            item
              Description = 'Venda Avulsa'
              ImageIndex = 7
              Value = '7'
            end
            item
              Description = 'Compra'
              ImageIndex = 8
              Value = '8'
            end
            item
              Description = 'Entrada de Estoque'
              ImageIndex = 9
              Value = '9'
            end
            item
              Description = 'Sa'#237'da de Estoque'
              ImageIndex = 10
              Value = '10'
            end
            item
              Description = 'Pagamento de D'#233'bito'
              ImageIndex = 11
              Value = '11'
            end
            item
              Description = 'Suprimento de Caixa'
              ImageIndex = 12
              Value = '12'
            end
            item
              Description = 'Sangria de Caixa'
              ImageIndex = 13
              Value = '13'
            end
            item
              Description = 'Venda Passaporte'
              ImageIndex = 14
              Value = '14'
            end>
          Properties.ReadOnly = False
          MinWidth = 16
          Width = 118
        end
        object TVNome: TcxGridDBColumn
          DataBinding.FieldName = 'Nome'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 40
          Properties.ReadOnly = False
          SortIndex = 0
          SortOrder = soAscending
          Width = 143
        end
        object TVValorFinal: TcxGridDBColumn
          Caption = 'Total Final'
          DataBinding.FieldName = 'ValorFinal'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          OnGetDisplayText = TVValorFinalGetDisplayText
          HeaderAlignmentHorz = taCenter
          Width = 80
        end
        object TVStatusPagto: TcxGridDBColumn
          Caption = 'Pagto.'
          DataBinding.FieldName = 'StatusPagto'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DropDownRows = 7
          Properties.Items = <
            item
              Description = 'Em Andamento'
              ImageIndex = 0
              Value = '0'
            end
            item
              Description = 'Aguarda Pagto.'
              ImageIndex = 1
              Value = '1'
            end
            item
              Description = 'Sim'
              ImageIndex = 2
              Value = '2'
            end
            item
              Description = 'N'#227'o'
              ImageIndex = 3
              Value = '3'
            end>
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          MinWidth = 16
          Width = 87
        end
        object TVTipoAcesso: TcxGridDBColumn
          Caption = 'Tipo de Acesso'
          DataBinding.FieldName = 'NomeTipoAcesso'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownRows = 7
          Properties.ImmediateDropDown = False
          Properties.KeyFieldNames = 'Codigo'
          Properties.ListColumns = <
            item
              FieldName = 'Nome'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.MaxLength = 30
          Properties.ReadOnly = False
          Width = 96
        end
        object TVFim: TcxGridDBColumn
          Caption = 'Hora Final'
          DataBinding.FieldName = 'Fim'
          PropertiesClassName = 'TcxTimeEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Width = 86
        end
        object TVDesconto: TcxGridDBColumn
          DataBinding.FieldName = 'Desconto'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Properties.Nullable = False
          Properties.ReadOnly = False
          Width = 89
        end
        object TVDescontoProduto: TcxGridDBColumn
          Caption = 'Desc. Produtos'
          DataBinding.FieldName = 'DescontoProduto'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Properties.Nullable = False
          Properties.ReadOnly = False
          Width = 99
        end
        object TVObsSt: TcxGridDBColumn
          Caption = 'Obs'
          DataBinding.FieldName = 'ObsSt'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 200
          Properties.ReadOnly = False
          Width = 215
        end
        object TVNomeFuncI: TcxGridDBColumn
          Caption = 'Funcion'#225'rio'
          DataBinding.FieldName = 'NomeFuncI'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownRows = 7
          Properties.ImmediateDropDown = False
          Properties.KeyFieldNames = 'Username'
          Properties.ListColumns = <
            item
              FieldName = 'Nome'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.MaxLength = 30
          Properties.ReadOnly = False
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
    object gridAP: TcxGrid
      Left = 0
      Top = 173
      Width = 804
      Height = 148
      Align = alBottom
      TabOrder = 1
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      RootLevelOptions.DetailTabsPosition = dtpTop
      object tvAP: TcxGridDBTableView
        OnDblClick = tvAPDblClick
        NavigatorButtons.ConfirmDelete = False
        DataController.DataModeController.GridMode = True
        DataController.DataSource = dsAP
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.KeyFieldNames = 'Numero'
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
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = 'Maq'
          DataBinding.FieldName = 'Maquina'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Width = 50
        end
        object cxGridDBColumn2: TcxGridDBColumn
          DataBinding.FieldName = 'Data'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ShowTime = False
          Width = 95
        end
        object cxGridDBColumn3: TcxGridDBColumn
          Caption = 'Hora'
          DataBinding.FieldName = 'Inicio'
          PropertiesClassName = 'TcxTimeEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Width = 79
        end
        object cxGridDBColumn4: TcxGridDBColumn
          DataBinding.FieldName = 'Tempo'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DateButtons = [btnClear, btnToday]
          Properties.DateOnError = deToday
          HeaderAlignmentHorz = taCenter
          Width = 71
        end
        object cxGridDBColumn5: TcxGridDBColumn
          Caption = 'Tipo de Transa'#231#227'o'
          DataBinding.FieldName = 'Tipo'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownRows = 7
          Properties.Items = <
            item
              Description = 'Acesso'
              ImageIndex = 0
              Value = '0'
            end
            item
              Description = 'Venda de Pacote'
              ImageIndex = 1
              Value = '1'
            end
            item
              Description = 'Cr'#233'dito de Tempo'
              ImageIndex = 2
              Value = '2'
            end
            item
              Description = 'Manuten'#231#227'o'
              ImageIndex = 3
              Value = '3'
            end
            item
              Description = 'Acesso + Venda'
              ImageIndex = 4
              Value = '4'
            end
            item
              Description = 'D'#233'bito de Tempo'
              ImageIndex = 5
              Value = '5'
            end
            item
              Description = 'Sinal'
              ImageIndex = 6
              Value = '6'
            end
            item
              Description = 'Venda Avulsa'
              ImageIndex = 7
              Value = '7'
            end
            item
              Description = 'Compra'
              ImageIndex = 8
              Value = '8'
            end
            item
              Description = 'Entrada de Estoque'
              ImageIndex = 9
              Value = '9'
            end
            item
              Description = 'Sa'#237'da de Estoque'
              ImageIndex = 10
              Value = '10'
            end
            item
              Description = 'Pagamento de D'#233'bito'
              ImageIndex = 11
              Value = '11'
            end
            item
              Description = 'Suprimento de Caixa'
              ImageIndex = 12
              Value = '12'
            end
            item
              Description = 'Sangria de Caixa'
              ImageIndex = 13
              Value = '13'
            end
            item
              Description = 'Venda Passaporte'
              ImageIndex = 14
              Value = '14'
            end>
          Properties.ReadOnly = False
          MinWidth = 16
          Width = 118
        end
        object cxGridDBColumn6: TcxGridDBColumn
          DataBinding.FieldName = 'Nome'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 40
          Properties.ReadOnly = False
          SortIndex = 0
          SortOrder = soAscending
          Width = 145
        end
        object cxGridDBColumn7: TcxGridDBColumn
          Caption = 'Total Final'
          DataBinding.FieldName = 'ValorFinal'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          OnGetDisplayText = TVValorFinalGetDisplayText
          HeaderAlignmentHorz = taCenter
          Width = 80
        end
      end
      object glAP: TcxGridLevel
        Caption = 
          'Itens aguardando o registro do pagamento. D'#234' um duplo clique no ' +
          'item para editar as informa'#231#245'es de pagamento.'
        GridView = tvAP
      end
    end
    object splitAP: TcxSplitter
      Left = 0
      Top = 165
      Width = 804
      Height = 8
      HotZoneClassName = 'TcxSimpleStyle'
      HotZone.Visible = False
      AlignSplitter = salBottom
      Control = gridAP
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
            Item = cmCaixa
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmFiltroTipo
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
            Item = cmPeriodo
            Visible = True
          end
          item
            Item = cmLayout
            Visible = True
          end>
        Name = 'BarraTabSheet'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default'
      'Caixa')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    LargeImages = FrmPri.im32
    LookAndFeel.Kind = lfOffice11
    Left = 131
    Top = 91
    DockControlHeights = (
      0
      0
      58
      0)
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      Caption = '&Editar Transa'#231#227'o'
      Hint = 'Editar Transa'#231#227'o'
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
      Align = iaRight
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      GlyphLayout = glLeft
      ImageIndex = -1
    end
    object cmMostrar: TdxBarCombo
      Caption = 'Mostrar'
      Category = 0
      Hint = 'Mostrar'
      Visible = ivAlways
      Text = 'Todas transa'#231#245'es'
      OnChange = cmMostrarChange
      ShowCaption = True
      Width = 100
      ShowEditor = False
      Items.Strings = (
        'Aguardando Pagamento'
        'Todas transa'#231#245'es')
      ItemIndex = 1
    end
    object cmCaixa: TdxBarLargeButton
      Caption = 'Caixa'
      Category = 1
      Hint = 'Caixa'
      Visible = ivAlways
      OnClick = cmCaixaClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 9
    end
    object cmFiltroTipo: TdxBarLargeButton
      Caption = 'Filtrar'
      Category = 0
      Hint = 
        'Clique aqui para filtrar os tipos de transa'#231#245'es que devem ser ex' +
        'ibidos'
      Visible = ivAlways
      OnClick = cmFiltroTipoClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 43
    end
    object cmVerFechar: TdxBarButton
      Caption = 'Ver Total / Fechar / Imprimir'
      Category = 1
      Hint = 'Ver Total / Fechar / Imprimir'
      Visible = ivAlways
      OnClick = cmVerFecharClick
    end
    object cmSuprimento: TdxBarButton
      Caption = 'Suprimento - Entrada de Dinheiro no Caixa'
      Category = 1
      Hint = 'Suprimento - Entrada de Dinheiro no Caixa'
      Visible = ivAlways
      OnClick = cmSuprimentoClick
    end
    object cmSangria: TdxBarButton
      Caption = 'Sangria - Sa'#237'da de Dinheiro do Caixa'
      Category = 1
      Hint = 'Sangria - Sa'#237'da de Dinheiro do Caixa'
      Visible = ivAlways
      OnClick = cmSangriaClick
    end
  end
  inherited CP: TdxComponentPrinter
    Left = 184
    Top = 106
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    Left = 100
    Top = 91
  end
  object Tab: TnxTable
    Database = Dados.db
    FilterOptions = [foCaseInsensitive]
    OnCalcFields = TabCalcFields
    TableName = 'Transacao'
    IndexName = 'IData'
    Left = 8
    Top = 91
    object TabData: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'Data'
      DisplayFormat = 'dd/mm/yyyy'
      Calculated = True
    end
    object TabValorFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorFinal'
      Calculated = True
    end
    object TabNomeTipoAcesso: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeTipoAcesso'
      LookupDataSet = Dados.tbTipoAcesso
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'TipoAcesso'
      Size = 30
      Lookup = True
    end
    object TabNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object TabCaixaI: TIntegerField
      FieldName = 'CaixaI'
    end
    object TabCaixaF: TIntegerField
      FieldName = 'CaixaF'
    end
    object TabCaixaP: TIntegerField
      FieldName = 'CaixaP'
    end
    object TabTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object TabInicio: TDateTimeField
      FieldName = 'Inicio'
      DisplayFormat = 'hh:mm:ss'
    end
    object TabFim: TDateTimeField
      FieldName = 'Fim'
      DisplayFormat = 'hh:mm:ss'
    end
    object TabDataPagto: TDateTimeField
      FieldName = 'DataPagto'
    end
    object TabContato: TIntegerField
      FieldName = 'Contato'
    end
    object TabNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object TabMaquina: TWordField
      FieldName = 'Maquina'
    end
    object TabTipo: TWordField
      FieldName = 'Tipo'
    end
    object TabFuncI: TStringField
      FieldName = 'FuncI'
      Size = 10
    end
    object TabFuncF: TStringField
      FieldName = 'FuncF'
      Size = 40
    end
    object TabTempo: TDateTimeField
      FieldName = 'Tempo'
      DisplayFormat = 'hh:mm:ss'
    end
    object TabTempoCobrado: TDateTimeField
      FieldName = 'TempoCobrado'
    end
    object TabCredUsado: TIntegerField
      FieldName = 'CredUsado'
    end
    object TabCredAnterior: TIntegerField
      FieldName = 'CredAnterior'
    end
    object TabDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object TabProdutos: TCurrencyField
      FieldName = 'Produtos'
    end
    object TabValor: TCurrencyField
      FieldName = 'Valor'
    end
    object TabObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TabIsento: TBooleanField
      FieldName = 'Isento'
    end
    object TabNaoUsarPacote: TBooleanField
      FieldName = 'NaoUsarPacote'
    end
    object TabCodPacote: TWordField
      FieldName = 'CodPacote'
    end
    object TabSinal: TCurrencyField
      FieldName = 'Sinal'
    end
    object TabTransacaoVinculada: TIntegerField
      FieldName = 'TransacaoVinculada'
    end
    object TabValorFinalAcesso: TCurrencyField
      FieldName = 'ValorFinalAcesso'
    end
    object TabDescontoProduto: TCurrencyField
      FieldName = 'DescontoProduto'
    end
    object TabNumDoc: TStringField
      FieldName = 'NumDoc'
      Size = 15
    end
    object TabStatusPagto: TWordField
      FieldName = 'StatusPagto'
    end
    object TabObsSt: TStringField
      FieldKind = fkCalculated
      FieldName = 'ObsSt'
      Size = 200
      Calculated = True
    end
    object TabNomeFuncI: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeFuncI'
      LookupDataSet = Dados.mtUsuario
      LookupKeyFields = 'Username'
      LookupResultField = 'Nome'
      KeyFields = 'FuncI'
      Size = 30
      Lookup = True
    end
  end
  object tAP: TnxTable
    Database = Dados.db
    FilterOptions = [foCaseInsensitive]
    OnCalcFields = tAPCalcFields
    TableName = 'Transacao'
    IndexName = 'IData'
    Left = 16
    Top = 139
    object tAPData: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'Data'
      DisplayFormat = 'dd/mm/yyyy'
      Calculated = True
    end
    object tAPValorFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorFinal'
      Calculated = True
    end
    object tAPNomeTipoAcesso: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeTipoAcesso'
      LookupDataSet = Dados.tbTipoAcesso
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'TipoAcesso'
      Size = 30
      Lookup = True
    end
    object tAPNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object tAPCaixaI: TIntegerField
      FieldName = 'CaixaI'
    end
    object tAPCaixaF: TIntegerField
      FieldName = 'CaixaF'
    end
    object tAPCaixaP: TIntegerField
      FieldName = 'CaixaP'
    end
    object tAPTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object tAPInicio: TDateTimeField
      FieldName = 'Inicio'
      DisplayFormat = 'hh:mm:ss'
    end
    object tAPFim: TDateTimeField
      FieldName = 'Fim'
      DisplayFormat = 'hh:mm:ss'
    end
    object tAPDataPagto: TDateTimeField
      FieldName = 'DataPagto'
    end
    object tAPContato: TIntegerField
      FieldName = 'Contato'
    end
    object tAPNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tAPMaquina: TWordField
      FieldName = 'Maquina'
    end
    object tAPTipo: TWordField
      FieldName = 'Tipo'
    end
    object tAPFuncI: TStringField
      FieldName = 'FuncI'
      Size = 10
    end
    object tAPFuncF: TStringField
      FieldName = 'FuncF'
      Size = 40
    end
    object tAPTempo: TDateTimeField
      FieldName = 'Tempo'
      DisplayFormat = 'hh:mm:ss'
    end
    object tAPTempoCobrado: TDateTimeField
      FieldName = 'TempoCobrado'
    end
    object tAPCredUsado: TIntegerField
      FieldName = 'CredUsado'
    end
    object tAPCredAnterior: TIntegerField
      FieldName = 'CredAnterior'
    end
    object tAPDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tAPProdutos: TCurrencyField
      FieldName = 'Produtos'
    end
    object tAPValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tAPObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tAPIsento: TBooleanField
      FieldName = 'Isento'
    end
    object tAPNaoUsarPacote: TBooleanField
      FieldName = 'NaoUsarPacote'
    end
    object tAPCodPacote: TWordField
      FieldName = 'CodPacote'
    end
    object tAPSinal: TCurrencyField
      FieldName = 'Sinal'
    end
    object tAPTransacaoVinculada: TIntegerField
      FieldName = 'TransacaoVinculada'
    end
    object tAPValorFinalAcesso: TCurrencyField
      FieldName = 'ValorFinalAcesso'
    end
    object tAPDescontoProduto: TCurrencyField
      FieldName = 'DescontoProduto'
    end
    object tAPNumDoc: TStringField
      FieldName = 'NumDoc'
      Size = 15
    end
    object tAPStatusPagto: TWordField
      FieldName = 'StatusPagto'
    end
    object tAPObsSt: TStringField
      FieldKind = fkCalculated
      FieldName = 'ObsSt'
      Size = 200
      Calculated = True
    end
    object tAPNomeFuncI: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeFuncI'
      LookupDataSet = Dados.mtUsuario
      LookupKeyFields = 'Username'
      LookupResultField = 'Nome'
      KeyFields = 'FuncI'
      Size = 30
      Lookup = True
    end
  end
  object dsAP: TDataSource
    DataSet = tAP
    Left = 46
    Top = 139
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 38
    Top = 91
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 50
    Left = 69
    Top = 91
  end
  object pmCaixa: TdxBarPopupMenu
    BarManager = BarMgr
    ItemLinks = <
      item
        Item = cmVerFechar
        Visible = True
      end
      item
        BeginGroup = True
        Item = cmSuprimento
        Visible = True
      end
      item
        Item = cmSangria
        Visible = True
      end>
    UseOwnFont = False
    Left = 264
    Top = 130
  end
end
