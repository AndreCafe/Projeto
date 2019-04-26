inherited fbTran: TfbTran
  Left = 47
  Top = 116
  Caption = 'Transa'#231#245'es'
  ClientHeight = 596
  ClientWidth = 832
  OldCreateOrder = True
  ExplicitWidth = 840
  ExplicitHeight = 623
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TParentedPanel
    Width = 832
    Height = 596
    ExplicitWidth = 832
    ExplicitHeight = 596
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 832
      Height = 44
      ExplicitWidth = 832
      ExplicitHeight = 44
    end
    object splitAP: TcxSplitter
      Left = 0
      Top = 588
      Width = 832
      Height = 8
      HotZoneClassName = 'TcxSimpleStyle'
      HotZone.Visible = False
      AlignSplitter = salBottom
    end
    object gridAP: TcxGrid
      AlignWithMargins = True
      Left = 0
      Top = 440
      Width = 832
      Height = 148
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alBottom
      TabOrder = 2
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      RootLevelOptions.DetailTabsPosition = dtpTop
      object tvAP: TcxGridDBTableView
        OnDblClick = tvAPDblClick
        Navigator.Buttons.CustomButtons = <>
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
    object panTran: TLMDSimplePanel
      AlignWithMargins = True
      Left = 0
      Top = 49
      Width = 832
      Height = 386
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Bevel.Mode = bmCustom
      TabOrder = 3
      object Paginas: TcxPageControl
        Left = 93
        Top = 0
        Width = 739
        Height = 386
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = tsTran
        Properties.CustomButtons.Buttons = <>
        Properties.Style = 6
        Properties.TabSlants.Positions = []
        LookAndFeel.NativeStyle = False
        TabSlants.Positions = []
        ClientRectBottom = 386
        ClientRectRight = 739
        ClientRectTop = 24
        object tsTran: TcxTabSheet
          Caption = 'Transa'#231#245'es do Caixa Atual'
          ImageIndex = 1
          object pantsTran: TLMDSimplePanel
            Left = 0
            Top = 0
            Width = 739
            Height = 362
            Margins.Left = 0
            Margins.Top = 5
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            Bevel.Mode = bmStandard
            TabOrder = 0
            object Grid: TcxGrid
              Left = 1
              Top = 23
              Width = 737
              Height = 338
              Margins.Left = 0
              Margins.Top = 5
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              BorderStyle = cxcbsNone
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              LookAndFeel.Kind = lfFlat
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
                OptionsView.NoDataToDisplayInfoText = '<Ainda n'#227'o foi realizada nenhuma transa'#231#227'o no caixa atual>'
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
                  Properties.Images = im16
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
                  HeaderGlyphAlignmentHorz = taCenter
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
                  HeaderAlignmentHorz = taCenter
                  Width = 53
                end
                object TVData: TcxGridDBColumn
                  Caption = 'Data'
                  DataBinding.FieldName = 'DataHora'
                  PropertiesClassName = 'TcxDateEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.ShowTime = False
                  HeaderAlignmentHorz = taCenter
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
                  RepositoryItem = Dados.erTipoTran
                  HeaderAlignmentHorz = taCenter
                  MinWidth = 16
                  Styles.OnGetContentStyle = TVDescrStylesGetContentStyle
                  Width = 118
                end
                object TVDescr: TcxGridDBColumn
                  Caption = 'Descri'#231#227'o'
                  DataBinding.FieldName = 'Descr'
                  Styles.OnGetContentStyle = TVDescrStylesGetContentStyle
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
                  Styles.OnGetContentStyle = TVDescrStylesGetContentStyle
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
                  Styles.OnGetContentStyle = TVDescrStylesGetContentStyle
                  Width = 75
                end
                object TVTotalFinal: TcxGridDBColumn
                  Caption = 'Total Final'
                  DataBinding.FieldName = 'TotalFinal'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  OnGetDisplayText = TVTotalGetDisplayText
                  FooterAlignmentHorz = taCenter
                  HeaderAlignmentHorz = taCenter
                  Styles.OnGetContentStyle = TVDescrStylesGetContentStyle
                  Width = 80
                end
                object TVPago: TcxGridDBColumn
                  Caption = 'Valor Pago'
                  DataBinding.FieldName = 'Pago'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  OnGetDisplayText = TVTotalGetDisplayText
                  FooterAlignmentHorz = taCenter
                  HeaderAlignmentHorz = taCenter
                  Styles.OnGetContentStyle = TVDescrStylesGetContentStyle
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
                  HeaderAlignmentHorz = taCenter
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
              end
              object GL: TcxGridLevel
                GridView = TV
              end
            end
            object dxBarDockControl2: TdxBarDockControl
              Left = 1
              Top = 1
              Width = 737
              Height = 22
              Align = dalTop
              BarManager = BarMgr
              SunkenBorder = False
              UseOwnSunkenBorder = True
            end
          end
        end
        object tsCedula: TcxTabSheet
          Caption = 'Contador de C'#233'dulas'
          ImageIndex = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object gridCedula: TcxGrid
            Left = 0
            Top = 0
            Width = 289
            Height = 288
            Margins.Left = 0
            Margins.Top = 5
            Margins.Right = 0
            Margins.Bottom = 0
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            RootLevelOptions.TabsForEmptyDetails = False
            object tvCedula: TcxGridTableView
              Navigator.Buttons.CustomButtons = <>
              OnFocusedRecordChanged = tvCedulaFocusedRecordChanged
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0.00'
                  Kind = skSum
                  Column = tvCedulaTotal
                end>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.PostponedSynchronization = False
              OptionsBehavior.GoToNextCellOnEnter = True
              OptionsBehavior.ExpandMasterRowOnDblClick = False
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnGrouping = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Inserting = False
              OptionsSelection.HideFocusRectOnExit = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.ExpandButtonsForEmptyDetails = False
              OptionsView.Footer = True
              OptionsView.GroupByBox = False
              Styles.Footer = cxStyle5
              object tvCedulaDescr: TcxGridColumn
                Caption = 'C'#233'dula / Moeda'
                PropertiesClassName = 'TcxTextEditProperties'
                Options.Editing = False
                Options.Focusing = False
                Width = 87
              end
              object tvCedulaQuant: TcxGridColumn
                Caption = 'Quant'
                DataBinding.ValueType = 'Word'
                PropertiesClassName = 'TcxSpinEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ImmediatePost = True
                Properties.MaxValue = 99999.000000000000000000
                Properties.UseLeftAlignmentOnEditing = False
                Properties.OnEditValueChanged = tvCedulaQuantPropertiesEditValueChanged
                HeaderAlignmentHorz = taCenter
                Width = 40
              end
              object tvCedulaTotal: TcxGridColumn
                Caption = 'Total'
                DataBinding.ValueType = 'Currency'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                OnGetDisplayText = tvCedulaTotalGetDisplayText
                FooterAlignmentHorz = taRightJustify
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Options.Focusing = False
                Width = 88
              end
              object tvCedulaValor: TcxGridColumn
                DataBinding.ValueType = 'Currency'
                Visible = False
                VisibleForCustomization = False
              end
            end
            object glCedula: TcxGridLevel
              GridView = tvCedula
              Options.TabsForEmptyDetails = False
            end
          end
          object btnZerar: TcxButton
            Left = 206
            Top = 291
            Width = 83
            Height = 21
            Caption = 'Zerar Contador'
            TabOrder = 1
            OnClick = btnZerarClick
            LookAndFeel.Kind = lfFlat
          end
        end
      end
      object panNB: TLMDSimplePanel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 88
        Height = 386
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Align = alLeft
        Bevel.Mode = bmEdge
        TabOrder = 1
        object NB: TdxNavBar
          Left = 2
          Top = 2
          Width = 84
          Height = 382
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 5
          Margins.Bottom = 0
          Align = alClient
          Color = clGray
          Ctl3D = False
          ActiveGroupIndex = 0
          TabOrder = 0
          View = 3
          OptionsBehavior.Common.AllowSelectLinks = True
          OptionsImage.LargeImages = dmImagens.im32
          OptionsStyle.DefaultStyles.Background.BackColor = clGray
          OptionsStyle.DefaultStyles.Background.BackColor2 = clGray
          OptionsStyle.DefaultStyles.Background.Font.Charset = DEFAULT_CHARSET
          OptionsStyle.DefaultStyles.Background.Font.Color = clWindowText
          OptionsStyle.DefaultStyles.Background.Font.Height = -11
          OptionsStyle.DefaultStyles.Background.Font.Name = 'Tahoma'
          OptionsStyle.DefaultStyles.Background.Font.Style = []
          OptionsStyle.DefaultStyles.Background.AssignedValues = [savBackColor, savBackColor2]
          OptionsStyle.DefaultStyles.Item.BackColor = clWhite
          OptionsStyle.DefaultStyles.Item.BackColor2 = clWhite
          OptionsStyle.DefaultStyles.Item.Font.Charset = ANSI_CHARSET
          OptionsStyle.DefaultStyles.Item.Font.Color = 3355443
          OptionsStyle.DefaultStyles.Item.Font.Height = -11
          OptionsStyle.DefaultStyles.Item.Font.Name = 'Segoe UI'
          OptionsStyle.DefaultStyles.Item.Font.Style = []
          OptionsStyle.DefaultStyles.Item.AssignedValues = [savFont]
          OptionsStyle.DefaultStyles.ItemPressed.BackColor = clGray
          OptionsStyle.DefaultStyles.ItemPressed.BackColor2 = clWhite
          OptionsStyle.DefaultStyles.ItemPressed.Font.Charset = ANSI_CHARSET
          OptionsStyle.DefaultStyles.ItemPressed.Font.Color = 3355443
          OptionsStyle.DefaultStyles.ItemPressed.Font.Height = -11
          OptionsStyle.DefaultStyles.ItemPressed.Font.Name = 'Segoe UI'
          OptionsStyle.DefaultStyles.ItemPressed.Font.Style = []
          OptionsStyle.DefaultStyles.ItemPressed.AssignedValues = [savBackColor]
          OptionsView.Common.ShowGroupCaptions = False
          OptionsView.NavigationPane.ShowHeader = False
          OptionsView.NavigationPane.ShowOverflowPanel = False
          OnLinkClick = NBLinkClick
          object NBGroup1: TdxNavBarGroup
            Caption = 'NBGroup1'
            LinksUseSmallImages = False
            SelectedLinkIndex = 0
            TopVisibleLinkIndex = 0
            Links = <
              item
                Item = nbiTran
              end
              item
                Item = nbiCedulas
              end>
          end
          object nbiTran: TdxNavBarItem
            Caption = 'Transa'#231#245'es do Caixa Atual'
            LargeImageIndex = 92
          end
          object nbiCedulas: TdxNavBarItem
            Tag = 1
            Caption = 'Contador de C'#233'dulas'
            LargeImageIndex = 100
          end
          object NBStyleItem1: TdxNavBarStyleItem
            Style.BackColor = clWhite
            Style.BackColor2 = clWhite
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.AssignedValues = [savFont]
          end
        end
      end
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
    ShowHintForDisabledItems = False
    Left = 571
    Top = 147
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmAbrir'
        end
        item
          Visible = True
          ItemName = 'cmFechar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmTotalizar'
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
          BeginGroup = True
          Visible = True
          ItemName = 'cmEmailCaixa'
        end
        item
          Visible = True
          ItemName = 'cmCfg'
        end>
      UseRestSpace = True
    end
    object BarMgrBar2: TdxBar [1]
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'Tran'
      CaptionButtons = <>
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 744
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmEditarTran'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmFiltroTipo'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmRecibo'
        end
        item
          BeginGroup = True
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'cmObs'
        end
        item
          Visible = True
          ItemName = 'cmSubTran'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      ButtonStyle = bsDropDown
      DropDownMenu = pmObs
      OnClick = cmEditarClick
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
      Caption = '&Exportar lista de transa'#231#245'es'
      Hint = 'Exportar lista de transa'#231#245'es'
      LargeImageIndex = 47
      GlyphLayout = glTop
      SyncImageIndex = False
      ImageIndex = 34
    end
    inherited cmImprimir: TdxBarLargeButton
      Caption = '&Imprimir lista de transa'#231#245'es'
      Hint = 'Imprimir lista de transa'#231#245'es'
      LargeImageIndex = 7
      GlyphLayout = glTop
      SyncImageIndex = False
      ImageIndex = 22
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      GlyphLayout = glLeft
      ImageIndex = -1
    end
    inherited cmCfg: TdxBarLargeButton
      Align = iaRight
      Caption = 'Configurar'
      Hint = 'Configurar'
      OnClick = cmCfgClick
    end
    object cmMostrar: TdxBarCombo
      Caption = 'Mostrar'
      Category = 0
      Hint = 'Mostrar'
      Visible = ivAlways
      OnChange = cmMostrarChange
      ShowCaption = True
      Text = 'Todas transa'#231#245'es'
      ShowEditor = False
      Items.Strings = (
        'Aguardando Pagamento'
        'Todas transa'#231#245'es')
      ItemIndex = 1
    end
    object cmFechar: TdxBarLargeButton
      Caption = '&Fechar Caixa'
      Category = 0
      Hint = 'Fechamento de Caixa'
      Visible = ivAlways
      LargeImageIndex = 103
      OnClick = cmFecharClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmSuprimento: TdxBarLargeButton
      Caption = '&Adicionar Dinheiro'
      Category = 0
      Hint = 'Adicionar dinheiro ao caixa'
      Visible = ivAlways
      LargeImageIndex = 105
      OnClick = cmSuprimentoClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmSangria: TdxBarLargeButton
      Caption = '&Retirar Dinheiro'
      Category = 0
      Hint = 'Lan'#231'ar uma retirada de dinheiro do caixa'
      Visible = ivAlways
      LargeImageIndex = 104
      OnClick = cmSuprimentoClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmCancelar: TdxBarButton
      Caption = 'Cancelar Transa'#231#227'o'
      Category = 0
      Hint = 'Cancelar a transa'#231#227'o selecionada abaixo'
      Style = FrmPri.cxStyle1
      Visible = ivAlways
      ImageIndex = 66
      PaintStyle = psCaptionGlyph
      OnClick = cmCancelarClick
    end
    object cmEditarTran: TdxBarButton
      Caption = 'Editar Transa'#231#227'o'
      Category = 0
      Hint = 
        'Clique para ver ou alterar os detalhes da transa'#231#227'o selecionada ' +
        'abaixo.'
      Style = FrmPri.cxStyle1
      Visible = ivAlways
      ImageIndex = 75
      PaintStyle = psCaptionGlyph
      OnClick = cmEditarClick
    end
    object cmRecibo: TdxBarButton
      Caption = 'Imprimir Recibo'
      Category = 0
      Hint = 
        'Clique para imprimir o recibo de pagamento da transa'#231#227'o selecion' +
        'ada abaixo'
      Style = FrmPri.cxStyle1
      Visible = ivAlways
      ImageIndex = 74
      PaintStyle = psCaptionGlyph
      OnClick = cmReciboClick
    end
    object cmObs: TdxBarButton
      Caption = 'Obs.'
      Category = 0
      Hint = 'Adicionar observa'#231#245'es na transa'#231#227'o selecionada abaixo'
      Style = FrmPri.cxStyle1
      Visible = ivAlways
      ImageIndex = 76
      OnClick = cmObsClick
    end
    object cmFiltroTipo: TdxBarButton
      Caption = 'Filtrar'
      Category = 0
      Hint = 
        'Filtre o tipo de transa'#231#227'o que deseja. Ex. ver somente a lista d' +
        'e transa'#231#245'es de venda'
      Style = FrmPri.cxStyle1
      Visible = ivAlways
      ImageIndex = 73
      PaintStyle = psCaptionGlyph
      OnClick = cmFiltroTipoClick
    end
    object cmTotalizar: TdxBarLargeButton
      Caption = 'Ver Total'
      Category = 0
      Hint = 'Ver Total'
      Visible = ivAlways
      LargeImageIndex = 99
      OnClick = cmVerFecharClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmTran: TdxBarStatic
      Caption = 'Transa'#231#245'es'
      Category = 0
      Hint = 
        'Cada opera'#231#227'o (iniciar um acesso, realizar uma venda, registrar ' +
        'uma impress'#227'o) realizada gera uma transa'#231#227'o no caixa'
      Style = cxStyle3
      Visible = ivAlways
    end
    object cmCorrigeDataCaixa: TdxBarButton
      Align = iaRight
      Caption = 'Corrigir Data ou Hora de abertura do caixa'
      Category = 0
      Hint = 'Corrigir Data ou Hora de abertura do caixa'
      Visible = ivAlways
      ImageIndex = 23
      OnClick = cmCorrigeDataCaixaClick
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'Caixa Atual'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmVerAnt'
        end>
    end
    object cmVerAnt: TdxBarButton
      Caption = 'Ver caixas anteriores'
      Category = 0
      Hint = 'Ver caixas anteriores'
      Visible = ivAlways
      OnClick = cmVerAntClick
    end
    object cmAbrir: TdxBarLargeButton
      Caption = 'Abrir Caixa'
      Category = 0
      Hint = 'Abrir Caixa'
      Visible = ivAlways
      LargeImageIndex = 102
      OnClick = cmAbrirClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmSubTran: TdxBarSubItem
      Align = iaRight
      Caption = 'Ferramentas'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmCorrigeDataCaixa'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmImprimir'
        end
        item
          Visible = True
          ItemName = 'cmExportar'
        end>
    end
    object cmEmailCaixa: TdxBarLargeButton
      Caption = 'Caixa Por E-mail'
      Category = 0
      Hint = 'Caixa Por E-mail'
      Visible = ivAlways
      LargeImageIndex = 128
      OnClick = cmEmailCaixaClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmCaixa: TdxBarLargeButton
      Caption = '&Total'
      Category = 1
      Hint = 'Total'
      Visible = ivAlways
      LargeImageIndex = 42
      OnClick = cmVerFecharClick
      AutoGrayScale = False
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 8
    Top = 201
  end
  inherited CP: TdxComponentPrinter
    Left = 184
    Top = 106
  end
  inherited pmLay: TdxBarPopupMenu
    Left = 152
    Top = 154
  end
  inherited pmPeriodo: TdxBarPopupMenu
    ItemLinks = <
      item
        Visible = True
        ItemName = 'cmUltimas24h'
      end
      item
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
  end
  object Tab: TnxTable
    Database = Dados.db
    FilterOptions = [foCaseInsensitive]
    FlipOrder = True
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
    object TabDescPerc: TFloatField
      FieldName = 'DescPerc'
    end
    object TabDescPorPerc: TBooleanField
      FieldName = 'DescPorPerc'
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
    object TabCaixaPag: TIntegerField
      FieldName = 'CaixaPag'
    end
    object TabPagFunc: TStringField
      FieldName = 'PagFunc'
    end
    object TabPagPend: TBooleanField
      FieldName = 'PagPend'
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
    object tAPMaqI: TWordField
      FieldName = 'MaqI'
    end
    object tAPPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object tAPDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object tAPFimTicksTotal: TIntegerField
      FieldName = 'FimTicksTotal'
    end
    object tAPStrTransfMaq: TMemoField
      FieldName = 'StrTransfMaq'
      BlobType = ftMemo
    end
    object tAPStrFechamentoCaixa: TMemoField
      FieldName = 'StrFechamentoCaixa'
      BlobType = ftMemo
    end
    object tAPPermitirDownload: TBooleanField
      FieldName = 'PermitirDownload'
    end
    object tAPVersaoRegistro: TIntegerField
      FieldName = 'VersaoRegistro'
    end
    object tAPCartaoTempo: TBooleanField
      FieldName = 'CartaoTempo'
    end
    object tAPHP1: TIntegerField
      FieldName = 'HP1'
    end
    object tAPHP2: TIntegerField
      FieldName = 'HP2'
    end
    object tAPHP3: TIntegerField
      FieldName = 'HP3'
    end
    object tAPHP4: TIntegerField
      FieldName = 'HP4'
    end
    object tAPHP5: TIntegerField
      FieldName = 'HP5'
    end
    object tAPHP6: TIntegerField
      FieldName = 'HP6'
    end
    object tAPHP7: TIntegerField
      FieldName = 'HP7'
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
      AssignedValues = [svTextColor]
      TextColor = 4210752
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
  object im16: TcxImageList
    FormatVersion = 1
    DesignInfo = 12583072
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000001000000090000001800000022000000230000
          001B0000000D0000000300000000000000000000000000000000000000000000
          0000000000000000000200000012000000390000006700000082000000840000
          006E000000430000001900000004000000000000000000000000000000000000
          000000000001000000110013195B004864B7006F9BE9006F9EEE004765C70011
          19A00000008F0000005300000016000000010000000000000000000000000000
          000000000007002A37620691C0F42AC6EAFF4BE5FFFF4BE5FFFF0EB3E1FF0082
          B6FD002231A70000008B00000038000000080000000000000000000000000000
          000000121829089BC7F14DE9FFFF34CAECFF25B3DAFF20ADD6FF52CAE1FF36DC
          FDFF007BB0FB000B0F9C0000005A000000130000000000000000000000000000
          000000556F8639D2F3FF1DC3EDFF2BC0E5FF4BE6FFFF32DFFFFF18ACD7FF2FB1
          D4FF08ABDBFF002F44AD00000068000000180000000000000000000000000000
          000000799EAE43DFFCFF2AD7FEFF43D6F3FF57EAFFFF42E4FFFF1CC1EBFF73EC
          F9FF20C5EDFF004665BD00000060000000150000000000000000000000000000
          0000007598A142DEFBFF10C6F3FF4EDCF5FF68EFFFFF52E9FFFF24C6EDFF28B1
          D7FF1CC0EAFF003E57AE000000410000000B0000000000000000000000000000
          00000042535632D1F2FF26DBFFFF15CBF7FF45D7F5FF34CFF2FF36CCEFFF5FF2
          FFFF039ECFFE001D28780000001D000000020000000000000000000000000000
          0000000102020089ABBA41DAF7FF2ED9FEFF28D7FEFF37DCFEFF45DEFBFF18B8
          E2FF005773AE0000002700000006000000000000000000000000000000000000
          00000000000000080A0D006F8F9F0DC2F0FA26D2FAFF20CCF6FF009DCCEE0039
          4CA50001015D0000001E00000004000000000000000000000000000000000000
          0000000000000000000F1E1110635F4042D4646871FF665662FF61242ADC0612
          03A2000000900000004D00000012000000000000000000000000000000000000
          0000000000022E20205B9D6A69F9BE7876FFC47378FF5D8F47FF0D9615FF0E7A
          15FE021D05A40000008000000027000000030000000000000000000000000000
          00000202020A986A69E2DA8786FFD58183FFAA8670FF07B529FF11AD25FF0B9B
          16FF096E14EC0002008F00000036000000070000000000000000000000000000
          0000261B1B34CB8C89FFF39091FFE9888BFF939A6BFF12BA38FF18B331FF14B1
          29FF0B8516FF0216047B00000028000000050000000000000000000000000000
          00001D161624B38382ECB68582F9AF7B7AF899756CF5319744F31A9737F11792
          2FF1117B22DB021104360000000A000000010000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000C0000001000000010000000100000001000000010000000100000
          00100000001000000010000000100000000C0000000000000000000000003E30
          255A886246D1A27453FBA57654FFA57654FFA57654FFA57654FFA57654FFA576
          54FFA57654FFA57654FFA07352F8825E43C83529204B000000004233275FB188
          69FFE8D6C4FFFAF1E2FFFCF1E1FFFCF0DDFFFCEFDBFFFCEFDBFFFCEFDBFFFCEF
          DBFFFCF0DDFFFCF1E1FFF9EFE1FFE4D2BFFFAC8262FB382C234F8F6649DDEBDC
          CBFFFCF3E6FFFCF0DCFFFDEDD4FFFDEBCEFFFDEACBFFFDE9CAFFFDE9CAFFFDEA
          CBFFFDEBCDFFFDEDD3FFFCF0DCFFFCF3E5FFE7D6C4FF8B6548D4A87B5AFFFCF4
          E8FFFCF2E4FFFDEED7FFFDEACDFFFEE8C6FFFEE7C3FFFEE6C2FFFEE6C1FFFEE7
          C3FFFEE8C6FFFDEACCFFFDEED6FFFCF2E3FFFBF4E8FFA77958FF956B4CE7F0E3
          D6FFFCF3E5FFFDEFD8FFFDEBCEFFFEE8C6FFFEE7C2FFFEE6C0FFFEE6C0FFFEE7
          C2FFFEE8C6FFFEEBCDFFFDEFD8FFFCF3E4FFF0E4D7FF956B4CE7523F3176B892
          75FFF2E6D9FFFCF1DFFFFDEDD4FFFEEBCCFFFEE9C8FFFFE9C6FFFEE9C6FFFEEA
          C9FFFEEBCEFFFDEED5FFFCF1DFFFF7EDE1FFBC977CFF5541327A00000000523F
          30779A6F4FEEC5A58AFFFDF1DFFFFDEFD8FFFEEED4FFFEEDD2FFFEEDD3FFFEEE
          D6FFFDF0DBFFFDF2E1FFE4D1BFFFA67A5AF96048378D02020103000000000000
          00003F31255BC4A48BFFFCF5EAFFFDF3E4FFFDF2E0FFFDF2DFFFFDF2E0FFFDF3
          E3FFFCF4E7FFFCF6EDFFD8C3B1FF684E3B9A0000000000000000000000000000
          000017120E21AC8161FDF8F3EBFFFCF7EEFFFCF6EBFFFDF6EBFFFCF6EBFFCDB1
          9AFFE3D3C4FFE2D2C4FFAD8365FC2E241D410000000000000000000000000000
          0000000000006B4F3C9EBF9E85FFF6F0E9FFFCF8F3FFFAF6F0FFD2BAA8FF9169
          4CDD7D5C44BC7B5A42BA372B224F000000000000000000000000000000000000
          0000000000000504030762493791A07555F5B58E71FFAA7F5FFD795941B81612
          0F1E000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000006050409221B152F0E0C0914000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object pmObs: TdxBarPopupMenu
    BarManager = BarMgr
    ItemLinks = <>
    UseOwnFont = False
    Left = 304
    Top = 216
  end
  object tCai: TnxTable
    Database = Dados.db
    TableName = 'Caixa'
    IndexName = 'IID'
    Left = 168
    Top = 288
    object tCaiID: TAutoIncField
      Alignment = taLeftJustify
      FieldName = 'ID'
    end
    object tCaiAberto: TBooleanField
      FieldName = 'Aberto'
    end
    object tCaiUsuario: TStringField
      FieldName = 'Usuario'
    end
    object tCaiAbertura: TDateTimeField
      FieldName = 'Abertura'
    end
    object tCaiFechamento: TDateTimeField
      FieldName = 'Fechamento'
    end
    object tCaiTotalFinal: TCurrencyField
      FieldName = 'TotalFinal'
    end
    object tCaiDescontos: TCurrencyField
      FieldName = 'Descontos'
    end
    object tCaiCancelamentos: TCurrencyField
      FieldName = 'Cancelamentos'
    end
    object tCaiSaldoAnt: TCurrencyField
      FieldName = 'SaldoAnt'
    end
    object tCaiObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tCaiSangria: TCurrencyField
      FieldName = 'Sangria'
    end
    object tCaiSupr: TCurrencyField
      FieldName = 'Supr'
    end
    object tCaiReproc: TDateTimeField
      FieldName = 'Reproc'
    end
    object tCaiEstSessoesQtd: TIntegerField
      FieldName = 'EstSessoesQtd'
    end
    object tCaiEstSessoesTempo: TFloatField
      FieldName = 'EstSessoesTempo'
    end
    object tCaiEstUrls: TIntegerField
      FieldName = 'EstUrls'
    end
    object tCaiEstSyncOk: TBooleanField
      FieldName = 'EstSyncOk'
    end
    object tCaiEstBuscasEng: TnxMemoField
      FieldName = 'EstBuscasEng'
      BlobType = ftMemo
    end
    object tCaiEstRes: TnxMemoField
      FieldName = 'EstRes'
      BlobType = ftMemo
    end
    object tCaiSaldoF: TCurrencyField
      FieldName = 'SaldoF'
    end
    object tCaiQuebra: TCurrencyField
      FieldName = 'Quebra'
    end
    object tCaiIDLivre: TStringField
      FieldName = 'IDLivre'
      Size = 10
    end
  end
end
