object FrmChave: TFrmChave
  Left = 325
  Top = 208
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = 'Cyber Manager - Número de Licença'
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
      'Entre em contato com a Cybermgr.com, e informe o seu número de s' +
      'érie para obter o número da sua licença.'
  end
  object btnLiberar: TBitBtn
    Left = 7
    Top = 232
    Width = 130
    Height = 33
    Caption = '&Aplicar Licença'
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
      Caption = '  Dados da Licença'
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
        Top = 34
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
      end
      object LMDLabel10: TLMDLabel
        Left = 1
        Top = 19
        Width = 118
        Height = 15
        Bevel.BorderSides = [fsBottom]
        Bevel.EdgeStyle = etRaisedInner
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        Align = alTop
        Alignment = agCenterLeft
        Options = []
        Caption = '  Número de Máquinas'
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
      object lbNumMaq: TLMDLabel
        Left = 0
        Top = 18
        Width = 223
        Height = 15
        Bevel.BorderSides = [fsTop]
        Bevel.EdgeStyle = etRaisedInner
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        Align = alTop
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Options = []
        ParentColor = False
        ParentFont = False
        Caption = ' 10'
      end
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
        Caption = ' Temporária'
      end
      object lbExpira: TLMDLabel
        Left = 0
        Top = 33
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
        Caption = 'Número da Licença'
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
        CaretIns.BitmapHotSpotX = 0
        CaretIns.BitmapHotSpotY = 0
        CaretIns.Shape = csBlock
        CaretIns.Align = caLeft
        CaretIns.BlinkTime = 0
        CaretIns.CaretHeight = 10
        CaretIns.CaretWidth = 10
        CaretIns.IsGray = False
        CaretOvr.BitmapHotSpotX = 0
        CaretOvr.BitmapHotSpotY = 0
        CaretOvr.Shape = csBlock
        CaretOvr.Align = caLeft
        CaretOvr.BlinkTime = 0
        CaretOvr.CaretHeight = 10
        CaretOvr.CaretWidth = 2
        CaretOvr.IsGray = False
        Controller = OvcController1
        ControlCharColor = clRed
        Borders.BottomBorder.BorderStyle = bpsSolid
        Borders.BottomBorder.Enabled = False
        Borders.BottomBorder.PenColor = clBlack
        Borders.BottomBorder.PenStyle = psSolid
        Borders.BottomBorder.PenWidth = 2
        Borders.LeftBorder.BorderStyle = bpsSolid
        Borders.LeftBorder.Enabled = False
        Borders.LeftBorder.PenColor = clBlack
        Borders.LeftBorder.PenStyle = psSolid
        Borders.LeftBorder.PenWidth = 2
        Borders.RightBorder.BorderStyle = bpsSolid
        Borders.RightBorder.Enabled = False
        Borders.RightBorder.PenColor = clBlack
        Borders.RightBorder.PenStyle = psSolid
        Borders.RightBorder.PenWidth = 2
        Borders.TopBorder.BorderStyle = bpsSolid
        Borders.TopBorder.Enabled = False
        Borders.TopBorder.PenColor = clBlack
        Borders.TopBorder.PenStyle = psSolid
        Borders.TopBorder.PenWidth = 2
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
        LabelInfo.Visible = False
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
      Caption = '  Número da Série'
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
      CaretIns.BitmapHotSpotX = 0
      CaretIns.BitmapHotSpotY = 0
      CaretIns.Shape = csBlock
      CaretIns.Align = caLeft
      CaretIns.BlinkTime = 0
      CaretIns.CaretHeight = 10
      CaretIns.CaretWidth = 10
      CaretIns.IsGray = False
      CaretOvr.BitmapHotSpotX = 0
      CaretOvr.BitmapHotSpotY = 0
      CaretOvr.Shape = csBlock
      CaretOvr.Align = caLeft
      CaretOvr.BlinkTime = 0
      CaretOvr.CaretHeight = 10
      CaretOvr.CaretWidth = 2
      CaretOvr.IsGray = False
      Color = 15066597
      Controller = OvcController1
      ControlCharColor = clRed
      Borders.BottomBorder.BorderStyle = bpsSolid
      Borders.BottomBorder.Enabled = False
      Borders.BottomBorder.PenColor = clBlack
      Borders.BottomBorder.PenStyle = psSolid
      Borders.BottomBorder.PenWidth = 2
      Borders.LeftBorder.BorderStyle = bpsSolid
      Borders.LeftBorder.Enabled = False
      Borders.LeftBorder.PenColor = clBlack
      Borders.LeftBorder.PenStyle = psSolid
      Borders.LeftBorder.PenWidth = 2
      Borders.RightBorder.BorderStyle = bpsSolid
      Borders.RightBorder.Enabled = False
      Borders.RightBorder.PenColor = clBlack
      Borders.RightBorder.PenStyle = psSolid
      Borders.RightBorder.PenWidth = 2
      Borders.TopBorder.BorderStyle = bpsSolid
      Borders.TopBorder.Enabled = False
      Borders.TopBorder.PenColor = clBlack
      Borders.TopBorder.PenStyle = psSolid
      Borders.TopBorder.PenWidth = 2
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
      LabelInfo.Visible = False
      MaxLength = 8
      Options = [efoCaretToEnd]
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
    EntryOptions = [efoAutoSelect, efoBeepOnError, efoInsertPushes]
    Epoch = 2000
    Left = 192
    Top = 336
  end
end
