inherited fbgLog: TfbgLog
  Tag = 8
  Left = 156
  Top = 171
  Width = 634
  Height = 471
  Caption = 'Log do Sistema'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited LMDSimplePanel1: TLMDSimplePanel
    Top = 63
    Width = 626
    Height = 381
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 616
      Height = 5
    end
    inherited panDiv1: TLMDSimplePanel
      Top = 10
      Width = 616
    end
    inherited panPri: TLMDSimplePanel
      Top = 17
      Width = 616
      Height = 359
      inherited LMDSimplePanel2: TLMDSimplePanel
        Width = 614
        Height = 331
        inherited Grid: TdxDBGrid
          Width = 614
          Height = 331
          Bands = <
            item
              Width = 478
            end
            item
              Caption = 'Duração'
              Width = 130
            end
            item
              Width = 303
            end>
          DefaultLayout = False
          KeyField = 'NumSeq'
          DataSource = dsTab
          Filter.Criteria = {00000000}
          OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoUseBookmarks]
          ShowBands = True
          OnFilterChanged = GridFilterChanged
          object GridNumSeq: TdxDBGridMaskColumn
            Alignment = taCenter
            Caption = 'Sequencial'
            HeaderAlignment = taCenter
            Width = 49
            BandIndex = 0
            RowIndex = 0
            DisableGrouping = True
            FieldName = 'NumSeq'
          end
          object GridDiaHora: TdxDBGridDateColumn
            Caption = 'Dia / Hora'
            Width = 72
            BandIndex = 0
            RowIndex = 0
            DisableGrouping = True
            FieldName = 'DiaHora'
          end
          object GridMaquina: TdxDBGridMaskColumn
            Alignment = taCenter
            HeaderAlignment = taCenter
            Width = 46
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Maquina'
          end
          object GridPrograma: TdxDBGridImageColumn
            Alignment = taLeftJustify
            MinWidth = 16
            Width = 57
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Programa'
            Descriptions.Strings = (
              'CMGUARD'
              'CMADMIN'
              'CMSERVER')
            ImageIndexes.Strings = (
              '0'
              '1'
              '2')
            ShowDescription = True
            Values.Strings = (
              '0'
              '1'
              '2')
          end
          object GridOperacao: TdxDBGridMaskColumn
            Width = 303
            BandIndex = 2
            RowIndex = 0
            FieldName = 'Operacao'
          end
          object GridHoras: TdxDBGridTimeColumn
            Alignment = taCenter
            HeaderAlignment = taCenter
            Width = 79
            BandIndex = 1
            RowIndex = 0
            FieldName = 'Horas'
          end
          object GridDias: TdxDBGridSpinColumn
            Alignment = taCenter
            HeaderAlignment = taCenter
            Width = 51
            BandIndex = 1
            RowIndex = 0
            FieldName = 'Dias'
          end
        end
      end
      inherited BarDockControl: TdxBarDockControl
        Width = 614
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
            Item = cmRefresh
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
      63
      0)
    inherited cmSubPeriodo: TdxBarSubItem
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
          Item = cmImprimir
          UserDefine = [udPaintStyle]
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmExportar
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
          Item = cmNovo
          UserGlyph.Data = {00000000}
          Visible = True
        end
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
    inherited cmEditar: TdxBarLargeButton
      Caption = '&Ver Resumo'
      Hint = 'Ver Resumo'
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
        end
        item
          BeginGroup = True
          Item = cmLocalizar
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
        Name = 'NumSeq'
        DataType = ftAutoInc
      end
      item
        Name = 'DiaHora'
        DataType = ftDateTime
      end
      item
        Name = 'Maquina'
        DataType = ftWord
      end
      item
        Name = 'Usuario'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Programa'
        DataType = ftWord
      end
      item
        Name = 'Operacao'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'Horas'
        DataType = ftDateTime
      end
      item
        Name = 'Dias'
        DataType = ftWord
      end>
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'INumSeq'
        Fields = 'Numero'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IDiaHora'
        Fields = 'Abertura'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IUsuarioNumSeq'
        Fields = 'Numero'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IUsuarioDiaHora'
        Fields = 'Usuario;Abertura'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'IDiaHora'
    SessionName = 'SesPad'
    TableName = 'Log'
    Left = 104
    Top = 179
    object TabNumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object TabDiaHora: TDateTimeField
      FieldName = 'DiaHora'
      DisplayFormat = 'dd/mm/yyyy hh:mm:ss'
    end
    object TabMaquina: TWordField
      FieldName = 'Maquina'
    end
    object TabUsuario: TStringField
      FieldName = 'Usuario'
      Size = 30
    end
    object TabPrograma: TWordField
      FieldName = 'Programa'
    end
    object TabOperacao: TStringField
      FieldName = 'Operacao'
      Size = 70
    end
    object TabHoras: TDateTimeField
      FieldName = 'Horas'
      DisplayFormat = 'hh:mm:ss'
    end
    object TabDias: TWordField
      FieldName = 'Dias'
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 144
    Top = 179
  end
end
