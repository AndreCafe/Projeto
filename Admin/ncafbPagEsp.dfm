inherited fbPagEsp: TfbPagEsp
  Caption = 'Conferir Meio de Pagamento'
  ClientHeight = 407
  ClientWidth = 842
  Font.Height = -13
  ExplicitWidth = 850
  ExplicitHeight = 434
  PixelsPerInch = 96
  TextHeight = 16
  inherited panPri: TParentedPanel
    Width = 842
    Height = 407
    ExplicitWidth = 842
    ExplicitHeight = 407
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 842
      Height = 44
      ExplicitWidth = 842
      ExplicitHeight = 44
    end
    object Grid: TcxGrid
      Left = 0
      Top = 44
      Width = 842
      Height = 363
      Align = alClient
      BorderStyle = cxcbsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object TV: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Enabled = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.SaveBookmark.Enabled = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Enabled = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
        Navigator.Visible = True
        DataController.DataModeController.GridMode = True
        DataController.DataSource = dsTab
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0.00'
            Kind = skSum
            Column = TVValor
          end>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        DateTimeHandling.IgnoreTimeForFiltering = True
        DateTimeHandling.MonthFormat = 'mm'
        DateTimeHandling.YearFormat = 'yyyy'
        DateTimeHandling.DateFormat = 'dd/mm/yyyy'
        DateTimeHandling.Grouping = dtgByDate
        DateTimeHandling.HourFormat = 'hh:mm'
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        object TVCaixa: TcxGridDBColumn
          DataBinding.FieldName = 'Caixa'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 102
        end
        object TVTran: TcxGridDBColumn
          AlternateCaption = 'N'#250'mero da Transa'#231#227'o'
          Caption = 'N.Tran'
          DataBinding.FieldName = 'Tran'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 79
        end
        object TVData: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'DataHora'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 184
        end
        object TVNome: TcxGridDBColumn
          Caption = 'Meio de Pagamento'
          DataBinding.FieldName = 'Nome'
          Width = 288
        end
        object TVValor: TcxGridDBColumn
          DataBinding.FieldName = 'Valor'
          Width = 154
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
  end
  inherited BarMgr: TdxBarManager
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmEditar'
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
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      OnClick = cmEditarClick
      ShowCaption = True
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmExportar: TdxBarLargeButton
      LargeImageIndex = 47
    end
    inherited cmImprimir: TdxBarLargeButton
      LargeImageIndex = 7
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
  end
  inherited CP: TdxComponentPrinter
    Left = 48
    Top = 114
  end
  object Tab: TnxTable
    Database = Dados.db
    FlipOrder = True
    TableName = 'PagEspecies'
    IndexName = 'IID'
    Left = 320
    Top = 136
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object TabDataHora: TDateTimeField
      FieldName = 'DataHora'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object TabTran: TIntegerField
      FieldName = 'Tran'
    end
    object TabEspecie: TWordField
      FieldName = 'Especie'
    end
    object TabTipo: TWordField
      FieldName = 'Tipo'
    end
    object TabValor: TCurrencyField
      FieldName = 'Valor'
    end
    object TabDoc: TStringField
      FieldName = 'Doc'
      Size = 50
    end
    object TabCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object TabNome: TStringField
      FieldKind = fkLookup
      FieldName = 'Nome'
      LookupDataSet = Dados.tbEspecie
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Especie'
      Size = 40
      Lookup = True
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 392
    Top = 144
  end
end
