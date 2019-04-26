inherited fbImp: TfbImp
  Caption = 'Impress'#245'es'
  ClientHeight = 346
  ClientWidth = 461
  ExplicitWidth = 477
  ExplicitHeight = 382
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 60
    Width = 461
    Height = 286
    ExplicitTop = 60
    ExplicitWidth = 461
    ExplicitHeight = 286
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 461
      Height = 286
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      object TV: TcxGridDBTableView
        OnDblClick = cmEditarClick
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.Insert.Visible = False
        NavigatorButtons.Delete.Visible = False
        NavigatorButtons.Edit.Visible = False
        NavigatorButtons.Post.Visible = False
        NavigatorButtons.Cancel.Visible = False
        NavigatorButtons.Refresh.Visible = False
        NavigatorButtons.SaveBookmark.Visible = False
        NavigatorButtons.GotoBookmark.Visible = False
        NavigatorButtons.Filter.Visible = False
        DataController.DataModeController.GridMode = True
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
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.Navigator = True
        OptionsView.Footer = True
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        Preview.Visible = True
        object TVID: TcxGridDBColumn
          Caption = 'N'#250'mero'
          DataBinding.FieldName = 'ID'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 84
        end
        object TVDataHora1: TcxGridDBColumn
          Caption = 'Data/Hora'
          DataBinding.FieldName = 'DataHora'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.DateButtons = [btnClear, btnToday]
          Properties.DateOnError = deToday
          Properties.InputKind = ikRegExpr
          Width = 105
        end
        object TVMaquina1: TcxGridDBColumn
          Caption = 'M'#225'quina'
          DataBinding.FieldName = 'Maquina'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Width = 71
        end
        object TVPaginas1: TcxGridDBColumn
          Caption = 'P'#225'ginas'
          DataBinding.FieldName = 'Paginas'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Width = 80
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
        object TVDocumento1: TcxGridDBColumn
          DataBinding.FieldName = 'Documento'
          PropertiesClassName = 'TcxMemoProperties'
          Properties.Alignment = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          Width = 347
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
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = FrmPri.im32
    Left = 64
    Top = 80
    DockControlHeights = (
      0
      0
      60
      0)
    inherited BarMgrBar1: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmNovo'
        end
        item
          Visible = True
          ItemName = 'cmEditar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmAtualizar'
        end
        item
          Visible = True
          ItemName = 'cmImprimir'
        end
        item
          Visible = True
          ItemName = 'cmExportar'
        end
        item
          Visible = True
          ItemName = 'cmLayout'
        end>
      OldName = 'BarraTabSheet1'
    end
    inherited cmNovo: TdxBarLargeButton
      OnClick = cmNovoClick
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
      Align = iaRight
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 24
    Top = 121
  end
  object DataSource1: TDataSource
    DataSet = Tab
    Left = 102
    Top = 229
  end
  object Tab: TnxTable
    Database = Dados.db
    FilterOptions = [foCaseInsensitive]
    TableName = 'Impressao'
    IndexName = 'IDataHora'
    Left = 102
    Top = 189
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
    object TabPaginas: TIntegerField
      FieldName = 'Paginas'
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
      Size = 30
    end
    object TabCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object TabCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
  end
end
