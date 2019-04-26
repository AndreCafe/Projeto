object FrmFundo: TFrmFundo
  Left = 0
  Top = 0
  Caption = 'Imagem de fundo'
  ClientHeight = 465
  ClientWidth = 786
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Imagem: TImage
    Left = 0
    Top = 38
    Width = 786
    Height = 427
    Align = alClient
    AutoSize = True
    Center = True
    Proportional = True
    Stretch = True
    ExplicitLeft = 528
    ExplicitTop = 328
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object ActionList1: TActionList
    Left = 680
    Top = 336
  end
  object OpenDlg: TOpenDialog
    DefaultExt = 'jpg'
    Filter = 'Arquivos JPEG|*.jpg|Arquivos GIF|*.gif'
    Options = [ofHideReadOnly, ofNoChangeDir, ofFileMustExist, ofEnableSizing]
    Left = 184
    Top = 200
  end
  object barMgr: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmImagens.im16
    ImageOptions.LargeImages = dmImagens.im32
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 400
    Top = 200
    DockControlHeights = (
      0
      0
      38
      0)
    object barTopo: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 812
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnSelImagem'
        end
        item
          Visible = True
          ItemName = 'btnEnviar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnSemFundo'
        end
        item
          Visible = True
          ItemName = 'cmFechar'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object btnSelImagem: TdxBarLargeButton
      Caption = '&Selecionar Imagem'
      Category = 0
      Hint = 'Selecionar Imagem'
      Visible = ivAlways
      LargeImageIndex = 34
      OnClick = btnSelImagemClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object btnEnviar: TdxBarLargeButton
      Caption = 'Enviar imagem para m'#225'q. clientes'
      Category = 0
      Enabled = False
      Hint = 'Enviar imagem para m'#225'q. clientes'
      Visible = ivAlways
      LargeImageIndex = 52
      OnClick = btnEnviarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object btnSemFundo: TdxBarLargeButton
      Caption = '&Apagar Imagem de Fundo'
      Category = 0
      Enabled = False
      Hint = 'Apagar Imagem de Fundo'
      Visible = ivAlways
      LargeImageIndex = 49
      OnClick = btnSemFundoClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmFechar: TdxBarLargeButton
      Align = iaRight
      Caption = '&Fechar'
      Category = 0
      Hint = 'Fechar'
      Visible = ivAlways
      LargeImageIndex = 32
      OnClick = cmFecharClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
end
