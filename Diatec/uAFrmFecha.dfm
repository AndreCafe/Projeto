object FrmRAF: TFrmRAF
  Left = 291
  Top = 247
  Caption = 'Consolida'#231#245'es de RA'
  ClientHeight = 463
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object panPri: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 688
    Height = 463
    UseDockManager = False
    Align = alClient
    Bevel.Mode = bmCustom
    TabOrder = 0
    object LMDSimplePanel1: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 688
      Height = 34
      UseDockManager = False
      Align = alTop
      Bevel.BorderSides = [fsBottom]
      Bevel.Mode = bmEdge
      TabOrder = 0
      object btnDetalhamentoCli: TLMDSpeedButton
        Left = 564
        Top = 2
        Width = 61
        Height = 30
        Caption = 'Relat'#243'rios'
        OnClick = btnDetalhamentoCliClick
        Align = alLeft
        Style = ubsFlat
      end
      object btnCriar: TLMDSpeedButton
        Left = 2
        Top = 2
        Width = 79
        Height = 30
        Caption = 'Criar'
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          0800000000000001000000000000000000000001000000000000000000000000
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
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
          07070707070707070707070707070707F7F7F7F7F70707070707070707070700
          00000000F70707070707070707070700FBFBFB00F70707070707070707070700
          FBFBFB00F70707070707070707070700FBFBFB00F7F7F7F7F707070000000000
          FBFBFB0000000000F7070700FBFBFBFBFBFBFBFBFBFBFB00F7070700FBFBFBFB
          FBFBFBFBFBFBFB00F7070700FBFBFBFBFBFBFBFBFBFBFB00F707070000000000
          FBFBFB00000000000707070707070700FBFBFB00070707070707070707070700
          FBFBFB00070707070707070707070700FBFBFB00070707070707070707070700
          0000000007070707070707070707070707070707070707070707}
        OnClick = btnCriarClick
        Align = alLeft
        Style = ubsFlat
        ExplicitHeight = 36
      end
      object btnEnviaProtheus: TLMDSpeedButton
        Left = 416
        Top = 2
        Width = 88
        Height = 30
        Caption = 'Enviar Protheus'
        OnClick = btnEnviaProtheusClick
        Align = alLeft
        Style = ubsFlat
        ExplicitHeight = 36
      end
      object btnFecharCli: TLMDSpeedButton
        Left = 244
        Top = 2
        Width = 86
        Height = 30
        Caption = 'Fechar Clientes'
        OnClick = btnFecharCliClick
        Align = alLeft
        Style = ubsFlat
        ExplicitHeight = 36
      end
      object btnFecharTec: TLMDSpeedButton
        Left = 330
        Top = 2
        Width = 86
        Height = 30
        Caption = 'Fechar T'#233'cnicos'
        OnClick = btnFecharTecClick
        Align = alLeft
        Style = ubsFlat
        ExplicitHeight = 36
      end
      object btnAprovTec: TLMDSpeedButton
        Left = 160
        Top = 2
        Width = 84
        Height = 30
        Caption = 'Aprov.T'#233'cnico'
        OnClick = btnAprovTecClick
        Align = alLeft
        Style = ubsFlat
        ExplicitHeight = 36
      end
      object btnAprovCli: TLMDSpeedButton
        Left = 81
        Top = 2
        Width = 79
        Height = 30
        Caption = 'Aprov. Cliente'
        OnClick = btnAprovCliClick
        Align = alLeft
        Style = ubsFlat
        ExplicitHeight = 36
      end
      object btnItens: TLMDSpeedButton
        Left = 504
        Top = 2
        Width = 60
        Height = 30
        Caption = 'Ver Itens'
        OnClick = btnItensClick
        Align = alLeft
        Style = ubsFlat
        ExplicitLeft = 497
        ExplicitTop = 1
      end
    end
    object Grid: TcxGrid
      Left = 0
      Top = 34
      Width = 688
      Height = 429
      Align = alClient
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      object tvGrid: TcxGridDBBandedTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = DM.dsRAF
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.KeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Filtering.ColumnPopupMaxDropDownItemCount = 12
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        Preview.MaxLineCount = 2
        Bands = <
          item
          end
          item
            Caption = 'Per'#237'odo'
          end
          item
            Caption = 'Cliente'
          end
          item
            Caption = 'T'#233'cnico'
          end>
        object tvGridID1: TcxGridDBBandedColumn
          DataBinding.FieldName = 'ID'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 67
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object tvGridDHCriacao1: TcxGridDBBandedColumn
          Caption = 'Criado em'
          DataBinding.FieldName = 'DHCriacao'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DateButtons = [btnClear, btnToday]
          Properties.DateOnError = deToday
          Properties.InputKind = ikRegExpr
          HeaderAlignmentHorz = taCenter
          Width = 116
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object tvGridDHFechaCli1: TcxGridDBBandedColumn
          Caption = 'Fechado em'
          DataBinding.FieldName = 'DHFechaCli'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DateButtons = [btnClear, btnToday]
          Properties.DateOnError = deToday
          Properties.InputKind = ikRegExpr
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object tvGridDHFechaTec1: TcxGridDBBandedColumn
          Caption = 'Fechado em'
          DataBinding.FieldName = 'DHFechaTec'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DateButtons = [btnClear, btnToday]
          Properties.DateOnError = deToday
          Properties.InputKind = ikRegExpr
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 3
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object tvGridDataI1: TcxGridDBBandedColumn
          Caption = 'Inicio'
          DataBinding.FieldName = 'DataI'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DateButtons = [btnClear, btnToday]
          Properties.DateOnError = deToday
          Properties.InputKind = ikRegExpr
          HeaderAlignmentHorz = taCenter
          Width = 96
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object tvGridDataF1: TcxGridDBBandedColumn
          Caption = 'Fim'
          DataBinding.FieldName = 'DataF'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DateButtons = [btnClear, btnToday]
          Properties.DateOnError = deToday
          Properties.InputKind = ikRegExpr
          HeaderAlignmentHorz = taCenter
          Width = 97
          Position.BandIndex = 1
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
      end
      object glGrid: TcxGridLevel
        GridView = tvGrid
      end
    end
  end
end
