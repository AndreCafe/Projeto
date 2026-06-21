object FrmCaixa: TFrmCaixa
  Left = 284
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Caixa de '
  ClientHeight = 418
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 472
    Height = 418
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 4
    object PageControl1: TPageControl
      Left = 5
      Top = 47
      Width = 462
      Height = 366
      ActivePage = tsVendasProd
      Align = alClient
      TabOrder = 0
      object tsVendasTotal: TTabSheet
        BorderWidth = 5
        Caption = 'Totais'
        object Insp: TdxDBInspector
          Left = 0
          Top = 0
          Width = 444
          Height = 328
          Align = alClient
          Color = clSilver
          DataSource = dsTab
          DefaultFields = False
          TabOrder = 0
          DividerPos = 181
          Flat = True
          GridColor = clGray
          Options = [dioAutoWidth, dioBandSizing, dioColumnSizing, dioDynamicColumnSizing, dioEditing, dioEnterThrough, dioNoCancel]
          PaintStyle = ipsExtended
          Data = {
            8D0100000D00000008000000000000000A000000496E73704E756D65726F0800
            0000000000000C000000496E7370416265727475726108000000000000000E00
            0000496E737046656368616D656E746F08000000000000000B000000496E7370
            5573756172696F080000000300000009000000496E7370526F77313608000000
            000000000C000000496E7370496E7465726E657408000000000000000D000000
            496E7370446573636F6E746F73080000000000000009000000496E7370526F77
            313708000000000000000B000000496E73705061636F74657308000000000000
            000A000000496E737056656E64617308000000000000000E000000496E73704C
            616E63457874726173080000000000000009000000496E7370526F7731350800
            00000000000009000000496E7370526F77313408000000000000000C00000049
            6E737053616C646F416E7408000000000000000E000000496E737053616C646F
            46696E616C080000000000000007000000496E73704F62730100000008000000
            34A7A40B09000000496E7370526F773136}
          object InspNumero: TdxInspectorDBMaskRow
            ReadOnly = True
            FieldName = 'Numero'
          end
          object InspAbertura: TdxInspectorDBDateRow
            ReadOnly = True
            FieldName = 'Abertura'
          end
          object InspFechamento: TdxInspectorDBDateRow
            ReadOnly = True
            FieldName = 'Fechamento'
          end
          object InspUsuario: TdxInspectorDBMaskRow
            Caption = 'Usuário'
            ReadOnly = True
            FieldName = 'Usuario'
          end
          object InspLancExtras: TdxInspectorDBCurrencyRow
            Caption = 'Entradas Extras'
            ReadOnly = True
            FieldName = 'LancExtrasE'
          end
          object InspDescontos: TdxInspectorDBCurrencyRow
            Caption = 'Desconto'
            ReadOnly = True
            OnDrawCaption = InspDescontosDrawCaption
            OnDrawValue = InspDescontosDrawValue
            FieldName = 'Descontos'
          end
          object InspInternet: TdxInspectorDBCurrencyRow
            Caption = 'Valor'
            ReadOnly = True
            FieldName = 'AcessoDesc'
          end
          object InspSaldoAnt: TdxInspectorDBCurrencyRow
            Caption = 'Saldo Anterior'
            ReadOnly = True
            FieldName = 'SaldoAnt'
          end
          object InspVendas: TdxInspectorDBCurrencyRow
            Caption = 'Venda de Produtos e Serviços'
            ReadOnly = True
            FieldName = 'Vendas'
          end
          object InspObs: TdxInspectorDBMemoRow
            RowHeight = 51
            FieldName = 'Obs'
          end
          object InspSaldoFinal: TdxInspectorDBRow
            Caption = 'Total Final'
            ReadOnly = True
            RowHeight = 25
            OnDrawCaption = InspSaldoFinalDrawCaption
            OnDrawValue = InspSaldoFinalDrawValue
            FieldName = 'SaldoFinal'
          end
          object InspPacotes: TdxInspectorDBCurrencyRow
            Caption = 'Venda de Pacotes'
            ReadOnly = True
            FieldName = 'Pacotes'
          end
          object InspRow14: TdxInspectorDBCurrencyRow
            Caption = 'Sub-Total'
            RowHeight = 25
            OnDrawCaption = InspSaldoFinalDrawCaption
            OnDrawValue = InspSaldoFinalDrawValue
            FieldName = 'SubTotal'
          end
          object InspRow15: TdxInspectorDBCurrencyRow
            Caption = 'Saídas Extras'
            FieldName = 'LancExtrasS'
          end
          object InspRow16: TdxInspectorDBRow
            Caption = 'Máquinas (Acessos)'
            IsCategory = True
          end
          object InspRow17: TdxInspectorDBCurrencyRow
            Caption = 'Total'
            FieldName = 'Internet'
          end
        end
      end
      object tsVendasProd: TTabSheet
        BorderWidth = 5
        Caption = 'Vendas por Produto'
        ImageIndex = 1
        object gridVP: TdxDBGrid
          Left = 0
          Top = 0
          Width = 444
          Height = 328
          Bands = <
            item
            end>
          DefaultLayout = True
          HeaderPanelRowCount = 1
          KeyField = 'Produto'
          ShowSummaryFooter = True
          SummaryGroups = <>
          SummarySeparator = ', '
          Align = alClient
          TabOrder = 0
          DataSource = dsQVP
          Filter.Criteria = {00000000}
          LookAndFeel = lfFlat
          OptionsDB = [edgoCancelOnExit, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
          OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
          object gridVPDescricao: TdxDBGridMaskColumn
            Caption = 'Produto / Serviço'
            Sorted = csUp
            Width = 272
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Descricao'
          end
          object gridVPQuant: TdxDBGridMaskColumn
            Alignment = taCenter
            HeaderAlignment = taCenter
            Width = 83
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Quant'
          end
          object gridVPTotal: TdxDBGridMaskColumn
            Alignment = taRightJustify
            Caption = 'Valor Total'
            HeaderAlignment = taCenter
            Width = 81
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Total'
            SummaryFooterType = cstSum
            SummaryFooterField = 'Total'
            SummaryFooterFormat = '0.00'
          end
        end
      end
      object TabSheet1: TTabSheet
        BorderWidth = 5
        Caption = 'Vendas por Categoria'
        ImageIndex = 2
        object gridVC: TdxDBGrid
          Left = 0
          Top = 0
          Width = 444
          Height = 328
          Bands = <
            item
            end>
          DefaultLayout = True
          HeaderPanelRowCount = 1
          KeyField = 'Categoria'
          ShowSummaryFooter = True
          SummaryGroups = <>
          SummarySeparator = ', '
          Align = alClient
          TabOrder = 0
          DataSource = dsQVC
          Filter.Criteria = {00000000}
          LookAndFeel = lfFlat
          OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
          OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
          object gridVCCategoria: TdxDBGridMaskColumn
            Sorted = csUp
            Width = 249
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Categoria'
          end
          object gridVCQuant: TdxDBGridMaskColumn
            Alignment = taCenter
            HeaderAlignment = taCenter
            Width = 101
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Quant'
          end
          object gridVCTotal: TdxDBGridMaskColumn
            HeaderAlignment = taCenter
            Width = 86
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Total'
            SummaryFooterType = cstSum
            SummaryFooterField = 'Total'
            SummaryFooterFormat = '0.00'
          end
        end
      end
    end
    object dxBarDockControl1: TdxBarDockControl
      Left = 5
      Top = 5
      Width = 462
      Height = 35
      Align = dalTop
      BarManager = BarMgr
      SunkenBorder = True
      UseOwnSunkenBorder = True
    end
    object Panel2: TPanel
      Left = 5
      Top = 40
      Width = 462
      Height = 7
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
  object BarMgr: TdxBarManager
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Controles'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 67
        FloatTop = 344
        FloatClientWidth = 69
        FloatClientHeight = 44
        IsMainMenu = True
        ItemLinks = <
          item
            Item = cmGravar
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmCancela
            Visible = True
          end>
        MultiLine = True
        Name = 'Controles'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        SizeGrip = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 136
    Top = 200
    DockControlHeights = (
      0
      0
      0
      0)
    object cmGravar: TdxBarLargeButton
      Caption = '&Fechar Caixa'
      Category = 0
      Hint = 'Fechar Caixa'
      Visible = ivAlways
      OnClick = cmGravarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeGlyph.Data = {
        0A0B0000424D0A0B000000000000360400002800000013000000170000000100
        200000000000D4060000000000000000000000010000000000001C3404002434
        1C00242424001C3C0400243C0C00244404002C5C04003C5C240044543C005C5C
        54005C5C5C00646464006C6C6C0054743C007474740044840400747C74007C7C
        7C0084848400449404006C8C540054AC0400000000008C8C8C008C948C009494
        94009C9C9C00A4A4A400ACACAC00B4B4B4006CD404006CDC040074F404007CFC
        040084FC0C0084FC14007CDC24008CFC1C008CFC240094FC240094EC3C0094FC
        2C009CFC3C0094D45C009CF44C009CFC4400A4FC4C00A4FC5400ACFC6400B4FC
        6C00B4F47400BCF48400BCFC7C00B4C4A400ACCC9400BCCCAC00BCC4B400BCCC
        B400B4E48C00BCE49400BCDCA400C4F49400C4FC8C00C0C0C000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000949494008C8C8C008C8C8C009494
        9400C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008C8C8C008484
        84007C7C7C007C7C7C008484840094949400C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C0009494940084848400747474006C6C6C006C6C6C007474740084848400C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C00084848400747474006C6C6C00646464006464
        64006C6C6C007C7C7C008C8C8C00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008C8C8C007C7C7C006C6C
        6C00646464005C5C5C005C5C5C00646464007474740084848400C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000848484006C8C54003C5C24002424240024341C0064646400646464006C6C
        6C007C7C7C008C8C8C00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C0008C948C006CD404006CD40400448404001C3C
        0400747C74006C6C6C006C6C6C00747474008484840094949400C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0007CDC240084FC
        0C0084FC14006CDC04002C5C040044543C006C6C6C006C6C6C006C6C6C007C7C
        7C008C8C8C00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C00094D45C007CFC040084FC0C0084FC140084FC0C0044940400244404008C8C
        8C006C6C6C006C6C6C00747474007C7C7C008C8C8C00C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000B4C4A4007CFC040084FC0C0084FC140084FC140084FC
        14006CD404002C5C04005C5C5400747474006C6C6C006C6C6C00747474008484
        840094949400C0C0C000C0C0C000C0C0C000C0C0C00094D45C0084FC0C0084FC
        140094FC240094FC24008CFC240084FC0C0044940400243C0C008C948C007474
        74006C6C6C006C6C6C007474740084848400C0C0C000C0C0C000C0C0C000C0C0
        C00094FC2C008CFC24008CFC1C009CFC3C00A4FC5400A4FC54008CFC24006CDC
        04002C5C040044543C007C7C7C00747474006C6C6C00747474007C7C7C008C8C
        8C00C0C0C000C0C0C000BCC4B400ACFC64009CFC440084FC14009CF44C00BCCC
        B400BCF48400A4FC4C0084FC140054AC04001C3C04007C7C7C007C7C7C007474
        74006C6C6C00747474007C7C7C008C8C8C00C0C0C000C0C0C000BCCCB400A4FC
        4C0094EC3C00BCC4B400C0C0C000BCCCAC00B4FC6C009CFC3C0084FC0C004484
        040024341C008C8C8C007C7C7C00747474007474740074747400848484009494
        9400C0C0C000C0C0C000BCCCAC00C0C0C000C0C0C000C0C0C000C0C0C000B4E4
        8C00ACFC64008CFC24006CD404002C5C04005C5C54008C8C8C007C7C7C007474
        7400747474007C7C7C008C8C8C00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000B4F47400A4FC4C0084FC140054AC04001C3C
        04006C6C6C008C8C8C00848484007C7C7C00848484008C8C8C00C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000BCCCAC00BCFC
        7C009CFC440084FC1400449404001C3404008C948C00949494008C8C8C008C8C
        8C0094949400C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000BCE49400BCFC7C00A4FC4C0084FC1400449404001C34
        040094949400C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000BCDCA400BCF4
        8400ACFC640084FC14004484040024341C00B4B4B400C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000BCCCB400C4FC8C00B4FC6C008CFC1C00448404005474
        3C00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000BCC4B400C4F4
        9400B4FC6C0084FC140074F40400B4C4A400C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000BCDCA4009CFC3C0084FC1400ACCC9400C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000BCCCAC00C0C0C000C0C0C000}
    end
    object cmCancela: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      OnClick = cmCancelaClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeGlyph.Data = {
        FA040000424DFA04000000000000760000002800000011000000110000000100
        2000000000008404000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000808080008080800080808000808080008080
        800080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C00080808000808080008000800080008000800080008000
        800080008000800080008080800080808000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C00080808000800080008000800080008000FF00FF00FF00
        FF00FF00FF00FF00FF0080008000800080008000800080808000C0C0C000C0C0
        C000C0C0C000C0C0C000FF00FF008000800080008000FF00FF00FF00FF00C0C0
        C000C0C0C000C0C0C000C0C0C000800080008000800080008000800080008080
        8000C0C0C000C0C0C000C0C0C000FF00FF008000800080008000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000808080008000800080008000800080008000
        800080808000C0C0C000C0C0C000FF00FF00800080008000800080808000C0C0
        C000C0C0C000C0C0C000C0C0C00080808000800080008000800080008000FF00
        FF00800080008000800080808000C0C0C000FF00FF008000800080808000C0C0
        C000C0C0C000C0C0C000C0C0C00080808000800080008000800080008000FF00
        FF00C0C0C000FF00FF008000800080808000C0C0C000FF00FF00800080008080
        8000C0C0C000C0C0C000C0C0C00080808000800080008000800080008000FF00
        FF00C0C0C000C0C0C000FF00FF008000800080808000C0C0C000FF00FF008000
        800080808000C0C0C000C0C0C00080808000800080008000800080008000FF00
        FF00C0C0C000C0C0C000C0C0C000FF00FF008000800080808000C0C0C000FF00
        FF008000800080808000C0C0C00080808000800080008000800080008000FF00
        FF00C0C0C000C0C0C000C0C0C000C0C0C000FF00FF008000800080808000C0C0
        C000FF00FF00800080008000800080808000800080008000800080008000FF00
        FF00C0C0C000C0C0C000C0C0C000C0C0C000FF00FF0080008000800080008080
        8000C0C0C000C0C0C000FF00FF0080008000800080008000800080008000FF00
        FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FF00FF00800080008080
        8000C0C0C000C0C0C000C0C0C000FF00FF008000800080008000800080008080
        8000C0C0C000C0C0C000C0C0C000C0C0C0008080800080008000800080008000
        800080808000C0C0C000C0C0C000C0C0C000C0C0C000FF00FF00800080008000
        8000800080008080800080808000808080008080800080008000800080008000
        800080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FF00
        FF00FF00FF00800080008000800080008000800080008000800080008000FF00
        FF00FF00FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000}
    end
  end
  object Tab: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = -1
    FieldDefs = <
      item
        Name = 'Dia'
        DataType = ftDateTime
      end
      item
        Name = 'Caixa'
        DataType = ftInteger
      end
      item
        Name = 'Usuario'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Entrada'
        DataType = ftBoolean
      end
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '4.04'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    OnCalcFields = TabCalcFields
    Left = 200
    Top = 128
    object TabNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object TabAbertura: TDateTimeField
      FieldName = 'Abertura'
    end
    object TabFechamento: TDateTimeField
      FieldName = 'Fechamento'
    end
    object TabUsuario: TStringField
      FieldName = 'Usuario'
      Size = 10
    end
    object TabDescontos: TCurrencyField
      FieldName = 'Descontos'
    end
    object TabInternet: TCurrencyField
      FieldName = 'Internet'
    end
    object TabSaldoAnt: TCurrencyField
      FieldName = 'SaldoAnt'
    end
    object TabAberto: TBooleanField
      FieldName = 'Aberto'
    end
    object TabVendas: TCurrencyField
      FieldName = 'Vendas'
    end
    object TabObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TabSaldoFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SaldoFinal'
      Calculated = True
    end
    object TabPacotes: TCurrencyField
      FieldName = 'Pacotes'
    end
    object TabSubTotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SubTotal'
      Calculated = True
    end
    object TabLancExtrasE: TCurrencyField
      FieldName = 'LancExtrasE'
    end
    object TabLancExtrasS: TCurrencyField
      FieldName = 'LancExtrasS'
    end
    object TabAcessoDesc: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'AcessoDesc'
      Calculated = True
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 144
    Top = 106
  end
  object dsQVP: TDataSource
    DataSet = qVP
    Left = 153
    Top = 239
  end
  object qVP: TffQuery
    DatabaseName = 'DB'
    FilterOptions = [foCaseInsensitive]
    SessionName = 'SesPad'
    SQL.Strings = (
      
        'select P.Descricao, I.Produto, Sum(I.Total) Total, Sum(I.Quant) ' +
        'Quant  from itensme I, Produto P'
      
        '  WHERE (Upper(P.Codigo)=Upper(I.Produto)) and (I.Caixa=:NumCaix' +
        'a) and (I.Cancelado=False) and '
      '(I.MovEst=True) and '
      '(I.Entrada=False) and'
      '((I.TipoMov='#39'VENDA'#39') or (I.TipoMov='#39'VENDAAC'#39'))'
      '  GROUP BY I.Produto, P.Descricao'
      ''
      '')
    Timeout = 30000
    Left = 249
    Top = 223
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NumCaixa'
        ParamType = ptUnknown
        Value = '278'
      end>
  end
  object qVC: TffQuery
    DatabaseName = 'DB'
    FilterOptions = [foCaseInsensitive]
    SessionName = 'SesPad'
    SQL.Strings = (
      
        'select P.Categoria, Sum(I.Total) Total, Sum(I.Quant) Quant  from' +
        ' itensme I, Produto P'
      
        '  WHERE (Upper(P.Codigo)=Upper(I.Produto)) and (I.Caixa=:NumCaix' +
        'a) and (I.Cancelado=False) and '
      '(I.MovEst=True) and '
      '(I.Entrada=False) and '
      '((I.TipoMov='#39'VENDA'#39') or (I.TipoMov='#39'VENDAAC'#39'))'
      '  GROUP BY Categoria'
      ''
      '')
    Timeout = 60000
    Left = 321
    Top = 223
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NumCaixa'
        ParamType = ptUnknown
        Value = '278'
      end>
  end
  object dsQVC: TDataSource
    DataSet = qVC
    Left = 366
    Top = 228
  end
end
