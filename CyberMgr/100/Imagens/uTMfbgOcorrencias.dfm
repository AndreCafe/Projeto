inherited fbgOcorrencias: TfbgOcorrencias
  Left = 181
  Top = 121
  Caption = 'Ocorrências'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TLMDSimplePanel
    inherited LMDSimplePanel2: TLMDSimplePanel
      inherited Grid: TdxDBGrid
        KeyField = 'ID'
        OnDblClick = GridDblClick
        DataSource = dsTab
        Filter.Criteria = {00000000}
        PreviewFieldName = 'Descricao'
        OnCustomDraw = GridCustomDraw
        object GridSituacao: TdxDBGridColumn
          Caption = 'Situação'
          Width = 94
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Situacao'
          SummaryType = cstCount
          SummaryField = 'ID'
          SummaryFormat = '  (0 Itens)'
          SortBySummary = True
        end
        object GridID: TdxDBGridMaskColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ID'
        end
        object GridData: TdxDBGridDateColumn
          Sorted = csUp
          Width = 101
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Data'
        end
        object GridCliente: TdxDBGridMaskColumn
          Caption = 'Contato'
          Width = 214
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NomeCliente'
          SummaryType = cstCount
          SummaryField = 'ID'
          SummaryFormat = '  (0 Itens)'
          SortBySummary = True
        end
        object GridProduto: TdxDBGridMaskColumn
          Caption = 'Produto'
          Width = 204
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NomeProduto'
          SummaryType = cstCount
          SummaryField = 'ID'
          SummaryFormat = '  (0 Itens)'
          SortBySummary = True
        end
        object GridChamada: TdxDBGridMaskColumn
          Visible = False
          Width = 172
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Chamada'
          SummaryType = cstCount
          SummaryField = 'ID'
          SummaryFormat = '  (0 Itens)'
          SortBySummary = True
        end
        object GridAcoes: TdxDBGridMemoColumn
          Caption = 'Ações'
          Width = 327
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Acoes'
          SummaryType = cstCount
          SummaryField = 'ID'
          SummaryFormat = '  (0 Itens)'
          SortBySummary = True
        end
        object GridDescricao: TdxDBGridMemoColumn
          Visible = False
          Width = 128
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Descricao'
          SummaryType = cstCount
          SummaryField = 'ID'
          SummaryFormat = '  (0 Itens)'
          SortBySummary = True
        end
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
        BorderStyle = bbsNone
        Caption = 'Filtro de Chamadas'
        DockControl = BarDockControl
        DockedDockControl = BarDockControl
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 164
        FloatTop = 132
        FloatClientWidth = 23
        FloatClientHeight = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
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
            Item = cmPreviewObs
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmRefresh
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmImprimir
            UserDefine = [udPaintStyle]
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmExportar
            UserDefine = [udPaintStyle]
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmGrafico
            UserGlyph.Data = {00000000}
            Visible = True
          end>
        Name = 'barFiltro'
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
      end>
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    DockControlHeights = (
      0
      0
      0
      0)
    inherited cmSubPeriodo: TdxBarSubItem
      Visible = ivAlways
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
  end
  object Tab: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'Data'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente'
        DataType = ftInteger
      end
      item
        Name = 'Chamada'
        DataType = ftInteger
      end
      item
        Name = 'Situacao'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Produto'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Descricao'
        DataType = ftMemo
      end
      item
        Name = 'Acoes'
        DataType = ftMemo
      end>
    IndexName = 'IID'
    SessionName = 'SesPad'
    TableName = 'Ocorrencia'
    Timeout = 10000
    Left = 46
    Top = 140
    object TabID: TAutoIncField
      DisplayLabel = 'Nº'
      FieldName = 'ID'
    end
    object TabData: TDateTimeField
      FieldName = 'Data'
      DisplayFormat = 'dd/mm/yyyy  hh:mm'
    end
    object TabCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object TabChamada: TIntegerField
      FieldName = 'Chamada'
    end
    object TabProduto: TStringField
      FieldName = 'Produto'
      Size = 15
    end
    object TabDescricao: TMemoField
      FieldName = 'Descricao'
      BlobType = ftMemo
    end
    object TabNomeCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeCliente'
      LookupDataSet = Dados.tbCli
      LookupKeyFields = 'Codigo'
      LookupResultField = 'mostrar'
      KeyFields = 'Cliente'
      Size = 40
      Lookup = True
    end
    object TabNomeProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeProduto'
      LookupDataSet = Dados.tbPro
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Produto'
      Size = 40
      Lookup = True
    end
    object TabSituacao: TStringField
      FieldName = 'Situacao'
      Size = 15
    end
    object TabAcoes: TMemoField
      FieldName = 'Acoes'
      BlobType = ftMemo
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 102
    Top = 140
  end
end
