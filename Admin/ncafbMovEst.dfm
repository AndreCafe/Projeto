inherited fbMovEst: TfbMovEst
  Left = 144
  Top = 157
  Caption = 'fbMovEst'
  ClientHeight = 374
  ClientWidth = 697
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  ExplicitWidth = 705
  ExplicitHeight = 401
  PixelsPerInch = 96
  TextHeight = 16
  inherited panPri: TParentedPanel
    Width = 697
    Height = 374
    ExplicitWidth = 697
    ExplicitHeight = 374
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 697
      SunkenBorder = False
      Visible = False
      ExplicitWidth = 697
      ExplicitHeight = 3
    end
    object Grid: TcxGrid
      Left = 0
      Top = 3
      Width = 697
      Height = 343
      Align = alClient
      BorderStyle = cxcbsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      object TV: TcxGridDBTableView
        OnDblClick = TVDblClick
        Navigator.Buttons.CustomButtons = <
          item
          end
          item
          end>
        Navigator.Buttons.First.Visible = False
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Append.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.InfoPanel.Visible = True
        Navigator.InfoPanel.Width = 100
        DataController.DataModeController.GridMode = True
        DataController.DataSource = dsTab
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.KeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0.0'
            Kind = skSum
            Position = spFooter
            Column = TVQuantFator
          end
          item
            Format = '0.0'
            Kind = skSum
            Column = TVQuantFator
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.0'
            Kind = skSum
            Column = TVQuantFator
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
        OptionsSelection.CellSelect = False
        OptionsView.ScrollBars = ssNone
        OptionsView.GridLineColor = 16053492
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        Preview.AutoHeight = False
        Styles.Header = FrmPri.cxStyle11
        OnCustomDrawColumnHeader = TVCustomDrawColumnHeader
        object TVFidResgate: TcxGridDBColumn
          AlternateCaption = 'Resgate de pr'#234'mio fidelidade'
          DataBinding.FieldName = 'FidResgate'
          RepositoryItem = Dados.erFidelidade
          Visible = False
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
          Options.ShowCaption = False
          Width = 23
          IsCaptionAssigned = True
        end
        object TVCaixa: TcxGridDBColumn
          DataBinding.FieldName = 'Caixa'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ImmediatePost = True
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 51
        end
        object TVTran: TcxGridDBColumn
          Caption = 'Transa'#231#227'o'
          DataBinding.FieldName = 'Tran'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ImmediatePost = True
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 68
        end
        object TVDataMov: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'DataHora'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.DateButtons = [btnClear, btnToday]
          Properties.DateOnError = deToday
          Width = 130
        end
        object TVTipoTran: TcxGridDBColumn
          Caption = 'Tipo Transa'#231#227'o'
          DataBinding.FieldName = 'TipoTran'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownRows = 7
          Properties.Items = <
            item
              Description = 'Venda'
              ImageIndex = 1
              Value = 4
            end
            item
              Description = 'Compra'
              ImageIndex = 2
              Value = 5
            end
            item
              Description = 'Entrada de Estoque'
              ImageIndex = 3
              Value = 6
            end
            item
              Description = 'Saida de Estoque'
              ImageIndex = 4
              Value = 7
            end>
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          MinWidth = 16
          Width = 172
        end
        object TVUnitarioFinal: TcxGridDBColumn
          Caption = 'Vl. Unit'#225'rio'
          DataBinding.FieldName = 'Total'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          OnGetDisplayText = TVUnitarioFinalGetDisplayText
          HeaderAlignmentHorz = taCenter
          Width = 115
        end
        object TVTotal: TcxGridDBColumn
          Caption = 'Valor Total'
          DataBinding.FieldName = 'Total'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Properties.Nullable = False
          Properties.ReadOnly = False
          OnGetDisplayText = TVUnitarioFinalGetDisplayText
          HeaderAlignmentHorz = taCenter
          Width = 106
        end
        object TVQuantFator: TcxGridDBColumn
          Caption = 'Quantidade'
          DataBinding.FieldName = 'QuantFator'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Width = 76
        end
        object TVEstoquePost: TcxGridDBColumn
          Caption = 'Estoque'
          DataBinding.FieldName = 'EstoquePost'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Width = 72
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
    object LMDSimplePanel1: TLMDSimplePanel
      Left = 0
      Top = 346
      Width = 697
      Height = 28
      Align = alBottom
      Bevel.Mode = bmCustom
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object lbImprimir: TcxLabel
        AlignWithMargins = True
        Left = 95
        Top = 3
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Imprimir'
        Style.HotTrack = True
        Style.TextColor = clGray
        Style.TextStyle = [fsUnderline]
        StyleFocused.BorderStyle = ebsNone
        StyleFocused.TextColor = clBlue
        StyleHot.BorderStyle = ebsNone
        StyleHot.TextColor = clBlue
        Properties.Alignment.Vert = taVCenter
        OnClick = cmImprimirClick
        AnchorY = 14
      end
      object lbEditarTran: TcxLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Editar Transa'#231#227'o'
        Style.HotTrack = True
        Style.TextColor = clGray
        Style.TextStyle = [fsUnderline]
        StyleFocused.BorderStyle = ebsNone
        StyleFocused.TextColor = clBlue
        StyleHot.BorderStyle = ebsNone
        StyleHot.TextColor = clBlue
        Properties.Alignment.Vert = taVCenter
        OnClick = TVDblClick
        AnchorY = 14
      end
    end
  end
  inherited BarMgr: TdxBarManager
    LookAndFeel.Kind = lfFlat
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      BorderStyle = bbsNone
      Visible = False
    end
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
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
      GlyphLayout = glLeft
      ImageIndex = -1
    end
  end
  inherited CP: TdxComponentPrinter
    Left = 200
    Top = 106
  end
  object Tab: TnxTable
    Database = Dados.db
    FilterOptions = [foCaseInsensitive]
    FlipOrder = True
    OnCalcFields = TabCalcFields
    TableName = 'MovEst'
    IndexName = 'IProduto'
    Left = 145
    Top = 182
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabTran: TIntegerField
      Alignment = taCenter
      FieldName = 'Tran'
    end
    object TabProduto: TIntegerField
      FieldName = 'Produto'
    end
    object TabQuant: TFloatField
      FieldName = 'Quant'
    end
    object TabUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object TabTotal: TCurrencyField
      FieldName = 'Total'
    end
    object TabCustoU: TCurrencyField
      FieldName = 'CustoU'
    end
    object TabItem: TWordField
      FieldName = 'Item'
    end
    object TabDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object TabPago: TCurrencyField
      FieldName = 'Pago'
    end
    object TabDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object TabEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object TabCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object TabEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object TabCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object TabCaixa: TIntegerField
      Alignment = taCenter
      FieldName = 'Caixa'
    end
    object TabCategoria: TStringField
      FieldName = 'Categoria'
    end
    object TabNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object TabITran: TIntegerField
      FieldName = 'ITran'
    end
    object TabTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object TabSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object TabQuantFator: TFloatField
      FieldKind = fkCalculated
      FieldName = 'QuantFator'
      Calculated = True
    end
    object TabEstoquePost: TFloatField
      FieldKind = fkCalculated
      FieldName = 'EstoquePost'
      Calculated = True
    end
    object TabPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object TabDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object TabFidResgate: TBooleanField
      FieldName = 'FidResgate'
    end
    object TabFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 185
    Top = 182
  end
end
