inherited fbImp: TfbImp
  Caption = 'Impress'#245'es'
  ClientHeight = 440
  ClientWidth = 501
  ExplicitWidth = 509
  ExplicitHeight = 467
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TParentedPanel
    Width = 501
    Height = 440
    ExplicitWidth = 501
    ExplicitHeight = 440
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 501
      Height = 3
      Visible = False
      ExplicitWidth = 501
      ExplicitHeight = 3
    end
    object Paginas: TcxPageControl
      Left = 0
      Top = 3
      Width = 501
      Height = 437
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Properties.ActivePage = tsPausa
      Properties.CustomButtons.Buttons = <>
      LookAndFeel.NativeStyle = False
      OnChange = PaginasChange
      ClientRectBottom = 437
      ClientRectRight = 501
      ClientRectTop = 25
      object tsPausa: TcxTabSheet
        Caption = 'Pendentes'
        ImageIndex = 0
        object dxBarDockControl2: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 501
          Height = 50
          Align = dalTop
          BarManager = BarMgr
          SunkenBorder = True
          UseOwnSunkenBorder = True
        end
        object GridA: TcxGrid
          Left = 0
          Top = 50
          Width = 501
          Height = 362
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          TabOrder = 1
          OnEnter = GridEnter
          OnExit = GridExit
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          object TVA: TcxGridDBTableView
            OnMouseEnter = TVMouseEnter
            OnMouseLeave = TVMouseLeave
            Navigator.Buttons.CustomButtons = <>
            Navigator.Buttons.Insert.Visible = False
            Navigator.Buttons.Delete.Visible = False
            Navigator.Buttons.Edit.Visible = False
            Navigator.Buttons.Post.Visible = False
            Navigator.Buttons.Cancel.Visible = False
            Navigator.Buttons.Refresh.Visible = True
            Navigator.Buttons.SaveBookmark.Visible = False
            Navigator.Buttons.GotoBookmark.Visible = False
            Navigator.Buttons.Filter.Visible = False
            DataController.DataModeController.GridMode = True
            DataController.DataModeController.GridModeBufferCount = 100
            DataController.DataSource = dsPausadas
            DataController.Filter.MaxValueListCount = 1000
            DataController.Filter.Options = [fcoCaseInsensitive]
            DataController.Filter.Active = True
            DataController.Filter.AutoDataSetFilter = True
            DataController.KeyFieldNames = 'ID'
            DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
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
            Preview.AutoHeight = False
            Preview.Visible = True
            object tvAMaq: TcxGridDBColumn
              Caption = 'M'#225'q.'
              DataBinding.FieldName = 'Maq'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.MaxLength = 0
              Properties.ReadOnly = False
              HeaderAlignmentHorz = taCenter
              Width = 41
            end
            object tvAPag: TcxGridDBColumn
              Caption = 'P'#225'g.'
              DataBinding.FieldName = 'Pag'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.MaxLength = 0
              Properties.ReadOnly = False
              HeaderAlignmentHorz = taCenter
              Width = 40
            end
            object tvADocumento: TcxGridDBColumn
              Caption = 'Documento'
              DataBinding.FieldName = 'Doc'
              PropertiesClassName = 'TcxMemoProperties'
              Properties.Alignment = taLeftJustify
              Properties.MaxLength = 0
              Properties.ReadOnly = False
              Width = 226
            end
            object tvAImp: TcxGridDBColumn
              Caption = 'Impressora / Tipo de Impress'#227'o'
              DataBinding.FieldName = 'ImpTipo'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.MaxLength = 200
              Properties.ReadOnly = False
              Width = 194
            end
            object tvAComputador: TcxGridDBColumn
              DataBinding.FieldName = 'Computador'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.MaxLength = 200
              Properties.ReadOnly = False
              Width = 118
            end
          end
          object glA: TcxGridLevel
            GridView = TVA
          end
        end
      end
      object tsRegistradas: TcxTabSheet
        Caption = 'Registradas'
        ImageIndex = 1
        object Grid: TcxGrid
          Left = 0
          Top = 50
          Width = 501
          Height = 362
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          TabOrder = 0
          OnEnter = GridEnter
          OnExit = GridExit
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          object TV: TcxGridDBTableView
            OnDblClick = cmEditarClick
            OnMouseEnter = TVMouseEnter
            OnMouseLeave = TVMouseLeave
            Navigator.Buttons.CustomButtons = <>
            Navigator.Buttons.Insert.Visible = False
            Navigator.Buttons.Delete.Visible = False
            Navigator.Buttons.Edit.Visible = False
            Navigator.Buttons.Post.Visible = False
            Navigator.Buttons.Cancel.Visible = False
            Navigator.Buttons.Refresh.Visible = True
            Navigator.Buttons.SaveBookmark.Visible = False
            Navigator.Buttons.GotoBookmark.Visible = False
            Navigator.Buttons.Filter.Visible = False
            Navigator.Visible = True
            DataController.DataModeController.GridMode = True
            DataController.DataModeController.GridModeBufferCount = 100
            DataController.DataSource = DataSource1
            DataController.Filter.MaxValueListCount = 1000
            DataController.Filter.Options = [fcoCaseInsensitive]
            DataController.Filter.Active = True
            DataController.Filter.AutoDataSetFilter = True
            DataController.KeyFieldNames = 'IDSeq'
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
            OptionsCustomize.ColumnsQuickCustomization = True
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
            Preview.AutoHeight = False
            Preview.Visible = True
            object TVMaquina1: TcxGridDBColumn
              Caption = 'M'#225'q.'
              DataBinding.FieldName = 'Maquina'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.MaxLength = 0
              Properties.ReadOnly = False
              HeaderAlignmentHorz = taCenter
              Width = 41
            end
            object TVPaginas1: TcxGridDBColumn
              Caption = 'P'#225'g.'
              DataBinding.FieldName = 'Paginas'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.MaxLength = 0
              Properties.ReadOnly = False
              HeaderAlignmentHorz = taCenter
              Width = 40
            end
            object VColumn1: TcxGridDBColumn
              Caption = 'Hora'
              DataBinding.FieldName = 'DataHora'
              PropertiesClassName = 'TcxTimeEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.TimeFormat = tfHourMin
              HeaderAlignmentHorz = taCenter
              Width = 39
            end
            object VColumn2: TcxGridDBColumn
              Caption = 'Valor'
              DataBinding.FieldName = 'Total'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 52
            end
            object TVDocumento1: TcxGridDBColumn
              DataBinding.FieldName = 'Documento'
              PropertiesClassName = 'TcxMemoProperties'
              Properties.Alignment = taLeftJustify
              Properties.MaxLength = 0
              Properties.ReadOnly = False
              Width = 347
            end
            object TVResultado1: TcxGridDBColumn
              DataBinding.FieldName = 'Resultado'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.DropDownRows = 7
              Properties.Items = <
                item
                  Description = 'Imprimiu'
                  ImageIndex = 0
                  Value = '0'
                end
                item
                  Description = 'Erro'
                  ImageIndex = 1
                  Value = '1'
                end>
              Properties.ReadOnly = False
              MinWidth = 16
              Width = 88
            end
            object TVImpressora1: TcxGridDBColumn
              DataBinding.FieldName = 'Impressora'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.MaxLength = 200
              Properties.ReadOnly = False
              Width = 115
            end
            object TVAcesso1: TcxGridDBColumn
              DataBinding.FieldName = 'Acesso'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.MaxLength = 0
              Properties.ReadOnly = False
              Visible = False
              Width = 107
            end
            object TVComputador1: TcxGridDBColumn
              DataBinding.FieldName = 'Computador'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.MaxLength = 200
              Properties.ReadOnly = False
              Width = 118
            end
            object TVCaixa: TcxGridDBColumn
              DataBinding.FieldName = 'Caixa'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
            end
            object TVID: TcxGridDBColumn
              Caption = 'N'#250'mero'
              DataBinding.FieldName = 'ID'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.MaxLength = 0
              Properties.ReadOnly = False
              HeaderAlignmentHorz = taCenter
              Width = 84
            end
            object TVDataHora1: TcxGridDBColumn
              Caption = 'Data'
              DataBinding.FieldName = 'DataHora'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.DateButtons = [btnClear, btnToday]
              Properties.DateOnError = deToday
              Properties.InputKind = ikRegExpr
              Width = 105
            end
          end
          object GL: TcxGridLevel
            GridView = TV
          end
        end
        object dxBarDockControl3: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 501
          Height = 50
          Align = dalTop
          BarManager = BarMgr
          SunkenBorder = True
          UseOwnSunkenBorder = True
        end
      end
    end
  end
  inherited BarMgr: TdxBarManager
    ImageOptions.LargeImages = dmImagens.im24
    UseSystemFont = False
    Left = 296
    Top = 168
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmJobResume'
        end
        item
          Visible = True
          ItemName = 'cmJobDelete'
        end
        item
          Visible = True
          ItemName = 'cmRevisar'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem1'
        end>
      OldName = 'BarraTabSheet1'
      UseOwnFont = True
      UseRestSpace = True
    end
    object BarMgrBar2: TdxBar [1]
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockControl = dxBarDockControl3
      DockedDockControl = dxBarDockControl3
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 495
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmEditar'
        end
        item
          Visible = True
          ItemName = 'cmNovo'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem2'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object barPDF: TdxBar [2]
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Custom 2'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 527
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmJobResume'
        end
        item
          Visible = True
          ItemName = 'cmJobDelete'
        end
        item
          Visible = True
          ItemName = 'cmRevisar'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = False
      WholeRow = True
    end
    object BarMgrBar3: TdxBar [3]
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Custom 3'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 527
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmJobResume'
        end
        item
          Visible = True
          ItemName = 'cmJobDelete'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmRevisar'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = False
      WholeRow = False
    end
    inherited cmNovo: TdxBarLargeButton
      Hint = 'Clique aqui para lan'#231'a uma nova impress'#227'o'
      LargeImageIndex = 6
      OnClick = cmNovoClick
      AutoGrayScale = True
      GlyphLayout = glTop
      ShowCaption = True
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      Hint = 
        'Clique aqui para Editar a impress'#227'o que est'#225' selecionada na list' +
        'a abaixo'
      LargeImageIndex = 2
      OnClick = cmEditarClick
      AutoGrayScale = True
      GlyphLayout = glTop
      ShowCaption = True
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmAtualizar: TdxBarLargeButton
      ShowCaption = False
    end
    inherited cmLayCustomize: TdxBarButton
      ImageIndex = -1
    end
    inherited cmLaySalvar: TdxBarButton
      Caption = '&Salvar Layout'
      Hint = 'Salvar Layout'
      ImageIndex = 34
    end
    inherited cmLayRestaurar: TdxBarButton
      ImageIndex = -1
    end
    inherited cmExportar: TdxBarLargeButton
      Caption = '&Exportar lista de impress'#245'es registradas'
      Hint = 'Exportar lista de impress'#245'es registradas'
      LargeImageIndex = 47
      ShowCaption = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    inherited cmImprimir: TdxBarLargeButton
      Caption = '&Imprimir lista de impress'#245'es registradas'
      Hint = 'Imprimir lista de impress'#245'es registradas'
      LargeImageIndex = 7
      ShowCaption = False
      SyncImageIndex = False
      ImageIndex = 22
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object cmJobResume: TdxBarLargeButton
      Caption = 'Liberar'
      Category = 0
      Hint = 'Liberar'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = cmJobResumeClick
    end
    object cmJobDelete: TdxBarLargeButton
      Caption = 'Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = cmJobDeleteClick
    end
    object dxBarSubItem1: TdxBarSubItem
      Align = iaRight
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ImageIndex = 21
      ShowCaption = False
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmLayCustomize'
        end
        item
          Visible = True
          ItemName = 'cmLaySalvar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmLayRestaurar'
        end>
    end
    object dxBarSubItem2: TdxBarSubItem
      Align = iaRight
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ImageIndex = 21
      ShowCaption = False
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmLayCustomize'
        end
        item
          Visible = True
          ItemName = 'cmLaySalvar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmLayRestaurar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmExportar'
        end
        item
          Visible = True
          ItemName = 'cmImprimir'
        end>
    end
    object cmRevisar: TdxBarLargeButton
      Caption = 'Revisar'
      Category = 0
      Hint = 'Revisar'
      Visible = ivAlways
      LargeImageIndex = 32
      OnClick = cmRevisarClick
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 168
    Top = 225
  end
  inherited CP: TdxComponentPrinter
    Left = 192
    Top = 290
  end
  inherited dlgExp: TSaveDialog
    Top = 257
  end
  inherited pmLay: TdxBarPopupMenu
    Left = 320
    Top = 250
  end
  inherited pmPeriodo: TdxBarPopupMenu
    Top = 188
  end
  object DataSource1: TDataSource
    DataSet = Tab
    Left = 46
    Top = 213
  end
  object Tab: TnxTable
    Database = Dados.db
    FilterOptions = [foCaseInsensitive]
    TableName = 'Impressao'
    IndexName = 'IDataHora'
    Left = 102
    Top = 213
    object TabDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object TabComputador: TStringField
      FieldName = 'Computador'
      Size = 200
    end
    object TabMaquina: TWordField
      FieldName = 'Maquina'
    end
    object TabImpressora: TStringField
      FieldName = 'Impressora'
      Size = 200
    end
    object TabDocumento: TMemoField
      FieldName = 'Documento'
      BlobType = ftMemo
    end
    object TabResultado: TWordField
      FieldName = 'Resultado'
    end
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabTran: TIntegerField
      FieldName = 'Tran'
    end
    object TabCaixa: TIntegerField
      Alignment = taCenter
      FieldName = 'Caixa'
    end
    object TabManual: TBooleanField
      FieldName = 'Manual'
    end
    object TabSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object Tabq1: TWordField
      FieldName = 'q1'
    end
    object Tabq2: TWordField
      FieldName = 'q2'
    end
    object Tabq3: TWordField
      FieldName = 'q3'
    end
    object Tabq4: TWordField
      FieldName = 'q4'
    end
    object Tabq5: TWordField
      FieldName = 'q5'
    end
    object Tabq6: TWordField
      FieldName = 'q6'
    end
    object Tabq7: TWordField
      FieldName = 'q7'
    end
    object Tabq8: TWordField
      FieldName = 'q8'
    end
    object Tabq9: TWordField
      FieldName = 'q9'
    end
    object Tabq10: TWordField
      FieldName = 'q10'
    end
    object Tabv1: TCurrencyField
      FieldName = 'v1'
    end
    object Tabv2: TCurrencyField
      FieldName = 'v2'
    end
    object Tabv3: TCurrencyField
      FieldName = 'v3'
    end
    object Tabv4: TCurrencyField
      FieldName = 'v4'
    end
    object Tabv5: TCurrencyField
      FieldName = 'v5'
    end
    object Tabv6: TCurrencyField
      FieldName = 'v6'
    end
    object Tabv7: TCurrencyField
      FieldName = 'v7'
    end
    object Tabv8: TCurrencyField
      FieldName = 'v8'
    end
    object Tabv9: TCurrencyField
      FieldName = 'v9'
    end
    object Tabv10: TCurrencyField
      FieldName = 'v10'
    end
    object TabTotal: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Total'
    end
    object TabDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object TabPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object TabDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object TabPago: TCurrencyField
      FieldName = 'Pago'
    end
    object TabFunc: TStringField
      FieldName = 'Func'
    end
    object TabCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object TabCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object TabPaginas: TWordField
      FieldName = 'Paginas'
    end
  end
  object Timer1: TTimer
    Interval = 60000
    Left = 240
    Top = 248
  end
  object AuxTab: TnxTable
    Database = Dados.db
    FilterOptions = [foCaseInsensitive]
    TableName = 'Impressao'
    IndexName = 'IID'
    Left = 14
    Top = 285
    object AuxTabID: TAutoIncField
      FieldName = 'ID'
    end
  end
  object dsPM: TDataSource
    DataSet = Dados.mtImp
    Left = 144
    Top = 312
  end
  object dsPrintDoc: TDataSource
    DataSet = Dados.mtPrintDoc
    Left = 64
    Top = 120
  end
  object dsPausadas: TDataSource
    DataSet = Dados.mtPausadas
    Left = 160
    Top = 128
  end
end
