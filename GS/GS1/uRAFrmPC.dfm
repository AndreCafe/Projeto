object FrmPC: TFrmPC
  Left = 222
  Top = 179
  Width = 365
  Height = 249
  Caption = 'Plano de Contas'
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
    Top = 40
    Width = 357
    Height = 182
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
    DataController.DataSource = DM.dsPC
    object VGNome: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'Nome'
    end
    object VGSintetico: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'Sintetico'
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
    Left = 304
    Top = 80
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
      LargeImageIndex = 5
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
      LargeImageIndex = 7
    end
  end
end
