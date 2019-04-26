inherited fbTran: TfbTran
  Left = 47
  Top = 116
  Caption = 'Transa'#231#245'es'
  ClientHeight = 445
  ClientWidth = 933
  OldCreateOrder = True
  ExplicitWidth = 949
  ExplicitHeight = 481
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Width = 933
    Height = 445
    ExplicitWidth = 933
    ExplicitHeight = 445
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 933
      Height = 54
      ExplicitWidth = 933
      ExplicitHeight = 54
    end
    object Grid: TcxGrid
      Left = 0
      Top = 54
      Width = 933
      Height = 235
      Align = alClient
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
        OptionsView.Navigator = True
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.Column = TVObs
        Preview.MaxLineCount = 0
        Preview.Visible = True
        Styles.OnGetContentStyle = TVStylesGetContentStyle
        object TVFidelidade: TcxGridDBColumn
          AlternateCaption = 'Resgate Pr'#234'mio Fidelidade'
          DataBinding.FieldName = 'FidResgate'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.Images = im16
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items = <
            item
              Description = 'N'#227'o'
              Value = False
            end
            item
              Description = 'Sim'
              ImageIndex = 0
              Value = True
            end>
          Properties.ShowDescriptions = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000098CD290085BBA70082B7E7007EB3ED0078
            ABBA007DB5450000000000000000000000000000000000000000000000000000
            0000000000000000000000AAE248069CCEF42AC6EAFF4BE5FFFF4BE5FFFF0EB3
            E1FF0084B8FD0083BD6E00000000000000000000000000000000000000000000
            00000000000000B6F81B08A7D7F14DE9FFFF34CAECFF25B3DAFF20ADD6FF52CA
            E1FF36DCFDFF007FB5FB0089C12A000000000000000000000000000000000000
            00000000000000B3EA7F39D2F3FF1DC3EDFF2BC0E5FF4BE6FFFF32DFFFFF18AC
            D7FF2FB1D4FF08ABDBFF0083BA87000000000000000000000000000000000000
            00000000000000B9F2AC43DFFCFF2AD7FEFF43D6F3FF57EAFFFF42E4FFFF1CC1
            EBFF73ECF9FF20C5EDFF0085BFAB000000000000000000000000000000000000
            00000000000000BFF89F42DEFBFF10C6F3FF4EDCF5FF68EFFFFF52E9FFFF24C6
            EDFF28B1D7FF1CC0EAFF008DC794000000000000000000000000000000000000
            00000000000000C8FC5532D1F2FF26DBFFFF15CBF7FF45D7F5FF34CFF2FF36CC
            EFFF5FF2FFFF03A0D1FE009DD742000000000000000000000000000000000000
            0000000000000089FF0200BEEDB941DAF7FF2ED9FEFF28D7FEFF37DCFEFF45DE
            FBFF18B8E2FF00A3D8A000000000000000000000000000000000000000000000
            0000000000000000000000CAFF0A00BFF79B0DC8F7FA26D2FAFF20CCF6FF00B2
            E8ED00A8E37C0058BF0300000000000000000000000000000000000000000000
            0000000000000000000000000000A8615D3982585ACF646871FF665662FF8130
            39D7256C0E500000000000000000000000000000000000000000000000000000
            00000000000000000000B67F7F48A36E6DF9BE7876FFC47378FF5D8F47FF0D96
            15FF0E7A15FE088A185E00000000000000000000000000000000000000000000
            000000000000C1C9C903B07B7AE1DA8786FFD58183FFAA8670FF07B529FF11AD
            25FF0B9B16FF0B7F17EB00680008000000000000000000000000000000000000
            000000000000CA909031CB8C89FFF39091FFE9888BFF939A6BFF12BA38FF18B3
            31FF14B129FF0B8516FF0F901D3A000000000000000000000000000000000000
            000000000000D59E9E23C28F8EECBB8986F9B57F7EF8A07B71F5339F48F31BA1
            3AF1189B32F1149229DA108D2021000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
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
          RepositoryItem = Dados.erTipoTran
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
      Top = 297
      Width = 933
      Height = 148
      Align = alBottom
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      RootLevelOptions.DetailTabsPosition = dtpTop
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
      Top = 289
      Width = 933
      Height = 8
      HotZoneClassName = 'TcxSimpleStyle'
      HotZone.Visible = False
      AlignSplitter = salBottom
      Control = gridAP
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
    LookAndFeel.Kind = lfStandard
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
      UseRestSpace = True
    end
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      ButtonStyle = bsDropDown
      DropDownMenu = pmObs
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
      LargeImageIndex = 47
      GlyphLayout = glTop
    end
    inherited cmImprimir: TdxBarLargeButton
      LargeImageIndex = 7
      GlyphLayout = glTop
    end
    inherited cmLayout: TdxBarLargeButton
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
      OnChange = cmMostrarChange
      ShowCaption = True
      Width = 100
      Text = 'Todas transa'#231#245'es'
      ShowEditor = False
      Items.Strings = (
        'Aguardando Pagamento'
        'Todas transa'#231#245'es')
      ItemIndex = 1
    end
    object cmFiltroTipo: TdxBarLargeButton
      Caption = 'Filtrar'
      Category = 0
      Hint = 
        'Clique aqui para filtrar os tipos de transa'#231#245'es que devem ser ex' +
        'ibidos'
      Visible = ivAlways
      LargeImageIndex = 43
      OnClick = cmFiltroTipoClick
      AutoGrayScale = False
    end
    object cmFechar: TdxBarLargeButton
      Caption = '&Fechar'
      Category = 0
      Hint = 'Fechamento de Caixa'
      Visible = ivAlways
      LargeImageIndex = 62
      OnClick = cmFecharClick
      AutoGrayScale = False
    end
    object cmSuprimento: TdxBarLargeButton
      Caption = '&Suprimento'
      Category = 0
      Hint = 'Suprimento: Adicionar dinheiro no caixa'
      Visible = ivAlways
      LargeImageIndex = 63
      OnClick = cmSuprimentoClick
      AutoGrayScale = False
    end
    object cmSangria: TdxBarLargeButton
      Caption = 'S&angria'
      Category = 0
      Hint = 'Sangria: Retirar dinheiro do caixa'
      Visible = ivAlways
      LargeImageIndex = 64
      OnClick = cmSuprimentoClick
      AutoGrayScale = False
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar Transa'#231#227'o'
      Category = 0
      Hint = 'Cancelar Transa'#231#227'o'
      Visible = ivAlways
      LargeImageIndex = 65
      OnClick = cmCancelarClick
      AutoGrayScale = False
    end
    object cmRecibo: TdxBarLargeButton
      Caption = 'Recibo'
      Category = 0
      Hint = 'Recibo'
      Visible = ivAlways
      LargeImageIndex = 50
      OnClick = cmReciboClick
      AutoGrayScale = False
    end
    object cmCorrigeDataCaixa: TdxBarLargeButton
      Caption = 'Corrigir Data Caixa'
      Category = 0
      Hint = 'Corrigir Data Caixa'
      Visible = ivAlways
      LargeImageIndex = 69
      OnClick = cmCorrigeDataCaixaClick
      AutoGrayScale = False
    end
    object cmObs: TdxBarButton
      Caption = 'Editar Observa'#231#245'es'
      Category = 0
      Hint = 'Editar Observa'#231#245'es'
      Visible = ivAlways
      OnClick = cmObsClick
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
  object Timer2: TTimer
    Enabled = False
    Interval = 50
    Left = 509
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
      end>
  end
  object pmObs: TdxBarPopupMenu
    BarManager = BarMgr
    ItemLinks = <
      item
        Visible = True
        ItemName = 'cmObs'
      end>
    UseOwnFont = False
    Left = 304
    Top = 216
  end
end
