object FrmChave: TFrmChave
  Left = 325
  Top = 208
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = 'Di'#225'rio do T'#233'cnico - N'#250'mero de Licen'#231'a'
  ClientHeight = 282
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object LMDLabel2: TLMDLabel
    Left = 0
    Top = 0
    Width = 376
    Height = 38
    Bevel.BorderColor = clWhite
    Bevel.BorderSides = [fsBottom]
    Bevel.BorderInnerWidth = 3
    Bevel.EdgeStyle = etRaisedInner
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsLoweredspb
    Align = alTop
    Alignment = agCenterLeft
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MultiLine = True
    Options = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    Caption = 
      'Entre em contato por telefone (48) 3338-1171 ou Messenger suport' +
      'e@cybermgr.com'
    ExplicitWidth = 308
  end
  object btnLiberar: TBitBtn
    Left = 7
    Top = 232
    Width = 130
    Height = 33
    Caption = '&Aplicar Licen'#231'a'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnLiberarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
      333333333F777773FF333333008888800333333377333F3773F3333077870787
      7033333733337F33373F3308888707888803337F33337F33337F330777880887
      7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
      7703337F33377733337FB3088888888888033373FFFFFFFFFF733B3000000000
      0033333777777777773333BBBB3333080333333333F3337F7F33BBBB707BB308
      03333333373F337F7F3333BB08033308033333337F7F337F7F333B3B08033308
      033333337F73FF737F33B33B778000877333333373F777337333333B30888880
      33333333373FFFF73333333B3300000333333333337777733333}
    NumGlyphs = 2
  end
  object btnContinuar: TBitBtn
    Left = 168
    Top = 232
    Width = 89
    Height = 33
    Cancel = True
    Caption = 'Fechar'
    ModalResult = 2
    TabOrder = 1
    OnClick = btnContinuarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      03333377777777777F333301111111110333337F333333337F33330111111111
      0333337F333333337F333301111111110333337F333333337F33330111111111
      0333337F333333337F333301111111110333337F333333337F33330111111111
      0333337F3333333F7F333301111111B10333337F333333737F33330111111111
      0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
      0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
      0333337F377777337F333301111111110333337F333333337F33330111111111
      0333337FFFFFFFFF7F3333000000000003333377777777777333}
    NumGlyphs = 2
  end
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 92
    Width = 345
    Height = 119
    UseDockManager = False
    Bevel.Mode = bmStandard
    TabOrder = 2
    object LMDLabel1: TLMDLabel
      Left = 1
      Top = 1
      Width = 343
      Height = 20
      Bevel.BorderSides = [fsBottom]
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsSingleRaised
      Align = alTop
      Alignment = agCenterLeft
      AutoSize = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MultiLine = True
      Options = []
      ParentColor = False
      ParentFont = False
      Caption = '  Dados da Licen'#231'a'
    end
    object LMDSimplePanel5: TLMDSimplePanel
      Left = 1
      Top = 61
      Width = 120
      Height = 57
      UseDockManager = False
      Align = alLeft
      Bevel.BorderSides = [fsRight]
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsSingleRaised
      TabOrder = 0
      object LMDLabel9: TLMDLabel
        Left = 1
        Top = 19
        Width = 118
        Height = 15
        Bevel.BorderSides = [fsBottom]
        Bevel.EdgeStyle = etRaisedInner
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        Align = alTop
        Alignment = agBottomLeft
        Options = []
        Caption = '  Expira em'
        ExplicitWidth = 55
      end
      object LMDLabel11: TLMDLabel
        Left = 1
        Top = 4
        Width = 118
        Height = 15
        Bevel.BorderSides = [fsBottom]
        Bevel.EdgeStyle = etRaisedInner
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        Align = alTop
        Alignment = agCenterLeft
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = []
        ParentColor = False
        ParentFont = False
        Caption = '  Tipo'
        ExplicitWidth = 28
      end
      object LMDLabel15: TLMDLabel
        Left = 1
        Top = 1
        Width = 118
        Height = 3
        Bevel.BorderSides = [fsBottom]
        Bevel.EdgeStyle = etRaisedInner
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        Align = alTop
        Alignment = agCenterLeft
        AutoSize = False
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = []
        ParentColor = False
        ParentFont = False
      end
    end
    object LMDSimplePanel6: TLMDSimplePanel
      Left = 121
      Top = 61
      Width = 223
      Height = 57
      UseDockManager = False
      Align = alClient
      Bevel.BorderSides = [fsTop]
      Bevel.EdgeStyle = etSunkenOuter
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      Color = clWhite
      TabOrder = 1
      object lbTipo: TLMDLabel
        Left = 0
        Top = 3
        Width = 223
        Height = 15
        Bevel.BorderSides = [fsBottom]
        Bevel.EdgeStyle = etRaisedInner
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        Align = alTop
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Options = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        Caption = ' Tempor'#225'ria'
        ExplicitWidth = 71
      end
      object lbExpira: TLMDLabel
        Left = 0
        Top = 18
        Width = 223
        Height = 15
        Bevel.BorderSides = [fsBottom]
        Bevel.EdgeStyle = etRaisedInner
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        Align = alTop
        Alignment = agCenterLeft
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Options = []
        ParentColor = False
        ParentFont = False
        Caption = ' 10/10/2003'
        ExplicitWidth = 73
      end
      object LMDLabel14: TLMDLabel
        Left = 0
        Top = 0
        Width = 223
        Height = 3
        Bevel.BorderSides = [fsBottom]
        Bevel.EdgeStyle = etRaisedInner
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        Align = alTop
        Alignment = agCenterLeft
        AutoSize = False
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = []
        ParentColor = False
        ParentFont = False
      end
    end
    object LMDSimplePanel7: TLMDSimplePanel
      Left = 1
      Top = 21
      Width = 343
      Height = 40
      UseDockManager = False
      Align = alTop
      Bevel.Mode = bmCustom
      Color = clWhite
      TabOrder = 2
      object LMDLabel16: TLMDLabel
        Left = 0
        Top = 0
        Width = 120
        Height = 40
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsSingleRaised
        Align = alLeft
        Alignment = agCenter
        AutoSize = False
        Color = clSilver
        FocusControl = edLicenca
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Options = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        OnClick = LMDLabel16Click
        Caption = 'N'#250'mero da Licen'#231'a'
      end
      object edLicenca: TOvcPictureField
        Left = 123
        Top = 11
        Width = 216
        Height = 21
        Cursor = crIBeam
        DataType = pftString
        AutoSize = False
        BorderStyle = bsNone
        CaretIns.Shape = csBlock
        CaretIns.CaretWidth = 10
        CaretOvr.Shape = csBlock
        Controller = OvcController1
        ControlCharColor = clRed
        DecimalPlaces = 0
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Epoch = 0
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        InitDateTime = False
        MaxLength = 19
        Options = [efoCaretToEnd]
        ParentFont = False
        PictureMask = '9999-9999-9999-9999'
        TabOrder = 0
      end
    end
  end
  object LMDSimplePanel8: TLMDSimplePanel
    Left = 0
    Top = 49
    Width = 233
    Height = 29
    UseDockManager = False
    Bevel.Mode = bmStandard
    Color = 15066597
    TabOrder = 3
    object LMDLabel17: TLMDLabel
      Left = 1
      Top = 1
      Width = 120
      Height = 27
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsSingleRaised
      Align = alLeft
      Alignment = agCenterLeft
      AutoSize = False
      Color = clSilver
      FocusControl = edSerie
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      OnClick = LMDLabel17Click
      Caption = '  N'#250'mero da S'#233'rie'
    end
    object edSerie: TOvcPictureField
      Left = 123
      Top = 5
      Width = 220
      Height = 21
      Cursor = crIBeam
      DataType = pftString
      AutoSize = False
      BorderStyle = bsNone
      CaretIns.Shape = csBlock
      CaretIns.CaretWidth = 10
      CaretOvr.Shape = csBlock
      Color = 15066597
      Controller = OvcController1
      ControlCharColor = clRed
      DecimalPlaces = 0
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      Epoch = 0
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      InitDateTime = False
      MaxLength = 8
      Options = [efoCaretToEnd, efoReadOnly]
      ParentFont = False
      PictureMask = 'XXXXXXXX'
      TabOrder = 0
    end
  end
  object OvcController1: TOvcController
    EntryCommands.TableList = (
      'Default'
      True
      ()
      'WordStar'
      False
      ()
      'Grid'
      False
      ())
    Epoch = 2000
    Left = 192
    Top = 336
  end
end
