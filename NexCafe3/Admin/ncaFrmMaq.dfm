object FrmMaq: TFrmMaq
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Propriedades da M'#225'quina'
  ClientHeight = 432
  ClientWidth = 391
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object panPri: TPanel
    Left = 0
    Top = 44
    Width = 391
    Height = 388
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object cbEmManut: TcxCheckBox
      Left = 11
      Top = 12
      Caption = 'Em Manuten'#231#227'o / Indispon'#237'vel para uso'
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Width = 214
    end
    object cxLabel1: TcxLabel
      Left = 14
      Top = 40
      Caption = 'Nome de Rede'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
    end
    object cxLabel2: TcxLabel
      Left = 14
      Top = 73
      Caption = 'Nome Alternativo'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
    end
    object cxLabel3: TcxLabel
      Left = 14
      Top = 131
      Caption = 'Endere'#231'o IP'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
    end
    object cxLabel4: TcxLabel
      Left = 14
      Top = 161
      Caption = 'Mac Address'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
    end
    object lbTarifaEsp: TcxLabel
      Left = 14
      Top = 191
      Caption = 'Tarifa Especial '
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
    end
    object edCompName: TcxTextEdit
      Left = 112
      Top = 40
      Properties.ReadOnly = True
      Style.BorderColor = clBtnFace
      Style.BorderStyle = ebsFlat
      Style.Color = clBtnFace
      Style.LookAndFeel.NativeStyle = True
      Style.TextColor = clBlack
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 6
      Text = 'edCompName'
      Width = 262
    end
    object edNome: TcxTextEdit
      Left = 112
      Top = 71
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 7
      Text = 'cxTextEdit1'
      Width = 262
    end
    object edIP: TcxTextEdit
      Left = 112
      Top = 129
      Properties.ReadOnly = True
      Style.BorderStyle = ebsFlat
      Style.Color = clBtnFace
      Style.LookAndFeel.NativeStyle = True
      Style.TextColor = clBlack
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 8
      Text = 'cxTextEdit1'
      Width = 262
    end
    object edMAC: TcxTextEdit
      Left = 112
      Top = 160
      Properties.ReadOnly = True
      Style.BorderStyle = ebsFlat
      Style.Color = clBtnFace
      Style.LookAndFeel.NativeStyle = True
      Style.TextColor = clBlack
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 9
      Text = 'cxTextEdit1'
      Width = 262
    end
    object edTarifa: TcxImageComboBox
      Left = 112
      Top = 190
      EditValue = -1
      Properties.Items = <
        item
          Description = 'Sem tarifa especial'
          ImageIndex = 0
          Value = -1
        end>
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 10
      Width = 262
    end
    object edObs: TcxMemo
      Left = 112
      Top = 304
      Lines.Strings = (
        'edObs')
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 12
      Height = 65
      Width = 262
    end
    object cxLabel6: TcxLabel
      Left = 14
      Top = 305
      Caption = 'Obs'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
    end
    object cxLabel7: TcxLabel
      Left = 112
      Top = 92
      AutoSize = False
      Caption = 
        'Essa identifica'#231#227'o adicional ajuda a diferenciar as m'#225'quinas qua' +
        'ndo o n'#250'mero apenas n'#227'o '#233' suficiente.'
      Properties.WordWrap = True
      Style.LookAndFeel.NativeStyle = True
      Style.TextColor = 4144959
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      Height = 30
      Width = 262
    end
    object cxLabel5: TcxLabel
      Left = 15
      Top = 217
      Caption = 'Patrocinador '#13#10'Acesso Gr'#225'tis'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
    end
    object cbPatrocinio: TcxImageComboBox
      Left = 112
      Top = 223
      EditValue = -1
      Properties.Items = <
        item
          Description = 'Sem acesso patrocinado'
          ImageIndex = 0
          Value = ''
        end>
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 11
      Width = 262
    end
    object cbAvisaFimTempo: TcxCheckBox
      Left = 11
      Top = 253
      Caption = 'Tocar aviso sonoro no caixa, ao terminar o tempo'
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 16
      Width = 270
    end
    object cxLabel8: TcxLabel
      Left = 15
      Top = 279
      Caption = 'Resolu'#231#227'o Video'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
    end
    object edScreenRes: TcxTextEdit
      Left = 112
      Top = 277
      Enabled = False
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 18
      Text = '1280x800'
      Width = 262
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
    ImageOptions.LargeImages = FrmPri.im32
    ImageOptions.MakeDisabledImagesFaded = True
    LookAndFeel.NativeStyle = True
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 264
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
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarStatic1'
        end
        item
          Visible = True
          ItemName = 'beMaq'
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
    object beMaq: TcxBarEditItem
      Caption = '5'
      Category = 0
      Hint = '5'
      Style = cxStyle1
      Visible = ivAlways
      ShowCaption = True
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
      StyleEdit = cxStyle1
    end
    object dxBarStatic1: TdxBarStatic
      Caption = 'M'#225'q'
      Category = 0
      Hint = 'M'#225'q'
      Visible = ivAlways
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
  end
end
