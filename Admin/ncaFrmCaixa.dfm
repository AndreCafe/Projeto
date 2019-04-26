object FrmCaixa: TFrmCaixa
  Left = 89
  Top = 116
  Caption = 'Caixa de '
  ClientHeight = 558
  ClientWidth = 914
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
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
    Width = 914
    Height = 558
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 2
    object dxBarDockControl1: TdxBarDockControl
      Left = 5
      Top = 5
      Width = 904
      Height = 44
      Align = dalTop
      BarManager = BarMgr
      SunkenBorder = True
      UseOwnSunkenBorder = True
    end
    object Panel2: TPanel
      Left = 5
      Top = 83
      Width = 904
      Height = 3
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
    end
    object panAguarde: TLMDSimplePanel
      Left = 5
      Top = 49
      Width = 904
      Height = 34
      Align = alTop
      Bevel.StyleInner = bvNormal
      Bevel.StyleOuter = bvNormal
      Bevel.BorderColor = clGray
      Bevel.BorderInnerWidth = 3
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      Color = clGray
      TabOrder = 2
      object LMDLabel5: TLMDLabel
        Left = 3
        Top = 3
        Width = 898
        Height = 28
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        Align = alClient
        Alignment = agCenter
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Options = []
        ParentFont = False
        Caption = 'Totalizando caixa. Por favor aguarde alguns instantes ...'
        ExplicitWidth = 795
        ExplicitHeight = 25
      end
    end
    object Paginas: TcxPageControl
      Left = 5
      Top = 86
      Width = 904
      Height = 467
      Align = alClient
      TabOrder = 3
      Visible = False
      Properties.ActivePage = tsResumo
      Properties.CustomButtons.Buttons = <>
      Properties.HotTrack = True
      Properties.Style = 3
      LookAndFeel.NativeStyle = False
      ClientRectBottom = 467
      ClientRectRight = 904
      ClientRectTop = 23
      object tsResumo: TcxTabSheet
        Caption = 'Resumo Financeiro'
        ImageIndex = 0
        object gridRes: TcxGrid
          Left = 0
          Top = 8
          Width = 904
          Height = 228
          Align = alTop
          TabOrder = 0
          LookAndFeel.Kind = lfStandard
          LookAndFeel.NativeStyle = False
          object tvRes: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dmCaixa.dsTot
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnFiltering = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.GroupByBox = False
            object tvResDescricao: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'Descricao'
              OnCustomDrawCell = tvResDescricaoCustomDrawCell
              Width = 164
            end
            object tvResFaturamento: TcxGridDBColumn
              DataBinding.FieldName = 'Faturamento'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              OnCustomDrawCell = tvResFaturamentoCustomDrawCell
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvResDebitado: TcxGridDBColumn
              DataBinding.FieldName = 'Debitado'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvResRecebido: TcxGridDBColumn
              DataBinding.FieldName = 'Recebido'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvResPgDebito: TcxGridDBColumn
              Caption = 'D'#233'bitos Pagos'
              DataBinding.FieldName = 'PgDebito'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvResTotal: TcxGridDBColumn
              DataBinding.FieldName = 'Total'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              OnCustomDrawCell = tvResTotalCustomDrawCell
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvResItem: TcxGridDBColumn
              DataBinding.FieldName = 'Item'
              Visible = False
            end
          end
          object tvTeste: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
          end
          object glResumo: TcxGridLevel
            GridView = tvRes
          end
        end
        object VG: TcxDBVerticalGrid
          Left = 0
          Top = 241
          Width = 904
          Height = 146
          Align = alTop
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = True
          OptionsView.PaintStyle = psDelphi
          OptionsView.RowHeaderWidth = 147
          OptionsBehavior.AllowChangeRecord = False
          Navigator.Buttons.CustomButtons = <>
          Styles.Content = cxStyle32
          TabOrder = 1
          DataController.DataSource = dsCaixa
          DataController.GridMode = True
          Version = 1
          object VGDBEditorRow1: TcxDBEditorRow
            Options.TabStop = False
            Properties.Caption = 'N'#250'mero deste caixa'
            Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
            Properties.EditProperties.ReadOnly = True
            Properties.DataBinding.FieldName = 'ID'
            ID = 0
            ParentID = -1
            Index = 0
            Version = 1
          end
          object VGDBEditorRow2: TcxDBEditorRow
            Options.TabStop = False
            Properties.Caption = 'Data/Hora de Abertura'
            Properties.EditPropertiesClassName = 'TcxDateEditProperties'
            Properties.EditProperties.ReadOnly = True
            Properties.DataBinding.FieldName = 'Abertura'
            Properties.Options.Editing = False
            ID = 1
            ParentID = -1
            Index = 1
            Version = 1
          end
          object VGFechamento: TcxDBEditorRow
            Options.TabStop = False
            Properties.Caption = 'Data/Hora de Fechamento'
            Properties.EditPropertiesClassName = 'TcxDateEditProperties'
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.ReadOnly = True
            Properties.DataBinding.FieldName = 'Fechamento'
            Properties.Options.Editing = False
            ID = 2
            ParentID = -1
            Index = 2
            Version = 1
          end
          object VGDBEditorRow4: TcxDBEditorRow
            Options.TabStop = False
            Properties.Caption = 'Usu'#225'rio respons'#225'vel'
            Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
            Properties.EditProperties.ReadOnly = True
            Properties.DataBinding.FieldName = 'Usuario'
            ID = 3
            ParentID = -1
            Index = 3
            Version = 1
          end
          object vgObs: TcxDBEditorRow
            Height = 70
            Properties.Caption = 'Observa'#231#245'es'
            Properties.EditPropertiesClassName = 'TcxMemoProperties'
            Properties.DataBinding.FieldName = 'Obs'
            ID = 4
            ParentID = -1
            Index = 4
            Version = 1
          end
        end
        object LMDSimplePanel1: TLMDSimplePanel
          Left = 0
          Top = 236
          Width = 904
          Height = 5
          Align = alTop
          Bevel.Mode = bmCustom
          TabOrder = 2
        end
        object LMDSimplePanel9: TLMDSimplePanel
          Left = 0
          Top = 0
          Width = 904
          Height = 8
          Align = alTop
          Bevel.Mode = bmCustom
          TabOrder = 3
        end
      end
      object tsVendas: TcxTabSheet
        Caption = 'Vendas / Movimenta'#231#227'o de Produtos'
        ImageIndex = 3
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object gridEst: TcxGrid
          Left = 0
          Top = 8
          Width = 904
          Height = 436
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfStandard
          LookAndFeel.NativeStyle = False
          object tvEst: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dmCaixa.dsEst
            DataController.Filter.MaxValueListCount = 1000
            DataController.KeyFieldNames = 'ID'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '0.00'
                Kind = skSum
                FieldName = 'ValorVendas'
                Column = tvEstValorVendas1
              end
              item
                Format = '0.00'
                Kind = skSum
                FieldName = 'Lucro'
                Column = tvEstLucro
              end>
            DataController.Summary.SummaryGroups = <>
            Filtering.ColumnPopup.MaxDropDownItemCount = 12
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.InvertSelect = False
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.GroupFooters = gfVisibleWhenExpanded
            Preview.AutoHeight = False
            Preview.MaxLineCount = 2
            Styles.Content = cxStyle27
            Styles.Footer = cxStyle29
            Styles.Header = cxStyle28
            Styles.Indicator = cxStyle28
            Styles.Preview = cxStyle30
            object tvEstDescricao1: TcxGridDBColumn
              Caption = 'Produto'
              DataBinding.FieldName = 'Descricao'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.MaxLength = 40
              Properties.ReadOnly = False
              Options.Filtering = False
              Width = 165
            end
            object tvEstSaldoInicial1: TcxGridDBColumn
              Caption = 'Saldo Inicial'
              DataBinding.FieldName = 'SaldoInicial'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.MaxLength = 0
              Properties.ReadOnly = False
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 69
            end
            object tvEstEntradas1: TcxGridDBColumn
              DataBinding.FieldName = 'Entradas'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.MaxLength = 0
              Properties.ReadOnly = False
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 70
            end
            object tvEstCompras1: TcxGridDBColumn
              DataBinding.FieldName = 'Compras'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.MaxLength = 0
              Properties.ReadOnly = False
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 65
            end
            object tvEstSaidas1: TcxGridDBColumn
              DataBinding.FieldName = 'Saidas'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.MaxLength = 0
              Properties.ReadOnly = False
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 68
            end
            object tvEstPremioFid: TcxGridDBColumn
              Caption = 'Pr'#234'mio'
              DataBinding.FieldName = 'FidResg'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taRightJustify
              HeaderAlignmentHorz = taCenter
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
            end
            object tvEstVendas1: TcxGridDBColumn
              DataBinding.FieldName = 'Vendas'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.MaxLength = 0
              Properties.ReadOnly = False
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Styles.Content = cxStyle31
              Width = 70
            end
            object tvEstValorVendas1: TcxGridDBColumn
              Caption = 'Valor Vendas'
              DataBinding.FieldName = 'ValorVendas'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.AssignedValues.MaxValue = True
              Properties.AssignedValues.MinValue = True
              Properties.Nullable = False
              Properties.ReadOnly = False
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Styles.Content = cxStyle32
              Width = 76
            end
            object tvEstLucro: TcxGridDBColumn
              DataBinding.FieldName = 'Lucro'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.Moving = False
              Options.Sorting = False
              Width = 68
            end
            object tvEstSaldoFinal1: TcxGridDBColumn
              Caption = 'Saldo Final'
              DataBinding.FieldName = 'SaldoFinal'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.MaxLength = 0
              Properties.ReadOnly = False
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
            end
          end
          object glEst: TcxGridLevel
            GridView = tvEst
          end
        end
        object LMDSimplePanel3: TLMDSimplePanel
          Left = 0
          Top = 0
          Width = 904
          Height = 8
          Align = alTop
          Bevel.Mode = bmCustom
          TabOrder = 1
        end
      end
      object tsVC: TcxTabSheet
        Caption = 'Vendas por Categoria'
        ImageIndex = 4
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object gridVC: TcxGrid
          Left = 0
          Top = 8
          Width = 904
          Height = 436
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfStandard
          LookAndFeel.NativeStyle = False
          object tvVC: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dmCaixa.dsQVC
            DataController.Filter.MaxValueListCount = 1000
            DataController.KeyFieldNames = 'Categoria'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '0.00'
                Kind = skSum
                FieldName = 'TotFinal'
                Column = tvVCTotFinal1
              end>
            DataController.Summary.SummaryGroups = <>
            Filtering.ColumnPopup.MaxDropDownItemCount = 12
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.InvertSelect = False
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.GroupFooters = gfVisibleWhenExpanded
            Preview.AutoHeight = False
            Preview.MaxLineCount = 2
            Styles.Content = cxStyle33
            Styles.Footer = cxStyle35
            Styles.Header = cxStyle34
            Styles.Indicator = cxStyle34
            Styles.Preview = cxStyle36
            object tvVCCategoria1: TcxGridDBColumn
              DataBinding.FieldName = 'Categoria'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.MaxLength = 20
              Properties.ReadOnly = True
              Options.Filtering = False
              SortIndex = 0
              SortOrder = soAscending
              Width = 249
            end
            object tvVCQuant1: TcxGridDBColumn
              DataBinding.FieldName = 'Quant'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.MaxLength = 0
              Properties.ReadOnly = True
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 101
            end
            object tvVCTotFinal1: TcxGridDBColumn
              Caption = 'Total'
              DataBinding.FieldName = 'TotFinal'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.MaxLength = 0
              Properties.ReadOnly = True
              HeaderAlignmentHorz = taRightJustify
              Options.Filtering = False
              Width = 91
            end
          end
          object glVC: TcxGridLevel
            GridView = tvVC
          end
        end
        object LMDSimplePanel7: TLMDSimplePanel
          Left = 0
          Top = 0
          Width = 904
          Height = 8
          Align = alTop
          Bevel.Mode = bmCustom
          TabOrder = 1
        end
      end
      object tsImp: TcxTabSheet
        Caption = 'Impress'#245'es'
        ImageIndex = 4
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object gridImp: TcxGrid
          Left = 0
          Top = 8
          Width = 904
          Height = 436
          Align = alClient
          BevelEdges = [beLeft, beRight, beBottom]
          TabOrder = 0
          LookAndFeel.Kind = lfStandard
          LookAndFeel.NativeStyle = False
          object tvImp: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dmCaixa.dsImp
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnFiltering = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.GroupByBox = False
            Styles.Background = cxStyle38
            object tvImpNomeTipoImp: TcxGridDBColumn
              Caption = 'Tipo'
              DataBinding.FieldName = 'NomeTipoImp'
            end
            object tvImpQuant: TcxGridDBColumn
              Caption = 'P'#225'ginas'
              DataBinding.FieldName = 'Quant'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taCenter
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 81
            end
            object tvImpValor: TcxGridDBColumn
              DataBinding.FieldName = 'Valor'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
            end
          end
          object glImp: TcxGridLevel
            GridView = tvImp
          end
        end
        object LMDSimplePanel8: TLMDSimplePanel
          Left = 0
          Top = 0
          Width = 904
          Height = 8
          Align = alTop
          Bevel.Mode = bmCustom
          TabOrder = 1
        end
      end
      object cxTabSheet3: TcxTabSheet
        Caption = 'Sess'#245'es'
        ImageIndex = 5
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object gridSessoes: TcxGrid
          Left = 0
          Top = 8
          Width = 904
          Height = 436
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfStandard
          object TVSessoes: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            Navigator.Buttons.Insert.Visible = False
            Navigator.Buttons.Append.Visible = False
            Navigator.Buttons.Delete.Visible = False
            Navigator.Buttons.Edit.Visible = False
            Navigator.Buttons.Post.Visible = False
            Navigator.Buttons.Cancel.Visible = False
            Navigator.Buttons.Filter.Visible = False
            Navigator.Visible = True
            DataController.DataModeController.GridMode = True
            DataController.DataSource = dmCaixa.dsSessao
            DataController.KeyFieldNames = 'ID'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.CellAutoHeight = True
            object TVSessoesInicio: TcxGridDBColumn
              DataBinding.FieldName = 'Inicio'
              PropertiesClassName = 'TcxDateEditProperties'
              OnGetDisplayText = TVSessoesInicioGetDisplayText
            end
            object TVSessoesTermino: TcxGridDBColumn
              DataBinding.FieldName = 'Termino'
              PropertiesClassName = 'TcxDateEditProperties'
              OnGetDisplayText = TVSessoesInicioGetDisplayText
            end
            object TVSessoesMinutosR: TcxGridDBColumn
              Caption = 'Tempo'
              DataBinding.FieldName = 'MinutosR'
              PropertiesClassName = 'TcxMaskEditProperties'
              OnGetDisplayText = TVSessoesMinutosRGetDisplayText
              HeaderAlignmentHorz = taCenter
              Width = 63
            end
            object TVSessoesMaq: TcxGridDBColumn
              DataBinding.FieldName = 'Maq'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 37
            end
            object TVSessoesNomeCliente: TcxGridDBColumn
              Caption = 'Nome do Cliente'
              DataBinding.FieldName = 'NomeCliente'
              Width = 171
            end
            object TVSessoesTipoCli: TcxGridDBColumn
              Caption = 'Tipo Cliente'
              DataBinding.FieldName = 'TipoCli'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <
                item
                  Description = 'Normal'
                  ImageIndex = 0
                  Value = 0
                end
                item
                  Description = 'Gr'#225'tis'
                  Value = 1
                end
                item
                  Description = 'Funcion'#225'rio'
                  Value = 2
                end>
            end
            object TVSessoesEndereco: TcxGridDBColumn
              Caption = 'Endere'#231'o'
              DataBinding.FieldName = 'Endereco'
              Width = 171
            end
            object TVSessoesBairro: TcxGridDBColumn
              DataBinding.FieldName = 'Bairro'
            end
            object TVSessoesCidade: TcxGridDBColumn
              DataBinding.FieldName = 'Cidade'
              Width = 104
            end
            object TVSessoesUF: TcxGridDBColumn
              DataBinding.FieldName = 'UF'
              Width = 30
            end
            object TVSessoesCEP: TcxGridDBColumn
              DataBinding.FieldName = 'CEP'
            end
            object TVIPs: TcxGridDBColumn
              Caption = 'IP da M'#225'q. Cliente'
              DataBinding.FieldName = 'IPs'
              PropertiesClassName = 'TcxMemoProperties'
              Width = 139
            end
            object TVSessoesDataNasc: TcxGridDBColumn
              Caption = 'Data Nasc.'
              DataBinding.FieldName = 'DataNasc'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 83
            end
            object TVSessoesCelular: TcxGridDBColumn
              DataBinding.FieldName = 'Celular'
            end
            object TVSessoesCpf: TcxGridDBColumn
              DataBinding.FieldName = 'Cpf'
            end
            object TVSessoesRg: TcxGridDBColumn
              DataBinding.FieldName = 'Rg'
            end
            object TVSessoesTelefone: TcxGridDBColumn
              DataBinding.FieldName = 'Telefone'
            end
            object TVSessoesFuncI: TcxGridDBColumn
              DataBinding.FieldName = 'FuncI'
              Visible = False
            end
            object TVSessoesFuncF: TcxGridDBColumn
              DataBinding.FieldName = 'FuncF'
              Visible = False
            end
            object TVSessoesCaixaI: TcxGridDBColumn
              DataBinding.FieldName = 'CaixaI'
              Visible = False
            end
            object TVSessoesCaixaF: TcxGridDBColumn
              DataBinding.FieldName = 'CaixaF'
              Visible = False
            end
            object TVSessoesTranI: TcxGridDBColumn
              DataBinding.FieldName = 'TranI'
              Visible = False
            end
            object TVSessoesTranF: TcxGridDBColumn
              DataBinding.FieldName = 'TranF'
              Visible = False
            end
            object TVSessoesEmail: TcxGridDBColumn
              DataBinding.FieldName = 'Email'
              Width = 161
            end
            object TVSessoesUsername: TcxGridDBColumn
            end
          end
          object glSessoes: TcxGridLevel
            GridView = TVSessoes
          end
        end
        object LMDSimplePanel10: TLMDSimplePanel
          Left = 0
          Top = 0
          Width = 904
          Height = 8
          Align = alTop
          Bevel.Mode = bmCustom
          TabOrder = 1
        end
      end
      object tsPrePos: TcxTabSheet
        Caption = 'Pr'#233'/P'#243's-Pago'
        ImageIndex = 6
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object gridPrePos: TcxGrid
          Left = 0
          Top = 0
          Width = 904
          Height = 444
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfStandard
          object TVPrePos: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dmCaixa.dsPrePos
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '0.00'
                Kind = skSum
                Column = TVPrePosValor
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object TVPrePosTipo: TcxGridDBColumn
              DataBinding.FieldName = 'Tipo'
            end
            object TVPrePosQuant: TcxGridDBColumn
              DataBinding.FieldName = 'Quant'
              HeaderAlignmentHorz = taCenter
            end
            object TVPrePosValor: TcxGridDBColumn
              DataBinding.FieldName = 'Valor'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 99
            end
          end
          object glPrePos: TcxGridLevel
            GridView = TVPrePos
          end
        end
      end
    end
  end
  object BarMgr: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = dmImagens.im32
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 271
    Top = 255
    DockControlHeights = (
      0
      0
      0
      0)
    object BarMgrBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Controles'
      CaptionButtons = <>
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
          UserDefine = [udWidth]
          UserWidth = 78
          Visible = True
          ItemName = 'edDataI'
        end
        item
          UserDefine = [udWidth]
          UserWidth = 79
          Visible = True
          ItemName = 'edDataF'
        end
        item
          Visible = True
          ItemName = 'btnTotalizar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmImprimir'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmCancela'
        end>
      MultiLine = True
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Controles'
      OneOnRow = True
      Row = 0
      SizeGrip = False
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object cmCancela: TdxBarLargeButton
      Align = iaRight
      Caption = '&Sair'
      Category = 0
      Hint = 'Sair'
      Visible = ivAlways
      LargeImageIndex = 45
      OnClick = cmCancelaClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmImprimir: TdxBarLargeButton
      Caption = '&Imprimir'
      Category = 0
      Hint = 'Imprimir'
      Visible = ivAlways
      LargeImageIndex = 7
      OnClick = cmImprimirClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object edDataI: TdxBarDateCombo
      Caption = 'Totalizar per'#237'odo: De'
      Category = 0
      Hint = 'Totalizar per'#237'odo: De'
      Visible = ivNever
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD00000000000DDDDD0FFFFFFFFF0D00000F0000000F0D0FFF0FFFFFFF
        FF0D0F000FFF11FFFF0D0FFF0FFF11FFFF0D0FF10FFFF11FFF0D0FF10FFFFF11
        FF0D0FF10FF11111FF0D0FF10FFFFFFFFF0D0FF104444444440D0FFF04444444
        440D044400000000000D04444444440DDDDD00000000000DDDDD}
      ShowCaption = True
      ShowDayText = False
    end
    object edDataF: TdxBarDateCombo
      Caption = 'A'
      Category = 0
      Hint = 'A'
      Visible = ivNever
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD00000000000DDDDD0FFFFFFFFF0D00000F0000000F0D0FFF0FFFFFFF
        FF0D0F000FFF11FFFF0D0FFF0FFF11FFFF0D0FF10FFFF11FFF0D0FF10FFFFF11
        FF0D0FF10FF11111FF0D0FF10FFFFFFFFF0D0FF104444444440D0FFF04444444
        440D044400000000000D04444444440DDDDD00000000000DDDDD}
      ShowCaption = True
      ShowDayText = False
    end
    object btnTotalizar: TdxBarLargeButton
      Caption = 'Totalizar'
      Category = 0
      Hint = 'Totalizar'
      Visible = ivNever
      LargeImageIndex = 42
      OnClick = btnTotalizarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 117
    Top = 243
  end
  object CompPrint: TdxComponentPrinter
    CurrentLink = dplComposto
    PreviewOptions.EnableOptions = [peoCanChangeMargins, peoPageBackground, peoPageSetup, peoPreferences, peoPrint]
    PreviewOptions.VisibleOptions = [pvoPageBackground, pvoPageSetup, pvoPreferences, pvoPrint, pvoPrintStyles]
    PrintTitle = 'NEXCAFE_CAIXA'
    Version = 0
    Left = 232
    Top = 253
    object dplResFin: TdxGridReportLink
      Active = True
      Component = gridRes
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'Resumo Financeiro'
      ReportDocument.CreationDate = 42066.467040289350000000
      BuiltInReportLink = True
    end
    object dplTempoMaq: TdxGridReportLink
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 40121.923485532410000000
      ReportTitle.Text = 'Tempo de Uso por M'#225'quina'
      BuiltInReportLink = True
    end
    object dplTempoHora: TdxGridReportLink
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'Tempo de Uso por Hora'
      ReportDocument.CreationDate = 40121.923485543980000000
      ReportTitle.Text = 'Tempo de uso por Hor'#225'rio'
      BuiltInReportLink = True
    end
    object dplManutencao: TdxGridReportLink
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'Tempo de Uso em Modo Manuten'#231#227'o'
      ReportDocument.CreationDate = 40121.923485555560000000
      ReportTitle.Text = 'Tempo de uso em modo manuten'#231#227'o'
      BuiltInReportLink = True
    end
    object dplEstoque: TdxGridReportLink
      Component = gridEst
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'Vendas e Movimenta'#231#227'o de Produtos'
      ReportTitle.Text = 'Movimenta'#231#227'o de Estoque'
      BuiltInReportLink = True
    end
    object dplVendasCateg: TdxGridReportLink
      Active = True
      Component = gridVC
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'Vendas por Categoria'
      ReportDocument.CreationDate = 42066.467040405090000000
      ReportTitle.Text = 'Vendas por Categoria'
      BuiltInReportLink = True
    end
    object dplComposto: TdxCompositionReportLink
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 14300
      PrinterPage.PageFooter.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageFooter.Font.Color = clWindowText
      PrinterPage.PageFooter.Font.Height = -11
      PrinterPage.PageFooter.Font.Name = 'Tahoma'
      PrinterPage.PageFooter.Font.Style = []
      PrinterPage.PageHeader.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageHeader.Font.Color = clWindowText
      PrinterPage.PageHeader.Font.Height = -11
      PrinterPage.PageHeader.Font.Name = 'Tahoma'
      PrinterPage.PageHeader.Font.Style = []
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage.ScaleMode = smFit
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'New Report'
      ReportDocument.CreationDate = 39247.742500601850000000
      ReportDocument.Description = 'Rel'#225'torio de Caixa'
      ReportTitle.Font.Charset = DEFAULT_CHARSET
      ReportTitle.Font.Color = clWindowText
      ReportTitle.Font.Height = -19
      ReportTitle.Font.Name = 'Times New Roman'
      ReportTitle.Font.Style = [fsBold]
      StyleManager = dxPrintStyleManager1
      TimeFormat = 3
      AssignedFormatValues = [fvTime]
      Items = <
        item
          ReportLink = dplResFin
          BuiltInCompositionItem = True
        end
        item
          ReportLink = dplTempoMaq
          BuiltInCompositionItem = True
        end
        item
          ReportLink = dplTempoHora
          BuiltInCompositionItem = True
        end
        item
          ReportLink = dplManutencao
          BuiltInCompositionItem = True
        end
        item
          ReportLink = dplVendasCateg
          BuiltInCompositionItem = True
        end>
      BuiltInReportLink = True
    end
    object dplTran: TdxGridReportLink
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'Vendas por Categoria'
      OptionsPreview.Visible = False
      BuiltInReportLink = True
    end
    object dplGratis: TdxGridReportLink
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'Clientes Gr'#225'tis'
      ReportTitle.Text = 'Tempo de Uso de Clientes Gr'#225'tis'
      BuiltInReportLink = True
    end
    object dplCliente: TdxGridReportLink
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      BuiltInReportLink = True
    end
    object dplSessoes: TdxGridReportLink
      Component = gridSessoes
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'Sess'#245'es'
      BuiltInReportLink = True
    end
    object dplPrePos: TdxGridReportLink
      Component = gridPrePos
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'Pr'#233'/P'#243's-Pago'
      BuiltInReportLink = True
    end
    object dplImp: TdxGridReportLink
      Component = gridImp
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'Impress'#245'es'
      BuiltInReportLink = True
    end
    object dplPagEsp: TdxGridReportLink
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'Meio de Pagamento'
      BuiltInReportLink = True
    end
  end
  object dxPrintStyleManager1: TdxPrintStyleManager
    CurrentStyle = dxPrintStyleManager1Style1
    Version = 0
    Left = 189
    Top = 270
    object dxPrintStyleManager1Style1: TdxPSPrintStyle
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageFooter.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageFooter.Font.Color = clWindowText
      PrinterPage.PageFooter.Font.Height = -11
      PrinterPage.PageFooter.Font.Name = 'Tahoma'
      PrinterPage.PageFooter.Font.Style = []
      PrinterPage.PageHeader.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageHeader.Font.Color = clWindowText
      PrinterPage.PageHeader.Font.Height = -11
      PrinterPage.PageHeader.Font.Name = 'Tahoma'
      PrinterPage.PageHeader.Font.Style = []
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      BuiltInStyle = True
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10485759
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle42: TcxStyle
    end
    object cxStyle43: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxStyle44: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
  end
  object cxStyleRepository3: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
  end
  object cxStyleRepository4: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
  end
  object cxStyleRepository5: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
  end
  object cxStyleRepository6: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWindowText
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
  end
  object cxStyleRepository7: TcxStyleRepository
    Left = 160
    Top = 144
    PixelsPerInch = 96
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
  end
  object cxStyleRepository8: TcxStyleRepository
    Left = 152
    Top = 248
    PixelsPerInch = 96
    object cxStyle37: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
  end
  object FM: TFormManager
    BarMgr = BarMgr
    PageControl = Paginas
    Left = 333
    Top = 272
  end
  object dsCaixa: TDataSource
    Left = 80
    Top = 264
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = gridSessoes
    PopupMenus = <>
    Left = 272
    Top = 328
  end
end
