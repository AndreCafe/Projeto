object FrmConfigEspecie: TFrmConfigEspecie
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Meio de pagamento'
  ClientHeight = 272
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object cxLabel2: TcxLabel
    Left = 167
    Top = 56
    AutoSize = False
    Caption = 'Selecione um '#237'cone para representar esse meio de pagamento'
    Style.TextColor = clGray
    Properties.Alignment.Vert = taVCenter
    Properties.WordWrap = True
    Height = 60
    Width = 450
    AnchorY = 86
  end
  object edImg: TcxImageComboBox
    Left = 83
    Top = 56
    Cursor = crHandPoint
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.Images = dmImgEsp.imgs48
    Properties.ImmediateDropDownWhenActivated = True
    Properties.ImmediatePost = True
    Properties.ImmediateUpdateText = True
    Properties.Items = <
      item
        ImageIndex = 0
        Value = 0
      end>
    Properties.LargeImages = dmImgEsp.imgs48
    Properties.ShowDescriptions = False
    Style.LookAndFeel.Kind = lfFlat
    Style.StyleController = FrmPri.cxEditStyleController1
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 2
    Height = 60
    Width = 78
  end
  object cxLabel1: TcxLabel
    Left = 19
    Top = 56
    Caption = #205'cone'
  end
  object edNome: TcxTextEdit
    Left = 83
    Top = 134
    Cursor = crHandPoint
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfFlat
    Style.StyleController = FrmPri.cxEditStyleController1
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 4
    Width = 326
  end
  object cxLabel4: TcxLabel
    Left = 19
    Top = 135
    Caption = 'Nome'
  end
  object cbPermTroco: TcxCheckBox
    Left = 80
    Top = 180
    Cursor = crHandPoint
    AutoSize = False
    Caption = 'Permite voltar troco'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfFlat
    Style.StyleController = FrmPri.cxEditStyleController1
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 5
    Height = 24
    Width = 352
  end
  object cbPermCred: TcxCheckBox
    Left = 80
    Top = 210
    Cursor = crHandPoint
    Caption = 'Permite deixar troco como cr'#233'dito em conta'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfFlat
    Style.StyleController = FrmPri.cxEditStyleController1
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 10
    Width = 352
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
    ImageOptions.MakeDisabledImagesFaded = True
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = False
    Left = 400
    Top = 144
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
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
      UseOwnFont = True
      Visible = True
      WholeRow = True
    end
    object cmGravar: TdxBarLargeButton
      Caption = '&Ok'
      Category = 0
      Hint = 'Ok'
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
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
end
