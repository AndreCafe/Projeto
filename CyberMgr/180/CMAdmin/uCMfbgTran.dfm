inherited fbgTran: TfbgTran
  Left = 193
  Top = 153
  Width = 708
  Height = 419
  Caption = 'Transa'#231#245'es'
  Menu = nil
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited LMDSimplePanel1: TLMDSimplePanel
    Width = 700
    Height = 385
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 700
    end
    inherited panDiv1: TLMDSimplePanel
      Width = 700
    end
    inherited panPri: TLMDSimplePanel
      Width = 700
      Height = 334
      inherited LMDSimplePanel2: TLMDSimplePanel
        Top = 1
        Width = 698
        Height = 332
        inherited Grid: TdxDBGrid
          Top = 44
          Width = 698
          Height = 288
          ShowSummaryFooter = False
          DataSource = dsTab
          Filter.Criteria = {00000000}
          OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoUseBookmarks]
          OnFilterChanged = GridFilterChanged
          object GridMaquina: TdxDBGridMaskColumn
            Alignment = taCenter
            Caption = 'Maq'
            HeaderAlignment = taCenter
            Width = 72
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Maquina'
          end
          object GridData: TdxDBGridColumn
            Width = 95
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Data'
          end
          object GridInicio: TdxDBGridTimeColumn
            Alignment = taCenter
            Caption = 'Hora'
            HeaderAlignment = taCenter
            Width = 79
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Inicio'
          end
          object GridTempo: TdxDBGridDateColumn
            Alignment = taCenter
            HeaderAlignment = taCenter
            Width = 71
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Tempo'
          end
          object GridTipo: TdxDBGridImageColumn
            Alignment = taLeftJustify
            Caption = 'Tipo de Transa'#231#227'o'
            MinWidth = 16
            Width = 108
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Tipo'
            Descriptions.Strings = (
              'Acesso'
              'Venda de Pacote'
              'Cr'#233'dito de Tempo'
              'Manuten'#231#227'o'
              'Acesso + Venda'
              'D'#233'bito de Tempo'
              'Sinal'
              'Venda Avulsa'
              'Compra'
              'Entrada de Estoque'
              'Sa'#237'da de Estoque'
              'Pagamento de D'#233'bito'
              'Suprimento de Caixa'
              'Sangria de Caixa'
              'Venda Passaporte')
            ImageIndexes.Strings = (
              '0'
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12'
              '13'
              '14')
            ShowDescription = True
            Values.Strings = (
              '0'
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12'
              '13'
              '14')
          end
          object GridNome: TdxDBGridMaskColumn
            Width = 143
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Nome'
          end
          object GridValorFinal: TdxDBGridColumn
            Caption = 'Total Final'
            HeaderAlignment = taCenter
            Width = 80
            BandIndex = 0
            RowIndex = 0
            FieldName = 'ValorFinal'
          end
          object GridPagto: TdxDBGridImageColumn
            Alignment = taCenter
            Caption = 'Pagto.'
            HeaderAlignment = taCenter
            MinWidth = 16
            Width = 87
            BandIndex = 0
            RowIndex = 0
            OnCustomDrawCell = GridPagtoCustomDrawCell
            FieldName = 'StatusPagto'
            Descriptions.Strings = (
              'Em Andamento'
              'Aguarda Pagto.'
              'Sim'
              'N'#227'o')
            ImageIndexes.Strings = (
              '0'
              '1'
              '2'
              '3')
            ShowDescription = True
            Values.Strings = (
              '0'
              '1'
              '2'
              '3')
          end
          object GridTipoAcesso: TdxDBGridLookupColumn
            Caption = 'Tipo de Acesso'
            Width = 96
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NomeTipoAcesso'
          end
          object GridFim: TdxDBGridTimeColumn
            Alignment = taCenter
            Caption = 'Hora Final'
            HeaderAlignment = taCenter
            Width = 86
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Fim'
          end
          object GridDesconto: TdxDBGridCurrencyColumn
            Width = 89
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Desconto'
            Nullable = False
          end
          object GridDescProd: TdxDBGridCurrencyColumn
            Caption = 'Desc. Produtos'
            Width = 99
            BandIndex = 0
            RowIndex = 0
            FieldName = 'DescontoProduto'
            Nullable = False
          end
          object GridObs: TdxDBGridColumn
            Caption = 'Obs'
            Width = 215
            BandIndex = 0
            RowIndex = 0
            FieldName = 'ObsSt'
          end
          object GridNomeFuncI: TdxDBGridLookupColumn
            Caption = 'Funcion'#225'rio'
            Width = 184
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NomeFuncI'
          end
        end
        inherited panNovo: TLMDSimplePanel
          Width = 698
          inherited btnLayout: TLMDSpeedButton
            Width = 67
          end
          inherited btnPeriodo: TLMDSpeedButton
            Left = 272
            Width = 157
            Caption = '99/99/9999 a 99/99/9999'
          end
          inherited btnExportar: TLMDSpeedButton
            Left = 588
          end
          inherited btnImprimir: TLMDSpeedButton
            Left = 560
          end
          object cmFiltroTipo: TLMDSpeedButton
            Left = 433
            Top = 1
            Width = 127
            Height = 23
            Caption = 'Filtrar Tipo de Transa'#231#227'o'
            OnClick = cmFiltroTipoClick
            Align = alLeft
            Style = ubsFlat
          end
          object lbQuant: TLMDLabel
            Left = 616
            Top = 1
            Width = 72
            Height = 23
            Bevel.Mode = bmCustom
            Align = alLeft
            Alignment = agCenter
            AutoSize = False
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = []
            ParentColor = False
            ParentFont = False
            Transparent = False
            Caption = '9999 itens'
          end
          object LMDSimplePanel4: TLMDSimplePanel
            Left = 268
            Top = 1
            Width = 4
            Height = 23
            UseDockManager = False
            Align = alLeft
            Bevel.BorderSides = [fsRight]
            Bevel.Mode = bmEdge
            TabOrder = 0
          end
          object LMDSimplePanel5: TLMDSimplePanel
            Left = 68
            Top = 1
            Width = 4
            Height = 23
            UseDockManager = False
            Align = alLeft
            Bevel.BorderSides = [fsRight]
            Bevel.Mode = bmEdge
            TabOrder = 1
          end
          object panMostrar: TLMDSimplePanel
            Left = 72
            Top = 1
            Width = 196
            Height = 23
            UseDockManager = False
            Align = alLeft
            Bevel.Mode = bmCustom
            TabOrder = 2
            object cmMostrar: TdxPickEdit
              Left = 4
              Top = 2
              Width = 188
              TabOrder = 0
              AutoSize = False
              StyleController = dxEditStyleController1
              Text = 'Mostrar Transa'#231#245'es do caixa atual'
              OnChange = cmMostrarChange
              DropDownListStyle = True
              Items.Strings = (
                'Mostrar Aguardando Pagamento'
                'Mostrar Transa'#231#245'es do caixa atual'
                'Mostrar Transa'#231#245'es do dia'
                'Mostrar Todas Transa'#231#245'es'
                'Mostrar Transa'#231#245'es em D'#233'bito')
              Height = 18
            end
          end
          object LMDSimplePanel6: TLMDSimplePanel
            Left = 429
            Top = 1
            Width = 4
            Height = 23
            UseDockManager = False
            Align = alLeft
            Bevel.BorderSides = [fsRight]
            Bevel.Mode = bmEdge
            TabOrder = 3
          end
        end
        object MenuBar20001: TMenuBar2000
          Left = 0
          Top = 25
          Width = 698
          Height = 19
          Flat = bsWinXP
          Align = alTop
          Menu = MenuPri
        end
        object MenuBar20002: TMenuBar2000
          Left = 0
          Top = 44
          Width = 698
          Height = 0
          Align = alTop
        end
      end
      inherited BarDockControl: TdxBarDockControl
        Width = 698
        Height = 0
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
        Caption = 'Barra2'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 164
        FloatTop = 132
        FloatClientWidth = 65
        FloatClientHeight = 294
        ItemLinks = <
          item
            Item = FrmBaseGrid.cmNovo
            Visible = True
          end
          item
            Item = FrmBaseGrid.cmApagar
            Visible = True
          end
          item
            Item = FrmBaseGrid.cmEditar
            Visible = True
          end
          item
            BeginGroup = True
            Item = FrmBaseGrid.cmPreviewObs
            Visible = True
          end
          item
            Item = FrmBaseGrid.cmRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = FrmBaseGrid.cmFechar
            Visible = True
          end>
        Name = 'Barra2'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'barFiltro'
        DockControl = BarDockControl
        DockedDockControl = BarDockControl
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 84
        FloatTop = 72
        FloatClientWidth = 176
        FloatClientHeight = 50
        ItemLinks = <
          item
            Item = cmLayout
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmSubPeriodo
            Visible = True
          end>
        Name = 'barFiltro'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = False
        WholeRow = False
      end>
    Categories.ItemsVisibles = (
      2
      2
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True
      True
      True)
    DockControlHeights = (
      0
      0
      0
      0)
    inherited cmSubPeriodo: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmHoje
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmOntem
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmEstaSemana
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmEsteMes
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmEsteAno
          Visible = True
        end
        item
          BeginGroup = True
          Item = FrmBaseGrid.cmAno
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmMes
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmDias
          Visible = True
        end
        item
          BeginGroup = True
          Item = FrmBaseGrid.cmPeriodoTudo
          Visible = True
        end
        item
          BeginGroup = True
          Item = FrmBaseGrid.cmInicio
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmFim
          Visible = True
        end>
    end
    inherited cmDias: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cm2dias
          Visible = True
        end
        item
          Item = FrmBaseGrid.cm3dias
          Visible = True
        end
        item
          Item = FrmBaseGrid.cm4dias
          Visible = True
        end
        item
          Item = FrmBaseGrid.cm5dias
          Visible = True
        end
        item
          Item = FrmBaseGrid.cm6dias
          Visible = True
        end
        item
          Item = FrmBaseGrid.cm1semana
          Visible = True
        end
        item
          Item = FrmBaseGrid.cm1Mes
          Visible = True
        end
        item
          Item = FrmBaseGrid.cm1ano
          Visible = True
        end>
    end
    inherited cmLayout: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmCustomizar
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmResetarLayout
          Visible = True
        end
        item
          BeginGroup = True
          Item = FrmBaseGrid.cmLayouts
          Visible = True
        end>
    end
    inherited cmAno: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmAnos
          Visible = True
        end>
    end
    inherited cmMes: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmAno1
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmAno2
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmAno3
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmAno4
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmAno5
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmAno6
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmAno7
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmAno8
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmAno9
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmAno10
          Visible = True
        end>
    end
    inherited cmAno1: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmMeses
          Visible = True
        end>
    end
    inherited cmAno2: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmMeses
          Visible = True
        end>
    end
    inherited cmAno3: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmMeses
          Visible = True
        end>
    end
    inherited cmArquivo: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmImprimir
          UserDefine = [udPaintStyle]
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmExportar
          UserDefine = [udPaintStyle]
          Visible = True
        end
        item
          BeginGroup = True
          Item = FrmBaseGrid.cmFechar
          Visible = True
        end>
    end
    inherited cmSubEditar: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmEditar
          Visible = True
        end
        item
          BeginGroup = True
          Item = FrmBaseGrid.cmLayout
          Visible = True
        end>
    end
    inherited cmSubExibir: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmPreviewObs
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmRefresh
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmGrafico
          Visible = True
        end>
    end
    inherited cmLocalizar: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmColunas
          Visible = True
        end>
    end
    object cmOrdenar: TdxBarCombo
      Caption = 'Ordenar'
      Category = 0
      Hint = 'Ordenar'
      Visible = ivAlways
      Text = 'por Hora Final'
      OnChange = cmOrdenarChange
      ShowCaption = True
      Width = 100
      ShowEditor = False
      Items.Strings = (
        'por Hora Final'
        'por Hora Inicial')
      ItemIndex = 0
    end
  end
  inherited pmLocalizar: TdxBarPopupMenu
    ItemLinks = <
      item
        Item = FrmBaseGrid.cmColunas
        Visible = True
      end>
  end
  inherited pmLayout: TPopupMenu2000
    Left = 408
    Top = 192
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 302
    Top = 264
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 88
    Top = 155
  end
  object Tab: TnxTable
    Database = Dados.db
    FilterOptions = [foCaseInsensitive]
    OnCalcFields = TabCalcFields
    TableName = 'Transacao'
    IndexName = 'IData'
    Left = 40
    Top = 155
    object TabData: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'Data'
      DisplayFormat = 'dd/mm/yyyy'
      Calculated = True
    end
    object TabValorFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorFinal'
      Calculated = True
    end
    object TabNomeTipoAcesso: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeTipoAcesso'
      LookupDataSet = Dados.tbTipoAcesso
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'TipoAcesso'
      Size = 30
      Lookup = True
    end
    object TabNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object TabCaixaI: TIntegerField
      FieldName = 'CaixaI'
    end
    object TabCaixaF: TIntegerField
      FieldName = 'CaixaF'
    end
    object TabCaixaP: TIntegerField
      FieldName = 'CaixaP'
    end
    object TabTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object TabInicio: TDateTimeField
      FieldName = 'Inicio'
      DisplayFormat = 'hh:mm:ss'
    end
    object TabFim: TDateTimeField
      FieldName = 'Fim'
      DisplayFormat = 'hh:mm:ss'
    end
    object TabDataPagto: TDateTimeField
      FieldName = 'DataPagto'
    end
    object TabContato: TIntegerField
      FieldName = 'Contato'
    end
    object TabNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object TabMaquina: TWordField
      FieldName = 'Maquina'
    end
    object TabTipo: TWordField
      FieldName = 'Tipo'
    end
    object TabFuncI: TStringField
      FieldName = 'FuncI'
      Size = 10
    end
    object TabFuncF: TStringField
      FieldName = 'FuncF'
      Size = 40
    end
    object TabTempo: TDateTimeField
      FieldName = 'Tempo'
      DisplayFormat = 'hh:mm:ss'
    end
    object TabTempoCobrado: TDateTimeField
      FieldName = 'TempoCobrado'
    end
    object TabCredUsado: TIntegerField
      FieldName = 'CredUsado'
    end
    object TabCredAnterior: TIntegerField
      FieldName = 'CredAnterior'
    end
    object TabDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object TabProdutos: TCurrencyField
      FieldName = 'Produtos'
    end
    object TabValor: TCurrencyField
      FieldName = 'Valor'
    end
    object TabObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TabIsento: TBooleanField
      FieldName = 'Isento'
    end
    object TabNaoUsarPacote: TBooleanField
      FieldName = 'NaoUsarPacote'
    end
    object TabCodPacote: TWordField
      FieldName = 'CodPacote'
    end
    object TabSinal: TCurrencyField
      FieldName = 'Sinal'
    end
    object TabTransacaoVinculada: TIntegerField
      FieldName = 'TransacaoVinculada'
    end
    object TabValorFinalAcesso: TCurrencyField
      FieldName = 'ValorFinalAcesso'
    end
    object TabDescontoProduto: TCurrencyField
      FieldName = 'DescontoProduto'
    end
    object TabNumDoc: TStringField
      FieldName = 'NumDoc'
      Size = 15
    end
    object TabStatusPagto: TWordField
      FieldName = 'StatusPagto'
    end
    object TabObsSt: TStringField
      FieldKind = fkCalculated
      FieldName = 'ObsSt'
      Size = 200
      Calculated = True
    end
    object TabNomeFuncI: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeFuncI'
      LookupDataSet = Dados.mtUsuario
      LookupKeyFields = 'Username'
      LookupResultField = 'Nome'
      KeyFields = 'FuncI'
      Size = 30
      Lookup = True
    end
  end
end
