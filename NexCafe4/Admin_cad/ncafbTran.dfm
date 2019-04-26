inherited fbTran: TfbTran
  Left = 47
  Top = 116
  Caption = 'Transa'#231#245'es'
  ClientHeight = 445
  ClientWidth = 869
  OldCreateOrder = True
  OnCreate = FrmBasePaiCreate
  ExplicitWidth = 877
  ExplicitHeight = 472
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 58
    Width = 869
    Height = 387
    ExplicitTop = 58
    ExplicitWidth = 869
    ExplicitHeight = 330
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 869
      Height = 231
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      ExplicitHeight = 174
      object TV: TcxGridDBTableView
        OnDblClick = cmEditarClick
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
        DataController.KeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00'
            Kind = skSum
            Column = TVTotalFinal
          end
          item
            Format = '0.00'
            Kind = skSum
            Column = TVPago
          end
          item
            Format = '0.00'
            Kind = skSum
            Column = TVDebito
          end>
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
        Preview.Column = TVObs
        Preview.MaxLineCount = 0
        Preview.Visible = True
        Styles.OnGetContentStyle = TVStylesGetContentStyle
        object TVID: TcxGridDBColumn
          Caption = 'No.Tran'
          DataBinding.FieldName = 'ID'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          SortIndex = 0
          SortOrder = soAscending
          Width = 73
        end
        object TVMaquina: TcxGridDBColumn
          DataBinding.FieldName = 'Maq'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Width = 53
        end
        object TVData: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'DataHora'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 62
        end
        object TVInicio: TcxGridDBColumn
          Caption = 'Hora'
          DataBinding.FieldName = 'DataHora'
          PropertiesClassName = 'TcxTimeEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Width = 53
        end
        object TVTipo: TcxGridDBColumn
          DataBinding.FieldName = 'Tipo'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownRows = 7
          Properties.Items = <
            item
              Description = 'Inicio de Sess'#227'o'
              ImageIndex = 0
              Value = 0
            end
            item
              Description = 'Fim de Sess'#227'o'
              ImageIndex = 1
              Value = 1
            end
            item
              Description = 'Cr'#233'dito de Tempo'
              ImageIndex = 2
              Value = 2
            end
            item
              Description = 'Remover Tempo'
              ImageIndex = 3
              Value = 3
            end
            item
              Description = 'Venda'
              ImageIndex = 4
              Value = 4
            end
            item
              Description = 'Compra'
              ImageIndex = 5
              Value = 5
            end
            item
              Description = 'Entrada de Estoque'
              ImageIndex = 6
              Value = 6
            end
            item
              Description = 'Sa'#237'da de Estoque'
              ImageIndex = 7
              Value = 7
            end
            item
              Description = 'Pagamento de D'#233'bito'
              ImageIndex = 11
              Value = 8
            end
            item
              Description = 'Suprimento de Caixa'
              ImageIndex = 12
              Value = 9
            end
            item
              Description = 'Sangria de Caixa'
              ImageIndex = 13
              Value = 10
            end
            item
              Description = 'Impress'#227'o'
              Value = 11
            end
            item
              Description = 'Transf.M'#225'quina'
              Value = 12
            end
            item
              Description = 'Corre'#231#227'o data do Caixa'
              Value = 13
            end>
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 16
          Styles.OnGetContentStyle = TVTipoStylesGetContentStyle
          Width = 118
        end
        object TVDescr: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'Descr'
          Width = 164
        end
        object TVNome: TcxGridDBColumn
          Caption = 'Cliente'
          DataBinding.FieldName = 'NomeCliente'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 40
          Properties.ReadOnly = False
          Width = 143
        end
        object TVTotal: TcxGridDBColumn
          Caption = 'Valor'
          DataBinding.FieldName = 'Total'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          OnGetDisplayText = TVTotalGetDisplayText
          HeaderAlignmentHorz = taCenter
          Width = 72
        end
        object TVDesconto: TcxGridDBColumn
          DataBinding.FieldName = 'Desconto'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Properties.Nullable = False
          Properties.ReadOnly = False
          OnCustomDrawCell = TVDebitoCustomDrawCell
          OnGetDisplayText = TVTotalGetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 75
        end
        object TVTotalFinal: TcxGridDBColumn
          Caption = 'Total Final'
          DataBinding.FieldName = 'TotalFinal'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          OnGetDisplayText = TVTotalGetDisplayText
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 80
        end
        object TVPago: TcxGridDBColumn
          Caption = 'Valor Pago'
          DataBinding.FieldName = 'Pago'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          OnGetDisplayText = TVTotalGetDisplayText
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 83
        end
        object TVDebito: TcxGridDBColumn
          Caption = 'Debitado'
          DataBinding.FieldName = 'Debito'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          OnCustomDrawCell = TVDebitoCustomDrawCell
          OnGetDisplayText = TVTotalGetDisplayText
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 87
        end
        object TVNomeFuncI: TcxGridDBColumn
          Caption = 'Funcion'#225'rio'
          DataBinding.FieldName = 'Func'
          PropertiesClassName = 'TcxMaskEditProperties'
          Width = 91
        end
        object TVSessao: TcxGridDBColumn
          Caption = 'Sess'#227'o'
          DataBinding.FieldName = 'Sessao'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
        end
        object TVCancelado: TcxGridDBColumn
          DataBinding.FieldName = 'Cancelado'
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
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 76
        end
        object TVCanceladoPor: TcxGridDBColumn
          Caption = 'Cancelado por'
          DataBinding.FieldName = 'CanceladoPor'
          HeaderAlignmentVert = vaCenter
          Width = 96
        end
        object TVCanceladoEm: TcxGridDBColumn
          Caption = 'Cancelado Em'
          DataBinding.FieldName = 'CanceladoEm'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
        end
        object TVObs: TcxGridDBColumn
          DataBinding.FieldName = 'Obs'
          PropertiesClassName = 'TcxMemoProperties'
          Width = 164
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
    object gridAP: TcxGrid
      Left = 0
      Top = 239
      Width = 869
      Height = 148
      Align = alBottom
      TabOrder = 1
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      RootLevelOptions.DetailTabsPosition = dtpTop
      ExplicitTop = 182
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
        Filtering.ColumnPopup.MaxDropDownItemCount = 12
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
        object tvAPInicio: TcxGridDBColumn
          DataBinding.FieldName = 'Inicio'
          Width = 114
        end
        object tvAPTermino: TcxGridDBColumn
          Caption = 'T'#233'rmino'
          DataBinding.FieldName = 'Termino'
        end
        object tvAPMinutosR: TcxGridDBColumn
          Caption = 'Dura'#231#227'o (m)'
          DataBinding.FieldName = 'MinutosR'
          Width = 84
        end
        object tvAPMaq: TcxGridDBColumn
          Caption = 'M'#225'quina'
          DataBinding.FieldName = 'Maq'
          HeaderAlignmentHorz = taCenter
        end
        object tvAPNomeCliente: TcxGridDBColumn
          Caption = 'Cliente'
          DataBinding.FieldName = 'NomeCliente'
        end
      end
      object glAP: TcxGridLevel
        Caption = 
          'Sess'#245'es aguardando registro do pagamento. D'#234' um duplo clique no ' +
          'item para editar as informa'#231#245'es de pagamento'
        GridView = tvAP
      end
    end
    object splitAP: TcxSplitter
      Left = 0
      Top = 231
      Width = 869
      Height = 8
      HotZoneClassName = 'TcxSimpleStyle'
      HotZone.Visible = False
      AlignSplitter = salBottom
      Control = gridAP
      ExplicitTop = 174
    end
  end
  inherited BarMgr: TdxBarManager
    Categories.Strings = (
      'Default'
      'Caixa')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    ImageOptions.LargeImages = FrmPri.im32
    LookAndFeel.Kind = lfOffice11
    Left = 571
    Top = 147
    DockControlHeights = (
      0
      0
      58
      0)
    inherited BarMgrBar1: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmCaixa'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmSuprimento'
        end
        item
          Visible = True
          ItemName = 'cmSangria'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmCorrigeDataCaixa'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmFechar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmEditar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmRecibo'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmFiltroTipo'
        end
        item
          Visible = True
          ItemName = 'cmAtualizar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmImprimir'
        end
        item
          Visible = True
          ItemName = 'cmExportar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmPeriodo'
        end
        item
          Visible = True
          ItemName = 'cmLayout'
        end>
    end
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      OnClick = cmEditarClick
      GlyphLayout = glTop
      ShowCaption = True
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmAtualizar: TdxBarLargeButton
      GlyphLayout = glTop
    end
    inherited cmExportar: TdxBarLargeButton
      GlyphLayout = glTop
      LargeImageIndex = 47
    end
    inherited cmImprimir: TdxBarLargeButton
      GlyphLayout = glTop
      LargeImageIndex = 7
    end
    inherited cmLayout: TdxBarLargeButton
      Align = iaRight
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
      Caption = '&Total'
      Category = 1
      Hint = 'Total'
      Visible = ivAlways
      OnClick = cmVerFecharClick
      AutoGrayScale = False
      LargeImageIndex = 42
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
      LargeImageIndex = 43
    end
    object cmFechar: TdxBarLargeButton
      Caption = '&Fechar'
      Category = 0
      Hint = 'Fechamento de Caixa'
      Visible = ivAlways
      OnClick = cmFecharClick
      AutoGrayScale = False
      LargeImageIndex = 62
    end
    object cmSuprimento: TdxBarLargeButton
      Caption = '&Suprimento'
      Category = 0
      Hint = 'Suprimento: Adicionar dinheiro no caixa'
      Visible = ivAlways
      OnClick = cmSuprimentoClick
      AutoGrayScale = False
      LargeImageIndex = 63
    end
    object cmSangria: TdxBarLargeButton
      Caption = 'S&angria'
      Category = 0
      Hint = 'Sangria: Retirar dinheiro do caixa'
      Visible = ivAlways
      OnClick = cmSuprimentoClick
      AutoGrayScale = False
      LargeImageIndex = 64
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      OnClick = cmCancelarClick
      AutoGrayScale = False
      LargeImageIndex = 65
    end
    object cmRecibo: TdxBarLargeButton
      Caption = 'Recibo'
      Category = 0
      Hint = 'Recibo'
      Visible = ivAlways
      OnClick = cmReciboClick
      AutoGrayScale = False
      LargeImageIndex = 50
    end
    object cmCorrigeDataCaixa: TdxBarLargeButton
      Caption = 'Corrigir Data Caixa'
      Category = 0
      Hint = 'Corrigir Data Caixa'
      Visible = ivAlways
      OnClick = cmCorrigeDataCaixaClick
      AutoGrayScale = False
      LargeImageIndex = 69
    end
  end
  inherited CP: TdxComponentPrinter
    Left = 184
    Top = 106
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    Left = 540
    Top = 147
  end
  object Tab: TnxTable
    Database = Dados.db
    FilterOptions = [foCaseInsensitive]
    OnCalcFields = TabCalcFields
    TableName = 'Tran'
    IndexName = 'ICaixaID'
    Left = 448
    Top = 147
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object TabCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object TabFunc: TStringField
      FieldName = 'Func'
    end
    object TabTotal: TCurrencyField
      FieldName = 'Total'
    end
    object TabDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object TabPago: TCurrencyField
      FieldName = 'Pago'
    end
    object TabObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TabCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object TabCanceladoPor: TStringField
      FieldName = 'CanceladoPor'
      Size = 30
    end
    object TabCanceladoEm: TDateTimeField
      FieldName = 'CanceladoEm'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object TabCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object TabMaq: TWordField
      FieldName = 'Maq'
    end
    object TabTotalFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TotalFinal'
      Calculated = True
    end
    object TabNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object TabTipo: TWordField
      FieldName = 'Tipo'
    end
    object TabSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object TabDescr: TStringField
      FieldName = 'Descr'
      Size = 50
    end
    object TabDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object TabQtdTempo: TFloatField
      FieldName = 'QtdTempo'
    end
  end
  object tAP: TnxTable
    Database = Dados.db
    FilterOptions = [foCaseInsensitive]
    TableName = 'Sessao'
    IndexName = 'IEncerrou'
    Left = 16
    Top = 139
    object tAPID: TAutoIncField
      FieldName = 'ID'
    end
    object tAPInicio: TDateTimeField
      FieldName = 'Inicio'
    end
    object tAPTermino: TDateTimeField
      FieldName = 'Termino'
    end
    object tAPMinutosR: TFloatField
      FieldName = 'MinutosR'
      DisplayFormat = '0.0'
    end
    object tAPMinutosC: TFloatField
      FieldName = 'MinutosC'
    end
    object tAPMaq: TWordField
      FieldName = 'Maq'
    end
    object tAPEncerrou: TBooleanField
      FieldName = 'Encerrou'
    end
    object tAPCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tAPTransfMaq: TBooleanField
      FieldName = 'TransfMaq'
    end
    object tAPTipoCli: TWordField
      FieldName = 'TipoCli'
    end
    object tAPCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tAPTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tAPDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tAPPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tAPNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object tAPFuncI: TStringField
      FieldName = 'FuncI'
      Size = 30
    end
    object tAPFuncF: TStringField
      FieldName = 'FuncF'
      Size = 30
    end
    object tAPObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tAPTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tAPCaixaI: TIntegerField
      FieldName = 'CaixaI'
    end
    object tAPCaixaF: TIntegerField
      FieldName = 'CaixaF'
    end
    object tAPTicksI: TIntegerField
      FieldName = 'TicksI'
    end
    object tAPPausado: TBooleanField
      FieldName = 'Pausado'
    end
    object tAPInicioPausa: TIntegerField
      FieldName = 'InicioPausa'
    end
    object tAPMinTicksUsados: TIntegerField
      FieldName = 'MinTicksUsados'
    end
    object tAPMinTicksTotal: TIntegerField
      FieldName = 'MinTicksTotal'
    end
    object tAPFimTicksUsados: TIntegerField
      FieldName = 'FimTicksUsados'
    end
    object tAPStrPausas: TMemoField
      FieldName = 'StrPausas'
      BlobType = ftMemo
    end
    object tAPMinutosCli: TFloatField
      FieldName = 'MinutosCli'
    end
    object tAPMinutosPrev: TFloatField
      FieldName = 'MinutosPrev'
    end
    object tAPMinutosMax: TFloatField
      FieldName = 'MinutosMax'
    end
    object tAPMinutosCliU: TFloatField
      FieldName = 'MinutosCliU'
    end
    object tAPValorCli: TCurrencyField
      FieldName = 'ValorCli'
    end
    object tAPValorCliU: TFloatField
      FieldName = 'ValorCliU'
    end
    object tAPTranI: TIntegerField
      FieldName = 'TranI'
    end
    object tAPTranF: TIntegerField
      FieldName = 'TranF'
    end
  end
  object dsAP: TDataSource
    DataSet = tAP
    Left = 46
    Top = 139
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 478
    Top = 147
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 50
    Left = 509
    Top = 147
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 280
    Top = 160
    object cxStyle1: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clRed
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsStrikeOut]
      TextColor = clRed
    end
  end
end
