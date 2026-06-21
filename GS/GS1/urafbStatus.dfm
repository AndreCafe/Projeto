inherited fbStatus: TfbStatus
  Left = 244
  Top = 204
  Width = 466
  Caption = 'Status'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 44
    Width = 458
    Height = 227
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 458
      Height = 227
      Align = alClient
      TabOrder = 0
      object TV: TcxGridDBTableView
        DataController.DataSource = DM.dsStatus
        DataController.KeyFieldNames = 'Codigo'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = FrmPri.GridTableViewStyleSheetDevExpress
        object VDescricao1: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          Width = 184
          DataBinding.FieldName = 'Descricao'
        end
        object VCorFonte1: TcxGridDBColumn
          Caption = 'Cor da Fonte'
          PropertiesClassName = 'TcxColorComboBoxProperties'
          Properties.ShowDescriptions = False
          Properties.Items = <>
          Properties.PrepareInfo = ''
          Options.Editing = False
          Width = 135
          DataBinding.FieldName = 'CorFonte'
        end
        object VCorFundo1: TcxGridDBColumn
          Caption = 'Cor de Fundo'
          PropertiesClassName = 'TcxColorComboBoxProperties'
          Properties.ShowDescriptions = False
          Properties.Items = <>
          Properties.PrepareInfo = ''
          Options.Editing = False
          Width = 137
          DataBinding.FieldName = 'CorFundo'
        end
      end
      object GL: TcxGridLevel
        GridView = TV
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
        Caption = 'BarraTabSheet'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmNovo
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            Item = cmEditar
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            Item = cmApagar
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmAtualizar
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end>
        Name = 'BarraTabSheet'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    LargeImages = FrmPri.im32
    DockControlHeights = (
      0
      0
      44
      0)
    inherited cmNovo: TdxBarLargeButton
      OnClick = cmNovoClick
      ShowCaption = True
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      OnClick = cmEditarClick
      ShowCaption = True
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      OnClick = cmApagarClick
      ShowCaption = True
      ImageIndex = 12
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    object cmSenha: TdxBarButton
      Caption = 'Alterar Senha'
      Category = 0
      Hint = 'Alterar Senha'
      Visible = ivAlways
    end
  end
end
