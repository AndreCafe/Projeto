inherited fbImp: TfbImp
  Caption = 'Impress'#245'es'
  ClientHeight = 346
  ClientWidth = 461
  ExplicitTop = -49
  ExplicitWidth = 469
  ExplicitHeight = 373
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 58
    Width = 461
    Height = 288
    ExplicitTop = 58
    ExplicitWidth = 461
    ExplicitHeight = 288
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 461
      Height = 288
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      object TV: TcxGridDBTableView
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
        OptionsView.Footer = True
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        Preview.Visible = True
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
        object TVIDSeq1: TcxGridDBColumn
          Caption = 'Numero'
          DataBinding.FieldName = 'IDSeq'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          Visible = False
          Width = 84
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
            Item = cmLayout
            Visible = True
          end>
        Name = 'BarraTabSheet1'
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
    Left = 64
    Top = 80
    DockControlHeights = (
      0
      0
      58
      0)
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
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
    object TabIDSeq: TAutoIncField
      FieldName = 'IDSeq'
    end
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
    object TabAcesso: TIntegerField
      FieldName = 'Acesso'
    end
    object TabResultado: TWordField
      FieldName = 'Resultado'
    end
  end
end
