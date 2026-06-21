object FrmUsuario: TFrmUsuario
  Left = 382
  Top = 191
  Width = 365
  Height = 249
  Caption = 'Usu'#225'rio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object VG: TcxDBVerticalGrid
    Left = 0
    Top = 42
    Width = 357
    Height = 180
    Styles.StyleSheet = FrmPri.cxVerticalGridStyleSheetDevExpress
    Align = alClient
    OptionsView.RowHeaderWidth = 88
    OptionsView.RecordsInterval = 1
    OptionsBehavior.AlwaysShowEditor = True
    OptionsBehavior.GoToNextCellOnEnter = True
    OptionsBehavior.GoToNextCellOnTab = True
    OptionsBehavior.AllowChangeRecord = False
    OptionsBehavior.FocusFirstCellOnNewRecord = True
    OptionsData.CancelOnExit = False
    OptionsData.Deleting = False
    OptionsData.DeletingConfirmation = False
    TabOrder = 4
    DataController.DataSource = DM.dsUsuario
    object VGUsername: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'Username'
    end
    object VGNome: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'Nome'
    end
    object VGAdmin: TcxDBEditorRow
      Properties.HeaderAlignmentVert = vaCenter
      Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
      Properties.EditProperties.Alignment = taCenter
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.NullStyle = nssUnchecked
      Properties.DataBinding.FieldName = 'Admin'
    end
  end
  object BarMgr: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Custom 1'
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
            Item = cmSalvar
            Visible = True
          end
          item
            Item = cmCancelar
            Visible = True
          end>
        Name = 'Custom 1'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Images = dmImagens.Imagens
    LargeImages = FrmPri.im32
    PopupMenuLinks = <>
    Style = bmsFlat
    UseSystemFont = True
    Left = 304
    Top = 80
    DockControlHeights = (
      0
      0
      42
      0)
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 39
    end
    object cmFechar: TdxBarLargeButton
      Caption = '&Fechar'
      Category = 0
      Hint = 'Fechar'
      Visible = ivAlways
      AutoGrayScale = False
      LargeImageIndex = 37
    end
    object cmSalvar: TdxBarLargeButton
      Caption = 'S&alvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      OnClick = cmSalvarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 41
    end
  end
end
