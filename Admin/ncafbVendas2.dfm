inherited fbVendas2: TfbVendas2
  Caption = 'Vendas'
  ClientHeight = 564
  ClientWidth = 1020
  Font.Height = -13
  ExplicitWidth = 1028
  ExplicitHeight = 591
  PixelsPerInch = 96
  TextHeight = 16
  inherited panPri: TParentedPanel
    Width = 1020
    Height = 564
    ExplicitWidth = 1020
    ExplicitHeight = 564
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 1020
      Height = 44
      ExplicitWidth = 1020
      ExplicitHeight = 44
    end
    object Paginas: TcxPageControl
      Left = 0
      Top = 44
      Width = 1020
      Height = 520
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Properties.ActivePage = tsVendas
      Properties.CustomButtons.Buttons = <>
      Properties.ShowFrame = True
      Properties.Style = 6
      Properties.TabHeight = 32
      OnChange = PaginasChange
      OnDrawTabEx = PaginasDrawTabEx
      ClientRectBottom = 519
      ClientRectLeft = 1
      ClientRectRight = 1019
      ClientRectTop = 34
      object tsVendas: TcxTabSheet
        Cursor = crHandPoint
        Caption = 'Vendas do caixa atual'
        ImageIndex = 0
        object Grid: TcxGrid
          Left = 0
          Top = 0
          Width = 805
          Height = 485
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          LevelTabs.CaptionAlignment = taLeftJustify
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
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
            OnFocusedRecordChanged = TVFocusedRecordChanged
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
            DateTimeHandling.MonthFormat = 'mm'
            DateTimeHandling.YearFormat = 'yyyy'
            DateTimeHandling.DateFormat = 'dd/mm/yyyy'
            DateTimeHandling.Grouping = dtgByDate
            DateTimeHandling.HourFormat = 'hh:mm:ss'
            Filtering.ColumnPopup.MaxDropDownItemCount = 12
            OptionsBehavior.IncSearch = True
            OptionsCustomize.ColumnSorting = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.NoDataToDisplayInfoText = '<Ainda n'#227'o foi realizada nenhuma venda>'
            OptionsView.GridLineColor = 16053492
            OptionsView.GroupFooters = gfVisibleWhenExpanded
            Preview.Column = TVObs
            Preview.MaxLineCount = 0
            Preview.Visible = True
            Styles.Header = cxStyle9
            OnCustomDrawColumnHeader = tvPendCustomDrawColumnHeader
            object TVImg: TcxGridDBColumn
              AlternateCaption = 'Fidelidade?'
              DataBinding.FieldName = 'Img'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Alignment.Horz = taCenter
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
              Visible = False
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              VisibleForCustomization = False
              Width = 24
              IsCaptionAssigned = True
            end
            object TVID: TcxGridDBColumn
              Caption = 'No.Tran'
              DataBinding.FieldName = 'ID'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
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
              Width = 82
            end
            object TVInicio: TcxGridDBColumn
              Caption = 'Hora'
              DataBinding.FieldName = 'DataHora'
              PropertiesClassName = 'TcxTimeEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.ReadOnly = False
              Properties.TimeFormat = tfHourMin
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Width = 77
            end
            object TVTipo: TcxGridDBColumn
              DataBinding.FieldName = 'Tipo'
              RepositoryItem = Dados.erTipoTran
              Visible = False
              HeaderAlignmentHorz = taCenter
              MinWidth = 16
              VisibleForCustomization = False
              Width = 118
            end
            object TVDescr: TcxGridDBColumn
              Caption = 'Itens vendidos'
              DataBinding.FieldName = 'Descr'
              PropertiesClassName = 'TcxTextEditProperties'
              Options.Filtering = False
              Options.Grouping = False
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
              Styles.Content = FrmPri.cxStyle47
              Styles.OnGetContentStyle = TVDebitoStylesGetContentStyle
              Width = 80
            end
            object TVPago: TcxGridDBColumn
              Caption = 'Valor Pago'
              DataBinding.FieldName = 'Pago'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              OnCustomDrawCell = TVPagoCustomDrawCell
              OnGetDisplayText = TVPagoGetDisplayText
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              Styles.OnGetContentStyle = TVDebitoStylesGetContentStyle
              Width = 83
            end
            object TVCredUsado: TcxGridDBColumn
              Caption = 'Cr'#233'dito Usado'
              DataBinding.FieldName = 'CreditoUsado'
              OnGetDisplayText = TVTotalGetDisplayText
              HeaderAlignmentHorz = taCenter
              Width = 94
            end
            object TVDebito: TcxGridDBColumn
              Caption = 'Debitado'
              DataBinding.FieldName = 'Debito'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              OnCustomDrawCell = TVDebitoCustomDrawCell
              OnGetDisplayText = TVTotalGetDisplayText
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              Styles.OnGetContentStyle = TVDebitoStylesGetContentStyle
              Width = 87
            end
            object TVTroco: TcxGridDBColumn
              DataBinding.FieldName = 'Troco'
              OnGetDisplayText = TVTotalGetDisplayText
              HeaderAlignmentHorz = taCenter
              Width = 89
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
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object TVCancelado: TcxGridDBColumn
              DataBinding.FieldName = 'Cancelado'
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
              HeaderAlignmentHorz = taCenter
              Width = 76
            end
            object TVCanceladoPor: TcxGridDBColumn
              Caption = 'Cancelado por'
              DataBinding.FieldName = 'CanceladoPor'
              HeaderAlignmentHorz = taCenter
              Width = 96
            end
            object TVCanceladoEm: TcxGridDBColumn
              Caption = 'Cancelado Em'
              DataBinding.FieldName = 'CanceladoEm'
              HeaderAlignmentHorz = taCenter
            end
            object TVObs: TcxGridDBColumn
              DataBinding.FieldName = 'Obs'
              PropertiesClassName = 'TcxMemoProperties'
              Width = 164
            end
            object TVCredito: TcxGridDBColumn
              Caption = 'Creditado'
              DataBinding.FieldName = 'Credito'
              HeaderAlignmentHorz = taCenter
            end
            object TVPagPend: TcxGridDBColumn
              DataBinding.FieldName = 'PagPend'
              Visible = False
              VisibleForCustomization = False
            end
          end
          object GL: TcxGridLevel
            Caption = 'Vendas'
            GridView = TV
            Options.DetailTabsPosition = dtpTop
          end
        end
        object dsPag: TdxDockSite
          Left = 805
          Top = 0
          Width = 213
          Height = 485
          Align = alRight
          AutoSize = True
          DockingType = 5
          OriginalWidth = 253
          OriginalHeight = 520
          object dxLayoutDockSite1: TdxLayoutDockSite
            Left = 0
            Top = 0
            Width = 213
            Height = 485
            DockingType = 0
            OriginalWidth = 213
            OriginalHeight = 200
          end
          object dpPag: TdxDockPanel
            Left = 0
            Top = 0
            Width = 213
            Height = 485
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ManagerFont = False
            AllowFloating = True
            AutoHide = False
            Caption = 'Pagamento'
            CaptionButtons = [cbMaximize, cbHide]
            CustomCaptionButtons.Buttons = <>
            TabsProperties.CustomButtons.Buttons = <>
            DockingType = 0
            OriginalWidth = 213
            OriginalHeight = 140
          end
        end
      end
      object tsPend: TcxTabSheet
        Cursor = crHandPoint
        Caption = 'Vendas aguardando pagamento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 1
        ParentFont = False
        object gridPend: TcxGrid
          Left = 0
          Top = 40
          Width = 1018
          Height = 445
          Align = alClient
          BorderStyle = cxcbsNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          LookAndFeel.Kind = lfUltraFlat
          object tvPend: TcxGridDBTableView
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
            OnFocusedRecordChanged = TVFocusedRecordChanged
            DataController.DataModeController.GridMode = True
            DataController.DataSource = dsPend
            DataController.KeyFieldNames = 'ID'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            DateTimeHandling.MonthFormat = 'mm'
            DateTimeHandling.YearFormat = 'yyyy'
            DateTimeHandling.DateFormat = 'dd/mm/yyyy'
            DateTimeHandling.Grouping = dtgByDate
            DateTimeHandling.HourFormat = 'hh:mm:ss'
            Filtering.ColumnPopup.MaxDropDownItemCount = 12
            OptionsBehavior.ImmediateEditor = False
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsView.NoDataToDisplayInfoText = '<N'#227'o h'#225' vendas aguardando pagamento>'
            OptionsView.ColumnAutoWidth = True
            OptionsView.EditAutoHeightBorderColor = 16053492
            OptionsView.GridLineColor = 16053492
            OptionsView.GroupByBox = False
            OptionsView.GroupFooters = gfVisibleWhenExpanded
            OptionsView.RowSeparatorColor = 16053492
            Preview.Column = tvPendObs
            Preview.MaxLineCount = 0
            Preview.Visible = True
            OnCustomDrawColumnHeader = tvPendCustomDrawColumnHeader
            object tvPendID: TcxGridDBColumn
              AlternateCaption = 'N'#250'mero da Transa'#231#227'o'
              Caption = 'N.Tran'
              DataBinding.FieldName = 'ID'
              Visible = False
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
            end
            object tvPendDataHora: TcxGridDBColumn
              Caption = 'Data / Hora'
              DataBinding.FieldName = 'DataHora'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              Styles.Header = cxStyle9
              Width = 130
            end
            object tvPendTotalFinal: TcxGridDBColumn
              Caption = 'Valor '#224' Pagar'
              DataBinding.FieldName = 'TotalFinal'
              OnCustomDrawCell = tvPendTotalFinalCustomDrawCell
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              Styles.Header = cxStyle9
              Width = 109
            end
            object tvPendDescr: TcxGridDBColumn
              Caption = 'Itens'
              DataBinding.FieldName = 'Descr'
              Styles.Header = cxStyle9
              Width = 306
            end
            object tvPendNomeCliente: TcxGridDBColumn
              Caption = 'Cliente'
              DataBinding.FieldName = 'NomeCliente'
              Styles.Header = cxStyle9
              Width = 188
            end
            object tvPendTotal: TcxGridDBColumn
              DataBinding.FieldName = 'Total'
              Visible = False
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
            end
            object tvPendDesconto: TcxGridDBColumn
              DataBinding.FieldName = 'Desconto'
              Visible = False
              OnCustomDrawCell = TVDebitoCustomDrawCell
              OnGetDisplayText = TVTotalGetDisplayText
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
            end
            object tvPendFunc: TcxGridDBColumn
              Caption = 'Vendido por'
              DataBinding.FieldName = 'NomeFunc'
              Styles.Header = cxStyle9
              Width = 181
            end
            object tvPendObs: TcxGridDBColumn
              DataBinding.FieldName = 'Obs'
            end
          end
          object glPend: TcxGridLevel
            Caption = 'Aguardando Pagamento'
            GridView = tvPend
          end
        end
        object LMDSimplePanel1: TLMDSimplePanel
          Left = 0
          Top = 0
          Width = 1018
          Height = 40
          Align = alTop
          Bevel.Mode = bmCustom
          TabOrder = 1
          object LMDSimplePanel2: TLMDSimplePanel
            Left = 0
            Top = 0
            Width = 808
            Height = 40
            Align = alClient
            Bevel.Mode = bmCustom
            TabOrder = 0
            object dxBarDockControl2: TdxBarDockControl
              Left = 0
              Top = 0
              Width = 808
              Height = 26
              Margins.Bottom = 7
              Align = dalTop
              BarManager = BarMgr
              SunkenBorder = False
              UseOwnSunkenBorder = True
            end
          end
          object cbFecharAuto: TcxCheckBox
            Left = 808
            Top = 0
            Cursor = crHandPoint
            Align = alRight
            Caption = 'Fechar Automaticamente'
            ParentFont = False
            Properties.Alignment = taLeftJustify
            Properties.ImmediatePost = True
            Properties.NullStyle = nssUnchecked
            State = cbsChecked
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlue
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.TextColor = clBlack
            Style.IsFontAssigned = True
            TabOrder = 1
            OnClick = cbFecharAutoClick
            Width = 210
          end
        end
      end
    end
  end
  inherited BarMgr: TdxBarManager
    UseSystemFont = False
    Left = 48
    Top = 152
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
          ItemName = 'cmVendaCaixa'
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
          BeginGroup = True
          Visible = True
          ItemName = 'cmFiltro'
        end
        item
          Visible = True
          ItemName = 'cmCfg'
        end>
      UseOwnFont = True
      UseRestSpace = True
    end
    object BarMgrBar2: TdxBar [1]
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1335
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmPagamento'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = True
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    inherited cmNovo: TdxBarLargeButton
      Caption = '&Venda Balc'#227'o'
      Hint = 'Venda Balc'#227'o'
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
    object cmVendaCaixa: TdxBarLargeButton
      Caption = 'Venda Caixa'
      Category = 0
      Hint = 'Venda Caixa'
      Visible = ivAlways
      LargeImageIndex = 9
      OnClick = cmVendaCaixaClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmFiltro: TdxBarSubItem
      Caption = 'Vendas do caixa atual'
      Category = 0
      Style = cxStyle6
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
      Caption = 'Vendas do caixa atual'
      Category = 0
      Hint = 'Vendas do caixa atual'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      Down = True
      OnClick = cmSoCaixaAtualClick
    end
    object cmTodosCaixas: TdxBarButton
      Caption = 'Todas vendas'
      Category = 0
      Hint = 'Todas vendas'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      OnClick = cmSoCaixaAtualClick
    end
    object dxBarStatic1: TdxBarStatic
      Caption = 'Vendas'
      Category = 0
      Hint = 'Vendas'
      Style = cxStyle8
      Visible = ivAlways
    end
    object cmPagamento: TdxBarLargeButton
      Caption = 'Pagamento - F2'
      Category = 0
      Hint = 'Pagamento - F2'
      Visible = ivAlways
      LargeImageIndex = 137
      OnClick = cmPagamentoClick
      AutoGrayScale = False
      GlyphLayout = glLeft
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
    Left = 310
    Top = 251
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
    object TabDebitoAnt: TCurrencyField
      FieldName = 'DebitoAnt'
    end
    object TabDebitoPago: TCurrencyField
      FieldName = 'DebitoPago'
    end
    object TabCreditoAnt: TCurrencyField
      FieldName = 'CreditoAnt'
    end
    object TabCredito: TCurrencyField
      FieldName = 'Credito'
    end
    object TabCreditoUsado: TCurrencyField
      FieldName = 'CreditoUsado'
    end
    object TabTroco: TCurrencyField
      FieldName = 'Troco'
    end
    object TabPagFunc: TStringField
      FieldName = 'PagFunc'
    end
    object TabPagPend: TBooleanField
      FieldName = 'PagPend'
    end
    object TabDescPerc: TFloatField
      FieldName = 'DescPerc'
    end
    object TabDescPorPerc: TBooleanField
      FieldName = 'DescPorPerc'
    end
    object TabCaixaPag: TIntegerField
      FieldName = 'CaixaPag'
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
    object cxStyle6: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clBlue
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clHighlight
      TextColor = clWhite
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clGray
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
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
    Top = 264
  end
  object cxPropertiesStore1: TcxPropertiesStore
    Components = <>
    StorageName = 'cxPropertiesStore1'
    Left = 32
    Top = 144
  end
  object tbME: TnxTable
    Database = Dados.db
    TableName = 'MovEst'
    IndexName = 'ICaixaMov'
    Left = 456
    Top = 288
    object tbMEID: TAutoIncField
      FieldName = 'ID'
    end
    object tbMETran: TIntegerField
      FieldName = 'Tran'
    end
    object tbMEProduto: TIntegerField
      FieldName = 'Produto'
    end
    object tbMEQuant: TFloatField
      FieldName = 'Quant'
    end
    object tbMEUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object tbMETotal: TCurrencyField
      FieldName = 'Total'
    end
    object tbMECustoU: TCurrencyField
      FieldName = 'CustoU'
    end
    object tbMEItem: TWordField
      FieldName = 'Item'
    end
    object tbMEDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tbMEPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tbMEPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object tbMEDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object tbMEDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tbMEEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tbMECancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tbMEEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object tbMECliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tbMECaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tbMECategoria: TStringField
      FieldName = 'Categoria'
    end
    object tbMENaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tbMEITran: TIntegerField
      FieldName = 'ITran'
    end
    object tbMETipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object tbMESessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tbMEplusID: TGuidField
      FieldName = 'plusID'
      Size = 38
    end
    object tbMEplusTran: TBooleanField
      FieldName = 'plusTran'
    end
    object tbMEPermSemEstoque: TBooleanField
      FieldName = 'PermSemEstoque'
    end
    object tbMEFidResgate: TBooleanField
      FieldName = 'FidResgate'
    end
    object tbMEFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
    object tbMERecVer: TIntegerField
      FieldName = 'RecVer'
    end
  end
  object dckMgr: TdxDockingManager
    AutoHideInterval = 0
    AutoHideMovingInterval = 0
    AutoShowInterval = 50
    Color = clBtnFace
    DefaultHorizContainerSiteProperties.AllowFloating = False
    DefaultHorizContainerSiteProperties.CaptionButtons = [cbMaximize, cbHide]
    DefaultHorizContainerSiteProperties.CustomCaptionButtons.Buttons = <>
    DefaultHorizContainerSiteProperties.Dockable = True
    DefaultHorizContainerSiteProperties.ImageIndex = -1
    DefaultVertContainerSiteProperties.AllowFloating = False
    DefaultVertContainerSiteProperties.CaptionButtons = [cbMaximize, cbHide]
    DefaultVertContainerSiteProperties.CustomCaptionButtons.Buttons = <>
    DefaultVertContainerSiteProperties.Dockable = True
    DefaultVertContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.AllowFloating = False
    DefaultTabContainerSiteProperties.CaptionButtons = [cbMaximize, cbHide]
    DefaultTabContainerSiteProperties.CustomCaptionButtons.Buttons = <>
    DefaultTabContainerSiteProperties.Dockable = True
    DefaultTabContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.TabsProperties.CustomButtons.Buttons = <>
    DefaultTabContainerSiteProperties.TabsProperties.TabPosition = tpTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    Options = [doActivateAfterDocking, doDblClickDocking, doFloatingOnTop, doTabContainerHasCaption, doTabContainerCanAutoHide, doSideContainerHasCaption, doSideContainerCanAutoHide, doTabContainerCanInSideContainer, doImmediatelyHideOnAutoHide, doHideAutoHideIfActive, doRedrawOnResize]
    Left = 80
    Top = 192
    PixelsPerInch = 96
  end
  object tPend: TnxTable
    Database = Dados.db
    FilterOptions = [foCaseInsensitive]
    FlipOrder = True
    OnCalcFields = tPendCalcFields
    TableName = 'Tran'
    IndexName = 'IPagPendID'
    Left = 224
    Top = 307
    object tPendID: TAutoIncField
      FieldName = 'ID'
    end
    object tPendDataHora: TDateTimeField
      FieldName = 'DataHora'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object tPendCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tPendTipo: TWordField
      FieldName = 'Tipo'
    end
    object tPendFunc: TStringField
      FieldName = 'Func'
    end
    object tPendTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tPendDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tPendTotLiq: TCurrencyField
      FieldName = 'TotLiq'
    end
    object tPendPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tPendDebitoAnt: TCurrencyField
      FieldName = 'DebitoAnt'
    end
    object tPendDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object tPendDebitoPago: TCurrencyField
      FieldName = 'DebitoPago'
    end
    object tPendCreditoAnt: TCurrencyField
      FieldName = 'CreditoAnt'
    end
    object tPendCredito: TCurrencyField
      FieldName = 'Credito'
    end
    object tPendCreditoUsado: TCurrencyField
      FieldName = 'CreditoUsado'
    end
    object tPendTroco: TCurrencyField
      FieldName = 'Troco'
    end
    object tPendObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tPendCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tPendCanceladoPor: TStringField
      FieldName = 'CanceladoPor'
      Size = 30
    end
    object tPendCanceladoEm: TDateTimeField
      FieldName = 'CanceladoEm'
    end
    object tPendCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tPendMaq: TWordField
      FieldName = 'Maq'
    end
    object tPendNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object tPendSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tPendDescr: TStringField
      FieldName = 'Descr'
      Size = 50
    end
    object tPendQtdTempo: TFloatField
      FieldName = 'QtdTempo'
    end
    object tPendCredValor: TBooleanField
      FieldName = 'CredValor'
    end
    object tPendFidResgate: TBooleanField
      FieldName = 'FidResgate'
    end
    object tPendplusID: TGuidField
      FieldName = 'plusID'
      Size = 38
    end
    object tPendplusTran: TBooleanField
      FieldName = 'plusTran'
    end
    object tPendPagFunc: TStringField
      FieldName = 'PagFunc'
    end
    object tPendPagPend: TBooleanField
      FieldName = 'PagPend'
    end
    object tPendTotalFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TotalFinal'
      Calculated = True
    end
    object tPendNomeFunc: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeFunc'
      LookupDataSet = Dados.mtUsuario
      LookupKeyFields = 'Username'
      LookupResultField = 'Nome'
      KeyFields = 'Func'
      Size = 40
      Lookup = True
    end
    object tPendDescPerc: TFloatField
      FieldName = 'DescPerc'
    end
    object tPendDescPorPerc: TBooleanField
      FieldName = 'DescPorPerc'
    end
    object tPendCaixaPag: TIntegerField
      FieldName = 'CaixaPag'
    end
  end
  object dsPend: TDataSource
    DataSet = tPend
    Left = 272
    Top = 312
  end
end
