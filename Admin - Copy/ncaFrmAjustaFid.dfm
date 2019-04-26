object FrmAjustaFid: TFrmAjustaFid
  Left = 282
  Top = 189
  ActiveControl = edPontos
  BorderStyle = bsDialog
  Caption = 'Ajuste de Pontos Fidelidade'
  ClientHeight = 289
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 44
    Width = 336
    Height = 245
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 4
    ExplicitTop = 32
    ExplicitHeight = 257
    object cxLabel2: TcxLabel
      Left = 13
      Top = 9
      Caption = 'Cliente'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
    end
    object cxLabel3: TcxLabel
      Left = 11
      Top = 179
      Caption = 'Observa'#231#245'es'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
    end
    object edObs: TcxTextEdit
      Left = 13
      Top = 197
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 2
      Text = 'edObs'
      Width = 302
    end
    object edCliente: TcxTextEdit
      Left = 15
      Top = 27
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderStyle = ebsFlat
      Style.Color = 16776176
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
      Text = 'edCliente'
      Width = 301
    end
    object rbAdicionar: TcxRadioButton
      Tag = 1
      Left = 15
      Top = 64
      Width = 113
      Height = 17
      Caption = 'Adicionar pontos'
      Checked = True
      TabOrder = 4
      TabStop = True
      OnClick = rbAdicionarClick
    end
    object rbRemover: TcxRadioButton
      Tag = -1
      Left = 15
      Top = 87
      Width = 113
      Height = 17
      Caption = 'Remover pontos'
      TabOrder = 5
      OnClick = rbRemoverClick
    end
    object cbZerar: TcxCheckBox
      Left = 145
      Top = 134
      AutoSize = False
      Caption = 'Zerar Pontos'
      Style.BorderStyle = ebsFlat
      TabOrder = 6
      OnClick = cbZerarClick
      Height = 21
      Width = 112
    end
    object cxLabel1: TcxLabel
      Left = 14
      Top = 113
      Caption = 'Quantidade de pontos'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
    end
    object edPontos: TcxMaskEdit
      Left = 16
      Top = 134
      Style.BorderStyle = ebsFlat
      TabOrder = 8
      Text = 'edPontos'
      Width = 121
    end
  end
  object BarMgr: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmImagens.im16
    ImageOptions.LargeImages = dmImagens.im32
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 216
    Top = 8
    DockControlHeights = (
      0
      0
      44
      0)
    object BarMgrBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Controles'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 67
      FloatTop = 344
      FloatClientWidth = 69
      FloatClientHeight = 44
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmGravar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
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
    object cmGravar: TdxBarLargeButton
      Caption = '&Salvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      LargeImageIndex = 41
      OnClick = cmGravarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 49
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
end
