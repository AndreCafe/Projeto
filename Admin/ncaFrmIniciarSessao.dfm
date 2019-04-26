object FrmIniciarSessao: TFrmIniciarSessao
  Left = 0
  Top = 0
  BorderWidth = 3
  Caption = 'Iniciar Acesso'
  ClientHeight = 515
  ClientWidth = 566
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 104
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object bdcAcesso: TdxBarDockControl
    Left = 0
    Top = 0
    Width = 566
    Height = 36
    Align = dalTop
    BarManager = BarMgr
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object LMDSimplePanel2: TLMDSimplePanel
    Left = 0
    Top = 167
    Width = 566
    Height = 0
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 2
    object LMDLabel3: TLMDLabel
      Left = 288
      Top = 8
      Width = 39
      Height = 26
      Bevel.Mode = bmCustom
      FontFX.Style = tdSunken
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = []
      ParentFont = False
      Visible = False
      Caption = '115'
    end
  end
  object panCli: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 41
    Width = 566
    Height = 85
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 3
  end
  object panTempo: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 172
    Width = 566
    Height = 343
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Bevel.Mode = bmCustom
    TabOrder = 4
    object cbRecibo: TcxCheckBox
      Left = 3
      Top = 18
      AutoSize = False
      Caption = 'Emitir Recibo'
      ParentFont = False
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.StyleController = FrmPri.cxEditStyleController1
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Transparent = True
      Visible = False
      Height = 21
      Width = 84
    end
  end
  object panGrupoTarObs: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 131
    Width = 566
    Height = 36
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Bevel.Mode = bmEdge
    TabOrder = 9
    object LMDLabel4: TLMDLabel
      Left = 440
      Top = 72
      Width = 39
      Height = 26
      Bevel.Mode = bmCustom
      FontFX.Style = tdSunken
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = []
      ParentFont = False
      Visible = False
      Caption = '115'
    end
    object panGrupoTar: TLMDSimplePanel
      Left = 2
      Top = 2
      Width = 279
      Height = 32
      Align = alLeft
      Bevel.Mode = bmCustom
      TabOrder = 0
      object edGrupoTar: TcxImageComboBox
        AlignWithMargins = True
        Left = 95
        Top = 4
        Margins.Left = 0
        Margins.Top = 4
        Margins.Right = 0
        Margins.Bottom = 4
        Align = alLeft
        ParentFont = False
        Properties.ImmediateDropDownWhenActivated = True
        Properties.ImmediatePost = True
        Properties.ImmediateUpdateText = True
        Properties.Items = <>
        Properties.OnCloseUp = edGrupoTarPropertiesCloseUp
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.ButtonStyle = btsUltraFlat
        Style.IsFontAssigned = True
        StyleFocused.BorderStyle = ebsSingle
        StyleFocused.Color = 11796479
        TabOrder = 0
        OnClick = edGrupoTarClick
        Width = 178
      end
      object lbGrupoTar: TcxLabel
        AlignWithMargins = True
        Left = 5
        Top = 0
        Cursor = crHandPoint
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 6
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'Grupo de Tarifas'
        ParentColor = False
        ParentFont = False
        Style.Color = clWhite
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.HotTrack = True
        Style.TextColor = 6118749
        Style.IsFontAssigned = True
        StyleFocused.BorderStyle = ebsNone
        StyleHot.BorderStyle = ebsNone
        StyleHot.TextColor = clBlue
        StyleHot.TextStyle = [fsUnderline]
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        OnClick = lbGrupoTarClick
        AnchorY = 16
      end
    end
    object panObs: TLMDSimplePanel
      Left = 281
      Top = 2
      Width = 283
      Height = 32
      Align = alClient
      Bevel.Mode = bmCustom
      TabOrder = 1
      object lbObs: TcxLabel
        AlignWithMargins = True
        Left = 5
        Top = 0
        Cursor = crHandPoint
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 6
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'Obs.'
        ParentColor = False
        ParentFont = False
        Style.Color = clWhite
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.HotTrack = True
        Style.TextColor = 6118749
        Style.IsFontAssigned = True
        StyleFocused.BorderStyle = ebsNone
        StyleHot.BorderStyle = ebsNone
        StyleHot.TextColor = clBlue
        StyleHot.TextStyle = [fsUnderline]
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        OnClick = lbObsClick
        AnchorY = 16
      end
      object edObs: TcxTextEdit
        AlignWithMargins = True
        Left = 38
        Top = 4
        Margins.Left = 0
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Align = alClient
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        StyleFocused.BorderStyle = ebsSingle
        StyleFocused.Color = 11796479
        TabOrder = 1
        Width = 239
      end
    end
  end
  object BarMgr: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default'
      'Sinal')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    ImageOptions.Images = dmImagens.im16
    ImageOptions.LargeImages = dmImagens.im24
    ImageOptions.MakeDisabledImagesFaded = True
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    UseBarHintWindow = False
    UseSystemFont = True
    Left = 216
    Top = 224
    DockControlHeights = (
      0
      0
      0
      0)
    object BarMgrBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Acesso'
      CaptionButtons = <>
      DockControl = bdcAcesso
      DockedDockControl = bdcAcesso
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 67
      FloatTop = 344
      FloatClientWidth = 69
      FloatClientHeight = 44
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmMaq'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmGravar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmListaEspera'
        end
        item
          Visible = True
          ItemName = 'cmRecibo'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Acesso'
      OneOnRow = True
      Row = 0
      SizeGrip = False
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object BarMgrBar2: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Rodap'#233' Acesso'
      CaptionButtons = <>
      DockedDockingStyle = dsBottom
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsBottom
      FloatLeft = 276
      FloatTop = 477
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmData'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmPagamento'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmFuncFim'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmFuncInicio'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'RodAcesso'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = False
      WholeRow = True
    end
    object BarMgrBar3: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 478
      FloatTop = 452
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmNovoSinal'
        end>
      OldName = 'Custom 1'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = False
      WholeRow = True
    end
    object BarMgrBar4: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Custom 2'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 255
      FloatTop = 304
      FloatClientWidth = 108
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmNovoItem'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmRemoverItem'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Custom 2'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = False
      WholeRow = True
    end
    object cmFuncFim: TdxBarStatic
      Caption = 'Func. Fim: daniel'
      Category = 0
      Hint = 'Func. Fim: daniel'
      Visible = ivAlways
    end
    object cmData: TdxBarStatic
      Caption = 'Data: 22/05/2002'
      Category = 0
      Hint = 'Data: 22/05/2002'
      Visible = ivAlways
    end
    object cmPagamento: TdxBarStatic
      Caption = 'Pago em: 22/05/2202'
      Category = 0
      Hint = 'Pago em: 22/05/2202'
      Visible = ivAlways
    end
    object cmFuncInicio: TdxBarStatic
      Caption = 'Func.Inicio: jlborges'
      Category = 0
      Hint = 'Func.Inicio: jlborges'
      Visible = ivAlways
    end
    object cmGravar: TdxBarLargeButton
      Caption = '&Salvar'
      Category = 0
      Hint = 'Pression CTRL+ENTER de qualquer local da tela para Iniciar'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = cmGravarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmNovoSinal: TdxBarButton
      Caption = '&Adicionar Novo Pagamento Antecipado'
      Category = 0
      Hint = 'Adicionar Novo Pagamento Antecipado'
      Visible = ivAlways
      ImageIndex = 0
      PaintStyle = psCaptionGlyph
    end
    object cmTituloSinal: TdxBarStatic
      Caption = 'Valores Pagos Antecipadamente'
      Category = 0
      Hint = 'Valores Pagos Antecipadamente'
      Visible = ivAlways
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
    object cmNovoItem: TdxBarButton
      Caption = 'Adicionar Novo Item'
      Category = 0
      Hint = 'Adicionar Novo Item'
      Visible = ivAlways
      ImageIndex = 0
      PaintStyle = psCaptionGlyph
    end
    object cmRemoverItem: TdxBarButton
      Caption = '&Remover Item'
      Category = 0
      Hint = 'Remover Item'
      Visible = ivAlways
      ImageIndex = 6
      PaintStyle = psCaptionGlyph
    end
    object cmRecibo: TdxBarControlContainerItem
      Align = iaRight
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = cbRecibo
    end
    object cmListaEspera: TdxBarLargeButton
      Caption = 'Lista de Espera'
      Category = 0
      Hint = 'Lista de Espera'
      Visible = ivNever
      ButtonStyle = bsChecked
      LargeImageIndex = 10
      OnClick = cbListaEsperaClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmMaq: TdxBarStatic
      Caption = 'M'#225'q. 1'
      Category = 0
      Hint = 'M'#225'q. 1'
      Style = FrmPri.cxStyle30
      Visible = ivAlways
      Width = 71
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 56
    Top = 256
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clRed
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsStrikeOut]
      TextColor = clRed
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBackground
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      TextColor = clGray
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 56
    Top = 224
    PixelsPerInch = 96
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15588572
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15588572
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
  end
  object cxStyleRepository3: TcxStyleRepository
    Left = 88
    Top = 224
    PixelsPerInch = 96
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 360
    Top = 72
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 50
    Left = 296
    Top = 72
  end
end
