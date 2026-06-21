object FrmMenu: TFrmMenu
  Left = 222
  Top = 179
  Width = 337
  Height = 203
  Caption = 'Menu'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object VG: TcxDBVerticalGrid
    Left = 0
    Top = 40
    Width = 329
    Height = 129
    Styles.StyleSheet = FrmPri.cxVerticalGridStyleSheetDevExpress
    Align = alClient
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
    DataController.DataSource = DM.dsMenu
    object VGDescricao: TcxDBEditorRow
      Properties.Caption = 'Descri'#231#227'o'
      Properties.DataBinding.FieldName = 'Descricao'
    end
    object VGNomeForm: TcxDBEditorRow
      Properties.Caption = 'Tela'
      Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.ImmediateUpdateText = True
      Properties.EditProperties.Items = <
        item
        end>
      Properties.EditProperties.ReadOnly = False
      Properties.EditProperties.OnChange = VGNomeFormEditPropertiesChange
      Properties.DataBinding.FieldName = 'Form'
    end
    object VGNomeOper: TcxDBEditorRow
      Properties.Caption = 'Opera'#231#227'o'
      Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.ImmediateUpdateText = True
      Properties.EditProperties.Items = <>
      Properties.EditProperties.ReadOnly = False
      Properties.DataBinding.FieldName = 'OperID'
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
    LargeImages = dmImagens.Imagens
    PopupMenuLinks = <>
    Style = bmsFlat
    UseSystemFont = True
    Left = 144
    Top = 8
    DockControlHeights = (
      0
      0
      40
      0)
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      OnClick = cmCancelarClick
      AutoGrayScale = False
      LargeImageIndex = 6
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
      LargeImageIndex = 3
    end
  end
end
