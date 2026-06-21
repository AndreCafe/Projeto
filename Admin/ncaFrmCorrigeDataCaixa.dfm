object FrmCorrigeDataCaixa: TFrmCorrigeDataCaixa
  Left = 282
  Top = 189
  ActiveControl = edAbert
  BorderStyle = bsDialog
  Caption = 'Corre'#231#227'o de dados do caixa'
  ClientHeight = 425
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 36
    Width = 422
    Height = 389
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 4
    object edFecha: TcxDateEdit
      Left = 84
      Top = 42
      Properties.Kind = ckDateTime
      Properties.ReadOnly = False
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Width = 132
    end
    object lbFecha: TcxLabel
      Left = 14
      Top = 43
      Caption = 'Fechamento'
    end
    object cxLabel2: TcxLabel
      Left = 14
      Top = 15
      Caption = 'Abertura'
    end
    object edAbert: TcxDateEdit
      Left = 84
      Top = 15
      Properties.Kind = ckDateTime
      Properties.ReadOnly = False
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
      Width = 132
    end
    object cxLabel1: TcxLabel
      Left = 13
      Top = 131
      Caption = 'Saldo final do caixa'
    end
    object edSaldoF: TcxCurrencyEdit
      Left = 14
      Top = 150
      AutoSize = False
      ParentFont = False
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Courier New'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 7
      Height = 23
      Width = 202
    end
    object cxLabel3: TcxLabel
      Left = 12
      Top = 228
      Caption = 'Observa'#231#245'es'
    end
    object edObs: TcxMemo
      Left = 14
      Top = 248
      Style.BorderStyle = ebsFlat
      TabOrder = 9
      Height = 104
      Width = 394
    end
    object cxLabel4: TcxLabel
      Left = 13
      Top = 181
      Caption = 'Identifica'#231#227'o extra para o caixa (opcional)'
    end
    object edIDLoja: TcxTextEdit
      Left = 13
      Top = 198
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 11
      Width = 203
    end
    object lbSaldoI: TcxLabel
      Left = 13
      Top = 83
      Caption = 'Saldo inicial do caixa'
    end
    object edSaldoI: TcxCurrencyEdit
      Left = 14
      Top = 102
      AutoSize = False
      ParentFont = False
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Courier New'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 5
      Height = 23
      Width = 202
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
