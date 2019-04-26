object FrmDebTempo: TFrmDebTempo
  Left = 282
  Top = 189
  BorderStyle = bsDialog
  Caption = 'Remover Cr'#233'dito'
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 41
    Width = 336
    Height = 248
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitTop = 37
    ExplicitHeight = 252
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
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
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
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Text = 'edCliente'
      Width = 301
    end
    object rbTempo: TcxRadioButton
      Left = 15
      Top = 64
      Width = 113
      Height = 17
      Caption = 'Remover Tempo'
      Checked = True
      TabOrder = 4
      TabStop = True
      OnClick = rbTempoClick
    end
    object rbValor: TcxRadioButton
      Left = 15
      Top = 87
      Width = 113
      Height = 17
      Caption = 'Remover Valor'
      TabOrder = 5
      OnClick = rbValorClick
    end
    object Paginas: TcxPageControl
      Left = 15
      Top = 120
      Width = 314
      Height = 46
      TabOrder = 6
      Properties.ActivePage = cxTabSheet1
      Properties.CustomButtons.Buttons = <>
      Properties.HideTabs = True
      LookAndFeel.NativeStyle = False
      ClientRectBottom = 46
      ClientRectRight = 314
      ClientRectTop = 0
      object cxTabSheet1: TcxTabSheet
        Caption = 'cxTabSheet1'
        ImageIndex = 0
        object cxLabel1: TcxLabel
          Left = -2
          Top = 1
          Caption = 'Tempo a ser removido da conta do cliente'
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
        end
        object edTempo: TcxTimeEdit
          Left = 0
          Top = 19
          EditValue = 0d
          Properties.ImmediatePost = True
          Style.BorderStyle = ebsFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 1
          Width = 89
        end
        object cbTempoTotal: TcxCheckBox
          Left = 88
          Top = 19
          Caption = 'Remover tudo'
          Style.BorderStyle = ebsFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 2
          OnClick = cbTempoTotalClick
          Width = 201
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = 'cxTabSheet2'
        ImageIndex = 1
        object cxLabel4: TcxLabel
          Left = -2
          Top = 1
          Caption = 'Valor a ser removido da conta do cliente'
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
        end
        object edValor: TcxCurrencyEdit
          Left = 0
          Top = 20
          AutoSize = False
          EditValue = 0.000000000000000000
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          Properties.AssignedValues.EditFormat = True
          Properties.UseThousandSeparator = True
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsFlat
          Style.Color = clWhite
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.TransparentBorder = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.Color = 16776176
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.BorderStyle = ebsSingle
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 1
          Height = 23
          Width = 89
        end
        object cbValorTotal: TcxCheckBox
          Left = 88
          Top = 22
          Caption = 'Remover tudo'
          Style.BorderStyle = ebsFlat
          TabOrder = 2
          OnClick = cbValorTotalClick
          Width = 212
        end
      end
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
    ImageOptions.LargeImages = dmImagens.im24
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
      36
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
      LargeImageIndex = 5
      OnClick = cmGravarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
end
