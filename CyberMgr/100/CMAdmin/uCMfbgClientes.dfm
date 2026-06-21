inherited fbgClientes: TfbgClientes
  Tag = 4
  Caption = 'Clientes'
  OldCreateOrder = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited LMDSimplePanel1: TLMDSimplePanel
    Top = 67
    Height = 298
    inherited dxBarDockControl1: TdxBarDockControl
      Height = 0
      AllowZeroSizeInDesignTime = True
      SunkenBorder = False
    end
    inherited panDiv1: TLMDSimplePanel
      Top = 5
      Height = 0
    end
    inherited panPri: TLMDSimplePanel
      Top = 5
      Height = 288
      inherited LMDSimplePanel2: TLMDSimplePanel
        Height = 260
        inherited Grid: TdxDBGrid
          Height = 260
          KeyField = 'Codigo'
          DataSource = dsCli
          Filter.Criteria = {00000000}
          OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoUseBookmarks]
          OnFilterChanged = GridFilterChanged
          object GridNome: TdxDBGridMaskColumn
            Width = 222
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Nome'
          end
          object GridCreditoHMS: TdxDBGridColumn
            Alignment = taCenter
            HeaderAlignment = taCenter
            Width = 91
            BandIndex = 0
            RowIndex = 0
            FieldName = 'CreditoHMS'
          end
          object GridTempoTotalHMS: TdxDBGridColumn
            Alignment = taCenter
            HeaderAlignment = taCenter
            Width = 121
            BandIndex = 0
            RowIndex = 0
            FieldName = 'TempoTotalHMS'
          end
          object GridRg: TdxDBGridMaskColumn
            Caption = 'RG'
            Width = 93
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Rg'
          end
          object GridUltVisita: TdxDBGridDateColumn
            Alignment = taCenter
            Caption = 'U. Visita'
            HeaderAlignment = taCenter
            Visible = False
            Width = 75
            BandIndex = 0
            RowIndex = 0
          end
          object GridEndereco: TdxDBGridMaskColumn
            Width = 271
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Endereco'
          end
          object GridBairro: TdxDBGridMaskColumn
            Width = 122
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Bairro'
          end
          object GridCidade: TdxDBGridMaskColumn
            Width = 172
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Cidade'
          end
          object GridUF: TdxDBGridMaskColumn
            Width = 20
            BandIndex = 0
            RowIndex = 0
            FieldName = 'UF'
          end
          object GridCEP: TdxDBGridMaskColumn
            Width = 73
            BandIndex = 0
            RowIndex = 0
            FieldName = 'CEP'
          end
          object GridNasc: TdxDBGridDateColumn
            Width = 112
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Nasc'
          end
          object GridSexo: TdxDBGridMaskColumn
            Width = 45
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Sexo'
          end
          object GridObs: TdxDBGridMemoColumn
            Width = 73
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Obs'
          end
          object Gridemail: TdxDBGridMemoColumn
            Width = 73
            BandIndex = 0
            RowIndex = 0
            FieldName = 'email'
          end
          object GridIsento: TdxDBGridCheckColumn
            Width = 99
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Isento'
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object GridUsername: TdxDBGridMaskColumn
            Width = 222
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Username'
          end
          object GridSenha: TdxDBGridMaskColumn
            Width = 73
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Senha'
          end
          object GridTelefone: TdxDBGridMaskColumn
            Width = 98
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Telefone'
          end
          object GridCodigo: TdxDBGridMaskColumn
            Width = 70
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Codigo'
          end
          object GridDebito: TdxDBGridCurrencyColumn
            Caption = 'Débito'
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Debito'
            Nullable = False
          end
          object GridEscola: TdxDBGridColumn
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Escola'
          end
          object GridNickname: TdxDBGridColumn
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NickName'
          end
          object GridDataNasc: TdxDBGridDateColumn
            Caption = 'Data Nasc.'
            BandIndex = 0
            RowIndex = 0
            FieldName = 'DataNasc'
          end
          object GridCelular: TdxDBGridColumn
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Celular'
          end
        end
      end
      inherited BarDockControl: TdxBarDockControl
        UseOwnSunkenBorder = True
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
            BeginGroup = True
            Item = cmLocalizar
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
            Item = cmTempo
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
    Categories.Strings = (
      'Default'
      'Periodo'
      'Layout'
      'Editar'
      'Exibir'
      'Cliente')
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
    Style = bmsEnhanced
    SunkenBorder = True
    DockControlHeights = (
      0
      0
      67
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
        end>
    end
    inherited cmEditar: TdxBarLargeButton
      Caption = 'Editar'
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
    object cmTempo: TdxBarSubItem
      Caption = '&Crédito'
      Category = 5
      Visible = ivAlways
      Glyph.Data = {
        B6040000424DB604000000000000B60000002800000010000000100000000100
        2000000000000004000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000008080000080800000808000808080000000000000000000000000000000
        0000000000008080800000808000008080000080800000808000008080000080
        80000080800000808000000000000000000080808000FFFFFF0000000000FFFF
        FF00808080000000000000000000008080000080800000808000008080000080
        8000008080000000000000000000FFFFFF00FFFFFF00FFFFFF0080808000FFFF
        FF00FFFFFF00FFFFFF0000000000000000000080800000808000008080000080
        80000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000FFFFFF00000000000000000000808000008080008080
        80000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00808080000000000080808000008080000000
        000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000008080000000
        0000808080000000000080808000FFFFFF00FFFFFF00FFFFFF0000000000FFFF
        FF00FFFFFF00FFFFFF0080808000000000008080800000000000008080000000
        000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000008080008080
        80000000000080808000FFFFFF00FFFFFF0000000000FFFFFF000000FF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00808080000000000080808000008080000080
        80000000000080808000FFFFFF0000000000FFFFFF00FFFFFF000000FF00FFFF
        FF00FFFFFF0000000000FFFFFF00000000000000000000808000008080000080
        8000008080000000000000000000FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
        FF00FFFFFF00FFFFFF0000000000000000000080800000808000008080000080
        80000080800000808000000000000000000080808000FFFFFF000000FF00FFFF
        FF00808080000000000000000000000000000000000000808000008080000080
        8000008080000080800000808000808080000000000000000000000000000000
        0000808080000000000000808000000000008080800000808000008080000080
        8000008080000080800000808000008080000080800000808000000000000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000008080000080800000808000008080000080800000000000000000000000
        0000008080000080800000808000008080000080800000808000}
      ItemLinks = <
        item
          Item = cmCredTempo
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmDebTempo
          Visible = True
        end>
    end
    object cmCredTempo: TdxBarButton
      Caption = '&Creditar Tempo'
      Category = 5
      Hint = 'Creditar Tempo'
      Visible = ivAlways
      Glyph.Data = {
        360C0000424D360C000000000000360800002800000010000000100000000100
        2000000000000004000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00C6848C00C684
        8C00C6848C00C6848C00C6848C00C6848C00C6848C00C6848C00C6848C00C684
        8C00C6848C00C6848C00C6848C00C6848C00C6848C00C6848C00C6848C00C684
        8C00C6848C00C6848C00C6848C00C6848C00A5424A00A5424A00A5424A00A542
        4A00A5424A00C6848C00C6848C00C6848C00C6848C00C6848C00C6848C00C684
        8C00C6848C00C6848C00C6848C00000000000000000000000000000000000000
        0000A5424A00C6848C00C6848C00C6848C00C6848C00C6848C00C6848C00C684
        8C00C6848C00C6848C00C6848C000000000000FFFF0000FFFF0000FFFF000000
        0000A5424A00C6848C00C6848C00C6848C00C6848C00C6848C00C6848C00C684
        8C00C6848C00C6848C00C6848C000000000000FFFF0000FFFF0000FFFF000000
        0000A5424A00C6848C00C6848C00C6848C00C6848C00C6848C00C6848C00C684
        8C00C6848C00C6848C00C6848C000000000000FFFF0000FFFF0000FFFF000000
        0000A5424A00A5424A00A5424A00A5424A00A5424A00C6848C00C6848C000000
        00000000000000000000000000000000000000FFFF0000FFFF0000FFFF000000
        000000000000000000000000000000000000A5424A00C6848C00C6848C000000
        000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
        FF0000FFFF0000FFFF0000FFFF0000000000A5424A00C6848C00C6848C000000
        000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
        FF0000FFFF0000FFFF0000FFFF0000000000A5424A00C6848C00C6848C000000
        000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
        FF0000FFFF0000FFFF0000FFFF0000000000A5424A00C6848C00C6848C000000
        00000000000000000000000000000000000000FFFF0000FFFF0000FFFF000000
        000000000000000000000000000000000000C6848C00C6848C00C6848C00C684
        8C00C6848C00C6848C00C6848C000000000000FFFF0000FFFF0000FFFF000000
        0000C6848C00C6848C00C6848C00C6848C00C6848C00C6848C00C6848C00C684
        8C00C6848C00C6848C00C6848C000000000000FFFF0000FFFF0000FFFF000000
        0000C6848C00C6848C00C6848C00C6848C00C6848C00C6848C00C6848C00C684
        8C00C6848C00C6848C00C6848C000000000000FFFF0000FFFF0000FFFF000000
        0000C6848C00C6848C00C6848C00C6848C00C6848C00C6848C00C6848C00C684
        8C00C6848C00C6848C00C6848C00000000000000000000000000000000000000
        0000C6848C00C6848C00C6848C00C6848C00C6848C00C6848C00C6848C00C684
        8C00C6848C00C6848C00C6848C00C6848C00C6848C00C6848C00C6848C00C684
        8C00C6848C00C6848C00C6848C00C6848C00C6848C00C6848C00}
      OnClick = cmCredTempoClick
    end
    object cmDebTempo: TdxBarButton
      Caption = '&Debitar Tempo'
      Category = 5
      Hint = 'Debitar Tempo'
      Visible = ivAlways
      Glyph.Data = {
        360C0000424D360C000000000000360800002800000010000000100000000100
        2000000000000004000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0
        A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000C0C0C000C0C0C0000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000A4A0A000C0C0C000C0C0C0000000
        000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
        FF0000FFFF0000FFFF0000FFFF0000000000A4A0A000C0C0C000C0C0C0000000
        000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
        FF0000FFFF0000FFFF0000FFFF0000000000A4A0A000C0C0C000C0C0C0000000
        000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
        FF0000FFFF0000FFFF0000FFFF0000000000A4A0A000C0C0C000C0C0C0000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000}
      OnClick = cmDebTempoClick
    end
  end
  inherited pmLocalizar: TdxBarPopupMenu
    ItemLinks = <
      item
        Item = cmColunas
        UserGlyph.Data = {00000000}
        Visible = True
      end>
    Top = 203
  end
  object dsCli: TDataSource
    DataSet = Tab
    Left = 80
    Top = 152
  end
  object Tab: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftAutoInc
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Endereco'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Nasc'
        DataType = ftDateTime
      end
      item
        Name = 'Sexo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Cpf'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Rg'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Telefone'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Email'
        DataType = ftMemo
      end
      item
        Name = 'CreditoM'
        DataType = ftInteger
      end
      item
        Name = 'TempoTotal'
        DataType = ftInteger
      end
      item
        Name = 'TempoInicial'
        DataType = ftInteger
      end
      item
        Name = 'Isento'
        DataType = ftBoolean
      end
      item
        Name = 'Username'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Senha'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'UltVisita'
        DataType = ftDateTime
      end
      item
        Name = 'Debito'
        DataType = ftCurrency
      end
      item
        Name = 'Escola'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NickName'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DataNasc'
        DataType = ftDateTime
      end
      item
        Name = 'Celular'
        DataType = ftString
        Size = 15
      end>
    FilterOptions = [foCaseInsensitive]
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'ICodigo'
        Fields = 'Codigo'
        Options = [ixUnique, ixCaseInsensitive]
      end
      item
        Name = 'INome'
        Fields = 'Nome'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IUsername'
        Fields = 'Username'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'INome'
    SessionName = 'SesPad'
    TableName = 'Contato'
    Timeout = 10000
    OnCalcFields = TabCalcFields
    Left = 40
    Top = 152
    object TabCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object TabNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object TabEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object TabBairro: TStringField
      FieldName = 'Bairro'
    end
    object TabCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object TabUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object TabCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object TabNasc: TDateTimeField
      FieldName = 'Nasc'
    end
    object TabSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object TabObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TabCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object TabRg: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object Tabemail: TMemoField
      FieldName = 'email'
      BlobType = ftMemo
    end
    object TabCreditoM: TIntegerField
      FieldName = 'CreditoM'
    end
    object TabUltVisita: TDateTimeField
      DisplayLabel = 'U. Visita'
      FieldName = 'UltVisita'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object TabIsento: TBooleanField
      FieldName = 'Isento'
      DisplayValues = 'Sim;Não'
    end
    object TabUsername: TStringField
      FieldName = 'Username'
      Size = 40
    end
    object TabSenha: TStringField
      FieldName = 'Senha'
      Size = 10
    end
    object TabTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object TabTempoTotal: TIntegerField
      FieldName = 'TempoTotal'
    end
    object TabCreditoHMS: TStringField
      DisplayLabel = 'Crédito'
      FieldKind = fkCalculated
      FieldName = 'CreditoHMS'
      Size = 12
      Calculated = True
    end
    object TabTempoTotalHMS: TStringField
      DisplayLabel = 'Tempo Acumulado'
      FieldKind = fkCalculated
      FieldName = 'TempoTotalHMS'
      Size = 12
      Calculated = True
    end
    object TabTempoInicial: TIntegerField
      FieldName = 'TempoInicial'
    end
    object TabDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object TabEscola: TStringField
      FieldName = 'Escola'
      Size = 40
    end
    object TabNickName: TStringField
      FieldName = 'NickName'
      Size = 30
    end
    object TabDataNasc: TDateTimeField
      FieldName = 'DataNasc'
    end
    object TabCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
  end
end
