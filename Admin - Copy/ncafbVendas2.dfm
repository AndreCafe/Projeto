inherited fbVendas2: TfbVendas2
  Caption = 'Vendas'
  ClientHeight = 564
  ClientWidth = 1019
  Font.Height = -13
  ExplicitTop = -78
  ExplicitWidth = 1027
  ExplicitHeight = 591
  PixelsPerInch = 96
  TextHeight = 16
  inherited panPri: TParentedPanel
    Width = 1019
    Height = 564
    ExplicitWidth = 1019
    ExplicitHeight = 564
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 1019
      Height = 67
      ExplicitWidth = 1019
      ExplicitHeight = 67
    end
    object Grid: TcxGrid
      Left = 0
      Top = 67
      Width = 1019
      Height = 497
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      BorderStyle = cxcbsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      ExplicitTop = 44
      ExplicitHeight = 520
      object TV: TcxGridDBTableView
        OnDblClick = cmEditarClick
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Delete.Enabled = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Enabled = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Enabled = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.Visible = True
        DataController.DataModeController.GridMode = True
        DataController.DataSource = dsTab
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.Filter.SupportedLike = False
        DataController.KeyFieldNames = 'ID'
        DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = 'Debitado=0.00'
            Kind = skSum
            FieldName = 'Debito'
            DisplayText = 'D'#233'bito'
          end
          item
            Format = 'Desconto=0.00'
            Kind = skSum
            FieldName = 'Desconto'
            DisplayText = 'Desconto'
          end
          item
            Format = 'Total Final=0.00'
            Kind = skSum
            FieldName = 'TotalFinal'
            DisplayText = 'Tota-Final'
          end
          item
            Format = 'Pago=0.00'
            Kind = skSum
            FieldName = 'Pago'
            DisplayText = 'Pago'
          end>
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
        OptionsCustomize.ColumnSorting = False
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.NoDataToDisplayInfoText = '<Ainda n'#227'o foi realizada nenhuma venda>'
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.Column = TVObs
        Preview.MaxLineCount = 0
        Preview.Visible = True
        object TVImg: TcxGridDBColumn
          AlternateCaption = 'Indica'#231#227'o Plus ou Fidelidade'
          DataBinding.FieldName = 'Img'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items = <
            item
              Description = 'Fidelidade'
              ImageIndex = 0
              Value = 0
            end
            item
              Description = 'Venda Plus'
              ImageIndex = 1
              Value = 1
            end>
          Properties.ShowDescriptions = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          Width = 24
          IsCaptionAssigned = True
        end
        object TVID: TcxGridDBColumn
          Caption = 'No.Tran'
          DataBinding.FieldName = 'ID'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 73
        end
        object TVMaquina: TcxGridDBColumn
          DataBinding.FieldName = 'Maq'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 53
        end
        object TVData: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'DataHora'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 82
        end
        object TVInicio: TcxGridDBColumn
          Caption = 'Hora'
          DataBinding.FieldName = 'DataHora'
          PropertiesClassName = 'TcxTimeEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Width = 77
        end
        object TVTipo: TcxGridDBColumn
          DataBinding.FieldName = 'Tipo'
          RepositoryItem = Dados.erTipoTran
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 16
          VisibleForCustomization = False
          Width = 118
        end
        object TVDescr: TcxGridDBColumn
          Caption = 'Itens vendidos'
          DataBinding.FieldName = 'Descr'
          PropertiesClassName = 'TcxTextEditProperties'
          Styles.OnGetContentStyle = TVDebitoStylesGetContentStyle
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
          Styles.OnGetContentStyle = TVDebitoStylesGetContentStyle
          Width = 72
        end
        object TVDesconto: TcxGridDBColumn
          DataBinding.FieldName = 'Desconto'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Nullable = False
          Properties.ReadOnly = False
          OnCustomDrawCell = TVDebitoCustomDrawCell
          OnGetDisplayText = TVTotalGetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Styles.OnGetContentStyle = TVDebitoStylesGetContentStyle
          Width = 75
        end
        object TVTotalFinal: TcxGridDBColumn
          Caption = 'Total Final'
          DataBinding.FieldName = 'TotalFinal'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          OnGetDisplayText = TVTotalGetDisplayText
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Styles.OnGetContentStyle = TVDebitoStylesGetContentStyle
          Width = 80
        end
        object TVPago: TcxGridDBColumn
          Caption = 'Valor Pago'
          DataBinding.FieldName = 'Pago'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          OnGetDisplayText = TVTotalGetDisplayText
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Styles.OnGetContentStyle = TVDebitoStylesGetContentStyle
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
          Styles.OnGetContentStyle = TVDebitoStylesGetContentStyle
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
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          VisibleForCustomization = False
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
  end
  inherited BarMgr: TdxBarManager
    UseSystemFont = False
    Top = 88
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      Font.Height = -13
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton1'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmNovo'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmEditar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmCancelar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmImpRecibo'
        end
        item
          Visible = True
          ItemName = 'cmCfg'
        end>
      UseOwnFont = True
      UseRestSpace = True
    end
    object BarMgrBar2: TdxBar [1]
      Caption = 'barra2'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 42
      FloatLeft = 1045
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmFiltro'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 1
      ShowMark = False
      SizeGrip = False
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    inherited cmNovo: TdxBarLargeButton
      Caption = '&Venda por Balconista'
      Hint = 'Venda por Balconista'
      Visible = ivNever
      LargeImageIndex = 132
      OnClick = cmNovoClick
      ShowCaption = True
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      Hint = 'Editar Venda'
      OnClick = cmEditarClick
      ShowCaption = True
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmCfg: TdxBarLargeButton
      Align = iaRight
      OnClick = cmCfgClick
      AutoGrayScale = True
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar Venda'
      Category = 0
      Hint = 'Cancelar Venda'
      Visible = ivAlways
      LargeImageIndex = 131
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmImpRecibo: TdxBarLargeButton
      Caption = 'Emitir Recibo'
      Category = 0
      Hint = 'Emitir Recibo'
      Visible = ivAlways
      LargeImageIndex = 134
      OnClick = cmImpReciboClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object dxBarButton3: TdxBarButton
      Caption = 'Configurar'
      Category = 0
      Hint = 'Configurar'
      Visible = ivAlways
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'Vender'
      Category = 0
      Hint = 'Vender'
      Visible = ivAlways
      LargeImageIndex = 9
      OnClick = dxBarLargeButton1Click
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmFiltro: TdxBarSubItem
      Caption = 'Mostrar apenas vendas do caixa atual'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmSoCaixaAtual'
        end
        item
          Visible = True
          ItemName = 'cmTodosCaixas'
        end>
    end
    object cmSoCaixaAtual: TdxBarButton
      Caption = 'Mostrar apenas vendas do caixa atual'
      Category = 0
      Hint = 'Mostrar apenas vendas do caixa atual'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      Down = True
      OnClick = cmSoCaixaAtualClick
    end
    object cmTodosCaixas: TdxBarButton
      Caption = 'Mostrar vendas de todos os caixas'
      Category = 0
      Hint = 'Mostrar vendas de todos os caixas'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      OnClick = cmSoCaixaAtualClick
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 8
    Top = 257
  end
  inherited CP: TdxComponentPrinter
    Left = 120
    Top = 146
  end
  inherited pmLay: TdxBarPopupMenu
    Left = 200
    Top = 170
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 198
    Top = 235
  end
  object Tab: TnxTable
    Database = Dados.db
    FilterOptions = [foCaseInsensitive]
    FlipOrder = True
    OnCalcFields = TabCalcFields
    TableName = 'Tran'
    IndexName = 'ICaixaID'
    Left = 200
    Top = 203
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
      Alignment = taLeftJustify
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
    object TabCredValor: TBooleanField
      FieldName = 'CredValor'
    end
    object TabFidResgate: TBooleanField
      FieldName = 'FidResgate'
    end
    object TabImg: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'Img'
      Calculated = True
    end
    object TabTotLiq: TCurrencyField
      FieldName = 'TotLiq'
    end
    object TabplusID: TGuidField
      FieldName = 'plusID'
      Size = 38
    end
    object TabplusTran: TBooleanField
      FieldName = 'plusTran'
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 280
    Top = 160
    PixelsPerInch = 96
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
    object cxStyle3: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = 5066061
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clGreen
      TextColor = 4210752
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = 4934475
    end
  end
  object dxBarApplicationMenu1: TdxBarApplicationMenu
    BarManager = BarMgr
    Buttons = <>
    ExtraPane.Items = <
      item
      end>
    ItemLinks = <>
    ItemOptions.ShowShortCuts = True
    UseOwnFont = False
    Left = 152
    Top = 368
  end
  object cxPropertiesStore1: TcxPropertiesStore
    Components = <>
    StorageName = 'cxPropertiesStore1'
    Left = 32
    Top = 144
  end
end
