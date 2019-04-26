inherited fbRevisarProduto: TfbRevisarProduto
  Caption = 'Revisar produtos cadastrados rapidamente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TLMDSimplePanel
    inherited dxBarDockControl1: TdxBarDockControl
      Height = 32
      ExplicitHeight = 32
    end
    object Grid: TcxGrid
      Left = 0
      Top = 32
      Width = 668
      Height = 319
      Align = alClient
      TabOrder = 1
      object TV: TcxGridDBTableView
        OnDblClick = cmEditarClick
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DataSource1
        DataController.KeyFieldNames = 'ID'
        DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GridLines = glNone
        OptionsView.GroupByBox = False
        OptionsView.Header = False
        OptionsView.Indicator = True
        object TVColumnID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Visible = False
        end
        object TVColumnDescricao: TcxGridDBColumn
          DataBinding.FieldName = 'Descricao'
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
  end
  inherited BarMgr: TdxBarManager
    ImageOptions.Images = nil
    ImageOptions.LargeImages = nil
    Left = 264
    Top = 96
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
        end>
    end
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      LargeImageIndex = 2
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
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 88
    Top = 177
  end
  inherited CP: TdxComponentPrinter
    Left = 56
  end
  inherited dlgExp: TSaveDialog
    Left = 16
    Top = 81
  end
  inherited pmLay: TdxBarPopupMenu
    Left = 96
    Top = 50
  end
  inherited pmPeriodo: TdxBarPopupMenu
    Left = 96
    Top = 84
  end
  object Tab: TnxTable
    Database = Dados.db
    TableName = 'Produto'
    IndexName = 'ICadastroRapido'
    Left = 152
    Top = 136
    object TabDescricao: TStringField
      FieldName = 'Descricao'
      Size = 55
    end
    object TabCadastroRapido: TBooleanField
      FieldName = 'CadastroRapido'
    end
    object TabIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabCodigo: TStringField
      FieldName = 'Codigo'
      Size = 15
    end
    object TabUnid: TStringField
      FieldName = 'Unid'
      Size = 5
    end
    object TabPreco: TCurrencyField
      FieldName = 'Preco'
    end
    object TabObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TabImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object TabCategoria: TStringField
      FieldName = 'Categoria'
      Size = 35
    end
    object TabFornecedor: TIntegerField
      FieldName = 'Fornecedor'
    end
    object TabSubCateg: TStringField
      FieldName = 'SubCateg'
      Size = 35
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
    object TabPodeAlterarPreco: TBooleanField
      FieldName = 'PodeAlterarPreco'
    end
    object TabNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object TabEstoqueMin: TFloatField
      FieldName = 'EstoqueMin'
    end
    object TabEstoqueMax: TFloatField
      FieldName = 'EstoqueMax'
    end
    object TabAbaixoMin: TBooleanField
      FieldName = 'AbaixoMin'
    end
    object TabAbaixoMinDesde: TDateTimeField
      FieldName = 'AbaixoMinDesde'
    end
    object TabEstoqueRepor: TFloatField
      FieldName = 'EstoqueRepor'
    end
    object Tabplus: TBooleanField
      FieldName = 'plus'
    end
    object TabplusURL: TnxMemoField
      FieldName = 'plusURL'
      BlobType = ftMemo
    end
    object TabplusCodParceiro: TStringField
      FieldName = 'plusCodParceiro'
      Size = 15
    end
    object TabplusCodProduto: TStringField
      FieldName = 'plusCodProduto'
      Size = 15
    end
    object TabAtivo: TBooleanField
      FieldName = 'Ativo'
    end
    object TabFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object TabFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
    object Tabmd5Imagem: TStringField
      FieldName = 'md5Imagem'
      Size = 32
    end
    object TablastProdModif: TDateTimeField
      FieldName = 'lastProdModif'
    end
    object TabuploadR: TWordField
      FieldName = 'uploadR'
    end
    object TabuploadS: TWordField
      FieldName = 'uploadS'
    end
    object Tabfk_produ: TIntegerField
      FieldName = 'fk_produ'
    end
    object TabbatchUID: TGuidField
      FieldName = 'batchUID'
      Size = 38
    end
  end
  object DataSource1: TDataSource
    DataSet = Tab
    Left = 192
    Top = 136
  end
end
