inherited fbgPacVen: TfbgPacVen
  Tag = 1
  Left = 102
  Top = 156
  Width = 720
  Height = 450
  Caption = 'Pacotes Vendidos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited LMDSimplePanel1: TLMDSimplePanel
    Top = 65
    Width = 712
    Height = 358
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 702
      Height = 5
    end
    inherited panDiv1: TLMDSimplePanel
      Top = 10
      Width = 702
    end
    inherited panPri: TLMDSimplePanel
      Top = 17
      Width = 702
      Height = 336
      inherited LMDSimplePanel2: TLMDSimplePanel
        Width = 700
        Height = 308
        inherited Grid: TdxDBGrid
          Width = 700
          Height = 308
          DataSource = dsTab
          Filter.Criteria = {00000000}
          OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoUseBookmarks]
          OnFilterChanged = GridFilterChanged
          object GridData: TdxDBGridColumn
            Alignment = taCenter
            HeaderAlignment = taCenter
            Width = 79
            BandIndex = 0
            RowIndex = 0
            DisableGrouping = True
            FieldName = 'Data'
            DisableFilter = True
          end
          object GridContato: TdxDBGridLookupColumn
            Caption = 'Cliente'
            Width = 163
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NomeContato'
          end
          object GridTempo: TdxDBGridMaskColumn
            Alignment = taCenter
            Caption = 'Horas'
            HeaderAlignment = taCenter
            Width = 90
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Tempo'
            OnGetText = GridTempoGetText
          end
          object GridTotal: TdxDBGridCurrencyColumn
            Caption = 'Total'
            Width = 93
            BandIndex = 0
            RowIndex = 0
            FieldName = 'ValorFinal'
            Nullable = False
          end
          object GridDesconto: TdxDBGridCurrencyColumn
            Width = 112
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Desconto'
            Nullable = False
          end
          object GridFuncI: TdxDBGridMaskColumn
            Caption = 'Funcionário'
            Width = 83
            BandIndex = 0
            RowIndex = 0
            FieldName = 'FuncI'
          end
        end
      end
      inherited BarDockControl: TdxBarDockControl
        Width = 700
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
        Caption = 'barMenu'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 164
        FloatTop = 132
        FloatClientWidth = 23
        FloatClientHeight = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        IsMainMenu = True
        ItemLinks = <
          item
            Item = cmArquivo
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            Item = cmSubEditar
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            Item = cmSubExibir
            UserGlyph.Data = {00000000}
            Visible = True
          end>
        MultiLine = True
        Name = 'barMenu'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = True
        UseRecentItems = False
        UseRestSpace = True
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Barra2'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 23
        DockingStyle = dsTop
        FloatLeft = 164
        FloatTop = 132
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmApagar
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            Item = cmEditar
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmPreviewObs
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            Item = cmRefresh
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            Item = cmGrafico
            UserDefine = [udPaintStyle]
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmFechar
            UserGlyph.Data = {00000000}
            Visible = True
          end>
        Name = 'Barra2'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 1
        ShowMark = False
        SizeGrip = False
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
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmLayout
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmSubPeriodo
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmMostrar
            UserDefine = [udWidth]
            UserGlyph.Data = {00000000}
            UserWidth = 221
            Visible = True
          end>
        Name = 'barFiltro'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end>
    Categories.ItemsVisibles = (
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
      True)
    DockControlHeights = (
      0
      0
      65
      0)
    inherited cmSubPeriodo: TdxBarSubItem
      Visible = ivNever
      ItemLinks = <
        item
          Item = cmHoje
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmEstaSemana
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmEsteMes
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmEsteAno
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmAno
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmMes
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmDias
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmPeriodoTudo
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmInicio
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmFim
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmDias: TdxBarSubItem
      ItemLinks = <
        item
          Item = cm2dias
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cm3dias
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cm4dias
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cm5dias
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cm6dias
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cm1semana
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cm1Mes
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cm1ano
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmLayout: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmCustomizar
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmLayoutSalvar
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmSalvarAtual
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmOpcoes
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmResetarLayout
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmLayouts
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmAno: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmAnos
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmMes: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmAno1
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmAno2
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmAno3
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmAno4
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmAno5
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmAno6
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmAno7
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmAno8
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmAno9
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmAno10
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmAno1: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmMeses
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmAno2: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmMeses
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmAno3: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmMeses
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmOpcoes: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmTotalizar
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmSalvarPadrao
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmRestaurar
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmArquivo: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmExportar
          UserDefine = [udPaintStyle]
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmImprimir
          UserDefine = [udPaintStyle]
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmFechar
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmSubEditar: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmApagar
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmEditar
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmLayout
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmSubPeriodo
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmSubExibir: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmPreviewObs
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmRefresh
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmGrafico
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmLocalizar: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmColunas
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    object cmMostrar: TdxBarCombo
      Caption = 'Mostrar'
      Category = 0
      Hint = 'Mostrar'
      Visible = ivAlways
      Text = 'Lista de pacotes vendidos no caixa atual'
      OnChange = cmMostrarChange
      ShowCaption = True
      Width = 100
      ShowEditor = False
      Items.Strings = (
        'Lista de pacotes vendidos no caixa atual'
        'Lista de pacotes vendidos hoje'
        'Lista de pacotes vendidos em um período')
      ItemIndex = 0
    end
  end
  inherited pmLocalizar: TdxBarPopupMenu
    ItemLinks = <
      item
        Item = cmColunas
        UserGlyph.Data = {00000000}
        Visible = True
      end>
  end
  object Tab: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Numero'
        DataType = ftAutoInc
      end
      item
        Name = 'Caixa'
        DataType = ftInteger
      end
      item
        Name = 'Aberto'
        DataType = ftBoolean
      end
      item
        Name = 'Inicio'
        DataType = ftDateTime
      end
      item
        Name = 'Fim'
        DataType = ftDateTime
      end
      item
        Name = 'DataPagto'
        DataType = ftDateTime
      end
      item
        Name = 'Contato'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Maquina'
        DataType = ftWord
      end
      item
        Name = 'Tipo'
        DataType = ftWord
      end
      item
        Name = 'FuncI'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'FuncF'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Tempo'
        DataType = ftDateTime
      end
      item
        Name = 'TempoCobrado'
        DataType = ftDateTime
      end
      item
        Name = 'CredUsado'
        DataType = ftInteger
      end
      item
        Name = 'CredAnterior'
        DataType = ftInteger
      end
      item
        Name = 'Desconto'
        DataType = ftCurrency
      end
      item
        Name = 'Produtos'
        DataType = ftCurrency
      end
      item
        Name = 'MotivoDesc'
        DataType = ftWord
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Isento'
        DataType = ftBoolean
      end
      item
        Name = 'FormaPagto'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NaoUsarPacote'
        DataType = ftBoolean
      end
      item
        Name = 'CodPacote'
        DataType = ftWord
      end>
    FilterOptions = [foCaseInsensitive]
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'IAberto'
        Fields = 'Aberto;Maquina'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IContato'
        Fields = 'Contato;Inicio'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IData'
        Fields = 'Inicio'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IUsuario'
        Fields = 'FuncI;Inicio'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'INumero'
        Fields = 'Numero'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IPagto'
        Fields = 'Aberto;DataPagto;Inicio'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'IData'
    SessionName = 'SesPad'
    TableName = 'Acesso'
    OnCalcFields = TabCalcFields
    Left = 40
    Top = 155
    object TabNumero: TAutoIncField
      DisplayLabel = 'Num'
      FieldName = 'Numero'
    end
    object TabAberto: TBooleanField
      FieldName = 'Aberto'
    end
    object TabInicio: TDateTimeField
      FieldName = 'Inicio'
      DisplayFormat = 'hh:mm:ss'
    end
    object TabFim: TDateTimeField
      FieldName = 'Fim'
      DisplayFormat = 'hh:mm:ss'
    end
    object TabContato: TIntegerField
      FieldName = 'Contato'
    end
    object TabNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object TabMaquina: TWordField
      DisplayLabel = 'Máquina'
      FieldName = 'Maquina'
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
    end
    object TabMotivoDesc: TWordField
      FieldName = 'MotivoDesc'
    end
    object TabValor: TCurrencyField
      FieldName = 'Valor'
    end
    object TabObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TabCredUsado: TIntegerField
      FieldName = 'CredUsado'
    end
    object TabCredAnterior: TIntegerField
      FieldName = 'CredAnterior'
    end
    object TabIsento: TBooleanField
      FieldName = 'Isento'
    end
    object TabData: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'Data'
      DisplayFormat = 'dd/mm/yyyy'
      Calculated = True
    end
    object TabCredUsadoT: TDateTimeField
      DisplayLabel = 'Cred. Usado'
      FieldKind = fkCalculated
      FieldName = 'CredUsadoT'
      DisplayFormat = 'hh:mm:ss'
      Calculated = True
    end
    object TabCredAntT: TDateTimeField
      DisplayLabel = 'Cred. Anterior'
      FieldKind = fkCalculated
      FieldName = 'CredAntT'
      DisplayFormat = 'hh:mm:ss'
      Calculated = True
    end
    object TabDataPagto: TDateTimeField
      FieldName = 'DataPagto'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object TabDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object TabTipo: TWordField
      FieldName = 'Tipo'
    end
    object TabFormaPagto: TStringField
      FieldName = 'FormaPagto'
    end
    object TabMotivo: TStringField
      FieldKind = fkLookup
      FieldName = 'Motivo'
      LookupDataSet = Dados.tbMotivo
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'MotivoDesc'
      Size = 30
      Lookup = True
    end
    object TabValorFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorFinal'
      Calculated = True
    end
    object TabCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object TabTempoCobrado: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Tempo Cobrado'
      FieldName = 'TempoCobrado'
      DisplayFormat = 'hh:mm:ss'
    end
    object TabNaoUsarPacote: TBooleanField
      FieldName = 'NaoUsarPacote'
    end
    object TabProdutos: TCurrencyField
      FieldName = 'Produtos'
    end
    object TabNomeContato: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeContato'
      LookupDataSet = Dados.tbCli
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'Contato'
      Lookup = True
    end
    object TabCodPacote: TWordField
      FieldName = 'CodPacote'
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 88
    Top = 155
  end
end
