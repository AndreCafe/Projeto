inherited fbUsuario: TfbUsuario
  Left = 244
  Top = 204
  Width = 466
  Caption = 'Usu'#225'rios'
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
      object GridTV: TcxGridDBTableView
        OnDblClick = cmEditarClick
        DataController.DataSource = DM.dsUsuario
        DataController.KeyFieldNames = 'Username'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = FrmPri.GridTableViewStyleSheetDevExpress
        object GridTVUsername: TcxGridDBColumn
          Width = 136
          DataBinding.FieldName = 'Username'
        end
        object GridTVNome: TcxGridDBColumn
          Width = 244
          DataBinding.FieldName = 'Nome'
        end
        object GridTVAdmin: TcxGridDBColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 125
          DataBinding.FieldName = 'Admin'
        end
      end
      object GridLevel: TcxGridLevel
        GridView = GridTV
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
          end
          item
            BeginGroup = True
            Item = cmSenha
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
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      OnClick = cmEditarClick
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmAtualizar: TdxBarLargeButton
      ShowCaption = False
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
