inherited fbExtratoFid: TfbExtratoFid
  Left = 144
  Top = 157
  Caption = 'Extrato de movimenta'#231#227'o de pontos'
  ClientHeight = 397
  ClientWidth = 741
  OldCreateOrder = True
  ExplicitWidth = 749
  ExplicitHeight = 424
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TParentedPanel
    Width = 741
    Height = 397
    ExplicitWidth = 741
    ExplicitHeight = 397
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 741
      Height = 36
      ExplicitWidth = 741
      ExplicitHeight = 36
    end
    object Grid: TcxGrid
      Left = 0
      Top = 36
      Width = 741
      Height = 361
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      object TV: TcxGridDBTableView
        OnDblClick = cmEditarClick
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.First.Visible = False
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Append.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.Visible = True
        OnCustomDrawCell = TVCustomDrawCell
        DataController.DataModeController.GridMode = True
        DataController.DataSource = dsTab
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.KeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0.0'
            Kind = skSum
            Position = spFooter
          end
          item
            Format = '0.0'
            Kind = skSum
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.0'
            Kind = skSum
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
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        object TVDataMov: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'DataHora'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.DateButtons = [btnClear, btnToday]
          Properties.DateOnError = deToday
          Width = 130
        end
        object TVTipoOpe: TcxGridDBColumn
          Caption = 'Opera'#231#227'o'
          DataBinding.FieldName = 'FidOpe'
          RepositoryItem = Dados.erFidOpe
          Width = 128
        end
        object TVPontos: TcxGridDBColumn
          Caption = 'Pontos'
          DataBinding.FieldName = 'FidPontosFat'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taRightJustify
          OnCustomDrawCell = TVPontosCustomDrawCell
          OnGetDisplayText = TVPontosGetDisplayText
          HeaderAlignmentHorz = taCenter
          Styles.Content = FrmPri.cxStyle30
          Width = 85
        end
        object TVTran: TcxGridDBColumn
          Caption = 'Transa'#231#227'o'
          DataBinding.FieldName = 'Tran'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ImmediatePost = True
          HeaderAlignmentHorz = taCenter
          Width = 68
        end
        object TVCanc: TcxGridDBColumn
          DataBinding.FieldName = 'Cancelado'
          RepositoryItem = Dados.erSimNao
          HeaderAlignmentHorz = taCenter
          Width = 68
        end
        object TVTipoTran: TcxGridDBColumn
          Caption = 'Tipo Transa'#231#227'o'
          DataBinding.FieldName = 'TipoTran'
          RepositoryItem = Dados.erTipoTran
          HeaderAlignmentHorz = taCenter
          MinWidth = 16
          Width = 109
        end
        object TVCaixa: TcxGridDBColumn
          DataBinding.FieldName = 'Caixa'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ImmediatePost = True
          HeaderAlignmentHorz = taCenter
          Width = 51
        end
        object TVTipoItem: TcxGridDBColumn
          Caption = 'Tipo de Item'
          DataBinding.FieldName = 'TipoItem'
          RepositoryItem = Dados.erTipoItem
          HeaderAlignmentHorz = taCenter
          Width = 104
        end
        object TVPago: TcxGridDBColumn
          Caption = 'Valor Pago'
          DataBinding.FieldName = 'Pago'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 66
        end
        object TVNomeFunc: TcxGridDBColumn
          Caption = 'Funcion'#225'rio'
          DataBinding.FieldName = 'NomeFunc'
          OnGetDisplayText = TVNomeFuncGetDisplayText
        end
        object TVFunc: TcxGridDBColumn
          DataBinding.FieldName = 'Func'
          Visible = False
          VisibleForCustomization = False
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
  end
  inherited BarMgr: TdxBarManager
    ImageOptions.LargeImages = dmImagens.im24
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
      Caption = '&Editar Transa'#231#227'o'
      Hint = 'Editar Transa'#231#227'o'
      LargeImageIndex = 2
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
      GlyphLayout = glLeft
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      LargeImageIndex = 22
      GlyphLayout = glLeft
      ImageIndex = -1
    end
  end
  inherited CP: TdxComponentPrinter
    Left = 296
    Top = 50
  end
  object Tab: TnxTable
    Database = Dados.db
    FilterOptions = [foCaseInsensitive]
    FlipOrder = True
    OnCalcFields = TabCalcFields
    TableName = 'ITran'
    IndexName = 'IFidMovClienteDH'
    Left = 145
    Top = 182
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabTran: TIntegerField
      FieldName = 'Tran'
    end
    object TabCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object TabCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object TabSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object TabDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object TabTipoTran: TWordField
      Alignment = taLeftJustify
      FieldName = 'TipoTran'
    end
    object TabTipoItem: TWordField
      Alignment = taLeftJustify
      FieldName = 'TipoItem'
    end
    object TabSubTipo: TWordField
      FieldName = 'SubTipo'
    end
    object TabItemID: TIntegerField
      FieldName = 'ItemID'
    end
    object TabSubItemID: TIntegerField
      FieldName = 'SubItemID'
    end
    object TabItemPos: TWordField
      FieldName = 'ItemPos'
    end
    object TabPago: TCurrencyField
      FieldName = 'Pago'
    end
    object TabCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object TabFidFator: TSmallintField
      FieldName = 'FidFator'
    end
    object TabFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
    object TabFidMov: TBooleanField
      FieldName = 'FidMov'
    end
    object TabFidPontosFat: TFloatField
      FieldKind = fkCalculated
      FieldName = 'FidPontosFat'
      Calculated = True
    end
    object TabFunc: TStringField
      FieldKind = fkLookup
      FieldName = 'Func'
      LookupDataSet = Dados.tbTran
      LookupKeyFields = 'ID'
      LookupResultField = 'Func'
      KeyFields = 'Tran'
      Lookup = True
    end
    object TabNomeFunc: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeFunc'
      LookupDataSet = Dados.mtUsuario
      LookupKeyFields = 'Username'
      LookupResultField = 'Nome'
      KeyFields = 'Func'
      Size = 40
      Lookup = True
    end
    object TabFidOpe: TWordField
      Alignment = taLeftJustify
      FieldName = 'FidOpe'
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 185
    Top = 182
  end
end
